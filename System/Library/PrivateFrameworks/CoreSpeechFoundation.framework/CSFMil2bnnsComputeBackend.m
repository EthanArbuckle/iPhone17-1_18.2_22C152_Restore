@interface CSFMil2bnnsComputeBackend
+ ($3265B292A9BE2BE95187D95CCBA22C14)_compileWithMilFile:(id)a3 bnnsIrPath:(id)a4 separateWeight:(id)a5 compilationConfig:(id)a6 isBnnsIrMapped:(BOOL *)a7 errOut:(id *)a8;
+ (id)compileWithMilFile:(id)a3 bnnsIrPath:(id)a4 separateWeight:(id)a5;
+ (void)markPurgeableWithBnnsIrFile:(id)a3;
- ($3265B292A9BE2BE95187D95CCBA22C14)_mapBnnsIrPath:(id)a3 errOut:(id *)a4;
- (BOOL)_populateModelInterfaceParameters;
- (BOOL)graphIsMapped;
- (CSFMil2bnnsCompilationConfig)modelCompilationConfig;
- (CSFMil2bnnsComputeBackend)initWithBnnsIrFile:(id)a3 weightPath:(id)a4 errOut:(id *)a5;
- (CSFMil2bnnsComputeBackend)initWithModelFile:(id)a3 bnnsIrPath:(id)a4 errOut:(id *)a5;
- (CSFMil2bnnsComputeBackend)initWithModelFile:(id)a3 errOut:(id *)a4;
- (NSDictionary)bnnsIrInputTensorsProperty;
- (NSDictionary)bnnsIrOutputTensorsProperty;
- (NSString)bnnsIrPath;
- (NSString)funcName;
- (NSString)milPath;
- (bnnsIrMappedWeight)weight;
- (id)_convertOutputBuffer:(id)a3;
- (id)_fetchTensorPropertiesForName:(id)a3;
- (id)_getShapeFromTensorDesc:(id *)a3;
- (id)_runWithMil2bnnsDataInputBuff:(id)a3 error:(id *)a4;
- (id)getExpectedInputTensors;
- (id)getExpectedOutputTensors;
- (id)predictOutputWithInputs:(id)a3 errOut:(id *)a4;
- (unint64_t)_getDataTypeFromTensorDesc:(id *)a3;
- (void)_graphInitWithError:(id *)a3;
- (void)_loadGraph:(id *)a3;
- (void)_pointBnnsIrToWeights:(id)a3 errOut:(id *)a4;
- (void)dealloc;
- (void)setBnnsIrInputTensorsProperty:(id)a3;
- (void)setBnnsIrOutputTensorsProperty:(id)a3;
- (void)setGraphIsMapped:(BOOL)a3;
- (void)setModelCompilationConfig:(id)a3;
- (void)setWeight:(id)a3;
@end

@implementation CSFMil2bnnsComputeBackend

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelCompilationConfig, 0);
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_funcName, 0);
  objc_storeStrong((id *)&self->_bnnsIrPath, 0);
  objc_storeStrong((id *)&self->_milPath, 0);
  objc_storeStrong((id *)&self->_bnnsIrInputTensorsProperty, 0);
  objc_storeStrong((id *)&self->_bnnsIrOutputTensorsProperty, 0);
}

- (void)setModelCompilationConfig:(id)a3
{
}

- (CSFMil2bnnsCompilationConfig)modelCompilationConfig
{
  return self->_modelCompilationConfig;
}

- (void)setWeight:(id)a3
{
}

- (bnnsIrMappedWeight)weight
{
  return self->_weight;
}

- (NSString)funcName
{
  return self->_funcName;
}

- (NSString)bnnsIrPath
{
  return self->_bnnsIrPath;
}

- (NSString)milPath
{
  return self->_milPath;
}

- (void)setBnnsIrInputTensorsProperty:(id)a3
{
}

- (NSDictionary)bnnsIrInputTensorsProperty
{
  return self->_bnnsIrInputTensorsProperty;
}

- (void)setBnnsIrOutputTensorsProperty:(id)a3
{
}

- (NSDictionary)bnnsIrOutputTensorsProperty
{
  return self->_bnnsIrOutputTensorsProperty;
}

- (void)setGraphIsMapped:(BOOL)a3
{
  self->_graphIsMapped = a3;
}

- (BOOL)graphIsMapped
{
  return self->_graphIsMapped;
}

