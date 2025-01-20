@interface ADNetworkProvider
+ (BOOL)getAndVerifySizesFromConfig:(id)a3 inDictionary:(id)a4 forKey:(id)a5 sizes:(id)a6 layout:(unint64_t *)a7;
+ (id)getAlternativePathForNetwork:(id)a3;
+ (id)getConfigFolderForNetwork:(id)a3;
+ (id)getDefaultPathForNetwork:(id)a3 allowPrecompiledModel:(BOOL)a4;
+ (id)providerForNetwork:(id)a3;
+ (id)providerForNetwork:(id)a3 espressoEngine:(unint64_t)a4;
+ (id)providerForNetwork:(id)a3 requestedLayouts:(id)a4;
+ (id)providerForNetwork:(id)a3 requestedLayouts:(id)a4 espressoEngine:(unint64_t)a5;
+ (id)supportedSizesForSizesDict:(id)a3 key:(id)a4 expectedPixelFormat:(unsigned int)a5;
+ (void)updateSizeForItem:(id)a3 fromShape:(id)a4 forLayout:(unint64_t)a5 target:(id)a6;
- (ADConfidenceLevelRanges)confidenceLevelRanges;
- (ADNetworkProvider)initWithNetwork:(id)a3 requestedLayouts:(id)a4 espressoEngine:(unint64_t)a5;
- (BOOL)processConfig:(id)a3 inDictionary:(id)a4 forLayout:(unint64_t)a5;
- (NSDictionary)layoutNamesDict;
- (NSURL)url;
- (id)bufferNameForInputType:(id)a3;
- (id)bufferNameForOutputType:(id)a3;
- (id)bufferNameForType:(id)a3 isInput:(BOOL)a4;
- (id)descriptorForBuffer:(id)a3 isInput:(BOOL)a4 pixelFormat:(unsigned int)a5;
- (id)descriptorForBufferOfType:(id)a3 isInput:(BOOL)a4 pixelFormat:(unsigned int)a5;
- (id)generateLayoutNamesDictForFunction:(id)a3;
- (id)layoutNamesDictForFunction:(id)a3;
- (id)metadataForKey:(id)a3;
- (id)supportedSizesForInput:(id)a3 expectedPixelFormat:(unsigned int)a4;
- (id)supportedSizesForOutput:(id)a3 expectedPixelFormat:(unsigned int)a4;
@end

@implementation ADNetworkProvider

- (id)descriptorForBufferOfType:(id)a3 isInput:(BOOL)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  v8 = -[ADNetworkProvider bufferNameForType:isInput:](self, "bufferNameForType:isInput:", a3);
  v9 = [(ADNetworkProvider *)self descriptorForBuffer:v8 isInput:v6 pixelFormat:v5];

  return v9;
}

- (id)descriptorForBuffer:(id)a3 isInput:(BOOL)a4 pixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    v9 = (void *)MEMORY[0x263F26C70];
    if (v6) {
      [(ADNetworkProvider *)self supportedSizesForInput:v8 expectedPixelFormat:v5];
    }
    else {
    v11 = [(ADNetworkProvider *)self supportedSizesForOutput:v8 expectedPixelFormat:v5];
    }
    v12 = [v9 descriptorForSupportedSizes:v11 pixelFormat:v5];

    v10 = [MEMORY[0x263F26C50] descriptorWithName:v8 imageDescriptor:v12 isInput:v6];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bufferNameForType:(id)a3 isInput:(BOOL)a4
{
  uint64_t v4 = 32;
  if (a4) {
    uint64_t v4 = 24;
  }
  uint64_t v5 = [*(id *)((char *)&self->super.isa + v4) objectForKeyedSubscript:a3];
  return v5;
}

- (id)supportedSizesForInput:(id)a3 expectedPixelFormat:(unsigned int)a4
{
  uint64_t v4 = +[ADNetworkProvider supportedSizesForSizesDict:self->_sizesForInput key:a3 expectedPixelFormat:*(void *)&a4];
  return v4;
}

- (id)supportedSizesForOutput:(id)a3 expectedPixelFormat:(unsigned int)a4
{
  uint64_t v4 = +[ADNetworkProvider supportedSizesForSizesDict:self->_sizesForOutput key:a3 expectedPixelFormat:*(void *)&a4];
  return v4;
}

