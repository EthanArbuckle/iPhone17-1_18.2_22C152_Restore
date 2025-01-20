@interface MPCVocalAttenuationModelProviderImplementation
- (BOOL)isValidEspressoFile:(id)a3;
- (BOOL)isValidModelFile:(id)a3;
- (BOOL)isValidPlistModelFile:(id)a3;
- (BOOL)moveModelFromURL:(id)a3 toURL:(id)a4;
- (BOOL)validateModelAtURL:(id)a3;
- (MPCVocalAttenuationModel)model;
- (MPCVocalAttenuationModelProviderImplementation)init;
- (NSError)loadingError;
- (NSString)basePath;
- (NSString)modelName;
- (NSString)plistPath;
- (id)_setupPaths;
- (id)baseDirectoryURL;
- (id)baseModelDirectoryURL;
- (id)bundleModelDirectoryURL;
- (id)directoriesAtURL:(id)a3;
- (id)latestModelDirectoryAtURL:(id)a3;
- (id)modelFileExtensions;
- (id)remoteModelDirectoryURL;
- (int64_t)state;
- (void)prepareWithCompletion:(id)a3;
- (void)purgeModelAtURL:(id)a3;
- (void)purgeSideLoadedModelDirectoriesAtURL:(id)a3;
- (void)setLoadingError:(id)a3;
- (void)setModel:(id)a3;
@end

@implementation MPCVocalAttenuationModelProviderImplementation

- (id)remoteModelDirectoryURL
{
  v2 = [MEMORY[0x263F12178] standardUserDefaults];
  [v2 shouldUseRemoteVocalAttenuationModel];

  return 0;
}

- (MPCVocalAttenuationModelProviderImplementation)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPCVocalAttenuationModelProviderImplementation;
  v2 = [(MPCVocalAttenuationModelProviderImplementation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MediaPlaybackCore.VAModelProviderCreationQueue", 0);
    creationQueue = v2->_creationQueue;
    v2->_creationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)modelName
{
  model = self->_model;
  if (model) {
    return model->_identifier;
  }
  else {
    return 0;
  }
}

void __72__MPCVocalAttenuationModelProviderImplementation_prepareWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) state];
  id v4 = [*(id *)(a1 + 32) loadingError];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
}

- (NSError)loadingError
{
  return self->_loadingError;
}

void __72__MPCVocalAttenuationModelProviderImplementation_prepareWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _setupPaths];
  [*(id *)(a1 + 32) setLoadingError:v2];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__MPCVocalAttenuationModelProviderImplementation_prepareWithCompletion___block_invoke_2;
  v4[3] = &unk_2643C55A8;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

- (void)prepareWithCompletion:(id)a3
{
  id v4 = (void (**)(id, int64_t, void *))a3;
  int64_t v5 = [(MPCVocalAttenuationModelProviderImplementation *)self state];
  switch(v5)
  {
    case 3:
      int64_t v7 = [(MPCVocalAttenuationModelProviderImplementation *)self state];
      v8 = [(MPCVocalAttenuationModelProviderImplementation *)self loadingError];
      v4[2](v4, v7, v8);

      break;
    case 2:
      v4[2](v4, [(MPCVocalAttenuationModelProviderImplementation *)self state], 0);
      break;
    case 0:
      [(MPCVocalAttenuationModelProviderImplementation *)self setLoadingError:0];
      [(MPCVocalAttenuationModelProviderImplementation *)self setModel:0];
      creationQueue = self->_creationQueue;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __72__MPCVocalAttenuationModelProviderImplementation_prepareWithCompletion___block_invoke;
      v9[3] = &unk_2643C55A8;
      v9[4] = self;
      v10 = v4;
      dispatch_async(creationQueue, v9);

      break;
  }
}

- (void)setLoadingError:(id)a3
{
}

- (void)setModel:(id)a3
{
}

