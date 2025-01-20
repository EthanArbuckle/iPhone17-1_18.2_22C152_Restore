@interface CDMCATIChildService
- (BOOL)checkFBBloomFilter:(id)a3 contains:(id)a4;
- (BOOL)getBloomFilterAt:(id)a3;
- (BOOL)getFlatbuffersBFAt:(id)a3;
- (BOOL)getInvocationOverridesEnabled;
- (BOOL)isMultiTurnEnabled;
- (BOOL)shouldSuppressCATIInvocationDueTo:(id)a3;
- (CDMCATIChildService)initWithAssetBundle:(id)a3;
- (id).cxx_construct;
- (id)buildCrisisSupportUserParse:(id)a3 confidenceScore:(float)a4;
- (id)buildLegacyBloomFilterAndExactMatchDictForInvocation:(id)a3;
- (id)buildSocialConversationUserParse:(id)a3 confidenceScore:(float)a4;
- (id)buildUserParse:(id)a3 confidenceScore:(float)a4;
- (id)checkExactMatch:(id)a3;
- (id)checkExactMatchForUtterances:(id)a3;
- (id)checkExactMatchFromPossibleGuids:(id)a3 forUtterance:(id)a4 modelType:(unint64_t)a5;
- (id)createUserParse:(float)a3;
- (id)getBloomFilter;
- (id)getIntentLookup;
- (id)getInvocationInferenceResults:()vector<float;
- (id)getManifest;
- (id)getManifestFromPath:(id)a3;
- (id)getMultiturnEnabledExactMatchIntents;
- (id)getMultiturnInferenceResults:()vector<float;
- (id)getMultiturnIntentsFromSystemGaveOptions:(id)a3;
- (id)getMultiturnIntentsFromSystemInformed:(id)a3;
- (id)getNewBloomFilter;
- (id)getPosOverridesDirectoryPath;
- (id)getPositiveOverrideDictionary;
- (id)getProductAreaName;
- (id)getUsoEntity;
- (id)handle:(id)a3 assetVersion:(int64_t)a4;
- (id)runCATIModelInferenceWithWeights:(id)a3;
- (id)setup:(id)a3 assetVersion:(int64_t)a4;
- (vector<float,)getCATIEmbeddingTensor:(CDMCATIChildService *)self;
- (void)buildMultiturnFeatures:(id)a3;
- (void)constructWeightMatrixForInference:(id)a3 numModels:(unint64_t)a4 guids:(id)a5 modelType:(unint64_t)a6;
- (void)setConfidenceThreshold:(float)a3;
- (void)setInvocationWeightsEnabled:(BOOL)a3;
- (void)setMultiturnConfidenceThreshold:(float)a3;
- (void)setMultiturnEnabled:(BOOL)a3;
- (void)setMultiturnWeightsEnabled:(BOOL)a3;
- (void)setPositiveOverridesDictionary:(id)a3;
- (void)setUsoEdge:(id)a3;
- (void)setUsoEntity:(id)a3;
- (void)setUsoVerb:(id)a3;
@end

@implementation CDMCATIChildService

- (id).cxx_construct
{
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usoEdge, 0);
  objc_storeStrong((id *)&self->_usoVerb, 0);
  objc_storeStrong((id *)&self->_usoEntity, 0);
  objc_storeStrong((id *)&self->_multiturnGUIDs, 0);
  objc_storeStrong((id *)&self->_invocationGUIDs, 0);
  value = self->_multiturnWeightPtr.__ptr_.__value_;
  self->_multiturnWeightPtr.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x22A6568B0](value, 0x1000C8052888210);
  }
  v4 = self->_weightPtr.__ptr_.__value_;
  self->_weightPtr.__ptr_.__value_ = 0;
  if (v4) {
    MEMORY[0x22A6568B0](v4, 0x1000C8052888210);
  }
  objc_storeStrong((id *)&self->_multiturnEnabledExactMatchIntents, 0);
  objc_storeStrong((id *)&self->_positiveOverridesDictionary, 0);
  objc_storeStrong((id *)&self->_positiveOverridesInvocationIndividualBloomFilters, 0);
  objc_storeStrong((id *)&self->_fbBloomFilters, 0);
  objc_storeStrong((id *)&self->_positiveOverridesInvocationBloomFilter, 0);
  objc_storeStrong((id *)&self->_positiveOverridesInvocationBloomFilterLegacy, 0);
  objc_storeStrong((id *)&self->_catiManifest, 0);
  objc_storeStrong((id *)&self->_weightsDirectoryPath, 0);
  objc_storeStrong((id *)&self->_posOverridesDirectoryPath, 0);
  objc_storeStrong((id *)&self->_manifestPath, 0);
  objc_storeStrong((id *)&self->_modelBundle, 0);
  objc_storeStrong((id *)&self->_catiAssetBundle, 0);
}

- (void)setInvocationWeightsEnabled:(BOOL)a3
{
  self->_invocationWeightsEnabled = a3;
}

- (void)setMultiturnConfidenceThreshold:(float)a3
{
  self->_multiturnConfidenceThreshold = a3;
}

- (void)setMultiturnWeightsEnabled:(BOOL)a3
{
  self->_multiturnWeightsEnabled = a3;
}

- (void)setMultiturnEnabled:(BOOL)a3
{
  self->_multiturnEnabled = a3;
}

- (void)setConfidenceThreshold:(float)a3
{
  self->_confidenceThreshold = a3;
}

- (void)setUsoEdge:(id)a3
{
}

- (void)setUsoVerb:(id)a3
{
}

- (void)setUsoEntity:(id)a3
{
}

- (BOOL)getInvocationOverridesEnabled
{
  return self->_invocationOverridesEnabled;
}

- (id)getNewBloomFilter
{
  return self->_positiveOverridesInvocationBloomFilter;
}

- (id)getBloomFilter
{
  return self->_positiveOverridesInvocationBloomFilterLegacy;
}

- (void)setPositiveOverridesDictionary:(id)a3
{
}

- (id)getMultiturnEnabledExactMatchIntents
{
  return self->_multiturnEnabledExactMatchIntents;
}

- (id)getUsoEntity
{
  return self->_usoEntity;
}

- (id)getPositiveOverrideDictionary
{
  return self->_positiveOverridesDictionary;
}

- (id)getIntentLookup
{
  v2 = [(CDMCATIChildService *)self getManifest];
  v3 = [v2 intentLookup];

  return v3;
}

- (id)getPosOverridesDirectoryPath
{
  return self->_posOverridesDirectoryPath;
}

- (id)getManifest
{
  return self->_catiManifest;
}

- (id)getManifestFromPath:(id)a3
{
  id v3 = a3;
  v4 = [[CDMCATIManifest alloc] initWithPath:v3];

  return v4;
}

- (BOOL)shouldSuppressCATIInvocationDueTo:(id)a3
{
  id v3 = a3;
  if (![v3 hasTurnContext]) {
    goto LABEL_7;
  }
  v4 = [v3 turnContext];
  int v5 = [v4 hasLegacyNlContext];

  if (!v5) {
    goto LABEL_7;
  }
  v6 = [v3 turnContext];
  v7 = [v6 legacyNlContext];
  if (![v7 dictationPrompt])
  {
    v8 = [v3 turnContext];
    v9 = [v8 legacyNlContext];
    char v10 = [v9 strictPrompt];

    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }

LABEL_6:
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

- (id)createUserParse:(float)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F71D88]);
  v6 = (void *)MEMORY[0x263F71F48];
  id v7 = objc_alloc_init(MEMORY[0x263F08C38]);
  v8 = [v6 convertFromUUID:v7];
  [v5 setIdA:v8];

  [v5 setProbability:a3];
  [v5 setParserId:@"com.apple.siri.cati"];
  id v9 = objc_alloc_init(MEMORY[0x263F71D00]);
  [v9 setAlgorithm:self->_algoType];
  [v9 setParserId:4];
  [v5 setParser:v9];

  return v5;
}

