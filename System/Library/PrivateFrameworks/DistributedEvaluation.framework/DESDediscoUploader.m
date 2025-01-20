@interface DESDediscoUploader
+ (BOOL)hasAllZeroData:(id)a3;
+ (BOOL)uploadViaDedisco:(id)a3 jsonResult:(id)a4 recipe:(id)a5 bundleIdentifier:(id)a6 submissionCount:(unsigned int *)a7 error:(id *)a8;
- (BOOL)donateCategoricalMetadata:(id)a3 dediscoMetadata:(id)a4 recorder:(id)a5;
- (BOOL)donateFedStatsMetrics:(id)a3 dataKey:(id)a4 dataTypeContent:(id)a5 dediscoMetadata:(id)a6 error:(id *)a7 recorder:(id)a8;
- (BOOL)donateMetrics:(id)a3 dediscoMetadata:(id)a4 recorder:(id)a5;
- (BOOL)scaleData:(id)a3 withScalingFactor:(double)a4;
- (DESDediscoKey)key;
- (DESDediscoUploader)initWithBundleIdentifier:(id)a3 recipe:(id)a4;
- (unsigned)donateResult:(id)a3 dediscoMetadata:(id)a4 recorder:(id)a5;
@end

@implementation DESDediscoUploader

+ (BOOL)uploadViaDedisco:(id)a3 jsonResult:(id)a4 recipe:(id)a5 bundleIdentifier:(id)a6 submissionCount:(unsigned int *)a7 error:(id *)a8
{
  v105[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v88 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = [[DESDediscoUploader alloc] initWithBundleIdentifier:v16 recipe:v15];
  if (v17)
  {
    id v82 = a1;
    uint64_t v102 = *MEMORY[0x1E4F5F4B8];
    v103 = &stru_1F19D9870;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    if (v14)
    {
      v19 = objc_alloc_init(DESDPFloatValueRecorder);
      unsigned int v20 = [(DESDediscoUploader *)v17 donateResult:v14 dediscoMetadata:v18 recorder:v19];
      if (a7) {
        *a7 += v20;
      }
      if (!v20)
      {
        id v83 = v15;
        v47 = a8;
        v48 = v18;
        v49 = NSString;
        v50 = [(DESDediscoUploader *)v17 key];
        v51 = [v50 resultsKeyString];
        uint64_t v52 = [v49 stringWithFormat:@"Failed to submit result to Dedisco for %@, skip metadata submission", v51];

        v53 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
        }

        v18 = v48;
        if (!v47)
        {
          BOOL v44 = 0;
          v21 = (void *)v52;
          id v15 = v83;
          goto LABEL_54;
        }
        v54 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v100 = *MEMORY[0x1E4F28588];
        uint64_t v101 = v52;
        v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        [v54 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2006 userInfo:v55];
        BOOL v44 = 0;
        id *v47 = (id)objc_claimAutoreleasedReturnValue();
        v21 = (void *)v52;
        id v15 = v83;
LABEL_53:

LABEL_54:
        goto LABEL_55;
      }
    }
    v81 = a8;
    id v91 = 0;
    v21 = +[DESFedStatsDataType extractFedStatsDataTypeFrom:v15 forKey:&v91];
    v22 = (DESDPFloatValueRecorder *)v91;
    v19 = v22;
    id v85 = v16;
    v86 = v18;
    if (v21 && v22)
    {
      v23 = objc_alloc_init(DESFedStatsRecorder);
      id v90 = 0;
      BOOL v24 = [(DESDediscoUploader *)v17 donateFedStatsMetrics:v88 dataKey:v19 dataTypeContent:v21 dediscoMetadata:v18 error:&v90 recorder:v23];
      id v87 = v90;
      v25 = [(DESDediscoUploader *)v17 key];
      v26 = [v25 metadataEncodedMetricsKeyString];

      v27 = +[DESLogging coreChannel];
      v28 = v27;
      if (!v24)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:].cold.5();
        }

        if (v81)
        {
          v80 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v98 = *MEMORY[0x1E4F28588];
          v57 = [v87 localizedDescription];
          v99 = v57;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
          id v58 = v15;
          v59 = v21;
          v61 = id v60 = v14;
          id *v81 = [v80 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2012 userInfo:v61];

          id v14 = v60;
          v21 = v59;
          id v15 = v58;
        }
        BOOL v44 = 0;
        goto LABEL_51;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v97 = v26;
        _os_log_impl(&dword_1BECCB000, v28, OS_LOG_TYPE_INFO, "Donated data for: %@ using FedStats encoding", buf, 0xCu);
      }

      id v16 = v85;
      if (a7) {
        ++*a7;
      }

      v18 = v86;
    }
    id v89 = 0;
    v23 = +[DESAggregatableMetadata encodeMetadata:v88 recipe:v15 error:&v89];
    id v87 = v89;
    if (!v23)
    {
      v56 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:](v17);
      }

      BOOL v44 = 0;
      if (v81)
      {
        id v87 = v87;
        id *v81 = v87;
      }
      goto LABEL_52;
    }
    id v79 = v14;
    v29 = [(DESFedStatsRecorder *)v23 objectForKeyedSubscript:@"encodedNumericMetadata"];
    if ([(DESDPBitValueRecorder *)v29 length])
    {
      v30 = [(DESFedStatsRecorder *)v23 objectForKeyedSubscript:@"encodedNumericMetadata"];
      char v31 = [v82 hasAllZeroData:v30];

      if (v31)
      {
LABEL_24:
        v29 = [(DESFedStatsRecorder *)v23 objectForKeyedSubscript:@"encodedCategoricalMetadata"];
        if (![(DESDPBitValueRecorder *)v29 length])
        {
LABEL_31:

          goto LABEL_32;
        }
        v37 = [(DESFedStatsRecorder *)v23 objectForKeyedSubscript:@"encodedCategoricalMetadata"];
        char v38 = [v82 hasAllZeroData:v37];

        if (v38)
        {
LABEL_32:
          BOOL v44 = 1;
          id v14 = v79;
LABEL_51:
          id v16 = v85;
          v18 = v86;
LABEL_52:

          v55 = v87;
          goto LABEL_53;
        }
        v29 = objc_alloc_init(DESDPBitValueRecorder);
        v39 = [(DESFedStatsRecorder *)v23 objectForKeyedSubscript:@"encodedCategoricalMetadata"];
        BOOL v40 = [(DESDediscoUploader *)v17 donateCategoricalMetadata:v39 dediscoMetadata:v86 recorder:v29];

        if (v40)
        {
          v41 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = [(DESDediscoUploader *)v17 key];
            v43 = [v42 metadataKeyString];
            *(_DWORD *)buf = 138412290;
            v97 = v43;
            _os_log_impl(&dword_1BECCB000, v41, OS_LOG_TYPE_INFO, "Donated categorical metadata for: %@", buf, 0xCu);
          }
          if (a7) {
            ++*a7;
          }
          goto LABEL_31;
        }
        id v84 = v15;
        v63 = v21;
        v74 = NSString;
        v75 = [(DESDediscoUploader *)v17 key];
        v76 = [v75 metadataKeyString];
        v67 = [v74 stringWithFormat:@"Failed to donate categorical metadata for: %@", v76];

        v77 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
        }

        v69 = v81;
        if (!v81)
        {
LABEL_68:

          BOOL v44 = 0;
          id v14 = v79;
          id v16 = v85;
          v18 = v86;
          v21 = v63;
          id v15 = v84;
          goto LABEL_52;
        }
        v70 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v92 = *MEMORY[0x1E4F28588];
        v93 = v67;
        v71 = (void *)MEMORY[0x1E4F1C9E8];
        v72 = &v93;
        v73 = &v92;
