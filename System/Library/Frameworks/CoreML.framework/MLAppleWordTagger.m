@interface MLAppleWordTagger
+ (BOOL)saveAppleWordTaggingModelToURL:(id)a3 wordTaggerParameters:(id)a4 error:(id *)a5;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLAppleWordTagger)initWithParameters:(id)a3 modelDescription:(id)a4 nlpHandle:(id)a5 configuration:(id)a6 error:(id *)a7;
- (MLAppleWordTaggerParameters)parameters;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation MLAppleWordTagger

- (void).cxx_destruct
{
}

- (MLAppleWordTaggerParameters)parameters
{
  return (MLAppleWordTaggerParameters *)objc_getProperty(self, a2, 88, 1);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v58 = v8;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v10 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v60, v10, 7, -[MLModel signpostID](self, "signpostID"), [v9 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  unint64_t v11 = [(MLModel *)self signpostID];
  uint64_t v12 = [v9 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__MLAppleWordTagger_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v11;
  aBlock[5] = v12;
  v13 = (void (**)(void))_Block_copy(aBlock);
  v14 = +[_MLNLPFrameworkHandle sharedHandle];
  if ([v14 isValid])
  {
    v15 = [(MLAppleWordTaggerParameters *)self->_parameters inputFeatureName];
    v16 = [v8 featureValueForName:v15];
    v17 = [v16 stringValue];

    if (v17)
    {
      v55 = v17;
      uint64_t v18 = [v14 predictTokensLabelsLocationsLengthsForString:self->wordTaggingModel inputString:v17 error:a5];
      if (v18)
      {
        v57 = (void *)v18;
        id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v19 = [(MLAppleWordTaggerParameters *)self->_parameters tokenTagsOutputFeatureName];
        uint64_t v20 = [v19 length];

        if (v20)
        {
          v51 = [v57 allKeys];
          v48 = [v51 objectAtIndexedSubscript:1];
          v21 = [v57 objectForKeyedSubscript:v48];
          v22 = +[MLSequence sequenceWithStringArray:v21];
          v23 = +[MLFeatureValue featureValueWithSequence:v22];
          v24 = [(MLAppleWordTaggerParameters *)self->_parameters tokenTagsOutputFeatureName];
          [v56 setObject:v23 forKeyedSubscript:v24];
        }
        v25 = [(MLAppleWordTaggerParameters *)self->_parameters tokenLocationsOutputFeatureName];
        uint64_t v26 = [v25 length];

        if (v26)
        {
          v52 = [v57 allKeys];
          v49 = [v52 objectAtIndexedSubscript:0];
          v27 = [v57 objectForKeyedSubscript:v49];
          v28 = +[MLSequence sequenceWithInt64Array:v27];
          v29 = +[MLFeatureValue featureValueWithSequence:v28];
          v30 = [(MLAppleWordTaggerParameters *)self->_parameters tokenLocationsOutputFeatureName];
          [v56 setObject:v29 forKeyedSubscript:v30];
        }
        v31 = [(MLAppleWordTaggerParameters *)self->_parameters tokenLengthsOutputFeatureName];
        uint64_t v32 = [v31 length];

        if (v32)
        {
          v53 = [v57 allKeys];
          v50 = [v53 objectAtIndexedSubscript:2];
          v33 = [v57 objectForKeyedSubscript:v50];
          v34 = +[MLSequence sequenceWithInt64Array:v33];
          v35 = +[MLFeatureValue featureValueWithSequence:v34];
          v36 = [(MLAppleWordTaggerParameters *)self->_parameters tokenLengthsOutputFeatureName];
          [v56 setObject:v35 forKeyedSubscript:v36];
        }
        v37 = [(MLAppleWordTaggerParameters *)self->_parameters tokensOutputFeatureName];
        uint64_t v38 = [v37 length];

        if (v38)
        {
          v54 = [v57 allKeys];
          v39 = [v54 objectAtIndexedSubscript:3];
          v40 = [v57 objectForKeyedSubscript:v39];
          v41 = +[MLSequence sequenceWithStringArray:v40];
          v42 = +[MLFeatureValue featureValueWithSequence:v41];
          v43 = [(MLAppleWordTaggerParameters *)self->_parameters tokensOutputFeatureName];
          [v56 setObject:v42 forKeyedSubscript:v43];
        }
        v44 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v56 error:a5];

        v45 = v57;
        goto LABEL_21;
      }
      if (!a5)
      {
        v45 = 0;
        v44 = 0;
        goto LABEL_21;
      }
      id v46 = +[MLModelErrorUtils genericErrorWithFormat:@"Prediction failed"];
      v45 = 0;
    }
    else
    {
      if (!a5)
      {
        v44 = 0;
        goto LABEL_22;
      }
      v55 = 0;
      v45 = [(MLAppleWordTaggerParameters *)self->_parameters inputFeatureName];
      id v46 = +[MLModelErrorUtils IOErrorWithFormat:@"Input string feature '%@' not found", v45];
    }
    v44 = 0;
    *a5 = v46;
LABEL_21:

    v17 = v55;
LABEL_22:

    goto LABEL_23;
  }
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"NaturalLanguage framework not available on this OS version"];
    v44 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }
