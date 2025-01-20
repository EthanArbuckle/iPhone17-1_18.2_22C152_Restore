@interface MLModelAsset
+ (BOOL)isANESupported;
+ (BOOL)needsANECompilationForModelAtURL:(id)a3 result:(BOOL *)a4 error:(id *)a5;
+ (BOOL)purgeANEBinaryForModelAtURL:(id)a3 error:(id *)a4;
+ (MLModelAsset)modelAssetWithSpecification:(void *)a3 compilerOptions:(id)a4 error:(id *)a5;
+ (MLModelAsset)modelAssetWithSpecification:(void *)a3 error:(id *)a4;
+ (MLModelAsset)modelAssetWithSpecificationData:(NSData *)specificationData error:(NSError *)error;
+ (MLModelAsset)modelAssetWithSpecificationData:(id)a3 blobMapping:(id)a4 error:(id *)a5;
+ (MLModelAsset)modelAssetWithSpecificationURL:(id)a3 compilerOptions:(id)a4 error:(id *)a5;
+ (MLModelAsset)modelAssetWithSpecificationURL:(id)a3 error:(id *)a4;
+ (MLModelAsset)modelAssetWithURL:(id)a3 configuration:(id)a4 error:(id *)a5;
+ (MLModelAsset)modelAssetWithURL:(id)a3 error:(id *)a4;
+ (id)_modelAssetWithSpecificationData:(id)a3 blobMapping:(id)a4 error:(id *)a5;
+ (id)fetchNetworkURLFromCompiledModelAtURL:(id)a3 error:(id *)a4;
+ (id)modelAssetDataByLoadingBlobFileReferencesInModelSpecificationAtURL:(id)a3 blobMapping:(id *)a4 error:(id *)a5;
+ (id)modelAssetDataByResolvingBlobFileReferencesIntoInMemoryValuesInModelSpecificationAtURL:(id)a3 error:(id *)a4;
- (BOOL)load:(id *)a3;
- (MLClassifier)classifier;
- (MLModel)model;
- (MLModelAsset)initWithArchiveData:(id)a3;
- (MLModelAsset)initWithResourceFactory:(id)a3 configuration:(id)a4;
- (MLModelAsset)initWithURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (MLModelAsset)initWithURL:(id)a3 error:(id *)a4;
- (MLModelAssetDescriptionVendor)descriptionVendor;
- (MLModelAssetModelStructureVendor)structureVendor;
- (MLModelAssetModelVendor)modelVendor;
- (MLModelAssetResourceFactory)resourceFactory;
- (MLModelConfiguration)lastConfiguration;
- (MLRegressor)regressor;
- (NSDictionary)archiveData;
- (NSURL)compiledModelURL;
- (id)classifierWithError:(id *)a3;
- (id)description;
- (id)modelWithConfiguration:(id)a3 error:(id *)a4;
- (id)modelWithError:(id *)a3;
- (id)regressorWithError:(id *)a3;
- (int64_t)storageType;
- (void)functionNamesWithCompletionHandler:(id)a3;
- (void)modelDescriptionOfFunctionNamed:(id)a3 completionHandler:(id)a4;
- (void)modelDescriptionWithCompletionHandler:(id)a3;
- (void)modelStructureWithCompletionHandler:(id)a3;
- (void)setArchiveData:(id)a3;
- (void)setLastConfiguration:(id)a3;
@end

@implementation MLModelAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveData, 0);
  objc_storeStrong((id *)&self->_lastConfiguration, 0);
  objc_storeStrong((id *)&self->_structureVendor, 0);
  objc_storeStrong((id *)&self->_modelVendor, 0);
  objc_storeStrong((id *)&self->_descriptionVendor, 0);

  objc_storeStrong((id *)&self->_resourceFactory, 0);
}

