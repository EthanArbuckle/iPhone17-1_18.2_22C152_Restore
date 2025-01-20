@interface SGQuickResponsesConfig
+ (id)_cacheKeyForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6;
+ (id)_dictionaryForPlistPath:(id)a3 mode:(unint64_t)a4;
+ (id)_sharedCache;
+ (id)_vocabForVocabPath:(id)a3 mode:(unint64_t)a4;
+ (id)configWithLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6;
+ (id)modelTypeAndSubModelKeyForLanguage:(id)a3 plistPath:(id)a4 vocabPath:(id)a5 warmupBlock:(id)a6;
+ (void)_addModelAssetUpdateHandler;
- (BOOL)isValidConfigForWordPieceWithLazyVocab:(id)a3;
- (NSArray)labels;
- (NSArray)preprocessingMethods;
- (NSDictionary)modelHeads;
- (NSString)language;
- (PMLSessionDescriptor)sessionDescriptor;
- (PMLWordPieceVocabProtocol)vocab;
- (SGCustomResponsesParameters)customResponsesParameters;
- (SGModelHyperparameters)modelHyperparameters;
- (SGQuickResponsesClassificationParameters)classificationParams;
- (SGQuickResponsesConfig)initWithLanguage:(id)a3 mode:(unint64_t)a4 dictionary:(id)a5 lazyVocab:(id)a6;
- (SGQuickResponsesConfig)initWithLanguage:(id)a3 mode:(unint64_t)a4 dictionary:(id)a5 vocab:(id)a6;
- (SGQuickResponsesConfig)initWithLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6;
- (SGQuickResponsesPredictionParameters)predictionParams;
- (SGQuickResponsesReplies)replies;
- (unint64_t)mode;
@end

@implementation SGQuickResponsesConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_customResponsesParameters, 0);
  objc_storeStrong((id *)&self->_predictionParams, 0);
  objc_storeStrong((id *)&self->_classificationParams, 0);
  objc_storeStrong((id *)&self->_modelHeads, 0);
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_preprocessingMethods, 0);
  objc_storeStrong((id *)&self->_modelHyperparameters, 0);
}

- (PMLWordPieceVocabProtocol)vocab
{
  return self->_vocab;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSString)language
{
  return self->_language;
}

- (SGCustomResponsesParameters)customResponsesParameters
{
  return self->_customResponsesParameters;
}

- (SGQuickResponsesPredictionParameters)predictionParams
{
  return self->_predictionParams;
}

- (SGQuickResponsesClassificationParameters)classificationParams
{
  return self->_classificationParams;
}

- (NSDictionary)modelHeads
{
  return self->_modelHeads;
}

- (SGQuickResponsesReplies)replies
{
  return self->_replies;
}

- (NSArray)labels
{
  return self->_labels;
}

- (NSArray)preprocessingMethods
{
  return self->_preprocessingMethods;
}

- (SGModelHyperparameters)modelHyperparameters
{
  return self->_modelHyperparameters;
}

