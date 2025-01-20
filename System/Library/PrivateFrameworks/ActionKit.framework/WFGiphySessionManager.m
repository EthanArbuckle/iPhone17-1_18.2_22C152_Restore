@interface WFGiphySessionManager
- (NSString)apiKey;
- (NSURL)baseURL;
- (NSURLSession)session;
- (WFGiphySessionManager)init;
- (WFGiphySessionManager)initWithSessionConfiguration:(id)a3;
- (void)random:(id)a3;
- (void)search:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)sendRequestWithPath:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)setApiKey:(id)a3;
- (void)trendingWithLimit:(unint64_t)a3 completion:(id)a4;
@end

@implementation WFGiphySessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_apiKey, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setApiKey:(id)a3
{
}

- (NSString)apiKey
{
  return self->_apiKey;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)sendRequestWithPath:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[a4 mutableCopy];
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_opt_new();
  }
  v13 = v12;

  v14 = [(WFGiphySessionManager *)self apiKey];
  [v13 setValue:v14 forKey:@"api_key"];

  v15 = (void *)MEMORY[0x263F08BA0];
  v16 = [(WFGiphySessionManager *)self baseURL];
  v17 = [v16 URLByAppendingPathComponent:v9];

  v18 = [v15 componentsWithURL:v17 resolvingAgainstBaseURL:0];

  v19 = objc_msgSend(NSURL, "dc_queryStringWithQueryDictionary:", v13);
  [v18 setPercentEncodedQuery:v19];

  v20 = [(WFGiphySessionManager *)self session];
  v21 = [v18 URL];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __67__WFGiphySessionManager_sendRequestWithPath_parameters_completion___block_invoke;
  v24[3] = &unk_264E5EC38;
  id v25 = v8;
  id v22 = v8;
  v23 = [v20 dataTaskWithURL:v21 completionHandler:v24];
  [v23 resume];
}

