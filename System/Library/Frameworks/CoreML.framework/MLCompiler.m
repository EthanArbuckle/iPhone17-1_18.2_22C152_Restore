@interface MLCompiler
+ (BOOL)_loadSpecificationAtURL:(id)a3 to:(void *)a4 error:(id *)a5;
+ (BOOL)canAddMLProgramToCompiledModelAtURL:(id)a3;
+ (BOOL)encryptCompiledModelAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)encryptFileAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (BOOL)fillCompilerEvent:(id)a3 withMetadataFromModelAt:(id)a4 error:(id *)a5;
+ (BOOL)fingerprintSpecificationAtURL:(id)a3 toArchive:(void *)a4 hash:(id)a5 error:(id *)a6;
+ (BOOL)storeEncryptionInfoInCompiledArchive:(void *)a3 options:(id)a4 error:(id *)a5;
+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7;
+ (id)_compileSpecificationAtURL:(id)a3 toURL:(id)a4 compiledModelName:(id)a5 overridingModelDescription:(id)a6 options:(id)a7 error:(id *)a8;
+ (id)addMLProgramToCompiledModelAtURL:(id)a3 error:(id *)a4;
+ (id)addMLProgramToCompiledModelAtURL:(id)a3 withCompilationMode:(int)a4 dryRun:(BOOL)a5 oarchiveForModelCompilation:(void *)a6 compilerEvent:(id)a7 error:(id *)a8;
+ (id)compileModelAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 compilerClass:(Class)a5 toArchive:(void *)a6 options:(id)a7 error:(id *)a8;
+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 compilerEvent:(id)a7 error:(id *)a8;
+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7;
+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6;
+ (id)compileSpecificationAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)compiledVersionForModelAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5;
+ (id)compiledVersionForSpecificationAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4;
+ (id)hashSpecificationAtURL:(id)a3;
+ (id)versionInfo;
+ (void)_updateFeatures:(void *)a3 withFeatures:(id)a4;
+ (void)_updateMetadata:(void *)a3 withMetadata:(id)a4;
+ (void)_updateSpecification:(void *)a3 withModelDescription:(id)a4;
@end

@implementation MLCompiler

+ (id)compiledVersionForModelAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = +[MLModelIOUtils specificationURLFromModelAtURL:a3 error:a5];
  if (v9)
  {
    v10 = [a1 compiledVersionForSpecificationAtURL:v9 options:v8 error:a5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)canAddMLProgramToCompiledModelAtURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 URLByAppendingPathComponent:@"model.espresso.net"];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v4 path];
  char v7 = [v5 fileExistsAtPath:v6];

  if (v7)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    while (1)
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"model%d", v9);
      v11 = [v3 URLByAppendingPathComponent:v10];

      v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      v13 = [v11 path];
      char v8 = [v12 fileExistsAtPath:v13];

      if ((v8 & 1) == 0
        || +[MLCompiler canAddMLProgramToCompiledModelAtURL:v11])
      {
        break;
      }
      uint64_t v9 = (v9 + 1);
    }
  }

  return v8;
}

+ (id)addMLProgramToCompiledModelAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = objc_opt_new();
  char v8 = objc_alloc_init(MLCompilerEvent);
  [a1 fillCompilerEvent:v8 withMetadataFromModelAt:v6 error:0];
  uint64_t v9 = +[MLReporter reporter];
  [v9 logMetric:v8];

  if (a4) {
    v10 = v7;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

+ (id)compileModelAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v28 = a4;
  id v11 = a5;
  v12 = [v10 lastPathComponent];
  v13 = [v12 stringByDeletingPathExtension];

  id v14 = [v10 absoluteString];
  int v15 = MLLoggingAllowsInstrumentation(1, (const char *)[v14 UTF8String]);

  v16 = +[MLLogging coreChannel];
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  if (v15)
  {
    v18 = +[MLLogging coreChannel];
    v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v34 = [v13 UTF8String];
      _os_signpost_emit_with_name_impl(&dword_19E58B000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "MLModel_Compile", "Model-name:%{public}s", buf, 0xCu);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MLCompiler_compileModelAtURL_toURL_options_error___block_invoke;
  aBlock[3] = &unk_1E59A4A40;
  char v32 = v15;
  os_signpost_id_t v31 = v17;
  id v20 = v13;
  id v30 = v20;
  v21 = (void (**)(void))_Block_copy(aBlock);
  v22 = +[MLModelIOUtils specificationURLFromModelAtURL:v10 error:a6];
  if (v22)
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F73650]) initWithContentsOfURL:v10 error:a6];
    v24 = v23;
    if (v23)
    {
      v25 = [v23 modelDescription];
      v26 = [a1 _compileSpecificationAtURL:v22 toURL:v28 compiledModelName:v20 overridingModelDescription:v25 options:v11 error:a6];
    }
    else
    {
      v26 = 0;
    }
  }
  else
  {
    v26 = 0;
  }

  v21[2](v21);

  return v26;
}

void __52__MLCompiler_compileModelAtURL_toURL_options_error___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = +[MLLogging coreChannel];
    id v3 = v2;
    os_signpost_id_t v4 = *(void *)(a1 + 40);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      uint64_t v5 = [*(id *)(a1 + 32) UTF8String];
      int v6 = 136446210;
      uint64_t v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_19E58B000, v3, OS_SIGNPOST_INTERVAL_END, v4, "MLModel_Compile", "Model-name:%{public}s", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = *(unsigned int *)(*(void *)a3 + 44);
  uint64_t v9 = +[MLModelTypeRegistry sharedInstance];
  id v10 = (void *)[v9 classForCompilingModelType:v8];

  if (!v10)
  {
    v12 = [NSString stringWithUTF8String:MLModelType_Name(v8)];
    if (!a5)
    {
LABEL_12:

      a5 = 0;
      goto LABEL_13;
    }
    v13 = +[MLModelErrorUtils IOErrorWithFormat:@"No known class for compiling model type %@", v12];
LABEL_11:
    *a5 = v13;
    goto LABEL_12;
  }
  if ([v10 conformsToProtocol:&unk_1EF1212D0])
  {
    id v11 = [v10 compiledVersionForSpecification:a3 options:v7 error:a5];
LABEL_8:
    a5 = v11;
    goto LABEL_13;
  }
  if ([v10 conformsToProtocol:&unk_1EF11F810])
  {
    id v11 = +[MLModelIOUtils versionForSerializedSpecification:a3 options:v7 error:a5];
    goto LABEL_8;
  }
  if (a5)
  {
    v12 = [NSString stringWithUTF8String:MLModelType_Name(v8)];
    v13 = +[MLModelErrorUtils IOErrorWithFormat:@"Invalid compiling class %@ for model type %@", v10, v12];
    goto LABEL_11;
  }