- (BOOL)validateModelAtURL:(id)a3
{
  v63[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = *MEMORY[0x263EFF750];
  uint64_t v6 = *MEMORY[0x263EFF6A8];
  v63[0] = *MEMORY[0x263EFF750];
  v63[1] = v6;
  int64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
  v36 = v4;
  v37 = v3;
  v8 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:v7 options:4 errorHandler:0];

  v41 = [MEMORY[0x263EFF980] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v51 = 0;
        [v14 getResourceValue:&v51 forKey:v6 error:0];
        id v15 = v51;
        if (([v15 BOOLValue] & 1) == 0)
        {
          id v50 = 0;
          [v14 getResourceValue:&v50 forKey:v5 error:0];
          id v16 = v50;
          if ([v16 hasPrefix:@"."]) {
            [v9 skipDescendants];
          }
          else {
            [v41 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v11);
  }

  if ([v41 count])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v17 = [(MPCVocalAttenuationModelProviderImplementation *)self modelFileExtensions];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (!v18)
    {
      BOOL v30 = 1;
      goto LABEL_41;
    }
    uint64_t v19 = v18;
    obj = v17;
    uint64_t v39 = *(void *)v47;
LABEL_16:
    uint64_t v20 = 0;
LABEL_17:
    if (*(void *)v47 != v39) {
      objc_enumerationMutation(obj);
    }
    v21 = *(void **)(*((void *)&v46 + 1) + 8 * v20);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v22 = v41;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v60 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v43;
LABEL_21:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v42 + 1) + 8 * v26);
        v28 = [v27 pathExtension];
        if ([v21 isEqualToString:v28])
        {
          BOOL v29 = [(MPCVocalAttenuationModelProviderImplementation *)self isValidModelFile:v27];

          if (v29)
          {

            if (++v20 != v19) {
              goto LABEL_17;
            }
            v17 = obj;
            uint64_t v19 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
            BOOL v30 = 1;
            if (v19) {
              goto LABEL_16;
            }
LABEL_41:
            v33 = v37;
            goto LABEL_42;
          }
        }
        else
        {
        }
        if (v24 == ++v26)
        {
          uint64_t v24 = [v22 countByEnumeratingWithState:&v42 objects:v60 count:16];
          if (v24) {
            goto LABEL_21;
          }
          break;
        }
      }
    }

    v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v57 = v21;
      __int16 v58 = 2114;
      id v59 = v22;
      _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Missing model file for extension %{public}@ - Files:%{public}@", buf, 0x16u);
    }

    BOOL v30 = 0;
    v32 = v36;
    v33 = v37;
    v17 = obj;
  }
  else
  {
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL v30 = 0;
      goto LABEL_41;
    }
    v33 = v37;
    v34 = [v37 path];
    *(_DWORD *)buf = 138543362;
    v57 = v34;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - No model files in %{public}@", buf, 0xCu);

    BOOL v30 = 0;
LABEL_42:
    v32 = v36;
  }

  return v30;
}

- (BOOL)isValidModelFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MPCVocalAttenuationModelProviderImplementation *)self isValidPlistModelFile:v4]
    || [(MPCVocalAttenuationModelProviderImplementation *)self isValidEspressoFile:v4];

  return v5;
}

- (BOOL)isValidPlistModelFile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 lastPathComponent];
  char v6 = [v5 containsString:@"nnet"];
  if ((v6 & 1) != 0
    || ([v4 lastPathComponent],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 containsString:@"auxf"]))
  {
    int64_t v7 = [v4 pathExtension];
    char v8 = [v7 isEqualToString:@"plist"];

    if (v6) {
      goto LABEL_7;
    }
  }
  else
  {
    char v8 = 0;
  }

LABEL_7:
  return v8;
}

- (BOOL)isValidEspressoFile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lastPathComponent];
  if ([v4 isEqualToString:@"vi-nnet.mil"])
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v3 lastPathComponent];
    char v5 = [v6 isEqualToString:@"vi-nnet.weight.bin"];
  }
  return v5;
}

- (id)modelFileExtensions
{
  return &unk_26CC19688;
}