void __67__WFGiphySessionManager_sendRequestWithPath_parameters_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v51 = a1;
    id v67 = v7;
    id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:1 error:&v67];
    id v9 = v67;

    if (v8)
    {
      v52 = v9;
      v50 = v8;
      v10 = [v8 objectForKey:@"data"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v10 objectForKey:@"image_original_url"];

        if (v11)
        {
          id v49 = v6;
          [v10 removeObjectForKey:@"image_original_url"];
          id v12 = objc_opt_new();
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          uint64_t v55 = [&unk_26F076938 countByEnumeratingWithState:&v63 objects:v69 count:16];
          if (v55)
          {
            uint64_t v53 = *(void *)v64;
            v54 = v12;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v64 != v53) {
                  objc_enumerationMutation(&unk_26F076938);
                }
                uint64_t v56 = v13;
                v14 = *(void **)(*((void *)&v63 + 1) + 8 * v13);
                v15 = objc_opt_new();
                long long v59 = 0u;
                long long v60 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                v16 = [v10 allKeys];
                v17 = (void *)MEMORY[0x263F08A98];
                v18 = [v14 stringByAppendingString:@"_"];
                v19 = [v17 predicateWithFormat:@"SELF BEGINSWITH %@", v18];
                v20 = [v16 filteredArrayUsingPredicate:v19];

                uint64_t v21 = [v20 countByEnumeratingWithState:&v59 objects:v68 count:16];
                if (v21)
                {
                  uint64_t v22 = v21;
                  uint64_t v23 = *(void *)v60;
                  do
                  {
                    for (uint64_t i = 0; i != v22; ++i)
                    {
                      if (*(void *)v60 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      id v25 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                      v26 = [v10 objectForKey:v25];
                      v27 = objc_msgSend(v25, "substringFromIndex:", objc_msgSend(v14, "length") + 1);
                      [v15 setObject:v26 forKey:v27];

                      [v10 removeObjectForKey:v25];
                    }
                    uint64_t v22 = [v20 countByEnumeratingWithState:&v59 objects:v68 count:16];
                  }
                  while (v22);
                }

                v28 = [v15 objectForKey:@"still_url"];

                id v12 = v54;
                if (v28)
                {
                  v29 = objc_opt_new();
                  v30 = [v15 objectForKey:@"still_url"];
                  [v29 setValue:v30 forKey:@"url"];

                  v31 = [v15 objectForKey:@"width"];
                  [v29 setValue:v31 forKey:@"width"];

                  v32 = [v15 objectForKey:@"height"];
                  [v29 setValue:v32 forKey:@"height"];

                  v33 = [v14 stringByAppendingString:@"_still"];
                  [v54 setObject:v29 forKey:v33];

                  [v15 removeObjectForKey:@"still_url"];
                }
                v34 = [v15 objectForKey:@"mp4_url"];

                if (v34)
                {
                  v35 = [v15 objectForKey:@"mp4_url"];
                  [v15 setObject:v35 forKey:@"mp4"];

                  [v15 removeObjectForKey:@"mp4_url"];
                }
                if ([v15 count]) {
                  [v54 setObject:v15 forKey:v14];
                }

                uint64_t v13 = v56 + 1;
              }
              while (v56 + 1 != v55);
              uint64_t v55 = [&unk_26F076938 countByEnumeratingWithState:&v63 objects:v69 count:16];
            }
            while (v55);
          }
          v36 = [v12 objectForKey:@"image"];

          if (v36)
          {
            v37 = [v12 objectForKey:@"image"];
            [v12 setObject:v37 forKey:@"original"];

            [v12 removeObjectForKey:@"image"];
          }
          v38 = [v10 objectForKey:@"images"];
          [v12 addEntriesFromDictionary:v38];

          [v10 setObject:v12 forKey:@"images"];
          id v6 = v49;
        }
      }
      if (*(void *)(v51 + 32))
      {
        v39 = [v50 objectForKey:@"data"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v41 = *(void *)(v51 + 32);
        v42 = (void *)MEMORY[0x263F86840];
        uint64_t v43 = objc_opt_class();
        if (isKindOfClass)
        {
          v58 = v52;
          v44 = [v42 modelsOfClass:v43 fromJSONArray:v39 error:&v58];
          v45 = v58;
        }
        else
        {
          v57 = v52;
          v44 = [v42 modelOfClass:v43 fromJSONDictionary:v39 error:&v57];
          v45 = v57;
        }
        id v48 = v45;

        (*(void (**)(uint64_t, void *, id))(v41 + 16))(v41, v44, v48);
        v52 = v48;
      }
      id v8 = v50;
      id v9 = v52;
    }
    else
    {
      uint64_t v47 = *(void *)(v51 + 32);
      if (v47) {
        (*(void (**)(uint64_t, void, id))(v47 + 16))(v47, 0, v9);
      }
    }

    id v7 = v9;
  }
  else
  {
    uint64_t v46 = *(void *)(a1 + 32);
    if (v46) {
      (*(void (**)(uint64_t, void, id))(v46 + 16))(v46, 0, v7);
    }
  }
}

- (void)search:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v13 = (id)objc_opt_new();
  [v13 setValue:v9 forKey:@"q"];

  if (a4)
  {
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
    [v13 setValue:v10 forKey:@"limit"];
  }
  v11 = [MEMORY[0x263EFF960] currentLocale];
  id v12 = [v11 languageCode];
  [v13 setValue:v12 forKey:@"lang"];

  [(WFGiphySessionManager *)self sendRequestWithPath:@"gifs/search" parameters:v13 completion:v8];
}

- (void)trendingWithLimit:(unint64_t)a3 completion:(id)a4
{
  id v8 = a4;
  id v6 = objc_opt_new();
  if (a3)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
    [v6 setValue:v7 forKey:@"limit"];
  }
  [(WFGiphySessionManager *)self sendRequestWithPath:@"gifs/trending" parameters:v6 completion:v8];
}

- (void)random:(id)a3
{
}

- (WFGiphySessionManager)initWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFGiphySessionManager;
  v5 = [(WFGiphySessionManager *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFC640];
    id v7 = v4;
    if (!v4)
    {
      id v7 = objc_msgSend(MEMORY[0x263EFC648], "wf_defaultSessionConfiguration");
    }
    id v8 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v9 = [v6 sessionWithConfiguration:v7 delegate:v5 delegateQueue:v8];
    session = v5->_session;
    v5->_session = (NSURLSession *)v9;

    if (!v4) {
    uint64_t v11 = [NSURL URLWithString:@"https://api.giphy.com/v1"];
    }
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v11;
  }
  return v5;
}

- (WFGiphySessionManager)init
{
  return [(WFGiphySessionManager *)self initWithSessionConfiguration:0];
}

@end