- (void)dealloc
{
  BNNSGraphContextDestroy_v2();
  data = self->_graph.data;
  if (self->_graphIsMapped)
  {
    if (data != (void *)-1)
    {
      munmap(data, self->_graph.size);
      self->_graph.data = (void *)-1;
      self->_graph.size = 0;
    }
    self->_graphIsMapped = 0;
  }
  else if (data)
  {
    free(data);
    self->_graph.data = 0;
    self->_graph.size = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSFMil2bnnsComputeBackend;
  [(CSFMil2bnnsComputeBackend *)&v4 dealloc];
}

- (id)_runWithMil2bnnsDataInputBuff:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  if (v58 && [v58 count])
  {
    unint64_t InputCount = BNNSGraphGetInputCount();
    std::vector<char const*>::vector(v64, InputCount);
    BNNSGraphGetInputNames_v2();
    unint64_t OutputCount = BNNSGraphGetOutputCount();
    std::vector<char const*>::vector(__p, OutputCount);
    BNNSGraphGetOutputNames_v2();
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v54 = a4;
    unint64_t v56 = InputCount;
    v60 = v8;
    if (OutputCount)
    {
      unint64_t v57 = OutputCount;
      v9 = 0;
      v10 = 0;
      unint64_t v59 = 0;
      uint64_t v11 = 0;
      while (1)
      {
        v61 = objc_msgSend(NSString, "stringWithUTF8String:", *((void *)__p[0] + v11), v54);
        v12 = [CSFComputeDataBuffer alloc];
        v13 = [(NSDictionary *)self->_bnnsIrOutputTensorsProperty objectForKeyedSubscript:v61];
        id v62 = 0;
        v14 = [(CSFComputeDataBuffer *)v12 initWithProperties:v13 name:v61 errOut:&v62];
        id v15 = v62;

        if (!v14 || v15 != 0) {
          break;
        }
        [v60 setObject:v14 forKey:v61];
        v17 = [v60 objectForKeyedSubscript:v61];
        uint64_t v18 = [v17 getWritableDataPtr];
        v19 = [v60 objectForKeyedSubscript:v61];
        uint64_t v20 = 4 * [v19 elementSize];
        if ((unint64_t)v10 >= v59)
        {
          uint64_t v21 = ((char *)v10 - (char *)v9) >> 4;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 60) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v59 - (void)v9) >> 3 > v22) {
            unint64_t v22 = (uint64_t)(v59 - (void)v9) >> 3;
          }
          if (v59 - (unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v23 = v22;
          }
          if (v23) {
            unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v23);
          }
          else {
            uint64_t v24 = 0;
          }
          v25 = (uint64_t *)(v23 + 16 * v21);
          uint64_t *v25 = v18;
          v25[1] = v20;
          if (v10 == v9)
          {
            v27 = (uint64_t *)(v23 + 16 * v21);
          }
          else
          {
            unint64_t v26 = v23 + 16 * v21;
            do
            {
              v27 = (uint64_t *)(v26 - 16);
              *(_OWORD *)(v26 - 16) = *((_OWORD *)v10 - 1);
              v10 -= 2;
              v26 -= 16;
            }
            while (v10 != v9);
          }
          unint64_t v59 = v23 + 16 * v24;
          v10 = v25 + 2;
          if (v9) {
            operator delete(v9);
          }
          v9 = v27;
        }
        else
        {
          uint64_t *v10 = v18;
          v10[1] = v20;
          v10 += 2;
        }

        ++v11;
        id v8 = v60;
        if (v11 == v57) {
          goto LABEL_35;
        }
      }
      if (v54) {
        id *v54 = v15;
      }

      goto LABEL_68;
    }
    v9 = 0;
    v10 = 0;
    unint64_t v59 = 0;
LABEL_35:
    if (v56 == objc_msgSend(v58, "count", v54))
    {
      if (v56)
      {
        uint64_t v32 = 0;
        while (1)
        {
          v61 = [NSString stringWithUTF8String:*((void *)v64[0] + v32)];
          v33 = [(NSDictionary *)self->_bnnsIrInputTensorsProperty objectForKeyedSubscript:v61];
          v34 = [v58 objectForKeyedSubscript:v61];
          v35 = [v34 tensorProperties];
          char v36 = [v33 isEqual:v35];

          if ((v36 & 1) == 0) {
            break;
          }
          v37 = [v58 objectForKeyedSubscript:v61];
          uint64_t v38 = [v37 getWritableDataPtr];
          v39 = [v58 objectForKeyedSubscript:v61];
          uint64_t v40 = 4 * [v39 elementSize];
          if ((unint64_t)v10 >= v59)
          {
            uint64_t v41 = ((char *)v10 - (char *)v9) >> 4;
            unint64_t v42 = v41 + 1;
            if ((unint64_t)(v41 + 1) >> 60) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v59 - (void)v9) >> 3 > v42) {
              unint64_t v42 = (uint64_t)(v59 - (void)v9) >> 3;
            }
            if (v59 - (unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v43 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v43 = v42;
            }
            if (v43) {
              unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v43);
            }
            else {
              uint64_t v44 = 0;
            }
            v45 = (uint64_t *)(v43 + 16 * v41);
            uint64_t *v45 = v38;
            v45[1] = v40;
            if (v10 == v9)
            {
              v47 = (uint64_t *)(v43 + 16 * v41);
            }
            else
            {
              unint64_t v46 = v43 + 16 * v41;
              do
              {
                v47 = (uint64_t *)(v46 - 16);
                *(_OWORD *)(v46 - 16) = *((_OWORD *)v10 - 1);
                v10 -= 2;
                v46 -= 16;
              }
              while (v10 != v9);
            }
            unint64_t v59 = v43 + 16 * v44;
            v10 = v45 + 2;
            if (v9) {
              operator delete(v9);
            }
            v9 = v47;
          }
          else
          {
            uint64_t *v10 = v38;
            v10[1] = v40;
            v10 += 2;
          }

          if (++v32 == v56) {
            goto LABEL_59;
          }
        }
        if (!v55) {
          goto LABEL_69;
        }
        v51 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        id v15 = [NSString stringWithFormat:@"Mismatched input tensor"];
        id v68 = v15;
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        void *v55 = [v51 errorWithDomain:@"com.apple.corespeech" code:2415 userInfo:v52];