- (id)_setupPaths
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  id v4 = [(MPCVocalAttenuationModelProviderImplementation *)self baseDirectoryURL];
  [(MPCVocalAttenuationModelProviderImplementation *)self purgeModelAtURL:v4];
  char v5 = [(MPCVocalAttenuationModelProviderImplementation *)self baseModelDirectoryURL];
  char v6 = [(MPCVocalAttenuationModelProviderImplementation *)self latestModelDirectoryAtURL:v5];
  int64_t v7 = [(MPCVocalAttenuationModelProviderImplementation *)self remoteModelDirectoryURL];
  v97 = self;
  char v8 = [(MPCVocalAttenuationModelProviderImplementation *)self bundleModelDirectoryURL];
  id v9 = [MEMORY[0x263F12178] standardUserDefaults];
  int v10 = [v9 shouldUseSideLoadedVocalAttenuationModel];

  uint64_t v11 = [MEMORY[0x263F12178] standardUserDefaults];
  int v12 = [v11 shouldUseRemoteVocalAttenuationModel];

  if (v10 && v6)
  {
    [v3 addObject:v6];
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [v6 path];
      *(_DWORD *)buf = 138543362;
      v105 = v14;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEBUG, "[AP] - MPCModelProvider - sideLoadedModelDirectory: %{public}@", buf, 0xCu);
    }
  }
  if (v7) {
    int v15 = v12;
  }
  else {
    int v15 = 0;
  }
  if (v15 == 1)
  {
    [v3 addObject:v7];
    id v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = [v7 path];
      *(_DWORD *)buf = 138543362;
      v105 = v17;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEBUG, "[AP] - MPCModelProvider - remoteModelDirectoryURL: %{public}@", buf, 0xCu);
    }
  }
  if (v12)
  {
    if (!v5) {
      goto LABEL_23;
    }
  }
  else
  {
    if (v5) {
      char v18 = v10;
    }
    else {
      char v18 = 0;
    }
    if ((v18 & 1) == 0) {
      goto LABEL_23;
    }
  }
  [v3 addObject:v5];
  uint64_t v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [v5 path];
    *(_DWORD *)buf = 138543362;
    v105 = v20;
    _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_DEBUG, "[AP] - MPCModelProvider - baseModelDirectoryURL: %{public}@", buf, 0xCu);
  }
