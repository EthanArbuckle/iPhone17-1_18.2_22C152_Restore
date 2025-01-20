@interface OSLogCopyTraceFile
@end

@implementation OSLogCopyTraceFile

uint64_t ___OSLogCopyTraceFile_impl_block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*a2 != 24587) {
    return 1;
  }
  uint64_t v4 = _catalog_create_with_chunk(a2, 0);
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  v6 = (void *)(v4 + 64);
  do
  {
    v6 = (void *)*v6;
    if (!v6)
    {
      _catalog_destroy(v4);
      return 1;
    }
    unint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  while (v6[2] < v7 && v6[3] < v7);
  unint64_t v8 = *(void *)(a1 + 64) - (void)a2 + *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8) + 16;
  uint64_t v30 = *(void *)(a1 + 72);
  uint64_t v31 = v10;
  v32 = a2;
  unint64_t v33 = v8;
  int v11 = _OSLogUUIDMapAddFromFile((uint64_t)a2, v8, v9, *(void **)(a1 + 32));
  if (v11)
  {
    int v12 = v11;
    if (fcntl(*(_DWORD *)(a1 + 96), 50, v29) == -1)
    {
      __error();
      _os_assumes_log();
    }
    v13 = *(void **)(a1 + 32);
    strerror(v12);
    _OSLogWarningMessage(v13, "failed to index uuids: '%s' to '%s': %s (%d)", v14, v15, v16, v17, v18, v19, (char)v29);
  }
  if (_os_trace_writev() == -1)
  {
    int v20 = *__error();
    if (fcntl(*(_DWORD *)(a1 + 100), 50, v29) == -1)
    {
      __error();
      _os_assumes_log();
    }
    v21 = *(void **)(a1 + 32);
    strerror(v20);
    _OSLogWarningMessage(v21, "failed to write file data to temp file: '%s': %s (%d)", v22, v23, v24, v25, v26, v27, (char)v29);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8 + *(void *)(*(void *)(a1 + 72) + 8) + 16;
  _catalog_destroy(v5);
  return 0;
}

uint64_t ___OSLogCopyTraceFile_implWithRepack_block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"nil";
  }
  if (([(__CFString *)v4 containsString:@"nonsparse"] & 1) != 0
    || ([(__CFString *)v4 containsString:@"timesync"] & 1) != 0)
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = (id)[**(id **)(*(void *)(a1 + 40) + 192) composedMessage];
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) evaluateWithObject:**(void **)(*(void *)(a1 + 40) + 192)];
  }

  return v5;
}

uint64_t ___OSLogCopyTraceFile_implWithRepack_block_invoke_2(uint64_t a1, char *a2)
{
  uint64_t v5 = *(char **)(a1 + 72);
  uint64_t v4 = *(void **)(a1 + 80);
  id v6 = (char *)(a2 - v5);
  v4[21] = a2 - v5;
  if (a2 == v5)
  {
    *uint64_t v4 = a2 + 144;
    _repack_compact_add_iov(*(void *)(a1 + 80), (uint64_t)a2);
    return 1;
  }
  if (*(_DWORD *)a2 == 24589)
  {
    if (!v4[3]) {
      return 1;
    }
    uint64_t v10 = (void *)v4[5];
    if (!v10) {
      return 1;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      int v11 = (void *)MEMORY[0x1A622D720]();
      int v12 = objc_msgSend(*(id *)(a1 + 40), "stringByAppendingFormat:", @"-%llu", v6);
      uint64_t v13 = *(void *)(a1 + 80);
      uint64_t v14 = *(void **)(v13 + 40);
      unint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
      if (v14[2] < v15 && v14[3] < v15)
      {
        *(void *)(v13 + 40) = *v14;

        return 1;
      }
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = ___OSLogCopyTraceFile_implWithRepack_block_invoke_3;
      v39[3] = &unk_1E5A433B0;
      uint64_t v42 = v13;
      id v26 = v12;
      uint64_t v27 = *(void *)(a1 + 56);
      id v40 = v26;
      uint64_t v41 = v27;
      _tracev3_chunk_decompress_and_enumerate_chunks_helper((uint64_t)a2, (uint64_t)v14, v39);
      v28 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v28)
      {
        v29 = *(void **)(a1 + 48);
        uint64_t v30 = [v28 userInfo];
        id v31 = [v30 description];
        char v32 = [v31 UTF8String];
        _OSLogWarningMessage(v29, "failed to compact chunkset: %s", v33, v34, v35, v36, v37, v38, v32);

        return 0;
      }

      uint64_t v4 = *(void **)(a1 + 80);
      uint64_t v10 = (void *)v4[5];
    }
    v4[5] = *v10;
    return 1;
  }
  if (*(_DWORD *)a2 == 24587)
  {
    if (!v4[3])
    {
LABEL_7:
      _repack_ttl_compact_open_catalog((uint64_t)v4, a2);
      _OSLogUUIDMapAddFromCatalog(*(void *)(*(void *)(a1 + 80) + 24), *(void *)(*(void *)(*(void *)(a1 + 80) + 192) + 16));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) isKeptCatalog:*(void *)(*(void *)(a1 + 80) + 24)];
      return 1;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v43 = *(id *)(v7 + 40);
    int v8 = _repack_ttl_compact_close_catalog((uint64_t)v4, &v43);
    objc_storeStrong((id *)(v7 + 40), v43);
    if (v8)
    {
      uint64_t v4 = *(void **)(a1 + 80);
      goto LABEL_7;
    }
    uint64_t v16 = *(void **)(a1 + 48);
    uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) userInfo];
    id v18 = [v17 description];
    char v19 = [v18 UTF8String];
    _OSLogWarningMessage(v16, "failed to close catalog: %s", v20, v21, v22, v23, v24, v25, v19);

    return 0;
  }
  return 1;
}

uint64_t ___OSLogCopyTraceFile_implWithRepack_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v1 + 40);
  uint64_t v2 = _compact_chunkset();
  objc_storeStrong((id *)(v1 + 40), obj);
  return v2;
}

@end