- (MLModelAsset)initWithURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  v12 = NSString;
  id v13 = v10;
  v14 = objc_msgSend(v12, "stringWithCString:encoding:", objc_msgSend(v13, "fileSystemRepresentation"), 4);
  char v15 = [v11 fileExistsAtPath:v14];

  if (v15)
  {
    if ([v13 isFileURL])
    {
      id v36 = 0;
      char v16 = [v13 getResourceValue:&v36 forKey:*MEMORY[0x1E4F1C520] error:a5];
      id v17 = v36;
      v18 = v17;
      if (v16)
      {
        if (v17)
        {
          v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
LABEL_17:

          goto LABEL_19;
        }
        v32 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v13;
          _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "The the canonical path for %@ is not available.", buf, 0xCu);
        }

        if (!a5)
        {
          v18 = 0;
          goto LABEL_16;
        }
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        v22 = [NSString stringWithFormat:@"The the canonical path for %@ is not available.", v13];
        *(void *)buf = v22;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v35 count:1];
        *a5 = [v33 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v34];

        v18 = 0;
      }
      else
      {
        v29 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v13;
          _os_log_error_impl(&dword_19E58B000, v29, OS_LOG_TYPE_ERROR, "Failed to obtain the canonical path for %@", buf, 0xCu);
        }

        if (!a5) {
          goto LABEL_16;
        }
        v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        v22 = [NSString stringWithFormat:@"Failed to obtain the canonical path for %@", v13];
        *(void *)buf = v22;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v35 count:1];
        *a5 = [v30 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v31];
      }
LABEL_15:

LABEL_16:
      v19 = 0;
      goto LABEL_17;
    }
    v24 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_error_impl(&dword_19E58B000, v24, OS_LOG_TYPE_ERROR, "The model URL (%@) must be a file URL.", buf, 0xCu);
    }

    if (a5)
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      id v36 = (id)*MEMORY[0x1E4F28568];
      v18 = [NSString stringWithFormat:@"The model URL (%@) must be a file URL.", v13];
      *(void *)buf = v18;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v36 count:1];
      id v23 = [v25 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v22];
      goto LABEL_14;
    }
  }
  else
  {
    v20 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "The model is not found at URL: %@", buf, 0xCu);
    }

    if (a5)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      id v36 = (id)*MEMORY[0x1E4F28568];
      v18 = [NSString stringWithFormat:@"The model is not found at URL: %@", v13];
      *(void *)buf = v18;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v36 count:1];
      id v23 = [v21 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v22];
LABEL_14:
      *a5 = v23;
      goto LABEL_15;
    }
  }
  v19 = 0;
LABEL_19:

  if (v19)
  {
    v26 = +[MLModelAssetResourceFactory resourceFactoryWithModelURL:v19 error:a5];
    if (v26)
    {
      self = [(MLModelAsset *)self initWithResourceFactory:v26 configuration:v9];
      v27 = self;
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (MLModelAsset)initWithResourceFactory:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MLModelAsset;
  id v9 = [(MLModelAsset *)&v18 init];
  if (v9)
  {
    id v10 = [[MLModelAssetDescriptionVendor alloc] initWithResourceFactory:v7];
    v11 = [[MLModelAssetModelVendor alloc] initWithResourceFactory:v7];
    objc_storeStrong((id *)&v9->_resourceFactory, a3);
    objc_storeStrong((id *)&v9->_descriptionVendor, v10);
    objc_storeStrong((id *)&v9->_modelVendor, v11);
    v12 = [[MLModelAssetModelStructureVendor alloc] initWithResourceFactory:v7];
    objc_storeStrong((id *)&v9->_structureVendor, v12);
    uint64_t v13 = [v8 copy];
    lastConfiguration = v9->_lastConfiguration;
    v9->_lastConfiguration = (MLModelConfiguration *)v13;

    if (!v9->_lastConfiguration)
    {
      char v15 = objc_alloc_init(MLModelConfiguration);
      char v16 = v9->_lastConfiguration;
      v9->_lastConfiguration = v15;
    }
  }

  return v9;
}

- (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(MLModelAsset *)self modelVendor];

  if (v7)
  {
    id v8 = [(MLModelAsset *)self modelVendor];
    a4 = [v8 modelWithConfiguration:v6 error:a4];

    if (a4) {
      [(MLModelAsset *)self setLastConfiguration:v6];
    }
  }
  else
  {
    id v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "MLModelAsset has not been initialized properly.", v14, 2u);
    }

    if (a4)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v11 = [NSString stringWithFormat:@"MLModelAsset has not been initialized properly."];
      v16[0] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = [v10 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v12];

      a4 = 0;
    }
  }

  return a4;
}

