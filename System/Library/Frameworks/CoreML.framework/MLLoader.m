@interface MLLoader
+ (BOOL)_createDecryptSessionForModelAtURL:(id)a3 configuration:(id)a4 decryptSession:(id *)a5 loaderEvent:(id)a6 error:(id *)a7;
+ (BOOL)checkAssetPath:(id)a3 error:(id *)a4;
+ (id)_conformConfiguration:(id)a3 usingModelArchive:(void *)a4;
+ (id)_findCodedObjectURLInModelArchive:(void *)a3;
+ (id)_loadModelAssetDescriptionFromArchive:(void *)a3 configuration:(id)a4 modelVersion:(id)a5 compilerVersion:(id)a6 loadingClasses:(id)a7 error:(id *)a8;
+ (id)_loadModelFromArchive:(void *)a3 configuration:(id)a4 loaderEvent:(id)a5 useUpdatableModelLoaders:(BOOL)a6 error:(id *)a7;
+ (id)_loadModelFromArchive:(void *)a3 configuration:(id)a4 modelVersion:(id)a5 compilerVersion:(id)a6 loaderEvent:(id)a7 useUpdatableModelLoaders:(BOOL)a8 loadingClasses:(id)a9 error:(id *)a10;
+ (id)_loadModelFromAssetAtURL:(id)a3 configuration:(id)a4 loaderEvent:(id)a5 error:(id *)a6;
+ (id)_loadModelWithClass:(Class)a3 fromArchive:(void *)a4 modelVersionInfo:(id)a5 compilerVersionInfo:(id)a6 configuration:(id)a7 error:(id *)a8;
+ (id)_loadUpdatableModelWithClass:(Class)a3 fromArchive:(void *)a4 modelVersionInfo:(id)a5 compilerVersionInfo:(id)a6 configuration:(id)a7 error:(id *)a8;
+ (id)_loadWithModelLoaderFromArchive:(void *)a3 configuration:(id)a4 loaderEvent:(id)a5 useUpdatableModelLoaders:(BOOL)a6 error:(id *)a7;
+ (id)_unarchiveCodedModelObjectAtURL:(id)a3 error:(id *)a4;
+ (id)loadModelAssetDescriptionFromArchive:(void *)a3 error:(id *)a4;
+ (id)loadModelAssetDescriptionFromAssetAtURL:(id)a3 error:(id *)a4;
+ (id)loadModelFromArchive:(void *)a3 configuration:(id)a4 error:(id *)a5;
+ (id)loadModelFromArchive:(void *)a3 error:(id *)a4;
+ (id)loadModelFromAssetAtURL:(id)a3 configuration:(id)a4 error:(id *)a5;
+ (id)loadModelFromAssetAtURL:(id)a3 error:(id *)a4;
+ (id)loadUpdatableModelFromArchive:(void *)a3 configuration:(id)a4 error:(id *)a5;
+ (id)loadUpdatableModelFromAssetAtURL:(id)a3 configuration:(id)a4 error:(id *)a5;
+ (void)_populateLoaderAndPredictionEvent:(id)a3 model:(id)a4 configuration:(id)a5 loadTimeDuration:(unint64_t)a6;
@end

@implementation MLLoader

+ (void)_populateLoaderAndPredictionEvent:(id)a3 model:(id)a4 configuration:(id)a5 loadTimeDuration:(unint64_t)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "computeUnits"));
  [v8 setComputeUnits:v11];

  v12 = [v8 modelName];

  if (!v12)
  {
    v13 = [v9 modelDescription];
    v14 = [v13 modelURL];
    v15 = [v14 URLByDeletingPathExtension];
    v16 = [v15 lastPathComponent];
    [v8 setModelName:v16];
  }
  v17 = [v9 modelDescription];
  v18 = [v17 metadata];
  v19 = [v18 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v21 = NSNumber;
    v22 = [v9 modelDescription];
    v23 = [v22 metadata];
    v24 = [v23 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
    v25 = [v21 modelOriginNumberFromUserDefinedDictionary:v24];
    [v8 setModelOrigin:v25];
  }
  mach_timebase_info(&info);
  v26 = [NSNumber numberWithUnsignedLongLong:((unint64_t)(info.numer / info.denom) + 999999) / 0xF4240];
  [v8 setModelLoadTime:v26];

  v27 = [MEMORY[0x1E4F28B50] mainBundle];
  v28 = [v27 bundleIdentifier];

  [v8 setBundleIdentifier:v28];
  [v8 setFirstPartyExecutable:&unk_1EF11A2F8];
  if ([v28 hasPrefix:@"com.apple."]) {
    [v8 setFirstPartyExecutable:&unk_1EF11A2E0];
  }
  v29 = [MEMORY[0x1E4F28F80] processInfo];
  v30 = [v29 processName];
  [v8 setProcessName:v30];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = [v8 modelName];
    v32 = [v9 predictionEvent];
    [v32 setModelName:v31];

    v33 = [v8 firstPartyExecutable];
    v34 = [v9 predictionEvent];
    [v34 setFirstPartyExecutable:v33];

    v35 = [v8 modelType];
    v36 = [v9 predictionEvent];
    [v36 setModelType:v35];

    v37 = [v8 bundleIdentifier];
    v38 = [v9 predictionEvent];
    [v38 setBundleIdentifier:v37];
  }
}

