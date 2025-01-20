@interface VSPluginTTSDurationEstimation
- (SATTSEstimateTTSRequestDuration)request;
- (VSPluginTTSDurationEstimation)initWithDictionary:(id)a3;
- (void)performWithCompletion:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation VSPluginTTSDurationEstimation

- (void).cxx_destruct
{
}

- (void)setRequest:(id)a3
{
}

- (SATTSEstimateTTSRequestDuration)request
{
  return self->_request;
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  v5 = VSGetLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(VSPluginTTSDurationEstimation *)self request];
    v7 = [(VSPluginTTSDurationEstimation *)self request];
    v8 = [v7 texts];
    *(_DWORD *)buf = 138412546;
    v47 = v6;
    __int16 v48 = 2112;
    id v49 = v8;
    _os_log_impl(&dword_229253000, v5, OS_LOG_TYPE_DEFAULT, "VSPluginTTSDurationEstimation, %@, texts: %@", buf, 0x16u);
  }
  if (v4)
  {
    v9 = [(VSPluginTTSDurationEstimation *)self request];

    if (!v9) {
      v4[2](v4, MEMORY[0x263EFFA78]);
    }
    v37 = v4;
    v10 = (void *)MEMORY[0x263EFF960];
    v11 = [(VSPluginTTSDurationEstimation *)self request];
    v12 = [v11 locale];
    uint64_t v13 = [v10 localeWithLocaleIdentifier:v12];

    v36 = (void *)v13;
    v39 = (void *)[objc_alloc(MEMORY[0x263F28640]) initWithLocale:v13];
    [v39 setHandleTTSCodes:1];
    id v35 = objc_alloc_init(MEMORY[0x263F64E78]);
    v14 = [MEMORY[0x263EFF980] array];
    id v15 = objc_alloc_init(MEMORY[0x263F84EA0]);
    id v16 = objc_alloc_init(MEMORY[0x263F84E98]);
    v17 = (void *)MEMORY[0x263F84EC0];
    v18 = [(VSPluginTTSDurationEstimation *)self request];
    v19 = [v18 gender];
    objc_msgSend(v16, "setGender:", objc_msgSend(v17, "genderFromString:", v19));

    v20 = [(VSPluginTTSDurationEstimation *)self request];
    v21 = [v20 locale];
    [v16 setLanguageCode:v21];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v22 = [(VSPluginTTSDurationEstimation *)self request];
    v23 = [v22 texts];

    id obj = v23;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v41 + 1) + 8 * v27);
          id v40 = 0;
          v29 = [v39 parseStringWithFormat:v28 error:&v40];
          id v30 = v40;
          if (v30)
          {
            v31 = VSGetLogDefault();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v47 = v28;
              __int16 v48 = 2112;
              id v49 = v30;
              _os_log_error_impl(&dword_229253000, v31, OS_LOG_TYPE_ERROR, "Unable to parse text: '%@', error: %@", buf, 0x16u);
            }

            id v32 = v28;
            v29 = v32;
          }
          [v16 setText:v29];
          [v15 estimateDurationOfRequest:v16];
          v33 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v14 addObject:v33];

          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v25);
    }

    [v35 setDurations:v14];
    v34 = [v35 dictionary];
    v4 = v37;
    ((void (**)(id, void *))v37)[2](v37, v34);
  }
}

- (VSPluginTTSDurationEstimation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSPluginTTSDurationEstimation;
  v5 = [(VSPluginTTSDurationEstimation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F64E70]) initWithDictionary:v4];
    request = v5->_request;
    v5->_request = (SATTSEstimateTTSRequestDuration *)v6;
  }
  return v5;
}

@end