- (MLModelAssetModelVendor)modelVendor
{
  return self->_modelVendor;
}

+ (MLModelAsset)modelAssetWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MLModelConfiguration);
  id v8 = (void *)[objc_alloc((Class)a1) initWithURL:v6 configuration:v7 error:a4];

  return (MLModelAsset *)v8;
}

- (void)setLastConfiguration:(id)a3
{
}

- (void)setArchiveData:(id)a3
{
}

- (NSDictionary)archiveData
{
  return self->_archiveData;
}

- (MLModelConfiguration)lastConfiguration
{
  return self->_lastConfiguration;
}

- (MLModelAssetModelStructureVendor)structureVendor
{
  return self->_structureVendor;
}

- (MLModelAssetDescriptionVendor)descriptionVendor
{
  return self->_descriptionVendor;
}

- (MLModelAssetResourceFactory)resourceFactory
{
  return self->_resourceFactory;
}

- (MLModelAsset)initWithArchiveData:(id)a3
{
  v4 = +[MLModelAssetResourceFactory resourceFactoryWithArchiveData:a3];
  v5 = objc_alloc_init(MLModelConfiguration);
  id v6 = [(MLModelAsset *)self initWithResourceFactory:v4 configuration:v5];

  return v6;
}

- (int64_t)storageType
{
  v2 = [(MLModelAsset *)self resourceFactory];
  v3 = [v2 compiledModelURL];
  int64_t v4 = v3 == 0;

  return v4;
}

- (id)regressorWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int64_t v4 = -[MLModelAsset modelWithError:](self, "modelWithError:");
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 regressor];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "The model is not a regressor.", v14, 2u);
      }

      if (a3)
      {
        id v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = *MEMORY[0x1E4F28568];
        v11 = [NSString stringWithFormat:@"The model is not a regressor."];
        v16[0] = v11;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
        *a3 = [v10 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v12];
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (MLRegressor)regressor
{
  return (MLRegressor *)[(MLModelAsset *)self regressorWithError:0];
}

- (id)classifierWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int64_t v4 = -[MLModelAsset modelWithError:](self, "modelWithError:");
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 classifier];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Model is not a classifier", v14, 2u);
      }

      if (a3)
      {
        id v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = *MEMORY[0x1E4F28568];
        v11 = [NSString stringWithFormat:@"Model is not a classifier"];
        v16[0] = v11;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
        *a3 = [v10 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v12];
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (MLClassifier)classifier
{
  return (MLClassifier *)[(MLModelAsset *)self classifierWithError:0];
}

- (id)modelWithError:(id *)a3
{
  v5 = [(MLModelAsset *)self lastConfiguration];
  id v6 = [(MLModelAsset *)self modelWithConfiguration:v5 error:a3];

  return v6;
}

- (MLModel)model
{
  return (MLModel *)[(MLModelAsset *)self modelWithError:0];
}

- (BOOL)load:(id *)a3
{
  v5 = [(MLModelAsset *)self modelVendor];
  id v6 = [(MLModelAsset *)self lastConfiguration];
  id v7 = [v5 modelWithConfiguration:v6 error:a3];

  return v7 != 0;
}

- (void)modelStructureWithCompletionHandler:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(MLModelAsset *)self structureVendor];
  [v4 modelStructureWithCompletionHandler:v5];
}

- (void)modelDescriptionOfFunctionNamed:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(MLModelAsset *)self descriptionVendor];
  [v7 modelDescriptionOfFunctionNamed:v8 completionHandler:v6];
}

- (void)modelDescriptionWithCompletionHandler:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(MLModelAsset *)self descriptionVendor];
  [v4 modelDescriptionWithCompletionHandler:v5];
}

- (void)functionNamesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  int64_t v4 = [(MLModelAsset *)self descriptionVendor];
  [v4 functionNamesWithCompletionHandler:v5];
}