- (BOOL)isValidConfigForWordPieceWithLazyVocab:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(SGModelHyperparameters *)self->_modelHyperparameters vectorizerStrategy] == 6)
  {
    v6 = [v5 getObject];
    vocab = self->_vocab;
    self->_vocab = v6;

    if (self->_vocab)
    {
      if ([(NSArray *)self->_preprocessingMethods count] <= 1)
      {
        v12 = [MEMORY[0x263F08690] currentHandler];
        [v12 handleFailureInMethod:a2, self, @"SGQuickResponsesConfig.m", 1165, @"Invalid parameter not satisfying: %@", @"_preprocessingMethods.count >= 2" object file lineNumber description];
      }
      v8 = [(NSArray *)self->_preprocessingMethods objectAtIndexedSubscript:[(NSArray *)self->_preprocessingMethods count] - 2];
      int v9 = [v8 isEqualToString:@"finalizeForWordPieceCaseInsensitive"];
      int v10 = v9 | [v8 isEqualToString:@"finalizeForWordPieceCaseSensitive"];
      if ((v10 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v14 = v8;
        __int16 v15 = 2112;
        v16 = @"finalizeForWordPieceCaseInsensitive";
        __int16 v17 = 2112;
        v18 = @"finalizeForWordPieceCaseSensitive";
        _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: final preprocessing step %@ is not %@ or %@", buf, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponsesConfig: Strategy PMLHashingVectorizerStrategyWordPiece used but no vocab present", buf, 2u);
      }
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (SGQuickResponsesConfig)initWithLanguage:(id)a3 mode:(unint64_t)a4 dictionary:(id)a5 lazyVocab:(id)a6
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = v12;
  __int16 v15 = v14;
  if (v14)
  {

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v114.receiver = self;
      v114.super_class = (Class)SGQuickResponsesConfig;
      self = [(SGQuickResponsesConfig *)&v114 init];
      if (!self)
      {
LABEL_72:
        self = self;
        v91 = self;
        goto LABEL_46;
      }
      v16 = (void *)MEMORY[0x22A66BDC0]();
      if (a4 == 1)
      {
        id v106 = a3;
        __int16 v17 = [v15 objectForKeyedSubscript:@"PREDICTION_REPLIES"];
        v18 = [v17 objectForKeyedSubscript:v11];
        if (v18)
        {
        }
        else
        {
          v50 = [v15 objectForKeyedSubscript:@"MODEL_HEADS"];
          v51 = [v50 objectForKeyedSubscript:v11];

          if (!v51)
          {
LABEL_39:
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_44;
            }
            *(_DWORD *)buf = 138412290;
            id v117 = v11;
            v89 = &_os_log_internal;
            v90 = "SGQuickResponses: no available configuration found to support prediction for language %@";
LABEL_64:
            _os_log_debug_impl(&dword_226E32000, v89, OS_LOG_TYPE_DEBUG, v90, buf, 0xCu);
            goto LABEL_44;
          }
        }
        v52 = [v15 objectForKeyedSubscript:@"PREDICTION_MODEL_HYPERPARAMETERS"];
        uint64_t v53 = [v52 objectForKeyedSubscript:v11];
        if (v53)
        {
          v54 = (void *)v53;
          v55 = [v15 objectForKeyedSubscript:@"PREDICTION_PREPROCESSING_METHODS"];
          v56 = [v55 objectForKeyedSubscript:v11];

          if (v56)
          {
            v57 = [SGQuickResponsesPredictionParameters alloc];
            v58 = [v15 objectForKeyedSubscript:@"PREDICTION_PARAMETERS"];
            v59 = [(SGQuickResponsesPredictionParameters *)v57 initWithDictionary:v58];

            if (v59)
            {
              predictionParams = self->_predictionParams;
              self->_predictionParams = v59;

              v61 = [SGModelHyperparameters alloc];
              v62 = [v15 objectForKeyedSubscript:@"PREDICTION_MODEL_HYPERPARAMETERS"];
              v63 = [v62 objectForKeyedSubscript:v11];
              v64 = [(SGQuickResponsesPredictionParameters *)self->_predictionParams modelTypeName];
              v65 = [(SGModelHyperparameters *)v61 initWithDictionary:v63 modelTypeName:v64];

              if (v65)
              {
                modelHyperparameters = self->_modelHyperparameters;
                self->_modelHyperparameters = v65;

                v67 = [v15 objectAssertedForKey:@"PREDICTION_PREPROCESSING_METHODS"];
                v68 = [v67 arrayAssertedForKey:v11];

                if (v68)
                {
                  id v104 = v13;
                  context = v16;
                  preprocessingMethods = self->_preprocessingMethods;
                  self->_preprocessingMethods = v68;

                  uint64_t v70 = [v15 objectForKeyedSubscript:@"MODEL_HEADS"];
                  if (!v70) {
                    goto LABEL_55;
                  }
                  v71 = (void *)v70;
                  v72 = [v15 objectForKeyedSubscript:@"MODEL_HEADS"];
                  v73 = [v72 objectForKeyedSubscript:v11];

                  if (v73)
                  {
                    v103 = self;
                    v74 = (NSDictionary *)objc_opt_new();
                    long long v110 = 0u;
                    long long v111 = 0u;
                    long long v112 = 0u;
                    long long v113 = 0u;
                    v75 = [v15 objectForKeyedSubscript:@"MODEL_HEADS"];
                    v76 = [v75 objectForKeyedSubscript:v11];

                    id obj = v76;
                    uint64_t v77 = [v76 countByEnumeratingWithState:&v110 objects:v115 count:16];
                    if (v77)
                    {
                      uint64_t v78 = v77;
                      uint64_t v79 = *(void *)v111;
                      do
                      {
                        for (uint64_t i = 0; i != v78; ++i)
                        {
                          if (*(void *)v111 != v79) {
                            objc_enumerationMutation(obj);
                          }
                          uint64_t v81 = *(void *)(*((void *)&v110 + 1) + 8 * i);
                          v82 = objc_msgSend(v15, "objectForKeyedSubscript:", @"MODEL_HEADS", v103);
                          [v82 objectForKeyedSubscript:v11];
                          v83 = v15;
                          v85 = id v84 = v11;
                          v86 = [v85 objectForKeyedSubscript:v81];

                          id v11 = v84;
                          __int16 v15 = v83;

                          v87 = [[SGModelHead alloc] initWithDictionary:v86 key:v81];
                          [(NSDictionary *)v74 setObject:v87 forKeyedSubscript:v81];
                        }
                        uint64_t v78 = [obj countByEnumeratingWithState:&v110 objects:v115 count:16];
                      }
                      while (v78);
                    }

                    self = v103;
                    modelHeads = (SGQuickResponsesReplies *)v103->_modelHeads;
                    v103->_modelHeads = v74;
                  }
                  else
                  {
LABEL_55:
                    v93 = [v15 objectForKeyedSubscript:@"PREDICTION_REPLIES"];
                    v94 = [v93 objectForKeyedSubscript:v11];
                    v95 = +[SGQuickResponsesReplies repliesWithArray:v94];

                    if (!v95)
                    {
                      id v13 = v104;
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        v48 = &_os_log_internal;
                        v49 = "[SGQuickResponsesReplies repliesWithArray:dict[PREDICTION_REPLIES][language]]";
                        goto LABEL_81;
                      }
                      goto LABEL_44;
                    }
                    modelHeads = self->_replies;
                    self->_replies = v95;
                  }
                  id v13 = v104;

                  v47 = v106;
                  unint64_t v46 = 1;
LABEL_58:
                  v96 = objc_msgSend(v15, "objectForKeyedSubscript:", @"CUSTOM_RESPONSES_PARAMETERS", v103);

                  if (!v96)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v117 = v11;
                      _os_log_debug_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "SGQuickResponses: no available configuration found to support custom responses for language %@", buf, 0xCu);
                    }
                    customResponsesParameters = self->_customResponsesParameters;
                    self->_customResponsesParameters = 0;
                    goto LABEL_70;
                  }
                  v97 = [SGCustomResponsesParameters alloc];
                  v98 = [v15 objectForKeyedSubscript:@"CUSTOM_RESPONSES_PARAMETERS"];
                  v99 = [(SGCustomResponsesParameters *)v97 initWithDictionary:v98];

                  if (v99)
                  {
                    customResponsesParameters = self->_customResponsesParameters;
                    self->_customResponsesParameters = v99;
LABEL_70:
                    v16 = context;

                    objc_storeStrong((id *)&self->_language, v47);
                    self->_mode = v46;
                    v101 = [(SGModelHyperparameters *)self->_modelHyperparameters sessionDescriptorForLanguage:v11];
                    sessionDescriptor = self->_sessionDescriptor;
                    self->_sessionDescriptor = v101;

                    if ([(SGQuickResponsesConfig *)self isValidConfigForWordPieceWithLazyVocab:v13])
                    {
                      goto LABEL_72;
                    }
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_44;
                    }
                    *(_WORD *)buf = 0;
                    v48 = &_os_log_internal;
                    v49 = "[self isValidConfigForWordPieceWithLazyVocab:lazyVocab]";
                    goto LABEL_81;
                  }
                  v16 = context;
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
                  {
                    *(_WORD *)buf = 0;
                    v48 = &_os_log_internal;
                    v49 = "[[SGCustomResponsesParameters alloc] initWithDictionary:dict[CUSTOM_RESPONSES_PARAMETERS]]";
                    goto LABEL_81;
                  }
LABEL_44:
                  goto LABEL_45;
                }
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                  goto LABEL_44;
                }
                *(_WORD *)buf = 0;
                v48 = &_os_log_internal;
                v49 = "[[dict objectAssertedForKey:PREDICTION_PREPROCESSING_METHODS] arrayAssertedForKey:language]";
              }
              else
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                  goto LABEL_44;
                }
                *(_WORD *)buf = 0;
                v48 = &_os_log_internal;
                v49 = "[[SGModelHyperparameters alloc] initWithDictionary:dict[PREDICTION_MODEL_HYPERPARAMETERS][language"
                      "] modelTypeName:_predictionParams.modelTypeName]";
              }
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                goto LABEL_44;
              }
              *(_WORD *)buf = 0;
              v48 = &_os_log_internal;
              v49 = "[[SGQuickResponsesPredictionParameters alloc] initWithDictionary:dict[PREDICTION_PARAMETERS]]";
            }
