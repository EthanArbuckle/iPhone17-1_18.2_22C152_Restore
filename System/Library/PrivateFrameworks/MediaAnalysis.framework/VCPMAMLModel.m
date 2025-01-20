@interface VCPMAMLModel
+ (id)vcp_sharedModelWithModelName:(id)a3;
- (MLModel)model;
- (NSString)inputFeatureName;
- (NSString)outputFeatureName;
- (VCPMAMLModel)init;
- (VCPMAMLModel)initWithModelName:(id)a3;
- (int64_t)inputSize;
- (unsigned)inputPixelFormat;
@end

@implementation VCPMAMLModel

- (VCPMAMLModel)init
{
  return 0;
}

- (VCPMAMLModel)initWithModelName:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)VCPMAMLModel;
  v5 = [(VCPMAMLModel *)&v59 init];
  if (!v5) {
    goto LABEL_70;
  }
  v6 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v7 = [v6 URLForResource:v4 withExtension:@"mlmodelc"];

  if (!v7)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      id v9 = 0;
      goto LABEL_29;
    }
    v22 = VCPLogInstance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v62 = (uint64_t)v4;
      __int16 v63 = 2112;
      uint64_t v64 = 0;
      _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[%@][MAMLModel] Failed to open model file at url %@", buf, 0x16u);
    }
    id v9 = 0;
    goto LABEL_21;
  }
  id v58 = 0;
  uint64_t v8 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v7 error:&v58];
  id v9 = v58;
  model = v5->_model;
  v5->_model = (MLModel *)v8;

  v11 = v5->_model;
  if (v11)
  {
    v12 = [(MLModel *)v11 modelDescription];
    v13 = [v12 inputDescriptionsByName];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v69 count:16];
    if (v15)
    {
      id v48 = v9;
      uint64_t v16 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v55 != v16) {
            objc_enumerationMutation(v14);
          }
          v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v19 = [v14 objectForKeyedSubscript:v18];
          if ([v19 type] == 4)
          {
            uint64_t v20 = [v19 imageConstraint];
            if (v20)
            {
              v24 = (void *)v20;
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v25 = VCPLogInstance();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v47 = [v24 pixelsWide];
                  uint64_t v26 = [v24 pixelsHigh];
                  unsigned int v27 = [v24 pixelFormatType];
                  *(_DWORD *)buf = 138413058;
                  uint64_t v62 = (uint64_t)v18;
                  __int16 v63 = 2048;
                  uint64_t v64 = v47;
                  __int16 v65 = 2048;
                  uint64_t v66 = v26;
                  __int16 v67 = 2048;
                  uint64_t v68 = v27;
                  _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "[MAMLModel] Input feature %@ %ldx%ld %ld", buf, 0x2Au);
                }
              }
              uint64_t v21 = [v24 pixelsWide];
              uint64_t v15 = [v24 pixelsHigh];
              v5->_inputPixelFormat = [v24 pixelFormatType];
              uint64_t v28 = [v18 copy];
              inputFeatureName = v5->_inputFeatureName;
              v5->_inputFeatureName = (NSString *)v28;

              goto LABEL_27;
            }
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v69 count:16];
        if (v15) {
          continue;
        }
        break;
      }
      uint64_t v21 = 0;
LABEL_27:
      id v9 = v48;
    }
    else
    {
      uint64_t v21 = 0;
    }

    if (v5->_inputFeatureName && v5->_inputPixelFormat && v21 && v15)
    {
      if (v21 == v15)
      {
        id v49 = v9;
        v5->_inputSize = v15;
        v30 = [(MLModel *)v5->_model modelDescription];
        v31 = [v30 outputDescriptionsByName];

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v32 = v31;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v50 objects:v60 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v51;
          while (2)
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v51 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = *(void **)(*((void *)&v50 + 1) + 8 * j);
              v38 = [v32 objectForKeyedSubscript:v37];
              if ([v38 type] == 5)
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v43 = VCPLogInstance();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v62 = (uint64_t)v37;
                    __int16 v63 = 2112;
                    uint64_t v64 = (uint64_t)v38;
                    _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_DEBUG, "[MAMLModel] Output feature %@ %@", buf, 0x16u);
                  }
                }
                objc_storeStrong((id *)&v5->_outputFeatureName, v37);

                goto LABEL_59;
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v50 objects:v60 count:16];
            if (v34) {
              continue;
            }
            break;
          }
        }
LABEL_59:

        if (v5->_outputFeatureName)
        {
          int v42 = 0;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v44 = VCPLogInstance();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v62 = (uint64_t)v32;
              _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_ERROR, "[MAMLModel] Missing output feature %@", buf, 0xCu);
            }
          }
          int v42 = 1;
        }
        id v9 = v49;
        goto LABEL_67;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v32 = VCPLogInstance();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          goto LABEL_49;
        }
        *(_DWORD *)buf = 134218240;
        uint64_t v62 = v21;
        __int16 v63 = 2048;
        uint64_t v64 = v15;
        v39 = "[MAMLModel] Mismatched inputImage width (%ld) and height (%ld)";
        v40 = v32;
        uint32_t v41 = 22;
        goto LABEL_48;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v32 = VCPLogInstance();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
LABEL_49:
        int v42 = 1;
LABEL_67:

LABEL_68:
        if (v42) {
          goto LABEL_69;
        }
LABEL_70:
        v45 = v5;
        goto LABEL_71;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v62 = (uint64_t)v14;
      v39 = "[MAMLModel] Missing inputImage feature description %@";
      v40 = v32;
      uint32_t v41 = 12;
LABEL_48:
      _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
      goto LABEL_49;
    }
    int v42 = 1;
    goto LABEL_68;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v22 = VCPLogInstance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = v5->_model;
      *(_DWORD *)buf = 138412802;
      uint64_t v62 = (uint64_t)v4;
      __int16 v63 = 2112;
      uint64_t v64 = (uint64_t)v23;
      __int16 v65 = 2112;
      uint64_t v66 = (uint64_t)v9;
      _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[%@][MAMLModel] Failed to load compiled model (%@): %@", buf, 0x20u);
    }
LABEL_21:
  }
LABEL_29:

LABEL_69:
  v45 = 0;
LABEL_71:

  return v45;
}

+ (id)vcp_sharedModelWithModelName:(id)a3
{
  id v3 = a3;
  id v4 = [NSString stringWithFormat:@"VCPMAMLModel-%@", v3];
  v5 = +[VCPSharedInstanceManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__VCPMAMLModel_vcp_sharedModelWithModelName___block_invoke;
  v9[3] = &unk_1E629BD60;
  id v10 = v3;
  id v6 = v3;
  v7 = [v5 sharedInstanceWithIdentifier:v4 andCreationBlock:v9];

  return v7;
}

VCPMAMLModel *__45__VCPMAMLModel_vcp_sharedModelWithModelName___block_invoke(uint64_t a1)
{
  v1 = [[VCPMAMLModel alloc] initWithModelName:*(void *)(a1 + 32)];
  return v1;
}

- (MLModel)model
{
  return self->_model;
}

- (int64_t)inputSize
{
  return self->_inputSize;
}

- (unsigned)inputPixelFormat
{
  return self->_inputPixelFormat;
}

- (NSString)inputFeatureName
{
  return self->_inputFeatureName;
}

- (NSString)outputFeatureName
{
  return self->_outputFeatureName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFeatureName, 0);
  objc_storeStrong((id *)&self->_inputFeatureName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end