LABEL_23:

  v13[2](v13);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v60);

  return v44;
}

uint64_t __58__MLAppleWordTagger_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (void)dealloc
{
  wordTaggingModel = self->wordTaggingModel;
  if (wordTaggingModel) {
    CFRelease(wordTaggingModel);
  }
  v4.receiver = self;
  v4.super_class = (Class)MLAppleWordTagger;
  [(MLAppleWordTagger *)&v4 dealloc];
}

- (MLAppleWordTagger)initWithParameters:(id)a3 modelDescription:(id)a4 nlpHandle:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v15 || ([v15 isValid] & 1) == 0)
  {
    if (!a7) {
      goto LABEL_16;
    }
    v22 = +[MLModelErrorUtils genericErrorWithFormat:@"NaturalLanguage framework not available on this OS version"];
LABEL_11:
    v21 = 0;
    *a7 = v22;
    goto LABEL_17;
  }
  if (!v13)
  {
    if (!a7) {
      goto LABEL_16;
    }
    v22 = +[MLModelErrorUtils genericErrorWithFormat:@"Invalid parameters for Word Tagger"];
    goto LABEL_11;
  }
  v17 = [v13 modelParameterData];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (a7)
    {
      v22 = +[MLModelErrorUtils genericErrorWithFormat:@"parameters.modelParameterData does not exist or is not a NSData"];
      goto LABEL_11;
    }
LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  v24.receiver = self;
  v24.super_class = (Class)MLAppleWordTagger;
  v19 = [(MLModel *)&v24 initWithDescription:v14 configuration:v16];
  if (!v19)
  {
LABEL_8:
    self = v19;
    v21 = self;
    goto LABEL_17;
  }
  uint64_t v20 = [v13 modelParameterData];
  v19->wordTaggingModel = (void *)[v15 initializeWordTaggingModelWithData:v20 error:a7];

  if (v19->wordTaggingModel)
  {
    objc_storeStrong((id *)&v19->_parameters, a3);
    goto LABEL_8;
  }
  if (a7)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"initialization of word tagger model with model data failed"];
    v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  self = v19;
LABEL_17:

  return v21;
}

