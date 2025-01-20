@interface MLProgramE5Container
+ (BOOL)deduceFunctionNameToCompute:(id *)a3 modelDescription:(id *)a4 fromConfiguration:(id)a5 modelAssetDescription:(id)a6 error:(id *)a7;
+ (void)_getDefaultFunctionName:(id *)a3 modelDescription:(id *)a4 fromModelAssetDescription:(id)a5;
- (MLCompilerNeuralNetworkOutput)compilerOutput;
- (MLModelAssetDescription)modelAssetDescription;
- (MLProgramE5Container)initWithCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 error:(id *)a6;
- (MLVersionInfo)compilerVersionInfo;
- (MLVersionInfo)modelVersionInfo;
- (NSArray)functionInfoArray;
- (NSURL)URLOfMILText;
- (id)classScoreVectorNameOfFunctionNamed:(id)a3;
- (id)findPrecompiledE5BundleAndReturnError:(id *)a3;
- (id)optionalInputDefaultValuesForFunctionNamed:(id)a3;
@end

@implementation MLProgramE5Container

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionInfoArray, 0);
  objc_storeStrong((id *)&self->_modelVersionInfo, 0);
  objc_storeStrong((id *)&self->_compilerVersionInfo, 0);
  objc_storeStrong((id *)&self->_URLOfMILText, 0);
  objc_storeStrong((id *)&self->_compilerOutput, 0);

  objc_storeStrong((id *)&self->_modelAssetDescription, 0);
}

- (MLProgramE5Container)initWithCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 error:(id *)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v66 = a4;
  id v60 = a5;
  id v64 = a5;
  v67.receiver = self;
  v67.super_class = (Class)MLProgramE5Container;
  v10 = [(MLProgramE5Container *)&v67 init];
  v65 = v10;
  if (!v10)
  {
LABEL_46:
    v48 = v10;
    goto LABEL_47;
  }
  id v11 = v66;
  v12 = +[MLVersionInfo versionInfoWithMajor:9 minor:0 patch:0 variant:@"generic"];
  uint64_t v13 = [v12 majorVersion];
  uint64_t v14 = [v11 majorVersion];
  uint64_t v15 = v14;
  if (a6 && v13 < v14)
  {
    v16 = [v11 versionNumberString];
    v17 = [v12 versionNumberString];
    *a6 = +[MLModelErrorUtils genericErrorWithFormat:@"The specification version for compiled model is %@ and is more recent than the supported version %@.", v16, v17];
  }
  if (v13 >= v15)
  {
    id v18 = v64;
    v19 = +[MLVersionInfo versionInfoWithMajor:9 minor:0 patch:0 variant:@"generic"];
    uint64_t v20 = [v19 majorVersion];
    uint64_t v21 = [v18 majorVersion];
    uint64_t v22 = v21;
    if (a6 && v20 < v21)
    {
      v23 = [v18 versionNumberString];
      v24 = [v19 versionNumberString];
      *a6 = +[MLModelErrorUtils genericErrorWithFormat:@"The compiler version for compiled model is %@ and is more recent than this framework major version %@.", v23, v24];
    }
    if (v20 >= v22)
    {
      id v62 = v18;
      v25 = [[MLModelAssetDescription alloc] initWithCompiledModelArchive:a3 error:a6];
      if (!v25)
      {
        v35 = 0;
        id v36 = 0;
        char v37 = 0;
LABEL_28:

        v63 = v35;
        v41 = (NSArray *)v36;
        v42 = v41;
        if (v37)
        {
          objc_storeStrong((id *)&v65->_modelAssetDescription, v35);
          int v43 = (*(uint64_t (**)(void))(**(void **)a3 + 56))();
          v44 = v65;
          if (v43 == 1)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "CompiledObject");
            v45 = (*(void (**)(void, void **))(**(void **)a3 + 40))(*(void *)a3, __p);
            if (v73 < 0) {
              operator delete(__p[0]);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v46 = v45;
            }
            else {
              v46 = 0;
            }
            v47 = v46;

            v44 = v65;
          }
          else
          {
            v47 = 0;
          }
          compilerOutput = v44->_compilerOutput;
          v44->_compilerOutput = v47;

          std::string::basic_string[abi:ne180100]<0>(__p, (char *)kModelMILFileName);
          IArchive::blob(&v68, *(void *)a3, (uint64_t)__p);
          if (v73 < 0) {
            operator delete(__p[0]);
          }
          v50 = (void *)(v68 + 8);
          if (*(char *)(v68 + 31) < 0) {
            v50 = (void *)*v50;
          }
          v51 = (void *)MEMORY[0x1E4F1CB10];
          v52 = [NSString stringWithUTF8String:v50];
          uint64_t v53 = [v51 fileURLWithPath:v52 isDirectory:0];

          if (*((void *)&v68 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v68 + 1));
          }
          URLOfMILText = v65->_URLOfMILText;
          v65->_URLOfMILText = (NSURL *)v53;

          objc_storeStrong((id *)&v65->_compilerVersionInfo, v60);
          objc_storeStrong((id *)&v65->_modelVersionInfo, a4);
          functionInfoArray = v65->_functionInfoArray;
          v65->_functionInfoArray = v42;

          v10 = v65;
          goto LABEL_46;
        }

        goto LABEL_37;
      }
      id v61 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
      v26 = [(MLModelAssetDescription *)v25 functionNames];
      v57 = v26;
      if ([v26 count])
      {
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        obj = v26;
        uint64_t v27 = [(MLNeuralNetworkFunctionInfo *)obj countByEnumeratingWithState:&v68 objects:__p count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v69;
          while (2)
          {
            uint64_t v29 = 0;
            v30 = v25;
            do
            {
              if (*(void *)v69 != v28) {
                objc_enumerationMutation(obj);
              }
              uint64_t v31 = *(void *)(*((void *)&v68 + 1) + 8 * v29);
              v32 = [[MLNeuralNetworkFunctionInfo alloc] initWithCompiledModelArchive:a3 compilerVersionInfo:v62 error:a6];
              v33 = v32;
              if (!v32)
              {

                v35 = 0;
                id v36 = 0;
                char v37 = 0;
                v25 = v30;
                goto LABEL_27;
              }
              v34 = [(MLNeuralNetworkFunctionInfo *)v32 classLabels];
              v25 = [(MLModelAssetDescription *)v30 assetDescriptionBySettingClassLabels:v34 functionName:v31];

              [v61 addObject:v33];
              ++v29;
              v30 = v25;
            }
            while (v27 != v29);
            uint64_t v27 = [(MLNeuralNetworkFunctionInfo *)obj countByEnumeratingWithState:&v68 objects:__p count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        v38 = [[MLNeuralNetworkFunctionInfo alloc] initWithCompiledModelArchive:a3 compilerVersionInfo:v62 error:a6];
        if (!v38)
        {
          v35 = 0;
          id v36 = 0;
          char v37 = 0;
          goto LABEL_27;
        }
        obj = v38;
        v39 = [(MLNeuralNetworkFunctionInfo *)v38 classLabels];
        uint64_t v40 = [(MLModelAssetDescription *)v25 assetDescriptionBySettingClassLabels:v39];

        [v61 addObject:obj];
        v25 = (MLModelAssetDescription *)v40;
      }

      v35 = v25;
      id v36 = v61;
      char v37 = 1;
      v25 = v35;
LABEL_27:

      goto LABEL_28;
    }
  }
LABEL_37:
  v48 = 0;
LABEL_47:

  return v48;
}