- (ADNetworkProvider)initWithNetwork:(id)a3 requestedLayouts:(id)a4 espressoEngine:(unint64_t)a5
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  double v125 = COERCE_DOUBLE(a3);
  id v124 = a4;
  unsigned int v8 = [MEMORY[0x263F28048] hasANE];
  if (a5 - 3 < 2) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }
  if (!ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      double v148 = v125;
      __int16 v149 = 1024;
      LODWORD(v150) = v9;
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "creating network provider for %@. precompiled model allowed: %d", buf, 0x12u);
      if (v125 == 0.0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
LABEL_11:
    if (v125 == 0.0) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  *(_DWORD *)buf = 138412546;
  double v148 = v125;
  __int16 v149 = 1024;
  LODWORD(v150) = v9;
  _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "creating network provider for %@. precompiled model allowed: %d", buf, 0x12u);
  if (v125 == 0.0)
  {
LABEL_7:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unable to initialize network provider: nil network name", buf, 2u);
    }
    v10 = 0;
    goto LABEL_123;
  }
LABEL_12:
  unsigned int v119 = v9;
  v11 = (NSMutableDictionary *)objc_opt_new();
  inputBufferMap = self->_inputBufferMap;
  self->_inputBufferMap = v11;

  v13 = (NSMutableDictionary *)objc_opt_new();
  outputBufferMap = self->_outputBufferMap;
  self->_outputBufferMap = v13;

  v146.receiver = self;
  v146.super_class = (Class)ADNetworkProvider;
  v15 = [(ADNetworkProvider *)&v146 init];
  if (!v15) {
    goto LABEL_122;
  }
  v129 = v15;
  v122 = +[ADNetworkProvider getDefaultPathForNetwork:*(void *)&v125 allowPrecompiledModel:v9];
  v16 = +[ADNetworkProvider getAlternativePathForNetwork:*(void *)&v125];
  double v17 = [(NSString *)v122 stringByResolvingSymlinksInPath];

  double v121 = [v16 stringByResolvingSymlinksInPath];

  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    double v148 = v17;
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "found default network path: %@", buf, 0xCu);
  }
  else
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    double v148 = v17;
    _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "found default network path: %@", buf, 0xCu);
  }
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
LABEL_17:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v148 = v121;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "found alternative network path: %@", buf, 0xCu);
    }
    goto LABEL_22;
  }
LABEL_20:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    double v148 = v121;
    _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "found alternative network path: %@", buf, 0xCu);
  }
LABEL_22:
  id v18 = *(id *)&v17;
  v19 = v18;
  v123 = (NSString *)v18;
  if (v121 != 0.0)
  {
    *(double *)&v120 = COERCE_DOUBLE(*(id *)&v121);

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "--- WARNING: Using alternative network path, which is not inside AppleDepth framework ---", buf, 2u);
    }
    double v20 = v125;
    v21 = v129;
LABEL_27:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v148 = *(double *)&v120;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "found network path: %@", buf, 0xCu);
    }
    findNetworkSupportingFile(&cfstr_CompilationArg.isa, v120, *(NSString **)&v121, v123);
    v118 = (NSString *)objc_claimAutoreleasedReturnValue();
    v116 = findNetworkSupportingFile(&cfstr_ModelJson.isa, v120, *(NSString **)&v121, v123);
    uint64_t v22 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:");
    v117 = (void *)v22;
    if (!v22)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        double v148 = v20;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "could not find json file for requested model %{public}@", buf, 0xCu);
      }
      int v65 = 1;
LABEL_120:

      v15 = v129;
      if (v65)
      {
        v10 = 0;
        self = v129;
        goto LABEL_123;
      }