+ (BOOL)saveAppleWordTaggingModelToURL:(id)a3 wordTaggerParameters:(id)a4 error:(id *)a5
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v118 = a3;
  id v122 = a4;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v132, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  v6 = v132;
  *((_DWORD *)v132 + 6) = 9;
  uint64_t v7 = *((void *)v6 + 2);
  if (!v7) {
    operator new();
  }
  if (!*(void *)(v7 + 160)) {
    operator new();
  }
  v120 = *(long long ***)(v7 + 160);
  if (*((_DWORD *)v6 + 11) != 2001)
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v6);
    *((_DWORD *)v6 + 11) = 2001;
    operator new();
  }
  uint64_t v8 = *((void *)v6 + 4);
  *(_DWORD *)(v8 + 64) = [v122 revision];
  id v9 = [v122 language];
  BOOL v10 = [v9 length] == 0;

  if (!v10)
  {
    id v11 = [v122 language];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v11 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v8 + 16), &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  id v12 = [v122 tokenTagsOutputFeatureName];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v12 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v8 + 32), &__p);
  if (v130 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  id v13 = [v122 modelParameterData];
  id v14 = (void *)[v13 bytes];
  id v15 = [v122 modelParameterData];
  std::string::basic_string[abi:ne180100](&__p, v14, [v15 length]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v8 + 56), &__p);
  if (v130 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  id v16 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v7 + 16);
  id v17 = [v122 inputFeatureName];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v17 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v16 + 2, &__p);
  if (v130 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  std::string::basic_string[abi:ne180100]<0>(&__p, "Input text");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v16 + 3, &__p);
  if (v130 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v18 = (uint64_t)v16[4];
  if (!v18) {
    operator new();
  }
  if (*(_DWORD *)(v18 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v18);
    *(_DWORD *)(v18 + 36) = 3;
    operator new();
  }
  uint64_t v19 = v7 + 40;
  uint64_t v20 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v19);
  id v21 = [v122 tokenTagsOutputFeatureName];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v21 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v20 + 2, &__p);
  if (v130 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }

  std::string::basic_string[abi:ne180100]<0>(&__p, "Token tags");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v20 + 3, &__p);
  if (v130 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v22 = (uint64_t)v20[4];
  if (!v22) {
    operator new();
  }
  if (*(_DWORD *)(v22 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v22);
    *(_DWORD *)(v22 + 36) = 7;
    operator new();
  }
  uint64_t v23 = *(void *)(v22 + 24);
  if (*(_DWORD *)(v23 + 36) != 3)
  {
    CoreML::Specification::SequenceFeatureType::clear_Type(v23);
    *(_DWORD *)(v23 + 36) = 3;
    operator new();
  }
  if (*(_DWORD *)(v22 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v22);
    *(_DWORD *)(v22 + 36) = 7;
    operator new();
  }
  uint64_t v24 = *(void *)(*(void *)(v22 + 24) + 16);
  if (!v24) {
    operator new();
  }
  *(void *)(v24 + 16) = 0;
  if (*(_DWORD *)(v22 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v22);
    *(_DWORD *)(v22 + 36) = 7;
    operator new();
  }
  uint64_t v25 = *(void *)(*(void *)(v22 + 24) + 16);
  if (!v25) {
    operator new();
  }
  *(void *)(v25 + 24) = 10000;
  uint64_t v26 = [v122 tokenLengthsOutputFeatureName];
  BOOL v27 = [v26 length] == 0;

  if (!v27)
  {
    v28 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v19);
    id v29 = [v122 tokenLengthsOutputFeatureName];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v29 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v28 + 2, &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }

    std::string::basic_string[abi:ne180100]<0>(&__p, "Token lengths");
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v28 + 3, &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
    uint64_t v30 = (uint64_t)v28[4];
    if (!v30) {
      operator new();
    }
    if (*(_DWORD *)(v30 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v30);
      *(_DWORD *)(v30 + 36) = 7;
      operator new();
    }
    uint64_t v31 = *(void *)(v30 + 24);
    if (*(_DWORD *)(v31 + 36) != 1)
    {
      CoreML::Specification::SequenceFeatureType::clear_Type(v31);
      *(_DWORD *)(v31 + 36) = 1;
      operator new();
    }
    if (*(_DWORD *)(v30 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v30);
      *(_DWORD *)(v30 + 36) = 7;
      operator new();
    }
    uint64_t v32 = *(void *)(*(void *)(v30 + 24) + 16);
    if (!v32) {
      operator new();
    }
    *(void *)(v32 + 16) = 0;
    if (*(_DWORD *)(v30 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v30);
      *(_DWORD *)(v30 + 36) = 7;
      operator new();
    }
    uint64_t v33 = *(void *)(*(void *)(v30 + 24) + 16);
    if (!v33) {
      operator new();
    }
    *(void *)(v33 + 24) = 10000;
    id v34 = [v122 tokenLengthsOutputFeatureName];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v34 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v8 + 48), &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  v35 = [v122 tokenLocationsOutputFeatureName];
  BOOL v36 = [v35 length] == 0;

  if (!v36)
  {
    v37 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v19);
    id v38 = [v122 tokenLocationsOutputFeatureName];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v38 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v37 + 2, &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }

    std::string::basic_string[abi:ne180100]<0>(&__p, "Token locations");
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v37 + 3, &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
    uint64_t v39 = (uint64_t)v37[4];
    if (!v39) {
      operator new();
    }
    if (*(_DWORD *)(v39 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v39);
      *(_DWORD *)(v39 + 36) = 7;
      operator new();
    }
    uint64_t v40 = *(void *)(v39 + 24);
    if (*(_DWORD *)(v40 + 36) != 1)
    {
      CoreML::Specification::SequenceFeatureType::clear_Type(v40);
      *(_DWORD *)(v40 + 36) = 1;
      operator new();
    }
    if (*(_DWORD *)(v39 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v39);
      *(_DWORD *)(v39 + 36) = 7;
      operator new();
    }
    uint64_t v41 = *(void *)(*(void *)(v39 + 24) + 16);
    if (!v41) {
      operator new();
    }
    *(void *)(v41 + 16) = 0;
    if (*(_DWORD *)(v39 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v39);
      *(_DWORD *)(v39 + 36) = 7;
      operator new();
    }
    uint64_t v42 = *(void *)(*(void *)(v39 + 24) + 16);
    if (!v42) {
      operator new();
    }
    *(void *)(v42 + 24) = 10000;
    id v43 = [v122 tokenLocationsOutputFeatureName];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v43 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v8 + 40), &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  v44 = [v122 tokensOutputFeatureName];
  BOOL v45 = [v44 length] == 0;

  if (!v45)
  {
    id v46 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v19);
    id v47 = [v122 tokensOutputFeatureName];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v47 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v46 + 2, &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }

    std::string::basic_string[abi:ne180100]<0>(&__p, "Tokens");
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v46 + 3, &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
    uint64_t v48 = (uint64_t)v46[4];
    if (!v48) {
      operator new();
    }
    if (*(_DWORD *)(v48 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v48);
      *(_DWORD *)(v48 + 36) = 7;
      operator new();
    }
    uint64_t v49 = *(void *)(v48 + 24);
    if (*(_DWORD *)(v49 + 36) != 3)
    {
      CoreML::Specification::SequenceFeatureType::clear_Type(v49);
      *(_DWORD *)(v49 + 36) = 3;
      operator new();
    }
    if (*(_DWORD *)(v48 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v48);
      *(_DWORD *)(v48 + 36) = 7;
      operator new();
    }
    uint64_t v50 = *(void *)(*(void *)(v48 + 24) + 16);
    if (!v50) {
      operator new();
    }
    *(void *)(v50 + 16) = 0;
    if (*(_DWORD *)(v48 + 36) != 7)
    {
      CoreML::Specification::FeatureType::clear_Type(v48);
      *(_DWORD *)(v48 + 36) = 7;
      operator new();
    }
    uint64_t v51 = *(void *)(*(void *)(v48 + 24) + 16);
    if (!v51) {
      operator new();
    }
    *(void *)(v51 + 24) = 10000;
    id v52 = [v122 tokensOutputFeatureName];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v52 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v8 + 24), &__p);
    if (v130 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
  }
  v53 = [v122 tagNames];
  uint64_t v121 = [v53 count];

  if (v121)
  {
    for (uint64_t i = 0; i != v121; ++i)
    {
      if (*(_DWORD *)(v8 + 84) != 200)
      {
        *(_DWORD *)(v8 + 84) = 200;
        operator new();
      }
      v55 = *(CoreML::Specification::StringVector **)(v8 + 72);
      id v56 = [v122 tagNames];
      id v57 = [v56 objectAtIndexedSubscript:i];
      CoreML::Specification::StringVector::add_vector(v55, (const char *)[v57 UTF8String]);
    }
  }
  v58 = [v122 metadata];
  BOOL v59 = v58 == 0;

  if (!v59)
  {
    v60 = [v122 metadata];
    v61 = [v60 objectForKeyedSubscript:@"MLModelAuthorKey"];
    if (v61)
    {
      v62 = [v122 metadata];
      v63 = [v62 objectForKeyedSubscript:@"MLModelAuthorKey"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_125;
      }
      v60 = [v122 metadata];
      id v65 = [v60 objectForKeyedSubscript:@"MLModelAuthorKey"];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v65 UTF8String]);
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v120 + 8, &__p);
      if (v130 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
    }