LABEL_13:

  return a5;
}

+ (id)compiledVersionForSpecificationAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification5ModelENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v12);
  if ([a1 _loadSpecificationAtURL:v8 to:&v12 error:a5])
  {
    id v10 = [a1 compiledVersionForSpecification:&v12 options:v9 error:a5];
  }
  else
  {
    id v10 = 0;
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }

  return v10;
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 compilerEvent:(id)a7 error:(id *)a8
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v69 = a4;
  id v70 = a6;
  id v13 = a7;
  id v14 = (void *)MEMORY[0x1E4F1CB10];
  int v15 = NSString;
  uint64_t v16 = *((void *)a5 + 1);
  if (*(char *)(v16 + 55) < 0) {
    std::string::__init_copy_ctor_external(&v79, *(const std::string::value_type **)(v16 + 32), *(void *)(v16 + 40));
  }
  else {
    std::string v79 = *(std::string *)(v16 + 32);
  }
  if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    os_signpost_id_t v17 = &v79;
  }
  else {
    os_signpost_id_t v17 = (std::string *)v79.__r_.__value_.__r.__words[0];
  }
  v18 = [v15 stringWithUTF8String:v17];
  v19 = [v14 URLWithString:v18];
  id v20 = [v19 lastPathComponent];
  v21 = [v20 stringByDeletingPathExtension];
  [v13 setModelName:v21];

  if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v79.__r_.__value_.__l.__data_);
  }
  v22 = [NSString stringWithUTF8String:"3402.5.1"];
  [v13 setCompilerVersion:v22];

  v23 = [v13 compilerVersion];
  [v13 setModelCompiledWithVersion:v23];

  if (*(void *)(*(void *)a3 + 16)) {
    v24 = *(const CoreML::Specification::ModelDescription **)(*(void *)a3 + 16);
  }
  else {
    v24 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  }
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)v75, v24);
  id v25 = [[MLModelAssetDescription alloc] initFromModelDescriptionSpecification:v75];
  v26 = v25;
  if (v25)
  {
    v27 = [v25 defaultModelDescription];
    id v28 = [v27 metadata];
    v29 = [v28 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      os_signpost_id_t v31 = NSNumber;
      char v32 = [v27 metadata];
      v33 = [v32 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
      uint64_t v34 = [v31 modelOriginNumberFromUserDefinedDictionary:v33];
      [v13 setModelOrigin:v34];
    }
  }

  uint64_t v35 = *(unsigned int *)(*(void *)a3 + 44);
  uint64_t v36 = [NSNumber numberWithInt:v35];
  [v13 setModelType:v36];

  operator<<((uint64_t)a5, v35);
  [a1 compiledVersionForSpecification:a3 options:v70 error:a8];
  v37 = v74[1] = 0;
  LOBYTE(v36) = +[MLModelIOUtils serializeVersionInfo:archive:error:](MLModelIOUtils, "serializeVersionInfo:archive:error:");
  id v38 = 0;
  id v39 = v38;
  if (v36)
  {
    v68 = +[MLVersionInfo versionInfoWithMajor:*(int *)(*(void *)a3 + 24) minor:0 patch:0 variant:&stru_1EF0E81D0];
    uint64_t v40 = [v68 versionString];
    [v13 setModelVersion:v40];

    v74[0] = v39;
    LOBYTE(v40) = +[MLModelIOUtils serializeVersionInfo:v68 archive:a5 error:v74];
    id v41 = v74[0];

    if (v40)
    {
      v42 = +[MLModelTypeRegistry sharedInstance];
      v43 = (void *)[v42 classForCompilingModelType:v35];

      if (v43)
      {
        if ([v43 conformsToProtocol:&unk_1EF1212D0])
        {
          id v73 = v41;
          v44 = [a1 compileSpecification:a3 blobMapping:v69 compilerClass:v43 toArchive:a5 options:v70 error:&v73];
          id v39 = v73;

          if (v44)
          {
            if ((*(unsigned int (**)(void))(**((void **)a5 + 1) + 48))(*((void *)a5 + 1)) == 1)
            {
LABEL_43:
              v48 = v68;
              goto LABEL_44;
            }
            v45 = (void *)MEMORY[0x1E4F1CB10];
            v46 = NSString;
            uint64_t v47 = *((void *)a5 + 1);
            if (*(char *)(v47 + 55) < 0) {
              std::string::__init_copy_ctor_external(&v79, *(const std::string::value_type **)(v47 + 32), *(void *)(v47 + 40));
            }
            else {
              std::string v79 = *(std::string *)(v47 + 32);
            }
            if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v61 = &v79;
            }
            else {
              v61 = (std::string *)v79.__r_.__value_.__r.__words[0];
            }
            v62 = [v46 stringWithUTF8String:v61];
            v49 = [v45 fileURLWithPath:v62];

            if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v79.__r_.__value_.__l.__data_);
            }
            v63 = +[MLCompiler addMLProgramToCompiledModelAtURL:withCompilationMode:dryRun:oarchiveForModelCompilation:compilerEvent:error:](MLCompiler, "addMLProgramToCompiledModelAtURL:withCompilationMode:dryRun:oarchiveForModelCompilation:compilerEvent:error:", v49, [v70 mlProgramAddDuringCompilationMode], objc_msgSend(v70, "dryRun"), a5, v13, a8);
            if (v63)
            {
              v64 = [v44 outputFiles];
              v65 = [v63 outputFiles];
              v66 = [v64 arrayByAddingObjectsFromArray:v65];
              [v44 setOutputFiles:v66];

              goto LABEL_65;
            }

            v49 = v44;
            id v41 = v39;
LABEL_67:
            v44 = 0;
            goto LABEL_40;
          }
          if (a8)
          {
            v57 = [v39 localizedDescription];
            *a8 = +[MLModelErrorUtils genericErrorWithFormat:@"%@ %@", @"compiler error:", v57];

            if ([v39 code] == 4)
            {
              id v58 = objc_alloc(MEMORY[0x1E4F1CA60]);
              v59 = [*a8 userInfo];
              v49 = (void *)[v58 initWithDictionary:v59];

              [v49 setValue:v39 forKey:*MEMORY[0x1E4F28A50]];
              id v60 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreML" code:4 userInfo:v49];
              *a8 = v60;

              v44 = 0;
LABEL_65:
              id v41 = v39;
              goto LABEL_40;
            }
          }
          goto LABEL_56;
        }
        if ([v43 conformsToProtocol:&unk_1EF11F810])
        {
          if (!v69)
          {
            id v72 = v41;
            v44 = +[MLModelIOUtils serializeSpecification:a3 toArchive:a5 error:&v72];
            id v39 = v72;

            if (v44) {
              goto LABEL_43;
            }
            if (a8)
            {
              v49 = [v39 localizedDescription];
              +[MLModelErrorUtils genericErrorWithFormat:@"%@ %@", @"compiler error:", v49];
              v44 = 0;
              *a8 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_65;
            }
LABEL_56:
            v44 = 0;
            goto LABEL_43;
          }
          v51 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v67 = [NSString stringWithUTF8String:MLModelType_Name(v35)];
            LODWORD(v79.__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v79.__r_.__value_.__r.__words + 4) = (std::string::size_type)v67;
            _os_log_error_impl(&dword_19E58B000, v51, OS_LOG_TYPE_ERROR, "The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification.", (uint8_t *)&v79, 0xCu);
          }
          if (a8)
          {
            v52 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v77 = *MEMORY[0x1E4F28568];
            v53 = NSString;
            v49 = [NSString stringWithUTF8String:MLModelType_Name(v35)];
            v54 = [v53 stringWithFormat:@"The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification.", v49];
            v78 = v54;
            v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            *a8 = [v52 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v55];

            goto LABEL_67;
          }
LABEL_41:
          v44 = 0;
          goto LABEL_42;
        }
        if (!a8) {
          goto LABEL_41;
        }
        v49 = [NSString stringWithUTF8String:MLModelType_Name(v35)];
        id v50 = +[MLModelErrorUtils IOErrorWithFormat:@"%@ Invalid compiling class %@ for model type %@", @"compiler error:", v43, v49];
      }
      else
      {
        if (!a8) {
          goto LABEL_41;
        }
        v49 = [NSString stringWithUTF8String:MLModelType_Name(v35)];
        id v50 = +[MLModelErrorUtils IOErrorWithFormat:@"%@ No known class for compiling model type %@", @"compiler error:", v49];
      }
    }
    else
    {
      if (!a8) {
        goto LABEL_41;
      }
      v49 = [v41 localizedDescription];
      id v50 = +[MLModelErrorUtils genericErrorWithFormat:@"%@ %@", @"compiler error:", v49];
    }
    v44 = 0;
    *a8 = v50;