- (id)description
{
  v2 = NSString;
  v3 = [(MLModelAsset *)self compiledModelURL];
  int64_t v4 = objc_msgSend(v2, "stringWithFormat:", @"MLModelAsset(URL: %@"), v3;

  return v4;
}

- (MLModelAsset)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MLModelConfiguration);
  id v8 = [(MLModelAsset *)self initWithURL:v6 configuration:v7 error:a4];

  return v8;
}

- (NSURL)compiledModelURL
{
  v2 = [(MLModelAsset *)self resourceFactory];
  v3 = [v2 compiledModelURL];

  return (NSURL *)v3;
}

+ (MLModelAsset)modelAssetWithSpecificationData:(NSData *)specificationData error:(NSError *)error
{
  int64_t v4 = [a1 _modelAssetWithSpecificationData:specificationData blobMapping:0 error:error];

  return (MLModelAsset *)v4;
}

+ (MLModelAsset)modelAssetWithSpecificationData:(id)a3 blobMapping:(id)a4 error:(id *)a5
{
  id v5 = [a1 _modelAssetWithSpecificationData:a3 blobMapping:a4 error:a5];

  return (MLModelAsset *)v5;
}

+ (id)_modelAssetWithSpecificationData:(id)a3 blobMapping:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = (NSData *)a3;
  id v8 = a4;
  id v9 = _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification5ModelENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v20);
  id v10 = (void *)MEMORY[0x19F3C29E0](v9);
  CoreML::Model::Model((CoreML::Model *)&v23);
  Archiver::_MemoryIStream::_MemoryIStream((Archiver::_MemoryIStream *)&v18, v7);
  double v11 = CoreML::Model::load((uint64_t)buf, &v18, (uint64_t)&v23);
  if ((*(_DWORD *)buf & 0xFFFFFFEF) == 0) {
    _MLModelSpecification::_MLModelSpecification((_MLModelSpecification *)&v22, (const CoreML::Model *)&v23);
  }
  v12 = (void **)&v25;
  if (v26 < 0) {
    v12 = v25;
  }
  uint64_t v13 = +[MLModelErrorUtils IOErrorWithFormat:@"Error reading protobuf spec. %s", v11, v12];
  if (v26 < 0) {
    operator delete(v25);
  }
  Archiver::_MemoryIStream::~_MemoryIStream(&v18);
  MEMORY[0x19F3C1850](&v19);
  v23.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1EF0DB228;
  if (v23.__r_.__value_.__r.__words[2]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v23.__r_.__value_.__r.__words[2]);
  }
  if (!v13)
  {
    objc_opt_new();
    id v17 = objc_opt_new();
    std::string::basic_string[abi:ne180100]<0>(&v22, ".");
    id v14 = v17;
    uint64_t v15 = operator new(0x108uLL);
    v15[1] = 0;
    v15[2] = 0;
    *uint64_t v15 = &unk_1EF0DD9D0;
    std::string::basic_string[abi:ne180100]<0>(&v23, ".");
    Archiver::_OArchiveMemoryImpl::_OArchiveMemoryImpl(v15 + 3, (long long *)&v23, (uint64_t)&v22, v14);
  }
  if (a5) {
    *a5 = v13;
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }

  return 0;
}

+ (BOOL)purgeANEBinaryForModelAtURL:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([a1 isANESupported] & 1) == 0)
  {
    id v8 = 0;
    id v9 = 0;
LABEL_13:
    BOOL v15 = 1;
    goto LABEL_21;
  }
  id v24 = 0;
  id v7 = [a1 fetchNetworkURLFromCompiledModelAtURL:v6 error:&v24];
  id v8 = v24;
  if (v7)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(id *)(*((void *)&v20 + 1) + 8 * i);
          [v13 fileSystemRepresentation];
          uint64_t v14 = espresso_ane_cache_purge_network();
          if (v14)
          {
            uint64_t v16 = +[MLModelErrorUtils genericErrorWithFormat:@"Failed to purge cached ANE binary because espresso_ane_cache_purge_network returned status=%d for network at %@", v14, v13, (void)v20];

            id v8 = (id)v16;
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v29 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    goto LABEL_13;
  }