LABEL_122:
      self = v15;
      v10 = self;
      goto LABEL_123;
    }
    v23 = [MEMORY[0x263F08900] JSONObjectWithData:v22 options:0 error:0];
    v128 = v23;
    if (!v23)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "could not read network metadata ", buf, 2u);
      }
      int v65 = 1;
      goto LABEL_119;
    }
    objc_storeStrong((id *)&v21->_networkMetadata, v23);
    uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
    sizesForInput = v129->_sizesForInput;
    v129->_sizesForInput = (NSMutableDictionary *)v24;

    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    v26 = [v128 objectForKeyedSubscript:@"inputs"];
    obuint64_t j = [v26 allKeys];

    uint64_t v27 = [obj countByEnumeratingWithState:&v142 objects:v162 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v143;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v143 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v142 + 1) + 8 * i);
          v31 = [v128 objectForKeyedSubscript:@"inputs"];
          v32 = [v31 objectForKeyedSubscript:v30];

          v33 = [v32 objectForKeyedSubscript:@"DType"];
          if (v33) {
            [(NSMutableDictionary *)v129->_inputBufferMap setObject:v30 forKeyedSubscript:v33];
          }
          v34 = [v32 objectForKeyedSubscript:@"Shape"];
          +[ADNetworkProvider updateSizeForItem:v30 fromShape:v34 forLayout:255 target:v129->_sizesForInput];
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v142 objects:v162 count:16];
      }
      while (v27);
    }

    uint64_t v35 = [MEMORY[0x263EFF9A0] dictionary];
    sizesForOutput = v129->_sizesForOutput;
    v129->_sizesForOutput = (NSMutableDictionary *)v35;

    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    v37 = [v128 objectForKeyedSubscript:@"outputs"];
    id obja = [v37 allKeys];

    uint64_t v38 = [obja countByEnumeratingWithState:&v138 objects:v161 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v139;
      do
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v139 != v39) {
            objc_enumerationMutation(obja);
          }
          uint64_t v41 = *(void *)(*((void *)&v138 + 1) + 8 * j);
          v42 = [v128 objectForKeyedSubscript:@"outputs"];
          v43 = [v42 objectForKeyedSubscript:v41];

          v44 = [v43 objectForKeyedSubscript:@"DType"];
          v45 = v44;
          if (v44)
          {
            char v46 = [(__CFString *)v44 isEqualToString:kADEspressoBufferIDAleatoricUncertainty];
            v47 = kADEspressoBufferIDConfidence;
            if (v46) {
              goto LABEL_52;
            }
            char v48 = [(__CFString *)v45 isEqualToString:kADEspressoBufferIDSTDUncertainty];
            v47 = kADEspressoBufferIDConfidence;
            if (v48) {
              goto LABEL_52;
            }
            char v49 = [(__CFString *)v45 isEqualToString:kADEspressoBufferIDLogarithmicVariance];
            v47 = kADEspressoBufferIDConfidence;
            if ((v49 & 1) != 0
              || (char v50 = [(__CFString *)v45 isEqualToString:kADEspressoBufferIDAuxiliaryAleatoricUncertainty], v47 = kADEspressoBufferIDAuxiliaryConfidence, (v50 & 1) != 0)|| (v51 = [(__CFString *)v45 isEqualToString:kADEspressoBufferIDAuxiliaryLogarithmicVariance], v47 = kADEspressoBufferIDAuxiliaryConfidence, (v51 & 1) != 0)|| (v52 = [(__CFString *)v45 isEqualToString:kADEspressoBufferIDAuxiliarySTDUncertainty], v47 = kADEspressoBufferIDAuxiliaryConfidence, v52))
            {
LABEL_52:
              v53 = *v47;

              v45 = v53;
            }
            [(NSMutableDictionary *)v129->_outputBufferMap setObject:v41 forKeyedSubscript:v45];
          }
          v54 = [v43 objectForKeyedSubscript:@"Shape"];
          +[ADNetworkProvider updateSizeForItem:v41 fromShape:v54 forLayout:255 target:v129->_sizesForOutput];
        }
        uint64_t v38 = [obja countByEnumeratingWithState:&v138 objects:v161 count:16];
      }
      while (v38);
    }

    v55 = +[ADNetworkProvider getConfigFolderForNetwork:*(void *)&v125];
    v56 = [v55 stringByAppendingString:@"__precompiled"];

    v57 = NSURL;
    v58 = bundleE5mlIfNeeded(v120, v56, v118, v119);
    uint64_t v59 = [v57 URLWithString:v58];
    url = v129->_url;
    v129->_url = (NSURL *)v59;

    v61 = v129->_url;
    if (!v61)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "could not compile network as requested", buf, 2u);
      }
LABEL_113:
      int v65 = 1;
      goto LABEL_118;
    }
    v62 = v129;
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_61;
      }
      double v63 = [(NSURL *)v61 absoluteString];
      *(_DWORD *)buf = 138412290;
      double v148 = v63;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "chosen network path: %@", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_75;
      }
      double v114 = [(NSURL *)v61 absoluteString];
      *(_DWORD *)buf = 138412290;
      double v148 = v114;
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "chosen network path: %@", buf, 0xCu);
    }
    v62 = v129;
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
LABEL_61:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        double v64 = *(double *)&v62->_inputBufferMap;
        *(_DWORD *)buf = 138412290;
        double v148 = v64;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "network input map: %@", buf, 0xCu);
      }
      goto LABEL_77;
    }
LABEL_75:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      double v100 = *(double *)&v62->_inputBufferMap;
      *(_DWORD *)buf = 138412290;
      double v148 = v100;
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "network input map: %@", buf, 0xCu);
    }
