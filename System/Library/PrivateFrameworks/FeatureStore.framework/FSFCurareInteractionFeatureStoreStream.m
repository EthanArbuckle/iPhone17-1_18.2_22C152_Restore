@interface FSFCurareInteractionFeatureStoreStream
+ (BOOL)createError:(id)a3 error:(id *)a4;
- (BOOL)deleteCurrentStream;
- (BOOL)insert:(id)a3 error:(id *)a4;
- (FSFCurareInteractionFeatureStoreStream)initWithStreamId:(id)a3;
- (id)retrieve:(id)a3;
- (id)retrieveWithInteractionWrapper:(id)a3;
- (void)retrieve:(id)a3 completionHandler:(id)a4;
- (void)retrieveWithInteractionWrapper:(id)a3 completionHandler:(id)a4;
@end

@implementation FSFCurareInteractionFeatureStoreStream

- (BOOL)insert:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!+[FSFUtils isSupportedPlatform])
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
LABEL_13:
    char v14 = 0;
    goto LABEL_14;
  }
  if (+[FSFUtils isUnderLegalRestriction])
  {
    v7 = objc_opt_class();
    v8 = @"Does not insert into FeatureStore: under privacy restriction";
LABEL_12:
    [v7 createError:v8 error:a4];
    NSLog(&stru_26CE41A30.isa, v8);
    goto LABEL_13;
  }
  v9 = [v6 interactionId];

  if (!v9)
  {
    v7 = objc_opt_class();
    v8 = @"Failed to Insert into FeatureStore: Nil InteractionID";
    goto LABEL_12;
  }
  v10 = [v6 serialize];

  if (!v10)
  {
    v7 = objc_opt_class();
    v8 = @"Failed to Insert into FeatureStore: Nil Serialized Data";
    goto LABEL_12;
  }
  v11 = [[_CurareInternalBiomeFeature alloc] initWithCurareInteraction:v6];
  biomeStream = self->_biomeStream;
  v13 = [v6 interactionId];
  char v14 = [(FSFFeatureStoreStream *)biomeStream insert:v11 withInteractionId:v13 atTime:CFAbsoluteTimeGetCurrent()];

  if ((v14 & 1) == 0)
  {
    [(id)objc_opt_class() createError:@"Failed to Insert into FeatureStore: Biome returned false." error:a4];
    NSLog(&stru_26CE41A30.isa, @"Failed to Insert into FeatureStore: Biome returned false.");
  }

LABEL_14:
  return v14;
}

+ (BOOL)createError:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08320];
    v12[0] = a3;
    id v6 = NSDictionary;
    id v7 = a3;
    v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
    v9 = [v5 errorWithDomain:@"FSFCurareInteractionStreamErrorDomain" code:1 userInfo:v8];

    *a4 = v9;
  }
  return a4 != 0;
}