LABEL_40:

LABEL_42:
    id v39 = v41;
    goto LABEL_43;
  }
  if (!a8)
  {
    v44 = 0;
    goto LABEL_45;
  }
  v48 = [v38 localizedDescription];
  +[MLModelErrorUtils genericErrorWithFormat:@"%@ %@", @"compiler error:", v48];
  v44 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

LABEL_45:
  if (v76) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v76);
  }

  return v44;
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 compilerClass:(Class)a5 toArchive:(void *)a6 options:(id)a7 error:(id *)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a7;
  if (!v13)
  {
    int v15 = [(objc_class *)a5 compileSpecification:a3 toArchive:a6 options:v14 error:a8];
    goto LABEL_5;
  }
  if ([(objc_class *)a5 conformsToProtocol:&unk_1EF121330])
  {
    int v15 = [(objc_class *)a5 compileSpecification:a3 blobMapping:v13 toArchive:a6 options:v14 error:a8];
LABEL_5:
    a8 = v15;
    goto LABEL_10;
  }
  int v16 = *(_DWORD *)(*(void *)a3 + 44);
  os_signpost_id_t v17 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v24 = [NSString stringWithUTF8String:MLModelType_Name(v16)];
    *(_DWORD *)buf = 138412290;
    id v28 = v24;
    _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification.", buf, 0xCu);
  }
  if (a8)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v19 = NSString;
    id v20 = [NSString stringWithUTF8String:MLModelType_Name(v16)];
    v21 = [v19 stringWithFormat:@"The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification.", v20];
    v26 = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    *a8 = [v18 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v22];

    a8 = 0;
  }
LABEL_10:

  return a8;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  int v6 = [a1 _compileSpecification:a3 blobMapping:0 toArchive:a4 options:a5 error:a6];

  return v6;
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  id v7 = [a1 _compileSpecification:a3 blobMapping:a4 toArchive:a5 options:a6 error:a7];

  return v7;
}

+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = objc_alloc_init(MLCompilerEvent);
  int v15 = [a1 compileSpecification:a3 blobMapping:v12 toArchive:a5 options:v13 compilerEvent:v14 error:a7];
  int v16 = +[MLReporter reporter];
  [v16 logMetric:v14];

  return v15;
}

+ (BOOL)fingerprintSpecificationAtURL:(id)a3 toArchive:(void *)a4 hash:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  v25[0] = 0;
  v25[1] = 0;
  v24 = (uint64_t *)v25;
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [v9 path];
  int v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    id v14 = [v9 URLByDeletingPathExtension];
    int v15 = [v14 lastPathComponent];

    if (v15)
    {
      uint64_t v16 = [v15 UTF8String];
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"modelName" UTF8String]);
      v26 = __p;
      os_signpost_id_t v17 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v24, __p, (_OWORD **)&v26);
      MEMORY[0x19F3C1430]((char *)v17 + 56, v16);
      if (v23 < 0) {
        operator delete(__p[0]);
      }
    }
    uint64_t v18 = [v10 UTF8String];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"modelHash" UTF8String]);
    v26 = __p;
    v19 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v24, __p, (_OWORD **)&v26);
    MEMORY[0x19F3C1430]((char *)v19 + 56, v18);
    if (v23 < 0) {
      operator delete(__p[0]);
    }
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "SpecificationDetails");
  BOOL v20 = +[MLReporterUtils archiveModelDetails:&v24 withName:__p toArchive:a4 error:a6];
  if (v23 < 0) {
    operator delete(__p[0]);
  }

  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v25[0]);
  return v20;
}