LABEL_15:
  id v17 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = [v8 localizedDescription];
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    v28 = v19;
    _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "Failed to purge cached ANE binary for compiled models at %@ with error: %@", buf, 0x16u);
  }
  if (a4)
  {
    id v8 = v8;
    BOOL v15 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v15 = 0;
  }
  id v9 = v7;
LABEL_21:

  return v15;
}

+ (BOOL)needsANECompilationForModelAtURL:(id)a3 result:(BOOL *)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4)
  {
    if (![a1 isANESupported])
    {
      BOOL v18 = 0;
      id v11 = 0;
      id v10 = 0;
      BOOL v20 = 1;
      goto LABEL_26;
    }
    id v28 = 0;
    id v9 = [a1 fetchNetworkURLFromCompiledModelAtURL:v8 error:&v28];
    id v10 = v28;
    if (v9)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v11);
            }
            BOOL v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            *(_DWORD *)buf = -1;
            id v16 = v15;
            [v16 fileSystemRepresentation];
            uint64_t has_network = espresso_ane_cache_has_network();
            if (has_network)
            {
              uint64_t v21 = +[MLModelErrorUtils genericErrorWithFormat:@"Failed to check cached ANE binary because espresso_ane_cache_has_network returned status=%d for network at %@.", has_network, v16, (void)v24];

              BOOL v18 = 0;
              id v10 = (id)v21;
              goto LABEL_25;
            }
            if (!*(_DWORD *)buf)
            {
              BOOL v18 = 1;
              goto LABEL_25;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v33 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      BOOL v18 = 0;
LABEL_25:

      BOOL v20 = 1;
      goto LABEL_26;
    }
  }
  else
  {
    id v10 = +[MLModelErrorUtils parameterErrorWithUnderlyingError:0 format:@"Failed to check cached ANE binary: argument result must not be nil"];
  }
  uint64_t v19 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    long long v23 = [v10 localizedDescription];
    *(_DWORD *)buf = 138412546;
    id v30 = v8;
    __int16 v31 = 2112;
    v32 = v23;
    _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Failed to check cached ANE binary for compiled models at %@ with error %@", buf, 0x16u);
  }
  if (a5)
  {
    id v10 = v10;
    BOOL v20 = 0;
    id v11 = 0;
    BOOL v18 = 0;
    *a5 = v10;
    if (!a4) {
      goto LABEL_27;
    }
  }
  else
  {
    BOOL v20 = 0;
    id v11 = 0;
    BOOL v18 = 0;
    if (!a4) {
      goto LABEL_27;
    }
  }
LABEL_26:
  *a4 = v18;
LABEL_27:

  return v20;
}

+ (id)fetchNetworkURLFromCompiledModelAtURL:(id)a3 error:(id *)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  uint64_t v33 = 0;
  uint64_t v34 = (id *)&v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__7737;
  v37 = __Block_byref_object_dispose__7738;
  id v38 = 0;
  id v25 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  int64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = *MEMORY[0x1E4F1C628];
  v44[0] = *MEMORY[0x1E4F1C628];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __60__MLModelAsset_fetchNetworkURLFromCompiledModelAtURL_error___block_invoke;
  v32[3] = &unk_1E59A4A18;
  v32[4] = &v33;
  long long v22 = [v4 enumeratorAtURL:v24 includingPropertiesForKeys:v6 options:16 errorHandler:v32];

  if (v34[5]) {
    goto LABEL_16;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v22;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id obj = 0;
        id v27 = 0;
        uint64_t v12 = v34;
        char v13 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v27, v5, &obj, v22);
        id v14 = v27;
        objc_storeStrong(v12 + 5, obj);
        if ((v13 & 1) == 0)
        {

          goto LABEL_15;
        }
        if (([v14 BOOLValue] & 1) == 0)
        {
          BOOL v15 = [v11 lastPathComponent];
          char v16 = [v15 hasSuffix:@".espresso.net"];

          if (v16)
          {
            id v17 = [v11 relativePath];
            BOOL v18 = [v24 URLByAppendingPathComponent:v17 isDirectory:0];

            [v25 addObject:v18];
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v43 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if (v34[5])
  {
LABEL_16:
    uint64_t v19 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [v34[5] localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v40 = v24;
      __int16 v41 = 2112;
      v42 = v21;
      _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Failed to fetch Espresso Nets for compiled models at %@ with error %@", buf, 0x16u);
    }
    if (a4) {
      *a4 = v34[5];
    }

    id v25 = 0;
  }

  _Block_object_dispose(&v33, 8);

  return v25;
}

BOOL __60__MLModelAsset_fetchNetworkURLFromCompiledModelAtURL_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }

  return v5 == 0;
}