LABEL_125:
    v66 = [v122 metadata];
    v67 = [v66 objectForKeyedSubscript:@"MLModelLicenseKey"];
    if (v67)
    {
      v68 = [v122 metadata];
      v69 = [v68 objectForKeyedSubscript:@"MLModelLicenseKey"];
      objc_opt_class();
      char v70 = objc_opt_isKindOfClass();

      if ((v70 & 1) == 0) {
        goto LABEL_131;
      }
      v66 = [v122 metadata];
      id v71 = [v66 objectForKeyedSubscript:@"MLModelLicenseKey"];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v71 UTF8String]);
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v120 + 9, &__p);
      if (v130 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
    }
LABEL_131:
    v72 = [v122 metadata];
    v73 = [v72 objectForKeyedSubscript:@"MLModelVersionStringKey"];
    if (v73)
    {
      v74 = [v122 metadata];
      v75 = [v74 objectForKeyedSubscript:@"MLModelVersionStringKey"];
      objc_opt_class();
      char v76 = objc_opt_isKindOfClass();

      if ((v76 & 1) == 0) {
        goto LABEL_137;
      }
      v72 = [v122 metadata];
      id v77 = [v72 objectForKeyedSubscript:@"MLModelVersionStringKey"];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v77 UTF8String]);
      google::protobuf::internal::ArenaStringPtr::SetNoArena(v120 + 7, &__p);
      if (v130 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
    }