- (id)buildCrisisSupportUserParse:(id)a3 confidenceScore:(float)a4
{
  id v6 = a3;
  id v7 = [(CDMCATIChildService *)self getIntentLookup];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    id v9 = [v8 intentName];
    char v10 = [v8 ensemble];
    BOOL v11 = +[CDMCATIUSOParseHelpers buildCrisisSupportParseWithAppBundleId:guid:intentName:ensembleType:addEntitySpans:](_TtC13CDMFoundation22CDMCATIUSOParseHelpers, "buildCrisisSupportParseWithAppBundleId:guid:intentName:ensembleType:addEntitySpans:", @"com.apple.siri.cati", v6, v9, v10, +[CDMFeatureFlags isUsoEntitySpanEnabled]);

    id v12 = objc_alloc_init(MEMORY[0x263F71D90]);
    [v12 setTask:v11];
    id v13 = objc_alloc_init(MEMORY[0x263F71D80]);
    [v13 setUserStatedTask:v12];
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v13, 0);
    *(float *)&double v15 = a4;
    v16 = [(CDMCATIChildService *)self createUserParse:v15];
    [v16 setUserDialogActs:v14];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)buildSocialConversationUserParse:(id)a3 confidenceScore:(float)a4
{
  id v6 = a3;
  id v7 = [(CDMCATIChildService *)self getIntentLookup];
  v8 = [v7 objectForKey:v6];

  if (v8)
  {
    id v9 = [v8 intentName];
    char v10 = [v8 ensemble];
    BOOL v11 = +[CDMCATIUSOParseHelpers buildSocialConversationParseWithAppBundleId:guid:intentName:ensembleType:addEntitySpans:](_TtC13CDMFoundation22CDMCATIUSOParseHelpers, "buildSocialConversationParseWithAppBundleId:guid:intentName:ensembleType:addEntitySpans:", @"com.apple.siri.cati", v6, v9, v10, +[CDMFeatureFlags isUsoEntitySpanEnabled]);

    id v12 = objc_alloc_init(MEMORY[0x263F71D90]);
    [v12 setTask:v11];
    id v13 = objc_alloc_init(MEMORY[0x263F71D80]);
    [v13 setUserStatedTask:v12];
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v13, 0);
    *(float *)&double v15 = a4;
    v16 = [(CDMCATIChildService *)self createUserParse:v15];
    [v16 setUserDialogActs:v14];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)buildUserParse:(id)a3 confidenceScore:(float)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  usoEntity = self->_usoEntity;
  if (usoEntity && [(NSString *)usoEntity length])
  {
    usoVerb = self->_usoVerb;
    if (usoVerb && [(NSString *)usoVerb length])
    {
      usoEdge = self->_usoEdge;
      if (usoEdge)
      {
        char v10 = [(NSString *)usoEdge length];
        if (v10)
        {
          uint64_t v11 = *(void *)(siri::ontology::getSharedUsoVocabManager(v10) + 8);
          if (v11) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
          }
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[(NSString *)self->_usoEntity UTF8String]);
          siri::ontology::UsoVocabManager::createCustomEntityName();
          if (v47 < 0) {
            operator delete(__p);
          }
          std::string::basic_string[abi:ne180100]<0>(&v44, (char *)[(NSString *)self->_usoVerb UTF8String]);
          siri::ontology::UsoVocabManager::createCustomVerbName();
          if (v45 < 0) {
            operator delete(v44);
          }
          std::string::basic_string[abi:ne180100]<0>(&v42, (char *)[(NSString *)self->_usoEdge UTF8String]);
          siri::ontology::UsoVocabManager::createCustomEdgeName();
          if (v43 < 0) {
            operator delete(v42);
          }
          buf.__r_.__value_.__r.__words[0] = 0;
          LODWORD(buf.__r_.__value_.__r.__words[1]) = 0;
          MEMORY[0x22A656480](v41, &buf);
          TaskNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createTaskNode();
          siri::ontology::oname::graph::ontology_init::Argument_task(TaskNode);
          siri::ontology::UsoGraphNode::setSuccessor();
          EntityNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
          siri::ontology::oname::graph::ontology_init::Argument_target(EntityNode);
          siri::ontology::UsoGraphNode::setSuccessor();
          memset(&v40, 0, sizeof(v40));
          v14 = [(CDMCATIChildService *)self getIntentLookup];
          double v15 = [v14 objectForKey:v6];

          if (v15)
          {
            v16 = [v15 intentName];
            BOOL v17 = v16 == 0;

            if (!v17)
            {
              id v18 = [v15 intentName];
              MEMORY[0x22A656790](&v40, [v18 UTF8String]);

              if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(&buf, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
              }
              else {
                std::string buf = v40;
              }
              char v49 = 1;
              siri::ontology::UsoGraph::createStringNode();
              if (v49)
              {
                if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(buf.__r_.__value_.__l.__data_);
                }
              }
              siri::ontology::UsoGraphNode::setSuccessor();
              std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>();
            }
          }
          std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[&stru_26DA24FF0 UTF8String]);
          char v49 = 1;
          siri::ontology::UsoGraph::createStringNode();
          if (v49 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf.__r_.__value_.__l.__data_);
          }
          siri::ontology::UsoGraphNode::setSuccessor();
          v21 = [(CDMCATIChildService *)self getManifest];
          char v22 = [v21 isPreGuidVersion];

          if (v22)
          {
            v23 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[CDMCATIChildService buildUserParse:confidenceScore:]";
              _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s No intent GUIDs available in assets to attach to CATIResponse.", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            std::string::basic_string[abi:ne180100]<0>(v36, (char *)[v6 UTF8String]);
            std::string::basic_string[abi:ne180100]<0>(&v33, (char *)[@"com.apple.siri.cati" UTF8String]);
            std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[(id)*MEMORY[0x263F73830] UTF8String]);
            char v49 = 1;
            char v38 = 0;
            char v39 = 0;
            siri::ontology::UsoEntityNode::addIdentifier();
            if (v49 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
            if (v35 < 0) {
              operator delete(v33);
            }
            if (v37 < 0) {
              operator delete(v36[0]);
            }
          }
          if (v15)
          {
            v25 = [v15 intentName];
            BOOL v26 = v25 == 0;

            if (!v26)
            {
              id v27 = [v15 intentName];
              MEMORY[0x22A656790](&v40, [v27 UTF8String]);

              std::string::basic_string[abi:ne180100]<0>(v36, (char *)[@"com.apple.siri.cati" UTF8String]);
              std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[(id)*MEMORY[0x263F73850] UTF8String]);
              char v49 = 1;
              LOBYTE(v33) = 0;
              char v34 = 0;
              siri::ontology::UsoEntityNode::addIdentifier();
              if (v49 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(buf.__r_.__value_.__l.__data_);
              }
              if (v37 < 0) {
                operator delete(v36[0]);
              }
              if (+[CDMFeatureFlags isUsoEntitySpanEnabled]) {
                std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>();
              }
            }
            v28 = [v15 ensemble];
            BOOL v29 = v28 == 0;

            if (!v29)
            {
              id v30 = [v15 ensemble];
              std::string::basic_string[abi:ne180100]<0>(v36, (char *)[v30 UTF8String]);
              std::string::basic_string[abi:ne180100]<0>(&v33, (char *)[@"com.apple.siri.cati" UTF8String]);
              std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[(id)*MEMORY[0x263F73828] UTF8String]);
              char v49 = 1;
              char v38 = 0;
              char v39 = 0;
              siri::ontology::UsoEntityNode::addIdentifier();
              if (v49 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(buf.__r_.__value_.__l.__data_);
              }
              if (v35 < 0) {
                operator delete(v33);
              }
              if (v37 < 0) {
                operator delete(v36[0]);
              }

              if (+[CDMFeatureFlags isUsoEntitySpanEnabled]) {
                std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>();
              }
            }
          }
          *(float *)&double v24 = a4;
          v31 = [NSNumber numberWithFloat:v24];
          id v32 = [v31 stringValue];
          std::string::basic_string[abi:ne180100]<0>(v36, (char *)[v32 UTF8String]);

          std::string::basic_string[abi:ne180100]<0>(&v33, (char *)[@"com.apple.siri.cati" UTF8String]);
          buf.__r_.__value_.__s.__data_[0] = 0;
          char v49 = 0;
          char v38 = 0;
          char v39 = 0;
          siri::ontology::UsoEntityNode::addIdentifier();
          if (v49 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf.__r_.__value_.__l.__data_);
          }
          if (v35 < 0) {
            operator delete(v33);
          }
          if (+[CDMFeatureFlags isUsoEntitySpanEnabled]) {
            std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>();
          }
          sirinluexternal::UsoGraph::UsoGraph((sirinluexternal::UsoGraph *)&buf);
          siri::ontology::UsoGraphProtoWriter::toProtobuf();
          operator new();
        }
      }
      v19 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[CDMCATIChildService buildUserParse:confidenceScore:]";
        _os_log_error_impl(&dword_2263A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI did not have a valid usoEdge. Please check the manifest to ensure that this value exists", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      v19 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[CDMCATIChildService buildUserParse:confidenceScore:]";
        _os_log_error_impl(&dword_2263A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI did not have a valid usoVerb. Please check the manifest to ensure that this value exists", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[CDMCATIChildService buildUserParse:confidenceScore:]";
      _os_log_error_impl(&dword_2263A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI did not have a valid usoEntity. Please check the manifest to ensure that this value exists", (uint8_t *)&buf, 0xCu);
    }
  }

  return 0;
}

- (id)getMultiturnInferenceResults:()vector<float
{
  id v5 = objc_alloc_init(CATILogisticsRegressionModel);
  id v9 = 0;
  uint64_t v10 = 0;
  __p = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, a3->var0, (uint64_t)a3->var1, a3->var1 - a3->var0);
  id v6 = [(CATILogisticsRegressionModel *)v5 getBestIntent:&__p numberOfModels:self->_numMultiturnModels weightMatrix:&self->_multiturnWeightPtr guids:self->_multiturnGUIDs usoEdgeKey:self->_usoEdge];
  if (__p)
  {
    id v9 = __p;
    operator delete(__p);
  }

  return v6;
}