LABEL_77:
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        double v66 = *(double *)&v62->_outputBufferMap;
        *(_DWORD *)buf = 138412290;
        double v148 = v66;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "network output map: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      double v115 = *(double *)&v62->_outputBufferMap;
      *(_DWORD *)buf = 138412290;
      double v148 = v115;
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "network output map: %@", buf, 0xCu);
    }
    uint64_t v67 = objc_opt_new();
    layoutNamesDict = v62->_layoutNamesDict;
    v62->_layoutNamesDict = (NSDictionary *)v67;

    if (v124)
    {
      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      id v69 = v124;
      v70 = v129;
      uint64_t v71 = [v69 countByEnumeratingWithState:&v134 objects:v160 count:16];
      if (v71)
      {
        uint64_t v72 = *(void *)v135;
        while (2)
        {
          for (uint64_t k = 0; k != v71; ++k)
          {
            if (*(void *)v135 != v72) {
              objc_enumerationMutation(v69);
            }
            v74 = *(void **)(*((void *)&v134 + 1) + 8 * k);
            v75 = [v69 objectForKeyedSubscript:v74];
            LOBYTE(v74) = -[ADNetworkProvider processConfig:inDictionary:forLayout:](v70, "processConfig:inDictionary:forLayout:", v75, v128, [v74 integerValue]);

            if ((v74 & 1) == 0)
            {

              goto LABEL_113;
            }
            v70 = v129;
          }
          uint64_t v71 = [v69 countByEnumeratingWithState:&v134 objects:v160 count:16];
          if (v71) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      v76 = [v128 objectForKeyedSubscript:@"configurations"];
      id v69 = [v76 allKeys];

      uint64_t v77 = [v69 countByEnumeratingWithState:&v130 objects:v159 count:16];
      if (v77)
      {
        uint64_t v78 = *(void *)v131;
        while (2)
        {
          for (uint64_t m = 0; m != v77; ++m)
          {
            if (*(void *)v131 != v78) {
              objc_enumerationMutation(v69);
            }
            if (![(ADNetworkProvider *)v129 processConfig:*(void *)(*((void *)&v130 + 1) + 8 * m) inDictionary:v128 forLayout:254])
            {

              goto LABEL_113;
            }
          }
          uint64_t v77 = [v69 countByEnumeratingWithState:&v130 objects:v159 count:16];
          if (v77) {
            continue;
          }
          break;
        }
      }
    }

    v80 = [v128 objectForKeyedSubscript:@"confidence_thresholds_for_bucketing"];
    if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      int v65 = 0;
      confidenceLevelRanges = v129->_confidenceLevelRanges;
      v129->_confidenceLevelRanges = 0;
LABEL_117:

LABEL_118:
LABEL_119:

      goto LABEL_120;
    }
    confidenceLevelRanges = v80;
    v82 = [(ADConfidenceLevelRanges *)confidenceLevelRanges objectForKeyedSubscript:@"low"];
    if (!v82
      || ([(ADConfidenceLevelRanges *)confidenceLevelRanges objectForKeyedSubscript:@"high"], v83 = objc_claimAutoreleasedReturnValue(), BOOL v84 = v83 == 0, v83, v82, v84))
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
LABEL_116:
        int v65 = 1;
        goto LABEL_117;
      }
      *(_WORD *)buf = 0;
      v97 = &_os_log_internal;
      v98 = "network provides confidence threshold suggestion but no high/low thresholds found";
    }
    else
    {
      v85 = [(ADConfidenceLevelRanges *)confidenceLevelRanges objectForKeyedSubscript:@"low"];
      [v85 floatValue];
      float v87 = v86;

      v88 = [(ADConfidenceLevelRanges *)confidenceLevelRanges objectForKeyedSubscript:@"high"];
      [v88 floatValue];
      float v90 = v89;

      if (v87 < 0.0 || v90 < 0.0)
      {
        LODWORD(v91) = 2139095040;
        LODWORD(v96) = -8388608;
        *(float *)&double v92 = v90;
        *(float *)&double v93 = v90;
        *(float *)&double v94 = v87;
        *(float *)&double v95 = v87;
        uint64_t v101 = +[ADConfidenceLevelRanges rangesForUnits:lowLevel:mediumLevel:highLevel:](ADConfidenceLevelRanges, "rangesForUnits:lowLevel:mediumLevel:highLevel:", 3, v91, v92, v93, v94, v95, v96);
        v102 = v129->_confidenceLevelRanges;
        v129->_confidenceLevelRanges = (ADConfidenceLevelRanges *)v101;

        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          [(ADConfidenceLevelRanges *)v129->_confidenceLevelRanges lowLevel];
          float v104 = v103;
          [(ADConfidenceLevelRanges *)v129->_confidenceLevelRanges lowLevel];
          float v106 = v105;
          [(ADConfidenceLevelRanges *)v129->_confidenceLevelRanges mediumLevel];
          float v108 = v107;
          [(ADConfidenceLevelRanges *)v129->_confidenceLevelRanges mediumLevel];
          float v110 = v109;
          [(ADConfidenceLevelRanges *)v129->_confidenceLevelRanges highLevel];
          float v112 = v111;
          [(ADConfidenceLevelRanges *)v129->_confidenceLevelRanges highLevel];
          *(_DWORD *)buf = 134219264;
          double v148 = v104;
          __int16 v149 = 2048;
          double v150 = v106;
          __int16 v151 = 2048;
          double v152 = v108;
          __int16 v153 = 2048;
          double v154 = v110;
          __int16 v155 = 2048;
          double v156 = v112;
          __int16 v157 = 2048;
          double v158 = v113;
          _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "network confidence threshold ranges: (%.3f,%.3f), (%.3f,%.3f), (%.3f,%.3f)", buf, 0x3Eu);
        }
        int v65 = 0;
        goto LABEL_117;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_116;
      }
      *(_WORD *)buf = 0;
      v97 = &_os_log_internal;
      v98 = "unable to support confidence threshold for non aleatoric uncertainty models";
    }
    _os_log_error_impl(&dword_215F16000, v97, OS_LOG_TYPE_ERROR, v98, buf, 2u);
    goto LABEL_116;
  }
  v120 = (NSString *)v18;
  double v20 = v125;
  v21 = v129;
  if (v18) {
    goto LABEL_27;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    double v148 = v125;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "could not find network files for requested model:%{public}@", buf, 0xCu);
  }
  v10 = 0;
  self = v129;