+ (id)_loadModelFromArchive:(void *)a3 configuration:(id)a4 modelVersion:(id)a5 compilerVersion:(id)a6 loaderEvent:(id)a7 useUpdatableModelLoaders:(BOOL)a8 loadingClasses:(id)a9 error:(id *)a10
{
  BOOL v46 = a8;
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v47 = a4;
  id v48 = a5;
  id v49 = a6;
  id v50 = a7;
  id v43 = a9;
  (*(void (**)(void))(**(void **)(*(void *)a3 + 32) + 16))(*(void *)(*(void *)a3 + 32));
  std::istream::tellg();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v43;
  uint64_t v16 = [obj countByEnumeratingWithState:&v53 objects:v69 count:16];
  if (!v16)
  {

    v22 = 0;
    id v17 = 0;
    goto LABEL_52;
  }
  id v17 = 0;
  uint64_t v18 = *(void *)v54;
  uint64_t v44 = *MEMORY[0x1E4F28A50];
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v54 != v18) {
        objc_enumerationMutation(obj);
      }
      v20 = *(objc_class **)(*((void *)&v53 + 1) + 8 * i);

      IArchive::rewind((uint64_t)a3);
      (*(void (**)(void))(**(void **)(*(void *)a3 + 32) + 16))(*(void *)(*(void *)a3 + 32));
      long long v66 = v76;
      long long v67 = v77;
      uint64_t v68 = v78;
      long long v62 = v72;
      long long v63 = v73;
      long long v64 = v74;
      long long v65 = v75;
      long long v60 = v70;
      long long v61 = v71;
      std::istream::seekg();
      if (v46)
      {
        uint64_t v52 = 0;
        v21 = (id *)&v52;
        [a1 _loadUpdatableModelWithClass:v20 fromArchive:a3 modelVersionInfo:v48 compilerVersionInfo:v49 configuration:v47 error:&v52];
      }
      else
      {
        uint64_t v51 = 0;
        v21 = (id *)&v51;
        [a1 _loadModelWithClass:v20 fromArchive:a3 modelVersionInfo:v48 compilerVersionInfo:v49 configuration:v47 error:&v51];
      v22 = };
      id v17 = *v21;
      if (v22)
      {
        v36 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "predictionTypeForKTrace"));
        [v50 setModelEngineType:v36];

        v37 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          NSStringFromClass(v20);
          id v38 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v39 = *(void *)a3;
          if (*(char *)(*(void *)a3 + 31) < 0)
          {
            std::string::__init_copy_ctor_external(&buf, *(const std::string::value_type **)(v39 + 8), *(void *)(v39 + 16));
          }
          else
          {
            long long v40 = *(_OWORD *)(v39 + 8);
            buf.__r_.__value_.__r.__words[2] = *(void *)(v39 + 24);
            *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v40;
          }
          p_std::string buf = &buf;
          if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
          }
          LODWORD(v57.__r_.__value_.__l.__data_) = 138412546;
          *(std::string::size_type *)((char *)v57.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
          WORD2(v57.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v57.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)p_buf;
          _os_log_impl(&dword_19E58B000, v37, OS_LOG_TYPE_INFO, "%@ class has successfully loaded the model at %s.", (uint8_t *)&v57, 0x16u);
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf.__r_.__value_.__l.__data_);
          }
        }
        goto LABEL_49;
      }
      v23 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        NSStringFromClass(v20);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v25 = *(void *)a3;
        if (*(char *)(*(void *)a3 + 31) < 0)
        {
          std::string::__init_copy_ctor_external(&v57, *(const std::string::value_type **)(v25 + 8), *(void *)(v25 + 16));
        }
        else
        {
          long long v26 = *(_OWORD *)(v25 + 8);
          v57.__r_.__value_.__r.__words[2] = *(void *)(v25 + 24);
          *(_OWORD *)&v57.__r_.__value_.__l.__data_ = v26;
        }
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v27 = &v57;
        }
        else {
          v27 = (std::string *)v57.__r_.__value_.__r.__words[0];
        }
        if (v17)
        {
          id v10 = [v17 localizedDescription];
          v28 = v10;
        }
        else
        {
          v28 = @"Unknown Failure";
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 138412802;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v24;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v27;
        HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
        v59 = v28;
        _os_log_impl(&dword_19E58B000, v23, OS_LOG_TYPE_INFO, "%@ class was unable to load the model at %s with error: %@; The model loader is going to use another class.",
          (uint8_t *)&buf,
          0x20u);
        if (v17) {

        }
        if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v57.__r_.__value_.__l.__data_);
        }
      }
      if (v17) {
        BOOL v29 = v50 != 0;
      }
      else {
        BOOL v29 = 0;
      }
      if (v29)
      {
        v30 = [v17 domain];
        int v31 = [v30 isEqualToString:@"com.apple.CoreML"];

        if (v31)
        {
          if ([v17 code] == 70)
          {
            v32 = [v17 userInfo];
            v33 = [v32 objectForKeyedSubscript:v44];

            v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v33, "code"));
            [v50 setModelProgramValidationError:v34];
          }
          else
          {
            if ([v17 code] != 71) {
              continue;
            }
            v35 = [v17 userInfo];
            v33 = [v35 objectForKeyedSubscript:v44];

            v34 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v33, "code"));
            [v50 setModelProgramParsingError:v34];
          }
        }
      }
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v53 objects:v69 count:16];
    if (v16) {
      continue;
    }
    break;
  }
  v22 = 0;