- (id)getInvocationInferenceResults:()vector<float
{
  id v5 = objc_alloc_init(CATILogisticsRegressionModel);
  id v9 = 0;
  uint64_t v10 = 0;
  __p = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, a3->var0, (uint64_t)a3->var1, a3->var1 - a3->var0);
  id v6 = [(CATILogisticsRegressionModel *)v5 getBestIntent:&__p numberOfModels:self->_numModels weightMatrix:&self->_weightPtr guids:self->_invocationGUIDs usoEdgeKey:self->_usoEdge];
  if (__p)
  {
    id v9 = __p;
    operator delete(__p);
  }

  return v6;
}

- (vector<float,)getCATIEmbeddingTensor:(CDMCATIChildService *)self
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  unint64_t embeddingDimensionCATI = self->_embeddingDimensionCATI;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (embeddingDimensionCATI)
  {
    std::vector<float>::__vallocate[abi:ne180100](retstr, embeddingDimensionCATI);
    var1 = retstr->var1;
    bzero(var1, 4 * embeddingDimensionCATI);
    retstr->var1 = &var1[embeddingDimensionCATI];
  }
  if ([v6 hasNumToken])
  {
    unint64_t v9 = [v6 numToken];
    int64_t v10 = self->_embeddingDimensionCATI;
    if (v10 >= 1)
    {
      unint64_t v11 = v9;
      int64_t v12 = 0;
      float v13 = (float)v9;
      var0 = retstr->var0;
      do
      {
        if (v11)
        {
          uint64_t v15 = 0;
          float v16 = 0.0;
          do
          {
            uint64_t v17 = [v6 values];
            int64_t v10 = self->_embeddingDimensionCATI;
            float v16 = v16 + *(float *)(v17 + 4 * (v12 + v10 * v15++));
          }
          while (v11 != v15);
        }
        else
        {
          float v16 = 0.0;
        }
        var0[v12++] = v16 / v13;
      }
      while (v10 > v12);
    }
  }
  else
  {
    id v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315138;
      v21 = "-[CDMCATIChildService getCATIEmbeddingTensor:]";
      _os_log_error_impl(&dword_2263A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: NLv4EmbeddingTensor has numToken with a value of zero, returning empty CATI embeddingTensor.", (uint8_t *)&v20, 0xCu);
    }
  }
  return result;
}

- (id)runCATIModelInferenceWithWeights:(id)a3
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  [(CDMCATIChildService *)self getCATIEmbeddingTensor:a3];
  if (!self->_multiturnEnabled || !self->_multiturnWeightsEnabled)
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v73 = 0;
    v74 = 0;
    uint64_t v75 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v73, v82, (uint64_t)v83, (v83 - (unsigned char *)v82) >> 2);
    id v4 = [(CDMCATIChildService *)self getInvocationInferenceResults:&v73];

    if (v73)
    {
      v74 = v73;
      operator delete(v73);
    }
    float v16 = [v4 valueForKey:@"confidence_score"];
    [v16 floatValue];
    float v18 = v17;

    if (v18 > self->_confidenceThreshold)
    {
      v19 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(float *)&double v20 = v18;
        v21 = [NSNumber numberWithFloat:v20];
        uint64_t v22 = [v21 stringValue];
        *(float *)&double v23 = self->_confidenceThreshold;
        double v24 = [NSNumber numberWithFloat:v23];
        v25 = [v24 stringValue];
        *(_DWORD *)std::string buf = 136315650;
        v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
        __int16 v86 = 2112;
        v87 = v22;
        __int16 v88 = 2112;
        v89 = v25;
        _os_log_impl(&dword_2263A0000, v19, OS_LOG_TYPE_INFO, "%s Invocation inference score is over the threshold: %@ > %@.", buf, 0x20u);
      }
      goto LABEL_15;
    }
    id v27 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(float *)&double v28 = v18;
      BOOL v29 = [NSNumber numberWithFloat:v28];
      id v30 = [v29 stringValue];
      *(float *)&double v31 = self->_confidenceThreshold;
      id v32 = [NSNumber numberWithFloat:v31];
      v33 = [v32 stringValue];
      *(_DWORD *)std::string buf = 136315650;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      __int16 v86 = 2112;
      v87 = v30;
      __int16 v88 = 2112;
      v89 = v33;
      _os_log_impl(&dword_2263A0000, v27, OS_LOG_TYPE_INFO, "%s Invocation inference score is under the threshold: %@ < %@.", buf, 0x20u);
    }
    goto LABEL_19;
  }
  __p = 0;
  v80 = 0;
  uint64_t v81 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v82, (uint64_t)v83, (v83 - (unsigned char *)v82) >> 2);
  id v4 = [(CDMCATIChildService *)self getMultiturnInferenceResults:&__p];
  if (__p)
  {
    v80 = __p;
    operator delete(__p);
  }
  id v5 = [v4 valueForKey:@"confidence_score"];
  [v5 floatValue];
  float v7 = v6;

  if (v7 > self->_multiturnConfidenceThreshold)
  {
    v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(float *)&double v9 = v7;
      int64_t v10 = [NSNumber numberWithFloat:v9];
      unint64_t v11 = [v10 stringValue];
      *(float *)&double v12 = self->_multiturnConfidenceThreshold;
      float v13 = [NSNumber numberWithFloat:v12];
      v14 = [v13 stringValue];
      *(_DWORD *)std::string buf = 136315650;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      __int16 v86 = 2112;
      v87 = v11;
      __int16 v88 = 2112;
      v89 = v14;
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s Multiturn inference score is over the threshold: %@ > %@.", buf, 0x20u);
    }
LABEL_15:
    id v4 = v4;
    id v26 = v4;
    goto LABEL_34;
  }
  if (!self->_invocationWeightsEnabled)
  {
    uint64_t v50 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(float *)&double v51 = v7;
      v52 = [NSNumber numberWithFloat:v51];
      v53 = [v52 stringValue];
      *(float *)&double v54 = self->_multiturnConfidenceThreshold;
      v55 = [NSNumber numberWithFloat:v54];
      v56 = [v55 stringValue];
      *(_DWORD *)std::string buf = 136315650;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      __int16 v86 = 2112;
      v87 = v53;
      __int16 v88 = 2112;
      v89 = v56;
      _os_log_impl(&dword_2263A0000, v50, OS_LOG_TYPE_INFO, "%s CATI multiturn inference score is under the threshold: %@ < %@. Inference for invocation is not enabled.", buf, 0x20u);
    }
LABEL_19:
    id v26 = 0;
    goto LABEL_34;
  }
  id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v76 = 0;
  v77 = 0;
  uint64_t v78 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v76, v82, (uint64_t)v83, (v83 - (unsigned char *)v82) >> 2);
  char v35 = [(CDMCATIChildService *)self getInvocationInferenceResults:&v76];

  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  v36 = [v35 valueForKey:@"confidence_score"];
  [v36 floatValue];
  float v38 = v37;

  if (v38 <= self->_confidenceThreshold)
  {
    v57 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(float *)&double v58 = v7;
      v70 = [NSNumber numberWithFloat:v58];
      v72 = [v70 stringValue];
      *(float *)&double v59 = self->_multiturnConfidenceThreshold;
      v60 = [NSNumber numberWithFloat:v59];
      v61 = [v60 stringValue];
      *(float *)&double v62 = v38;
      v63 = [NSNumber numberWithFloat:v62];
      v64 = [v63 stringValue];
      *(float *)&double v65 = self->_confidenceThreshold;
      v66 = [NSNumber numberWithFloat:v65];
      v67 = [v66 stringValue];
      *(_DWORD *)std::string buf = 136316162;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      __int16 v86 = 2112;
      v87 = v72;
      __int16 v88 = 2112;
      v89 = v61;
      __int16 v90 = 2112;
      v91 = v64;
      __int16 v92 = 2112;
      v93 = v67;
      _os_log_impl(&dword_2263A0000, v57, OS_LOG_TYPE_INFO, "%s Multiturn inference score is under the threshold: %@ < %@. CATI invocation inference score is also under the threshold: %@ < %@.", buf, 0x34u);
    }
    id v26 = 0;
  }
  else
  {
    char v39 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(float *)&double v40 = v7;
      v69 = [NSNumber numberWithFloat:v40];
      v71 = [v69 stringValue];
      *(float *)&double v41 = self->_multiturnConfidenceThreshold;
      v42 = [NSNumber numberWithFloat:v41];
      char v43 = [v42 stringValue];
      *(float *)&double v44 = v38;
      char v45 = [NSNumber numberWithFloat:v44];
      v46 = [v45 stringValue];
      *(float *)&double v47 = self->_confidenceThreshold;
      v48 = [NSNumber numberWithFloat:v47];
      char v49 = [v48 stringValue];
      *(_DWORD *)std::string buf = 136316162;
      v85 = "-[CDMCATIChildService runCATIModelInferenceWithWeights:]";
      __int16 v86 = 2112;
      v87 = v71;
      __int16 v88 = 2112;
      v89 = v43;
      __int16 v90 = 2112;
      v91 = v46;
      __int16 v92 = 2112;
      v93 = v49;
      _os_log_impl(&dword_2263A0000, v39, OS_LOG_TYPE_INFO, "%s Multiturn inference score is under the threshold: %@ < %@. CATI invocation inference score is over the threshold: %@ > %@.", buf, 0x34u);
    }
    id v26 = v35;
  }