LABEL_81:
            _os_log_fault_impl(&dword_226E32000, v48, OS_LOG_TYPE_FAULT, v49, buf, 2u);
            goto LABEL_44;
          }
        }
        else
        {
        }
        goto LABEL_39;
      }
      v21 = [v15 objectForKeyedSubscript:@"CLASSIFICATION_LABELS"];
      uint64_t v22 = [v21 objectForKeyedSubscript:v11];
      if (v22)
      {
        v23 = (void *)v22;
        id v107 = a3;
        unint64_t v108 = a4;
        v24 = [v15 objectForKeyedSubscript:@"CLASSIFICATION_MODEL_HYPERPARAMETERS"];
        uint64_t v25 = [v24 objectForKeyedSubscript:v11];
        if (v25)
        {
          v26 = (void *)v25;
          [v15 objectForKeyedSubscript:@"CLASSIFICATION_PREPROCESSING_METHODS"];
          v27 = context = v16;
          v28 = [v27 objectForKeyedSubscript:v11];

          v16 = context;
          if (v28)
          {
            v29 = [SGQuickResponsesClassificationParameters alloc];
            v30 = [v15 objectForKeyedSubscript:@"CLASSIFICATION_PARAMETERS"];
            v31 = [(SGQuickResponsesClassificationParameters *)v29 initWithDictionary:v30 language:v11];

            if (v31)
            {
              v32 = v15;
              id v33 = v13;
              classificationParams = self->_classificationParams;
              self->_classificationParams = v31;

              v35 = [SGModelHyperparameters alloc];
              v36 = [v32 objectForKeyedSubscript:@"CLASSIFICATION_MODEL_HYPERPARAMETERS"];
              v37 = [v36 objectForKeyedSubscript:v11];
              v38 = [(SGModelHyperparameters *)v35 initWithDictionary:v37 modelTypeName:@"quickResponsesEspressoClassifierMultiLabel"];

              if (v38)
              {
                v39 = self->_modelHyperparameters;
                self->_modelHyperparameters = v38;

                v40 = [v32 objectAssertedForKey:@"CLASSIFICATION_PREPROCESSING_METHODS"];
                v41 = [v40 arrayAssertedForKey:v11];

                id v13 = v33;
                if (v41)
                {
                  v42 = self->_preprocessingMethods;
                  self->_preprocessingMethods = v41;

                  v43 = [v32 objectAssertedForKey:@"CLASSIFICATION_LABELS"];
                  v44 = [v43 arrayAssertedForKey:v11];

                  __int16 v15 = v32;
                  if (v44)
                  {
                    labels = self->_labels;
                    self->_labels = v44;

                    v47 = v107;
                    unint64_t v46 = v108;
                    if ([(NSArray *)self->_labels count] <= 0x1000) {
                      goto LABEL_58;
                    }
                    v16 = context;
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_44;
                    }
                    *(_WORD *)buf = 0;
                    v48 = &_os_log_internal;
                    v49 = "SGQuickResponsesConfig: Training class count exceeds maximum";
                  }
                  else
                  {
                    v16 = context;
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_44;
                    }
                    *(_WORD *)buf = 0;
                    v48 = &_os_log_internal;
                    v49 = "[[dict objectAssertedForKey:CLASSIFICATION_LABELS] arrayAssertedForKey:language]";
                  }
                }
                else
                {
                  __int16 v15 = v32;
                  v16 = context;
                  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_44;
                  }
                  *(_WORD *)buf = 0;
                  v48 = &_os_log_internal;
                  v49 = "[[dict objectAssertedForKey:CLASSIFICATION_PREPROCESSING_METHODS] arrayAssertedForKey:language]";
                }
              }
              else
              {
                id v13 = v33;
                __int16 v15 = v32;
                v16 = context;
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                  goto LABEL_44;
                }
                *(_WORD *)buf = 0;
                v48 = &_os_log_internal;
                v49 = "[[SGModelHyperparameters alloc] initWithDictionary:dict[CLASSIFICATION_MODEL_HYPERPARAMETERS][lang"
                      "uage] modelTypeName:SG_QUICK_RESPONSES_MULTICLASS_ESPRESSO_CLASSIFIER]";
              }
            }
            else
            {
              v16 = context;
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                goto LABEL_44;
              }
              *(_WORD *)buf = 0;
              v48 = &_os_log_internal;
              v49 = "[[SGQuickResponsesClassificationParameters alloc] initWithDictionary:dict[CLASSIFICATION_PARAMETERS]"
                    " language:language]";
            }
            goto LABEL_81;
          }
          goto LABEL_43;
        }
      }
