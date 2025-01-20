@interface MLAppleWordEmbedding
+ (BOOL)saveAppleWordEmbeddingModelToURL:(id)a3 wordEmbeddingParameters:(id)a4 error:(id *)a5;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLAppleWordEmbedding)initWithParameters:(id)a3 modelDescription:(id)a4 nlpHandle:(id)a5 configuration:(id)a6 error:(id *)a7;
- (MLAppleWordEmbeddingParameters)parameters;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation MLAppleWordEmbedding

- (void).cxx_destruct
{
}

- (MLAppleWordEmbeddingParameters)parameters
{
  return (MLAppleWordEmbeddingParameters *)objc_getProperty(self, a2, 88, 1);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v8 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v9 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v28, v9, 10, -[MLModel signpostID](self, "signpostID"), [v8 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v10 = [(MLModel *)self signpostID];
  uint64_t v11 = [v8 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__MLAppleWordEmbedding_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(void))_Block_copy(aBlock);
  v13 = +[_MLNLPFrameworkHandle sharedHandle];
  if ([v13 isValid])
  {
    v14 = [(MLAppleWordEmbeddingParameters *)self->_parameters inputFeatureName];
    v15 = [v26 featureValueForName:v14];
    v25 = [v15 stringValue];

    if (v25)
    {
      v16 = [v13 predictVectorForString:self->wordEmbeddingModel inputString:v25 error:a5];
      if (v16)
      {
        v17 = [MLDictionaryFeatureProvider alloc];
        v18 = [(MLAppleWordEmbeddingParameters *)self->_parameters outputFeatureName];
        v29 = v18;
        v19 = +[MLMultiArray doubleVectorWithValues:v16];
        v30[0] = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        v21 = [(MLDictionaryFeatureProvider *)v17 initWithDictionary:v20 error:a5];

LABEL_15:
LABEL_16:

        goto LABEL_17;
      }
      if (!a5)
      {
LABEL_14:
        v16 = 0;
        v21 = 0;
        goto LABEL_15;
      }
      if (*a5)
      {
        v23 = [*a5 localizedDescription];
        *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Embedding does not contain input string '%@'. %@", v25, v23];

        goto LABEL_14;
      }
      id v22 = +[MLModelErrorUtils genericErrorWithFormat:@"Embedding does not contain input string '%@'. ", v25];
      v16 = 0;
    }
    else
    {
      if (!a5)
      {
        v21 = 0;
        goto LABEL_16;
      }
      v16 = [(MLAppleWordEmbeddingParameters *)self->_parameters inputFeatureName];
      id v22 = +[MLModelErrorUtils IOErrorWithFormat:@"Input string feature '%@' not found", v16];
    }
    v21 = 0;
    *a5 = v22;
    goto LABEL_15;
  }
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"NaturalLanguage framework not available on this OS version"];
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_17:

  v12[2](v12);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v28);

  return v21;
}

uint64_t __61__MLAppleWordEmbedding_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (void)dealloc
{
  wordEmbeddingModel = self->wordEmbeddingModel;
  if (wordEmbeddingModel) {
    CFRelease(wordEmbeddingModel);
  }
  v4.receiver = self;
  v4.super_class = (Class)MLAppleWordEmbedding;
  [(MLAppleWordEmbedding *)&v4 dealloc];
}

- (MLAppleWordEmbedding)initWithParameters:(id)a3 modelDescription:(id)a4 nlpHandle:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (([v15 isValid] & 1) == 0)
  {
    if (!a7) {
      goto LABEL_15;
    }
    id v22 = +[MLModelErrorUtils genericErrorWithFormat:@"NaturalLanguage framework not available on this OS version"];
LABEL_14:
    v21 = 0;
    *a7 = v22;
    goto LABEL_16;
  }
  if (!v13)
  {
    if (!a7) {
      goto LABEL_15;
    }
    id v22 = +[MLModelErrorUtils genericErrorWithFormat:@"Invalid parameters for Word Embedding"];
    goto LABEL_14;
  }
  v17 = [v13 modelParameterData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (a7)
    {
      id v22 = +[MLModelErrorUtils genericErrorWithFormat:@"parameters.modelParameterData does not exist or is not a NSData"];
      goto LABEL_14;
    }
LABEL_15:
    v21 = 0;
    goto LABEL_16;
  }
  v24.receiver = self;
  v24.super_class = (Class)MLAppleWordEmbedding;
  v19 = [(MLModel *)&v24 initWithDescription:v14 configuration:v16];
  if (!v19)
  {
LABEL_7:
    self = v19;
    v21 = self;
    goto LABEL_16;
  }
  v20 = [v13 modelParameterData];
  v19->wordEmbeddingModel = (void *)[v15 initializeEmbeddingModelWithData:v20 error:a7];

  if (v19->wordEmbeddingModel)
  {
    objc_storeStrong((id *)&v19->_parameters, a3);
    goto LABEL_7;
  }
  if (a7)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"initialization of word embedding model with model data failed"];
    v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  self = v19;