LABEL_137:
    v78 = [v122 metadata];
    v79 = [v78 objectForKeyedSubscript:@"MLModelDescriptionKey"];
    if (v79)
    {
      v80 = [v122 metadata];
      v81 = [v80 objectForKeyedSubscript:@"MLModelDescriptionKey"];
      objc_opt_class();
      char v82 = objc_opt_isKindOfClass();

      if (v82)
      {
        v84 = [v122 metadata];
        v85 = [v84 objectForKeyedSubscript:@"MLModelDescriptionKey"];

        id v86 = v85;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v86 UTF8String]);
        *(void *)&double v83 = google::protobuf::internal::ArenaStringPtr::SetNoArena(v120 + 6, &__p).n128_u64[0];
        if (v130 < 0) {
          operator delete((void *)__p.n128_u64[0]);
        }
LABEL_143:
        objc_msgSend(v122, "metadata", v83);
        id v87 = (id)objc_claimAutoreleasedReturnValue();
        v88 = [v87 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
        if (v88)
        {
          v89 = [v122 metadata];
          v90 = [v89 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];
          objc_opt_class();
          char v91 = objc_opt_isKindOfClass();

          if ((v91 & 1) == 0) {
            goto LABEL_157;
          }
          v92 = [v122 metadata];
          v93 = [v92 objectForKeyedSubscript:@"MLModelCreatorDefinedKey"];

          long long v127 = 0u;
          long long v128 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          id v87 = v93;
          uint64_t v94 = [v87 countByEnumeratingWithState:&v125 objects:v136 count:16];
          if (v94)
          {
            uint64_t v95 = *(void *)v126;
            do
            {
              for (uint64_t j = 0; j != v94; ++j)
              {
                if (*(void *)v126 != v95) {
                  objc_enumerationMutation(v87);
                }
                v97 = *(void **)(*((void *)&v125 + 1) + 8 * j);
                v98 = [v87 objectForKeyedSubscript:v97];
                v99 = [v98 description];

                if (v99)
                {
                  uint64_t v100 = [v99 UTF8String];
                  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v97 UTF8String]);
                  v101 = google::protobuf::Map<std::string,std::string>::operator[]((uint64_t)(v120 + 3), (uint64_t)&__p);
                  MEMORY[0x19F3C1430](v101, v100);
                  if (v130 < 0) {
                    operator delete((void *)__p.n128_u64[0]);
                  }
                }
              }
              uint64_t v94 = [v87 countByEnumeratingWithState:&v125 objects:v136 count:16];
            }
            while (v94);
          }
        }
LABEL_157:
        if (v86) {
          goto LABEL_168;
        }
        goto LABEL_158;
      }
    }
    else
    {
    }
    id v86 = 0;
    goto LABEL_143;
  }
