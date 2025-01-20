@interface ABPKMLNetworkV2
- (ABPKMLNetworkV2)initWithNetworkPath:(id)a3 inputNames:(id)a4 outputNames:(id)a5 useSurface:(BOOL)a6;
- (ABPKMLNetworkV2)initWithNetworkPath:(id)a3 networkConfig:(id)a4 inputNames:(id)a5 outputNames:(id)a6 useSurface:(BOOL)a7;
- (BOOL)changeNetWorkConfig:(id)a3;
- (BOOL)execute;
- (NSMutableDictionary)inputBuffers;
- (NSMutableDictionary)outputBuffers;
- (void)dealloc;
@end

@implementation ABPKMLNetworkV2

- (ABPKMLNetworkV2)initWithNetworkPath:(id)a3 inputNames:(id)a4 outputNames:(id)a5 useSurface:(BOOL)a6
{
  return [(ABPKMLNetworkV2 *)self initWithNetworkPath:a3 networkConfig:@"main" inputNames:a4 outputNames:a5 useSurface:a6];
}

- (ABPKMLNetworkV2)initWithNetworkPath:(id)a3 networkConfig:(id)a4 inputNames:(id)a5 outputNames:(id)a6 useSurface:(BOOL)a7
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v56.receiver = self;
  v56.super_class = (Class)ABPKMLNetworkV2;
  v16 = [(ABPKMLNetworkV2 *)&v56 init];
  if (v16)
  {
    v47 = v15;
    v17 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v60 = v13;
      _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_DEBUG, " network  config %@. ", buf, 0xCu);
    }

    id v18 = v12;
    [v18 UTF8String];
    id v19 = v18;
    [v19 UTF8String];
    [v13 UTF8String];
    if (e5rt_execution_stream_operation_create_precompiled_compute_operation()) {
      goto LABEL_31;
    }
    uint64_t v20 = [v19 copy];
    networkPath = v16->_networkPath;
    v16->_networkPath = (NSString *)v20;

    v16->_useSurface = a7;
    id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v46 = v14;
    id v23 = v14;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v53 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v29 = [[ABPKMLNetworkBufferV2 alloc] initWithName:v28 operation:v16->_operation bindMode:0 useSurface:v16->_useSurface];
          if (!v29)
          {
            v41 = __ABPKLogSharedInstance();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v60 = v28;
              _os_log_impl(&dword_21B7C6000, v41, OS_LOG_TYPE_ERROR, " Could not create network buffer %@. ", buf, 0xCu);
            }

            v40 = 0;
            id v14 = v46;
            id v15 = v47;
            goto LABEL_30;
          }
          v30 = v29;
          [v22 setObject:v29 forKeyedSubscript:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v52 objects:v58 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    id v45 = v12;

    objc_storeStrong((id *)&v16->_inputBuffers, v22);
    id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v32 = v47;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (!v33) {
      goto LABEL_21;
    }
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v49;
LABEL_15:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v49 != v35) {
        objc_enumerationMutation(v32);
      }
      v37 = *(void **)(*((void *)&v48 + 1) + 8 * v36);
      v38 = [[ABPKMLNetworkBufferV2 alloc] initWithName:v37 operation:v16->_operation bindMode:1 useSurface:0];
      if (!v38) {
        break;
      }
      v39 = v38;
      [v31 setObject:v38 forKeyedSubscript:v37];

      if (v34 == ++v36)
      {
        uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (!v34)
        {
LABEL_21:

          objc_storeStrong((id *)&v16->_outputBuffers, v31);
          if (!e5rt_execution_stream_create())
          {

            id v12 = v45;
            id v14 = v46;
            id v15 = v47;
            goto LABEL_23;
          }
LABEL_31:
          last_error_message = (const char *)e5rt_get_last_error_message();
          printf("E5RT operation failed with message = %s", last_error_message);
          exit(1);
        }
        goto LABEL_15;
      }
    }
    v42 = __ABPKLogSharedInstance();
    id v15 = v47;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v60 = v37;
      _os_log_impl(&dword_21B7C6000, v42, OS_LOG_TYPE_ERROR, " Could not create network buffer %@. ", buf, 0xCu);
    }

    v40 = 0;
    id v12 = v45;
    id v14 = v46;
  }
  else
  {
LABEL_23:
    v40 = v16;
  }
LABEL_30:

  return v40;
}

- (BOOL)execute
{
  e5rt_execution_stream_encode_operation();
  if (e5rt_execution_stream_execute_sync())
  {
    last_error_message = (const char *)e5rt_get_last_error_message();
    printf("E5RT operation failed with message = %s", last_error_message);
    exit(1);
  }
  e5rt_execution_stream_reset();
  return 1;
}

- (BOOL)changeNetWorkConfig:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (e5rt_execution_stream_operation_release()) {
    goto LABEL_10;
  }
  [(NSString *)self->_networkPath UTF8String];
  [(NSString *)self->_networkPath UTF8String];
  id v5 = v4;
  [v5 UTF8String];
  if (e5rt_execution_stream_operation_create_precompiled_compute_operation()
    || e5rt_execution_stream_operation_get_num_inputs())
  {
    goto LABEL_10;
  }
  v6 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_DEBUG, " Expected input names: ", buf, 2u);
  }

  v7 = malloc_type_malloc(0, 0x10040436913F5uLL);
  if (e5rt_execution_stream_operation_get_input_names()
    || (free(v7), e5rt_execution_stream_operation_get_num_outputs())
    || (v8 = malloc_type_malloc(0, 0x10040436913F5uLL),
        e5rt_execution_stream_operation_get_output_names()))
  {
LABEL_10:
    last_error_message = (const char *)e5rt_get_last_error_message();
    printf("E5RT operation failed with message = %s", last_error_message);
    exit(1);
  }
  free(v8);

  return 1;
}

- (void)dealloc
{
  e5rt_execution_stream_release();
  e5rt_execution_stream_operation_release();
  v3.receiver = self;
  v3.super_class = (Class)ABPKMLNetworkV2;
  [(ABPKMLNetworkV2 *)&v3 dealloc];
}

- (NSMutableDictionary)inputBuffers
{
  return self->_inputBuffers;
}

- (NSMutableDictionary)outputBuffers
{
  return self->_outputBuffers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBuffers, 0);
  objc_storeStrong((id *)&self->_inputBuffers, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);
}

@end