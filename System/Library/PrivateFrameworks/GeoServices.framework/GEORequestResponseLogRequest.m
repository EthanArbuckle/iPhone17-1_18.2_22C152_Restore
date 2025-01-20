@interface GEORequestResponseLogRequest
@end

@implementation GEORequestResponseLogRequest

void ___GEORequestResponseLogRequest_block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) data];
  v3 = v2;
  if (v2)
  {
    if ((unint64_t)[v2 length] <= 0x7000)
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      v6 = protobufDataWithHeader(v3, v5);

      v7 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v9 = *(void *)(a1 + 56);
        v10 = v7;
        *(_DWORD *)buf = 138413059;
        uint64_t v42 = v8;
        __int16 v43 = 2113;
        *(void *)v44 = v9;
        *(_WORD *)&v44[8] = 1040;
        int v45 = [v6 length];
        __int16 v46 = 2097;
        uint64_t v47 = [v6 bytes];
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Request with task %@, URL %{private}@ : %{private,geo:requestresponseV3/pbcodable}.*P", buf, 0x26u);
      }
LABEL_20:

      goto LABEL_21;
    }
    if ((unint64_t)[v3 length] >> 12 > 0x22)
    {
      v29 = *(NSObject **)(a1 + 40);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      uint64_t v30 = *(void *)(a1 + 48);
      v6 = v29;
      *(_DWORD *)buf = 138412802;
      uint64_t v42 = v30;
      __int16 v43 = 1024;
      *(_DWORD *)v44 = [v3 length];
      *(_WORD *)&v44[4] = 1024;
      *(_DWORD *)&v44[6] = 143360;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Request with task %@ of %u bytes was larger than max size %u, not logging", buf, 0x18u);
      goto LABEL_20;
    }
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v35 = v3;
    v16 = protobufDataParts(v3, v15);

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            uint64_t v24 = *(void *)(a1 + 48);
            uint64_t v25 = *(void *)(a1 + 56);
            v26 = v22;
            int v27 = [v23 length];
            uint64_t v28 = [v23 bytes];
            *(_DWORD *)buf = 138413059;
            uint64_t v42 = v24;
            __int16 v43 = 2113;
            *(void *)v44 = v25;
            *(_WORD *)&v44[8] = 1040;
            int v45 = v27;
            __int16 v46 = 2097;
            uint64_t v47 = v28;
            _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_DEBUG, "Request with task %@, URL %{private}@ : %{private,geo:requestresponseV3/pbcodable}.*P", buf, 0x26u);
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v19);
    }

    v3 = v35;
  }
  else
  {
    v11 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412547;
      uint64_t v42 = v12;
      __int16 v43 = 2113;
      *(void *)v44 = v13;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Request with task %@, URL %{private}@ : nil", buf, 0x16u);
    }
  }
LABEL_21:
  v31 = rrPersister(*(void **)(a1 + 48));
  if (v31)
  {
    uint64_t v32 = *(void *)(a1 + 48);
    uint64_t v33 = *(void *)(a1 + 56);
    v34 = [*(id *)(a1 + 32) data];
    [v31 persistRequestTask:v32 url:v33 request:v34];
  }
}

@end