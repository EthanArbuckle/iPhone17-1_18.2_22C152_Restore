@interface OSLogUUIDMapCopySet
@end

@implementation OSLogUUIDMapCopySet

void ___OSLogUUIDMapCopySet_block_invoke(uint64_t a1, const unsigned __int8 *a2, int a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    int v5 = *(_DWORD *)(a1 + 64);
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    v7 = (uint64_t **)(v6 + 24);
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    if (a3 == 3)
    {
      id v10 = v8;
      id v11 = v9;
      if (uuid_is_null(a2) || !_OSLogUUIDMapCopyUUID(v5, a2, 3, v7, v10, v11))
      {
        int v12 = 0;
      }
      else
      {
        int v12 = _OSLogUUIDMapCopyUUID(v5, a2, 1, v7, v10, v11);
        if (!v12)
        {
          size_t v32 = 0;
          v14 = (char *)uuidpath_map_header_fd(v5, (uint64_t)a2, &v32);
          if (v14)
          {
            v15 = (unsigned int *)v14;
            if ((v14[8] & 2) != 0)
            {
              if (*((_DWORD *)v14 + 3))
              {
                unint64_t v29 = 0;
                int v12 = 0;
                v30 = (const unsigned __int8 *)(v14 + 24);
                do
                {
                  int v31 = _OSLogUUIDMapCopyUUID(v5, v30, 1, v7, v10, v11);
                  if (!v12) {
                    int v12 = v31;
                  }
                  ++v29;
                  v30 += 32;
                }
                while (v29 < v15[3]);
              }
              else
              {
                int v12 = 0;
              }
              if (munmap(v15, v32) == -1)
              {
                __error();
                _os_assumes_log();
              }
            }
            else
            {
              memset(out, 0, 37);
              uuid_unparse_lower(a2, out);
              _OSLogWarningMessage(v11, "dsc header not shared cache: %s", v16, v17, v18, v19, v20, v21, (char)out);
              if (munmap(v15, v32) == -1)
              {
                __error();
                _os_assumes_log();
              }
              int v12 = 22;
            }
          }
          else
          {
            memset(out, 0, 37);
            uuid_unparse_lower(a2, out);
            v22 = __error();
            strerror(*v22);
            __error();
            _OSLogWarningMessage(v11, "failed to map dsc: %s: %s (%d)", v23, v24, v25, v26, v27, v28, (char)out);
            int v12 = *__error();
          }
        }
      }
    }
    else
    {
      int v12 = _OSLogUUIDMapCopyUUID(*(_DWORD *)(a1 + 64), a2, a3, (uint64_t **)(v6 + 24), v8, v9);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(_DWORD *)(v13 + 24) == 2) {
      *(_DWORD *)(v13 + 24) = 0;
    }
  }
}

@end