LABEL_23:
  if (v8)
  {
    [v3 addObject:v8];
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = [v8 path];
      *(_DWORD *)buf = 138543362;
      v105 = v22;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEBUG, "[AP] - MPCModelProvider - bundleModelDirectoryURL: %{public}@", buf, 0xCu);
    }
  }
  if ([v3 count])
  {
    v95 = v5;
    v96 = v8;
    v93 = v6;
    v94 = v7;
    v91 = v3;
    v92 = v4;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v23 = v3;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v98 objects:v103 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v99;
LABEL_30:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v99 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v98 + 1) + 8 * v27);
        BOOL v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v30 = [v28 path];
          *(_DWORD *)buf = 138543362;
          v105 = v30;
          _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Validating model in: %{public}@", buf, 0xCu);
        }
        BOOL v31 = [(MPCVocalAttenuationModelProviderImplementation *)v97 validateModelAtURL:v28];
        v32 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v33 = v32;
        if (v31) {
          break;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v34 = [v28 path];
          *(_DWORD *)buf = 138543362;
          v105 = v34;
          _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_INFO, "[AP] - MPCModelProvider - Invalid model in: %{public}@:", buf, 0xCu);
        }
        if (v25 == ++v27)
        {
          uint64_t v25 = [v23 countByEnumeratingWithState:&v98 objects:v103 count:16];
          if (v25) {
            goto LABEL_30;
          }
          goto LABEL_40;
        }
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [v28 path];
        *(_DWORD *)buf = 138543362;
        v105 = v35;
        _os_log_impl(&dword_21BB87000, v33, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Valid model found in: %{public}@:", buf, 0xCu);
      }
      id v36 = v28;

      id v4 = v92;
      char v5 = v95;
      char v8 = v96;
      if (v36)
      {
        if ([v36 isEqual:v96] & 1) != 0 || (objc_msgSend(v36, "isEqual:", v95))
        {
          id v3 = v91;
        }
        else
        {
          long long v55 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          id v3 = v91;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = [v95 path];
            *(_DWORD *)buf = 138543362;
            v105 = v56;
            _os_log_impl(&dword_21BB87000, v55, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Purging models in %{public}@", buf, 0xCu);
          }
          [(MPCVocalAttenuationModelProviderImplementation *)v97 purgeModelAtURL:v95];
          v57 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v58 = [v36 path];
            id v59 = [v95 path];
            *(_DWORD *)buf = 138543618;
            v105 = v58;
            __int16 v106 = 2114;
            v107 = v59;
            _os_log_impl(&dword_21BB87000, v57, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Moving new model: %{public}@ -> %{public}@", buf, 0x16u);
          }
          if ([(MPCVocalAttenuationModelProviderImplementation *)v97 moveModelFromURL:v36 toURL:v95])
          {
            id v60 = v95;

            id v36 = v60;
          }
          v61 = [MEMORY[0x263F12178] standardUserDefaults];
          int v62 = [v61 shouldPurgeSideLoadedVocalAttenuationModels];

          if (v62)
          {
            v63 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              v64 = [v95 path];
              *(_DWORD *)buf = 138543362;
              v105 = v64;
              _os_log_impl(&dword_21BB87000, v63, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Purging side-loaded directories in %{public}@", buf, 0xCu);
            }
            [(MPCVocalAttenuationModelProviderImplementation *)v97 purgeSideLoadedModelDirectoriesAtURL:v95];
          }
        }
        v37 = (MPCVocalAttenuationModel *)v36;
        v38 = [self _filePathsForModelAtURL:v37];
        uint64_t v39 = [v38 count];
        v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        v41 = v40;
        if (v39 == 3)
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            long long v42 = [v38 valueForKey:@"path"];
            *(_DWORD *)buf = 138543618;
            v105 = v37;
            __int16 v106 = 2114;
            v107 = v42;
            _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, "[AP] - MPCVAModel - Found model files urls at %{public}@: %{public}@", buf, 0x16u);
          }
          long long v43 = objc_msgSend(v38, "msv_filter:", &__block_literal_global_12594);
          long long v44 = [v43 firstObject];

          long long v45 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithContentsOfURL:v44];
          long long v46 = [(MPCVocalAttenuationModel *)v44 path];
          char v47 = [v46 containsString:@"/System/Library/PrivateFrameworks/MediaPlaybackCore.framework/"];

          if (v47)
          {
            v41 = 0;
          }
          else
          {
            v65 = [(MPCVocalAttenuationModel *)v37 path];
            [v45 setObject:v65 forKeyedSubscript:@"ModelNetPathBase"];

            v66 = [v45 objectForKeyedSubscript:@"ModelNetPath"];
            v67 = [v66 lastPathComponent];
            [v45 setObject:v67 forKeyedSubscript:@"ModelNetPath"];

            id v102 = 0;
            [v45 writeToURL:v44 error:&v102];
            v41 = v102;
            if (v41)
            {
              v68 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v105 = v44;
                __int16 v106 = 2114;
                v107 = v41;
                _os_log_impl(&dword_21BB87000, v68, OS_LOG_TYPE_ERROR, "[AP] - MPCVAModel - Error writing plist to url %{public}@: %{public}@", buf, 0x16u);
              }
            }
          }
          long long v54 = objc_alloc_init(MPCVocalAttenuationModel);
          v69 = [(MPCVocalAttenuationModel *)v44 path];
          [(MPCVocalAttenuationModel *)v54 setPlistPath:v69];

          [(MPCVocalAttenuationModel *)v54 setFiles:v38];
          v70 = [v45 objectForKeyedSubscript:@"TaskID"];
          [(MPCVocalAttenuationModel *)v54 setIdentifier:v70];

          v71 = [v45 objectForKeyedSubscript:@"ModelNetPathBase"];
          [(MPCVocalAttenuationModel *)v54 setBasePath:v71];

          v72 = [v45 objectForKeyedSubscript:@"BlockSize"];
          if (v72)
          {
            v73 = [v45 objectForKeyedSubscript:@"BlockSize"];
            -[MPCVocalAttenuationModel setBlockSize:](v54, "setBlockSize:", [v73 integerValue]);
          }
          else
          {
            [(MPCVocalAttenuationModel *)v54 setBlockSize:-1];
          }

          v74 = [v45 objectForKeyedSubscript:@"BatchSize"];
          if (v74)
          {
            v75 = [v45 objectForKeyedSubscript:@"BatchSize"];
            -[MPCVocalAttenuationModel setBatchSize:](v54, "setBatchSize:", [v75 integerValue]);
          }
          else
          {
            [(MPCVocalAttenuationModel *)v54 setBatchSize:1];
          }

          v76 = [v45 objectForKeyedSubscript:@"SampleRate"];
          if (v76)
          {
            v77 = [v45 objectForKeyedSubscript:@"SampleRate"];
            -[MPCVocalAttenuationModel setSampleRate:](v54, "setSampleRate:", [v77 integerValue]);
          }
          else
          {
            [(MPCVocalAttenuationModel *)v54 setSampleRate:-1];
          }

          v78 = [v45 objectForKeyedSubscript:@"LookaheadSize"];
          if (v78)
          {
            v79 = [v45 objectForKeyedSubscript:@"LookaheadSize"];
            -[MPCVocalAttenuationModel setLookaheadSize:](v54, "setLookaheadSize:", [v79 integerValue]);
          }
          else
          {
            [(MPCVocalAttenuationModel *)v54 setLookaheadSize:-1];
          }

          v80 = [v45 objectForKeyedSubscript:@"TaskIteration"];
          if (v80)
          {
            v81 = [v45 objectForKeyedSubscript:@"TaskIteration"];
            -[MPCVocalAttenuationModel setTaskIteration:](v54, "setTaskIteration:", [v81 integerValue]);
          }
          else
          {
            [(MPCVocalAttenuationModel *)v54 setTaskIteration:1];
          }

          if (v54
            && (unint64_t sampleRate = v54->_sampleRate) != 0
            && (unint64_t blockSize = v54->_blockSize) != 0
            && (unint64_t lookaheadSize = v54->_lookaheadSize) != 0)
          {
            double v85 = (double)(lookaheadSize + blockSize) / (double)sampleRate;
          }
          else
          {
            double v85 = 0.0;
          }
          [(MPCVocalAttenuationModel *)v54 setProcessingDelay:v85];

          int64_t v7 = v94;
          char v5 = v95;
        }
        else
        {
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v105 = v37;
            __int16 v106 = 2114;
            v107 = 0;
            _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_ERROR, "[AP] - MPCVAModel - Error retrieving model files urls at %{public}@: %{public}@", buf, 0x16u);
          }
          long long v54 = 0;
        }

        model = v97->_model;
        v97->_model = v54;

        v87 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          v88 = v97->_model;
          *(_DWORD *)buf = 138543362;
          v105 = v88;
          _os_log_impl(&dword_21BB87000, v87, OS_LOG_TYPE_DEFAULT, "[AP] - MPCModelProvider - Model %{public}@", buf, 0xCu);
        }

        long long v53 = 0;
        uint64_t v89 = 2;
        if (!v97->_model) {
          uint64_t v89 = 3;
        }
        v97->_state = v89;
        char v8 = v96;
        goto LABEL_100;
      }
    }
    else
    {
LABEL_40:

      id v4 = v92;
      char v5 = v95;
      char v8 = v96;
    }
    v97->_state = 3;
    long long v48 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      long long v49 = [v23 valueForKey:@"path"];
      objc_msgSend(v49, "msv_compactDescription");
      id v50 = (MPCVocalAttenuationModel *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v105 = v50;
      _os_log_impl(&dword_21BB87000, v48, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - No valid models found in %@", buf, 0xCu);
    }
    id v51 = (void *)MEMORY[0x263F087E8];
    v37 = [v23 valueForKey:@"path"];
    long long v52 = [(MPCVocalAttenuationModel *)v37 msv_compactDescription];
    long long v53 = objc_msgSend(v51, "msv_errorWithDomain:code:debugDescription:", @"MPCSuntoryError", 102, @"No valid models found in %@", v52);

    id v3 = v91;
LABEL_100:

    char v6 = v93;
  }
  else
  {
    v97->_state = 3;
    long long v53 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCSuntoryError", 101, @"No vocal attenuation model available");
  }

  return v53;
}