LABEL_43:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_44;
      }
      *(_DWORD *)buf = 138412290;
      id v117 = v11;
      v89 = &_os_log_internal;
      v90 = "SGQuickResponses: no available configuration found to support training for language %@";
      goto LABEL_64;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v19 = &_os_log_internal;
      v20 = "[dict isKindOfClass:NSDictionary.class]";
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v19 = &_os_log_internal;
    v20 = "dict";
LABEL_11:
    _os_log_fault_impl(&dword_226E32000, v19, OS_LOG_TYPE_FAULT, v20, buf, 2u);
  }
LABEL_45:
  v91 = 0;
LABEL_46:

  return v91;
}

- (SGQuickResponsesConfig)initWithLanguage:(id)a3 mode:(unint64_t)a4 dictionary:(id)a5 vocab:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [SGLazyInit alloc];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__SGQuickResponsesConfig_initWithLanguage_mode_dictionary_vocab___block_invoke;
  v18[3] = &unk_2647EA150;
  id v19 = v10;
  id v14 = v10;
  __int16 v15 = [(SGLazyInit *)v13 initWithInitializer:v18 destructor:0];
  v16 = [(SGQuickResponsesConfig *)self initWithLanguage:v12 mode:a4 dictionary:v11 lazyVocab:v15];

  return v16;
}