- (id)retrieveWithInteractionWrapper:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v45 = a3;
  if (+[FSFUtils isSupportedPlatform])
  {
    v4 = [(FSFFeatureStoreStream *)self->_biomeStream retrieveEvents:0 startDate:0 endDate:0];
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v47;
      *(void *)&long long v7 = 138412546;
      long long v40 = v7;
      v41 = v5;
      uint64_t v42 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v47 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "eventBody", v40);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          char v14 = [v11 eventBody];
          if (isKindOfClass)
          {
            v44 = [FSFFeatureStoreBiomeEvent alloc];
            v15 = [v14 content];
            v16 = [v15 objectForKeyedSubscript:@"interactionId"];
            v17 = [v14 content];
            v18 = [v17 objectForKeyedSubscript:@"feature"];
            v19 = +[FSFUtils getDataFromBase64EncodedStr:v18];
            uint64_t v20 = v8;
            uint64_t v21 = [v14 dataVersion];
            [v11 timestamp];
            uint64_t v22 = v21;
            uint64_t v8 = v20;
            v23 = -[FSFFeatureStoreBiomeEvent initWithInteractionId:featureData:dataVersion:timestamp:](v44, "initWithInteractionId:featureData:dataVersion:timestamp:", v16, v19, v22);

            v5 = v41;
            uint64_t v9 = v42;
          }
          else
          {
            objc_opt_class();
            char v24 = objc_opt_isKindOfClass();

            if (v24)
            {
              v23 = [v11 eventBody];
            }
            else
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                v34 = [v11 eventBody];
                v35 = (objc_class *)objc_opt_class();
                v36 = NSStringFromClass(v35);
                [v11 eventBody];
                v38 = uint64_t v37 = v8;
                *(_DWORD *)buf = v40;
                v51 = v36;
                __int16 v52 = 2112;
                v53 = v38;
                _os_log_error_impl(&dword_21D935000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Fetched event body is unexpected class %@. Skipping. Event body:\n%@", buf, 0x16u);

                uint64_t v8 = v37;
              }
              v23 = 0;
            }
          }
          if (!v45
            || ([(FSFFeatureStoreBiomeEvent *)v23 interactionId],
                v25 = objc_claimAutoreleasedReturnValue(),
                int v26 = [v45 containsObject:v25],
                v25,
                v26))
          {
            v27 = [(FSFFeatureStoreBiomeEvent *)v23 featureData];

            if (v27)
            {
              v28 = [(FSFFeatureStoreBiomeEvent *)v23 interactionId];
              v29 = [v5 objectForKeyedSubscript:v28];

              if (!v29)
              {
                id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
                v31 = [(FSFFeatureStoreBiomeEvent *)v23 interactionId];
                [v5 setObject:v30 forKeyedSubscript:v31];
              }
              v32 = [(FSFFeatureStoreBiomeEvent *)v23 interactionId];
              v33 = [v5 objectForKeyedSubscript:v32];
              [v33 addObject:v23];
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    v5 = 0;
  }

  return v5;
}

- (void)retrieveWithInteractionWrapper:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    uint64_t v6 = (void (**)(id, id))a4;
    id v7 = [(FSFCurareInteractionFeatureStoreStream *)self retrieveWithInteractionWrapper:a3];
    v6[2](v6, v7);
  }
}

- (id)retrieve:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [(FSFCurareInteractionFeatureStoreStream *)self retrieveWithInteractionWrapper:a3];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v17 = v3;
    id v5 = v3;
    uint64_t v19 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v5);
          }
          uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v9 = [v5 objectForKeyedSubscript:v7];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v21 != v12) {
                  objc_enumerationMutation(v9);
                }
                char v14 = [*(id *)(*((void *)&v20 + 1) + 8 * j) featureData];
                [v8 addObject:v14];
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v11);
          }

          [v4 setObject:v8 forKeyedSubscript:v7];
        }
        uint64_t v19 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v19);
    }

    id v15 = v4;
    v3 = v17;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)retrieve:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    uint64_t v6 = (void (**)(id, id))a4;
    id v7 = [(FSFCurareInteractionFeatureStoreStream *)self retrieve:a3];
    v6[2](v6, v7);
  }
}

- (BOOL)deleteCurrentStream
{
  return [(FSFFeatureStoreStream *)self->_biomeStream deleteCurrentStream];
}

- (FSFCurareInteractionFeatureStoreStream)initWithStreamId:(id)a3
{
  id v4 = a3;
  if (+[FSFUtils isSupportedPlatform])
  {
    v11.receiver = self;
    v11.super_class = (Class)FSFCurareInteractionFeatureStoreStream;
    id v5 = [(FSFCurareInteractionFeatureStoreStream *)&v11 init];
    if (v5)
    {
      uint64_t v6 = +[FSFBiomeFeatureStore singletonInstance];
      uint64_t v7 = [v6 getStream:v4];
      biomeStream = v5->_biomeStream;
      v5->_biomeStream = (FSFFeatureStoreStream *)v7;
    }
    self = v5;
    uint64_t v9 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    uint64_t v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end