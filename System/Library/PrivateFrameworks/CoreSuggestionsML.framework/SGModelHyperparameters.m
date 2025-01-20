@interface SGModelHyperparameters
+ (unint64_t)strategyForString:(id)a3 modelTypeName:(id)a4;
- (NSString)featuresModelId;
- (NSString)featuresVersion;
- (SGModelHyperparameters)initWithDictionary:(id)a3 modelTypeName:(id)a4;
- (_NSRange)characterNGramRange;
- (_NSRange)tokenNGramRange;
- (id)sessionDescriptorForLanguage:(id)a3;
- (int64_t)vectorNormalization;
- (unint64_t)extraIdOptions;
- (unint64_t)idVectorLength;
- (unint64_t)vectorLength;
- (unint64_t)vectorizerStrategy;
@end

@implementation SGModelHyperparameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresVersion, 0);
  objc_storeStrong((id *)&self->_featuresModelId, 0);
}

- (int64_t)vectorNormalization
{
  return self->_vectorNormalization;
}

- (unint64_t)vectorizerStrategy
{
  return self->_vectorizerStrategy;
}

- (unint64_t)extraIdOptions
{
  return self->_extraIdOptions;
}

- (unint64_t)idVectorLength
{
  return self->_idVectorLength;
}

- (unint64_t)vectorLength
{
  return self->_vectorLength;
}

- (_NSRange)tokenNGramRange
{
  NSUInteger length = self->_tokenNGramRange.length;
  NSUInteger location = self->_tokenNGramRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)characterNGramRange
{
  NSUInteger length = self->_characterNGramRange.length;
  NSUInteger location = self->_characterNGramRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)featuresVersion
{
  return self->_featuresVersion;
}

- (NSString)featuresModelId
{
  return self->_featuresModelId;
}

- (id)sessionDescriptorForLanguage:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:@"VL=%lu&CL=%lu&CH=%lu&TL=%lu&TH=%lu&SN=%lu&IDL=%lu&IDS=%lu&VN=%ld&FV=%@", self->_vectorLength, self->_characterNGramRange.location, self->_characterNGramRange.length + self->_characterNGramRange.location, self->_tokenNGramRange.location, self->_tokenNGramRange.length + self->_tokenNGramRange.location, self->_vectorizerStrategy, self->_idVectorLength, self->_extraIdOptions, self->_vectorNormalization, self->_featuresVersion];
  v7 = [MEMORY[0x263F61978] descriptorForName:self->_featuresModelId version:v6 locale:v5];

  return v7;
}