+ (id)hashSpecificationAtURL:(id)a3
{
  id v3 = a3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5];

  id v7 = @"FailedToComputeHash";
  if (v6)
  {
    uint64_t v8 = +[MLReporterUtils hashFileAt:v3 error:0];
    if (v8) {
      id v7 = (__CFString *)v8;
    }
  }

  return v7;
}

+ (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = 0;
  id v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000;
  char v32 = __Block_byref_object_copy__15900;
  v33 = __Block_byref_object_dispose__15901;
  id v34 = 0;
  id v19 = a3;
  os_signpost_id_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = *MEMORY[0x1E4F1C628];
  v36[0] = *MEMORY[0x1E4F1C628];
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __45__MLCompiler_contentsOfDirectoryAtURL_error___block_invoke;
  v28[3] = &unk_1E59A4A18;
  v28[4] = &v29;
  BOOL v20 = [v4 enumeratorAtURL:v19 includingPropertiesForKeys:v6 options:0 errorHandler:v28];

  id v7 = v30[5];
  if (v7)
  {
    id v8 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    id v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = v20;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id obj = 0;
          id v23 = 0;
          int v15 = v30;
          char v16 = [v14 getResourceValue:&v23 forKey:v5 error:&obj];
          id v17 = v23;
          objc_storeStrong(v15 + 5, obj);
          if ((v16 & 1) == 0)
          {
            if (a4) {
              *a4 = v30[5];
            }

            id v8 = 0;
            goto LABEL_19;
          }
          if (([v17 BOOLValue] & 1) == 0) {
            [v9 addObject:v14];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v35 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v8 = v9;
LABEL_19:
  }
  _Block_object_dispose(&v29, 8);

  return v8;
}

BOOL __45__MLCompiler_contentsOfDirectoryAtURL_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }

  return v5 == 0;
}

+ (BOOL)storeEncryptionInfoInCompiledArchive:(void *)a3 options:(id)a4 error:(id *)a5
{
  v52[4] = *(char **)MEMORY[0x1E4F143B8];
  id v40 = a4;
  id v7 = [v40 keyID];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29128]);
    id v9 = [v40 keyID];
    id v10 = (void *)[v8 initWithUUIDString:v9];

    if (v10)
    {
      id v38 = v10;
      id v41 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      std::string::basic_string[abi:ne180100]<0>(&__p, "encryptionInfo");
      uint64_t v11 = OArchive::nestedArchive((char *)a3, (uint64_t)&__p);
      buf[0] = *v11;
      uint64_t v12 = *((void *)v11 + 2);
      *(void *)&v51[4] = *((void *)v11 + 1);
      *(void *)&v51[12] = v12;
      if (v12) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
      }
      std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v52, (void *)v11 + 3);
      if (v48 < 0) {
        operator delete(*(void **)&__p.__val_);
      }
      id v13 = [v40 keyID];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v13 UTF8String]);
      operator<<((uint64_t)buf, (uint64_t *)&__p.__val_);
      if (v48 < 0) {
        operator delete(*(void **)&__p.__val_);
      }

      OArchive::listFilesWritten((OArchive *)&__p, (uint64_t)buf);
      id v14 = *(const std::error_category **)&__p.__val_;
      for (uint64_t i = __p.__cat_; v14 != i; v14 += 3)
      {
        if (SHIBYTE(v14[2].__vftable) < 0)
        {
          std::string::__init_copy_ctor_external(&v46, (const std::string::value_type *)v14->__vftable, (std::string::size_type)v14[1].__vftable);
        }
        else
        {
          long long v16 = *(_OWORD *)&v14->__vftable;
          v46.__r_.__value_.__r.__words[2] = (std::string::size_type)v14[2].__vftable;
          *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v16;
        }
        if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          id v17 = &v46;
        }
        else {
          id v17 = (std::string *)v46.__r_.__value_.__r.__words[0];
        }
        uint64_t v18 = [NSString stringWithUTF8String:v17];
        [v41 addObject:v18];

        if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v46.__r_.__value_.__l.__data_);
        }
      }
      v46.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v46);
      LODWORD(v46.__r_.__value_.__l.__data_) = [v40 usesCodeSigningIdentityForEncryption];
      (*(void (**)(void))(**(void **)&v51[4] + 56))(*(void *)&v51[4]);
      std::ostream::write();
      if (!buf[0])
      {
        id v19 = (void *)(*(uint64_t (**)(void))(**(void **)&v51[4] + 56))(*(void *)&v51[4]);
        if ((*((unsigned char *)v19 + *(void *)(*v19 - 24) + 32) & 5) != 0)
        {
          exception = (std::ios_base::failure *)__cxa_allocate_exception(0x20uLL);
          v37 = std::iostream_category();
          *(void *)&__p.__val_ = 1;
          __p.__cat_ = v37;
          std::ios_base::failure::failure(exception, "Error writing to archive.", &__p);
          __cxa_throw(exception, MEMORY[0x1E4FBA300], MEMORY[0x1E4FBA298]);
        }
      }
      (*(void (**)(void))(**(void **)&v51[4] + 56))(*(void *)&v51[4]);
      std::ostream::flush();
      std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v52[1]);
      if (*(void *)&v51[12]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v51[12]);
      }
      BOOL v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = v41;
      uint64_t v21 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (!v21)
      {
        BOOL v29 = 1;
        goto LABEL_50;
      }
      uint64_t v22 = *(void *)v43;
LABEL_25:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v24 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v42 + 1) + 8 * v23)];
        long long v25 = [v24 lastPathComponent];
        long long v26 = [v24 URLByDeletingLastPathComponent];
        long long v27 = [NSString stringWithFormat:@"enc_%@", v25];
        id v28 = [v26 URLByAppendingPathComponent:v27];

        if (!+[MLModelEncryptionUtils addEncryptionHeaderToUnencryptedFile:v24 saveToFile:v28 error:a5])
        {
          uint64_t v31 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_19E58B000, v31, OS_LOG_TYPE_DEBUG, "Failed to write encryption info metadata.", buf, 2u);
          }
          goto LABEL_49;
        }
        if (([v20 removeItemAtURL:v24 error:a5] & 1) == 0) {
          break;
        }
        if (([v20 copyItemAtURL:v28 toURL:v24 error:a5] & 1) == 0)
        {
          uint64_t v31 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v51 = v28;
            *(_WORD *)&v51[8] = 2112;
            *(void *)&v51[10] = v24;
            char v32 = "Failed to copy file from %@ to %@";
            v33 = v31;
            uint32_t v34 = 22;
            goto LABEL_56;
          }