LABEL_68:
LABEL_69:

        v31 = 0;
        id v8 = v60;
LABEL_74:

        if (v9) {
          operator delete(v9);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v64[0])
        {
          v64[1] = v64[0];
          operator delete(v64[0]);
        }
        goto LABEL_80;
      }
LABEL_59:
      id v8 = v60;
      if (!BNNSGraphContextExecute_v2())
      {
        v31 = (void *)[v60 copy];
        goto LABEL_74;
      }
      if (v55)
      {
        v48 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        v61 = [NSString stringWithFormat:@"BNNSGraphContextExecute failed"];
        v66 = v61;
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        id v49 = [v48 errorWithDomain:@"com.apple.corespeech" code:2408 userInfo:v15];
LABEL_64:
        void *v55 = v49;
        goto LABEL_68;
      }
    }
    else if (v55)
    {
      v50 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      v61 = [NSString stringWithFormat:@"given input length does not match"];
      v70 = v61;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      id v49 = [v50 errorWithDomain:@"com.apple.corespeech" code:2409 userInfo:v15];
      goto LABEL_64;
    }
    v31 = 0;
    goto LABEL_74;
  }
  if (a4)
  {
    v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v71 = *MEMORY[0x1E4F28568];
    v29 = [NSString stringWithFormat:@"inputs to model is empty"];
    v72[0] = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
    *a4 = [v28 errorWithDomain:@"com.apple.corespeech" code:2401 userInfo:v30];
  }
  v31 = 0;
LABEL_80:

  return v31;
}

- (void)_loadGraph:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  bnnsIrPath = self->_bnnsIrPath;
  if (!bnnsIrPath)
  {
    if (self->_graph.data) {
      goto LABEL_20;
    }
LABEL_11:
    milPath = self->_milPath;
    if (milPath)
    {
      v12 = CSLogContextFacilityCoreSpeech;
      BOOL v13 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      v14 = self->_bnnsIrPath;
      if (v13)
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
        __int16 v36 = 2112;
        v37 = v14;
        _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s No graph is loaded, compiling to bnnsIr: %@", buf, 0x16u);
        milPath = self->_milPath;
        v14 = self->_bnnsIrPath;
      }
      modelCompilationConfig = self->_modelCompilationConfig;
      id v31 = 0;
      v16 = (void *)+[CSFMil2bnnsComputeBackend _compileWithMilFile:milPath bnnsIrPath:v14 separateWeight:0 compilationConfig:modelCompilationConfig isBnnsIrMapped:&self->_graphIsMapped errOut:&v31];
      unint64_t v18 = v17;
      milPath = (NSString *)v31;
      self->_graph.data = v16;
      self->_graph.size = v18;
      if (v16)
      {
        v19 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
          _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s recompilation is successful", buf, 0xCu);
        }
        if (a3) {
          *a3 = 0;
        }

        goto LABEL_20;
      }
      v27 = self->_milPath;
      if (v27)
      {
        v28 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
          __int16 v36 = 2112;
          v37 = v27;
          __int16 v38 = 2112;
          v39 = milPath;
          _os_log_impl(&dword_1BA1A5000, v28, OS_LOG_TYPE_DEFAULT, "%s recompiling milFile: %@ failed with error: %@", buf, 0x20u);
        }
        if (a3)
        {
          milPath = milPath;
          *a3 = milPath;
        }
      }
    }
    v29 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
      _os_log_impl(&dword_1BA1A5000, v29, OS_LOG_TYPE_DEFAULT, "%s bnnsIr loading failed", buf, 0xCu);
    }
    goto LABEL_35;
  }
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
    __int16 v36 = 2112;
    v37 = bnnsIrPath;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s loading model from bnnsIrPath: %@", buf, 0x16u);
    bnnsIrPath = self->_bnnsIrPath;
  }
  data = (void *)[(CSFMil2bnnsComputeBackend *)self _mapBnnsIrPath:bnnsIrPath errOut:a3];
  self->_graph.data = data;
  self->_graph.size = v8;
  if (a3)
  {
    v9 = (NSString *)*a3;
    if (*a3)
    {
      v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
        __int16 v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s error loading bnns ir :%@", buf, 0x16u);
        data = self->_graph.data;
      }
    }
  }
  if (!data) {
    goto LABEL_11;
  }
  self->_graphIsMapped = 1;