+ (BOOL)deduceFunctionNameToCompute:(id *)a3 modelDescription:(id *)a4 fromConfiguration:(id)a5 modelAssetDescription:(id)a6 error:(id *)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v12 functionNames];
  if (![v13 count])
  {
    v25 = [v11 functionName];
    if (v25)
    {
      v26 = [v11 functionName];
      uint64_t v27 = [NSString stringWithUTF8String:"main"];
      int v28 = [v26 isEqual:v27];

      if (!v28)
      {
        v34 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
        }

        if (a7)
        {
          v35 = (void *)MEMORY[0x1E4F28C58];
          id v36 = v47 = *MEMORY[0x1E4F28568];
          v48 = v36;
          char v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          *a7 = [v35 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v37];
        }
        goto LABEL_23;
      }
    }
    int v43 = 0;
    id v44 = 0;
    [a1 _getDefaultFunctionName:&v44 modelDescription:&v43 fromModelAssetDescription:v12];
    id v29 = v44;
    v30 = v43;
LABEL_12:
    id v31 = v30;
    if (!a3) {
      goto LABEL_16;
    }
LABEL_13:
    *a3 = v29;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v14 = [v11 functionName];

  if (!v14)
  {
    v45 = 0;
    id v46 = 0;
    [a1 _getDefaultFunctionName:&v46 modelDescription:&v45 fromModelAssetDescription:v12];
    id v29 = v46;
    v30 = v45;
    goto LABEL_12;
  }
  uint64_t v15 = [v11 functionName];
  uint64_t v16 = [v13 indexOfObject:v15];

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v39 = [v11 functionName];
      uint64_t v40 = [v12 functionNames];
      v41 = [v40 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138412546;
      v52 = v39;
      __int16 v53 = 2112;
      v54 = v41;
      _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "The specified function (%@) is not found in the asset. The available function names are: [%@]", buf, 0x16u);
    }
    if (a7)
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v19 = NSString;
      uint64_t v20 = [v11 functionName];
      uint64_t v21 = [v12 functionNames];
      uint64_t v22 = [v21 componentsJoinedByString:@","];
      v23 = [v19 stringWithFormat:@"The specified function (%@) is not found in the asset. The available function names are: [%@]", v20, v22];
      v50 = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      *a7 = [v18 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v24];
    }