- (void)purgeModelAtURL:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v31 = 0;
  char v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:4 error:&v31];
  id v6 = v31;
  if (v6)
  {
    int64_t v7 = v6;
    char v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v3 path];
      *(_DWORD *)buf = 138543618;
      v34 = v9;
      __int16 v35 = 2114;
      id v36 = v7;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error getting content of directory at URL %{public}@: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    char v8 = v5;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v23 = v5;
      id v24 = v3;
      int64_t v7 = 0;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          unsigned __int8 v26 = 0;
          int v15 = objc_msgSend(v14, "path", v23, v24);
          int v16 = [v4 fileExistsAtPath:v15 isDirectory:&v26];
          int v17 = v26;

          if (v16) {
            BOOL v18 = v17 == 0;
          }
          else {
            BOOL v18 = 0;
          }
          if (v18)
          {

            id v25 = 0;
            char v19 = [v4 removeItemAtURL:v14 error:&v25];
            id v20 = v25;
            int64_t v7 = v20;
            if ((v19 & 1) == 0)
            {
              if (v20)
              {
                v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  id v22 = [v14 path];
                  *(_DWORD *)buf = 138543618;
                  v34 = v22;
                  __int16 v35 = 2114;
                  id v36 = v7;
                  _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error removing  file %{public}@: %{public}@", buf, 0x16u);
                }
              }
            }
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
      char v5 = v23;
      id v3 = v24;
    }
    else
    {
      int64_t v7 = 0;
    }
  }
}