LABEL_67:
        v78 = [v71 dictionaryWithObjects:v72 forKeys:v73 count:1];
        id *v69 = [v70 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2006 userInfo:v78];

        goto LABEL_68;
      }
      v29 = objc_alloc_init(DESDPFloatValueRecorder);
      v32 = [(DESFedStatsRecorder *)v23 objectForKeyedSubscript:@"encodedNumericMetadata"];
      BOOL v33 = [(DESDediscoUploader *)v17 donateMetrics:v32 dediscoMetadata:v86 recorder:v29];

      if (!v33)
      {
        id v84 = v15;
        v63 = v21;
        v64 = NSString;
        v65 = [(DESDediscoUploader *)v17 key];
        v66 = [v65 metricsKeyString];
        v67 = [v64 stringWithFormat:@"Failed to donate aggregatable metrics for: %@", v66];

        v68 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
        }

        v69 = v81;
        if (!v81) {
          goto LABEL_68;
        }
        v70 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v94 = *MEMORY[0x1E4F28588];
        v95 = v67;
        v71 = (void *)MEMORY[0x1E4F1C9E8];
        v72 = &v95;
        v73 = &v94;
        goto LABEL_67;
      }
      v34 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = [(DESDediscoUploader *)v17 key];
        v36 = [v35 metricsKeyString];
        *(_DWORD *)buf = 138412290;
        v97 = v36;
        _os_log_impl(&dword_1BECCB000, v34, OS_LOG_TYPE_INFO, "Donated aggregatable metrics for: %@", buf, 0xCu);
      }
      if (a7) {
        ++*a7;
      }
    }

    goto LABEL_24;
  }
  v18 = [NSString stringWithFormat:@"Failed to create DESDediscoUploader for: %@", v16];
  v45 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
    +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
  }

  if (a8)
  {
    v46 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v104 = *MEMORY[0x1E4F28588];
    v105[0] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:&v104 count:1];
    [v46 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2006 userInfo:v19];
    BOOL v44 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:

    goto LABEL_56;
  }
  BOOL v44 = 0;