LABEL_34:
  if (v82)
  {
    v83 = v82;
    operator delete(v82);
  }
  return v26;
}

- (id)checkExactMatchFromPossibleGuids:(id)a3 forUtterance:(id)a4 modelType:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v26 = a4;
  if (![v7 count])
  {
    id v25 = 0;
    goto LABEL_22;
  }
  v8 = [(CDMCATIChildService *)self getManifest];
  double v9 = [v8 getPositiveOverrideGuidsForModelType:a5];

  unint64_t v10 = 0;
  *(void *)&long long v11 = 136315650;
  long long v24 = v11;
  while (1)
  {
    if (objc_msgSend(v7, "count", v24) <= v10)
    {
      id v25 = 0;
      goto LABEL_21;
    }
    double v12 = [v7 objectAtIndexedSubscript:v10];
    if ([v9 containsObject:v12]) {
      break;
    }
LABEL_17:

    ++v10;
  }
  float v13 = [v12 stringByAppendingString:@".json"];
  v14 = [(CDMCATIChildService *)self getPosOverridesDirectoryPath];
  id v15 = [v14 stringByAppendingPathComponent:v13];

  id v29 = 0;
  float v16 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v15 options:0 error:&v29];
  id v17 = v29;
  id v18 = v17;
  if (!v16 || v17)
  {
    v19 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = v24;
      double v31 = "-[CDMCATIChildService checkExactMatchFromPossibleGuids:forUtterance:modelType:]";
      __int16 v32 = 2112;
      v33 = v15;
      __int16 v34 = 2112;
      id v35 = v18;
      _os_log_error_impl(&dword_2263A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to find or process file (%@) due to %@", buf, 0x20u);
    }
  }
  else
  {
    id v28 = 0;
    v19 = [MEMORY[0x263F08900] JSONObjectWithData:v16 options:0 error:&v28];
    id v18 = v28;
    if (v19)
    {
      double v20 = [v19 valueForKey:v26];
      if (v20)
      {
        id v25 = [v19 valueForKey:v26];

        char v21 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v22 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = v24;
        double v31 = "-[CDMCATIChildService checkExactMatchFromPossibleGuids:forUtterance:modelType:]";
        __int16 v32 = 2112;
        v33 = v15;
        __int16 v34 = 2112;
        id v35 = v18;
        _os_log_error_impl(&dword_2263A0000, v22, OS_LOG_TYPE_ERROR, "%s [ERR]: Error parsing JSON in file %@: %@", buf, 0x20u);
      }
    }
  }
  char v21 = 1;
LABEL_16:

  if (v21) {
    goto LABEL_17;
  }

LABEL_21:
LABEL_22:

  return v25;
}

- (id)checkExactMatch:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 dataUsingEncoding:4];
  if (!self->_multiturnEnabled
    || ([(CDMCATIChildService *)self checkExactMatchFromPossibleGuids:self->_multiturnEnabledExactMatchIntents forUtterance:v4 modelType:1], (float v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (self->_isLegacyCATIOverrideSystem
      && [(CATIBloomFilter *)self->_positiveOverridesInvocationBloomFilterLegacy contains:v5])
    {
      float v6 = [(NSDictionary *)self->_positiveOverridesDictionary valueForKey:v4];
      goto LABEL_34;
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (self->_isFlatbuffersCATIOverrideSystem)
    {
      v8 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)std::string buf = 136315138;
        id v35 = "-[CDMCATIChildService checkExactMatch:]";
        _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s Using Flatbuffers BF override system", buf, 0xCu);
      }

      double v9 = [(FLTCDMCATIBloomFilters *)self->_fbBloomFilters general_bf];
      BOOL v10 = [(CDMCATIChildService *)self checkFBBloomFilter:v9 contains:v5];

      if (!v10) {
        goto LABEL_33;
      }
      [(FLTCDMCATIBloomFilters *)self->_fbBloomFilters array_bf];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v11 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
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
            id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ([(CDMCATIChildService *)self checkFBBloomFilter:v15 contains:v5])
            {
              float v16 = [v15 name];
              [v7 addObject:v16];
            }
          }
          uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v12);
      }
    }
    else
    {
      id v17 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)std::string buf = 136315138;
        id v35 = "-[CDMCATIChildService checkExactMatch:]";
        _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s Using JSON BF override system", buf, 0xCu);
      }

      if (![self->_positiveOverridesInvocationBloomFilter containsWithData:v5]) {
        goto LABEL_33;
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v11 = self->_positiveOverridesInvocationIndividualBloomFilters;
      uint64_t v18 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v11);
            }
            char v21 = *(void **)(*((void *)&v24 + 1) + 8 * j);
            if (objc_msgSend(v21, "containsWithData:", v5, (void)v24))
            {
              uint64_t v22 = [v21 name];
              [v7 addObject:v22];
            }
          }
          uint64_t v18 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v18);
      }
    }

LABEL_33:
    float v6 = -[CDMCATIChildService checkExactMatchFromPossibleGuids:forUtterance:modelType:](self, "checkExactMatchFromPossibleGuids:forUtterance:modelType:", v7, v4, 0, (void)v24);
  }
LABEL_34:

  return v6;
}

- (BOOL)checkFBBloomFilter:(id)a3 contains:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[MurmurHash3 hash128WithKey:length:seed:](MurmurHash3, "hash128WithKey:length:seed:", [v6 bytes], objc_msgSend(v6, "length"), objc_msgSend(v5, "seed"));
  uint64_t v9 = v8;
  id v15 = v6;
  unsigned __int8 v10 = 0;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  while (objc_msgSend(v5, "number_of_hashes", v15) > (unint64_t)v10)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    unint64_t v21 = 0;
    unint64_t v21 = (v7 + v9 * (unint64_t)v10) % objc_msgSend(v5, "number_of_bits");
    long long v11 = objc_msgSend(v5, "bit_vector");
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __51__CDMCATIChildService_checkFBBloomFilter_contains___block_invoke;
    v16[3] = &unk_2647A4918;
    uint64_t v18 = v20;
    id v12 = v11;
    id v17 = v12;
    uint64_t v19 = &v22;
    [v12 data:v16];

    _Block_object_dispose(v20, 8);
    ++v10;
  }
  char v13 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);

  return v13;
}

unint64_t __51__CDMCATIChildService_checkFBBloomFilter_contains___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unsigned int v4 = *(unsigned __int8 *)(a2 + (v3 >> objc_msgSend(*(id *)(a1 + 32), "bit_shift")));
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t result = objc_msgSend(*(id *)(a1 + 32), "bits_per_block");
  if (((v4 >> (v5 % result)) & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (id)checkExactMatchForUtterances:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [v4 normalisedUtterance];
    int v17 = 136315394;
    uint64_t v18 = "-[CDMCATIChildService checkExactMatchForUtterances:]";
    __int16 v19 = 2112;
    double v20 = v15;
    _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s CATI normalized utterance: %@", (uint8_t *)&v17, 0x16u);
  }
  id v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    float v16 = [v4 originalUtterance];
    int v17 = 136315394;
    uint64_t v18 = "-[CDMCATIChildService checkExactMatchForUtterances:]";
    __int16 v19 = 2112;
    double v20 = v16;
    _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s CATI original utterance: %@", (uint8_t *)&v17, 0x16u);
  }
  if ([v4 hasOriginalUtterance])
  {
    uint64_t v7 = [v4 originalUtterance];
    uint64_t v8 = [v7 lowercaseString];

    uint64_t v9 = [(CDMCATIChildService *)self checkExactMatch:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  int v10 = [v4 hasNormalisedUtterance];
  if (v9) {
    int v11 = 0;
  }
  else {
    int v11 = v10;
  }
  if (v11 == 1)
  {
    id v12 = [v4 normalisedUtterance];
    char v13 = [v12 lowercaseString];

    uint64_t v9 = [(CDMCATIChildService *)self checkExactMatch:v13];
  }
  return v9;
}

- (id)handle:(id)a3 assetVersion:(int64_t)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  os_signpost_id_t v7 = os_signpost_id_generate((os_log_t)CDMLogContext);
  uint64_t v8 = (id)CDMLogContext;
  uint64_t v9 = v8;
  os_signpost_id_t spid = v7;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v11 = [(CDMCATIChildService *)self getProductAreaName];
    *(_DWORD *)std::string buf = 138412290;
    double v58 = v11;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CATI", "invokeHandle (%@)", buf, 0xCu);
  }
  if ([(CDMCATIChildService *)self isMultiTurnEnabled])
  {
    os_signpost_id_t v12 = os_signpost_id_generate((os_log_t)CDMLogContext);
    char v13 = (id)CDMLogContext;
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      id v15 = [(CDMCATIChildService *)self getProductAreaName];
      *(_DWORD *)std::string buf = 138412290;
      double v58 = v15;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CATI", "buildMultiTurnFeatures (%@)", buf, 0xCu);
    }
    float v16 = [v6 request];
    int v17 = [v16 turnInput];
    [(CDMCATIChildService *)self buildMultiturnFeatures:v17];

    uint64_t v18 = (id)CDMLogContext;
    __int16 v19 = v18;
    if (v12 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
    {
      *(_WORD *)std::string buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v19, OS_SIGNPOST_INTERVAL_END, v12, "CATI", "", buf, 2u);
    }

    if (self->_multiturnEnabled) {
      goto LABEL_23;
    }
  }
  else
  {
    double v20 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315138;
      double v58 = "-[CDMCATIChildService handle:assetVersion:]";
      _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Multiturn is disabled", buf, 0xCu);
    }

    self->_multiturnEnabled = 0;
  }
  uint64_t v21 = [v6 request];
  uint64_t v22 = [v21 turnInput];
  BOOL v23 = [(CDMCATIChildService *)self shouldSuppressCATIInvocationDueTo:v22];

  if (v23)
  {
    uint64_t v24 = (id)CDMLogContext;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v52 = [(CDMCATIChildService *)self getProductAreaName];
      *(_DWORD *)std::string buf = 136315650;
      double v58 = "-[CDMCATIChildService handle:assetVersion:]";
      __int16 v59 = 2112;
      v60 = @"cati";
      __int16 v61 = 2112;
      double v62 = v52;
      _os_log_debug_impl(&dword_2263A0000, v24, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\n%@: CATI suppressed due to previous non-CATI turn info, return empty hypothesis", buf, 0x20u);
    }
    char v25 = (id)CDMLogContext;
    long long v26 = v25;
    if (v10 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v25)) {
      goto LABEL_57;
    }
    *(_WORD *)std::string buf = 0;
