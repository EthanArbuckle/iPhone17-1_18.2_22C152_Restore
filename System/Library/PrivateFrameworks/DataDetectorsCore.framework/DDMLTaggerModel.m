@interface DDMLTaggerModel
+ (id)_buildTokenToLabelMap:(id)a3 supportedTypes:(id *)a4;
+ (id)currentTaggerModel;
+ (void)setCurrentTaggerModel:(id)a3;
- (DDMLTaggerModel)initWithEmbeddingLocale:(id)a3 modelDictionary:(id)a4 baseURL:(id)a5;
- (MontrealNeuralNetwork)taggerModel;
- (NSArray)supportedTypes;
- (NSDictionary)tokenLabelMap;
- (NSError)error;
- (NSLocale)embeddingLocale;
- (id)tokenTypeForValue:(int64_t)a3;
- (void)dealloc;
@end

@implementation DDMLTaggerModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);
  objc_storeStrong((id *)&self->_tokenLabelMap, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_embeddingLocale, 0);
}

- (NSArray)supportedTypes
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)tokenLabelMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (NSLocale)embeddingLocale
{
  return (NSLocale *)objc_getProperty(self, a2, 16, 1);
}

- (MontrealNeuralNetwork)taggerModel
{
  return self->_taggerModel;
}

- (id)tokenTypeForValue:(int64_t)a3
{
  v5 = [(DDMLTaggerModel *)self tokenLabelMap];

  if (v5)
  {
    v6 = [(DDMLTaggerModel *)self tokenLabelMap];
    v7 = [NSNumber numberWithInteger:a3];
    v8 = [v6 objectForKeyedSubscript:v7];
  }
  else
  {
    v8 = [[DDMLTokenType alloc] initWithClassification:10 beginning:0];
  }

  return v8;
}

- (void)dealloc
{
  taggerModel = self->_taggerModel;
  if (taggerModel) {
    CFRelease(taggerModel);
  }
  v4.receiver = self;
  v4.super_class = (Class)DDMLTaggerModel;
  [(DDMLTaggerModel *)&v4 dealloc];
}

- (DDMLTaggerModel)initWithEmbeddingLocale:(id)a3 modelDictionary:(id)a4 baseURL:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)DDMLTaggerModel;
  v12 = [(DDMLTaggerModel *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_embeddingLocale, a3);
    id v26 = 0;
    uint64_t v14 = [(id)objc_opt_class() _buildTokenToLabelMap:v10 supportedTypes:&v26];
    id v15 = v26;
    id v16 = v26;
    tokenLabelMap = v13->_tokenLabelMap;
    v13->_tokenLabelMap = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_supportedTypes, v15);
    v18 = [v10 objectForKeyedSubscript:@"modelFile"];
    v19 = [v11 URLByAppendingPathComponent:v18];
    if (v19)
    {
      double Helper_x8__kMRLNeuralNetworkOptionModelURLKey = gotLoadHelper_x8__kMRLNeuralNetworkOptionModelURLKey(v20);
      uint64_t v28 = **(void **)(v22 + 3832);
      v29[0] = v19;
      v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1, Helper_x8__kMRLNeuralNetworkOptionModelURLKey);
      v13->_taggerModel = (MontrealNeuralNetwork *)MRLNeuralNetworkCreate_delayInitStub(v24);
    }
  }

  return v13;
}