LABEL_20:
  uint64_t v20 = (void *)BNNSGraphContextMake();
  self->_graphContext.data = v20;
  self->_graphContext.size = v21;
  weight = self->_weight;
  if (weight)
  {
    id v30 = 0;
    [(CSFMil2bnnsComputeBackend *)self _pointBnnsIrToWeights:weight errOut:&v30];
    unint64_t v23 = (NSString *)v30;
    if (v23)
    {
      milPath = v23;
      if (a3)
      {
        milPath = v23;
        *a3 = milPath;
      }
      goto LABEL_35;
    }
    uint64_t v20 = self->_graphContext.data;
  }
  milPath = 0;
  if (a3 && !v20)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v25 = [NSString stringWithFormat:@"BNNSGraphContextMake fail for %@", self->_milPath];
    v33 = v25;
    unint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    *a3 = [v24 errorWithDomain:@"com.apple.corespeech" code:2262 userInfo:v26];

    milPath = 0;
  }
LABEL_35:
}

- ($3265B292A9BE2BE95187D95CCBA22C14)_mapBnnsIrPath:(id)a3 errOut:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = open((const char *)[v5 UTF8String], 0);
  int v7 = v6;
  if (v6 == -1)
  {
    if (a4)
    {
      BOOL v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v14 = NSString;
      id v15 = __error();
      v16 = objc_msgSend(v14, "stringWithFormat:", @"Could not read open() BNNSIR: %s", strerror(*v15));
      v40[0] = v16;
      unint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      *a4 = [v13 errorWithDomain:@"com.apple.corespeech" code:2261 userInfo:v17];
    }
  }
  else if (fstat(v6, &v32))
  {
    if (a4)
    {
      unint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v9 = NSString;
      v10 = __error();
      uint64_t v11 = objc_msgSend(v9, "stringWithFormat:", @"Could not fstat() BNNSIR: %s", strerror(*v10));
      __int16 v38 = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      *a4 = [v8 errorWithDomain:@"com.apple.corespeech" code:2261 userInfo:v12];
    }
    close(v7);
  }
  else
  {
    size_t st_size = v32.st_size;
    unint64_t v18 = mmap(0, v32.st_size, 1, 1, v7, 0);
    close(v7);
    if (v18 == (void *)-1)
    {
      if (a4)
      {
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        v28 = NSString;
        v29 = __error();
        id v30 = objc_msgSend(v28, "stringWithFormat:", @"Could not mmap() BNNSIR: %s", strerror(*v29));
        __int16 v36 = v30;
        id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        *a4 = [v27 errorWithDomain:@"com.apple.corespeech" code:2261 userInfo:v31];
      }
    }
    else
    {
      if (BNNSGraphGetWorkspaceSize_v2() != -1) {
        goto LABEL_9;
      }
      if (a4)
      {
        unint64_t v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        unint64_t v23 = NSString;
        uint64_t v24 = __error();
        v25 = objc_msgSend(v23, "stringWithFormat:", @"Could not BNNSGraphGetWorkspaceSize() BNNSIR: %s", strerror(*v24));
        v34 = v25;
        unint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        *a4 = [v22 errorWithDomain:@"com.apple.corespeech" code:2261 userInfo:v26];
      }
      munmap(v18, st_size);
    }
  }
  unint64_t v18 = 0;
  size_t st_size = 0;
LABEL_9:

  uint64_t v20 = v18;
  unint64_t v21 = st_size;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (id)_convertOutputBuffer:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v5, "objectForKeyedSubscript:", v9, (void)v14);
        uint64_t v11 = [v10 convertDataToArray];
        [v4 setObject:v11 forKey:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v4 copy];
  return v12;
}

