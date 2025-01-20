@interface BSSqlitePreparedSimpleStatement
@end

@implementation BSSqlitePreparedSimpleStatement

void __79___BSSqlitePreparedSimpleStatement_executeWithBindings_resultRowHandler_error___block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 16));
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v3 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v3)
    {
      uint64_t v38 = *(void *)v40;
      uint64_t v35 = 136315650;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v40 != v38) {
            objc_enumerationMutation(obj);
          }
          v5 = *(void **)(*((void *)&v39 + 1) + 8 * v4);
          uint64_t v6 = *(void *)(a1 + 32);
          v7 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5, v35);
          id v8 = v5;
          id v9 = v7;
          if (v6)
          {
            int v10 = sqlite3_bind_parameter_index(*(sqlite3_stmt **)(v6 + 16), (const char *)[v8 UTF8String]);
            if (!v10) {
              goto LABEL_33;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v10 = sqlite3_bind_null(*(sqlite3_stmt **)(v6 + 16), v10);
              goto LABEL_33;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v11 = v9;
              v12 = *(sqlite3_stmt **)(v6 + 16);
              v13 = v11;
              int v14 = sqlite3_bind_text(v12, v10, (const char *)[v13 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
              goto LABEL_13;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = v9;
              v15 = (const char *)[v13 objCType];
              if (strlen(v15) == 1)
              {
                unsigned int v16 = *v15 - 66;
                if (v16 <= 0x31)
                {
                  if (((1 << v16) & 0x2848200028483) != 0)
                  {
                    int v14 = sqlite3_bind_int64(*(sqlite3_stmt **)(v6 + 16), v10, [v13 longLongValue]);
                    goto LABEL_13;
                  }
                  if (((1 << v16) & 0x1400000000) != 0)
                  {
                    v24 = *(sqlite3_stmt **)(v6 + 16);
                    [v13 doubleValue];
                    int v14 = sqlite3_bind_double(v24, v10, v25);
                    goto LABEL_13;
                  }
                }
                v23 = BSLogCommon();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
LABEL_39:
                  *(_DWORD *)buf = v35;
                  v44 = "-[_BSSqlitePreparedSimpleStatement _bindParameterIndex:numberValue:]";
                  __int16 v45 = 2082;
                  *(void *)v46 = v15;
                  *(_WORD *)&v46[8] = 2112;
                  *(void *)&v46[10] = v13;
                  _os_log_error_impl(&dword_18AAA8000, v23, OS_LOG_TYPE_ERROR, "%s: unexpected value type '%{public}s' for object %@", buf, 0x20u);
                }
              }
              else
              {
                v23 = BSLogCommon();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_39;
                }
              }

LABEL_31:
              int v10 = 20;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v13 = BSLogCommon();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  v26 = objc_opt_class();
                  *(_DWORD *)buf = v35;
                  v44 = "-[_BSSqlitePreparedSimpleStatement _bindKey:value:]";
                  __int16 v45 = 2112;
                  *(void *)v46 = v9;
                  *(_WORD *)&v46[8] = 2112;
                  *(void *)&v46[10] = v26;
                  id v27 = v26;
                  _os_log_error_impl(&dword_18AAA8000, v13, OS_LOG_TYPE_ERROR, "%s: unexpected object %@ of class %@", buf, 0x20u);
                }
                goto LABEL_31;
              }
              v13 = v9;
              uint64_t v17 = [v13 bytes];
              uint64_t v18 = [v13 length];
              BOOL v19 = v13 != 0;
              BOOL v20 = v17 == 0;
              if (v19 && v20) {
                uint64_t v21 = 3735936685;
              }
              else {
                uint64_t v21 = v17;
              }
              if (v19 && v20) {
                sqlite3_uint64 v22 = 0;
              }
              else {
                sqlite3_uint64 v22 = v18;
              }
              int v14 = sqlite3_bind_blob64(*(sqlite3_stmt **)(v6 + 16), v10, (const void *)v21, v22, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_13:
              int v10 = v14;
            }

            goto LABEL_33;
          }
          int v10 = 0;
LABEL_33:

          *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
          if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
            goto LABEL_42;
          }
          ++v4;
        }
        while (v3 != v4);
        uint64_t v28 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
        uint64_t v3 = v28;
      }
      while (v28);
    }
LABEL_42:

    if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      do
      {
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 16));
        int v29 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        if (v29 == 100)
        {
          if (*(void *)(a1 + 48))
          {
            v30 = +[BSSqliteResultRow resultRowWithStatement:]((uint64_t)BSSqliteResultRow, *(void *)(*(void *)(a1 + 32) + 16));
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            [v30 invalidate];

            int v29 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          }
          else
          {
            int v29 = 100;
          }
        }
      }
      while (v29 == 100);
      if (v29 != 101)
      {
        int v31 = sqlite3_extended_errcode(a2);
        v32 = BSLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = sqlite3_errstr(v31);
          v34 = sqlite3_sql(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 16));
          *(_DWORD *)buf = 136315906;
          v44 = "-[_BSSqlitePreparedSimpleStatement executeWithBindings:resultRowHandler:error:]_block_invoke";
          __int16 v45 = 1024;
          *(_DWORD *)v46 = v31;
          *(_WORD *)&v46[4] = 2080;
          *(void *)&v46[6] = v33;
          *(_WORD *)&v46[14] = 2080;
          *(void *)&v46[16] = v34;
          _os_log_error_impl(&dword_18AAA8000, v32, OS_LOG_TYPE_ERROR, "%s: received extended error %d (%s) executing statement '%s'", buf, 0x26u);
        }
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 16));
    }
  }
}

uint64_t __43___BSSqlitePreparedSimpleStatement_dealloc__block_invoke(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
}

@end