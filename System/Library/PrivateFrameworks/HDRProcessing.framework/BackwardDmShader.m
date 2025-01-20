@interface BackwardDmShader
+ (id)createShaderWithVertexName:(id)a3 fragmentName:(id)a4 colorFormat:(unint64_t)a5 useCustomMatrix:(BOOL)a6 p3CSC:(BOOL)a7 applyYGamma:(BOOL)a8;
- (id)getRenderPipelineStateForDevice:(id)a3 Library:(id)a4;
- (id)getRenderPipelineStateForDevice:(id)a3 Library:(id)a4 Constants:(BOOL *)a5 ConstantNumber:(unsigned int)a6;
- (id)initShaderWithVertexName:(id)a3 fragmentName:(id)a4 colorFormat:(unint64_t)a5 useCustomMatrix:(BOOL)a6 p3CSC:(BOOL)a7 applyYGamma:(BOOL)a8;
@end

@implementation BackwardDmShader

+ (id)createShaderWithVertexName:(id)a3 fragmentName:(id)a4 colorFormat:(unint64_t)a5 useCustomMatrix:(BOOL)a6 p3CSC:(BOOL)a7 applyYGamma:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  v16 = (void *)[objc_alloc((Class)a1) initShaderWithVertexName:v14 fragmentName:v15 colorFormat:a5 useCustomMatrix:v10 p3CSC:v9 applyYGamma:v8];

  return v16;
}

- (id)initShaderWithVertexName:(id)a3 fragmentName:(id)a4 colorFormat:(unint64_t)a5 useCustomMatrix:(BOOL)a6 p3CSC:(BOOL)a7 applyYGamma:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BackwardDmShader;
  v17 = [(BackwardDmShader *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_vertexKernelName, a3);
    objc_storeStrong((id *)&v18->_fragmentKernelName, a4);
    renderPipeline = v18->_renderPipeline;
    v18->_renderPipeline = 0;

    v18->_colorFormat = a5;
    v18->_useCustomMatrix = a6;
    v18->_p3CSC = a7;
    v18->_applyYGamma = a8;
  }

  return v18;
}

- (id)getRenderPipelineStateForDevice:(id)a3 Library:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL useCustomMatrix = self->_useCustomMatrix;
  __int16 v15 = *(_WORD *)&self->_p3CSC;
  v5 = [(BackwardDmShader *)self getRenderPipelineStateForDevice:a3 Library:a4 Constants:&useCustomMatrix ConstantNumber:3];
  if (!v5)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v6 = logInstanceID;
      }
      else {
        uint64_t v6 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v7 = self->_useCustomMatrix;
        BOOL p3CSC = self->_p3CSC;
        BOOL applyYGamma = self->_applyYGamma;
        *(_DWORD *)buf = 134219010;
        v17 = (const char *)WORD1(v6);
        __int16 v18 = 2080;
        *(void *)v19 = "-[BackwardDmShader getRenderPipelineStateForDevice:Library:]";
        *(_WORD *)&v19[8] = 1024;
        *(_DWORD *)v20 = v7;
        *(_WORD *)&v20[4] = 1024;
        BOOL v21 = p3CSC;
        __int16 v22 = 1024;
        BOOL v23 = applyYGamma;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : ERROR: Failed creating a new function with _useCustomMatrix=%d, _p3CSC=%d, _applyYGamma=%d", buf, 0x28u);
      }
      prevLogInstanceID = v6;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = self->_useCustomMatrix;
      BOOL v11 = self->_p3CSC;
      BOOL v12 = self->_applyYGamma;
      *(_DWORD *)buf = 136315906;
      v17 = "-[BackwardDmShader getRenderPipelineStateForDevice:Library:]";
      __int16 v18 = 1024;
      *(_DWORD *)v19 = v10;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = v11;
      *(_WORD *)v20 = 1024;
      *(_DWORD *)&v20[2] = v12;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : ERROR: Failed creating a new function with _useCustomMatrix=%d, _p3CSC=%d, _applyYGamma=%d", buf, 0x1Eu);
    }
  }
  return v5;
}