id __65__SGQuickResponsesConfig_initWithLanguage_mode_dictionary_vocab___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (SGQuickResponsesConfig)initWithLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[SGQuickResponsesConfig _dictionaryForPlistPath:v11 mode:a4];
  id v14 = +[SGQuickResponsesConfig _vocabForVocabPath:v12 mode:a4];

  if (v13)
  {
    self = [(SGQuickResponsesConfig *)self initWithLanguage:v10 mode:a4 dictionary:v13 lazyVocab:v14];
    __int16 v15 = self;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v17 = 138412290;
      id v18 = v11;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponses: Invalid plist path %@", (uint8_t *)&v17, 0xCu);
    }
    __int16 v15 = 0;
  }

  return v15;
}

+ (id)configWithLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (![v11 length])
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"SGQuickResponsesConfig.m", 1047, @"Invalid parameter not satisfying: %@", @"language.length" object file lineNumber description];
  }
  id v14 = (void *)MEMORY[0x22A66BDC0]();
  __int16 v15 = +[SGQuickResponsesConfig _cacheKeyForLanguage:v11 mode:a4 plistPath:v12 vocabPath:v13];
  v16 = +[SGQuickResponsesConfig _sharedCache];
  int v17 = [v16 objectForKey:v15];

  if (v17)
  {
    id v18 = v17;
  }
  else
  {
    id v18 = [[SGQuickResponsesConfig alloc] initWithLanguage:v11 mode:a4 plistPath:v12 vocabPath:v13];
    if (v18)
    {
      uint64_t v19 = +[SGQuickResponsesConfig _sharedCache];
      [v19 setObject:v18 forKey:v15];
    }
  }

  return v18;
}