LABEL_158:
  v102 = [v122 language];
  BOOL v103 = v102 == 0;

  v104 = NSString;
  if (v103)
  {
    v107 = objc_msgSend(NSString, "stringWithFormat:", @"This model is a word tagger (version %lu) which tags words according to set {", objc_msgSend(v122, "revision"));
  }
  else
  {
    uint64_t v105 = [v122 revision];
    v106 = [v122 language];
    v107 = [v104 stringWithFormat:@"This model is a word tagger (version %lu) which tags %@ words according to set {", v105, v106, v118];
  }
  if (v121)
  {
    for (uint64_t k = 0; k != v121; ++k)
    {
      v109 = [v122 tagNames];
      v110 = [v109 objectAtIndexedSubscript:k];
      v111 = [v107 stringByAppendingFormat:@"%@,", v110];

      v107 = v111;
    }
  }
  else
  {
    v111 = v107;
  }
  v112 = objc_msgSend(v111, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v111, "length") - 1, 1, @"}");

  id v86 = v112;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v86 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(v120 + 6, &__p);
  if (v130 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
LABEL_168:
  v113 = v132;
  id v114 = v118;
  std::string::basic_string[abi:ne180100]<0>(&v123, (char *)[v114 fileSystemRepresentation]);
  CoreML::Model::Model((CoreML::Model *)v134, v113);
  CoreML::Model::save((uint64_t)&__p, (uint64_t)v134);
  v134[0] = &unk_1EF0DB228;
  if (v135) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v135);
  }
  if (v124 < 0) {
    operator delete(v123);
  }
  unsigned __int32 v115 = __p.n128_u32[0] & 0xFFFFFFEF;
  if (a5 && v115)
  {
    v116 = &__p.n128_u64[1];
    if (v131 < 0) {
      v116 = (unint64_t *)__p.n128_u64[1];
    }
    *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"Unable to save model to %@. %s", v114, v116];
  }
  if (v131 < 0) {
    operator delete((void *)__p.n128_u64[1]);
  }

  if (v133) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v133);
  }

  return v115 == 0;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 2001)
  {
    id v8 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
    if (v8)
    {
      id v9 = +[_MLNLPFrameworkHandle sharedHandle];
      BOOL v10 = (CoreML::Specification::CoreMLModels::protobuf_WordTagger_2eproto *)[v9 isValid];
      if (v10)
      {
        if (*(_DWORD *)(*(void *)a3 + 44) == 2001)
        {
          id v11 = *(uint64_t **)(*(void *)a3 + 32);
        }
        else
        {
          CoreML::Specification::CoreMLModels::protobuf_WordTagger_2eproto::InitDefaults(v10);
          id v11 = &CoreML::Specification::CoreMLModels::_WordTagger_default_instance_;
        }
        uint64_t v50 = &unk_1EF0CEEE8;
        v51[0] = 0;
        int v55 = 0;
        uint64_t v13 = v11[1];
        if (v13) {
          google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(v51, v13 & 0xFFFFFFFFFFFFFFFELL);
        }
        v51[1] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
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
        v51[2] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
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
        v51[3] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
        uint64_t v18 = v11[4];
        if (*(char *)(v18 + 23) < 0) {
          uint64_t v19 = *(void *)(v18 + 8);
        }
        else {
          uint64_t v19 = *(unsigned __int8 *)(v18 + 23);
        }
        if ((long long *)v18 != &google::protobuf::internal::fixed_address_empty_string && v19) {
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
        }
        v51[4] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
        uint64_t v20 = v11[5];
        if (*(char *)(v20 + 23) < 0) {
          uint64_t v21 = *(void *)(v20 + 8);
        }
        else {
          uint64_t v21 = *(unsigned __int8 *)(v20 + 23);
        }
        if ((long long *)v20 != &google::protobuf::internal::fixed_address_empty_string && v21) {
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
        }
        v51[5] = (unint64_t)&google::protobuf::internal::fixed_address_empty_string;
        uint64_t v22 = v11[6];
        if (*(char *)(v22 + 23) < 0) {
          uint64_t v23 = *(void *)(v22 + 8);
        }
        else {
          uint64_t v23 = *(unsigned __int8 *)(v22 + 23);
        }
        if ((long long *)v22 != &google::protobuf::internal::fixed_address_empty_string && v23) {
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
        }
        id v52 = &google::protobuf::internal::fixed_address_empty_string;
        uint64_t v24 = v11[7];
        if (*(char *)(v24 + 23) < 0) {
          uint64_t v25 = *(void *)(v24 + 8);
        }
        else {
          uint64_t v25 = *(unsigned __int8 *)(v24 + 23);
        }
        if ((long long *)v24 != &google::protobuf::internal::fixed_address_empty_string && v25) {
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
        }
        unsigned int v53 = *((_DWORD *)v11 + 16);
        int v56 = 0;
        if (*((_DWORD *)v11 + 21) == 200)
        {
          int v56 = 200;
          operator new();
        }
        uint64_t v26 = objc_alloc_init(MLAppleWordTaggerParameters);
        [(MLAppleWordTaggerParameters *)v26 setRevision:v53];
        BOOL v27 = objc_msgSend(NSString, "stringWithUTF8String:");
        [(MLAppleWordTaggerParameters *)v26 setLanguage:v27];

        v28 = [v8 inputDescriptionsByName];
        id v29 = [v28 allKeys];
        uint64_t v30 = [v29 objectAtIndexedSubscript:0];
        [(MLAppleWordTaggerParameters *)v26 setInputFeatureName:v30];

        uint64_t v31 = objc_msgSend(NSString, "stringWithUTF8String:");
        [(MLAppleWordTaggerParameters *)v26 setTokensOutputFeatureName:v31];

        uint64_t v32 = objc_msgSend(NSString, "stringWithUTF8String:");
        [(MLAppleWordTaggerParameters *)v26 setTokenTagsOutputFeatureName:v32];

        uint64_t v33 = objc_msgSend(NSString, "stringWithUTF8String:");
        [(MLAppleWordTaggerParameters *)v26 setTokenLocationsOutputFeatureName:v33];

        id v34 = objc_msgSend(NSString, "stringWithUTF8String:");
        [(MLAppleWordTaggerParameters *)v26 setTokenLengthsOutputFeatureName:v34];

        if (v56 == 200)
        {
          uint64_t v48 = v9;
          uint64_t v35 = v54;
          uint64_t v36 = *(unsigned int *)(v54 + 24);
          id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if ((int)v36 >= 1)
          {
            uint64_t v38 = 0;
            uint64_t v39 = 8 * v36;
            do
            {
              uint64_t v40 = *(uint64_t **)(*(void *)(v35 + 32) + v38 + 8);
              if (*((char *)v40 + 23) < 0) {
                uint64_t v40 = (uint64_t *)*v40;
              }
              uint64_t v41 = [NSString stringWithUTF8String:v40];
              [v37 addObject:v41];

              v38 += 8;
            }
            while (v39 != v38);
          }
          id v9 = v48;
          if (v37)
          {
            uint64_t v42 = (void *)[v37 copy];
            [(MLAppleWordTaggerParameters *)v26 setTagNames:v42];

            [v8 setClassLabels:v37];
          }
        }
        else
        {
          id v37 = 0;
        }
        if (*((char *)v52 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v49, *(const std::string::value_type **)v52, *((void *)v52 + 1));
        }
        else
        {
          long long v43 = *v52;
          v49.__r_.__value_.__r.__words[2] = *((void *)v52 + 2);
          *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v43;
        }
        if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v44 = &v49;
        }
        else {
          v44 = (std::string *)v49.__r_.__value_.__r.__words[0];
        }
        if ((v49.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v49.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v49.__r_.__value_.__l.__size_;
        }
        id v46 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v44 length:size];
        [(MLAppleWordTaggerParameters *)v26 setModelParameterData:v46];

        id v12 = [[MLAppleWordTagger alloc] initWithParameters:v26 modelDescription:v8 nlpHandle:v9 configuration:v7 error:a5];
        if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v49.__r_.__value_.__l.__data_);
        }

        CoreML::Specification::CoreMLModels::WordTagger::~WordTagger((CoreML::Specification::CoreMLModels::WordTagger *)&v50);
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
      +[MLModelErrorUtils IOErrorWithFormat:@"Model description is invalid"];
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
    +[MLModelErrorUtils IOErrorWithFormat:@"Model type is not a word tagger"];
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