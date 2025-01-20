@interface OSLogIndex
@end

@implementation OSLogIndex

uint64_t __77___OSLogIndex_enumerateEntriesInRange_options_usingCatalogFilter_usingBlock___block_invoke(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v5 = *(void **)(a1 + 48);
  v6 = a2 + 1;
  uint64_t v7 = *a2;
  v8 = [*(id *)(a1 + 32) tracepoints];
  v9 = [v8 fileNames];
  v10 = [v9 objectAtIndexedSubscript:*(unsigned __int16 *)(a3 + 16)];
  [v5 _setLogEvent:a3 rangeUUIDIndex:v7 machTimebase:v6 traceFilename:v10];

  if (*(_DWORD *)a3 == 3
    && [*(id *)(a1 + 48) type] == 1024
    && [*(id *)(a1 + 48) _oversizeIdentifier])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v11 = objc_msgSend(*(id *)(a1 + 32), "oversizeChunks", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = 0;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        uint64_t v16 = 0;
        v17 = v14;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v11);
          }
          id v14 = *(id *)(*((void *)&v22 + 1) + 8 * v16);

          if (objc_msgSend(v14, "matches:procinfo:", objc_msgSend(*(id *)(a1 + 48), "_oversizeIdentifier"), *(void *)(a3 + 88)))
          {
            [v14 fillProxy:*(void *)(a1 + 48)];
            v18 = [*(id *)(a1 + 32) oversizeChunks];
            [v18 removeObject:v14];
            goto LABEL_18;
          }
          ++v16;
          v17 = v14;
        }
        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      v18 = v14;
    }
    else
    {
      v18 = 0;
    }
    id v14 = 0;
LABEL_18:
  }
  else
  {
    id v14 = 0;
  }
  v19 = (void *)MEMORY[0x1A622D720]();
  uint64_t v20 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 48) _assertBalanced];

  return v20;
}

uint64_t __59___OSLogIndex__enumerateEntriesInRange_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1A622D720]();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v39 = 0u;
  memset(v38, 0, sizeof(v38));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  int v7 = *a3;
  if (*a3 == 3)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 56) = *((void *)a3 + 5) + 16;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 72) = *((void *)a3 + 6);
    uint64_t v11 = *((void *)a3 + 12);
    _chunk_support_context_update((void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *((int **)a3 + 7));
    _chunk_support_convert_tracepoint(v11, (uint64_t)&v31, *(void *)(*(void *)(a1 + 48) + 8) + 32);
    id v12 = 0;
    if (v31 == 1024 && DWORD2(v41))
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "oversizeChunks", 0);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v44 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        id v12 = 0;
        uint64_t v16 = *(void *)v28;
        while (2)
        {
          uint64_t v17 = 0;
          v18 = v12;
          do
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            id v12 = *(id *)(*((void *)&v27 + 1) + 8 * v17);

            if ([v12 matches:DWORD2(v41) procinfo:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 88)])
            {
              [v12 fillMessage:(char *)&v34 + 8];
              v19 = [*(id *)(a1 + 32) oversizeChunks];
              [v19 removeObject:v12];
              goto LABEL_25;
            }
            ++v17;
            v18 = v12;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v44 count:16];
          if (v15) {
            continue;
          }
          break;
        }
        v19 = v12;
      }
      else
      {
        v19 = 0;
      }
      id v12 = 0;
LABEL_25:
    }
    char v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v31 == 2560)
    {
      free(*(void **)&v38[2]);
      *(void *)&v38[2] = 0;
    }
  }
  else
  {
    if (v7 == 2)
    {
      unint64_t v20 = *((void *)a3 + 1);
      char v21 = *((unsigned char *)a3 + 56);
      int v22 = *((unsigned __int8 *)a3 + 57);
      uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v31 = 0uLL;
      long long v32 = 0uLL;
      long long v33 = 0uLL;
      long long v34 = 0uLL;
      long long v35 = 0uLL;
      long long v36 = 0uLL;
      long long v37 = 0uLL;
      memset(v38, 0, sizeof(v38));
      long long v39 = 0uLL;
      long long v40 = 0uLL;
      long long v41 = 0uLL;
      long long v42 = 0uLL;
      long long v43 = 0uLL;
      *(_OWORD *)((char *)&v38[1] + 12) = *(_OWORD *)(a3 + 10);
      LODWORD(v31) = 1280;
      *(void *)&long long v39 = 1;
      BYTE8(v40) = v21;
      if (v22) {
        *(void *)&long long v39 = 3;
      }
      uint64_t v24 = *(void *)(v23 + 120);
      if (!v24) {
        goto LABEL_21;
      }
      unint64_t v25 = _timesync_continuous_to_wall_time(v24, (_OWORD *)((char *)&v38[1] + 12), v20, v38);
      unint64_t v9 = v25 / 0x3B9ACA00;
      unsigned int v10 = v25 % 0x3B9ACA00;
LABEL_20:
      *(void *)&long long v37 = v9;
      DWORD2(v37) = v10 / 0x3E8;
LABEL_21:
      char v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_29;
    }
    if (v7 == 1)
    {
      long long v42 = 0uLL;
      long long v43 = 0uLL;
      long long v40 = 0uLL;
      long long v41 = 0uLL;
      long long v39 = 0uLL;
      long long v37 = 0uLL;
      memset(v38, 0, sizeof(v38));
      long long v35 = 0uLL;
      long long v36 = 0uLL;
      long long v33 = 0uLL;
      long long v34 = 0uLL;
      long long v31 = 0uLL;
      long long v32 = 0uLL;
      *(_OWORD *)((char *)&v38[1] + 12) = *(_OWORD *)(a3 + 10);
      LODWORD(v31) = 1280;
      unint64_t v8 = *((void *)a3 + 9);
      *((void *)&v39 + 1) = *((void *)a3 + 8);
      *(void *)&long long v40 = v8;
      *(void *)&long long v35 = *((void *)&v39 + 1);
      *(void *)&v38[0] = *((void *)a3 + 10);
      unint64_t v9 = v8 / 0x3B9ACA00;
      unsigned int v10 = v8 % 0x3B9ACA00;
      goto LABEL_20;
    }
  }
LABEL_29:
  return v3 & 1;
}

uint64_t __36___OSLogIndex__readArchiveMetadata___block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end