LABEL_49:

  if (a10 && v17)
  {
    id v17 = v17;
    *a10 = v17;
  }
LABEL_52:

  return v22;
}

+ (id)_loadModelWithClass:(Class)a3 fromArchive:(void *)a4 modelVersionInfo:(id)a5 compilerVersionInfo:(id)a6 configuration:(id)a7 error:(id *)a8
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v15 functionName];
  if (v16)
  {
    id v17 = (objc_class *)objc_opt_class();

    if (v17 != a3)
    {
      uint64_t v18 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string buf = 0;
      }

      if (a8)
      {
        v19 = (void *)MEMORY[0x1E4F28C58];
        v20 = uint64_t v36 = *MEMORY[0x1E4F28568];
        v37[0] = v20;
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
        *a8 = [v19 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v21];
      }
      goto LABEL_26;
    }
  }
  if ([(objc_class *)a3 conformsToProtocol:&unk_1EF121F20])
  {
    v22 = a3;
    v23 = [(objc_class *)v22 loadModelFromCompiledArchive:a4 modelVersionInfo:v13 compilerVersionInfo:v14 configuration:v15 error:a8];

    if (!v23) {
      goto LABEL_26;
    }
LABEL_12:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = [[MLDelegateModel alloc] initWithEngine:v23 error:a8];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v27 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          *(_DWORD *)std::string buf = 138412290;
          v35 = v33;
          _os_log_error_impl(&dword_19E58B000, v27, OS_LOG_TYPE_ERROR, "Logic error: engine is not a MLModel, but it is %@.", buf, 0xCu);
        }
        v28 = (void *)MEMORY[0x1E4F1CA00];
        BOOL v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        [v28 raise:*MEMORY[0x1E4F1C3B8], @"Logic error: engine is not a MLModel, but it is %@.", v30 format];

        long long v26 = 0;
        goto LABEL_23;
      }
      id v24 = v23;
    }
    long long v26 = v24;
