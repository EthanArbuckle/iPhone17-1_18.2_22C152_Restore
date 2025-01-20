@interface MLTreeEnsembleRegressor
+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6;
+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5;
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
+ (id)loadModelFromSpecificationWithCompilationOptions:(void *)a3 options:(id)a4 error:(id *)a5;
- (const)modelData;
- (double)scalarRegress:(double *)a3;
- (double)scalarRegress:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)regress:(id)a3 options:(id)a4 error:(id *)a5;
- (void)vectorRegress:(double *)a3 dest:(double *)a4;
@end

@implementation MLTreeEnsembleRegressor

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 11) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->output_classes, 0);
  begin = self->_cached_model.__begin_;
  if (begin)
  {
    self->_cached_model.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_model_data, 0);
}

- (void)vectorRegress:(double *)a3 dest:(double *)a4
{
  v6 = [(MLTreeEnsembleRegressor *)self modelData];

  CoreML::TreeEnsembles::Internal::predict((CoreML::TreeEnsembles::Internal *)a4, (double *)v6, (const unsigned __int8 *)a3, v7);
}

- (double)scalarRegress:(double *)a3
{
  double v7 = 0.0;
  v4 = [(MLTreeEnsembleRegressor *)self modelData];
  CoreML::TreeEnsembles::Internal::predict((CoreML::TreeEnsembles::Internal *)&v7, (double *)v4, (const unsigned __int8 *)a3, v5);
  return v7;
}

- (double)scalarRegress:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->num_dimensions == 1)
  {
    double v7 = [(MLModel *)self vectorizeInput:v6 error:a4];
    if (v7)
    {
      double v13 = 0.0;
      v8 = [(MLTreeEnsembleRegressor *)self modelData];
      v9 = (const unsigned __int8 *)[v7 bytes];
      CoreML::TreeEnsembles::Internal::predict((CoreML::TreeEnsembles::Internal *)&v13, (double *)v8, v9, v10);
      double v11 = v13;
    }
    else
    {
      double v11 = NAN;
    }
  }
  else
  {
    if (a4)
    {
      *a4 = +[MLModelErrorUtils genericErrorWithFormat:@"Dimension must equal one when using scalarRegress."];
    }
    double v11 = NAN;
  }

  return v11;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v31, v10, 24, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v11 = [(MLModel *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__MLTreeEnsembleRegressor_regress_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  double v13 = (void (**)(void))_Block_copy(aBlock);
  [(MLModel *)self signpostID];
  kdebug_trace();
  v14 = [(MLModel *)self vectorizeInput:v8 error:a5];
  [(MLModel *)self signpostID];
  kdebug_trace();
  if (v14)
  {
    v15 = [MLMultiArray alloc];
    v16 = [NSNumber numberWithUnsignedLongLong:self->num_dimensions];
    v32[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    v18 = [(MLMultiArray *)v15 initWithShape:v17 dataType:65600 error:0];

    unint64_t v19 = [(MLModel *)self signpostID];
    uint64_t v20 = [v9 parentSignpostID];
    kdebug_trace();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__MLTreeEnsembleRegressor_regress_options_error___block_invoke_2;
    v29[3] = &__block_descriptor_48_e5_v8__0l;
    v29[4] = v19;
    v29[5] = v20;
    v21 = (void (**)(void))_Block_copy(v29);
    v22 = v18;
    v23 = [(MLMultiArray *)v22 mutableBytes];
    v24 = [(MLTreeEnsembleRegressor *)self modelData];
    v25 = (const unsigned __int8 *)[v14 bytes];
    CoreML::TreeEnsembles::Internal::predict(v23, (double *)v24, v25, v26);
    v21[2](v21);

    v27 = +[MLRegressorResult resultWithValue:v22];
  }
  else
  {
    v27 = 0;
  }

  v13[2](v13);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v31);

  return v27;
}

uint64_t __49__MLTreeEnsembleRegressor_regress_options_error___block_invoke()
{
  return kdebug_trace();
}

uint64_t __49__MLTreeEnsembleRegressor_regress_options_error___block_invoke_2()
{
  return kdebug_trace();
}

- (const)modelData
{
  if (self->_model_data) {
    return (const char *)[(NSData *)self->_model_data bytes];
  }
  else {
    return self->_cached_model.__begin_;
  }
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:0 variant:@"generic"];
  uint64_t v15 = [v14 majorVersion];
  if (v15 >= [v12 majorVersion])
  {
    unint64_t v19 = [[MLModelAssetDescription alloc] initWithCompiledModelArchive:a3 error:a7];
    if (v19)
    {
      uint64_t v20 = [MLTreeEnsembleRegressor alloc];
      v21 = [(MLModelAssetDescription *)v19 defaultModelDescription];
      v18 = [(MLModel *)v20 initWithDescription:v21 configuration:v13];

      if (v18)
      {
        operator>><unsigned char>((uint64_t)a3, &v18->_cached_model.__begin_);
        if (v18->_cached_model.__begin_ == v18->_cached_model.__end_)
        {
          memset(&__p, 0, sizeof(__p));
          operator>>((uint64_t)a3, &__p);
          IArchive::blob(&v26, *(void *)a3, (uint64_t)&__p);
          uint64_t v22 = (*(void (**)(uint64_t))(*(void *)v26 + 32))(v26);
          model_data = v18->_model_data;
          v18->_model_data = (NSData *)v22;

          if (v27) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v27);
          }
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
        __p.__r_.__value_.__r.__words[0] = 0;
        operator>>((uint64_t)a3);
        v18->num_dimensions = __p.__r_.__value_.__r.__words[0];
        v24 = v18;
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    if (a7)
    {
      v16 = [v12 versionNumberString];
      v17 = [v14 versionNumberString];
      *a7 = +[MLModelErrorUtils genericErrorWithFormat:@"compiler major version for compiled model is %@ and is more recent than this framework major version %@.", v16, v17];
    }
    v18 = 0;
  }

  return v18;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  v5 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:0 variant:@"generic"];

  return v5;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  +[MLModel serializeInterfaceAndMetadata:a3 toArchive:a4 error:a6];
  id v9 = objc_opt_new();
  v10 = +[MLTreeEnsembleRegressor loadModelFromSpecification:a3 configuration:v9 error:a6];

  if (v10)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v17 = 0;
    operator<<<unsigned char>((uint64_t)a4, (uint64_t *)__p);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_19EC86ACE);
    OArchive::uniqueBlob(&v14, *((void **)a4 + 1), (const void **)__p);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v11 = v14;
    operator<<((uint64_t)a4, (uint64_t *)(v14 + 576));
    if ((v10[12] - v10[11]) >> 31)
    {
      if (a6)
      {
        +[MLModelErrorUtils genericErrorWithFormat:@"Internal error: model too large to be compiled."];
        id v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      if (!*(unsigned char *)v11 && !*(void *)(v11 + 624)) {
        Archiver::_ODataBlobImpl::_openAsStream(v11);
      }
      std::ostream::write();
      operator<<((uint64_t)a4, v10[14]);
      id v12 = +[MLCompilerResult resultWithArchive:a4];
    }
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  v5 = +[MLTreeEnsembleRegressor loadModelFromSpecificationWithCompilationOptions:a3 options:MEMORY[0x1E4F1CC08] error:a5];

  return v5;
}

