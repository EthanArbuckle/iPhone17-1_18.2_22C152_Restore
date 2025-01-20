@interface ForwardDmShader
- (NSString)computeKernelName;
- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4;
- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4 Constants:(BOOL *)a5 ConstantNumber:(unsigned int)a6;
- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4 Constants:(BOOL *)a5 ConstantNumber:(unsigned int)a6 input:(char)a7 output:(char)a8;
- (id)initShaderWithName:(id)a3;
@end

@implementation ForwardDmShader

- (id)initShaderWithName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ForwardDmShader;
  v6 = [(ForwardDmShader *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_computeKernelName, a3);
    computePipeline = v7->_computePipeline;
    v7->_computePipeline = 0;

    *(_WORD *)&v7->_inputFormat = 1574;
  }

  return v7;
}

- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4
{
  v4 = [(ForwardDmShader *)self getComputePipeLineStateForDevice:a3 Library:a4 Constants:0 ConstantNumber:0];
  return v4;
}

- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4 Constants:(BOOL *)a5 ConstantNumber:(unsigned int)a6
{
  v6 = [(ForwardDmShader *)self getComputePipeLineStateForDevice:a3 Library:a4 Constants:a5 ConstantNumber:*(void *)&a6 input:38 output:6];
  return v6;
}

- (id)getComputePipeLineStateForDevice:(id)a3 Library:(id)a4 Constants:(BOOL *)a5 ConstantNumber:(unsigned int)a6 input:(char)a7 output:(char)a8
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  char v43 = a7;
  char v42 = a8;
  computePipeline = self->_computePipeline;
  if (computePipeline)
  {
    if (self->_inputFormat == a7 && self->_outputFormat == a8
      || (self->_computePipeline = 0,
          computePipeline,
          self->_inputFormat = a7,
          self->_outputFormat = a8,
          (computePipeline = self->_computePipeline) != 0))
    {
      v17 = computePipeline;
      goto LABEL_47;
    }
  }
  if (a6)
  {
    v18 = objc_opt_new();
    uint64_t v19 = 0;
    do
    {
      [v18 setConstantValue:&a5[v19] type:53 atIndex:v19];
      ++v19;
    }
    while (a6 != v19);
    if (v43 != 38 || v42 != 6)
    {
      [v18 setConstantValue:&v43 type:45 atIndex:a6];
      [v18 setConstantValue:&v42 type:45 atIndex:a6 + 1];
    }
    computeKernelName = self->_computeKernelName;
    id v41 = 0;
    v22 = (void *)[v15 newFunctionWithName:computeKernelName constantValues:v18 error:&v41];
    id v23 = v41;
    v24 = v23;
    if (!v22 || v23)
    {
      if (enableLogInstance)
      {
        if (logInstanceID) {
          uint64_t v27 = logInstanceID;
        }
        else {
          uint64_t v27 = prevLogInstanceID;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          v28 = self->_computeKernelName;
          v29 = [v24 localizedDescription];
          *(_DWORD *)buf = 134218754;
          v45 = (const char *)WORD1(v27);
          __int16 v46 = 2080;
          v47 = "-[ForwardDmShader getComputePipeLineStateForDevice:Library:Constants:ConstantNumber:input:output:]";
          __int16 v48 = 2112;
          v49 = v28;
          __int16 v50 = 2112;
          v51 = v29;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : ERROR: Failed creating a new function: %@ with error: %@", buf, 0x2Au);
        }
        prevLogInstanceID = v27;
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v34 = self->_computeKernelName;
        v35 = [v24 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v45 = "-[ForwardDmShader getComputePipeLineStateForDevice:Library:Constants:ConstantNumber:input:output:]";
        __int16 v46 = 2112;
        v47 = (const char *)v34;
        __int16 v48 = 2112;
        v49 = v35;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : ERROR: Failed creating a new function: %@ with error: %@", buf, 0x20u);
      }
      v17 = 0;
      id v25 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    v22 = (void *)[v15 newFunctionWithName:self->_computeKernelName];
    if (!v22)
    {
      if (!enableLogInstance)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          v39 = self->_computeKernelName;
          *(_DWORD *)buf = 136315394;
          v45 = "-[ForwardDmShader getComputePipeLineStateForDevice:Library:Constants:ConstantNumber:input:output:]";
          __int16 v46 = 2112;
          v47 = (const char *)v39;
          _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : ERROR: Failed creating a new function: %@", buf, 0x16u);
        }
        v17 = 0;
        v22 = 0;
        id v25 = 0;
        goto LABEL_21;
      }
      if (logInstanceID) {
        uint64_t v30 = logInstanceID;
      }
      else {
        uint64_t v30 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->_computeKernelName;
        *(_DWORD *)buf = 134218498;
        v45 = (const char *)WORD1(v30);
        __int16 v46 = 2080;
        v47 = "-[ForwardDmShader getComputePipeLineStateForDevice:Library:Constants:ConstantNumber:input:output:]";
        __int16 v48 = 2112;
        v49 = v33;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : ERROR: Failed creating a new function: %@", buf, 0x20u);
      }
      v17 = 0;
      v22 = 0;
      id v25 = 0;
      v24 = 0;
LABEL_42:
      prevLogInstanceID = v30;
      goto LABEL_46;
    }
  }
  id v25 = objc_alloc_init(MEMORY[0x263F12850]);
  [v25 setThreadGroupSizeIsMultipleOfThreadExecutionWidth:1];
  [v25 setComputeFunction:v22];
  id v40 = 0;
  v17 = (MTLComputePipelineState *)[v14 newComputePipelineStateWithDescriptor:v25 error:&v40];
  id v26 = v40;
  v24 = v26;
  if (!v17 || v26)
  {
    if (!enableLogInstance)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v37 = self->_computeKernelName;
        v38 = [v24 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v45 = "-[ForwardDmShader getComputePipeLineStateForDevice:Library:Constants:ConstantNumber:input:output:]";
        __int16 v46 = 2112;
        v47 = (const char *)v37;
        __int16 v48 = 2112;
        v49 = v38;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : ERROR: Failed to create forward DM Kernel: %@ with error: %@", buf, 0x20u);
      }
      goto LABEL_46;
    }
    if (logInstanceID) {
      uint64_t v30 = logInstanceID;
    }
    else {
      uint64_t v30 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_computeKernelName;
      v32 = [v24 localizedDescription];
      *(_DWORD *)buf = 134218754;
      v45 = (const char *)WORD1(v30);
      __int16 v46 = 2080;
      v47 = "-[ForwardDmShader getComputePipeLineStateForDevice:Library:Constants:ConstantNumber:input:output:]";
      __int16 v48 = 2112;
      v49 = v31;
      __int16 v50 = 2112;
      v51 = v32;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : ERROR: Failed to create forward DM Kernel: %@ with error: %@", buf, 0x2Au);
    }
    goto LABEL_42;
  }
  objc_storeStrong((id *)&self->_computePipeline, v17);
LABEL_21:
  v24 = 0;
LABEL_46:

LABEL_47:
  return v17;
}

- (NSString)computeKernelName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeKernelName, 0);
  objc_storeStrong((id *)&self->_computePipeline, 0);
}

@end