LABEL_23:

    goto LABEL_27;
  }
  if ([(objc_class *)a3 conformsToProtocol:&unk_1EF11F810])
  {
    v23 = +[MLModelIOUtils loadFromModelSpecificationInArchive:a4 withClass:a3 versionInfo:v13 configuration:v15 error:a8];
    if (v23) {
      goto LABEL_12;
    }
    if (!a8 || *a8) {
      goto LABEL_26;
    }
    id v25 = +[MLModelErrorUtils IOErrorWithFormat:@"Unable to load model"];
LABEL_16:
    long long v26 = 0;
    *a8 = v25;
    goto LABEL_27;
  }
  if (a8)
  {
    id v25 = +[MLModelErrorUtils IOErrorWithFormat:@"Loading class must conform to serializable protocols"];
    goto LABEL_16;
  }
LABEL_26:
  long long v26 = 0;
LABEL_27:

  return v26;
}

+ (id)_loadModelFromArchive:(void *)a3 configuration:(id)a4 loaderEvent:(id)a5 useUpdatableModelLoaders:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = v13;
  if (v13) {
    [v13 extractAndSetModelDetailsFromArchive:a3];
  }
  id v15 = [a1 _conformConfiguration:v12 usingModelArchive:a3];

  id v40 = [v15 parentModelName];
  id v41 = [v15 modelDisplayName];
  int v42 = [v15 allowsInstrumentation];
  uint64_t v16 = +[MLLogging coreChannel];
  os_signpost_id_t spid = os_signpost_id_generate(v16);

  if (v42)
  {
    id v17 = +[MLLogging coreChannel];
    uint64_t v18 = v17;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136446466;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = [v41 UTF8String];
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = [v40 UTF8String];
      _os_signpost_emit_with_name_impl(&dword_19E58B000, v18, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MLModel_Load", "Model-name:%{public}sParent-model-name:%{public}s", (uint8_t *)&buf, 0x16u);
    }
  }
  uint64_t v19 = mach_absolute_time();
  v20 = [a1 _findCodedObjectURLInModelArchive:a3];
  if (v20) {
    +[MLLoader _unarchiveCodedModelObjectAtURL:v20 error:a7];
  }
  else {
  v21 = [a1 _loadWithModelLoaderFromArchive:a3 configuration:v15 loaderEvent:v14 useUpdatableModelLoaders:v8 error:a7];
  }
  if (v21)
  {
    v22 = (void *)MEMORY[0x1E4F1CB10];
    v23 = NSString;
    uint64_t v24 = *(void *)a3;
    if (*(char *)(*(void *)a3 + 31) < 0)
    {
      std::string::__init_copy_ctor_external(&buf, *(const std::string::value_type **)(v24 + 8), *(void *)(v24 + 16));
    }
    else
    {
      long long v25 = *(_OWORD *)(v24 + 8);
      buf.__r_.__value_.__r.__words[2] = *(void *)(v24 + 24);
      *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v25;
    }
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    BOOL v29 = [v23 stringWithUTF8String:p_buf];
    v30 = [v22 fileURLWithPath:v29];

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    int v31 = [v21 modelDescription];
    [v31 setModelURL:v30];

    std::string::basic_string[abi:ne180100]<0>(__p, "updateParameters");
    uint64_t hasNestedArchive = IArchive::hasNestedArchive(a3, __p);
    if (v44 < 0) {
      operator delete(__p[0]);
    }
    v33 = [v21 modelDescription];
    [v33 setIsUpdatable:hasNestedArchive];

    [v21 enableInstrumentsTracingIfNeeded];
    uint64_t v26 = [v21 signpostID];
    if (v14) {
      [a1 _populateLoaderAndPredictionEvent:v14 model:v21 configuration:v15 loadTimeDuration:mach_absolute_time() - v19];
    }
    id v27 = v21;
  }
  else
  {
    uint64_t v26 = 0;
    id v27 = 0;
  }

  if (v42)
  {
    v34 = +[MLLogging coreChannel];
    v35 = v34;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      std::string::size_type v36 = [v41 UTF8String];
      std::string::size_type v37 = [v40 UTF8String];
      LODWORD(buf.__r_.__value_.__l.__data_) = 136446722;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v36;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2082;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v37;
      HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
      uint64_t v46 = v26;
      _os_signpost_emit_with_name_impl(&dword_19E58B000, v35, OS_SIGNPOST_INTERVAL_END, spid, "MLModel_Load", "Model-name:%{public}sParent-model-name:%{public}sModel-id:%llu", (uint8_t *)&buf, 0x20u);
    }
  }

  return v27;
}