+ (id)loadModelFromSpecificationWithCompilationOptions:(void *)a3 options:(id)a4 error:(id *)a5
{
  v38[3] = *(void **)MEMORY[0x1E4F143B8];
  id v25 = a4;
  if (*(void *)(*(void *)a3 + 16)) {
    double v7 = *(const CoreML::Specification::ModelDescription **)(*(void *)a3 + 16);
  }
  else {
    double v7 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  }
  CoreML::Specification::ModelDescription::ModelDescription((CoreML::Specification::ModelDescription *)v34, v7);
  if (*(_DWORD *)(*(void *)a3 + 44) == 302)
  {
    id v8 = [MLTreeEnsembleRegressor alloc];
    id v9 = objc_alloc_init(MLModelConfiguration);
    v10 = [(MLRegressor *)v8 initDescriptionOnlyWithSpecification:a3 configuration:v9 error:a5];

    if (v10)
    {
      CoreML::TreeEnsembles::constructAndValidateTreeEnsembleFromSpec((CoreML::TreeEnsembles *)&v32, *(const CoreML::Specification::Model **)a3);
      v38[0] = 0;
      v38[1] = 0;
      *(void *)buf = v38;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = v25;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v29 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            id v16 = [v11 objectForKeyedSubscript:v15];
            uint64_t v17 = [v16 UTF8String];
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v15 UTF8String]);
            v35 = __p;
            v18 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)buf, __p, (_OWORD **)&v35);
            MEMORY[0x19F3C1430]((char *)v18 + 56, v17);
            if (SHIBYTE(v27) < 0) {
              operator delete(__p[0]);
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v12);
      }

      uint64_t v20 = v32;
      unint64_t v19 = v33;
      if (v33) {
        atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      CoreML::TreeEnsembles::buildTreeEnsembleModelFromSpec((uint64_t)__p, v20, v19, (uint64_t)buf);
      v21 = v10 + 11;
      uint64_t v22 = (void *)v10[11];
      if (v22)
      {
        v10[12] = v22;
        operator delete(v22);
        void *v21 = 0;
        v10[12] = 0;
        v10[13] = 0;
      }
      *(_OWORD *)v21 = *(_OWORD *)__p;
      v10[13] = v27;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v27 = 0;
      if (v19)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
        v10[14] = *(void *)(v20 + 16);
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v38[0]);
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
      else
      {
        v10[14] = *(void *)(v20 + 16);
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v38[0]);
      }
      v23 = v10;
    }
    else
    {
      v23 = 0;
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:@"Interface type is not an TreeEnsembleRegressor"];
    v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  CoreML::Specification::ModelDescription::~ModelDescription((CoreML::Specification::ModelDescription *)v34);

  return v23;
}

@end