- (BOOL)_populateModelInterfaceParameters
{
  if (!self->_graph.data) {
    return 0;
  }
  unint64_t InputCount = BNNSGraphGetInputCount();
  std::vector<char const*>::vector(&v20, InputCount);
  BNNSGraphGetInputNames_v2();
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = v20;
  uint64_t v6 = v21;
  if (v20 == v21)
  {
    uint64_t v9 = 0;
LABEL_9:
    unint64_t OutputCount = BNNSGraphGetOutputCount();
    std::vector<char const*>::vector(&__p, OutputCount);
    BNNSGraphGetOutputNames_v2();
    v12 = [MEMORY[0x1E4F1CA60] dictionary];
    BOOL v13 = __p;
    long long v14 = v19;
    if (__p == v19)
    {
      uint64_t v16 = (uint64_t)v9;
LABEL_15:
      objc_storeStrong((id *)&self->_bnnsIrInputTensorsProperty, v4);
      objc_storeStrong((id *)&self->_bnnsIrOutputTensorsProperty, v12);
      BOOL v10 = 1;
      long long v15 = (void *)v16;
    }
    else
    {
      while (1)
      {
        long long v15 = [NSString stringWithUTF8String:*v13];
        if (!v9) {
          break;
        }
        uint64_t v16 = [(CSFMil2bnnsComputeBackend *)self _fetchTensorPropertiesForName:v15];

        [v12 setObject:v16 forKey:v15];
        ++v13;
        uint64_t v9 = (void *)v16;
        if (v13 == v14) {
          goto LABEL_15;
        }
      }
      BOOL v10 = 0;
    }

    if (__p)
    {
      uint64_t v19 = __p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = [NSString stringWithUTF8String:*v5];
      uint64_t v9 = [(CSFMil2bnnsComputeBackend *)self _fetchTensorPropertiesForName:v8];

      if (!v9) {
        break;
      }
      [v4 setObject:v9 forKey:v8];

      ++v5;
      uint64_t v7 = v9;
      if (v5 == v6) {
        goto LABEL_9;
      }
    }

    BOOL v10 = 0;
  }

  if (v20)
  {
    unint64_t v21 = v20;
    operator delete(v20);
  }
  return v10;
}

- (id)_fetchTensorPropertiesForName:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 UTF8String];
  [(NSString *)self->_funcName UTF8String];
  if (BNNSGraphContextGetTensorDescriptor_v2())
  {
    uint64_t v6 = (id)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [NSString stringWithUTF8String:v5];
      *(_DWORD *)buf = 136315394;
      uint64_t v35 = "-[CSFMil2bnnsComputeBackend _fetchTensorPropertiesForName:]";
      __int16 v36 = 2112;
      uint64_t v37 = v7;
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s Failed to get desc for tensor %@", buf, 0x16u);
    }
LABEL_19:
    uint64_t v11 = 0;
    goto LABEL_20;
  }
  if (*((void *)&v26 + 1) != 1)
  {
    uint64_t v6 = (id)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = [NSString stringWithUTF8String:v5];
      *(_DWORD *)buf = 136315394;
      uint64_t v35 = "-[CSFMil2bnnsComputeBackend _fetchTensorPropertiesForName:]";
      __int16 v36 = 2112;
      uint64_t v37 = v12;
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s Stride not supported for tensor %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  v21[8] = v30;
  v21[9] = v31;
  v21[10] = v32;
  v21[4] = v26;
  v21[5] = v27;
  v21[6] = v28;
  v21[7] = v29;
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  v21[3] = v25;
  [(CSFMil2bnnsComputeBackend *)self _getShapeFromTensorDesc:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![*(id *)(*((void *)&v17 + 1) + 8 * i) unsignedLongLongValue])
        {
          BOOL v13 = (id)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            long long v15 = [NSString stringWithUTF8String:v5];
            *(_DWORD *)buf = 136315394;
            uint64_t v35 = "-[CSFMil2bnnsComputeBackend _fetchTensorPropertiesForName:]";
            __int16 v36 = 2112;
            uint64_t v37 = v15;
            _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s Shape not set for tensor %@", buf, 0x16u);
          }
          goto LABEL_19;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v33 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v16[8] = v30;
  v16[9] = v31;
  v16[10] = v32;
  v16[4] = v26;
  v16[5] = v27;
  v16[6] = v28;
  v16[7] = v29;
  v16[0] = v22;
  v16[1] = v23;
  v16[2] = v24;
  v16[3] = v25;
  uint64_t v11 = +[CSFTensorProperties propertyWithShape:v6 dataType:[(CSFMil2bnnsComputeBackend *)self _getDataTypeFromTensorDesc:v16]];
LABEL_20:

  return v11;
}

- (unint64_t)_getDataTypeFromTensorDesc:(id *)a3
{
  unsigned int var5 = a3->var5;
  if (var5 == 65568) {
    return 1;
  }
  else {
    return 2 * (var5 != 131104);
  }
}