LABEL_22:
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v26, OS_SIGNPOST_INTERVAL_END, spid, "CATI", "", buf, 2u);
LABEL_57:
    double v40 = 0;
    goto LABEL_58;
  }
LABEL_23:
  long long v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v27 = [v6 request];
  long long v28 = [(CDMCATIChildService *)self checkExactMatchForUtterances:v27];

  if (v28)
  {
    float v30 = 1.0;
    int v31 = 1;
  }
  else
  {
    if (!self->_invocationWeightsEnabled && !self->_multiturnWeightsEnabled)
    {
      v48 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        v55 = [(CDMCATIChildService *)self getProductAreaName];
        *(_DWORD *)std::string buf = 136315394;
        double v58 = "-[CDMCATIChildService handle:assetVersion:]";
        __int16 v59 = 2112;
        v60 = v55;
        _os_log_debug_impl(&dword_2263A0000, v48, OS_LOG_TYPE_DEBUG, "%s %@: There were no override matches and no weights to run inference on so we are returning an empty response.", buf, 0x16u);
      }
      char v49 = (id)CDMLogContext;
      uint64_t v50 = v49;
      if (v10 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v49))
      {
        *(_WORD *)std::string buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v50, OS_SIGNPOST_INTERVAL_END, spid, "CATI", "", buf, 2u);
      }

      goto LABEL_57;
    }
    __int16 v32 = [v6 request];
    v33 = [v32 embeddings];
    __int16 v34 = [(CDMCATIChildService *)self runCATIModelInferenceWithWeights:v33];

    if (!v34)
    {
      v46 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        double v54 = [(CDMCATIChildService *)self getProductAreaName];
        *(_DWORD *)std::string buf = 136315394;
        double v58 = "-[CDMCATIChildService handle:assetVersion:]";
        __int16 v59 = 2112;
        v60 = v54;
        _os_log_debug_impl(&dword_2263A0000, v46, OS_LOG_TYPE_DEBUG, "%s %@: There were no override matches and the inference results were below the threshold, so we are returning an empty response.", buf, 0x16u);
      }
      double v47 = (id)CDMLogContext;
      long long v26 = v47;
      if (v10 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v47)) {
        goto LABEL_57;
      }
      *(_WORD *)std::string buf = 0;
      goto LABEL_22;
    }
    long long v28 = [v34 valueForKey:self->_usoEdge];
    id v35 = [v34 valueForKey:@"confidence_score"];
    [v35 floatValue];
    float v30 = v36;

    int v31 = 2;
    long long v26 = v34;
  }
  self->_algoType = v31;
  if (a4 > 3199)
  {
    int v38 = [(CDMCATIManifest *)self->_catiManifest usoElementId];
    if (v38 == 2550)
    {
      *(float *)&double v39 = v30;
      uint64_t v37 = [(CDMCATIChildService *)self buildSocialConversationUserParse:v28 confidenceScore:v39];
    }
    else
    {
      *(float *)&double v39 = v30;
      if (v38 == 2612) {
        [(CDMCATIChildService *)self buildCrisisSupportUserParse:v28 confidenceScore:v39];
      }
      else {
      uint64_t v37 = [(CDMCATIChildService *)self buildUserParse:v28 confidenceScore:v39];
      }
    }
  }
  else
  {
    *(float *)&double v29 = v30;
    uint64_t v37 = [(CDMCATIChildService *)self buildUserParse:v28 confidenceScore:v29];
  }
  double v40 = (void *)v37;
  double v41 = (id)CDMLogContext;
  BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG);
  if (v40)
  {
    if (v42)
    {
      char v43 = [(CDMCATIChildService *)self getProductAreaName];
      *(_DWORD *)std::string buf = 136315906;
      double v58 = "-[CDMCATIChildService handle:assetVersion:]";
      __int16 v59 = 2112;
      v60 = @"cati";
      __int16 v61 = 2112;
      double v62 = v43;
      __int16 v63 = 2112;
      v64 = v40;
      _os_log_debug_impl(&dword_2263A0000, v41, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\n%@ CATI hypothesis: %@", buf, 0x2Au);
    }
  }
  else if (v42)
  {
    v53 = [(CDMCATIChildService *)self getProductAreaName];
    *(_DWORD *)std::string buf = 136315650;
    double v58 = "-[CDMCATIChildService handle:assetVersion:]";
    __int16 v59 = 2112;
    v60 = @"cati";
    __int16 v61 = 2112;
    double v62 = v53;
    _os_log_debug_impl(&dword_2263A0000, v41, OS_LOG_TYPE_DEBUG, "%s [insights-cdm-%@]:\n%@: no CATI hypothesis", buf, 0x20u);
  }
  double v44 = (id)CDMLogContext;
  char v45 = v44;
  if (v10 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v44))
  {
    *(_WORD *)std::string buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v45, OS_SIGNPOST_INTERVAL_END, spid, "CATI", "", buf, 2u);
  }

LABEL_58:
  return v40;
}

- (id)getMultiturnIntentsFromSystemInformed:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v33 = [v31 entities];
  if (v33 && [v33 count])
  {
    for (unint64_t i = 0; [v33 count] > i; ++i)
    {
      __int16 v32 = objc_msgSend(v33, "objectAtIndex:");
      int v38 = [v32 nodes];
      if (!v38 || ![v38 count]) {
        goto LABEL_42;
      }
      id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
      for (unint64_t j = 0; [v38 count] > j; ++j)
      {
        unint64_t v5 = [v38 objectAtIndex:j];
        if ([v5 usoElementId] == self->_usoElementId) {
          goto LABEL_11;
        }
        id v6 = [v5 entityLabel];
        os_signpost_id_t v7 = [(CDMCATIChildService *)self getManifest];
        uint64_t v8 = [v7 usoEntity];
        int v9 = [v6 isEqualToString:v8];

        if (v9)
        {
LABEL_11:
          unint64_t v10 = [NSNumber numberWithInt:j];
          [v41 addObject:v10];
        }
      }
      float v36 = [v32 identifiers];
      for (unint64_t k = 0; [v36 count] > k; ++k)
      {
        os_signpost_id_t v12 = [v36 objectAtIndex:k];
        char v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "nodeIndex"));
        if ([v41 containsObject:v13])
        {
          int v14 = [v12 hasValue];

          if (!v14) {
            goto LABEL_19;
          }
          char v13 = [v12 value];
          [v3 addObject:v13];
        }

LABEL_19:
      }
      if (+[CDMFeatureFlags isUsoEntitySpanEnabled])
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        obunint64_t j = [v32 spans];
        uint64_t v15 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v15)
        {
          uint64_t v39 = *(void *)v47;
          do
          {
            uint64_t v40 = v15;
            for (uint64_t m = 0; m != v40; ++m)
            {
              if (*(void *)v47 != v39) {
                objc_enumerationMutation(obj);
              }
              int v17 = *(void **)(*((void *)&v46 + 1) + 8 * m);
              uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "nodeIndex"));
              char v19 = [v41 containsObject:v18];

              if (v19)
              {
                long long v44 = 0u;
                long long v45 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                double v20 = [v17 properties];
                uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
                if (v21)
                {
                  uint64_t v22 = *(void *)v43;
                  do
                  {
                    for (uint64_t n = 0; n != v21; ++n)
                    {
                      if (*(void *)v43 != v22) {
                        objc_enumerationMutation(v20);
                      }
                      uint64_t v24 = *(void **)(*((void *)&v42 + 1) + 8 * n);
                      if ([v24 hasValueString])
                      {
                        char v25 = [v24 valueString];
                        long long v26 = [v25 value];
                        char v27 = [v3 containsObject:v26];

                        if ((v27 & 1) == 0)
                        {
                          long long v28 = [v24 valueString];
                          double v29 = [v28 value];
                          [v3 addObject:v29];
                        }
                      }
                    }
                    uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
                  }
                  while (v21);
                }
              }
            }
            uint64_t v15 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v15);
        }
      }
