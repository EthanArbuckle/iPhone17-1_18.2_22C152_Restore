@interface VCPCNNModelEspressoV2
- (VCPCNNModelEspressoV2)initWithParameters:(id)a3 outputNames:(id)a4 inputNames:(id)a5 functionName:(id)a6;
- (e5rt_execution_stream_operation)createPrecompiledOp:(id)a3 isPrecompiled:(BOOL)a4 functionName:(id)a5;
- (id).cxx_construct;
- (id)inputsSize;
- (id)inputsType;
- (id)outputsSize;
- (id)outputsType;
- (int)espressoForward:(void *)a3;
- (int)espressoForwardInputs:(vector<void *);
- (int)getOutputs;
- (vector<VCPEspressoV2Data)outputs;
- (void)dealloc;
@end

@implementation VCPCNNModelEspressoV2

- (VCPCNNModelEspressoV2)initWithParameters:(id)a3 outputNames:(id)a4 inputNames:(id)a5 functionName:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v43 = a4;
  id v11 = a5;
  id v12 = a6;
  v53.receiver = self;
  v53.super_class = (Class)VCPCNNModelEspressoV2;
  v13 = [(VCPCNNModelEspressoV2 *)&v53 init];
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    id v40 = v12;
    objc_storeStrong((id *)&v13->_netFileUrl, a3);
    objc_storeStrong((id *)&v14->_inputNames, a5);
    objc_storeStrong((id *)&v14->_outputNames, a4);
    objc_storeStrong((id *)&v14->_functionName, a6);
    uint64_t v52 = 0;
    v16 = (void *)MEMORY[0x1E4F1CB10];
    v17 = [(NSURL *)v14->_netFileUrl path];
    v18 = [v17 stringByAppendingPathExtension:@"bundle"];
    v41 = [v16 URLWithString:v18];

    uint64_t v19 = [(VCPCNNModelEspressoV2 *)v14 createPrecompiledOp:v41 isPrecompiled:1 functionName:v14->_functionName];
    uint64_t v52 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    inputIOArray = v14->_inputIOArray;
    v14->_inputIOArray = (NSMutableArray *)v20;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v22 = v11;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v49;
LABEL_4:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v48 + 1) + 8 * v25);
        v27 = objc_alloc_init(VCPEspressoV2IOPort);
        if ([(VCPEspressoV2IOPort *)v27 retainAndBindToPort:v19 name:v26 isInput:1])
        {
          goto LABEL_22;
        }
        [(NSMutableArray *)v14->_inputIOArray addObject:v27];

        if (v23 == ++v25)
        {
          uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (v23) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    outputIOArray = v14->_outputIOArray;
    v14->_outputIOArray = (NSMutableArray *)v28;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v22 = v43;
    uint64_t v30 = [v22 countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v45;
LABEL_12:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v22);
        }
        uint64_t v33 = *(void *)(*((void *)&v44 + 1) + 8 * v32);
        v27 = objc_alloc_init(VCPEspressoV2IOPort);
        if ([(VCPEspressoV2IOPort *)v27 retainAndBindToPort:v19 name:v33 isInput:0])
        {
          break;
        }
        [(NSMutableArray *)v14->_outputIOArray addObject:v27];

        if (v30 == ++v32)
        {
          uint64_t v30 = [v22 countByEnumeratingWithState:&v44 objects:v57 count:16];
          if (v30) {
            goto LABEL_12;
          }
          goto LABEL_18;
        }
      }
LABEL_22:

LABEL_23:
      v15 = 0;
LABEL_24:
      id v12 = v40;
      goto LABEL_25;
    }
LABEL_18:

    std::vector<VCPEspressoV2Data * {__strong}>::vector(buf, [v22 count]);
    std::vector<VCPEspressoV2Data * {__strong}>::__vdeallocate((void **)&v14->_outputs.__begin_);
    *(_OWORD *)&v14->_outputs.__begin_ = *(_OWORD *)buf;
    v14->_outputs.var1.__value_ = v56;
    v56 = 0;
    v54 = buf;
    memset(buf, 0, sizeof(buf));
    std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v54);
    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v22, "count"));
    outputsSize = v14->_outputsSize;
    v14->_outputsSize = (NSMutableArray *)v34;

    if (e5rt_execution_stream_create())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v36 = VCPLogInstance();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
