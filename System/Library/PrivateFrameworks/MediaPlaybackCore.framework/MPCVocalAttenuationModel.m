@interface MPCVocalAttenuationModel
+ (id)_filePathsForModelAtURL:(id)a3;
+ (id)_plistForModelAtURL:(id)a3 error:(id *)a4;
- (id)description;
- (void)setBasePath:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setBlockSize:(unint64_t)a3;
- (void)setFiles:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLookaheadSize:(unint64_t)a3;
- (void)setPlistPath:(id)a3;
- (void)setProcessingDelay:(double)a3;
- (void)setSampleRate:(unint64_t)a3;
- (void)setTaskIteration:(unint64_t)a3;
@end

@implementation MPCVocalAttenuationModel

uint64_t __55__MPCVocalAttenuationModel_vocalAttenuationModelAtURL___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 pathExtension];
  uint64_t v3 = [v2 isEqualToString:@"plist"];

  return v3;
}

+ (id)_filePathsForModelAtURL:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = *MEMORY[0x263EFF750];
  uint64_t v6 = *MEMORY[0x263EFF6A8];
  v29[0] = *MEMORY[0x263EFF750];
  v29[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  v19 = v4;
  v20 = v3;
  v8 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:v7 options:4 errorHandler:0];

  v21 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v23 = 0;
        [v14 getResourceValue:&v23 forKey:v6 error:0];
        id v15 = v23;
        if (([v15 BOOLValue] & 1) == 0)
        {
          id v22 = 0;
          [v14 getResourceValue:&v22 forKey:v5 error:0];
          id v16 = v22;
          if ([v16 hasPrefix:@"."]) {
            [v9 skipDescendants];
          }
          else {
            [v21 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  v17 = (void *)[v21 copy];

  return v17;
}

- (void)setTaskIteration:(unint64_t)a3
{
  self->_taskIteration = a3;
}

- (void)setSampleRate:(unint64_t)a3
{
  self->_sampleRate = a3;
}

- (void)setProcessingDelay:(double)a3
{
  self->_processingDelay = a3;
}

- (void)setPlistPath:(id)a3
{
}

- (void)setLookaheadSize:(unint64_t)a3
{
  self->_lookaheadSize = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setFiles:(id)a3
{
}

- (void)setBlockSize:(unint64_t)a3
{
  self->_blockSize = a3;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void)setBasePath:(id)a3
{
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  if (self)
  {
    v4 = [NSString stringWithFormat:@"ID: %@", self->_identifier];
    [v3 addObject:v4];

    if (self->_blockSize)
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"BlockSize: %lu", self->_blockSize);
      [v3 addObject:v5];
    }
    unint64_t batchSize = self->_batchSize;
  }
  else
  {
    id v22 = [NSString stringWithFormat:@"ID: %@", 0];
    [v3 addObject:v22];

    unint64_t batchSize = 0;
  }
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"BatchSize: %lu", batchSize);
  [v3 addObject:v7];

  if (self)
  {
    if (self->_sampleRate)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"SampleRate: %luHz", self->_sampleRate);
      [v3 addObject:v8];
    }
    if (self->_lookaheadSize)
    {
      id v9 = objc_msgSend(NSString, "stringWithFormat:", @"LookaheadSize: %lu", self->_lookaheadSize);
      [v3 addObject:v9];
    }
    if (self->_taskIteration)
    {
      uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"TaskIteration: %lu", self->_taskIteration);
      [v3 addObject:v10];
    }
    double processingDelay = self->_processingDelay;
    if (processingDelay > 0.0)
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Delay: %3.1fms", processingDelay * 1000.0);
      [v3 addObject:v12];
    }
    basePath = self->_basePath;
  }
  else
  {
    basePath = 0;
  }
  v14 = [NSString stringWithFormat:@"BasePath: %@", basePath];
  [v3 addObject:v14];

  if (self) {
    plistPath = self->_plistPath;
  }
  else {
    plistPath = 0;
  }
  id v16 = [NSString stringWithFormat:@"Plist: %@", plistPath];
  [v3 addObject:v16];

  v17 = NSString;
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v3, "msv_compactDescription");
  v20 = [v17 stringWithFormat:@"<%p - %@> - %@", self, v18, v19];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistPath, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_files, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)_plistForModelAtURL:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v5 path];
  id v20 = 0;
  v8 = [v6 contentsOfDirectoryAtPath:v7 error:&v20];
  id v9 = v20;

  if (!v9)
  {
    uint64_t v12 = objc_msgSend(v8, "msv_filter:", &__block_literal_global_39_12578);

    if ([v12 count])
    {
      if ((unint64_t)[v12 count] < 2)
      {
        uint64_t v18 = [v12 firstObject];
        uint64_t v11 = [NSURL URLWithString:v18 relativeToURL:v5];

        goto LABEL_14;
      }
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [v12 count];
        *(_DWORD *)buf = 134218242;
        uint64_t v22 = v14;
        __int16 v23 = 2114;
        id v24 = v5;
        id v15 = "[AP] - MPCVAModel - More than one [%ld] plist found at %{public}@";
        id v16 = v13;
        uint32_t v17 = 22;
LABEL_11:
        _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      }
    }
    else
    {
      v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v22 = (uint64_t)v5;
        id v15 = "[AP] - MPCVAModel - No plist found at %{public}@";
        id v16 = v13;
        uint32_t v17 = 12;
        goto LABEL_11;
      }
    }

    uint64_t v11 = 0;
LABEL_14:
    v8 = v12;
    goto LABEL_15;
  }
  uint64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = (uint64_t)v5;
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_ERROR, "[AP] - MPCVAModel - Unable to retrieve content at %{public}@: %{public}@", buf, 0x16u);
  }

  uint64_t v11 = 0;
  *a4 = v9;
LABEL_15:

  return v11;
}

uint64_t __54__MPCVocalAttenuationModel__plistForModelAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 pathExtension];
  uint64_t v3 = [v2 isEqualToString:@"plist"];

  return v3;
}

@end