- (id)_getShapeFromTensorDesc:(id *)a3
{
  uint64_t Rank = BNNSDataLayoutGetRank();
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (Rank)
  {
    var2 = a3->var2;
    do
    {
      uint64_t v7 = *var2++;
      uint64_t v8 = [NSNumber numberWithUnsignedLong:v7];
      [v5 addObject:v8];

      --Rank;
    }
    while (Rank);
  }
  return v5;
}

- (void)_pointBnnsIrToWeights:(id)a3 errOut:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 getWeightData];
  [v5 weightSize];
  int v6 = BNNSGraphContextSetWeights();
  if (a4 && v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    uint64_t v8 = [NSString stringWithFormat:@"Cannot set weight for graph context"];
    v11[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a4 = [v7 errorWithDomain:@"com.apple.corespeech" code:2454 userInfo:v9];
  }
}

- (void)_graphInitWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self->_graphIsMapped = 0;
  self->_graphContext = 0u;
  self->_graph = 0u;
  id v13 = 0;
  [(CSFMil2bnnsComputeBackend *)self _loadGraph:&v13];
  id v5 = v13;
  if (v5)
  {
    int v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      bnnsIrPath = self->_bnnsIrPath;
      *(_DWORD *)buf = 136315650;
      long long v17 = "-[CSFMil2bnnsComputeBackend _graphInitWithError:]";
      __int16 v18 = 2112;
      long long v19 = bnnsIrPath;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Error loading mil2bnns graph for bnnsir file: %@ with error: %@", buf, 0x20u);
    }
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    BOOL v8 = [(CSFMil2bnnsComputeBackend *)self _populateModelInterfaceParameters];
    if (a3) {
      char v9 = v8;
    }
    else {
      char v9 = 1;
    }
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      uint64_t v11 = [NSString stringWithFormat:@"Unable to read tensor descriptors"];
      long long v15 = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      *a3 = [v10 errorWithDomain:@"com.apple.corespeech" code:2457 userInfo:v12];
    }
  }
}

- (id)getExpectedOutputTensors
{
  return self->_bnnsIrOutputTensorsProperty;
}

- (id)getExpectedInputTensors
{
  return self->_bnnsIrInputTensorsProperty;
}

- (id)predictOutputWithInputs:(id)a3 errOut:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 count];
  if (v7 == [(NSDictionary *)self->_bnnsIrInputTensorsProperty count])
  {
    id v20 = 0;
    id v8 = [(CSFMil2bnnsComputeBackend *)self _runWithMil2bnnsDataInputBuff:v6 error:&v20];
    id v9 = v20;
    if (v9)
    {
      id v10 = v9;
      if (a4)
      {
        id v10 = v9;
        *a4 = v10;
        uint64_t v11 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          bnnsIrPath = self->_bnnsIrPath;
          *(_DWORD *)buf = 136315650;
          long long v24 = "-[CSFMil2bnnsComputeBackend predictOutputWithInputs:errOut:]";
          __int16 v25 = 2112;
          long long v26 = bnnsIrPath;
          __int16 v27 = 2112;
          id v28 = v10;
          _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s bnnsIr %@ model execution with error: %@", buf, 0x20u);
        }
      }
LABEL_14:
      uint64_t v14 = 0;
      goto LABEL_15;
    }
    uint64_t v15 = [v8 count];
    if (v15 != [(NSDictionary *)self->_bnnsIrOutputTensorsProperty count])
    {
      if (a4)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F28568];
        long long v17 = [NSString stringWithFormat:@"config output count does not match with given inputs count"];
        uint64_t v22 = v17;
        __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        *a4 = [v16 errorWithDomain:@"com.apple.corespeech" code:2411 userInfo:v18];
      }
      id v10 = 0;
      goto LABEL_14;
    }
    id v8 = v8;
    id v10 = 0;
    uint64_t v14 = v8;
  }
  else
  {
    if (!a4)
    {
      uint64_t v14 = 0;
      goto LABEL_16;
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithFormat:@"config input count does not match with given inputs count"];
    v30[0] = v10;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    [v13 errorWithDomain:@"com.apple.corespeech" code:2410 userInfo:v8];
    uint64_t v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

LABEL_16:
  return v14;
}