LABEL_33:
          uint64_t last_error_message = e5rt_get_last_error_message();
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = last_error_message;
          _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
        }
LABEL_34:
      }
    }
    else
    {
      if (!e5rt_execution_stream_encode_operation())
      {
        if (!e5rt_execution_stream_operation_release())
        {

          v15 = v14;
          goto LABEL_24;
        }
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_35;
        }
        v36 = VCPLogInstance();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v36 = VCPLogInstance();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        goto LABEL_34;
      }
    }
LABEL_35:

    goto LABEL_23;
  }
LABEL_25:
  v37 = v15;

  return v37;
}

- (e5rt_execution_stream_operation)createPrecompiledOp:(id)a3 isPrecompiled:(BOOL)a4 functionName:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (!v6)
  {
    if (e5rt_e5_compiler_create())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t last_error_message = e5rt_get_last_error_message();
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
        }
        goto LABEL_45;
      }
      goto LABEL_46;
    }
    if (e5rt_e5_compiler_options_create())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t last_error_message = e5rt_get_last_error_message();
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
        }
        goto LABEL_45;
      }
      goto LABEL_46;
    }
    if (e5rt_e5_compiler_options_get_compute_device_types_mask())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t last_error_message = e5rt_get_last_error_message();
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
        }
        goto LABEL_45;
      }
      goto LABEL_46;
    }
    if (e5rt_e5_compiler_options_set_mil_entry_points())
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_46;
      }
      id v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        v14 = "E5RT op failed %s";
LABEL_44:
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
      }
LABEL_45:

      goto LABEL_46;
    }
    if (e5rt_e5_compiler_options_retain_mil_entry_points())
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_46;
      }
      id v11 = VCPLogInstance();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
    }
    else
    {
      id v15 = [v7 path];
      [v15 UTF8String];
      BOOL v16 = e5rt_e5_compiler_compile() == 0;

      if (v16)
      {
        [v8 UTF8String];
        if (e5rt_program_library_retain_program_function())
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_46;
          }
          id v11 = VCPLogInstance();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t last_error_message = e5rt_get_last_error_message();
            _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
          }
          goto LABEL_45;
        }
        if (e5rt_precompiled_compute_op_create_options_create_with_program_function())
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_46;
          }
          id v11 = VCPLogInstance();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
        }
        else if (e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options())
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_46;
          }
          id v11 = VCPLogInstance();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
        }
        else if (e5rt_e5_compiler_release())
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_46;
          }
          id v11 = VCPLogInstance();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
        }
        else if (e5rt_e5_compiler_options_release())
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_46;
          }
          id v11 = VCPLogInstance();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
        }
        else if (e5rt_program_function_release())
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_46;
          }
          id v11 = VCPLogInstance();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
        }
        else if (e5rt_precompiled_compute_op_create_options_release())
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_46;
          }
          id v11 = VCPLogInstance();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
        }
        else
        {
          if (!e5rt_program_library_release() || (int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_46;
          }
          id v11 = VCPLogInstance();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
        }
        *(_DWORD *)buf = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
        goto LABEL_45;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_46;
      }
      id v11 = VCPLogInstance();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
    }
    *(_DWORD *)buf = 136315138;
    uint64_t last_error_message = e5rt_get_last_error_message();
    v14 = "E5RT op failed: %s";
    goto LABEL_44;
  }
  id v9 = [v7 path];
  [v9 UTF8String];
  BOOL v10 = e5rt_program_library_create() == 0;

  if (v10)
  {
    if (e5rt_program_library_release())
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t last_error_message = e5rt_get_last_error_message();
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
        }
        goto LABEL_45;
      }
    }
    else
    {
      id v12 = [v7 path];
      [v12 UTF8String];
      [v8 UTF8String];
      BOOL v13 = e5rt_execution_stream_operation_create_precompiled_compute_operation() == 0;

      if (!v13 && (int)MediaAnalysisLogLevel() >= 3)
      {
        id v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t last_error_message = e5rt_get_last_error_message();
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
        }
        goto LABEL_45;
      }
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t last_error_message = e5rt_get_last_error_message();
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
    }
    goto LABEL_45;
  }