+ (id)_conformConfiguration:(id)a3 usingModelArchive:(void *)a4
{
  id v5 = a3;
  v6 = (void *)[v5 copy];
  v7 = NSString;
  uint64_t v8 = *(void *)a4;
  if (*(char *)(*(void *)a4 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v8 + 8), *(void *)(v8 + 16));
  }
  else
  {
    long long v9 = *(_OWORD *)(v8 + 8);
    __p.__r_.__value_.__r.__words[2] = *(void *)(v8 + 24);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v11 = objc_msgSend(v7, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:1];
  int v13 = [v5 allowsInstrumentation];
  id v14 = v12;
  objc_msgSend(v6, "setAllowsInstrumentation:", MLLoggingAllowsInstrumentation(v13, (const char *)objc_msgSend(v14, "fileSystemRepresentation")));
  id v15 = [v6 modelDisplayName];

  if (!v15)
  {
    if ((*(unsigned int (**)(void))(**(void **)a4 + 56))() == 1)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Unnamed_Model"];
    }
    else
    {
      id v17 = [v14 URLByDeletingPathExtension];
      uint64_t v16 = [v17 lastPathComponent];
    }
    [v6 setModelDisplayName:v16];
  }

  return v6;
}

+ (id)_findCodedObjectURLInModelArchive:(void *)a3
{
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = +[MLArchivingUtils codedObjectURLFromInputArchiver:a3];
  v6 = [v5 path];
  int v7 = [v4 fileExistsAtPath:v6];

  if (v7) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (id)_loadWithModelLoaderFromArchive:(void *)a3 configuration:(id)a4 loaderEvent:(id)a5 useUpdatableModelLoaders:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  unsigned int v31 = 0;
  id v29 = 0;
  id v30 = 0;
  BOOL v14 = +[MLArchivingUtils parseModelArchive:a3 modelType:&v31 compilerVersion:&v30 modelVersion:&v29 error:a7];
  id v15 = v30;
  id v16 = v29;
  if (!v14)
  {
    a7 = 0;
    goto LABEL_16;
  }
  if (v13)
  {
    id v17 = [NSNumber numberWithInt:v31];
    [v13 setModelType:v17];

    uint64_t v18 = [v15 versionNumberString];
    [v13 setCompilerVersion:v18];

    uint64_t v19 = [v16 versionNumberString];
    [v13 setModelVersion:v19];
  }
  v20 = +[MLModelTypeRegistry sharedInstance];
  v21 = [v20 classesForLoadingModelType:v31 configuration:v12 isUpdatable:v8 isEncrypted:(*(uint64_t (**)(void))(**(void **)a3 + 64))()];

  if (![v21 count])
  {
    uint64_t v24 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v28 = MLModelType_Name(v31);
      *(_DWORD *)std::string buf = 136315138;
      v35 = v28;
      _os_log_error_impl(&dword_19E58B000, v24, OS_LOG_TYPE_ERROR, "No known class for loading model type %s", buf, 0xCu);
    }

    if (!a7) {
      goto LABEL_15;
    }
    long long v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    objc_msgSend(NSString, "stringWithFormat:", @"No known class for loading model type %s", MLModelType_Name(v31));
    v23 = (id *)objc_claimAutoreleasedReturnValue();
    v33 = v23;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    *a7 = [v25 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v26];

    goto LABEL_13;
  }
  v22 = [a1 _loadModelFromArchive:a3 configuration:v12 modelVersion:v16 compilerVersion:v15 loaderEvent:v13 useUpdatableModelLoaders:v8 loadingClasses:v21 error:a7];
  if (!v22)
  {
    v23 = 0;
LABEL_13:
    a7 = 0;
    goto LABEL_14;
  }
  v23 = v22;
  a7 = v23;
LABEL_14:

LABEL_15:
LABEL_16:

  return a7;
}

+ (id)loadModelFromAssetAtURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MLLoaderEvent);
  id v18 = 0;
  v11 = [a1 _loadModelFromAssetAtURL:v8 configuration:v9 loaderEvent:v10 error:&v18];
  id v12 = v18;
  id v13 = v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    [(MLLoaderEvent *)v10 setModelLoadError:&unk_1EF11A310];
  }
  else
  {
    id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "code"));
    [(MLLoaderEvent *)v10 setModelLoadError:v15];
  }
  id v16 = +[MLReporter reporter];
  [v16 logMetric:v10];

  if (a5) {
    *a5 = v13;
  }

  return v11;
}