LABEL_49:

          BOOL v29 = 0;
          goto LABEL_50;
        }
        if (([v20 removeItemAtURL:v28 error:a5] & 1) == 0)
        {
          uint64_t v31 = +[MLLogging coreChannel];
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            goto LABEL_49;
          }
          *(_DWORD *)buf = 138412290;
          *(void *)v51 = v28;
          char v32 = "Failed to remove file at URL: %@";
LABEL_55:
          v33 = v31;
          uint32_t v34 = 12;
LABEL_56:
          _os_log_error_impl(&dword_19E58B000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
          goto LABEL_49;
        }

        if (v21 == ++v23)
        {
          uint64_t v21 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
          BOOL v29 = 1;
          if (v21) {
            goto LABEL_25;
          }
LABEL_50:

LABEL_51:
          id v10 = v38;
          goto LABEL_52;
        }
      }
      uint64_t v31 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v51 = v24;
        char v32 = "Failed to remove file at URL: %@";
        goto LABEL_55;
      }
      goto LABEL_49;
    }
    if (a5)
    {
      id v38 = 0;
      id v30 = [v40 keyID];
      *a5 = +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:0, @"Specified Key ID %@ is not in UUID format.", v30 format];

      BOOL v29 = 0;
      goto LABEL_51;
    }
    BOOL v29 = 0;
LABEL_52:
  }
  else if (a5)
  {
    +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:0 format:@"Key ID has to be specified while encrypting model."];
    BOOL v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

+ (BOOL)encryptFileAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 lastPathComponent];
  id v10 = [v7 URLByDeletingLastPathComponent];
  uint64_t v11 = [NSString stringWithFormat:@"enc_%@", v9];
  uint64_t v12 = [v10 URLByAppendingPathComponent:v11];

  id v13 = [v8 key];
  id v14 = [v8 iv];
  BOOL v15 = +[MLModelEncryptionUtils encryptFile:v7 withKey:v13 iv:v14 saveToFile:v12 error:a5];

  if (!v15)
  {
    long long v16 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = (uint64_t)v7;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "Failed to encrypt file at URL: %@, to file at URL: %@", buf, 0x16u);
    }
    goto LABEL_33;
  }
  long long v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v16 removeItemAtURL:v7 error:a5] & 1) == 0)
  {
    id v30 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = (uint64_t)v7;
      _os_log_error_impl(&dword_19E58B000, v30, OS_LOG_TYPE_ERROR, "Failed to remove file at URL: %@", buf, 0xCu);
    }
    goto LABEL_23;
  }
  if (([v16 copyItemAtURL:v12 toURL:v7 error:a5] & 1) == 0)
  {
    id v30 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = (uint64_t)v12;
      __int16 v36 = 2112;
      id v37 = v7;
      _os_log_error_impl(&dword_19E58B000, v30, OS_LOG_TYPE_ERROR, "Failed to copy file from %@ to %@", buf, 0x16u);
    }
    goto LABEL_23;
  }
  if (([v16 removeItemAtURL:v12 error:a5] & 1) == 0)
  {
    id v30 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = (uint64_t)v12;
      _os_log_error_impl(&dword_19E58B000, v30, OS_LOG_TYPE_ERROR, "Failed to remove file at URL: %@", buf, 0xCu);
    }
LABEL_23:

    goto LABEL_33;
  }
  id v17 = [v8 sinf];

  if (v17)
  {
    uint64_t v18 = [v7 URLByDeletingLastPathComponent];
    id v19 = [v18 URLByAppendingPathComponent:@"SC_Info"];

    if ([v16 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:a5])
    {
      BOOL v20 = [NSString stringWithFormat:@"%@.sinf", v9];
      uint64_t v21 = [v19 URLByAppendingPathComponent:v20];

      uint64_t v22 = [v8 sinf];
      char v23 = [v22 writeToURL:v21 atomically:1];

      if (v23)
      {
        long long v24 = [v8 mlsinf];

        if (!v24)
        {
LABEL_11:

          goto LABEL_12;
        }
        long long v25 = [NSString stringWithFormat:@"%@.mlsinf", v9];
        uint64_t v26 = [v19 URLByAppendingPathComponent:v25];

        long long v27 = [v8 mlsinf];
        char v28 = [v27 writeToURL:v26 atomically:1];

        if (v28)
        {
          uint64_t v21 = (void *)v26;
          goto LABEL_11;
        }
        char v32 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = v26;
          _os_log_debug_impl(&dword_19E58B000, v32, OS_LOG_TYPE_DEBUG, "Failed to write SINF to URL: %@", buf, 0xCu);
        }
        uint64_t v21 = (void *)v26;
      }
      else
      {
        char v32 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = (uint64_t)v21;
          _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "Failed to write SINF to URL: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v31 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = (uint64_t)v19;
        _os_log_error_impl(&dword_19E58B000, v31, OS_LOG_TYPE_ERROR, "Failed to create SC_Info at URL: %@", buf, 0xCu);
      }
    }
LABEL_33:
    BOOL v29 = 0;
    goto LABEL_34;
  }
LABEL_12:
  BOOL v29 = 1;
LABEL_34:

  return v29;
}

+ (id)versionInfo
{
  v2 = objc_msgSend(NSString, "stringWithCString:encoding:", "3402.5.1", objc_msgSend(NSString, "defaultCStringEncoding"));
  id v3 = +[MLVersionInfo versionInfoWithStringProgressive:v2];

  if (!v3)
  {
    id v3 = +[MLVersionInfo versionInfoWithString:@"9999.0.1"];
  }

  return v3;
}

+ (BOOL)encryptCompiledModelAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v26 = v8;
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v8 fileSystemRepresentation]);
  OArchive::OArchive((uint64_t)v35, (uint64_t)buf, [v7 dryRun]);
  if (v42 < 0) {
    operator delete(*(void **)buf);
  }
  id v34 = 0;
  id v9 = +[MLCompiler contentsOfDirectoryAtURL:v8 error:&v34];
  id v10 = v34;
  if (!v9)
  {
    char v23 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v40 = 2112;
      id v41 = v10;
      _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "Failed to list all output files with destURL=%@, error=%@", buf, 0x16u);
    }

    if (!a5) {
      goto LABEL_27;
    }
    id v11 = [v10 localizedDescription];
    *a5 = +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:0, @"%@ %@", @"compiler error:", v11 format];