LABEL_46:
  free(0);

  return 0;
}

- (int)espressoForward:(void *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_inputIOArray count] != 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "Use espressoForwardInputs for multiple inputs!", (uint8_t *)&v10, 2u);
      }
    }
    return -50;
  }
  v5 = [(NSMutableArray *)self->_inputIOArray objectAtIndexedSubscript:0];
  int v6 = [v5 prepareInput:a3];

  if (v6) {
    return v6;
  }
  if (e5rt_execution_stream_execute_sync())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", (uint8_t *)&v10, 0xCu);
      }
    }
    return -18;
  }
  return [(VCPCNNModelEspressoV2 *)self getOutputs];
}

- (int)espressoForwardInputs:(vector<void *)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_inputIOArray count])
  {
    uint64_t v5 = 0;
    do
    {
      int v6 = [(NSMutableArray *)self->_inputIOArray objectAtIndexedSubscript:v5];
      int v7 = [v6 prepareInput:a3->var0[v5]];

      if (v7) {
        return v7;
      }
    }
    while ([(NSMutableArray *)self->_inputIOArray count] > (unint64_t)++v5);
  }
  if (e5rt_execution_stream_execute_sync())
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315138;
        uint64_t last_error_message = e5rt_get_last_error_message();
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "E5RT op failed: %s", (uint8_t *)&v10, 0xCu);
      }
    }
    return -18;
  }
  return [(VCPCNNModelEspressoV2 *)self getOutputs];
}

- (int)getOutputs
{
  uint64_t v3 = [(NSMutableArray *)self->_outputIOArray count];
  if (v3)
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v15 = 0;
      uint64_t v5 = [(NSMutableArray *)self->_outputIOArray objectAtIndexedSubscript:v4];
      uint64_t v6 = [v5 getOutput:&v15];

      if (!v6) {
        break;
      }
      int v7 = [VCPEspressoV2Data alloc];
      id v8 = [(NSMutableArray *)self->_outputIOArray objectAtIndexedSubscript:v4];
      uint64_t v9 = [v8 tensorType];
      uint64_t v10 = [(VCPEspressoV2Data *)v7 initWithTensorType:v9 size:v6 dataPtr:v15];
      begin = self->_outputs.__begin_;
      uint64_t v12 = begin[v4];
      begin[v4] = (__end_ *)v10;

      BOOL v13 = [NSNumber numberWithUnsignedLong:v6];
      [(NSMutableArray *)self->_outputsSize setObject:v13 atIndexedSubscript:v4];

      if ([(NSMutableArray *)self->_outputIOArray count] <= (unint64_t)++v4)
      {
        LODWORD(v3) = 0;
        return v3;
      }
    }
    LODWORD(v3) = -18;
  }
  return v3;
}

- (id)outputsSize
{
  return self->_outputsSize;
}

- (id)inputsSize
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_inputIOArray;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "getTensorShape", (void)v10));
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)outputsType
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_outputIOArray;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "tensorType", (void)v10));
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)inputsType
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_inputIOArray;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "tensorType", (void)v10));
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)dealloc
{
  e5rt_execution_stream_release();
  v3.receiver = self;
  v3.super_class = (Class)VCPCNNModelEspressoV2;
  [(VCPCNNModelEspressoV2 *)&v3 dealloc];
}

- (vector<VCPEspressoV2Data)outputs
{
  retstr->__begin_ = 0;
  retstr->var0 = 0;
  retstr->var1.__value_ = 0;
  return (vector<VCPEspressoV2Data *, std::allocator<VCPEspressoV2Data *>> *)std::vector<VCPEspressoV2Data * {__strong}>::__init_with_size[abi:ne180100]<VCPEspressoV2Data * {__strong}*,VCPEspressoV2Data * {__strong}*>((char *)retstr, (void **)self->_outputs.__begin_, (void **)self->_outputs.var0, self->_outputs.var0- self->_outputs.__begin_);
}

- (void).cxx_destruct
{
  p_outputs = &self->_outputs;
  std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_outputs);
  objc_storeStrong((id *)&self->_outputIOArray, 0);
  objc_storeStrong((id *)&self->_inputIOArray, 0);
  objc_storeStrong((id *)&self->_outputsSize, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_netFileUrl, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

@end