- (id)latestModelDirectoryAtURL:(id)a3
{
  id v3 = [(MPCVocalAttenuationModelProviderImplementation *)self directoriesAtURL:a3];
  if ([v3 count])
  {
    if ((unint64_t)[v3 count] < 2)
    {
      char v5 = [v3 firstObject];
    }
    else
    {
      id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_29275];
      char v5 = [v4 lastObject];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)directoriesAtURL:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  char v5 = [v3 defaultManager];
  uint64_t v9 = 0;
  id v6 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:4 error:&v9];

  if (v9)
  {
    int64_t v7 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    int64_t v7 = objc_msgSend(v6, "msv_filter:", &__block_literal_global_28_29273);
  }

  return v7;
}

- (id)bundleModelDirectoryURL
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 URLForResource:@"czutbtg4y9" withExtension:0];

  return v3;
}

- (id)baseModelDirectoryURL
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = NSURL;
  id v3 = MSVMobileHomeDirectory();
  v12[0] = v3;
  v12[1] = @"Media/Espresso/Model";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  char v5 = [v2 fileURLWithPathComponents:v4];

  id v6 = [MEMORY[0x263F08850] defaultManager];
  int64_t v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = [v5 path];
    [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
  }

  return v5;
}

- (id)baseDirectoryURL
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = NSURL;
  id v3 = MSVMobileHomeDirectory();
  v12[0] = v3;
  v12[1] = @"Media/Espresso";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  char v5 = [v2 fileURLWithPathComponents:v4];

  id v6 = [MEMORY[0x263F08850] defaultManager];
  int64_t v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = [v5 path];
    [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_creationQueue, 0);
}

- (MPCVocalAttenuationModel)model
{
  return self->_model;
}