LABEL_42:
    }
  }

  return v3;
}

- (id)getMultiturnIntentsFromSystemGaveOptions:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v33 = [v30 choices];
  if (v33 && objc_msgSend(v33, "count", v30))
  {
    for (unint64_t i = 0; [v33 count] > i; ++i)
    {
      __int16 v32 = objc_msgSend(v33, "objectAtIndex:");
      if (![v32 hasUserStatedTask]) {
        goto LABEL_44;
      }
      id v4 = [v32 userStatedTask];
      id v31 = [v4 task];

      int v38 = [v31 nodes];
      if (!v38 || ![v38 count]) {
        goto LABEL_43;
      }
      id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
      for (unint64_t j = 0; [v38 count] > j; ++j)
      {
        id v6 = [v38 objectAtIndex:j];
        if ([v6 usoElementId] == self->_usoElementId
          || ([v6 entityLabel],
              os_signpost_id_t v7 = objc_claimAutoreleasedReturnValue(),
              int v8 = [v7 isEqualToString:self->_usoEntity],
              v7,
              v8))
        {
          int v9 = [NSNumber numberWithInt:j];
          [v41 addObject:v9];
        }
      }
      float v36 = [v31 identifiers];
      for (unint64_t k = 0; [v36 count] > k; ++k)
      {
        int v11 = [v36 objectAtIndex:k];
        os_signpost_id_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "nodeIndex"));
        if ([v41 containsObject:v12])
        {
          int v13 = [v11 hasValue];

          if (!v13) {
            goto LABEL_20;
          }
          os_signpost_id_t v12 = [v11 value];
          [v3 addObject:v12];
        }

LABEL_20:
      }
      if (+[CDMFeatureFlags isUsoEntitySpanEnabled])
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        obunint64_t j = [v31 spans];
        uint64_t v14 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v14)
        {
          uint64_t v39 = *(void *)v47;
          do
          {
            uint64_t v40 = v14;
            for (uint64_t m = 0; m != v40; ++m)
            {
              if (*(void *)v47 != v39) {
                objc_enumerationMutation(obj);
              }
              float v16 = *(void **)(*((void *)&v46 + 1) + 8 * m);
              int v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "nodeIndex"));
              char v18 = [v41 containsObject:v17];

              if (v18)
              {
                long long v44 = 0u;
                long long v45 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                char v19 = [v16 properties];
                uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v50 count:16];
                if (v20)
                {
                  uint64_t v21 = *(void *)v43;
                  do
                  {
                    for (uint64_t n = 0; n != v20; ++n)
                    {
                      if (*(void *)v43 != v21) {
                        objc_enumerationMutation(v19);
                      }
                      BOOL v23 = *(void **)(*((void *)&v42 + 1) + 8 * n);
                      if ([v23 hasValueString])
                      {
                        uint64_t v24 = [v23 valueString];
                        char v25 = [v24 value];
                        char v26 = [v3 containsObject:v25];

                        if ((v26 & 1) == 0)
                        {
                          char v27 = [v23 valueString];
                          long long v28 = [v27 value];
                          [v3 addObject:v28];
                        }
                      }
                    }
                    uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v50 count:16];
                  }
                  while (v20);
                }
              }
            }
            uint64_t v14 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v14);
        }
      }
LABEL_43:

LABEL_44:
    }
  }

  return v3;
}

- (void)buildMultiturnFeatures:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_multiturnEnabled = 0;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = [v4 turnContext];
  int v7 = [v6 hasNlContext];

  if (v7)
  {
    int v8 = [v4 turnContext];
    int v9 = [v8 nlContext];
    unint64_t v10 = [v9 systemDialogActs];

    if (v10 && [v10 count])
    {
      for (unint64_t i = 0; [v10 count] > i; ++i)
      {
        os_signpost_id_t v12 = [v10 objectAtIndex:i];
        if ([v12 hasGaveOptions])
        {
          id v13 = objc_alloc(MEMORY[0x263EFF9C0]);
          uint64_t v14 = [v12 gaveOptions];
          uint64_t v15 = [(CDMCATIChildService *)self getMultiturnIntentsFromSystemGaveOptions:v14];
          uint64_t v16 = [v13 initWithSet:v15];
        }
        else
        {
          if (![v12 hasInformed]) {
            goto LABEL_11;
          }
          id v17 = objc_alloc(MEMORY[0x263EFF9C0]);
          uint64_t v14 = [v12 informed];
          uint64_t v15 = [(CDMCATIChildService *)self getMultiturnIntentsFromSystemInformed:v14];
          uint64_t v16 = [v17 initWithSet:v15];
        }
        char v18 = (void *)v16;

        id v5 = v18;
LABEL_11:
      }
    }
    char v19 = [(CDMCATIChildService *)self getManifest];
    uint64_t v20 = [v19 getPositiveOverrideGuidsForModelType:1];
    [v5 intersectSet:v20];
  }
  if ([v5 count])
  {
    self->_multiturnEnabled = 1;
    uint64_t v21 = [v5 allObjects];
    multiturnEnabledExactMatchIntents = self->_multiturnEnabledExactMatchIntents;
    self->_multiturnEnabledExactMatchIntents = v21;

    BOOL v23 = [MEMORY[0x263F08850] defaultManager];
    id v35 = [v23 contentsOfDirectoryAtPath:self->_weightsDirectoryPath error:0];

    uint64_t v24 = [(CDMCATIChildService *)self getManifest];
    __int16 v34 = [v24 getWeightGuidsForModelType:1];

    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    os_signpost_id_t v26 = os_signpost_id_generate((os_log_t)CDMLogContext);
    char v27 = (id)CDMLogContext;
    long long v28 = v27;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      double v29 = [(CDMCATIChildService *)self getProductAreaName];
      *(_DWORD *)std::string buf = 138412290;
      long long v43 = v29;
      _os_signpost_emit_with_name_impl(&dword_2263A0000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "CATI", "processMultiTurnWeightFiles (%@)", buf, 0xCu);
    }
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __46__CDMCATIChildService_buildMultiturnFeatures___block_invoke;
    v37[3] = &unk_2647A48F0;
    id v30 = v35;
    id v38 = v30;
    id v31 = v34;
    id v39 = v31;
    id v40 = v5;
    id v32 = v25;
    id v41 = v32;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __46__CDMCATIChildService_buildMultiturnFeatures___block_invoke_2;
    v36[3] = &__block_descriptor_40_e5_v8__0l;
    v36[4] = v26;
    [v30 enumerateTaskParallelly:v37 blockCompleteAllTask:v36];
    self->_multiturnWeightsEnabled = 0;
    unint64_t v33 = [v32 count];
    self->_numMultiturnModels = v33;
    if (v33) {
      operator new[]();
    }
  }
}

void __46__CDMCATIChildService_buildMultiturnFeatures___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "objectAtIndex:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v4 componentsSeparatedByString:@"."];
  id v3 = [v2 objectAtIndex:0];
  if ([a1[5] containsObject:v3]
    && [a1[6] containsObject:v3])
  {
    [a1[7] addObject:v4];
  }
}

void __46__CDMCATIChildService_buildMultiturnFeatures___block_invoke_2(uint64_t a1)
{
  v2 = (id)CDMLogContext;
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CATI", "", v5, 2u);
  }
}