LABEL_26:

LABEL_27:
    BOOL v20 = 0;
    goto LABEL_28;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v31;
    while (2)
    {
      uint64_t v14 = 0;
      BOOL v15 = v10;
      do
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * v14);
        id v29 = v15;
        BOOL v17 = +[MLCompiler encryptFileAtURL:v16 options:v7 error:&v29];
        id v10 = v29;

        if (!v17)
        {
          uint64_t v21 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v26;
            __int16 v40 = 2112;
            id v41 = v10;
            _os_log_error_impl(&dword_19E58B000, v21, OS_LOG_TYPE_ERROR, "Failed to encrypt %@ with error=%@", buf, 0x16u);
          }

          if (a5)
          {
            uint64_t v22 = [v10 localizedDescription];
            *a5 = +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:0, @"%@ %@", @"compiler error:", v22 format];
          }
          goto LABEL_26;
        }
        ++v14;
        BOOL v15 = v10;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v28 = v10;
  BOOL v18 = +[MLCompiler storeEncryptionInfoInCompiledArchive:v35 options:v7 error:&v28];
  id v19 = v28;

  if (!v18)
  {
    long long v24 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v19;
      _os_log_error_impl(&dword_19E58B000, v24, OS_LOG_TYPE_ERROR, "Failed to store encryption information in compiled model with error=%@", buf, 0xCu);
    }

    if (!a5)
    {
      BOOL v20 = 0;
      goto LABEL_32;
    }
    id v11 = [v19 localizedDescription];
    *a5 = +[MLModelErrorUtils modelEncryptionErrorWithUnderlyingError:0, @"%@ %@", @"compiler error:", v11 format];
    id v10 = v19;
    goto LABEL_26;
  }
  BOOL v20 = 1;
LABEL_32:
  id v10 = v19;
LABEL_28:

  std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v37);
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }

  return v20;
}

+ (BOOL)_loadSpecificationAtURL:(id)a3 to:(void *)a4 error:(id *)a5
{
  v23[20] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  CoreML::Model::Model((CoreML::Model *)v19);
  id v8 = v7;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 fileSystemRepresentation]);
  std::ifstream::basic_ifstream((uint64_t *)&v21);
  v9.n128_f64[0] = CoreML::Model::load((uint64_t)&v16, &v21, (uint64_t)v19);
  *(void *)&long long v21 = *MEMORY[0x1E4FBA3F8];
  *(void *)((char *)&v21 + *(void *)(v21 - 24)) = *(void *)(MEMORY[0x1E4FBA3F8] + 24);
  MEMORY[0x19F3C1500](&v22, v9);
  std::istream::~istream();
  MEMORY[0x19F3C1850](v23);
  if (v15 < 0) {
    operator delete(__p);
  }
  unsigned int v10 = v16 & 0xFFFFFFEF;
  if ((v16 & 0xFFFFFFEF) == 0) {
    _MLModelSpecification::_MLModelSpecification((_MLModelSpecification *)&v21, (const CoreML::Model *)v19);
  }
  if (a5)
  {
    id v11 = &v17;
    if (v18 < 0) {
      id v11 = v17;
    }
    *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"%@ Error reading protobuf spec. %s", @"compiler error:", v11];
  }
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification5ModelENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((CoreML::Specification::Model **)&v21);
  uint64_t v12 = (std::__shared_weak_count *)*((void *)a4 + 1);
  *(_OWORD *)a4 = v21;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v18 < 0) {
    operator delete(v17);
  }
  v19[0] = &unk_1EF0DB228;
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }

  return v10 == 0;
}

+ (void)_updateSpecification:(void *)a3 withModelDescription:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *(void *)(*(void *)a3 + 16);
  id v13 = v6;
  if (!v7) {
    operator new();
  }
  id v8 = [v6 metadata];
  if (v8)
  {
    uint64_t v9 = *(void *)(v7 + 160);
    if (!v9) {
      operator new();
    }
    [a1 _updateMetadata:v9 withMetadata:v8];
  }
  unsigned int v10 = [v13 inputDescriptions];
  [a1 _updateFeatures:v7 + 16 withFeatures:v10];

  id v11 = [v13 outputDescriptions];
  [a1 _updateFeatures:v7 + 40 withFeatures:v11];

  uint64_t v12 = [v13 trainingInputDescriptions];
  [a1 _updateFeatures:v7 + 112 withFeatures:v12];
}

+ (void)_updateFeatures:(void *)a3 withFeatures:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v20 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x19F3C29E0]();
        id v9 = [v7 name];
        unsigned int v10 = (const char *)[v9 UTF8String];

        uint64_t v11 = *((void *)a3 + 2);
        if (v11) {
          uint64_t v12 = (uint64_t *)(v11 + 8);
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v13 = *((int *)a3 + 2);
        if (v13)
        {
          size_t v14 = strlen(v10);
          for (uint64_t j = 8 * v13; j; j -= 8)
          {
            uint64_t v16 = *v12;
            BOOL v17 = *(void **)(*v12 + 16);
            if (*((char *)v17 + 23) < 0)
            {
              if (v14 != v17[1]) {
                goto LABEL_19;
              }
              if (v14 == -1) {
LABEL_27:
              }
                std::string::__throw_out_of_range[abi:ne180100]();
              BOOL v17 = (void *)*v17;
            }
            else
            {
              if (v14 != *((unsigned __int8 *)v17 + 23)) {
                goto LABEL_19;
              }
              if (v14 == -1) {
                goto LABEL_27;
              }
            }
            if (!memcmp(v17, v10, v14))
            {
              id v18 = [v7 shortDescription];
              std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v18 UTF8String]);
              google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v16 + 24), &__p);
              if (v26 < 0) {
                operator delete((void *)__p.n128_u64[0]);
              }

              break;
            }
LABEL_19:
            ++v12;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v5);
  }
}

