@interface MLAppleGazetteer
+ (BOOL)saveAppleGazetteerModelToURL:(id)a3 gazetteerParameters:(id)a4 error:(id *)a5;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLAppleGazetteer)initWithParameters:(id)a3 modelDescription:(id)a4 nlpHandle:(id)a5 configuration:(id)a6 error:(id *)a7;
- (MLAppleGazetteerParameters)parameters;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation MLAppleGazetteer

- (void).cxx_destruct
{
}

- (MLAppleGazetteerParameters)parameters
{
  return (MLAppleGazetteerParameters *)objc_getProperty(self, a2, 88, 1);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v8 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v9 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v27, v9, 9, -[MLModel signpostID](self, "signpostID"), [v8 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v10 = [(MLModel *)self signpostID];
  uint64_t v11 = [v8 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MLAppleGazetteer_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v10;
  aBlock[5] = v11;
  v12 = (void (**)(void))_Block_copy(aBlock);
  v13 = +[_MLNLPFrameworkHandle sharedHandle];
  if ([v13 isValid])
  {
    v14 = [(MLAppleGazetteerParameters *)self->_parameters inputFeatureName];
    v15 = [v25 featureValueForName:v14];
    v16 = [v15 stringValue];

    if (v16)
    {
      v17 = [v13 predictLabelForWordString:self->gazetteerModel inputString:v16 error:a5];
      if (v17)
      {
        v18 = [MLDictionaryFeatureProvider alloc];
        v19 = [(MLAppleGazetteerParameters *)self->_parameters outputFeatureName];
        v28 = v19;
        v29[0] = v17;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
        v21 = [(MLDictionaryFeatureProvider *)v18 initWithDictionary:v20 error:a5];

LABEL_15:
LABEL_16:

        goto LABEL_17;
      }
      if (!a5)
      {
LABEL_14:
        v17 = 0;
        v21 = 0;
        goto LABEL_15;
      }
      if (*a5)
      {
        v23 = [*a5 localizedDescription];
        *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Gazette does not contain input string '%@'. %@", v16, v23];

        goto LABEL_14;
      }
      id v22 = +[MLModelErrorUtils genericErrorWithFormat:@"Gazette does not contain input string '%@'. ", v16];
      v17 = 0;
    }
    else
    {
      if (!a5)
      {
        v21 = 0;
        goto LABEL_16;
      }
      v17 = [(MLAppleGazetteerParameters *)self->_parameters inputFeatureName];
      id v22 = +[MLModelErrorUtils IOErrorWithFormat:@"Input string feature '%@' not found", v17];
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
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v27);

  return v21;
}

uint64_t __57__MLAppleGazetteer_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (void)dealloc
{
  gazetteerModel = self->gazetteerModel;
  if (gazetteerModel) {
    CFRelease(gazetteerModel);
  }
  v4.receiver = self;
  v4.super_class = (Class)MLAppleGazetteer;
  [(MLAppleGazetteer *)&v4 dealloc];
}

- (MLAppleGazetteer)initWithParameters:(id)a3 modelDescription:(id)a4 nlpHandle:(id)a5 configuration:(id)a6 error:(id *)a7
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
    id v22 = +[MLModelErrorUtils genericErrorWithFormat:@"Invalid parameters for Gazetteer"];
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
  v24.super_class = (Class)MLAppleGazetteer;
  v19 = [(MLModel *)&v24 initWithDescription:v14 configuration:v16];
  if (!v19)
  {
LABEL_7:
    self = v19;
    v21 = self;
    goto LABEL_16;
  }
  v20 = [v13 modelParameterData];
  v19->gazetteerModel = (void *)[v15 initializeGazetteerModelWithData:v20 error:a7];

  if (v19->gazetteerModel)
  {
    objc_storeStrong((id *)&v19->_parameters, a3);
    goto LABEL_7;
  }
  if (a7)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"initialization of gazetteer model with model data failed"];
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

+ (BOOL)saveAppleGazetteerModelToURL:(id)a3 gazetteerParameters:(id)a4 error:(id *)a5
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v87 = a3;
  id v91 = a4;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v101, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  v6 = v101;
  *((_DWORD *)v101 + 6) = 9;
  uint64_t v7 = *((void *)v6 + 2);
  if (!v7) {
    operator new();
  }
  if (!*(void *)(v7 + 160)) {
    operator new();
  }
  v89 = *(long long ***)(v7 + 160);
  id v8 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v7 + 16);
  id v9 = [v91 inputFeatureName];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v9 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v8 + 2, &__p);
  if (v99 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  std::string::basic_string[abi:ne180100]<0>(&__p, "word");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v8 + 3, &__p);
  if (v99 < 0) {
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
  id v12 = [v91 outputFeatureName];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v12 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v11 + 2, &__p);
  if (v99 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  std::string::basic_string[abi:ne180100]<0>(&__p, "label");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v11 + 3, &__p);
  if (v99 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v13 = (uint64_t)v11[4];
  if (!v13) {
    operator new();
  }
  if (*(_DWORD *)(v13 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v13);
    *(_DWORD *)(v13 + 36) = 3;
    operator new();
  }
  id v14 = v101;
  if (*((_DWORD *)v101 + 11) != 2004)
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v101);
    *((_DWORD *)v14 + 11) = 2004;
    operator new();
  }
  uint64_t v15 = *((void *)v101 + 4);
  *(_DWORD *)(v15 + 32) = [v91 revision];
  id v16 = [v91 language];
  BOOL v17 = [v16 length] == 0;

  if (!v17)
  {
    id v18 = [v91 language];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v18 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v15 + 16), &__p);
    if (v99 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  id v19 = [v91 modelParameterData];
  v20 = (void *)[v19 bytes];
  v21 = [v91 modelParameterData];
  std::string::basic_string[abi:ne180100](&__p, v20, [v21 length]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v15 + 24), &__p);
  if (v99 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  id v22 = [v91 labelNames];
  uint64_t v90 = [v22 count];

  if (v90)
  {
    for (uint64_t i = 0; i != v90; ++i)
    {
      if (*(_DWORD *)(v15 + 52) != 200)
      {
        *(_DWORD *)(v15 + 52) = 200;
        operator new();
      }
      objc_super v24 = *(CoreML::Specification::StringVector **)(v15 + 40);
      id v25 = [v91 labelNames];
      id v26 = [v25 objectAtIndexedSubscript:i];
      CoreML::Specification::StringVector::add_vector(v24, (const char *)[v26 UTF8String]);
    }
  }
  v27 = [v91 metadata];
  BOOL v28 = v27 == 0;

  if (!v28)
  {
    v29 = [v91 metadata];
    v30 = [v29 objectForKeyedSubscript:@"MLModelAuthorKey"];
    if (v30)
    {
      v31 = [v91 metadata];
      v32 = [v31 objectForKeyedSubscript:@"MLModelAuthorKey"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_43;
      }
      v29 = [v91 metadata];
      id v34 = [v29 objectForKeyedSubscript:@"MLModelAuthorKey"];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v34 UTF8String]);
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 8, &__p);
      if (v99 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
    }