LABEL_123:

  return v10;
}

+ (BOOL)getAndVerifySizesFromConfig:(id)a3 inDictionary:(id)a4 forKey:(id)a5 sizes:(id)a6 layout:(unint64_t *)a7
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v47 = a6;
  v44 = v12;
  v45 = v11;
  v14 = [v12 objectForKeyedSubscript:v11];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v15 = [v14 objectForKeyedSubscript:v13];
  v16 = [v15 allKeys];

  obuint64_t j = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v56 count:16];
  uint64_t v43 = v17;
  if (v17)
  {
    char v18 = 0;
    uint64_t v19 = *(void *)v49;
    unint64_t v20 = v17;
    while (1)
    {
      if (*(void *)v49 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = **((void **)&v48 + 1);
      uint64_t v22 = [v14 objectForKeyedSubscript:v13];
      v23 = [v22 objectForKeyedSubscript:v21];
      uint64_t v24 = [v23 objectForKeyedSubscript:@"Shape"];

      v25 = [v24 objectAtIndexedSubscript:3];
      [v25 floatValue];
      float v27 = v26;
      uint64_t v28 = [v24 objectAtIndexedSubscript:2];
      [v28 floatValue];
      float v30 = v29;

      uint64_t v31 = *a7;
      if (*a7 == 254) {
        uint64_t v31 = objc_msgSend(MEMORY[0x263F26CA8], "layoutForSize:", v27, v30);
      }
      if (v18)
      {
        if (v31 != *a7) {
          goto LABEL_20;
        }
      }
      else
      {
        *a7 = v31;
      }
      +[ADNetworkProvider updateSizeForItem:fromShape:forLayout:target:](ADNetworkProvider, "updateSizeForItem:fromShape:forLayout:target:", v21, v24);

      if (v20 >= 2) {
        break;
      }
LABEL_18:
      unint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      char v18 = 1;
      if (!v20) {
        goto LABEL_24;
      }
    }
    uint64_t v32 = 1;
    while (1)
    {
      if (*(void *)v49 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v33 = *(void *)(*((void *)&v48 + 1) + 8 * v32);
      v34 = [v14 objectForKeyedSubscript:v13];
      uint64_t v35 = [v34 objectForKeyedSubscript:v33];
      uint64_t v24 = [v35 objectForKeyedSubscript:@"Shape"];

      v36 = [v24 objectAtIndexedSubscript:3];
      [v36 floatValue];
      float v38 = v37;
      uint64_t v39 = [v24 objectAtIndexedSubscript:2];
      [v39 floatValue];
      float v41 = v40;

      if (*a7 == 254 && objc_msgSend(MEMORY[0x263F26CA8], "layoutForSize:", v38, v41) != *a7) {
        break;
      }
      +[ADNetworkProvider updateSizeForItem:fromShape:forLayout:target:](ADNetworkProvider, "updateSizeForItem:fromShape:forLayout:target:", v33, v24);

      if (v20 == ++v32) {
        goto LABEL_18;
      }
    }
LABEL_20:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v53 = v13;
      __int16 v54 = 2112;
      v55 = v45;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Network %{public}@ dimensions are not the same layout for configuration: %@", buf, 0x16u);
    }

    char v18 = 0;
  }
  else
  {
    char v18 = 1;
  }
LABEL_24:

  return (v43 != 0) & v18;
}