+ (BOOL)isANESupported
{
  uint64_t context = espresso_create_context();
  if (context) {
    espresso_context_destroy();
  }
  return context != 0;
}

+ (MLModelAsset)modelAssetWithSpecificationURL:(id)a3 compilerOptions:(id)a4 error:(id *)a5
{
  id v7 = +[MLModel _compileModelAtURL:options:error:](MLModel, "_compileModelAtURL:options:error:", a3, a4);
  if (v7) {
    uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithURL:v7 error:a5];
  }
  else {
    uint64_t v8 = 0;
  }

  return (MLModelAsset *)v8;
}

+ (MLModelAsset)modelAssetWithSpecificationURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[MLCompilerOptions defaultOptions];
  uint64_t v8 = [a1 modelAssetWithSpecificationURL:v6 compilerOptions:v7 error:a4];

  return (MLModelAsset *)v8;
}

+ (MLModelAsset)modelAssetWithSpecification:(void *)a3 compilerOptions:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v9 = NSTemporaryDirectory();
  id v10 = [v8 uniqueDirectoryURLInPath:v9];

  if (v10)
  {
    id v11 = [v10 URLByAppendingPathComponent:@"model.mlmodel"];
    CoreML::Model::Model((CoreML::Model *)v18, *(const CoreML::Specification::Model **)a3);
    id v12 = v11;
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v12 fileSystemRepresentation]);
    CoreML::Model::save((uint64_t)&v20, (uint64_t)v18);
    if (v17 < 0) {
      operator delete(__p);
    }
    v18[0] = &unk_1EF0DB228;
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
    if ((v20 & 0xFFFFFFEF) != 0)
    {
      if (a5)
      {
        char v13 = &v21;
        if (v22 < 0) {
          char v13 = v21;
        }
        +[MLModelErrorUtils genericErrorWithFormat:@"%s", v13];
        id v14 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = +[MLModelAsset modelAssetWithSpecificationURL:v12 compilerOptions:v7 error:a5];
    }
    [v10 removeItemAndReturnError:0];
    if (v22 < 0) {
      operator delete(v21);
    }
  }
  else
  {
    id v14 = 0;
  }

  return (MLModelAsset *)v14;
}

+ (MLModelAsset)modelAssetWithSpecification:(void *)a3 error:(id *)a4
{
  id v7 = +[MLCompilerOptions defaultOptions];
  uint64_t v8 = [a1 modelAssetWithSpecification:a3 compilerOptions:v7 error:a4];

  return (MLModelAsset *)v8;
}

+ (MLModelAsset)modelAssetWithURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithURL:v8 configuration:v9 error:a5];

  return (MLModelAsset *)v10;
}

