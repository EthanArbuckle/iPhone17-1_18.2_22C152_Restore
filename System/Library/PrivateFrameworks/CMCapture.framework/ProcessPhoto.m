@interface ProcessPhoto
@end

@implementation ProcessPhoto

void __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
  v2 = *(void **)(*(void *)(a1 + 48) + 48);
  uint64_t v49 = v1;
  if (v2 && (qos_class_t v3 = [v2 qosClass], v3 < qos_class_self()))
  {
    if (dword_1EB4C4F10)
    {
      unsigned int v62 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *(_DWORD *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = -16823;
    v37 = *(const void **)(v1 + 56);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_140;
    v60[3] = &unk_1E5C24A38;
    v60[4] = *(void *)(v1 + 40);
    v60[5] = v37;
    captureDeferredPhotoProcessor_performBlockOnWorkerQueueAsync(v37, (uint64_t)v60);
  }
  else
  {
    v5 = &unk_1EB4C4000;
    if (dword_1EB4C4F10)
    {
      unsigned int v62 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [+[BWDeferredTransactionBroker sharedInstance] openTransaction:2 pid:*(unsigned int *)(*(void *)(v1 + 48) + 32)];
    uint64_t v7 = *(void *)(v1 + 48);
    v8 = *(NSObject **)(v7 + 64);
    if (v8)
    {
      if (dword_1EB4C4F10)
      {
        unsigned int v62 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v8 = *(NSObject **)(*(void *)(v1 + 48) + 64);
      }
      dispatch_source_cancel(v8);

      uint64_t v7 = *(void *)(v1 + 48);
      *(void *)(v7 + 64) = 0;
    }
    if (objc_msgSend(*(id *)(v7 + 48), "isEqual:", *(void *)(v1 + 32), v44, v46))
    {
      *(_DWORD *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = -16829;
    }
    else
    {
      v10 = *(void **)(*(void *)(v1 + 48) + 40);
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_142;
      v58[3] = &unk_1E5C2B210;
      long long v59 = *(_OWORD *)(v1 + 64);
      v58[4] = &v63;
      [v10 enumerateObjectsUsingBlock:v58];
      if (v64[3] != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(*(id *)(*(void *)(v1 + 48) + 40), "removeObjectAtIndex:");
      }
      if (FigCFEqual())
      {
        for (unint64_t i = 0; i < [*(id *)(*(void *)(v1 + 48) + 40) count]; ++i)
        {
          unsigned int v12 = [*(id *)(v1 + 32) qosClass];
          if (v12 >= objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v1 + 48) + 40), "objectAtIndexedSubscript:", i), "qosClass"))break; {
        }
          }
      }
      else
      {
        uint64_t v13 = [*(id *)(*(void *)(v1 + 48) + 40) count] + 1;
        do
        {
          unint64_t i = v13 - 1;
          if (v13 == 1) {
            break;
          }
          unsigned int v14 = [*(id *)(v1 + 32) qosClass];
          unsigned int v15 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v1 + 48) + 40), "objectAtIndexedSubscript:", v13 - 2), "qosClass");
          --v13;
        }
        while (v14 > v15);
      }
      [*(id *)(*(void *)(v1 + 48) + 40) insertObject:*(void *)(v1 + 32) atIndex:i];
      unint64_t v47 = i;
      if (dword_1EB4C4F10)
      {
        unsigned int v62 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v17 = v62;
        if (os_log_type_enabled(v16, type)) {
          unsigned int v18 = v17;
        }
        else {
          unsigned int v18 = v17 & 0xFFFFFFFE;
        }
        if (v18)
        {
          uint64_t v19 = *(void *)(v49 + 48);
          uint64_t v20 = *(void *)(v49 + 56);
          int v21 = *(_DWORD *)(v19 + 32);
          uint64_t v22 = *(void *)(v19 + 24);
          uint64_t v23 = [*(id *)(v19 + 40) count];
          if (v64[3] == 0x7FFFFFFFFFFFFFFFLL) {
            v24 = &stru_1EFA403E0;
          }
          else {
            v24 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"removed from position: %lu and re-", v64[3]);
          }
          int v68 = 136316931;
          v69 = "captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_2";
          __int16 v70 = 2048;
          uint64_t v71 = v20;
          __int16 v72 = 1024;
          int v73 = v21;
          __int16 v74 = 2113;
          *(void *)v75 = v22;
          *(_WORD *)&v75[8] = 1024;
          *(_DWORD *)&v75[10] = v21;
          __int16 v76 = 2048;
          uint64_t v77 = v23;
          __int16 v78 = 2114;
          v79 = v24;
          __int16 v80 = 2048;
          unint64_t v81 = i;
          LODWORD(v45) = 74;
          v43 = &v68;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v1 = v49;
        v5 = &unk_1EB4C4000;
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obj = *(id *)(*(void *)(v1 + 48) + 40);
      uint64_t v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v67, 16, v43, v45);
      if (v25)
      {
        int v26 = 0;
        uint64_t v53 = *(void *)v55;
        do
        {
          uint64_t v27 = 0;
          int v48 = v26;
          unint64_t v50 = v47 - v26;
          int v51 = v26;
          do
          {
            if (*(void *)v55 != v53) {
              objc_enumerationMutation(obj);
            }
            if (v5[964])
            {
              v28 = *(void **)(*((void *)&v54 + 1) + 8 * v27);
              unsigned int v62 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v30 = v62;
              if (os_log_type_enabled(v29, type)) {
                unsigned int v31 = v30;
              }
              else {
                unsigned int v31 = v30 & 0xFFFFFFFE;
              }
              if (v31)
              {
                uint64_t v32 = *(void *)(v1 + 56);
                int v33 = *(_DWORD *)(*(void *)(v1 + 48) + 32);
                uint64_t v34 = [v28 captureRequestIdentifier];
                uint64_t v35 = [v28 photoIdentifier];
                int v68 = 136316674;
                v36 = &stru_1EFA403E0;
                if (v50 == v27) {
                  v36 = @" <-- Just inserted";
                }
                v69 = "captureDeferredPhotoProcessor_ProcessPhoto_block_invoke";
                __int16 v70 = 2048;
                uint64_t v71 = v32;
                __int16 v72 = 1024;
                int v73 = v33;
                __int16 v74 = 1024;
                *(_DWORD *)v75 = v51 + v27;
                *(_WORD *)&v75[4] = 2114;
                *(void *)&v75[6] = v34;
                __int16 v76 = 2114;
                uint64_t v77 = v35;
                __int16 v78 = 2112;
                v79 = v36;
                LODWORD(v45) = 64;
                v43 = &v68;
                _os_log_send_and_compose_impl();
                uint64_t v1 = v49;
                v5 = (_DWORD *)&unk_1EB4C4000;
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            ++v27;
          }
          while (v25 != v27);
          uint64_t v25 = [obj countByEnumeratingWithState:&v54 objects:v67 count:16];
          int v26 = v48 + v27;
        }
        while (v25);
      }
      captureDeferredPhotoProcessor_workloop(*(const void **)(v1 + 56));
    }
  }
  if (*(_DWORD *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) == -16829)
  {
    if (dword_1EB4C4F10)
    {
      unsigned int v62 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v39 = v62;
      if (os_log_type_enabled(v38, type)) {
        unsigned int v40 = v39;
      }
      else {
        unsigned int v40 = v39 & 0xFFFFFFFE;
      }
      if (v40)
      {
        uint64_t v41 = *(void *)(v1 + 56);
        int v42 = *(_DWORD *)(*(void *)(v1 + 48) + 32);
        int v68 = 136315906;
        v69 = "captureDeferredPhotoProcessor_ProcessPhoto_block_invoke";
        __int16 v70 = 2048;
        uint64_t v71 = v41;
        __int16 v72 = 1024;
        int v73 = v42;
        __int16 v74 = 1024;
        *(_DWORD *)v75 = v42;
        LODWORD(v45) = 34;
        v43 = &v68;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    [+[BWDeferredTransactionBroker sharedInstance] closeTransaction:2];
  }
  _Block_object_dispose(&v63, 8);
}

void __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_140(uint64_t a1)
{
}

uint64_t __captureDeferredPhotoProcessor_ProcessPhoto_block_invoke_142(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a2, "captureRequestIdentifier"), "isEqualToString:", a1[5]);
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "photoIdentifier"), "isEqualToString:", a1[6]);
    if (result)
    {
      *(void *)(*(void *)(a1[4] + 8) + 24) = a3;
      *a4 = 1;
    }
  }
  return result;
}

@end