+ (id)supportedSizesForSizesDict:(id)a3 key:(id)a4 expectedPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(PixelBufferUtils **)&a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v31 = a4;
  v7 = objc_opt_new();
  [v30 objectForKeyedSubscript:v31];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obunint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v12 = [v11 allValues];
        id v13 = [v12 firstObject];

        v14 = [v11 allKeys];
        v15 = [v14 firstObject];
        unsigned int v16 = [v15 unsignedIntValue];

        float v17 = 1.0;
        if ([v13 count] != 1)
        {
          char v18 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 2);
          [v18 floatValue];
          float v17 = v19;
        }
        unint64_t v20 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 1);
        [v20 floatValue];
        float v22 = v21;

        double v23 = v17;
        if (PixelBufferUtils::componentsPerPixelForPixelFormat(v5, 0) == 1
          && (unint64_t)PixelBufferUtils::planeCountForPixelFormat(v5) <= 1
          && (unint64_t)[v13 count] >= 3)
        {
          for (unint64_t j = 0; j < [v13 count] - 2; ++j)
          {
            v25 = [v13 objectAtIndexedSubscript:j];
            [v25 floatValue];
            float v27 = v26;

            double v23 = v23 * v27;
          }
        }
        uint64_t v28 = objc_msgSend(MEMORY[0x263F26C78], "createWithSize:andLayout:", v16, v22, v23);
        [v7 addObject:v28];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v8);
  }

  return v7;
}

+ (void)updateSizeForItem:(id)a3 fromShape:(id)a4 forLayout:(unint64_t)a5 target:(id)a6
{
  v18[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v11 objectForKeyedSubscript:v9];

  if (!v12)
  {
    id v13 = objc_opt_new();
    [v11 setObject:v13 forKeyedSubscript:v9];
  }
  v14 = [v11 objectForKeyedSubscript:v9];
  v15 = [NSNumber numberWithUnsignedInteger:a5];
  float v17 = v15;
  v18[0] = v10;
  unsigned int v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  [v14 addObject:v16];
}

- (BOOL)processConfig:(id)a3 inDictionary:(id)a4 forLayout:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v22 = a5;
  id v9 = [a4 objectForKeyedSubscript:@"configurations"];
  id v10 = [v9 objectForKey:v8];

  if (!v10)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v8;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "network does not have a configuration called %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v8;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "network supports layout for: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v8;
    _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "network supports layout for: %@", buf, 0xCu);
  }
  if (!+[ADNetworkProvider getAndVerifySizesFromConfig:inDictionary:forKey:sizes:layout:](ADNetworkProvider, "getAndVerifySizesFromConfig:inDictionary:forKey:sizes:layout:", v8, v9, @"inputs", self->_sizesForInput, &v22)|| !+[ADNetworkProvider getAndVerifySizesFromConfig:v8 inDictionary:v9 forKey:@"outputs" sizes:self->_sizesForOutput layout:&v22])
  {
LABEL_14:
    BOOL v18 = 0;
    goto LABEL_15;
  }
  layoutNamesDict = self->_layoutNamesDict;
  id v12 = [NSNumber numberWithUnsignedInteger:v22];
  id v13 = [(NSDictionary *)layoutNamesDict objectForKeyedSubscript:v12];
  LOBYTE(layoutNamesDict) = v13 == 0;

  if (layoutNamesDict)
  {
    unint64_t v20 = self->_layoutNamesDict;
    float v21 = [NSNumber numberWithUnsignedInteger:v22];
    [(NSDictionary *)v20 setObject:v8 forKeyedSubscript:v21];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    id v14 = [MEMORY[0x263F26CA8] layoutAsString:v22];
    v15 = self->_layoutNamesDict;
    unsigned int v16 = [NSNumber numberWithUnsignedInteger:v22];
    float v17 = [(NSDictionary *)v15 objectForKeyedSubscript:v16];
    *(_DWORD *)buf = 138543874;
    id v24 = v14;
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    uint64_t v28 = v17;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "multiple configurations defined for layout %{public}@ (found %{public}@, but only %{public}@ will be used)", buf, 0x20u);
  }
  BOOL v18 = 1;
