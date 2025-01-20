@interface MLPipelineLoader
+ (BOOL)ensureFrameworkSupportsCompilerVersion:(id)a3 error:(id *)a4;
+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7;
+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7;
+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6;
+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5;
+ (id)loadModelAssetDescriptionFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
@end

@implementation MLPipelineLoader

+ (id)loadModelAssetDescriptionFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([a1 ensureFrameworkSupportsCompilerVersion:v13 error:a7])
  {
    v15 = +[MLPipeline loadModelAssetDescriptionFromCompiledArchive:a3 modelVersionInfo:v12 compilerVersionInfo:v13 configuration:v14 error:a7];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([a1 ensureFrameworkSupportsCompilerVersion:v13 error:a7])
  {
    id v15 = [[MLModelDescription alloc] initFromSingleFunctionCompiledModelArchive:a3 error:a7];
    if (v15)
    {
      id v16 = [[MLPipeline alloc] initModelFromMetadataAndArchive:a3 versionInfo:v12 description:v15 configuration:v14 error:a7];
      if (v16)
      {
        operator>>((uint64_t)a3);
        if (a7)
        {
          *a7 = +[MLModelErrorUtils genericErrorWithFormat:@"Invalid model type found in compiled pipeline model."];
        }
      }
    }
  }

  return 0;
}

+ (BOOL)ensureFrameworkSupportsCompilerVersion:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:1 variant:@"generic"];
  uint64_t v7 = [v6 majorVersion];
  uint64_t v8 = [v5 majorVersion];
  if (v7 < v8)
  {
    v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = [v5 versionNumberString];
      v18 = [v6 versionNumberString];
      *(_DWORD *)buf = 138412546;
      v22 = v17;
      __int16 v23 = 2112;
      v24 = v18;
      _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "compiler major version for compiled model is %@ and is more recent than this framework major version %@.", buf, 0x16u);
    }
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v11 = NSString;
      id v12 = [v5 versionNumberString];
      id v13 = [v6 versionNumberString];
      id v14 = [v11 stringWithFormat:@"compiler major version for compiled model is %@ and is more recent than this framework major version %@.", v12, v13];
      v20 = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      *a4 = [v10 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v15];
    }
  }

  return v7 >= v8;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  id v5 = +[MLPipeline compiledVersionForSpecification:a3 options:a4 error:a5];

  return v5;
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v7 = [a1 _compileSpecification:a3 blobMapping:a4 toArchive:a5 options:a6 error:a7];

  return v7;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  v6 = [a1 _compileSpecification:a3 blobMapping:0 toArchive:a4 options:a5 error:a6];

  return v6;
}

+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a6;
  if (+[MLModelIOUtils serializeMetadataAndInterfaceFromSpecification:a3 archive:a5 error:a7])
  {
    if (v11) {
      +[MLPipeline compileSpecification:a3 blobMapping:v11 toArchive:a5 options:v12 error:a7];
    }
    else {
    id v13 = +[MLPipeline compileSpecification:a3 toArchive:a5 options:v12 error:a7];
    }
    operator<<((uint64_t)a5, *(unsigned int *)(*(void *)a3 + 44));
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

@end