LABEL_16:

  return v21;
}

+ (BOOL)saveAppleWordEmbeddingModelToURL:(id)a3 wordEmbeddingParameters:(id)a4 error:(id *)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v81 = a4;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v91, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  v6 = v91;
  *((_DWORD *)v91 + 6) = 9;
  uint64_t v7 = *((void *)v6 + 2);
  if (!v7) {
    operator new();
  }
  if (!*(void *)(v7 + 160)) {
    operator new();
  }
  v80 = *(long long ***)(v7 + 160);
  id v8 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v7 + 16);
  id v9 = [v81 inputFeatureName];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v9 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v8 + 2, &__p);
  if (v89 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  std::string::basic_string[abi:ne180100]<0>(&__p, "word");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v8 + 3, &__p);
  if (v89 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v10 = (uint64_t)v8[4];
  if (!v10) {
    operator new();
  }
  if (*(_DWORD *)(v10 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v10);
    *(_DWORD *)(v10 + 36) = 3;
    operator new();
  }
  uint64_t v11 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v7 + 40);
  id v12 = [v81 outputFeatureName];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v12 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v11 + 2, &__p);
  if (v89 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  std::string::basic_string[abi:ne180100]<0>(&__p, "vector");
  *(void *)&double v13 = google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v11 + 3, &__p).n128_u64[0];
  if (v89 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v14 = (uint64_t)v11[4];
  if (!v14) {
    operator new();
  }
  if (*(_DWORD *)(v14 + 36) != 5)
  {
    CoreML::Specification::FeatureType::clear_Type(v14);
    *(_DWORD *)(v14 + 36) = 5;
    operator new();
  }
  *(_DWORD *)(*(void *)(v14 + 24) + 36) = 65600;
  id v15 = v91;
  if (*((_DWORD *)v91 + 11) != 2005)
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v91);
    *((_DWORD *)v15 + 11) = 2005;
    operator new();
  }
  uint64_t v16 = *((void *)v91 + 4);
  *(_DWORD *)(v16 + 32) = objc_msgSend(v81, "revision", v13);
  v17 = [v81 language];
  BOOL v18 = [v17 length] == 0;

  if (!v18)
  {
    id v19 = [v81 language];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v19 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v16 + 16), &__p);
    if (v89 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  id v20 = [v81 modelParameterData];
  v21 = (void *)[v20 bytes];
  id v22 = [v81 modelParameterData];
  std::string::basic_string[abi:ne180100](&__p, v21, [v22 length]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v16 + 24), &__p);
  if (v89 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  v23 = [v81 metadata];
  BOOL v24 = v23 == 0;

  if (!v24)
  {
    v25 = [v81 metadata];
    id v26 = [v25 objectForKeyedSubscript:@"MLModelAuthorKey"];
    if (v26)
    {
      v27 = [v81 metadata];
      v28 = [v27 objectForKeyedSubscript:@"MLModelAuthorKey"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_37;
      }
      v25 = [v81 metadata];
      id v30 = [v25 objectForKeyedSubscript:@"MLModelAuthorKey"];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v30 UTF8String]);
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v80 + 8, &__p);
      if (v89 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
    }
LABEL_37:
    v31 = [v81 metadata];
    v32 = [v31 objectForKeyedSubscript:@"MLModelLicenseKey"];
    if (v32)
    {
      v33 = [v81 metadata];
      v34 = [v33 objectForKeyedSubscript:@"MLModelLicenseKey"];
      objc_opt_class();
      char v35 = objc_opt_isKindOfClass();

      if ((v35 & 1) == 0) {
        goto LABEL_43;
      }
      v31 = [v81 metadata];
      id v36 = [v31 objectForKeyedSubscript:@"MLModelLicenseKey"];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v36 UTF8String]);
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v80 + 9, &__p);
      if (v89 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
    }