LABEL_15:

  return v18;
}

+ (id)getAlternativePathForNetwork:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v14 = a3;
  v3 = +[ADNetworkProvider getConfigFolderForNetwork:](ADNetworkProvider, "getConfigFolderForNetwork:");
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_36;
  }
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      float v21 = v3;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "looking for configuration folder at: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    float v21 = v3;
    _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "looking for configuration folder at: %@", buf, 0xCu);
  }
  id v13 = [MEMORY[0x263F08850] defaultManager];
  if ([v13 fileExistsAtPath:v3])
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "configuration folder found", buf, 2u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "configuration folder found", buf, 2u);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [v13 contentsOfDirectoryAtPath:v3 error:0];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v4 = 0;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v10 = [v3 stringByAppendingPathComponent:v9];
          id v11 = [v9 pathExtension];
          if (([v11 isEqualToString:@"net"] & 1) != 0
            || ([v11 isEqualToString:@"bundle"] & 1) != 0
            || [v11 isEqualToString:@"mil"])
          {
            if (v4)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "model selection ambiguous: found multiple models in configuration folder", buf, 2u);
              }

              goto LABEL_34;
            }
            id v4 = v10;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }

      if (v4) {
        goto LABEL_35;
      }
    }
    else
    {
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "could not find required model file in configuration folder", buf, 2u);
    }
  }
LABEL_34:
  id v4 = 0;
LABEL_35:

LABEL_36:
  return v4;
}

+ (id)getConfigFolderForNetwork:(id)a3
{
  id v3 = a3;
  id v4 = +[ADDeviceConfiguration stringForKey:kADDeviceConfigurationKeyModelConfigurationFolder];
  uint64_t v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

- (id)metadataForKey:(id)a3
{
  id v4 = a3;
  networkMetadata = self->_networkMetadata;
  if (networkMetadata)
  {
    uint64_t v6 = [(NSDictionary *)networkMetadata objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)getDefaultPathForNetwork:(id)a3 allowPrecompiledModel:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = (NSString *)a3;
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = v6;
  if (v6)
  {
    if (!v4)
    {
      id v10 = 0;
      id v12 = 0;
      id v14 = 0;
      goto LABEL_39;
    }
    id v8 = NSString;
    id v9 = [v6 resourcePath];
    id v10 = [v8 stringWithFormat:@"%@/MLModels", v9];

    ADCommonUtils::runtimePlatformANEProductString(&buf);
    if ((v33 & 0x80u) == 0) {
      p_long long buf = &buf;
    }
    else {
      p_long long buf = (long long *)buf;
    }
    id v12 = [NSString stringWithFormat:@"%@-%s", v5, p_buf];
    id v13 = findModel(v10, v12);
    if (v13)
    {
      id v14 = v13;
      int v15 = 1;
LABEL_35:
      if (((char)v33 & 0x80000000) == 0)
      {
        if (!v15) {
          goto LABEL_39;
        }
LABEL_45:

        goto LABEL_46;
      }
      operator delete((void *)buf);
      if (v15) {
        goto LABEL_45;
      }
LABEL_39:
      id v24 = NSString;
      __int16 v25 = [v7 resourcePath];
      id v26 = [v24 stringWithFormat:@"%@/MLModels/NonPrecompiled", v25];

      __int16 v27 = findModel(v26, v5);

      if (v27)
      {
        id v14 = v27;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v5;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not find model for \"%{public}@\"", (uint8_t *)&buf, 0xCu);
        }
        id v14 = 0;
      }
      id v10 = v26;
      goto LABEL_45;
    }
    ADCommonUtils::runtimePlatformANEVersionString(&__p);
    if ((v31 & 0x80u) == 0) {
      size_t v16 = v31;
    }
    else {
      size_t v16 = __n;
    }
    uint64_t v17 = v33;
    if ((v33 & 0x80u) != 0) {
      uint64_t v17 = *((void *)&buf + 1);
    }
    if (v16 != v17) {
      goto LABEL_27;
    }
    if ((v33 & 0x80u) == 0) {
      long long v18 = (unsigned __int8 *)&buf;
    }
    else {
      long long v18 = (unsigned __int8 *)buf;
    }
    if ((v31 & 0x80) != 0)
    {
      float v21 = __p;
      if (memcmp(__p, v18, __n))
      {
LABEL_30:
        uint64_t v22 = [NSString stringWithFormat:@"%@-%s", v5, v21];

        double v23 = findModel(v10, v22);
        if (v23)
        {
          id v14 = v23;
          int v15 = 1;
        }
        else
        {
          int v15 = 0;
          id v14 = 0;
        }
        id v12 = v22;
        if (((char)v31 & 0x80000000) == 0) {
          goto LABEL_35;
        }
LABEL_34:
        operator delete(__p);
        goto LABEL_35;
      }
    }
    else if (v31)
    {
      p_p = &__p;
      uint64_t v20 = v31;
      while (*(unsigned __int8 *)p_p == *v18)
      {
        p_p = (void **)((char *)p_p + 1);
        ++v18;
        if (!--v20) {
          goto LABEL_50;
        }
      }
LABEL_27:
      if ((v31 & 0x80u) == 0) {
        float v21 = &__p;
      }
      else {
        float v21 = __p;
      }
      goto LABEL_30;
    }
LABEL_50:
    int v15 = 0;
    id v14 = 0;
    if (((char)v31 & 0x80000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed getting AppleDepth bundle", (uint8_t *)&buf, 2u);
  }
  id v14 = 0;
LABEL_46:

  return v14;
}

+ (id)providerForNetwork:(id)a3
{
  id v3 = +[ADNetworkProvider providerForNetwork:a3 requestedLayouts:0];
  return v3;
}

+ (id)providerForNetwork:(id)a3 requestedLayouts:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x263F28048] hasANE]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = +[ADNetworkProvider providerForNetwork:v5 requestedLayouts:v6 espressoEngine:v7];

  return v8;
}

