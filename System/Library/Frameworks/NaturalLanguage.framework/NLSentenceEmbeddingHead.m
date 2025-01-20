@interface NLSentenceEmbeddingHead
+ (id)logCategory;
- (BOOL)isLoaded;
- (BOOL)load;
- (MLModel)model;
- (MLModelConfiguration)configuration;
- (NLSentenceEmbeddingHead)initWithModelURL:(id)a3;
- (NSURL)modelURL;
- (id)getSentenceEmbeddingFromPooledTokenEmbeddings:(id)a3 error:(id *)a4;
- (unint64_t)inputDimension;
- (unint64_t)outputDimension;
- (void)setConfiguration:(id)a3;
- (void)setModelURL:(id)a3;
@end

@implementation NLSentenceEmbeddingHead

- (NLSentenceEmbeddingHead)initWithModelURL:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLSentenceEmbeddingHead;
  v6 = [(NLSentenceEmbeddingHead *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelURL, a3);
    v8 = (MLModelConfiguration *)objc_alloc_init(MEMORY[0x1E4F1E990]);
    configuration = v7->_configuration;
    v7->_configuration = v8;

    [(MLModelConfiguration *)v7->_configuration setComputeUnits:0];
    [(MLModelConfiguration *)v7->_configuration setExperimentalMLE5EngineUsage:0];
    model = v7->_model;
    v7->_model = 0;

    v7->_inputDimension = 0;
    v7->_outputDimension = 0;
  }

  return v7;
}

