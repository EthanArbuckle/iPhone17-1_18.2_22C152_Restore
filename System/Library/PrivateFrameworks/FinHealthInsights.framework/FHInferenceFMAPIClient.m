@interface FHInferenceFMAPIClient
- (FHInferenceControllerDelegate)delegate;
- (FHInferenceFMAPIClient)initWithDelegate:(id)a3 acDawTicket:(id)a4;
- (NSString)acDawTicket;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)sendPromptWithAlternatingRoles:(id)a3 modelId:(int64_t)a4 temperature:(float)a5;
- (void)setAcDawTicket:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FHInferenceFMAPIClient

- (FHInferenceFMAPIClient)initWithDelegate:(id)a3 acDawTicket:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FHInferenceFMAPIClient;
  v8 = [(FHInferenceFMAPIClient *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_acDawTicket, a4);
    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v9;
}

- (void)sendPromptWithAlternatingRoles:(id)a3 modelId:(int64_t)a4 temperature:(float)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void *)MEMORY[0x263F08BF8];
  v10 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  objc_super v11 = [MEMORY[0x263F08A48] mainQueue];
  v12 = [v9 sessionWithConfiguration:v10 delegate:self delegateQueue:v11];

  if ((unint64_t)a4 > 2)
  {
    v14 = 0;
LABEL_7:
    [v12 invalidateAndCancel];
    goto LABEL_8;
  }
  id v13 = *(id *)qword_265317EC8[a4];
  v14 = v13;
  if (!v8 || !v13 || ![v8 count]) {
    goto LABEL_7;
  }
  v24 = @"temperature";
  *(float *)&double v15 = a5;
  v16 = [NSNumber numberWithFloat:v15];
  v25[0] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];

  v18 = [NSString stringWithFormat:@"acack=%@", self->_acDawTicket];
  id v19 = objc_alloc_init(MEMORY[0x263F089E0]);
  [v19 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v19 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [v19 setHTTPMethod:@"POST"];
  [v19 setValue:v18 forHTTPHeaderField:@"Cookie"];
  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v20 setObject:v14 forKey:@"model"];
  [v20 setObject:v8 forKey:@"messages"];
  [v20 setObject:v17 forKey:@"options"];
  [v20 setObject:MEMORY[0x263EFFA80] forKey:@"enable_logging"];
  v21 = [NSURL URLWithString:*MEMORY[0x263F3C7C8]];
  [v19 setURL:v21];

  v22 = [MEMORY[0x263F08900] dataWithJSONObject:v20 options:0 error:0];
  [v19 setHTTPBody:v22];
  v23 = [v12 dataTaskWithRequest:v19];
  [v23 resume];

LABEL_8:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v13 = (void (**)(id, uint64_t))a6;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)p_delegate);
      [v12 inferenceDidBegin];
    }
  }
  v13[2](v13, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v28 = a4;
  id v32 = a5;
  id v8 = (void *)[[NSString alloc] initWithData:v32 encoding:4];
  v9 = [MEMORY[0x263F08708] newlineCharacterSet];
  v27 = v8;
  id v10 = [v8 componentsSeparatedByCharactersInSet:v9];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = 0;
    uint64_t v14 = *(void *)v35;
    location = (id *)&self->_delegate;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dataUsingEncoding:4];
        if (v32)
        {
          id v33 = v13;
          v17 = [MEMORY[0x263F08900] JSONObjectWithData:v16 options:4 error:&v33];
          id v18 = v33;

          id v13 = v18;
        }
        else
        {
          v17 = 0;
        }
        id v19 = [v17 objectForKey:@"result"];
        id v20 = v19;
        if (v19)
        {
          v21 = [v19 objectForKey:@"delta"];
          v22 = [v21 firstObject];
          v23 = [v22 objectForKey:@"content"];

          v24 = [v23 stringByReplacingOccurrencesOfString:@"\\"" withString:&stru_2700281B0];

          if ([v24 length])
          {
            id WeakRetained = objc_loadWeakRetained(location);

            if (WeakRetained)
            {
              id v26 = objc_loadWeakRetained(location);
              [v26 inferenceDidUpdateTextContent:v24];
            }
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }
  else
  {
    id v13 = 0;
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v12 = a5;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)p_delegate);
      [v11 inferenceDidCompleteWithError:v12];
    }
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v11 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_delegate);
      [v10 inferenceDidFailWithError:v11];
    }
  }
}

- (NSString)acDawTicket
{
  return self->_acDawTicket;
}

- (void)setAcDawTicket:(id)a3
{
}

- (FHInferenceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FHInferenceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_acDawTicket, 0);
}

@end