- (id)buildLegacyBloomFilterAndExactMatchDictForInvocation:(id)a3
{
  id v4 = a3;
  uint64_t expectedPositiveUtterances = self->_expectedPositiveUtterances;
  id v6 = [(CDMCATIChildService *)self getManifest];
  int v7 = [v6 getPositiveOverrideGuidsForModelType:0];

  if (expectedPositiveUtterances == -1) {
    uint64_t expectedPositiveUtterances = 100 * [v7 count];
  }
  uint64_t v25 = 0;
  os_signpost_id_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__1974;
  double v29 = __Block_byref_object_dispose__1975;
  id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__1974;
  BOOL v23 = __Block_byref_object_dispose__1975;
  uint64_t v24 = [[CATIBloomFilter alloc] initWithExceptedNumberOfItems:expectedPositiveUtterances falsePositiveRate:1234 seed:0.01];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__CDMCATIChildService_buildLegacyBloomFilterAndExactMatchDictForInvocation___block_invoke;
  v13[3] = &unk_2647A48C8;
  id v8 = v4;
  id v14 = v8;
  uint64_t v15 = self;
  id v9 = v7;
  id v16 = v9;
  id v17 = &v25;
  char v18 = &v19;
  [v8 enumerateTaskParallelly:v13 blockCompleteAllTask:&__block_literal_global_422];
  unint64_t v10 = [NSDictionary dictionaryWithDictionary:v26[5]];
  [(CDMCATIChildService *)self setPositiveOverridesDictionary:v10];

  if ([(NSDictionary *)self->_positiveOverridesDictionary count])
  {
    self->_invocationOverridesEnabled = 1;
    self->_isLegacyCATIOverrideSysteuint64_t m = 1;
  }
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __76__CDMCATIChildService_buildLegacyBloomFilterAndExactMatchDictForInvocation___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v18 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  v2 = [*(id *)(a1 + 40) getPosOverridesDirectoryPath];
  uint64_t v3 = [v2 stringByAppendingPathComponent:v18];

  id v24 = 0;
  id v17 = (void *)v3;
  id v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3 options:0 error:&v24];
  id v5 = v24;
  if (v4)
  {
    id v23 = v5;
    id v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v23];
    id v15 = v23;

    if (v6)
    {
      id v16 = [v18 componentsSeparatedByString:@"."];
      int v7 = [v16 objectAtIndex:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v7, v15))
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v8 = v6;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v20;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v20 != v10) {
                  objc_enumerationMutation(v8);
                }
                os_signpost_id_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
                [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setValue:v7 forKey:v12];
                id v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
                id v14 = [v12 dataUsingEncoding:4];
                [v13 add:v14];
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
            }
            while (v9);
          }
        }
      }
    }
    else
    {
      id v16 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 136315650;
        uint64_t v27 = "-[CDMCATIChildService buildLegacyBloomFilterAndExactMatchDictForInvocation:]_block_invoke";
        __int16 v28 = 2112;
        double v29 = v18;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_error_impl(&dword_2263A0000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Error parsing JSON in file %@: %@", buf, 0x20u);
      }
    }

    id v5 = v15;
  }
  else
  {
    id v6 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315650;
      uint64_t v27 = "-[CDMCATIChildService buildLegacyBloomFilterAndExactMatchDictForInvocation:]_block_invoke";
      __int16 v28 = 2112;
      double v29 = v18;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_error_impl(&dword_2263A0000, v6, OS_LOG_TYPE_ERROR, "%s [ERR]: Unable to find or process file (%@) due to %@", buf, 0x20u);
    }
  }
}

- (BOOL)getBloomFilterAt:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 stringByAppendingPathComponent:@"general.bf"];
  id v21 = 0;
  id v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5 options:0 error:&v21];
  id v7 = v21;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      id v23 = "-[CDMCATIChildService getBloomFilterAt:]";
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_error_impl(&dword_2263A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI: Error parsing General Bloom Filter: %@", buf, 0x16u);
    }
    BOOL v10 = 0;
  }
  else
  {
    id v11 = objc_alloc_init(_TtC13CDMFoundation27BloomFilterObjectiveCHelper);
    id v20 = 0;
    uint64_t v9 = [(BloomFilterObjectiveCHelper *)v11 getDecodedBFWithData:v6 error:&v20];
    id v8 = v20;

    os_signpost_id_t v12 = [v4 stringByAppendingPathComponent:@"array.bf"];
    id v19 = 0;
    id v17 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v12 options:0 error:&v19];
    id v13 = v19;
    if (v13)
    {
      id v14 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 136315394;
        id v23 = "-[CDMCATIChildService getBloomFilterAt:]";
        __int16 v24 = 2112;
        id v25 = v13;
        _os_log_error_impl(&dword_2263A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: CATI: Error parsing Array Bloom Filter: %@", buf, 0x16u);
      }
      BOOL v10 = 0;
    }
    else
    {
      id v15 = objc_alloc_init(_TtC13CDMFoundation27BloomFilterObjectiveCHelper);
      id v18 = 0;
      id v14 = [(BloomFilterObjectiveCHelper *)v15 getDecodedBFArrayWithData:v17 error:&v18];
      id v13 = v18;

      BOOL v10 = 0;
      if (v9 && v14)
      {
        self->_invocationOverridesEnabled = 1;
        objc_storeStrong((id *)&self->_positiveOverridesInvocationBloomFilter, v9);
        objc_storeStrong((id *)&self->_positiveOverridesInvocationIndividualBloomFilters, v14);
        BOOL v10 = 1;
      }
    }
  }
  return v10;
}

- (BOOL)getFlatbuffersBFAt:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringByAppendingString:@"/FBBF.bin"];
  id v6 = [NSURL fileURLWithPath:v5];
  id v10 = 0;
  id v7 = [MEMORY[0x263F71C68] getCATIBloomFiltersFromFileURL:v6 error:&v10];
  id v8 = v10;
  if (v7)
  {
    self->_invocationOverridesEnabled = 1;
    self->_isFlatbuffersCATIOverrideSysteuint64_t m = 1;
    objc_storeStrong((id *)&self->_fbBloomFilters, v7);
  }

  return v7 != 0;
}

- (void)constructWeightMatrixForInference:(id)a3 numModels:(unint64_t)a4 guids:(id)a5 modelType:(unint64_t)a6
{
  id v10 = a3;
  for (id i = a5; a4; --a4)
    [i addObject:@"0"];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__CDMCATIChildService_constructWeightMatrixForInference_numModels_guids_modelType___block_invoke;
  v14[3] = &unk_2647A48A0;
  id v12 = v10;
  id v15 = v12;
  id v16 = self;
  id v13 = i;
  id v17 = v13;
  unint64_t v18 = a6;
  [v12 enumerateTaskParallelly:v14 blockCompleteAllTask:&__block_literal_global_409];
}

void __83__CDMCATIChildService_constructWeightMatrixForInference_numModels_guids_modelType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  id v23 = [v5 componentsSeparatedByString:@"."];
  id v25 = [v23 objectAtIndex:0];
  id v6 = [*(id *)(*(void *)(a1 + 40) + 56) stringByAppendingPathComponent:v5];
  id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
  id v26 = 0;
  id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v26];
  id v24 = v26;
  if (v8)
  {
    [*(id *)(a1 + 48) replaceObjectAtIndex:a3 withObject:v25];
    uint64_t v9 = [v8 objectAtIndex:0];
    uint64_t v10 = [v9 count];
    if (v10 != *(void *)(*(void *)(a1 + 40) + 16))
    {
      id v11 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v21 = [*(id *)(a1 + 40) getProductAreaName];
        uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 16);
        *(_DWORD *)std::string buf = 136315906;
        __int16 v28 = "-[CDMCATIChildService constructWeightMatrixForInference:numModels:guids:modelType:]_block_invoke";
        __int16 v29 = 2112;
        __int16 v30 = v21;
        __int16 v31 = 1024;
        *(_DWORD *)uint64_t v32 = v22;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v5;
        _os_log_error_impl(&dword_2263A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: %@: Weight vector doesn't have size %d in file %@", buf, 0x26u);
      }
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 16);
    }
    if (v10 >= 1)
    {
      uint64_t v12 = 0;
      while (1)
      {
        id v13 = [v9 objectAtIndex:v12];
        id v14 = v13;
        uint64_t v15 = *(void *)(a1 + 56);
        if (v15 == 1) {
          break;
        }
        if (!v15)
        {
          [v13 floatValue];
          id v17 = *(void **)(a1 + 40);
          unint64_t v18 = v17 + 16;
          uint64_t v19 = 224;
LABEL_12:
          *(_DWORD *)(*v18 + 4 * (v12 + v17[2] * a3)) = v16;
          *(unsigned char *)(*(void *)(a1 + 40) + v19) = 1;
        }

        if (*(void *)(*(void *)(a1 + 40) + 16) <= ++v12) {
          goto LABEL_17;
        }
      }
      [v13 floatValue];
      id v17 = *(void **)(a1 + 40);
      unint64_t v18 = v17 + 17;
      uint64_t v19 = 226;
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v20 = [*(id *)(a1 + 40) getProductAreaName];
      *(_DWORD *)std::string buf = 136315906;
      __int16 v28 = "-[CDMCATIChildService constructWeightMatrixForInference:numModels:guids:modelType:]_block_invoke";
      __int16 v29 = 2112;
      __int16 v30 = v20;
      __int16 v31 = 2112;
      *(void *)uint64_t v32 = v5;
      *(_WORD *)&v32[8] = 2112;
      *(void *)&v32[10] = v24;
      _os_log_impl(&dword_2263A0000, v9, OS_LOG_TYPE_INFO, "%s %@: Error parsing JSON for CATI Weight Matrix named %@: %@", buf, 0x2Au);
    }
  }
LABEL_17:
}