LABEL_43:
    v37 = [v81 metadata];
    v38 = [v37 objectForKeyedSubscript:@"MLModelVersionStringKey"];
    if (v38)
    {
      v39 = [v81 metadata];
      v40 = [v39 objectForKeyedSubscript:@"MLModelVersionStringKey"];
      objc_opt_class();
      char v41 = objc_opt_isKindOfClass();

      if ((v41 & 1) == 0) {
        goto LABEL_49;
      }
      v37 = [v81 metadata];
      id v42 = [v37 objectForKeyedSubscript:@"MLModelVersionStringKey"];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v42 UTF8String]);
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v80 + 7, &__p);
      if (v89 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
    }
LABEL_49:
    v43 = [v81 metadata];
    v44 = [v43 objectForKeyedSubscript:@"MLModelDescriptionKey"];
    if (v44)
    {
      v45 = [v81 metadata];
      v46 = [v45 objectForKeyedSubscript:@"MLModelDescriptionKey"];
      objc_opt_class();
      char v47 = objc_opt_isKindOfClass();

      if (v47)
      {
        v49 = [v81 metadata];
        v50 = [v49 objectForKeyedSubscript:@"MLModelDescriptionKey"];

        id v51 = v50;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v51 UTF8String]);
        *(void *)&double v48 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v80 + 6, &__p).n128_u64[0];
        if (v89 < 0) {
          operator delete((void *)__p.n128_u64[0]);
        }
LABEL_55:
        objc_msgSend(v81, "metadata", v48);
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        v53 = [v52 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
        if (v53)
        {
          v54 = [v81 metadata];
          v55 = [v54 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
          objc_opt_class();
          char v56 = objc_opt_isKindOfClass();

          if ((v56 & 1) == 0) {
            goto LABEL_69;
          }
          v57 = [v81 metadata];
          v58 = [v57 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];

          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          id v52 = v58;
          uint64_t v59 = [v52 countByEnumeratingWithState:&v84 objects:v95 count:16];
          if (v59)
          {
            uint64_t v60 = *(void *)v85;
            do
            {
              for (uint64_t i = 0; i != v59; ++i)
              {
                if (*(void *)v85 != v60) {
                  objc_enumerationMutation(v52);
                }
                v62 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                v63 = [v52 objectForKeyedSubscript:v62];
                v64 = [v63 description];

                if (v64)
                {
                  uint64_t v65 = [v64 UTF8String];
                  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v62 UTF8String]);
                  v66 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)(v80 + 3), (uint64_t)&__p);
                  MEMORY[0x19F3C1430](v66, v65);
                  if (v89 < 0) {
                    operator delete((void *)__p.n128_u64[0]);
                  }
                }
              }
              uint64_t v59 = [v52 countByEnumeratingWithState:&v84 objects:v95 count:16];
            }
            while (v59);
          }
        }
LABEL_69:
        if (v51) {
          goto LABEL_75;
        }
        goto LABEL_70;
      }
    }
    else
    {
    }
    id v51 = 0;
    goto LABEL_55;
  }