- (CSFMil2bnnsComputeBackend)initWithBnnsIrFile:(id)a3 weightPath:(id)a4 errOut:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CSFMil2bnnsComputeBackend;
  uint64_t v11 = [(CSFMil2bnnsComputeBackend *)&v26 init];
  v12 = v11;
  if (v11)
  {
    milPath = v11->_milPath;
    v11->_milPath = 0;

    objc_storeStrong((id *)&v12->_bnnsIrPath, a3);
    funcName = v12->_funcName;
    v12->_funcName = (NSString *)@"main";

    if (v10)
    {
      id v25 = 0;
      uint64_t v15 = [[bnnsIrMappedWeight alloc] initWithWeightFile:v10 errOut:&v25];
      id v16 = v25;
      weight = v12->_weight;
      v12->_weight = v15;

      if (!v12->_weight || v16)
      {
        uint64_t v22 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          id v28 = "-[CSFMil2bnnsComputeBackend initWithBnnsIrFile:weightPath:errOut:]";
          __int16 v29 = 2112;
          id v30 = v10;
          __int16 v31 = 2112;
          id v32 = v16;
          _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s weight init with: %@ failed with error: %@", buf, 0x20u);
        }
        if (a5) {
          *a5 = v16;
        }

        goto LABEL_17;
      }
    }
    id v24 = 0;
    [(CSFMil2bnnsComputeBackend *)v12 _graphInitWithError:&v24];
    id v18 = v24;
    if (v18)
    {
      long long v19 = v18;
      if (a5) {
        *a5 = v18;
      }
      id v20 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v28 = "-[CSFMil2bnnsComputeBackend initWithBnnsIrFile:weightPath:errOut:]";
        __int16 v29 = 2112;
        id v30 = v9;
        __int16 v31 = 2112;
        id v32 = v19;
        _os_log_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_DEFAULT, "%s model init with bnnsIrFile: %@ failed with error: %@", buf, 0x20u);
      }

LABEL_17:
      uint64_t v21 = 0;
      goto LABEL_18;
    }
  }
  uint64_t v21 = v12;
LABEL_18:

  return v21;
}

- (CSFMil2bnnsComputeBackend)initWithModelFile:(id)a3 bnnsIrPath:(id)a4 errOut:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CSFMil2bnnsComputeBackend;
  uint64_t v11 = [(CSFMil2bnnsComputeBackend *)&v26 init];
  if (!v11) {
    goto LABEL_14;
  }
  v12 = [v9 stringByAppendingPathExtension:@"config.json"];
  objc_storeStrong((id *)&v11->_milPath, a3);
  objc_storeStrong((id *)&v11->_bnnsIrPath, a4);
  id v25 = 0;
  id v13 = [[CSFMil2bnnsCompilationConfig alloc] initWithConfigPath:v12 errOut:&v25];
  id v14 = v25;
  modelCompilationConfig = v11->_modelCompilationConfig;
  v11->_modelCompilationConfig = v13;

  id v16 = v11->_modelCompilationConfig;
  if (!v16)
  {
    if (a5) {
      *a5 = v14;
    }

    goto LABEL_12;
  }
  uint64_t v17 = [(CSFMil2bnnsCompilationConfig *)v16 funcName];
  funcName = v11->_funcName;
  v11->_funcName = (NSString *)v17;

  id v24 = 0;
  [(CSFMil2bnnsComputeBackend *)v11 _graphInitWithError:&v24];
  id v19 = v24;
  if (!v19)
  {

LABEL_14:
    uint64_t v22 = v11;
    goto LABEL_15;
  }
  id v20 = v19;
  if (a5) {
    *a5 = v19;
  }
  uint64_t v21 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v28 = "-[CSFMil2bnnsComputeBackend initWithModelFile:bnnsIrPath:errOut:]";
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v20;
    _os_log_impl(&dword_1BA1A5000, v21, OS_LOG_TYPE_DEFAULT, "%s model init with bnnsIrFile: %@ failed with error: %@", buf, 0x20u);
  }

LABEL_12:
  uint64_t v22 = 0;
LABEL_15:

  return v22;
}

- (CSFMil2bnnsComputeBackend)initWithModelFile:(id)a3 errOut:(id *)a4
{
  return [(CSFMil2bnnsComputeBackend *)self initWithModelFile:a3 bnnsIrPath:0 errOut:a4];
}

