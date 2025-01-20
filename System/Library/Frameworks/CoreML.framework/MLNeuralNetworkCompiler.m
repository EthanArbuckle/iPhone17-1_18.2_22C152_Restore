@interface MLNeuralNetworkCompiler
+ (BOOL)collectNNModelDetailsFromArchive:(void *)a3 spec:(void *)a4 error:(id *)a5;
+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7;
+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7;
+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6;
+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5;
+ (id)iOS17CompilerVersionInfo;
+ (id)iOS18CompilerVersionInfo;
+ (void)collectEspressoModelDetails:(void *)a3 modelPath:(const void *)a4;
@end

@implementation MLNeuralNetworkCompiler

+ (id)iOS17CompilerVersionInfo
{
  if (+[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::onceToken != -1) {
    dispatch_once(&+[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::onceToken, &__block_literal_global_31);
  }
  v2 = (void *)+[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::versionInfo;

  return v2;
}

void __51__MLNeuralNetworkCompiler_iOS17CompilerVersionInfo__block_invoke()
{
  uint64_t v0 = +[MLVersionInfo versionInfoWithMajor:8 minor:0 patch:0 variant:&stru_1EF0E81D0];
  v1 = (void *)+[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::versionInfo;
  +[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::versionInfo = v0;
}

+ (id)iOS18CompilerVersionInfo
{
  if (+[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::onceToken != -1) {
    dispatch_once(&+[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::onceToken, &__block_literal_global_2839);
  }
  v2 = (void *)+[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::versionInfo;

  return v2;
}

void __51__MLNeuralNetworkCompiler_iOS18CompilerVersionInfo__block_invoke()
{
  uint64_t v0 = +[MLVersionInfo versionInfoWithMajor:9 minor:0 patch:0 variant:&stru_1EF0E81D0];
  v1 = (void *)+[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::versionInfo;
  +[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::versionInfo = v0;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a4;
  uint64_t v7 = *(void *)a3;
  int v8 = *(_DWORD *)(*(void *)a3 + 24);
  if (v8 <= 8)
  {
    if (v8 == 8)
    {
      uint64_t v9 = 0;
      BOOL v10 = 0;
      uint64_t v11 = 8;
    }
    else if (v8 <= 5)
    {
      if (v8 == 5)
      {
        uint64_t v9 = 0;
        BOOL v10 = 0;
        uint64_t v11 = 4;
      }
      else if (v8 <= 3)
      {
        if (v8 == 3)
        {
          BOOL v10 = 0;
          uint64_t v9 = 1;
          uint64_t v11 = 2;
        }
        else
        {
          v12 = *(CoreML **)(v7 + 32);
          unsigned int v13 = *(_DWORD *)(v7 + 44);
          if (CoreML::hasCustomLayer(v12, (const CoreML::Specification::Model *)v13))
          {
            BOOL v10 = 0;
            uint64_t v9 = 3;
            uint64_t v11 = 1;
          }
          else
          {
            uint64_t v11 = 1;
            BOOL hasWeightOfType = CoreML::hasWeightOfType((uint64_t)v12, v13, 1);
            if (hasWeightOfType) {
              uint64_t v9 = 3;
            }
            else {
              uint64_t v9 = 2;
            }
            BOOL v10 = !hasWeightOfType;
          }
        }
      }
      else
      {
        uint64_t v9 = 0;
        BOOL v10 = 0;
        uint64_t v11 = 3;
      }
    }
    else
    {
      uint64_t v9 = 0;
      BOOL v10 = 0;
      uint64_t v11 = 5;
    }
  }
  else
  {
    uint64_t v9 = 0;
    BOOL v10 = 0;
    uint64_t v11 = 9;
  }
  v15 = +[MLVersionInfo versionInfoWithMajor:v11 minor:v9 patch:v10 variant:@"generic"];

  return v15;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  id v6 = [a1 _compileSpecification:a3 blobMapping:0 toArchive:a4 options:a5 error:a6];

  return v6;
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v7 = [a1 _compileSpecification:a3 blobMapping:a4 toArchive:a5 options:a6 error:a7];

  return v7;
}

+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v32 = a4;
  id v31 = a6;
  if (!+[MLModelIOUtils serializeMetadataAndInterfaceFromSpecification:a3 archive:a5 error:a7])goto LABEL_14; {
  int v11 = *(_DWORD *)(*(void *)a3 + 44);
  }
  v30 = a7;
  if (v11 > 499)
  {
    if (v11 != 500)
    {
      if (v11 == 502)
      {
        v32;
        v31;
        CoreML::MIL::CoreMLUtil::MakeContext((CoreML::MIL::CoreMLUtil *)&v35);
      }
      goto LABEL_22;
    }
  }
  else if (v11 != 303 && v11 != 403)
  {
LABEL_22:
    if (a7)
    {
      +[MLModelErrorUtils genericErrorWithFormat:@"Attempted to compile a non-neural-network model as a neural network."];
      a7 = 0;
      id *v30 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = a7;
    v18 = v15;
    goto LABEL_25;
  }
  if (!v32)
  {
    id v19 = v31;
    v21 = *(const CoreML::Specification::Model **)a3;
    uint64_t v20 = *((void *)a3 + 1);
    if (v20) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v20 + 8), 1uLL, memory_order_relaxed);
    }
    v19;
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v34, v21);
    v22 = +[MLCompilerOptions defaultOptions];
    id v33 = 0;
    uint64_t v29 = +[MLNeuralNetworkCompiler compiledVersionForSpecification:&v34 options:v22 error:&v33];
    id v28 = v33;

    v23 = v21;
    if (!v29)
    {
      v24 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v27 = *((_DWORD *)v21 + 6);
        LODWORD(v39.__r_.__value_.__l.__data_) = 67109378;
        HIDWORD(v39.__r_.__value_.__r.__words[0]) = v27;
        LOWORD(v39.__r_.__value_.__r.__words[1]) = 2112;
        *(std::string::size_type *)((char *)&v39.__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)v28;
        _os_log_error_impl(&dword_19E58B000, v24, OS_LOG_TYPE_ERROR, "Compiler version info is nil for specification version: %d, error: %@", (uint8_t *)&v39, 0x12u);
      }

      v23 = v21;
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Compiler version info is nil for specification version: %d, error: %@", *((unsigned int *)v21 + 6), v28 format];
    }
    CoreML::NNCompiler::NeuralNetwork::NeuralNetworkSpecProxy::Make((CoreML::NNCompiler::NeuralNetwork::NeuralNetworkSpecProxy *)&v36, *((const CoreML::Specification::Model **)v23 + 4), *((_DWORD *)v23 + 11));
  }
  v12 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v25 = [NSString stringWithUTF8String:MLModelType_Name(v11)];
    LODWORD(v39.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)v39.__r_.__value_.__r.__words + 4) = (std::string::size_type)v25;
    _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification.", (uint8_t *)&v39, 0xCu);
  }
  if (!v30)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_26;
  }
  unsigned int v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v37 = *MEMORY[0x1E4F28568];
  v14 = NSString;
  v15 = [NSString stringWithUTF8String:MLModelType_Name(v11)];
  v16 = [v14 stringWithFormat:@"The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification.", v15];
  v38 = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  id *v30 = [v13 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v17];

  v18 = 0;
LABEL_25:

LABEL_26:

  return v18;
}

+ (BOOL)collectNNModelDetailsFromArchive:(void *)a3 spec:(void *)a4 error:(id *)a5
{
  v24[0] = 0;
  v24[1] = 0;
  v23 = (uint64_t *)v24;
  int v9 = *(_DWORD *)(*(void *)a4 + 44);
  if (v9 == 303 || v9 == 403 || (uint64_t v10 = 0, v9 == 500)) {
    uint64_t v10 = *(int *)(*(void *)(*(void *)a4 + 32) + 24);
  }
  int v11 = [NSNumber numberWithUnsignedLongLong:v10];
  id v12 = [v11 stringValue];
  uint64_t v13 = [v12 UTF8String];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[@"modelDimension" UTF8String]);
  p_p = &__p;
  v14 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v23, &__p, (_OWORD **)&p_p);
  MEMORY[0x19F3C1430]((char *)v14 + 56, v13);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  v15 = objc_msgSend(NSNumber, "numberWithBool:", CoreML::hasCustomLayer(*(CoreML **)(*(void *)a4 + 32), (const CoreML::Specification::Model *)*(unsigned int *)(*(void *)a4 + 44)));
  id v16 = [v15 stringValue];
  uint64_t v17 = [v16 UTF8String];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[@"containsCustomLayer" UTF8String]);
  p_p = &__p;
  v18 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v23, &__p, (_OWORD **)&p_p);
  MEMORY[0x19F3C1430]((char *)v18 + 56, v17);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if ((*(unsigned int (**)(void))(**((void **)a3 + 1) + 48))(*((void *)a3 + 1)) != 1)
  {
    uint64_t v19 = *((void *)a3 + 1);
    if (*(char *)(v19 + 55) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v19 + 32), *(void *)(v19 + 40));
    }
    else {
      std::string __p = *(std::string *)(v19 + 32);
    }
    [a1 collectEspressoModelDetails:&v23 modelPath:&__p];
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "NeuralNetworkModelDetails");
  BOOL v20 = +[MLReporterUtils archiveModelDetails:&v23 withName:&__p toArchive:a3 error:a5];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v24[0]);
  return v20;
}