LABEL_56:

  return v44;
}

- (DESDediscoUploader)initWithBundleIdentifier:(id)a3 recipe:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DESDediscoUploader;
  v8 = [(DESDediscoUploader *)&v23 init];
  if (v8)
  {
    int v9 = DESIsInternalInstall();
    v10 = @"production";
    if (v9) {
      v10 = @"carry";
    }
    v11 = v10;
    v12 = [v7 privacyIdentifierExt];
    id v22 = v6;
    if (v12)
    {
      id v13 = [NSString stringWithFormat:@"%@.%@", v6, v12];
    }
    else
    {
      id v13 = v6;
    }
    id v14 = v13;
    id v15 = [v7 recipeUserInfo];
    id v16 = [v15 objectForKeyedSubscript:@"ramsayRecipeID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [v7 recipeUserInfo];
      v18 = [v17 objectForKeyedSubscript:@"ramsayRecipeID"];
    }
    else
    {
      v18 = [v7 recipeID];
    }

    v19 = [[DESDediscoKey alloc] initWithPrivacyID:v14 environment:v11 recipeID:v18];
    key = v8->_key;
    v8->_key = v19;

    objc_storeStrong((id *)&v8->_recipe, a4);
    id v6 = v22;
  }

  return v8;
}

- (unsigned)donateResult:(id)a3 dediscoMetadata:(id)a4 recorder:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = v9;
  id v66 = a5;
  v12 = [(DESDediscoUploader *)self key];
  id v13 = [v12 resultsKeyString];

  id v14 = [[DESGaussianAlgorithmParameters alloc] initWith:v13 recipe:self->_recipe];
  id v15 = v14;
  if (v14)
  {
    [(DESGaussianAlgorithmParameters *)v14 clippingBound];
    double v17 = v16;
    v18 = [v11 mutableCopy];
    v19 = [(DESRecipe *)self->_recipe federatedBufferDownScalingFactor];
    if (!v19)
    {
      v25 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[DESDediscoUploader donateResult:dediscoMetadata:recorder:](v25);
      }
      goto LABEL_46;
    }
    if ([(DESRecipe *)self->_recipe useSparsification])
    {
      unsigned int v20 = objc_alloc_init(DESSparsification);
      if (!v20)
      {
        v25 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[DESDediscoUploader donateResult:dediscoMetadata:recorder:](self);
        }
        goto LABEL_46;
      }
      v21 = v20;
      recipe = v10->_recipe;
      v65 = v10;
      objc_super v23 = [(DESDediscoUploader *)v10 key];
      id v72 = 0;
      v63 = v21;
      BOOL v24 = [(DESSparsification *)v21 splitResultToChunksWithResult:v8 recipe:recipe baseKey:v23 error:&v72];
      v25 = v72;

      if (v25)
      {
        v26 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.5(v65, v25);
        }

        goto LABEL_45;
      }
      if (![(DESGaussianAlgorithmParameters *)v15 calculateAndVerifyPerChunkClippingBoundsIn:v24 withOverallClippingBound:v17])
      {
LABEL_45:

        goto LABEL_46;
      }
      v59 = 0;
      id v60 = v13;
      id v61 = v11;
      id v62 = v8;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v35 = v24;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v68 objects:v79 count:16];
      if (!v36)
      {
        unsigned int v64 = 0;
        goto LABEL_50;
      }
      uint64_t v37 = v36;
      unsigned int v64 = 0;
      uint64_t v67 = *(void *)v69;
      char v38 = v65;