- (id)setup:(id)a3 assetVersion:(int64_t)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(NSBundle *)self->_catiAssetBundle resourcePath];
    *(_DWORD *)std::string buf = 136315394;
    v72 = "-[CDMCATIChildService setup:assetVersion:]";
    __int16 v73 = 2112;
    v74 = v7;
    _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s Setting up child service at this path:%@", buf, 0x16u);
  }
  id v8 = [(NSBundle *)self->_catiAssetBundle resourcePath];
  uint64_t v9 = [v8 stringByAppendingPathComponent:@"cati_manifest.json"];
  manifestPath = self->_manifestPath;
  self->_manifestPath = v9;

  id v11 = [(CDMCATIChildService *)self getManifestFromPath:self->_manifestPath];
  catiManifest = self->_catiManifest;
  self->_catiManifest = v11;

  os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)CDMLogContext);
  id v14 = (id)CDMLogContext;
  uint64_t v15 = v14;
  unint64_t v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    id v17 = [(CDMCATIChildService *)self getProductAreaName];
    *(_DWORD *)std::string buf = 138412290;
    v72 = v17;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CATI", "setupChildService (%@)", buf, 0xCu);
  }
  unint64_t v18 = self->_catiManifest;
  if (v18 && [(CDMCATIManifest *)v18 manifestValid])
  {
    uint64_t v19 = [v5 dynamicConfig];
    __int16 v63 = [v19 embeddingConfigs];

    double v62 = [v63 getEmbeddingConfigForFactor:@"com.apple.siri.nl.cati"];
    id v20 = [v62 embeddingModelDimension];
    self->_unint64_t embeddingDimensionCATI = [v20 integerValue];

    self->_embeddingDimensionCATIPlusOne = self->_embeddingDimensionCATI + 1;
    id v21 = [(NSBundle *)self->_catiAssetBundle resourcePath];
    uint64_t v22 = [v21 stringByAppendingPathComponent:@"positive_overrides"];
    posOverridesDirectoryPath = self->_posOverridesDirectoryPath;
    self->_posOverridesDirectoryPath = v22;

    id v24 = [(NSBundle *)self->_catiAssetBundle resourcePath];
    id v25 = [v24 stringByAppendingPathComponent:@"weights"];
    weightsDirectoryPath = self->_weightsDirectoryPath;
    self->_weightsDirectoryPath = v25;

    uint64_t v27 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v65 = [v27 contentsOfDirectoryAtPath:self->_weightsDirectoryPath error:0];

    __int16 v28 = [MEMORY[0x263F08850] defaultManager];
    __int16 v29 = [(CDMCATIChildService *)self getPosOverridesDirectoryPath];
    v64 = [v28 contentsOfDirectoryAtPath:v29 error:0];

    __int16 v30 = [(CDMCATIManifest *)self->_catiManifest usoEntity];
    usoEntity = self->_usoEntity;
    self->_usoEntity = v30;

    self->_usoElementId = [(CDMCATIManifest *)self->_catiManifest usoElementId];
    uint64_t v32 = [(CDMCATIManifest *)self->_catiManifest usoVerb];
    usoVerb = self->_usoVerb;
    self->_usoVerb = v32;

    __int16 v34 = [(CDMCATIManifest *)self->_catiManifest usoEdge];
    usoEdge = self->_usoEdge;
    self->_usoEdge = v34;

    [(CDMCATIManifest *)self->_catiManifest confidenceScoreThreshold];
    self->_confidenceThreshold = v36;
    [(CDMCATIManifest *)self->_catiManifest multiturnConfidenceScoreThreshold];
    self->_multiturnConfidenceThreshold = v37;
    self->_uint64_t expectedPositiveUtterances = [(CDMCATIManifest *)self->_catiManifest expectedPositiveUtterances];
    if ([v65 count])
    {
      id v38 = [(CDMCATIChildService *)self getManifest];
      __int16 v61 = [v38 getWeightGuidsForModelType:0];

      id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __42__CDMCATIChildService_setup_assetVersion___block_invoke;
      v67[3] = &unk_2647A4878;
      id v68 = v65;
      id v69 = v61;
      id v40 = v39;
      id v70 = v40;
      [v68 enumerateTaskParallelly:v67 blockCompleteAllTask:&__block_literal_global_2002];
      self->_numModels = [v40 count];
      operator new[]();
    }
    uint64_t v44 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      v60 = [(CDMCATIChildService *)self getProductAreaName];
      *(_DWORD *)std::string buf = 136315394;
      v72 = "-[CDMCATIChildService setup:assetVersion:]";
      __int16 v73 = 2112;
      v74 = v60;
      _os_log_debug_impl(&dword_2263A0000, v44, OS_LOG_TYPE_DEBUG, "%s %@: There are no weight files for this product area. CATI will run only on overrides, if available", buf, 0x16u);
    }
    self->_invocationOverridesEnabled = 0;
    if ([v64 count])
    {
      long long v45 = [(NSBundle *)self->_catiAssetBundle resourcePath];
      long long v46 = [v45 stringByAppendingPathComponent:@"bf_files"];

      long long v47 = [MEMORY[0x263F08850] defaultManager];
      long long v48 = [v47 contentsOfDirectoryAtPath:v46 error:0];

      uint64_t v49 = [v48 count];
      if (a4 >= 3104 && v49)
      {
        if (![(CDMCATIChildService *)self getFlatbuffersBFAt:v46]
          && ![(CDMCATIChildService *)self getBloomFilterAt:v46])
        {
          uint64_t v50 = [(CDMCATIChildService *)self getProductAreaName];
          id v41 = [v50 stringByAppendingString:@": Bloom filter setup failed, service is disabled. Check logs for error message"];

          double v51 = (id)CDMLogContext;
          uint64_t v52 = v51;
          if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v51))
          {
            *(_WORD *)std::string buf = 0;
            _os_signpost_emit_with_name_impl(&dword_2263A0000, v52, OS_SIGNPOST_INTERVAL_END, v13, "CATI", "", buf, 2u);
          }

LABEL_36:
          long long v43 = v63;
          goto LABEL_37;
        }
      }
      else
      {
        double v54 = [(CDMCATIChildService *)self buildLegacyBloomFilterAndExactMatchDictForInvocation:v64];
        positiveOverridesInvocationBloomFilterLegacy = self->_positiveOverridesInvocationBloomFilterLegacy;
        self->_positiveOverridesInvocationBloomFilterLegacy = v54;
      }
    }
    else
    {
      long long v46 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v53 = [(CDMCATIChildService *)self getPosOverridesDirectoryPath];
        *(_DWORD *)std::string buf = 136315394;
        v72 = "-[CDMCATIChildService setup:assetVersion:]";
        __int16 v73 = 2112;
        v74 = v53;
        _os_log_impl(&dword_2263A0000, v46, OS_LOG_TYPE_INFO, "%s [WARN]: Not able to find any CATI positive overrides in %@", buf, 0x16u);
      }
    }

    if ([(CDMCATIChildService *)self getInvocationOverridesEnabled])
    {
      v56 = (id)CDMLogContext;
      long long v46 = v56;
      if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
      {
        *(_WORD *)std::string buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v46, OS_SIGNPOST_INTERVAL_END, v13, "CATI", "", buf, 2u);
      }
      id v41 = 0;
    }
    else
    {
      v57 = [(CDMCATIChildService *)self getProductAreaName];
      id v41 = [v57 stringByAppendingString:@": No CATI positive overrides are available, service is disabled."];

      double v58 = (id)CDMLogContext;
      long long v46 = v58;
      if (v16 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v58))
      {
        *(_WORD *)std::string buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2263A0000, v46, OS_SIGNPOST_INTERVAL_END, v13, "CATI", "", buf, 2u);
      }
    }
    goto LABEL_36;
  }
  id v41 = [@"CATI manifest not found or invalid at " stringByAppendingString:self->_manifestPath];
  long long v42 = (id)CDMLogContext;
  long long v43 = v42;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)std::string buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2263A0000, v43, OS_SIGNPOST_INTERVAL_END, v13, "CATI", "", buf, 2u);
  }
LABEL_37:

  return v41;
}

void __42__CDMCATIChildService_setup_assetVersion___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "objectAtIndex:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v4 componentsSeparatedByString:@"."];
  uint64_t v3 = [v2 objectAtIndex:0];
  if ([a1[5] containsObject:v3]) {
    [a1[6] addObject:v4];
  }
}

- (id)getProductAreaName
{
  if ([(CDMCATIManifest *)self->_catiManifest usoElementId] == 2550) {
    return @"socialConversation";
  }
  if ([(CDMCATIManifest *)self->_catiManifest usoElementId] == 2612) {
    return @"crisisSupport";
  }
  return @"oldAssetsOrNewProductArea";
}

- (BOOL)isMultiTurnEnabled
{
  return +[CDMFeatureFlags isCATIMultiTurnEnabled];
}

- (CDMCATIChildService)initWithAssetBundle:(id)a3
{
  id v4 = (NSBundle *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CDMCATIChildService;
  id v5 = [(CDMCATIChildService *)&v8 init];
  catiAssetBundle = v5->_catiAssetBundle;
  v5->_catiAssetBundle = v4;

  return v5;
}

@end