+ (id)modelTypeAndSubModelKeyForLanguage:(id)a3 plistPath:(id)a4 vocabPath:(id)a5 warmupBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (![v11 length])
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"SGQuickResponsesConfig.m", 1008, @"Invalid parameter not satisfying: %@", @"language.length" object file lineNumber description];
  }
  __int16 v15 = (void *)MEMORY[0x22A66BDC0]();
  v16 = +[SGQuickResponsesConfig _cacheKeyForLanguage:v11 mode:1 plistPath:v12 vocabPath:v13];
  int v17 = +[SGQuickResponsesConfig _sharedCache];
  id v18 = [v17 objectForKey:v16];

  v38 = v12;
  v39 = v13;
  v37 = v14;
  if (v18)
  {
    id v19 = objc_alloc(MEMORY[0x263F61EA8]);
    v20 = [v18 predictionParams];
    [v20 modelTypeName];
    uint64_t v22 = v21 = v15;
    v23 = [v18 predictionParams];
    v24 = [v23 subModelKeyString];
    uint64_t v25 = (void *)[v19 initWithFirst:v22 second:v24];

    __int16 v15 = v21;
  }
  else
  {
    v26 = +[SGQuickResponsesConfig _dictionaryForPlistPath:v12 mode:1];
    if (v26)
    {
      v36 = v15;
      if (modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasOnceToken125 != -1) {
        dispatch_once(&modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasOnceToken125, &__block_literal_global_742);
      }
      v27 = (void *)modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasExprOnceResult;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __93__SGQuickResponsesConfig_modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___block_invoke_2;
      block[3] = &unk_2647EA108;
      id v41 = v16;
      id v42 = v13;
      uint64_t v46 = 1;
      id v43 = v11;
      id v28 = v26;
      id v44 = v28;
      id v45 = v14;
      v29 = v27;
      dispatch_block_t v30 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_async(v29, v30);

      v31 = [v28 objectForKeyedSubscript:@"PREDICTION_PARAMETERS"];
      v32 = +[SGQuickResponsesPredictionParameters _modelTypeNameForDictionary:v31];
      id v33 = +[SGQuickResponsesPredictionParameters _subModelKeyStringForDictionary:v31];
      uint64_t v25 = (void *)[objc_alloc(MEMORY[0x263F61EA8]) initWithFirst:v32 second:v33];

      __int16 v15 = v36;
    }
    else
    {
      uint64_t v25 = 0;
    }
  }

  return v25;
}

void __93__SGQuickResponsesConfig_modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___block_invoke_2(void *a1)
{
  v2 = +[SGQuickResponsesConfig _sharedCache];
  id v7 = [v2 objectForKey:a1[4]];

  if (!v7)
  {
    v3 = +[SGQuickResponsesConfig _vocabForVocabPath:a1[5] mode:a1[9]];
    v4 = [[SGQuickResponsesConfig alloc] initWithLanguage:a1[6] mode:a1[9] dictionary:a1[7] lazyVocab:v3];
    if (v4)
    {
      id v5 = +[SGQuickResponsesConfig _sharedCache];
      [v5 setObject:v4 forKey:a1[4]];
    }
  }
  uint64_t v6 = a1[8];
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void __93__SGQuickResponsesConfig_modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___block_invoke()
{
  v0 = (void *)MEMORY[0x22A66BDC0]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.suggestions.quickResponsesConfigWarmup", v1);
  v3 = (void *)modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasExprOnceResult;
  modelTypeAndSubModelKeyForLanguage_plistPath_vocabPath_warmupBlock___pasExprOnceResult = (uint64_t)v2;
}

+ (id)_vocabForVocabPath:(id)a3 mode:(unint64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [SGLazyInit alloc];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__SGQuickResponsesConfig__vocabForVocabPath_mode___block_invoke;
    v10[3] = &unk_2647EA150;
    id v11 = v5;
    id v7 = [(SGLazyInit *)v6 initWithInitializer:v10 destructor:0];
  }
  else
  {
    v8 = [SGLazyInit alloc];
    if (a4 == 1)
    {
      id v7 = [(SGLazyInit *)v8 initWithInitializer:&__block_literal_global_734 destructor:0];
    }
    else
    {
      id v7 = [(SGLazyInit *)v8 initWithInitializer:&__block_literal_global_736 destructor:0];
      +[SGQuickResponsesConfig _addModelAssetUpdateHandler];
    }
  }

  return v7;
}