+ (id)_loadModelFromAssetAtURL:(id)a3 configuration:(id)a4 loaderEvent:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (+[MLLoader checkAssetPath:v10 error:a6])
  {
    id v22 = 0;
    char v13 = [a1 _createDecryptSessionForModelAtURL:v10 configuration:v11 decryptSession:&v22 loaderEvent:v12 error:a6];
    id v14 = v22;
    if (v13)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 fileSystemRepresentation]);
      IArchive::IArchive(&v19, (uint64_t)__p, 0);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      id v15 = [a1 _loadModelFromArchive:&v19 configuration:v11 loaderEvent:v12 useUpdatableModelLoaders:0 error:a6];
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v21);
      if (v20) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v20);
      }
      [v15 setDecryptSession:v14];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (BOOL)checkAssetPath:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ([v5 isFileURL])
    {
      id v17 = 0;
      char v7 = [v6 checkResourceIsReachableAndReturnError:&v17];
      id v8 = v17;
      if (a4) {
        char v9 = v7;
      }
      else {
        char v9 = 1;
      }
      if ((v9 & 1) == 0)
      {
        +[MLModelErrorUtils errorWithCode:0 underlyingError:v8 format:@"Invalid URL for .mlmodel."];
        char v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_17;
    }
    char v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 138412290;
      v21 = v6;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "URL is not a file:// URL: %@", buf, 0xCu);
    }

    if (a4)
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      id v8 = [NSString stringWithFormat:@"URL is not a file:// URL: %@", v6];
      id v19 = v8;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      *a4 = [v14 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v15];

      goto LABEL_16;
    }
LABEL_18:
    char v7 = 0;
    goto LABEL_19;
  }
  id v10 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "nil value for URL", buf, 2u);
  }

  if (!a4) {
    goto LABEL_18;
  }
  id v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v22 = *MEMORY[0x1E4F28568];
  id v8 = [NSString stringWithFormat:@"nil value for URL"];
  v23[0] = v8;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  *a4 = [v11 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v12];

LABEL_16:
  char v7 = 0;
LABEL_17:

LABEL_19:
  return v7;
}

+ (BOOL)_createDecryptSessionForModelAtURL:(id)a3 configuration:(id)a4 decryptSession:(id *)a5 loaderEvent:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  BOOL v14 = +[MLKeyManager isModelEncrypted:v11];
  BOOL v15 = v14;
  if (v13)
  {
    if (v14) {
      id v16 = &unk_1EF11A2E0;
    }
    else {
      id v16 = &unk_1EF11A2F8;
    }
    [v13 setModelIsEncrypted:v16];
  }
  if (v15 && ([v12 usePreloadedKey] & 1) == 0)
  {
    uint64_t v18 = +[MLKeyManager decryptSessionForModelAtURL:v11 error:a7];
    id v19 = v18;
    BOOL v17 = v18 != 0;
    if (v18) {
      *a5 = v18;
    }
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

+ (id)_loadModelAssetDescriptionFromArchive:(void *)a3 configuration:(id)a4 modelVersion:(id)a5 compilerVersion:(id)a6 loadingClasses:(id)a7 error:(id *)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v29 = a4;
  id v30 = a5;
  id v12 = a6;
  id v13 = a7;
  (*(void (**)(void))(**(void **)(*(void *)a3 + 32) + 16))(*(void *)(*(void *)a3 + 32));
  std::istream::tellg();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v14)
  {
    id v25 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);

        IArchive::rewind((uint64_t)a3);
        (*(void (**)(void))(**(void **)(*(void *)a3 + 32) + 16))(*(void *)(*(void *)a3 + 32));
        long long v43 = v53;
        long long v44 = v54;
        uint64_t v45 = v55;
        long long v39 = v49;
        long long v40 = v50;
        long long v41 = v51;
        long long v42 = v52;
        long long v37 = v47;
        long long v38 = v48;
        std::istream::seekg();
        if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EF121DD8, v25))
        {
          id v19 = v18;
          id v32 = 0;
          v20 = [v19 loadModelAssetDescriptionFromCompiledArchive:a3 modelVersionInfo:v30 compilerVersionInfo:v12 configuration:v29 error:&v32];
          id v15 = v32;

          if (v20) {
            goto LABEL_15;
          }
        }
        else
        {
          id v31 = 0;
          v21 = [a1 _loadModelWithClass:v18 fromArchive:a3 modelVersionInfo:v30 compilerVersionInfo:v12 configuration:v29 error:&v31];
          id v15 = v31;
          if (v21)
          {
            uint64_t v22 = [MLModelAssetDescription alloc];
            v23 = [v21 modelDescription];
            v20 = [(MLModelAssetDescription *)v22 initWithRawModelDescription:v23];

            goto LABEL_15;
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v46 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    v20 = 0;
LABEL_15:

    if (a8 && v15)
    {
      id v15 = v15;
      *a8 = v15;
    }
  }
  else
  {

    v20 = 0;
    id v15 = 0;
  }

  return v20;
}