- (BOOL)moveModelFromURL:(id)a3 toURL:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v30 = a4;
  int64_t v7 = [MEMORY[0x263F08850] defaultManager];
  id v36 = 0;
  char v8 = [v7 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:4 error:&v36];
  id v9 = v36;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v6 path];
      *(_DWORD *)buf = 138543618;
      v38 = v12;
      __int16 v39 = 2114;
      v40 = v10;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error getting content of directory at URL %{public}@: %{public}@", buf, 0x16u);
    }
    BOOL v13 = 0;
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v11 = v8;
    uint64_t v14 = [v11 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      long long v28 = v8;
      id v29 = v6;
      uint64_t v10 = 0;
      uint64_t v16 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v11);
          }
          BOOL v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (-[MPCVocalAttenuationModelProviderImplementation isValidModelFile:](self, "isValidModelFile:", v18, v28, v29))
          {
            id v19 = v18;
            id v20 = NSURL;
            uint64_t v21 = [v19 lastPathComponent];
            id v22 = [v20 fileURLWithPath:v21 relativeToURL:v30];

            id v31 = 0;
            LOBYTE(v21) = [v7 moveItemAtURL:v19 toURL:v22 error:&v31];
            id v23 = v31;
            uint64_t v10 = v23;
            if ((v21 & 1) == 0 && v23)
            {
              id v24 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                id v25 = [v19 path];
                unsigned __int8 v26 = [v22 path];
                *(_DWORD *)buf = 138543874;
                v38 = v25;
                __int16 v39 = 2114;
                v40 = v26;
                __int16 v41 = 2114;
                long long v42 = v10;
                _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error moving file %{public}@ -> %{public}@: %{public}@", buf, 0x20u);
              }
              BOOL v13 = 0;
              goto LABEL_20;
            }
          }
        }
        uint64_t v15 = [v11 countByEnumeratingWithState:&v32 objects:v43 count:16];
        BOOL v13 = 1;
        if (v15) {
          continue;
        }
        break;
      }
LABEL_20:
      char v8 = v28;
      id v6 = v29;
    }
    else
    {
      uint64_t v10 = 0;
      BOOL v13 = 1;
    }
  }

  return v13;
}

- (void)purgeSideLoadedModelDirectoriesAtURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = [(MPCVocalAttenuationModelProviderImplementation *)self directoriesAtURL:a3];
  id v4 = [MEMORY[0x263F08850] defaultManager];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v24 = *(void *)v28;
    uint64_t v23 = *MEMORY[0x263F08028];
    uint64_t v8 = *MEMORY[0x263F08060];
    *(void *)&long long v6 = 138543618;
    long long v21 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        v35[0] = v23;
        v35[1] = v8;
        v36[0] = @"mobile";
        v36[1] = @"mobile";
        uint64_t v11 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2, v21);
        uint64_t v12 = [v10 path];
        id v26 = 0;
        char v13 = [v4 setAttributes:v11 ofItemAtPath:v12 error:&v26];
        id v14 = v26;

        if ((v13 & 1) == 0 && v14)
        {
          uint64_t v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = [v10 path];
            *(_DWORD *)buf = v21;
            long long v32 = v16;
            __int16 v33 = 2114;
            id v34 = v14;
            _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error changing attributes for directory %{public}@: %{public}@", buf, 0x16u);
          }
        }
        id v25 = v14;
        char v17 = [v4 removeItemAtURL:v10 error:&v25];
        id v18 = v25;

        if ((v17 & 1) == 0 && v18)
        {
          id v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            id v20 = [v10 path];
            *(_DWORD *)buf = v21;
            long long v32 = v20;
            __int16 v33 = 2114;
            id v34 = v18;
            _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_ERROR, "[AP] - MPCModelProvider - Error removing  directory %{public}@: %{public}@", buf, 0x16u);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v7);
  }
}

uint64_t __67__MPCVocalAttenuationModelProviderImplementation_directoriesAtURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasDirectoryPath];
}

uint64_t __76__MPCVocalAttenuationModelProviderImplementation_latestModelDirectoryAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x263EFF610];
  id v5 = a3;
  [a2 getResourceValue:&v10 forKey:v4 error:0];
  uint64_t v9 = 0;
  id v6 = v10;
  [v5 getResourceValue:&v9 forKey:v4 error:0];

  uint64_t v7 = [v6 compare:v9];
  return v7;
}

- (NSString)basePath
{
  model = self->_model;
  if (model) {
    return model->_basePath;
  }
  else {
    return 0;
  }
}

- (NSString)plistPath
{
  model = self->_model;
  if (model) {
    return model->_plistPath;
  }
  else {
    return 0;
  }
}

@end