+ (id)providerForNetwork:(id)a3 requestedLayouts:(id)a4 espressoEngine:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [[ADNetworkProvider alloc] initWithNetwork:v7 requestedLayouts:v8 espressoEngine:a5];

  return v9;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)layoutNamesDict
{
  return (NSDictionary *)[(ADNetworkProvider *)self generateLayoutNamesDictForFunction:0];
}

- (id)generateLayoutNamesDictForFunction:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v17 = a3;
  BOOL v4 = [(NSURL *)self->_url absoluteString];
  int v5 = [v4 hasSuffix:@".net"];

  if (v5)
  {
    if (v17)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Using functions/heads for v1 networks is not supported", buf, 2u);
      }
      id v6 = 0;
    }
    else
    {
      id v6 = self->_layoutNamesDict;
    }
  }
  else
  {
    id v6 = (NSDictionary *)objc_opt_new();
    layoutNamesDict = self->_layoutNamesDict;
    if (v17)
    {
      if ([(NSDictionary *)layoutNamesDict count])
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = [(NSDictionary *)self->_layoutNamesDict allKeys];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              id v13 = [(NSDictionary *)self->_layoutNamesDict objectForKeyedSubscript:v12];
              id v14 = [v17 stringByAppendingFormat:@"_%@", v13];
              [(NSDictionary *)v6 setObject:v14 forKeyedSubscript:v12];
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
          }
          while (v9);
        }
      }
      else
      {
        [(NSDictionary *)v6 setObject:v17 forKeyedSubscript:&unk_26C698358];
      }
    }
    else
    {
      int v15 = (NSDictionary *)[(NSDictionary *)layoutNamesDict mutableCopy];

      id v6 = v15;
      [(NSDictionary *)v15 setObject:@"main" forKeyedSubscript:&unk_26C698358];
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceLevelRanges, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_layoutNamesDict, 0);
  objc_storeStrong((id *)&self->_networkMetadata, 0);
  objc_storeStrong((id *)&self->_outputBufferMap, 0);
  objc_storeStrong((id *)&self->_inputBufferMap, 0);
  objc_storeStrong((id *)&self->_sizesForOutput, 0);
  objc_storeStrong((id *)&self->_sizesForInput, 0);
}

+ (id)providerForNetwork:(id)a3 espressoEngine:(unint64_t)a4
{
  BOOL v4 = +[ADNetworkProvider providerForNetwork:a3 requestedLayouts:0 espressoEngine:a4];
  return v4;
}

- (ADConfidenceLevelRanges)confidenceLevelRanges
{
  return self->_confidenceLevelRanges;
}

- (id)layoutNamesDictForFunction:(id)a3
{
  id v3 = [(ADNetworkProvider *)self generateLayoutNamesDictForFunction:a3];
  return v3;
}

- (id)bufferNameForOutputType:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_outputBufferMap objectForKeyedSubscript:a3];
  return v3;
}

- (id)bufferNameForInputType:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_inputBufferMap objectForKeyedSubscript:a3];
  return v3;
}

@end