LABEL_43:
    v35 = [v91 metadata];
    v36 = [v35 objectForKeyedSubscript:@"MLModelLicenseKey"];
    if (v36)
    {
      v37 = [v91 metadata];
      v38 = [v37 objectForKeyedSubscript:@"MLModelLicenseKey"];
      objc_opt_class();
      char v39 = objc_opt_isKindOfClass();

      if ((v39 & 1) == 0) {
        goto LABEL_49;
      }
      v35 = [v91 metadata];
      id v40 = [v35 objectForKeyedSubscript:@"MLModelLicenseKey"];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v40 UTF8String]);
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 9, &__p);
      if (v99 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
    }
LABEL_49:
    v41 = [v91 metadata];
    v42 = [v41 objectForKeyedSubscript:@"MLModelVersionStringKey"];
    if (v42)
    {
      v43 = [v91 metadata];
      v44 = [v43 objectForKeyedSubscript:@"MLModelVersionStringKey"];
      objc_opt_class();
      char v45 = objc_opt_isKindOfClass();

      if ((v45 & 1) == 0) {
        goto LABEL_55;
      }
      v41 = [v91 metadata];
      id v46 = [v41 objectForKeyedSubscript:@"MLModelVersionStringKey"];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v46 UTF8String]);
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 7, &__p);
      if (v99 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
    }