LABEL_30:
      uint64_t v39 = 0;
      while (1)
      {
        if (*(void *)v69 != v67) {
          objc_enumerationMutation(v35);
        }
        BOOL v40 = *(void **)(*((void *)&v68 + 1) + 8 * v39);
        v41 = objc_msgSend(v40, "clippingBound", v59, v60, v61, v62);
        [v41 doubleValue];
        double v43 = v42;

        [v19 doubleValue];
        double v45 = v43 * v44;
        -[DESGaussianAlgorithmParameters addPerChunkParametersWith:numChunks:](v15, "addPerChunkParametersWith:numChunks:", [v35 count], v43);
        v46 = [(DESGaussianAlgorithmParameters *)v15 parameters];
        [v18 setObject:v46 forKeyedSubscript:@"AlgorithmParameters"];

        v47 = [v40 data];
        BOOL v48 = [(DESDediscoUploader *)v38 scaleData:v47 withScalingFactor:v45];

        if (v48)
        {
          v49 = v19;
          v50 = v15;
          v51 = [v40 key];
          uint64_t v52 = [v40 data];
          v53 = v18;
          int v54 = [v66 record:v51 data:v52 metadata:v18];

          if (!v54)
          {
            v18 = v53;
            id v15 = v50;
            v19 = v49;
            char v38 = v65;
            goto LABEL_42;
          }
          ++v64;
          v55 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
            -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.4(v73, v40, &v74, v55);
          }
          v18 = v53;
          id v15 = v50;
          v19 = v49;
          char v38 = v65;
        }
        else
        {
          v55 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v56 = [NSNumber numberWithDouble:v45];
            v57 = [v40 key];
            *(_DWORD *)buf = 138412546;
            v76 = v56;
            __int16 v77 = 2112;
            v78 = v57;
            _os_log_error_impl(&dword_1BECCB000, v55, OS_LOG_TYPE_ERROR, "Failed to scale chunk data by %@, for key: %@", buf, 0x16u);
          }
        }

