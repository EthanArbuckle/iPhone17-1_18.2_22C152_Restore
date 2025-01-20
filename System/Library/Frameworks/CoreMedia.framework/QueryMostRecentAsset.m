@interface QueryMostRecentAsset
@end

@implementation QueryMostRecentAsset

void __figMobileAsset_QueryMostRecentAsset_block_invoke(uint64_t a1, uint64_t a2)
{
  v44[16] = *MEMORY[0x1E4F143B8];
  if (!a2 || a2 == 2 && *(unsigned char *)(a1 + 80))
  {
    uint64_t v3 = [*(id *)(a1 + 32) results];
    if (v3)
    {
      v4 = (void *)v3;
      int v5 = *(_DWORD *)(a1 + 72);
      int v6 = *(unsigned __int8 *)(a1 + 80);
      v8 = *(const void **)(a1 + 40);
      v7 = *(const void **)(a1 + 48);
      v10 = *(const void **)(a1 + 56);
      CFArrayRef v9 = *(const __CFArray **)(a1 + 64);
      unint64_t v11 = 0x1E4F28000;
      if (v5 >= 1)
      {
        if (dword_1E9272E18)
        {
          v12 = *(const void **)(a1 + 40);
          v34 = *(const void **)(a1 + 48);
          int v37 = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272E10, 1, &v37, type);
          int v14 = v37;
          if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type[0])) {
            unsigned int v16 = v14;
          }
          else {
            unsigned int v16 = v14 & 0xFFFFFFFE;
          }
          if (v16)
          {
            *(_DWORD *)v41 = 136315650;
            *(void *)&v41[4] = "figMobileAsset_HandleSuccessfulQueryResult";
            *(_WORD *)&v41[12] = 2114;
            *(void *)&v41[14] = v12;
            *(_WORD *)&v41[22] = 1024;
            LODWORD(v42) = v5;
            LODWORD(v33) = 28;
            v32 = (int *)v41;
            v17 = (void *)_os_log_send_and_compose_impl();
            LOBYTE(v14) = v37;
          }
          else
          {
            v17 = 0;
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272E10, 1u, 1, v17, v17 != v44, v14, 0, v15);
          v7 = v34;
          v8 = v12;
          unint64_t v11 = 0x1E4F28000uLL;
        }
        v18 = *(void **)(v11 + 3936);
        *(void *)v41 = MEMORY[0x1E4F143A8];
        *(void *)&v41[8] = 3221225472;
        *(void *)&v41[16] = __figMobileAsset_HandleSuccessfulQueryResult_block_invoke;
        v42 = &__block_descriptor_36_e34_B24__0__MAAsset_8__NSDictionary_16l;
        int v43 = v5;
        v4 = objc_msgSend(v4, "filteredArrayUsingPredicate:", objc_msgSend(v18, "predicateWithBlock:", v41, v32, v33));
      }
      if (v6) {
        v4 = objc_msgSend(v4, "filteredArrayUsingPredicate:", objc_msgSend(*(id *)(v11 + 3936), "predicateWithBlock:", &__block_literal_global_30));
      }
      if (v4)
      {
        v19 = (void *)[v4 sortedArrayUsingComparator:&__block_literal_global_34];
        if (v19)
        {
          v20 = (void *)[v19 lastObject];
          if (v20)
          {
            v21 = v20;
            if ([v20 state] == 2 || objc_msgSend(v21, "state") == 5)
            {
              figMobileAsset_UpdateLastUpdatedTime(v8);
              figMobileAsset_ExtractPlistFromAssetForCallback(v21, (uint64_t)v10, v9);
            }
            else if (!v6)
            {
              if (v8) {
                CFRetain(v8);
              }
              if (v7) {
                CFRetain(v7);
              }
              if (v10) {
                CFRetain(v10);
              }
              if (v9) {
                CFRetain(v9);
              }
              if (dword_1E9272E18)
              {
                *(_DWORD *)type = 0;
                os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
                v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1E9272E10, 1, (int *)type, &v35);
                unsigned int v27 = *(_DWORD *)type;
                if (os_log_type_enabled(v26, v35)) {
                  unsigned int v29 = v27;
                }
                else {
                  unsigned int v29 = v27 & 0xFFFFFFFE;
                }
                if (v29)
                {
                  uint64_t v30 = [v21 assetId];
                  int v37 = 136315395;
                  v38 = "figMobileAsset_HandleSuccessfulQueryResult";
                  __int16 v39 = 2113;
                  uint64_t v40 = v30;
                  LODWORD(v33) = 22;
                  v32 = &v37;
                  v31 = (void *)_os_log_send_and_compose_impl();
                  LOBYTE(v27) = type[0];
                }
                else
                {
                  v31 = 0;
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1E9272E10, 1u, 1, v31, v31 != v44, v27, 0, v28);
              }
              v44[0] = MEMORY[0x1E4F143A8];
              v44[1] = 3221225472;
              v44[2] = __figMobileAsset_HandleSuccessfulQueryResult_block_invoke_31;
              v44[3] = &unk_1E5676EC0;
              v44[4] = v21;
              v44[5] = v8;
              v44[6] = v10;
              v44[7] = v9;
              v44[8] = v7;
              objc_msgSend(v21, "startDownload:", v44, v32, v33);
            }
          }
        }
      }
    }
  }
  else if (a2 == 2 && !*(unsigned char *)(a1 + 80))
  {
    figMobileAsset_DownloadCatalogAndRequery(*(CFTypeRef *)(a1 + 40), *(_DWORD *)(a1 + 76));
  }

  v22 = *(const void **)(a1 + 40);
  if (v22) {
    CFRelease(v22);
  }
  v23 = *(const void **)(a1 + 48);
  if (v23) {
    CFRelease(v23);
  }
  v24 = *(const void **)(a1 + 56);
  if (v24) {
    CFRelease(v24);
  }
  v25 = *(const void **)(a1 + 64);
  if (v25) {
    CFRelease(v25);
  }
}

@end