LABEL_55:
    v47 = [v91 metadata];
    v48 = [v47 objectForKeyedSubscript:@"MLModelDescriptionKey"];
    if (v48)
    {
      v49 = [v91 metadata];
      v50 = [v49 objectForKeyedSubscript:@"MLModelDescriptionKey"];
      objc_opt_class();
      char v51 = objc_opt_isKindOfClass();

      if (v51)
      {
        v53 = [v91 metadata];
        v54 = [v53 objectForKeyedSubscript:@"MLModelDescriptionKey"];

        id v55 = v54;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v55 UTF8String]);
        *(void *)&double v52 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 6, &__p).n128_u64[0];
        if (v99 < 0) {
          operator delete((void *)__p.n128_u64[0]);
        }
LABEL_61:
        objc_msgSend(v91, "metadata", v52);
        id v56 = (id)objc_claimAutoreleasedReturnValue();
        v57 = [v56 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
        if (v57)
        {
          v58 = [v91 metadata];
          v59 = [v58 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
          objc_opt_class();
          char v60 = objc_opt_isKindOfClass();

          if ((v60 & 1) == 0) {
            goto LABEL_75;
          }
          v61 = [v91 metadata];
          v62 = [v61 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];

          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          id v56 = v62;
          uint64_t v63 = [v56 countByEnumeratingWithState:&v94 objects:v105 count:16];
          if (v63)
          {
            uint64_t v64 = *(void *)v95;
            do
            {
              for (uint64_t j = 0; j != v63; ++j)
              {
                if (*(void *)v95 != v64) {
                  objc_enumerationMutation(v56);
                }
                v66 = *(void **)(*((void *)&v94 + 1) + 8 * j);
                v67 = [v56 objectForKeyedSubscript:v66];
                v68 = [v67 description];

                if (v68)
                {
                  uint64_t v69 = [v68 UTF8String];
                  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v66 UTF8String]);
                  v70 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)(v89 + 3), (uint64_t)&__p);
                  MEMORY[0x19F3C1430](v70, v69);
                  if (v99 < 0) {
                    operator delete((void *)__p.n128_u64[0]);
                  }
                }
              }
              uint64_t v63 = [v56 countByEnumeratingWithState:&v94 objects:v105 count:16];
            }
            while (v63);
          }
        }
LABEL_75:
        if (v55) {
          goto LABEL_86;
        }
        goto LABEL_76;
      }
    }
    else
    {
    }
    id v55 = 0;
    goto LABEL_61;
  }