LABEL_42:
        if (v37 == ++v39)
        {
          uint64_t v37 = [v35 countByEnumeratingWithState:&v68 objects:v79 count:16];
          if (!v37)
          {
LABEL_50:

            id v11 = v61;
            id v8 = v62;
            v25 = v59;
            id v13 = v60;
            unsigned int v27 = v64;
            goto LABEL_47;
          }
          goto LABEL_30;
        }
      }
    }
    if ((unint64_t)[v8 length] >= 0xE7EF1)
    {
      v25 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.6(v8, self, v25);
      }
      goto LABEL_46;
    }
    [v19 doubleValue];
    double v29 = v17 * v28;
    [(DESGaussianAlgorithmParameters *)v15 addPerChunkParametersWith:1 numChunks:v17];
    v30 = [(DESGaussianAlgorithmParameters *)v15 parameters];
    [v18 setObject:v30 forKeyedSubscript:@"AlgorithmParameters"];

    v25 = [v8 mutableCopy];
    if (![(DESDediscoUploader *)self scaleData:v25 withScalingFactor:v29])
    {
      v34 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[DESDediscoUploader donateResult:dediscoMetadata:recorder:].cold.7(self);
      }

      goto LABEL_46;
    }
    if (![v66 record:v13 data:v25 metadata:v18])
    {
LABEL_46:
      unsigned int v27 = 0;
      goto LABEL_47;
    }
    char v31 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = [(DESDediscoUploader *)self key];
      BOOL v33 = [v32 resultsKeyString];
      *(_DWORD *)buf = 138412290;
      v76 = v33;
      _os_log_impl(&dword_1BECCB000, v31, OS_LOG_TYPE_INFO, "Donated result for key: %@", buf, 0xCu);
    }
    unsigned int v27 = 1;
LABEL_47:
  }
  else
  {
    v18 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[DESDediscoUploader donateResult:dediscoMetadata:recorder:](self);
    }
    unsigned int v27 = 0;
  }

  return v27;
}

- (BOOL)donateMetrics:(id)a3 dediscoMetadata:(id)a4 recorder:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DESDediscoUploader *)self key];
  v12 = [v11 metricsKeyString];

  LOBYTE(v11) = [v8 record:v12 data:v10 metadata:v9];
  return (char)v11;
}

- (BOOL)donateCategoricalMetadata:(id)a3 dediscoMetadata:(id)a4 recorder:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DESDediscoUploader *)self key];
  v12 = [v11 metadataKeyString];

  LOBYTE(v11) = [v8 record:v12 data:v10 metadata:v9];
  return (char)v11;
}

- (BOOL)donateFedStatsMetrics:(id)a3 dataKey:(id)a4 dataTypeContent:(id)a5 dediscoMetadata:(id)a6 error:(id *)a7 recorder:(id)a8
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v19 = [v14 valueForKeyPath:v15];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v21 = [(DESDediscoUploader *)self key];
    id v22 = [v21 metadataEncodedMetricsKeyString];

    objc_super v23 = [v14 valueForKeyPath:v15];
    char v24 = [v18 record:v22 data:v23 dataTypeContent:v16 metadata:v17 errorOut:a7];
  }
  else
  {
    v25 = [NSString stringWithFormat:@"Value of key %@ is not array type, cannot use FedStats Encoding", v15];
    v26 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[DESDediscoUploader uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:]();
    }

    if (a7)
    {
      unsigned int v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28588];
      v31[0] = v25;
      double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      *a7 = [v27 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2012 userInfo:v28];
    }
    char v24 = 0;
  }

  return v24;
}

- (BOOL)scaleData:(id)a3 withScalingFactor:(double)a4
{
  id v5 = a3;
  id v6 = v5;
  double v7 = fabs(a4);
  if (a4 <= 2.22507386e-308 || v7 == INFINITY)
  {
    BOOL v9 = 0;
  }
  else
  {
    id v10 = v5;
    uint64_t v11 = [v10 mutableBytes];
    if ((unint64_t)[v10 length] >= 4)
    {
      unint64_t v12 = 0;
      do
      {
        float v13 = *(float *)(v11 + 4 * v12) / a4;
        *(float *)(v11 + 4 * v12++) = v13;
      }
      while (v12 < (unint64_t)[v10 length] >> 2);
    }
    BOOL v9 = 1;
  }

  return v9;
}