- (SGModelHyperparameters)initWithDictionary:(id)a3 modelTypeName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = v8;
  if (!v8)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      goto LABEL_53;
    }
    *(_WORD *)buf = 0;
    v22 = &_os_log_internal;
    v23 = "dictionary";
    goto LABEL_52;
  }

  v45.receiver = self;
  v45.super_class = (Class)SGModelHyperparameters;
  self = [(SGModelHyperparameters *)&v45 init];
  if (self)
  {
    v10 = [v9 stringAssertedForKey:@"FEATURES_MODEL_ID"];
    if (v10)
    {
      featuresModelId = self->_featuresModelId;
      self->_featuresModelId = v10;

      v12 = [v9 stringAssertedForKey:@"FEATURES_VERSION"];
      if (v12)
      {
        featuresVersion = self->_featuresVersion;
        self->_featuresVersion = v12;

        v14 = [v9 numberAssertedForKey:@"VECTOR_LENGTH"];
        if (v14)
        {
          v15 = v14;
          self->_vectorLength = [v14 unsignedIntegerValue];

          v16 = [v9 numberAssertedForKey:@"CHARACTER_N_GRAM_MINIMUM_N"];
          if (v16)
          {
            v17 = v16;
            NSUInteger v18 = [v16 unsignedIntegerValue];
            v19 = [v9 numberAssertedForKey:@"CHARACTER_N_GRAM_RANGE_N_LENGTH"];
            if (v19)
            {
              v20 = v19;
              NSUInteger v21 = [v19 unsignedIntegerValue];
              self->_characterNGramRange.NSUInteger location = v18;
              self->_characterNGramRange.NSUInteger length = v21;
            }
            else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "[dictionary numberAssertedForKey:CHARACTER_N_GRAM_RANGE_N_LENGTH]", buf, 2u);
            }

            v24 = [v9 numberAssertedForKey:@"TOKEN_N_GRAM_MINIMUM_N"];
            if (v24)
            {
              v25 = v24;
              NSUInteger v26 = [v24 unsignedIntegerValue];
              v27 = [v9 numberAssertedForKey:@"TOKEN_N_GRAM_RANGE_N_LENGTH"];
              if (v27)
              {
                v28 = v27;
                NSUInteger v29 = [v27 unsignedIntegerValue];
                self->_tokenNGramRange.NSUInteger location = v26;
                self->_tokenNGramRange.NSUInteger length = v29;
              }
              else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "[dictionary numberAssertedForKey:TOKEN_N_GRAM_RANGE_N_LENGTH]", buf, 2u);
              }

              v30 = [v9 stringAssertedForKey:@"VECTORIZER_STRATEGY"];
              self->_vectorizerStrategy = +[SGModelHyperparameters strategyForString:v30 modelTypeName:v7];

              v31 = [v9 numberAssertedForKey:@"ID_VECTOR_LENGTH"];
              uint64_t v32 = [v31 unsignedIntegerValue];
              unint64_t v33 = 200;
              if (v32) {
                unint64_t v33 = v32;
              }
              self->_idVectorLength = v33;

              v34 = [v9 numberAssertedForKey:@"ID_VECTOR_SHOULD_PAD_TO_LENGTH"];
              self->_extraIdOptions |= [v34 BOOLValue];

              v35 = [v9 numberAssertedForKey:@"ID_VECTOR_SHOULD_APPEND_SENTEND"];
              int v36 = [v35 BOOLValue];
              uint64_t v37 = 2;
              if (!v36) {
                uint64_t v37 = 0;
              }
              self->_extraIdOptions |= v37;

              v38 = [v9 numberAssertedForKey:@"ID_VECTOR_SHOULD_APPEND_SENTSTART"];
              int v39 = [v38 BOOLValue];
              uint64_t v40 = 4;
              if (!v39) {
                uint64_t v40 = 0;
              }
              self->_extraIdOptions |= v40;

              v41 = [v9 numberAssertedForKey:@"VECTOR_NORMALIZATION"];
              v42 = v41;
              if (!v41) {
                v41 = &unk_26DB015D0;
              }
              self->_vectorNormalization = [v41 unsignedIntegerValue];

              if ([(NSString *)self->_featuresModelId length])
              {
                if ([(NSString *)self->_featuresVersion length])
                {
                  if (self->_characterNGramRange.length + self->_characterNGramRange.location >= 0x65)
                  {
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_53;
                    }
                    *(_WORD *)buf = 0;
                    v22 = &_os_log_internal;
                    v23 = "NSMaxRange(_characterNGramRange) <= MAXIMUM_NGRAM_LENGTH";
                  }
                  else
                  {
                    if (self->_tokenNGramRange.length + self->_tokenNGramRange.location < 0x65)
                    {
                      if (self->_vectorizerStrategy < 7) {
                        goto LABEL_41;
                      }
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        v22 = &_os_log_internal;
                        v23 = "_vectorizerStrategy < PMLHashingVectorizerStrategyLimit";
                        goto LABEL_52;
                      }
LABEL_53:
                      v43 = 0;
                      goto LABEL_54;
                    }
                    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                      goto LABEL_53;
                    }
                    *(_WORD *)buf = 0;
                    v22 = &_os_log_internal;
                    v23 = "NSMaxRange(_tokenNGramRange) <= MAXIMUM_NGRAM_LENGTH";
                  }
                }
                else
                {
                  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                    goto LABEL_53;
                  }
                  *(_WORD *)buf = 0;
                  v22 = &_os_log_internal;
                  v23 = "_featuresVersion.length > 0";
                }
              }
              else
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                  goto LABEL_53;
                }
                *(_WORD *)buf = 0;
                v22 = &_os_log_internal;
                v23 = "_featuresModelId.length > 0";
              }
            }
            else
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                goto LABEL_53;
              }
              *(_WORD *)buf = 0;
              v22 = &_os_log_internal;
              v23 = "[dictionary numberAssertedForKey:TOKEN_N_GRAM_MINIMUM_N]";
            }
          }
          else
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
              goto LABEL_53;
            }
            *(_WORD *)buf = 0;
            v22 = &_os_log_internal;
            v23 = "[dictionary numberAssertedForKey:CHARACTER_N_GRAM_MINIMUM_N]";
          }
        }
        else
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
            goto LABEL_53;
          }
          *(_WORD *)buf = 0;
          v22 = &_os_log_internal;
          v23 = "[dictionary numberAssertedForKey:VECTOR_LENGTH]";
        }
      }
      else
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
          goto LABEL_53;
        }
        *(_WORD *)buf = 0;
        v22 = &_os_log_internal;
        v23 = "[dictionary stringAssertedForKey:FEATURES_VERSION]";
      }
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        goto LABEL_53;
      }
      *(_WORD *)buf = 0;
      v22 = &_os_log_internal;
      v23 = "[dictionary stringAssertedForKey:FEATURES_MODEL_ID]";
    }
LABEL_52:
    _os_log_fault_impl(&dword_226E32000, v22, OS_LOG_TYPE_FAULT, v23, buf, 2u);
    goto LABEL_53;
  }
LABEL_41:
  self = self;
  v43 = self;
LABEL_54:

  return v43;
}

+ (unint64_t)strategyForString:(id)a3 modelTypeName:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = [v7 UTF8String];
  if (v8)
  {
    v9 = (const char *)v8;
    unint64_t v10 = 0;
    while (strcmp(v9, off_2647EA000[v10]))
    {
      if (++v10 == 7)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
          goto LABEL_13;
        }
        int v14 = 138412290;
        id v15 = v7;
        v11 = &_os_log_internal;
        v12 = "Unknown strategy string %@ when initializing SGQuickResponsesConfig from plist.";
        goto LABEL_12;
      }
    }
  }
  else if ([v6 isEqualToString:@"quickResponsesBinaryLogisticMultiLabel"])
  {
    unint64_t v10 = 0;
  }
  else
  {
    if (([v6 isEqualToString:@"quickResponsesEspressoClassifierMultiLabel"] & 1) == 0
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      v11 = &_os_log_internal;
      v12 = "Unknown model type name %@ when initializing SGQuickResponsesConfig from plist.";
LABEL_12:
      _os_log_fault_impl(&dword_226E32000, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v14, 0xCu);
    }
LABEL_13:
    unint64_t v10 = 4;
  }

  return v10;
}

@end