- (BOOL)load
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if ([(NLSentenceEmbeddingHead *)self isLoaded]) {
    return 1;
  }
  v4 = [MEMORY[0x1E4F1C9C8] now];
  modelURL = self->_modelURL;
  configuration = self->_configuration;
  id v52 = 0;
  v7 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:modelURL configuration:configuration error:&v52];
  id v8 = v52;
  model = self->_model;
  self->_model = v7;

  v10 = [MEMORY[0x1E4F1C9C8] now];
  [v10 timeIntervalSinceDate:v4];
  double v12 = v11;

  v13 = (void *)MEMORY[0x1AD0BB930]();
  v14 = NLGetLogCategory(self);
  v15 = [v14 internal];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = NLGetLogIdentifier(self);
    v17 = [NSString stringWithFormat:@"%.2f ms spent loading head", v12 * 1000.0];
    *(_DWORD *)buf = 138543618;
    v54 = v16;
    __int16 v55 = 2114;
    v56 = v17;
    _os_log_impl(&dword_1A6419000, v15, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
  }
  if (self->_model)
  {
    v18 = [(NLSentenceEmbeddingHead *)self model];
    v19 = [v18 modelDescription];
    v20 = [v19 inputDescriptionsByName];
    v21 = [v20 objectForKeyedSubscript:@"input"];
    v22 = [v21 multiArrayConstraint];
    v23 = [v22 shape];

    if ([v23 count] == 3
      && ([v23 objectAtIndexedSubscript:2],
          v24 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v25 = objc_opt_isKindOfClass(),
          v24,
          (v25 & 1) != 0))
    {
      v26 = [v23 objectAtIndexedSubscript:2];
      self->_inputDimension = [v26 unsignedIntValue];

      v27 = [(NLSentenceEmbeddingHead *)self model];
      v28 = [v27 modelDescription];
      v29 = [v28 outputDescriptionsByName];
      v30 = [v29 objectForKeyedSubscript:@"output"];
      v31 = [v30 multiArrayConstraint];
      v32 = [v31 shape];

      if ([v32 count] == 3
        && ([v32 objectAtIndexedSubscript:2],
            v33 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v33,
            (isKindOfClass & 1) != 0))
      {
        v35 = [v32 objectAtIndexedSubscript:2];
        self->_outputDimension = [v35 unsignedIntValue];
        BOOL v3 = 1;
      }
      else
      {
        v46 = (void *)MEMORY[0x1AD0BB930]();
        v47 = NLGetLogCategory(self);
        v48 = [v47 internal];

        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = NLGetLogIdentifier(self);
          v50 = [NSString stringWithFormat:@"Model load failed: unexpected output shape"];
          *(_DWORD *)buf = 138543618;
          v54 = v49;
          __int16 v55 = 2114;
          v56 = v50;
          _os_log_impl(&dword_1A6419000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
        }
        BOOL v3 = 0;
        v35 = self->_model;
        self->_model = 0;
      }
    }
    else
    {
      v36 = (void *)MEMORY[0x1AD0BB930]();
      v37 = NLGetLogCategory(self);
      v38 = [v37 internal];

      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = NLGetLogIdentifier(self);
        v40 = [NSString stringWithFormat:@"Model load failed: unexpected input shape"];
        *(_DWORD *)buf = 138543618;
        v54 = v39;
        __int16 v55 = 2114;
        v56 = v40;
        _os_log_impl(&dword_1A6419000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
      }
      BOOL v3 = 0;
      v32 = self->_model;
      self->_model = 0;
    }
  }
  else
  {
    v41 = (void *)MEMORY[0x1AD0BB930]();
    v42 = NLGetLogCategory(self);
    v43 = [v42 internal];

    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = NLGetLogIdentifier(self);
      v45 = [NSString stringWithFormat:@"Model load failed: %@", v8];
      *(_DWORD *)buf = 138543618;
      v54 = v44;
      __int16 v55 = 2114;
      v56 = v45;
      _os_log_impl(&dword_1A6419000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
    }
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isLoaded
{
  v2 = [(NLSentenceEmbeddingHead *)self model];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)getSentenceEmbeddingFromPooledTokenEmbeddings:(id)a3 error:(id *)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1E930]);
  v43 = @"input";
  id v8 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:v6];
  v44[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  id v38 = 0;
  v10 = (void *)[v7 initWithDictionary:v9 error:&v38];
  id v11 = v38;

  if (v11 || !v10)
  {
    v28 = (void *)MEMORY[0x1AD0BB930]();
    v29 = NLGetLogCategory(self);
    v30 = [v29 internal];

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = NLGetLogIdentifier(self);
      v32 = [NSString stringWithFormat:@"Failed to create modelInput: %@", v11];
      *(_DWORD *)buf = 138543618;
      v40 = v31;
      __int16 v41 = 2114;
      v42 = v32;
      _os_log_impl(&dword_1A6419000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
    }
    if (a4)
    {
      id v11 = v11;
      v27 = 0;
      *a4 = v11;
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    double v12 = [MEMORY[0x1E4F1C9C8] now];
    model = self->_model;
    id v37 = 0;
    v36 = [(MLModel *)model predictionFromFeatures:v10 error:&v37];
    id v11 = v37;
    v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSinceDate:v12];
    double v16 = v15;

    v17 = (void *)MEMORY[0x1AD0BB930]();
    v18 = NLGetLogCategory(self);
    v19 = [v18 internal];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = NLGetLogIdentifier(self);
      v21 = [NSString stringWithFormat:@"%.2f ms spent running head inference", v16 * 1000.0];
      *(_DWORD *)buf = 138543618;
      v40 = v20;
      __int16 v41 = 2114;
      v42 = v21;
      _os_log_impl(&dword_1A6419000, v19, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
    }
    if (v11)
    {
      v22 = (void *)MEMORY[0x1AD0BB930]();
      v23 = NLGetLogCategory(self);
      v24 = [v23 internal];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        char v25 = NLGetLogIdentifier(self);
        v26 = [NSString stringWithFormat:@"Model prediction failed: %@", v11];
        *(_DWORD *)buf = 138543618;
        v40 = v25;
        __int16 v41 = 2114;
        v42 = v26;
        _os_log_impl(&dword_1A6419000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
      }
      v27 = 0;
      if (a4) {
        *a4 = v11;
      }
      v33 = v36;
    }
    else
    {
      v33 = v36;
      v34 = [v36 featureValueForName:@"output"];
      v27 = [v34 multiArrayValue];
    }
  }

  return v27;
}

+ (id)logCategory
{
  return +[NLLogCategory categoryWithName:@"NLSentenceEmbeddingHead"];
}

- (unint64_t)inputDimension
{
  return self->_inputDimension;
}

- (unint64_t)outputDimension
{
  return self->_outputDimension;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_modelURL, 0);
}

@end