+ (id)modelAssetDataByLoadingBlobFileReferencesInModelSpecificationAtURL:(id)a3 blobMapping:(id *)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 URLByStandardizingPath];
  id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8 options:1 error:a5];
  if (!v9)
  {
    id v20 = 0;
    goto LABEL_28;
  }
  CoreML::Model::Model((CoreML::Model *)v37);
  id v10 = v9;
  double v11 = CoreML::Model::load((uint64_t)&v32, v35, (uint64_t)v37);
  if ((v32 & 0xFFFFFFEF) == 0)
  {
    uint64_t v21 = objc_msgSend(v8, "URLByDeletingLastPathComponent", v11);
    char v22 = (void *)v37[1];
    id v16 = v21;
    v43 = a5;
    id v44 = v16;
    id v42 = 0;
    id v41 = [MEMORY[0x1E4F1CA60] dictionary];
    id v23 = [v16 path];
    std::string::basic_string[abi:ne180100]<0>(&v39, (char *)[v23 UTF8String]);

    id v24 = operator new(0x28uLL);
    void *v24 = &unk_1EF0DD288;
    v24[1] = &v42;
    v24[2] = &v44;
    v24[3] = &v43;
    v24[4] = &v41;
    v51 = v24;
    std::__function::__value_func<void ()(CoreML::Specification::MILSpec::Value &)>::~__value_func[abi:ne180100](buf);
    if (v42 && v43)
    {
      id v25 = v42;
      id *v43 = v25;
    }
    id v26 = v41;
    id v27 = v26;
    if (v40 < 0)
    {
      operator delete(v39);
      id v27 = v41;
    }

    if (v26)
    {
      if (a4) {
        *a4 = v26;
      }
      id v20 = v10;

      goto LABEL_23;
    }
LABEL_22:
    id v20 = 0;
LABEL_23:

    goto LABEL_24;
  }
  id v12 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = [v7 path];
    long long v29 = (void *)v28;
    long long v30 = __p;
    if (v34 < 0) {
      long long v30 = (void **)__p[0];
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v48 = v28;
    __int16 v49 = 2080;
    v50 = v30;
    _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "Failed to read model specification: path=%@, error=%s.", buf, 0x16u);
  }
  if (a5)
  {
    char v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    id v14 = NSString;
    uint64_t v15 = [v7 path];
    id v16 = (id)v15;
    char v17 = __p;
    if (v34 < 0) {
      char v17 = (void **)__p[0];
    }
    BOOL v18 = [v14 stringWithFormat:@"Failed to read model specification: path=%@, error=%s.", v15, v17];
    v46 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    *a5 = [v13 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v19];

    goto LABEL_22;
  }
  id v20 = 0;
LABEL_24:
  if (v34 < 0) {
    operator delete(__p[0]);
  }
  std::istream::~istream();
  MEMORY[0x19F3C1850](&v36);
  std::streambuf::~streambuf();
  v37[0] = &unk_1EF0DB228;
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
LABEL_28:

  return v20;
}

+ (id)modelAssetDataByResolvingBlobFileReferencesIntoInMemoryValuesInModelSpecificationAtURL:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 URLByStandardizingPath];
  id v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:1 error:a4];
  if (v7)
  {
    CoreML::Model::Model((CoreML::Model *)&v28);
    id v8 = v7;
    double v9 = CoreML::Model::load((uint64_t)&v23, v26, (uint64_t)&v28);
    if ((v23 & 0xFFFFFFEF) == 0)
    {
      objc_msgSend(v6, "URLByDeletingLastPathComponent", v9);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      operator new();
    }
    id v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v5 path];
      uint64_t v21 = (void *)v20;
      char v22 = __p;
      if (v25 < 0) {
        char v22 = (void **)__p[0];
      }
      int buf = 138412546;
      *(void *)buf_4 = v20;
      __int16 v34 = 2080;
      uint64_t v35 = v22;
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "Failed to read model specification: path=%@, error=%s", (uint8_t *)&buf, 0x16u);
    }
    if (a4)
    {
      double v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      id v12 = NSString;
      uint64_t v13 = [v5 path];
      id v14 = (void *)v13;
      uint64_t v15 = __p;
      if (v25 < 0) {
        uint64_t v15 = (void **)__p[0];
      }
      id v16 = [v12 stringWithFormat:@"Failed to read model specification: path=%@, error=%s", v13, v15];
      long long v31 = v16;
      char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *a4 = [v11 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v17];
    }
    if (v25 < 0) {
      operator delete(__p[0]);
    }
    std::istream::~istream();
    MEMORY[0x19F3C1850](&v27);
    std::streambuf::~streambuf();
    uint64_t v28 = &unk_1EF0DB228;
    if (v29) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v29);
    }
  }

  return 0;
}

@end