+ (id)loadUpdatableModelFromArchive:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v5 = [a1 _loadModelFromArchive:a3 configuration:a4 loaderEvent:0 useUpdatableModelLoaders:1 error:a5];

  return v5;
}

+ (id)loadModelFromArchive:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  char v9 = objc_alloc_init(MLLoaderEvent);
  id v17 = 0;
  id v10 = [a1 _loadModelFromArchive:a3 configuration:v8 loaderEvent:v9 useUpdatableModelLoaders:0 error:&v17];
  id v11 = v17;
  id v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    [(MLLoaderEvent *)v9 setModelLoadError:&unk_1EF11A310];
  }
  else
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "code"));
    [(MLLoaderEvent *)v9 setModelLoadError:v14];
  }
  id v15 = +[MLReporter reporter];
  [v15 logMetric:v9];

  if (a5) {
    *a5 = v12;
  }

  return v10;
}

+ (id)loadModelFromArchive:(void *)a3 error:(id *)a4
{
  v6 = objc_alloc_init(MLModelConfiguration);
  char v7 = +[MLLoader loadModelFromArchive:a3 configuration:v6 error:a4];

  return v7;
}

+ (id)_loadUpdatableModelWithClass:(Class)a3 fromArchive:(void *)a4 modelVersionInfo:(id)a5 compilerVersionInfo:(id)a6 configuration:(id)a7 error:(id *)a8
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (([(objc_class *)a3 conformsToProtocol:&unk_1EF1247D8] & 1) == 0)
  {
    id v19 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Selected model loader does not support updatable models.", buf, 2u);
    }

    if (!a8)
    {
      v21 = 0;
      goto LABEL_19;
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    uint64_t v16 = [NSString stringWithFormat:@"Selected model loader does not support updatable models."];
    v32[0] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v20 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v17];
    v21 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  uint64_t v16 = a3;
  id v17 = [(objc_class *)v16 loadModelFromCompiledArchive:a4 modelVersionInfo:v13 compilerVersionInfo:v14 configuration:v15 error:a8];
  if (!v17)
  {
    v21 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [[MLDelegateUpdatableModel alloc] initWithEngine:v17 error:a8];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v22 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = (objc_class *)objc_opt_class();
        id v27 = NSStringFromClass(v26);
        *(_DWORD *)std::string buf = 138412290;
        id v30 = v27;
        _os_log_error_impl(&dword_19E58B000, v22, OS_LOG_TYPE_ERROR, "Logic error: engine is not a MLModel, but it is %@.", buf, 0xCu);
      }
      v23 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      [v23 raise:*MEMORY[0x1E4F1C3B8], @"Logic error: engine is not a MLModel, but it is %@.", v25 format];

      v21 = 0;
      goto LABEL_16;
    }
    uint64_t v18 = v17;
    id v17 = v18;
  }
  v21 = v18;
LABEL_16:

LABEL_18:
LABEL_19:

  return v21;
}

+ (id)_unarchiveCodedModelObjectAtURL:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v28 = 0;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v5 options:2 error:&v28];
  id v7 = v28;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = objc_opt_class();
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    id v10 = [v8 setWithArray:v9];

    id v27 = v7;
    id v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v10 fromData:v6 error:&v27];
    id v12 = v27;

    if (v11)
    {
      id v13 = v11;
      id v7 = v12;
      a4 = v13;
    }
    else
    {
      uint64_t v18 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [v12 localizedDescription];
        *(_DWORD *)std::string buf = 138412546;
        id v35 = v5;
        __int16 v36 = 2112;
        long long v37 = v26;
        _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "Failed to unarchive model at %@ with error: %@", buf, 0x16u);
      }
      if (a4)
      {
        id v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        v20 = NSString;
        v21 = [v12 localizedDescription];
        uint64_t v22 = [v20 stringWithFormat:@"Failed to unarchive model at %@ with error: %@", v5, v21];
        id v30 = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        *a4 = [v19 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v23];

        id v13 = 0;
        a4 = 0;
      }
      else
      {
        id v13 = 0;
      }
      id v7 = v12;
    }
    goto LABEL_14;
  }
  id v14 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v25 = [v7 localizedDescription];
    *(_DWORD *)std::string buf = 138412546;
    id v35 = v5;
    __int16 v36 = 2112;
    long long v37 = v25;
    _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "Failed to open coded model at %@ with error: %@", buf, 0x16u);
  }
  if (a4)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    uint64_t v16 = NSString;
    id v10 = [v7 localizedDescription];
    id v13 = [v16 stringWithFormat:@"Failed to open coded model at %@ with error: %@", v5, v10];
    long long v33 = v13;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    *a4 = [v15 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v17];

    a4 = 0;