id __50__SGQuickResponsesConfig__vocabForVocabPath_mode___block_invoke(uint64_t a1)
{
  return +[SGDefaultAssets vocabWithTrieAssetPath:*(void *)(a1 + 32)];
}

id __50__SGQuickResponsesConfig__vocabForVocabPath_mode___block_invoke_3()
{
  return +[SGModelAsset quickResponsesVocab];
}

id __50__SGQuickResponsesConfig__vocabForVocabPath_mode___block_invoke_2()
{
  return +[SGDefaultAssets quickResponsesPredictionVocab];
}

+ (id)_dictionaryForPlistPath:(id)a3 mode:(unint64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = +[SGDefaultAssets dictionaryWithPlistAssetPath:v5];
  }
  else
  {
    if (a4 != 1)
    {
      id v7 = +[SGModelAsset quickResponses];
      +[SGQuickResponsesConfig _addModelAssetUpdateHandler];
      if (v7) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
    uint64_t v6 = +[SGDefaultAssets quickResponsesPrediction];
  }
  id v7 = (void *)v6;
  if (v6) {
    goto LABEL_9;
  }
LABEL_6:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGQuickResponses: Invalid plist path %@", (uint8_t *)&v9, 0xCu);
  }
LABEL_9:

  return v7;
}

+ (void)_addModelAssetUpdateHandler
{
  if (_addModelAssetUpdateHandler_onceToken != -1) {
    dispatch_once(&_addModelAssetUpdateHandler_onceToken, &__block_literal_global_727);
  }
}

uint64_t __53__SGQuickResponsesConfig__addModelAssetUpdateHandler__block_invoke()
{
  return +[SGModelAsset registerOnUpdateBlock:&__block_literal_global_730];
}

void __53__SGQuickResponsesConfig__addModelAssetUpdateHandler__block_invoke_2()
{
  id v0 = +[SGQuickResponsesConfig _sharedCache];
  [v0 removeAllObjects];
}

+ (id)_sharedCache
{
  if (_sharedCache__pasOnceToken123 != -1) {
    dispatch_once(&_sharedCache__pasOnceToken123, &__block_literal_global_720);
  }
  dispatch_queue_t v2 = (void *)_sharedCache__pasExprOnceResult;
  return (id)[v2 result];
}

void __38__SGQuickResponsesConfig__sharedCache__block_invoke()
{
  id v0 = (void *)MEMORY[0x22A66BDC0]();
  uint64_t v1 = [objc_alloc(MEMORY[0x263F61E60]) initWithBlock:&__block_literal_global_724 idleTimeout:600.0];
  dispatch_queue_t v2 = (void *)_sharedCache__pasExprOnceResult;
  _sharedCache__pasExprOnceResult = v1;
}

id __38__SGQuickResponsesConfig__sharedCache__block_invoke_2()
{
  id v0 = (void *)[objc_alloc(MEMORY[0x263F61E50]) initWithCountLimit:6];
  return v0;
}

+ (id)_cacheKeyForLanguage:(id)a3 mode:(unint64_t)a4 plistPath:(id)a5 vocabPath:(id)a6
{
  int v9 = (objc_class *)NSString;
  id v10 = (__CFString *)a6;
  uint64_t v11 = (__CFString *)a5;
  id v12 = a3;
  id v13 = [v9 alloc];
  id v14 = &stru_26DAF9368;
  if (v11) {
    __int16 v15 = v11;
  }
  else {
    __int16 v15 = &stru_26DAF9368;
  }
  if (v10) {
    id v14 = v10;
  }
  v16 = (void *)[v13 initWithFormat:@"%@-%lu-%@-%@", v12, a4, v15, v14];

  return v16;
}

@end