LABEL_23:
    id v31 = 0;
    id v29 = 0;
    BOOL v33 = 0;
    goto LABEL_24;
  }
  id v29 = [v11 functionName];
  v32 = [v11 functionName];
  id v31 = [v12 modelDescriptionOfFunctionNamed:v32];

  if (a3) {
    goto LABEL_13;
  }
LABEL_16:
  if (a4)
  {
LABEL_17:
    id v31 = v31;
    *a4 = v31;
  }
LABEL_18:
  BOOL v33 = 1;
LABEL_24:

  return v33;
}

+ (void)_getDefaultFunctionName:(id *)a3 modelDescription:(id *)a4 fromModelAssetDescription:(id)a5
{
  id v9 = a5;
  v7 = [v9 defaultModelDescription];
  v8 = [v7 functionName];

  if (!v8)
  {
    v8 = [NSString stringWithUTF8String:"main"];
  }
  if (a3) {
    *a3 = v8;
  }
  if (a4)
  {
    *a4 = [v9 defaultModelDescription];
  }
}

- (MLVersionInfo)modelVersionInfo
{
  return self->_modelVersionInfo;
}

- (MLModelAssetDescription)modelAssetDescription
{
  return self->_modelAssetDescription;
}

- (MLCompilerNeuralNetworkOutput)compilerOutput
{
  return self->_compilerOutput;
}

- (NSURL)URLOfMILText
{
  return self->_URLOfMILText;
}

- (NSArray)functionInfoArray
{
  return self->_functionInfoArray;
}

- (MLVersionInfo)compilerVersionInfo
{
  return self->_compilerVersionInfo;
}

- (id)optionalInputDefaultValuesForFunctionNamed:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v4 = [(MLProgramE5Container *)self modelAssetDescription];
  int v5 = [v4 usesMultiFunctionSyntax];

  v6 = [(MLProgramE5Container *)self modelAssetDescription];
  if (v5) {
    [v6 modelDescriptionOfFunctionNamed:v20];
  }
  else {
  v7 = [v6 defaultModelDescription];
  }

  v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = [v7 inputDescriptionsByName];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = [v7 inputDescriptionsByName];
        uint64_t v15 = [v14 objectForKeyedSubscript:v13];

        if ([v15 isOptional])
        {
          uint64_t v16 = [v15 multiArrayConstraint];
          v17 = v16;
          if (v16)
          {
            id v18 = [v16 defaultOptionalValue];
            if (v18) {
              [v8 setObject:v18 forKeyedSubscript:v13];
            }
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v8;
}

- (id)classScoreVectorNameOfFunctionNamed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(MLProgramE5Container *)self modelAssetDescription];
  int v6 = [v5 usesMultiFunctionSyntax];

  if (v6)
  {
    v7 = [(MLProgramE5Container *)self modelAssetDescription];
    v8 = [v7 functionNames];
    uint64_t v9 = [v8 indexOfObject:v4];

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
      }

      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = [(MLProgramE5Container *)self functionInfoArray];
  id v12 = [v11 objectAtIndexedSubscript:v9];

  uint64_t v13 = [v12 classScoreVectorName];

  return v13;
}

- (id)findPrecompiledE5BundleAndReturnError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = [(MLProgramE5Container *)self URLOfMILText];
  int v5 = [v4 URLByDeletingLastPathComponent];

  int v6 = [NSString stringWithUTF8String:"model.specialization.bundle"];
  v7 = [v5 URLByAppendingPathComponent:v6];

  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = [v7 path];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    a3 = v7;
  }
  else
  {
    uint64_t v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Failed to find precompiled E5 bundle at %@", buf, 0xCu);
    }

    if (a3)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      uint64_t v13 = [NSString stringWithFormat:@"Failed to find precompiled E5 bundle at %@", v7];
      uint64_t v17 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      *a3 = [v12 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v14];

      a3 = 0;
    }
  }

  return a3;
}

@end