LABEL_14:
  }

  return a4;
}

+ (id)loadUpdatableModelFromAssetAtURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (([a1 checkAssetPath:v8 error:a5] & 1) == 0)
  {
LABEL_7:
    id v14 = 0;
    goto LABEL_8;
  }
  if (+[MLKeyManager isModelEncrypted:v8])
  {
    id v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 138412290;
      *(void *)id v19 = v8;
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "Updating encrypted model %@ is not supported.", buf, 0xCu);
    }

    if (a5)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      id v12 = [NSString stringWithFormat:@"Updating encrypted model %@ is not supported.", v8];
      v22[0] = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      *a5 = [v11 errorWithDomain:@"com.apple.CoreML" code:9 userInfo:v13];
    }
    goto LABEL_7;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 fileSystemRepresentation]);
  IArchive::IArchive((uint64_t *)buf, (uint64_t)__p, 0);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  id v14 = [a1 loadUpdatableModelFromArchive:buf configuration:v9 error:a5];
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v20);
  if (*(void *)&v19[4]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v19[4]);
  }
LABEL_8:

  return v14;
}

+ (id)loadModelAssetDescriptionFromArchive:(void *)a3 error:(id *)a4
{
  v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v21 = 0;
  id v19 = 0;
  id v20 = 0;
  BOOL v7 = +[MLArchivingUtils parseModelArchive:a3 modelType:&v21 compilerVersion:&v20 modelVersion:&v19 error:a4];
  id v8 = v20;
  id v9 = v19;
  if (v7)
  {
    id v10 = +[MLModelConfiguration defaultConfiguration];
    id v11 = +[MLModelTypeRegistry sharedInstance];
    id v12 = [v11 classesForLoadingModelType:v21 configuration:v10 isUpdatable:0 isEncrypted:(*(uint64_t (**)(void))(**(void **)a3 + 64))()];

    if ([v12 count])
    {
      v4 = [a1 _loadModelAssetDescriptionFromArchive:a3 configuration:v10 modelVersion:v9 compilerVersion:v8 loadingClasses:v12 error:v4];
    }
    else
    {
      id v13 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = MLModelType_Name(v21);
        *(_DWORD *)std::string buf = 136315138;
        id v25 = v18;
        _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "No known class for loading model type %s", buf, 0xCu);
      }

      if (v4)
      {
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28568];
        id v15 = objc_msgSend(NSString, "stringWithFormat:", @"No known class for loading model type %s", MLModelType_Name(v21));
        v23 = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        void *v4 = [v14 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v16];

        v4 = 0;
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)loadModelAssetDescriptionFromAssetAtURL:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (+[MLLoader checkAssetPath:v6 error:a4])
  {
    BOOL v7 = objc_alloc_init(MLModelConfiguration);
    id v14 = 0;
    char v8 = [a1 _createDecryptSessionForModelAtURL:v6 configuration:v7 decryptSession:&v14 loaderEvent:0 error:a4];
    id v9 = v14;
    if (v8)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 fileSystemRepresentation]);
      IArchive::IArchive(&buf, (uint64_t)__p, 0);
      if (v13 < 0) {
        operator delete(__p[0]);
      }
      id v10 = [a1 loadModelAssetDescriptionFromArchive:&buf error:a4];
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v17);
      if (v16) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v16);
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)loadModelFromAssetAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MLModelConfiguration);
  BOOL v7 = +[MLLoader loadModelFromAssetAtURL:v5 configuration:v6 error:a4];

  return v7;
}

@end