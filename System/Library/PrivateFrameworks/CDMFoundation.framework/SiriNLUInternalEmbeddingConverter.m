@interface SiriNLUInternalEmbeddingConverter
+ (id)convertFromEmbeddingResponseCommand:(id)a3;
+ (id)convertFromProtoEmbeddingResponseCommand:(id)a3;
+ (id)convertFromProtoTensor:(id)a3;
@end

@implementation SiriNLUInternalEmbeddingConverter

+ (id)convertFromProtoTensor:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(NLv4EmbeddingTensor);
    v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "valuesCount"));
    if ([v3 valuesCount])
    {
      unint64_t v6 = 0;
      do
      {
        v7 = NSNumber;
        [v3 valuesAtIndex:v6];
        v8 = objc_msgSend(v7, "numberWithFloat:");
        [v5 addObject:v8];

        ++v6;
      }
      while (v6 < [v3 valuesCount]);
    }
    [(NLv4EmbeddingTensor *)v4 setValues:v5];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromProtoEmbeddingResponseCommand:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = objc_msgSend(v3, "embeddingTensorOutputs", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        if ([v10 isStableEmbeddingsVersion]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v11 = [v10 embeddingTensor];
      uint64_t v12 = [v10 embeddingDim];

      if (!v11) {
        goto LABEL_13;
      }
      v13 = [(id)objc_opt_class() convertFromProtoTensor:v11];
      v14 = [v4 tokenChain];
      v15 = +[CDMTokenizerProtoService tokenChainFromProto:v14];

      v16 = -[CDMEmbeddingResponseCommand initWithTokenChain:embeddingTensor:numTokens:numLayers:embeddingDim:]([CDMEmbeddingResponseCommand alloc], "initWithTokenChain:embeddingTensor:numTokens:numLayers:embeddingDim:", v15, v13, [v4 numToken], objc_msgSend(v4, "numLayer"), v12);
    }
    else
    {
LABEL_10:

LABEL_13:
      v11 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "+[SiriNLUInternalEmbeddingConverter convertFromProtoEmbeddingResponseCommand:]";
        _os_log_error_impl(&dword_2263A0000, v11, OS_LOG_TYPE_ERROR, "%s [ERR]: No stable model version found in embedding response! Returning nil", buf, 0xCu);
      }
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)convertFromEmbeddingResponseCommand:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F71E08]);
    objc_msgSend(v4, "setEmbeddingDim:", objc_msgSend(v3, "embeddingDim"));
    objc_msgSend(v4, "setNumLayer:", objc_msgSend(v3, "numLayers"));
    objc_msgSend(v4, "setNumToken:", objc_msgSend(v3, "numTokens"));
    v5 = [v3 tokenChain];
    uint64_t v6 = +[CDMTokenChain convertCDMTokenChainToProtoTokenChain:v5];
    [v4 setTokenChain:v6];

    uint64_t v7 = [v3 embeddingTensor];

    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F71E78]);
      objc_msgSend(v8, "setEmbeddingDim:", objc_msgSend(v3, "embeddingDim"));
      objc_msgSend(v8, "setNumLayer:", objc_msgSend(v3, "numLayers"));
      objc_msgSend(v8, "setNumToken:", objc_msgSend(v3, "numTokens"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v9 = objc_msgSend(v3, "embeddingTensor", 0);
      v10 = [v9 values];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            [*(id *)(*((void *)&v17 + 1) + 8 * i) floatValue];
            objc_msgSend(v8, "addValues:");
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
        }
        while (v12);
      }

      v15 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "+[SiriNLUInternalEmbeddingConverter convertFromEmbeddingResponseCommand:]";
      }

      [v8 setEmbedderId:@"rdar://72698550"];
      [v4 setEmbeddingTensor:v8];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end