LABEL_76:
  v71 = [v91 language];
  BOOL v72 = v71 == 0;

  v73 = NSString;
  if (v72)
  {
    v76 = objc_msgSend(NSString, "stringWithFormat:", @"This is a gazetteer model (version %lu) which classifies text according to set {", objc_msgSend(v91, "revision"));
  }
  else
  {
    uint64_t v74 = [v91 revision];
    v75 = [v91 language];
    v76 = [v73 stringWithFormat:@"This is a gazetteer model (version %lu) which classifies %@ text according to set {", v74, v75, v87];
  }
  if (v90)
  {
    for (uint64_t k = 0; k != v90; ++k)
    {
      v78 = [v91 labelNames];
      v79 = [v78 objectAtIndexedSubscript:k];
      v80 = [v76 stringByAppendingFormat:@"%@,", v79];

      v76 = v80;
    }
  }
  else
  {
    v80 = v76;
  }
  v81 = objc_msgSend(v80, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v80, "length") - 1, 1, @"}");

  id v55 = v81;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v55 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v89 + 6, &__p);
  if (v99 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
LABEL_86:
  v82 = v101;
  id v83 = v87;
  std::string::basic_string[abi:ne180100]<0>(&v92, (char *)[v83 fileSystemRepresentation]);
  CoreML::Model::Model((CoreML::Model *)v103, v82);
  CoreML::Model::save((uint64_t)&__p, (uint64_t)v103);
  v103[0] = &unk_1EF0DB228;
  if (v104) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v104);
  }
  if (v93 < 0) {
    operator delete(v92);
  }
  unsigned __int32 v84 = __p.n128_u32[0] & 0xFFFFFFEF;
  if (a5 && v84)
  {
    v85 = &__p.n128_u64[1];
    if (v100 < 0) {
      v85 = (unint64_t *)__p.n128_u64[1];
    }
    *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"Unable to save model to %@. %s", v83, v85];
  }
  if (v100 < 0) {
    operator delete((void *)__p.n128_u64[1]);
  }

  if (v102) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v102);
  }

  return v84 == 0;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 2004)
  {
    id v8 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
    id v9 = +[_MLNLPFrameworkHandle sharedHandle];
    uint64_t v10 = (CoreML::Specification::CoreMLModels::protobuf_Gazetteer_2eproto *)[v9 isValid];
    if (v10)
    {
      if (*(_DWORD *)(*(void *)a3 + 44) == 2004)
      {
        uint64_t v11 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        CoreML::Specification::CoreMLModels::protobuf_Gazetteer_2eproto::InitDefaults(v10);
        uint64_t v11 = &CoreML::Specification::CoreMLModels::_Gazetteer_default_instance_;
      }
      v41 = &unk_1EF0CF4D8;
      v42[0] = 0;
      int v46 = 0;
      uint64_t v13 = v11[1];
      if (v13) {
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(v42, v13 & 0xFFFFFFFFFFFFFFFELL);
      }
      v42[1] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
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
      v43 = &google::protobuf::internal::fixed_address_empty_string;
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
      unsigned int v44 = *((_DWORD *)v11 + 8);
      int v47 = 0;
      if (*((_DWORD *)v11 + 13) == 200)
      {
        int v47 = 200;
        operator new();
      }
      id v18 = objc_alloc_init(MLAppleGazetteerParameters);
      [(MLAppleGazetteerParameters *)v18 setRevision:v44];
      id v19 = objc_msgSend(NSString, "stringWithUTF8String:");
      [(MLAppleGazetteerParameters *)v18 setLanguage:v19];

      v20 = [v8 inputDescriptionsByName];
      v21 = [v20 allKeys];
      id v22 = [v21 objectAtIndexedSubscript:0];
      [(MLAppleGazetteerParameters *)v18 setInputFeatureName:v22];

      v23 = [v8 outputDescriptionsByName];
      objc_super v24 = [v23 allKeys];
      id v25 = [v24 objectAtIndexedSubscript:0];
      [(MLAppleGazetteerParameters *)v18 setOutputFeatureName:v25];

      if (v47 == 200)
      {
        char v39 = v9;
        uint64_t v26 = v45;
        uint64_t v27 = *(unsigned int *)(v45 + 24);
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ((int)v27 >= 1)
        {
          uint64_t v29 = 0;
          uint64_t v30 = 8 * v27;
          do
          {
            v31 = *(uint64_t **)(*(void *)(v26 + 32) + v29 + 8);
            if (*((char *)v31 + 23) < 0) {
              v31 = (uint64_t *)*v31;
            }
            v32 = [NSString stringWithUTF8String:v31];
            [v28 addObject:v32];

            v29 += 8;
          }
          while (v30 != v29);
        }
        id v9 = v39;
        if (v28)
        {
          v33 = (void *)[v28 copy];
          [(MLAppleGazetteerParameters *)v18 setLabelNames:v33];

          [v8 setClassLabels:v28];
        }
      }
      else
      {
        id v28 = 0;
      }
      if (*((char *)v43 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v40, *(const std::string::value_type **)v43, *((void *)v43 + 1));
      }
      else
      {
        long long v34 = *v43;
        v40.__r_.__value_.__r.__words[2] = *((void *)v43 + 2);
        *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v34;
      }
      if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v35 = &v40;
      }
      else {
        v35 = (std::string *)v40.__r_.__value_.__r.__words[0];
      }
      if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v40.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v40.__r_.__value_.__l.__size_;
      }
      v37 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v35 length:size];
      [(MLAppleGazetteerParameters *)v18 setModelParameterData:v37];

      id v12 = [[MLAppleGazetteer alloc] initWithParameters:v18 modelDescription:v8 nlpHandle:v9 configuration:v7 error:a5];
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v40.__r_.__value_.__l.__data_);
      }

      CoreML::Specification::CoreMLModels::Gazetteer::~Gazetteer((CoreML::Specification::CoreMLModels::Gazetteer *)&v41);
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
    +[MLModelErrorUtils IOErrorWithFormat:@"Model type is not a Gazetteer"];
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