@interface GEORequestResponseLogResponse
@end

@implementation GEORequestResponseLogResponse

void ___GEORequestResponseLogResponse_block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
        v9 = v7;
        *(_DWORD *)buf = 138412803;
        uint64_t v38 = v8;
        __int16 v39 = 1040;
        int v40 = [v6 length];
        __int16 v41 = 2097;
        uint64_t v42 = [v6 bytes];
        _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, "Response for task %@ : %{private,geo:requestresponseV3/pbcodable}.*P", buf, 0x1Cu);
      }
LABEL_20:

      goto LABEL_21;
    }
    if ((unint64_t)[v3 length] >> 12 > 0x22)
    {
      v26 = *(NSObject **)(a1 + 40);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      uint64_t v27 = *(void *)(a1 + 48);
      v6 = v26;
      *(_DWORD *)buf = 138412802;
      uint64_t v38 = v27;
      __int16 v39 = 1024;
      int v40 = [v3 length];
      __int16 v41 = 1024;
      LODWORD(v42) = 143360;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "Response for task %@ of %u bytes was larger than max size %u, not logging", buf, 0x18u);
      goto LABEL_20;
    }
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v31 = v3;
    v14 = protobufDataParts(v3, v13);

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            uint64_t v22 = *(void *)(a1 + 48);
            v23 = v20;
            int v24 = [v21 length];
            uint64_t v25 = [v21 bytes];
            *(_DWORD *)buf = 138412803;
            uint64_t v38 = v22;
            __int16 v39 = 1040;
            int v40 = v24;
            __int16 v41 = 2097;
            uint64_t v42 = v25;
            _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_DEBUG, "Response for task %@ : %{private,geo:requestresponseV3/pbcodable}.*P", buf, 0x1Cu);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    v3 = v31;
  }
  else
  {
    v10 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = v11;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "Response for task %@ : nil", buf, 0xCu);
    }
  }
LABEL_21:
  v28 = rrPersister(*(void **)(a1 + 48));
  if (v28)
  {
    uint64_t v29 = *(void *)(a1 + 48);
    v30 = [*(id *)(a1 + 32) data];
    [v28 persistResponseTask:v29 response:v30];
  }
}

@end