+ (void)_updateMetadata:(void *)a3 withMetadata:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F73638];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F73638]];

  if (v7)
  {
    id v8 = [v5 objectForKeyedSubscript:v6];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)a3 + 6, &__p);
    if (v37 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  uint64_t v9 = *MEMORY[0x1E4F73648];
  unsigned int v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F73648]];
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    id v12 = [v5 objectForKeyedSubscript:v9];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v12 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)a3 + 7, &__p);
    if (v37 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  uint64_t v13 = *MEMORY[0x1E4F73628];
  size_t v14 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F73628]];
  BOOL v15 = v14 == 0;

  if (!v15)
  {
    id v16 = [v5 objectForKeyedSubscript:v13];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v16 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)a3 + 8, &__p);
    if (v37 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  uint64_t v17 = *MEMORY[0x1E4F73640];
  id v18 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F73640]];
  BOOL v19 = v18 == 0;

  if (!v19)
  {
    id v20 = [v5 objectForKeyedSubscript:v17];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v20 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)a3 + 9, &__p);
    if (v37 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  long long v21 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F73630]];
  long long v22 = v21;
  if (v21)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = v21;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v24)
    {
      long long v25 = (char *)a3 + 24;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          objc_msgSend(v23, "objectForKeyedSubscript:", v28, (void)v32);
          id v29 = objc_claimAutoreleasedReturnValue();
          uint64_t v30 = [v29 UTF8String];
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v28 UTF8String]);
          long long v31 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)v25, (uint64_t)&__p);
          MEMORY[0x19F3C1430](v31, v30);
          if (v37 < 0) {
            operator delete((void *)__p.n128_u64[0]);
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v24);
    }
  }
}

+ (id)_compileSpecificationAtURL:(id)a3 toURL:(id)a4 compiledModelName:(id)a5 overridingModelDescription:(id)a6 options:(id)a7 error:(id *)a8
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v37 = a5;
  id v38 = a6;
  id v16 = a7;
  uint64_t v39 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v17 = [v15 path];
  int v36 = [v39 fileExistsAtPath:v17];

  id v18 = objc_alloc_init(MLCompilerEvent);
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification5ModelENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v43);
  int v19 = [a1 _loadSpecificationAtURL:v14 to:&v43 error:a8];
  if ((v19 & 1) == 0)
  {
    id v22 = 0;
LABEL_7:
    id v23 = 0;
    goto LABEL_19;
  }
  if (v38) {
    [a1 _updateSpecification:&v43 withModelDescription:v38];
  }
  if (v37)
  {
    id v20 = [v37 stringByAppendingPathExtension:@"mlmodelc"];
    long long v21 = [v15 URLByAppendingPathComponent:v20];
  }
  else
  {
    uint64_t v24 = [v14 lastPathComponent];
    id v20 = [v24 stringByDeletingPathExtension];

    long long v25 = [v20 stringByAppendingPathExtension:@"mlmodelc"];
    long long v21 = [v15 URLByAppendingPathComponent:v25];
  }
  id v22 = v21;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v22 fileSystemRepresentation]);
  OArchive::OArchive((uint64_t)buf, (uint64_t)__p, [v16 dryRun]);
  if (v42 < 0) {
    operator delete(__p[0]);
  }
  [v16 setSpecURL:v14];
  id v23 = [a1 compileSpecification:&v43 blobMapping:0 toArchive:buf options:v16 compilerEvent:v18 error:a8];
  uint64_t v26 = [a1 hashSpecificationAtURL:v14];
  if (v23 && ([a1 fingerprintSpecificationAtURL:v14 toArchive:buf hash:v26 error:a8] & 1) == 0)
  {

    id v23 = 0;
  }

  std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v49);
  if (*(void *)&v48[2]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v48[2]);
  }
  if (v23
    && [v16 encryptModel]
    && ([a1 encryptCompiledModelAtURL:v22 options:v16 error:a8] & 1) == 0)
  {

    goto LABEL_7;
  }
LABEL_19:
  if (v44) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v44);
  }
  if (v19)
  {
    if (!v23 || [v16 containerIsCloud])
    {
      if (v36) {
        long long v27 = v22;
      }
      else {
        long long v27 = v15;
      }
      id v28 = v27;
      id v29 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v40 = 0;
      char v30 = [v29 removeItemAtURL:v28 error:&v40];
      id v31 = v40;

      if ((v30 & 1) == 0)
      {
        long long v32 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v46 = v28;
          __int16 v47 = 2112;
          *(void *)char v48 = v31;
          _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "Fail to clean up path=%@, error=%@", buf, 0x16u);
        }
      }
      [v23 setOutputFiles:0];
    }
    long long v33 = +[MLReporter reporter];
    [v33 logMetric:v18];

    id v34 = v23;
  }
  else
  {
    id v34 = 0;
  }

  return v34;
}

+ (id)compileSpecificationAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 lastPathComponent];
  id v14 = [v13 stringByDeletingPathExtension];

  id v15 = [v10 absoluteString];
  int v16 = MLLoggingAllowsInstrumentation(1, (const char *)[v15 UTF8String]);

  uint64_t v17 = +[MLLogging coreChannel];
  os_signpost_id_t v18 = os_signpost_id_generate(v17);

  if (v16)
  {
    int v19 = +[MLLogging coreChannel];
    id v20 = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      int v26 = 136446210;
      uint64_t v27 = [v14 UTF8String];
      _os_signpost_emit_with_name_impl(&dword_19E58B000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "MLModel_Compile", "Model-name:%{public}s", (uint8_t *)&v26, 0xCu);
    }
  }
  long long v21 = [a1 _compileSpecificationAtURL:v10 toURL:v11 compiledModelName:v14 overridingModelDescription:0 options:v12 error:a6];
  if (v16)
  {
    id v22 = +[MLLogging coreChannel];
    id v23 = v22;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      uint64_t v24 = [v14 UTF8String];
      int v26 = 136446210;
      uint64_t v27 = v24;
      _os_signpost_emit_with_name_impl(&dword_19E58B000, v23, OS_SIGNPOST_INTERVAL_END, v18, "MLModel_Compile", "Model-name:%{public}s", (uint8_t *)&v26, 0xCu);
    }
  }

  return v21;
}