- (id)getRenderPipelineStateForDevice:(id)a3 Library:(id)a4 Constants:(BOOL *)a5 ConstantNumber:(unsigned int)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  renderPipeline = self->_renderPipeline;
  if (renderPipeline)
  {
    v13 = renderPipeline;
    goto LABEL_56;
  }
  if (!a6)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v24 = logInstanceID;
      }
      else {
        uint64_t v24 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v55 = (const char *)WORD1(v24);
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 477\n", buf, 0xCu);
      }
      BOOL v21 = 0;
      v50 = 0;
      prevLogInstanceID = v24;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] Assertion: \"0\" warned in \"/Library/Caches/com.apple.xbs/Sources/HDRProcessing/Metal/BackwardDisplayManagement/HDRBackwardDisplayManagement.mm\" at line 477\n", buf, 2u);
      }
      BOOL v21 = 0;
      v50 = 0;
    }
    goto LABEL_35;
  }
  id v14 = objc_opt_new();
  uint64_t v15 = 0;
  do
  {
    [v14 setConstantValue:&a5[v15] type:53 atIndex:v15];
    ++v15;
  }
  while (a6 != v15);
  vertexKernelName = self->_vertexKernelName;
  id v53 = 0;
  uint64_t v17 = [v11 newFunctionWithName:vertexKernelName constantValues:v14 error:&v53];
  id v18 = v53;
  v19 = v18;
  v50 = (NSString *)v17;
  if (!v17 || v18)
  {
    if (!enableLogInstance)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v41 = self->_vertexKernelName;
        v42 = [v19 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v55 = "-[BackwardDmShader getRenderPipelineStateForDevice:Library:Constants:ConstantNumber:]";
        __int16 v56 = 2112;
        v57 = (const char *)v41;
        __int16 v58 = 2112;
        v59 = v42;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : ERROR: Failed creating a new vertex function: %@ with error: %@", buf, 0x20u);
      }
      BOOL v21 = 0;
      BOOL v23 = 0;
      goto LABEL_53;
    }
    if (logInstanceID) {
      uint64_t v25 = logInstanceID;
    }
    else {
      uint64_t v25 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v26 = self->_vertexKernelName;
      v27 = [v19 localizedDescription];
      *(_DWORD *)buf = 134218754;
      v55 = (const char *)WORD1(v25);
      __int16 v56 = 2080;
      v57 = "-[BackwardDmShader getRenderPipelineStateForDevice:Library:Constants:ConstantNumber:]";
      __int16 v58 = 2112;
      v59 = v26;
      __int16 v60 = 2112;
      v61 = v27;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : ERROR: Failed creating a new vertex function: %@ with error: %@", buf, 0x2Au);
    }
    BOOL v21 = 0;
    BOOL v23 = 0;
    goto LABEL_25;
  }
  fragmentKernelName = self->_fragmentKernelName;
  id v52 = 0;
  BOOL v21 = (char *)[v11 newFunctionWithName:fragmentKernelName constantValues:v14 error:&v52];
  id v22 = v52;
  BOOL v23 = v22;
  if (!v21 || v22)
  {
    if (!enableLogInstance)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v47 = self->_fragmentKernelName;
        v48 = [v23 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v55 = "-[BackwardDmShader getRenderPipelineStateForDevice:Library:Constants:ConstantNumber:]";
        __int16 v56 = 2112;
        v57 = (const char *)v47;
        __int16 v58 = 2112;
        v59 = v48;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : ERROR: Failed creating a new fragment function: %@ with error: %@", buf, 0x20u);
      }
      goto LABEL_53;
    }
    if (logInstanceID) {
      uint64_t v25 = logInstanceID;
    }
    else {
      uint64_t v25 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v28 = self->_fragmentKernelName;
      v29 = [v23 localizedDescription];
      *(_DWORD *)buf = 134218754;
      v55 = (const char *)WORD1(v25);
      __int16 v56 = 2080;
      v57 = "-[BackwardDmShader getRenderPipelineStateForDevice:Library:Constants:ConstantNumber:]";
      __int16 v58 = 2112;
      v59 = v28;
      __int16 v60 = 2112;
      v61 = v29;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : ERROR: Failed creating a new fragment function: %@ with error: %@", buf, 0x2Au);
    }
LABEL_25:
    prevLogInstanceID = v25;
LABEL_53:

    v13 = 0;
    id v30 = 0;
    goto LABEL_54;
  }

LABEL_35:
  id v30 = objc_alloc_init(MEMORY[0x263F129C0]);
  [v30 setVertexFunction:v50];
  [v30 setFragmentFunction:v21];
  unint64_t colorFormat = self->_colorFormat;
  v32 = [v30 colorAttachments];
  v33 = [v32 objectAtIndexedSubscript:0];
  [v33 setPixelFormat:colorFormat];

  id v51 = 0;
  v13 = (MTLRenderPipelineState *)[v10 newRenderPipelineStateWithDescriptor:v30 error:&v51];
  id v34 = v51;
  v35 = v34;
  if (!v13 || v34)
  {
    if (enableLogInstance)
    {
      if (logInstanceID) {
        uint64_t v36 = logInstanceID;
      }
      else {
        uint64_t v36 = prevLogInstanceID;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        p_vertexKernelName = &self->_vertexKernelName;
        v37 = self->_vertexKernelName;
        v38 = p_vertexKernelName[1];
        v40 = [v35 localizedDescription];
        *(_DWORD *)buf = 134219522;
        v55 = (const char *)WORD1(v36);
        __int16 v56 = 2080;
        v57 = "-[BackwardDmShader getRenderPipelineStateForDevice:Library:Constants:ConstantNumber:]";
        __int16 v58 = 2048;
        v59 = (NSString *)v21;
        __int16 v60 = 2112;
        v61 = v38;
        __int16 v62 = 2048;
        v63 = v50;
        __int16 v64 = 2112;
        v65 = v37;
        __int16 v66 = 2112;
        v67 = v40;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : ERROR: Failed to create backward DM Kernel: fragment[%p]=%@, vertex[%p]=%@, with error: %@", buf, 0x48u);
      }
      BOOL v23 = 0;
      v19 = 0;
      prevLogInstanceID = v36;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        v45 = &self->_vertexKernelName;
        v43 = self->_vertexKernelName;
        v44 = v45[1];
        v46 = [v35 localizedDescription];
        *(_DWORD *)buf = 136316418;
        v55 = "-[BackwardDmShader getRenderPipelineStateForDevice:Library:Constants:ConstantNumber:]";
        __int16 v56 = 2048;
        v57 = v21;
        __int16 v58 = 2112;
        v59 = v44;
        __int16 v60 = 2048;
        v61 = v50;
        __int16 v62 = 2112;
        v63 = v43;
        __int16 v64 = 2112;
        v65 = v46;
        _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : ERROR: Failed to create backward DM Kernel: fragment[%p]=%@, vertex[%p]=%@, with error: %@", buf, 0x3Eu);
      }
      BOOL v23 = 0;
      v19 = 0;
    }
    goto LABEL_55;
  }
  objc_storeStrong((id *)&self->_renderPipeline, v13);
  BOOL v23 = 0;
  v19 = 0;
LABEL_54:
  v35 = 0;
LABEL_55:

LABEL_56:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_fragmentKernelName, 0);
  objc_storeStrong((id *)&self->_vertexKernelName, 0);
}

@end