LABEL_70:
  v67 = [v81 language];
  BOOL v68 = v67 == 0;

  v69 = NSString;
  if (v68)
  {
    v72 = objc_msgSend(NSString, "stringWithFormat:", @"This model is a word embedding (version %lu) which represents a word in a vector space.", objc_msgSend(v81, "revision"));
  }
  else
  {
    uint64_t v70 = [v81 revision];
    v71 = [v81 language];
    v72 = [v69 stringWithFormat:@"This model is a word embedding (version %lu) which represents an %@ word in a vector space.", v70, v71];
  }
  id v51 = v72;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v51 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v80 + 6, &__p);
  if (v89 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
LABEL_75:
  v73 = v91;
  id v74 = v78;
  std::string::basic_string[abi:ne180100]<0>(&v82, (char *)[v74 fileSystemRepresentation]);
  CoreML::Model::Model((CoreML::Model *)v93, v73);
  CoreML::Model::save((uint64_t)&__p, (uint64_t)v93);
  v93[0] = &unk_1EF0DB228;
  if (v94) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v94);
  }
  if (v83 < 0) {
    operator delete(v82);
  }
  unsigned __int32 v75 = __p.n128_u32[0] & 0xFFFFFFEF;
  if (a5 && v75)
  {
    v76 = &__p.n128_u64[1];
    if (v90 < 0) {
      v76 = (unint64_t *)__p.n128_u64[1];
    }
    *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"Unable to save model to %@. %s", v74, v76];
  }
  if (v90 < 0) {
    operator delete((void *)__p.n128_u64[1]);
  }

  if (v92) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v92);
  }

  return v75 == 0;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 2005)
  {
    id v8 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
    id v9 = +[_MLNLPFrameworkHandle sharedHandle];
    uint64_t v10 = (CoreML::Specification::CoreMLModels::protobuf_WordEmbedding_2eproto *)[v9 isValid];
    if (v10)
    {
      if (*(_DWORD *)(*(void *)a3 + 44) == 2005)
      {
        uint64_t v11 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        CoreML::Specification::CoreMLModels::protobuf_WordEmbedding_2eproto::InitDefaults(v10);
        uint64_t v11 = &CoreML::Specification::CoreMLModels::_WordEmbedding_default_instance_;
      }
      v32 = &unk_1EF0CEF80;
      v33[0] = 0;
      int v36 = 0;
      uint64_t v13 = v11[1];
      if (v13) {
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom((unint64_t *)v33, v13 & 0xFFFFFFFFFFFFFFFELL);
      }
      v33[1] = (uint64_t)&google::protobuf::internal::fixed_address_empty_string;
      uint64_t v14 = v11[2];
      if (*(char *)(v14 + 23) < 0) {
        uint64_t v15 = *(void *)(v14 + 8);
      }
      else {
        uint64_t v15 = *(unsigned __int8 *)(v14 + 23);
      }
      if ((long long *)v14 != &google::protobuf::internal::fixed_address_empty_string && v15) {
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
      }
      v34 = &google::protobuf::internal::fixed_address_empty_string;
      uint64_t v16 = v11[3];
      if (*(char *)(v16 + 23) < 0) {
        uint64_t v17 = *(void *)(v16 + 8);
      }
      else {
        uint64_t v17 = *(unsigned __int8 *)(v16 + 23);
      }
      if ((long long *)v16 != &google::protobuf::internal::fixed_address_empty_string && v17) {
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
      }
      unsigned int v35 = *((_DWORD *)v11 + 8);
      BOOL v18 = objc_alloc_init(MLAppleWordEmbeddingParameters);
      [(MLAppleWordEmbeddingParameters *)v18 setRevision:v35];
      id v19 = objc_msgSend(NSString, "stringWithUTF8String:");
      [(MLAppleWordEmbeddingParameters *)v18 setLanguage:v19];

      id v20 = [v8 inputDescriptionsByName];
      v21 = [v20 allKeys];
      id v22 = [v21 objectAtIndexedSubscript:0];
      [(MLAppleWordEmbeddingParameters *)v18 setInputFeatureName:v22];

      v23 = [v8 outputDescriptionsByName];
      BOOL v24 = [v23 allKeys];
      v25 = [v24 objectAtIndexedSubscript:0];
      [(MLAppleWordEmbeddingParameters *)v18 setOutputFeatureName:v25];

      if (*((char *)v34 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v34, *((void *)v34 + 1));
      }
      else
      {
        long long v26 = *v34;
        __p.__r_.__value_.__r.__words[2] = *((void *)v34 + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v26;
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      v29 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", p_p, size, __p.__r_.__value_.__r.__words[0]);
      [(MLAppleWordEmbeddingParameters *)v18 setModelParameterData:v29];

      id v12 = [[MLAppleWordEmbedding alloc] initWithParameters:v18 modelDescription:v8 nlpHandle:v9 configuration:v7 error:a5];
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }

      v32 = &unk_1EF0CEF80;
      CoreML::Specification::SerializedModel::SharedDtor((uint64_t)&v32);
      google::protobuf::internal::InternalMetadataWithArenaBase<std::string,google::protobuf::internal::InternalMetadataWithArenaLite>::~InternalMetadataWithArenaBase(v33);
    }
    else if (a5)
    {
      +[MLModelErrorUtils genericErrorWithFormat:@"NaturalLanguage framework not available on this OS version"];
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:@"Model type is not a Word Embedding"];
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end