+ (BOOL)fillCompilerEvent:(id)a3 withMetadataFromModelAt:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[MLCompiler versionInfo];
  id v10 = [v9 versionString];
  [v7 setCompilerVersion:v10];

  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = [v8 URLByAppendingPathComponent:@"coremldata.bin"];
  uint64_t v13 = [v12 path];
  char v14 = [v11 fileExistsAtPath:v13];

  if ((v14 & 1) == 0)
  {
    BOOL v18 = 0;
    goto LABEL_60;
  }
  id v15 = [v8 path];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v15 UTF8String]);
  IArchive::IArchive((uint64_t *)&v60, (uint64_t)&__p, 3);
  _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)&v64, (const IArchive *)&v60);
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v63);
  if (v61) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v61);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  std::string::basic_string[abi:ne180100]<0>(&v60, "analytics");
  int hasNestedArchive = IArchive::hasNestedArchive(&v64, &v60);
  int v17 = hasNestedArchive;
  if ((v62[7] & 0x80000000) != 0)
  {
    operator delete(v60);
    if (!v17) {
      goto LABEL_47;
    }
  }
  else if (!hasNestedArchive)
  {
    goto LABEL_47;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "analytics");
  int v19 = IArchive::nestedArchive(&v64, (uint64_t)&__p);
  id v20 = (std::__shared_weak_count *)*((void *)v19 + 1);
  id v60 = *(void **)v19;
  v61 = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v62, (void *)v19 + 2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  while (1)
  {
    (*(void (**)(void))(**((void **)v60 + 4) + 16))(*((void *)v60 + 4));
    if (std::istream::peek() == -1) {
      break;
    }
    long long v21 = (void *)MEMORY[0x19F3C29E0]();
    memset(&__p, 0, sizeof(__p));
    v58[0] = 0;
    v58[1] = 0;
    v57 = (uint64_t *)v58;
    operator>>((uint64_t)&v60, &__p);
    operator>><std::string,std::string>((uint64_t)&v60, &v57);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__p.__r_.__value_.__l.__size_ != 20) {
        goto LABEL_28;
      }
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) != 20) {
        goto LABEL_28;
      }
      p_p = &__p;
    }
    std::string::size_type v23 = p_p->__r_.__value_.__r.__words[0];
    std::string::size_type size = p_p->__r_.__value_.__l.__size_;
    int v25 = p_p->__r_.__value_.__r.__words[2];
    if (v23 == 0x6369666963657053 && size == 0x7465446E6F697461 && v25 == 1936484705)
    {
      std::string::basic_string[abi:ne180100]<0>(v55, (char *)[@"modelName" UTF8String]);
      uint64_t v28 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v57, v55);
      if (v56 < 0) {
        operator delete(v55[0]);
      }
      if (v58 != v28)
      {
        id v29 = NSString;
        std::string::basic_string[abi:ne180100]<0>(v55, (char *)[@"modelName" UTF8String]);
        v67[0] = v55;
        char v30 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v57, v55, v67);
        id v31 = (void *)v30 + 7;
        if (*((char *)v30 + 79) < 0) {
          id v31 = (void *)*v31;
        }
        long long v32 = [v29 stringWithUTF8String:v31];
        [v7 setModelName:v32];

        if (v56 < 0) {
          operator delete(v55[0]);
        }
      }
      std::string::basic_string[abi:ne180100]<0>(v55, (char *)[@"modelHash" UTF8String]);
      long long v33 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&v57, v55);
      if (v56 < 0) {
        operator delete(v55[0]);
      }
      if (v58 != v33)
      {
        id v34 = NSString;
        std::string::basic_string[abi:ne180100]<0>(v55, (char *)[@"modelHash" UTF8String]);
        v67[0] = v55;
        long long v35 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v57, v55, v67);
        int v36 = (void *)v35 + 7;
        if (*((char *)v35 + 79) < 0) {
          int v36 = (void *)*v36;
        }
        id v37 = [v34 stringWithUTF8String:v36];
        [v7 setModelHash:v37];

        if (v56 < 0) {
          operator delete(v55[0]);
        }
      }
    }
LABEL_28:
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v58[0]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v63);
  if (v61) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v61);
  }
LABEL_47:
  LODWORD(__p.__r_.__value_.__l.__data_) = 0;
  operator>>((uint64_t)&v64);
  id v38 = [NSNumber numberWithInt:LODWORD(__p.__r_.__value_.__l.__data_)];
  [v7 setModelType:v38];

  uint64_t v39 = +[MLModelIOUtils deserializeVersionInfoFromArchive:&v64 error:a5];
  id v40 = v39;
  if (v39)
  {
    id v41 = [v39 versionNumberString];
    [v7 setModelCompiledWithVersion:v41];

    char v42 = +[MLModelIOUtils deserializeVersionInfoFromArchive:&v64 error:a5];
    uint64_t v43 = v42;
    if (v42)
    {
      long long v44 = [v42 versionNumberString];
      [v7 setModelVersion:v44];

      _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((CoreML::Specification::ModelDescription **)&v60);
      BOOL v18 = +[MLModelIOUtils deserializeInterfaceFormat:&v60 archive:&v64 error:a5];
      if (v18)
      {
        id v45 = [[MLModelAssetDescription alloc] initFromModelDescriptionSpecification:&v60];
        id v46 = [v45 defaultModelDescription];
        __int16 v47 = [v46 metadata];
        char v48 = [v47 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v50 = NSNumber;
          v51 = [v46 metadata];
          v52 = [v51 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
          v53 = [v50 modelOriginNumberFromUserDefinedDictionary:v52];
          [v7 setModelOrigin:v53];
        }
      }
      if (v61) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v61);
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v66);
  if (v65) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v65);
  }
LABEL_60:

  return v18;
}

+ (id)addMLProgramToCompiledModelAtURL:(id)a3 withCompilationMode:(int)a4 dryRun:(BOOL)a5 oarchiveForModelCompilation:(void *)a6 compilerEvent:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = objc_opt_new();
  if (!a4)
  {
    [v14 setMilUpgradeStatus:&unk_1EF11A520];
    goto LABEL_13;
  }
  if (a5)
  {
LABEL_13:
    id v19 = v15;
    goto LABEL_14;
  }
  if (a6) {
    OArchive::flush((uint64_t)a6);
  }
  id v21 = 0;
  id v17 = v21;
  BOOL v18 = v17;
  if (a4 != 2 || (v16 & 1) != 0)
  {

    goto LABEL_13;
  }
  if (a8 && v17) {
    *a8 = v17;
  }

  id v19 = 0;
LABEL_14:

  return v19;
}

@end