+ (id)_buildTokenToLabelMap:(id)a3 supportedTypes:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  if (a4) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  else {
    id v7 = 0;
  }
  v8 = [v5 objectForKeyedSubscript:@"outputMap"];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __56__DDMLTaggerModel__buildTokenToLabelMap_supportedTypes___block_invoke;
  v17 = &unk_1E5985290;
  id v9 = v6;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:&v14];
  if (a4)
  {
    objc_msgSend(v10, "allObjects", v14, v15, v16, v17, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v19;
  id v12 = v9;

  return v12;
}

void __56__DDMLTaggerModel__buildTokenToLabelMap_supportedTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v6 isEqualToString:@"b-address"] & 1) != 0
    || ([v6 isEqualToString:@"B-ADDR"] & 1) != 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    if (([v6 isEqualToString:@"i-address"] & 1) != 0
      || ([v6 isEqualToString:@"I-ADDR"] & 1) != 0)
    {
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      goto LABEL_5;
    }
    if ([v6 isEqualToString:@"b-airline_name"])
    {
      uint64_t v7 = 2;
    }
    else
    {
      if ([v6 isEqualToString:@"i-airline_name"])
      {
        uint64_t v8 = 0;
        uint64_t v7 = 2;
        goto LABEL_5;
      }
      if ([v6 isEqualToString:@"b-currency_amount"])
      {
        uint64_t v7 = 4;
      }
      else
      {
        if ([v6 isEqualToString:@"i-currency_amount"])
        {
          uint64_t v8 = 0;
          uint64_t v7 = 4;
          goto LABEL_5;
        }
        if ([v6 isEqualToString:@"b-event"])
        {
          uint64_t v7 = 5;
        }
        else
        {
          if ([v6 isEqualToString:@"i-event"])
          {
            uint64_t v8 = 0;
            uint64_t v7 = 5;
            goto LABEL_5;
          }
          if ([v6 isEqualToString:@"b-physical_unit"])
          {
            uint64_t v7 = 6;
          }
          else
          {
            if ([v6 isEqualToString:@"i-physical_unit"])
            {
              uint64_t v8 = 0;
              uint64_t v7 = 6;
              goto LABEL_5;
            }
            if (([v6 isEqualToString:@"b-recurring_event"] & 1) == 0)
            {
              if ([v6 isEqualToString:@"i-recurring_event"])
              {
                uint64_t v8 = 0;
                uint64_t v7 = 7;
                goto LABEL_5;
              }
              if (([v6 isEqualToString:@"O"] & 1) == 0
                && ([v6 isEqualToString:@"NONE"] & 1) == 0)
              {
                if ([v6 isEqualToString:@"b-flight_number"])
                {
                  uint64_t v7 = 3;
                  goto LABEL_4;
                }
                if ([v6 isEqualToString:@"i-flight_number"])
                {
                  uint64_t v8 = 0;
                  uint64_t v7 = 3;
                  goto LABEL_5;
                }
                if ([v6 isEqualToString:@"b-phone_number"])
                {
                  uint64_t v7 = 8;
                  goto LABEL_4;
                }
                if ([v6 isEqualToString:@"i-phone_number"])
                {
                  uint64_t v8 = 0;
                  uint64_t v7 = 8;
                  goto LABEL_5;
                }
                if (DDLogHandle_onceToken != -1) {
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
                }
                id v16 = (id)DDLogHandle_error_log_handle;
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  int v17 = 138412290;
                  id v18 = v6;
                  _os_log_error_impl(&dword_19DC95000, v16, OS_LOG_TYPE_ERROR, "unexpected ML tag type %@", (uint8_t *)&v17, 0xCu);
                }
              }
              uint64_t v8 = 0;
              int v9 = 0;
              uint64_t v7 = 10;
              goto LABEL_6;
            }
            uint64_t v7 = 7;
          }
        }
      }
    }
  }
LABEL_4:
  uint64_t v8 = 1;
LABEL_5:
  int v9 = 1;
LABEL_6:
  uint64_t v10 = (int)[v5 intValue];
  id v11 = [[DDMLTokenType alloc] initWithClassification:v7 beginning:v8];
  id v12 = *(void **)(a1 + 32);
  v13 = [NSNumber numberWithInteger:v10];
  [v12 setObject:v11 forKeyedSubscript:v13];

  if (v9)
  {
    uint64_t v14 = *(void **)(a1 + 40);
    if (v14)
    {
      uint64_t v15 = [NSNumber numberWithUnsignedInt:v7];
      [v14 addObject:v15];
    }
  }
}

+ (void)setCurrentTaggerModel:(id)a3
{
}

+ (id)currentTaggerModel
{
  return (id)_currentTaggerModel;
}

@end