+ (void)collectEspressoModelDetails:(void *)a3 modelPath:(const void *)a4
{
  v5 = (void *)MEMORY[0x1E4F1CB10];
  if (*((char *)a4 + 23) >= 0) {
    id v6 = a4;
  }
  else {
    id v6 = *(const void **)a4;
  }
  uint64_t v7 = [NSString stringWithUTF8String:v6];
  int v8 = [v5 fileURLWithPath:v7];

  int v9 = [NSString stringWithUTF8String:"model.espresso.net"];
  uint64_t v10 = [v8 URLByAppendingPathComponent:v9];

  int v11 = [NSString stringWithUTF8String:"model.espresso.shape"];
  id v12 = [v8 URLByAppendingPathComponent:v11];

  uint64_t v13 = [NSString stringWithUTF8String:"model.espresso.weights"];
  v14 = [v8 URLByAppendingPathComponent:v13];

  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = [v10 path];
  if (([v15 fileExistsAtPath:v16] & 1) == 0) {
    goto LABEL_23;
  }
  uint64_t v17 = [v12 path];
  if (([v15 fileExistsAtPath:v17] & 1) == 0)
  {

LABEL_23:
    goto LABEL_24;
  }
  v18 = [v14 path];
  int v19 = [v15 fileExistsAtPath:v18];

  if (v19)
  {
    BOOL v20 = +[MLReporterUtils hashFileAt:v10 error:0];
    if (!v20) {
      BOOL v20 = @"FailedToComputeHash";
    }
    v21 = v20;
    uint64_t v22 = [(__CFString *)v21 UTF8String];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"nnModelNetHash" UTF8String]);
    v36 = __p;
    v23 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)&v36);
    MEMORY[0x19F3C1430]((char *)v23 + 56, v22);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v24 = +[MLReporterUtils hashFileAt:v12 error:0];

    if (v24) {
      v25 = (__CFString *)v24;
    }
    else {
      v25 = @"FailedToComputeHash";
    }
    v26 = v25;
    uint64_t v27 = [(__CFString *)v26 UTF8String];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"nnModelShapeHash" UTF8String]);
    v36 = __p;
    id v28 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)&v36);
    MEMORY[0x19F3C1430]((char *)v28 + 56, v27);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v29 = +[MLReporterUtils hashFileAt:v14 error:0];

    if (v29) {
      v30 = (__CFString *)v29;
    }
    else {
      v30 = @"FailedToComputeHash";
    }
    id v31 = v30;
    uint64_t v32 = [(__CFString *)v31 UTF8String];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"nnModelWeightsHash" UTF8String]);
    v36 = __p;
    id v33 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)&v36);
    MEMORY[0x19F3C1430]((char *)v33 + 56, v32);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
  }
LABEL_24:
}

@end