+ ($3265B292A9BE2BE95187D95CCBA22C14)_compileWithMilFile:(id)a3 bnnsIrPath:(id)a4 separateWeight:(id)a5 compilationConfig:(id)a6 isBnnsIrMapped:(BOOL *)a7 errOut:(id *)a8
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v12 = a4;
  id v34 = a5;
  id v13 = a6;
  if (a7) {
    *a7 = 0;
  }
  id v33 = v12;
  BNNSGraphCompileOptionsMakeDefault();
  [v13 singleThread];
  BNNSGraphCompileOptionsSetTargetSingleThread();
  [v13 debugInfo];
  BNNSGraphCompileOptionsSetGenerateDebugInfo();
  [v13 predefinedOptimizations];
  BNNSGraphCompileOptionsSetPredefinedOptimizations();
  if ([v13 optimizeForSize]) {
    BNNSGraphCompileOptionsSetOptimizationPreference();
  }
  if (v12)
  {
    id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v15 = [v12 stringByDeletingLastPathComponent];
    if (([v14 fileExistsAtPath:v15] & 1) == 0)
    {
      id v36 = 0;
      [v14 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v36];
      id v16 = v36;
      if (v16)
      {
        id v17 = v16;
        if (a8)
        {
          id v17 = v16;
          uint64_t v18 = 0;
          unint64_t v19 = 0;
          *a8 = v17;
LABEL_28:

          goto LABEL_29;
        }
LABEL_27:
        uint64_t v18 = 0;
        unint64_t v19 = 0;
        goto LABEL_28;
      }
    }
    BNNSGraphCompileOptionsSetFileWriteFSyncBarrier();
    id v20 = v12;
    [v20 UTF8String];
    BNNSGraphCompileOptionsSetOutputPathWithPermissionsAndProtectionClass();
    if (v34)
    {
      uint64_t v21 = [v34 stringByDeletingLastPathComponent];
      if (([v14 fileExistsAtPath:v21] & 1) == 0)
      {
        id v35 = 0;
        [v14 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v35];
        id v22 = v35;
        if (v22)
        {
          id v17 = v22;
          if (a8) {
            *a8 = v22;
          }

          goto LABEL_27;
        }
      }
      [v34 UTF8String];
      BNNSGraphCompileOptionsSetWeightsPathWithPermissions();
    }
    [v32 UTF8String];
    id v24 = [v13 funcName];
    [v24 UTF8String];
    uint64_t v18 = BNNSGraphCompileFromFile_v2();
    unint64_t v19 = v25;

    BNNSGraphCompileOptionsDestroy();
    if (v18)
    {
      if (a7) {
        *a7 = 1;
      }
      +[CSFMil2bnnsComputeBackend markPurgeableWithBnnsIrFile:v20];
      id v17 = 0;
      goto LABEL_28;
    }
    if (a8)
    {
      objc_super v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      __int16 v27 = [NSString stringWithFormat:@"graph data nil"];
      uint64_t v38 = v27;
      id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      *a8 = [v26 errorWithDomain:@"com.apple.corespeech" code:2260 userInfo:v28];
    }
    id v17 = 0;
    goto LABEL_27;
  }
  if (a8)
  {
    long long v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"bnnsIrPath nil"];
    v40[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    [v23 errorWithDomain:@"com.apple.corespeech" code:2258 userInfo:v15];
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v18 = 0;
  unint64_t v19 = 0;
LABEL_30:

  __int16 v29 = (void *)v18;
  unint64_t v30 = v19;
  result.var1 = v30;
  result.var0 = v29;
  return result;
}

+ (void)markPurgeableWithBnnsIrFile:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v5 = [v4 fileExistsAtPath:v3];

    if (v5)
    {
      uint64_t v12 = 67589;
      id v6 = v3;
      int v7 = fsctl((const char *)[v6 UTF8String], 0xC0084A44uLL, &v12, 0);
      id v8 = CSLogContextFacilityCoreSpeech;
      if (v7)
      {
        id v9 = (id)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = __error();
          uint64_t v11 = strerror(*v10);
          *(_DWORD *)buf = 136315650;
          id v14 = "+[CSFMil2bnnsComputeBackend markPurgeableWithBnnsIrFile:]";
          __int16 v15 = 2112;
          id v16 = v6;
          __int16 v17 = 2080;
          uint64_t v18 = v11;
          _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s Fail to mark bnnsIrFile: %@ as purgeable: error: %s", buf, 0x20u);
        }
      }
      else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v14 = "+[CSFMil2bnnsComputeBackend markPurgeableWithBnnsIrFile:]";
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Mark bnnsIrFile: %@ as purgeable is successful!", buf, 0x16u);
      }
    }
  }
}

+ (id)compileWithMilFile:(id)a3 bnnsIrPath:(id)a4 separateWeight:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 stringByAppendingPathExtension:@"config.json"];
  id v22 = 0;
  uint64_t v11 = [[CSFMil2bnnsCompilationConfig alloc] initWithConfigPath:v10 errOut:&v22];
  id v12 = v22;
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    char v21 = 0;
    id v20 = 0;
    id v14 = (void *)+[CSFMil2bnnsComputeBackend _compileWithMilFile:v7 bnnsIrPath:v8 separateWeight:v9 compilationConfig:v11 isBnnsIrMapped:&v21 errOut:&v20];
    size_t v16 = v15;
    id v17 = v20;
    if (v21)
    {
      if (v14 != (void *)-1) {
        munmap(v14, v16);
      }
    }
    else if (v14)
    {
      free(v14);
    }
    id v13 = v17;
  }
  uint64_t v18 = v13;

  return v18;
}

@end