+ (BOOL)hasAllZeroData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  if ((unint64_t)[v3 length] >= 4)
  {
    unint64_t v6 = 0;
    do
    {
      int v7 = *(_DWORD *)(v4 + 4 * v6);
      BOOL v5 = v7 == 0;
      if (v7) {
        break;
      }
      ++v6;
    }
    while (v6 < (unint64_t)[v3 length] >> 2);
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (DESDediscoKey)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_recipe, 0);
}

+ (void)uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

+ (void)uploadViaDedisco:(void *)a1 jsonResult:recipe:bundleIdentifier:submissionCount:error:.cold.2(void *a1)
{
  uint64_t v1 = [a1 key];
  uint64_t v2 = [v1 resultsKeyString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BECCB000, v3, v4, "Failed to encode metadata for: %@", v5, v6, v7, v8, v9);
}

+ (void)uploadViaDedisco:jsonResult:recipe:bundleIdentifier:submissionCount:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "Failed to submit for: %@ using FedStats encoding", v2, v3, v4, v5, v6);
}

- (void)donateResult:(void *)a1 dediscoMetadata:recorder:.cold.1(void *a1)
{
  uint64_t v1 = [a1 key];
  uint64_t v2 = [v1 resultsKeyString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BECCB000, v3, v4, "Failed to initialize privacy parameters for key: %@", v5, v6, v7, v8, v9);
}

- (void)donateResult:(os_log_t)log dediscoMetadata:recorder:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Failed to compute down-scaling factor or staleness is too large", v1, 2u);
}

- (void)donateResult:(void *)a1 dediscoMetadata:recorder:.cold.3(void *a1)
{
  uint64_t v1 = [a1 key];
  uint64_t v2 = [v1 resultsKeyString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BECCB000, v3, v4, "Failed to create DESSparsification to split large vectors for key: %@", v5, v6, v7, v8, v9);
}

- (void)donateResult:(void *)a3 dediscoMetadata:(NSObject *)a4 recorder:.cold.4(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 key];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1BECCB000, a4, OS_LOG_TYPE_DEBUG, "Donated result chunk for key: %@", a1, 0xCu);
}

- (void)donateResult:(void *)a1 dediscoMetadata:(void *)a2 recorder:.cold.5(void *a1, void *a2)
{
  uint64_t v3 = [a1 key];
  uint64_t v4 = [v3 resultsKeyString];
  uint64_t v11 = [a2 localizedDescription];
  OUTLINED_FUNCTION_3(&dword_1BECCB000, v5, v6, "Failed to split large vector to chunks for key: %@, %@", v7, v8, v9, v10, 2u);
}

- (void)donateResult:(void *)a1 dediscoMetadata:(void *)a2 recorder:(NSObject *)a3 .cold.6(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 length];
  uint64_t v6 = [a2 key];
  uint64_t v7 = [v6 resultsKeyString];
  int v8 = 134218498;
  uint64_t v9 = v5;
  __int16 v10 = 1024;
  int v11 = 950000;
  __int16 v12 = 2112;
  float v13 = v7;
  _os_log_error_impl(&dword_1BECCB000, a3, OS_LOG_TYPE_ERROR, "Result length %lu bytes is larger than limit %u but sparsification is not configured properly in recipe for key: %@", (uint8_t *)&v8, 0x1Cu);
}

- (void)donateResult:(void *)a1 dediscoMetadata:recorder:.cold.7(void *a1)
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v3 = [a1 key];
  __int16 v10 = [v3 resultsKeyString];
  OUTLINED_FUNCTION_3(&dword_1BECCB000, v4, v5, "Failed to scale data by %@, for key: %@", v6, v7, v8, v9, 2u);
}

@end