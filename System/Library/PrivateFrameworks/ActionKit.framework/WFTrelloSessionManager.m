@interface WFTrelloSessionManager
- (NSDateFormatter)dateFormatter;
- (NSString)token;
- (NSURL)baseURL;
- (NSURLSession)session;
- (WFTrelloSessionManager)init;
- (WFTrelloSessionManager)initWithConfiguration:(id)a3 token:(id)a4;
- (void)createBoardWithName:(id)a3 boardDescription:(id)a4 completionHandler:(id)a5;
- (void)createCardWithName:(id)a3 listIdentifier:(id)a4 dueDate:(id)a5 cardPosition:(id)a6 cardDescription:(id)a7 completionHandler:(id)a8;
- (void)createListWithName:(id)a3 onBoardWithIdentifier:(id)a4 position:(id)a5 completionHandler:(id)a6;
- (void)getAttachmentsOnCard:(id)a3 completionHandler:(id)a4;
- (void)getCardsForList:(id)a3 completionHandler:(id)a4;
- (void)getListsForBoard:(id)a3 completionHandler:(id)a4;
- (void)getOpenBoardsWithCompletionHandler:(id)a3;
- (void)getUserWithCompletionHandler:(id)a3;
- (void)lookupCardWithURL:(id)a3 completionHandler:(id)a4;
- (void)requestPath:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
- (void)setToken:(id)a3;
- (void)uploadFile:(id)a3 onCard:(id)a4 completionHandler:(id)a5;
@end

@implementation WFTrelloSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setToken:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)requestPath:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 length])
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"WFTrelloSessionManager.m", 209, @"Invalid parameter not satisfying: %@", @"path.length" object file lineNumber description];
  }
  v12 = (void *)[v10 mutableCopy];
  v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  v15 = v14;

  v16 = [(WFTrelloSessionManager *)self token];
  [v15 setValue:v16 forKey:@"token"];

  [v15 setValue:@"fda7ea0c0060d17c5407a4464de9cb1b" forKey:@"key"];
  v43 = self;
  v17 = [(WFTrelloSessionManager *)self baseURL];
  v18 = [v17 URLByAppendingPathComponent:v9];

  v19 = [MEMORY[0x263F08BA0] componentsWithURL:v18 resolvingAgainstBaseURL:0];
  if (![v10 count])
  {
    v39 = v18;
    id v40 = v11;
    id v41 = v10;
    id v42 = v9;
    v20 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v21 = v15;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v48 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          v27 = (void *)MEMORY[0x263F08BD0];
          v28 = [v21 objectForKeyedSubscript:v26];
          v29 = [v27 queryItemWithName:v26 value:v28];
          [v20 addObject:v29];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v23);
    }

    [v19 setQueryItems:v20];
    id v10 = v41;
    id v9 = v42;
    v18 = v39;
    id v11 = v40;
  }
  v30 = (void *)MEMORY[0x263EFC5E8];
  v31 = [v19 URL];
  v32 = [v30 requestWithURL:v31];

  [v32 _setNonAppInitiated:1];
  if ([v10 count])
  {
    [v32 setHTTPMethod:@"POST"];
    [v32 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    id v46 = 0;
    v33 = [MEMORY[0x263F08900] dataWithJSONObject:v15 options:0 error:&v46];
    id v34 = v46;
    [v32 setHTTPBody:v33];
  }
  else
  {
    id v34 = 0;
  }
  v35 = [(WFTrelloSessionManager *)v43 session];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __67__WFTrelloSessionManager_requestPath_parameters_completionHandler___block_invoke;
  v44[3] = &unk_264E5EC38;
  id v45 = v11;
  id v36 = v11;
  v37 = [v35 dataTaskWithRequest:v32 completionHandler:v44];
  [v37 resume];
}

void __67__WFTrelloSessionManager_requestPath_parameters_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if ([a3 statusCode] == 401)
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:@"WFTrelloErrorDomain" code:100 userInfo:0];

    id v8 = (id)v9;
  }
  if (![v7 length] || v8)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v8);
    }
  }
  else
  {
    id v13 = 0;
    id v10 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:&v13];
    id v8 = v13;
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v10, v8);
    }
  }
}

- (void)lookupCardWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 lastPathComponent];
  id v8 = [@"cards" stringByAppendingPathComponent:v7];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__WFTrelloSessionManager_lookupCardWithURL_completionHandler___block_invoke;
  v10[3] = &unk_264E5A4C0;
  id v11 = v6;
  id v9 = v6;
  [(WFTrelloSessionManager *)self requestPath:v8 parameters:0 completionHandler:v10];
}

void __62__WFTrelloSessionManager_lookupCardWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v5)
  {
    id v10 = v6;
    id v8 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v10];
    id v9 = v10;

    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
    id v6 = v9;
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
  }
}

- (void)getAttachmentsOnCard:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];

  if (v8)
  {
    id v9 = NSString;
    id v10 = [v6 identifier];
    id v11 = [v9 stringWithFormat:@"cards/%@/attachments", v10];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke;
    v12[3] = &unk_264E5A4C0;
    id v13 = v7;
    [(WFTrelloSessionManager *)self requestPath:v11 parameters:0 completionHandler:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a2;
  if (!v8 || a3)
  {
    (*(void (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, a3, v5, v6, v7);
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v10, "if_mapAsynchronously:completionHandler:", &__block_literal_global_33977, *(void *)(a1 + 32));
    }
    else
    {
      id v11 = getWFGeneralLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136315906;
        v17 = "WFEnforceClass";
        __int16 v18 = 2114;
        id v19 = v10;
        __int16 v20 = 2114;
        id v21 = (id)objc_opt_class();
        __int16 v22 = 2114;
        uint64_t v23 = v9;
        id v12 = v21;
        _os_log_impl(&dword_23C364000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v16, 0x2Au);
      }
      (*(void (**)(void, void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0, v13, v14, v15);
    }
  }
}

void __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = NSURL;
  id v7 = a2;
  id v8 = [v7 objectForKeyedSubscript:@"url"];
  uint64_t v9 = [v6 URLWithString:v8];

  id v10 = [v7 objectForKeyedSubscript:@"name"];

  id v11 = objc_msgSend(MEMORY[0x263EFC640], "wf_sharedSession");
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke_3;
  __int16 v18 = &unk_264E5A510;
  id v19 = v10;
  id v20 = v5;
  id v12 = v10;
  id v13 = v5;
  uint64_t v14 = [v11 downloadTaskWithURL:v9 completionHandler:&v15];
  objc_msgSend(v14, "resume", v15, v16, v17, v18);
}

void __65__WFTrelloSessionManager_getAttachmentsOnCard_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v14 = a2;
  if (!v14 || a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = (void *)MEMORY[0x263F852B8];
    id v8 = [a3 MIMEType];
    uint64_t v9 = [v7 typeFromMIMEType:v8];

    id v10 = [v9 typeDescription];
    uint64_t v11 = [v10 length];

    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x263F852B8] typeFromFilename:*(void *)(a1 + 32)];

      uint64_t v9 = (void *)v12;
    }
    id v13 = [MEMORY[0x263F33870] fileWithURL:v14 options:3 ofType:v9 proposedFilename:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)uploadFile:(id)a3 onCard:(id)a4 completionHandler:(id)a5
{
  v52[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    long long v48 = self;
    uint64_t v12 = NSString;
    uint64_t v13 = arc4random();
    id v14 = objc_msgSend(v12, "stringWithFormat:", @"Boundary+%08X%08X", v13, arc4random());
    uint64_t v15 = [MEMORY[0x263EFF990] data];
    uint64_t v16 = [NSString stringWithFormat:@"--%@\r\n", v14];
    v17 = [v16 dataUsingEncoding:4];
    [v15 appendData:v17];

    __int16 v18 = NSString;
    id v19 = [v8 filename];
    objc_msgSend(v18, "stringWithFormat:", @"Content-Disposition: form-data; name=\"file\"; filename=\"%@\"\r\n",
    id v20 = v19);
    id v21 = [v20 dataUsingEncoding:4];
    [v15 appendData:v21];

    __int16 v22 = NSString;
    uint64_t v23 = [v8 wfType];
    uint64_t v24 = [v23 MIMEType];
    v25 = [v22 stringWithFormat:@"Content-Type: %@\r\n\r\n", v24];
    uint64_t v26 = [v25 dataUsingEncoding:4];
    [v15 appendData:v26];

    v27 = [v8 mappedData];
    [v15 appendData:v27];

    v28 = [NSString stringWithFormat:@"\r\n--%@--\r\n", v14];
    v29 = [v28 dataUsingEncoding:4];
    [v15 appendData:v29];

    v30 = (void *)MEMORY[0x263F08BA0];
    v31 = [(WFTrelloSessionManager *)v48 baseURL];
    v32 = NSString;
    v33 = [v9 identifier];
    id v34 = [v32 stringWithFormat:@"cards/%@/attachments", v33];
    [v31 URLByAppendingPathComponent:v34];
    v35 = id v49 = v9;
    id v36 = [v30 componentsWithURL:v35 resolvingAgainstBaseURL:0];

    v37 = [MEMORY[0x263F08BD0] queryItemWithName:@"key" value:@"fda7ea0c0060d17c5407a4464de9cb1b"];
    v52[0] = v37;
    v38 = (void *)MEMORY[0x263F08BD0];
    v39 = [(WFTrelloSessionManager *)v48 token];
    id v40 = [v38 queryItemWithName:@"token" value:v39];
    v52[1] = v40;
    id v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
    [v36 setQueryItems:v41];

    id v42 = (void *)MEMORY[0x263EFC5E8];
    v43 = [v36 URL];
    v44 = [v42 requestWithURL:v43];

    [v44 _setNonAppInitiated:1];
    [v44 setHTTPMethod:@"POST"];
    [v44 setHTTPBody:v15];
    id v45 = [NSString stringWithFormat:@"multipart/form-data boundary=%@", v14];;
    [v44 setValue:v45 forHTTPHeaderField:@"Content-Type"];

    id v46 = [(WFTrelloSessionManager *)v48 session];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __62__WFTrelloSessionManager_uploadFile_onCard_completionHandler___block_invoke;
    v50[3] = &unk_264E5EC38;
    id v51 = v11;
    long long v47 = [v46 dataTaskWithRequest:v44 completionHandler:v50];
    [v47 resume];

    id v9 = v49;
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __62__WFTrelloSessionManager_uploadFile_onCard_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a3;
  id v7 = a4;
  uint64_t v8 = [a2 length];
  if (v7 || !v8)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (!v12) {
      goto LABEL_8;
    }
    uint64_t v11 = *(void (**)(void))(v12 + 16);
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 200, 100);
    objc_msgSend(v9, "containsIndex:", objc_msgSend(v13, "statusCode"));

    uint64_t v10 = *(void *)(a1 + 32);
    if (!v10) {
      goto LABEL_8;
    }
    uint64_t v11 = *(void (**)(void))(v10 + 16);
  }
  v11();
LABEL_8:
}

- (void)createCardWithName:(id)a3 listIdentifier:(id)a4 dueDate:(id)a5 cardPosition:(id)a6 cardDescription:(id)a7 completionHandler:(id)a8
{
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a6;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_opt_new();
  [v20 setObject:v19 forKey:@"name"];

  [v20 setObject:v18 forKey:@"idList"];
  id v21 = [v17 lowercaseString];

  [v20 setObject:v21 forKey:@"pos"];
  if (v14)
  {
    __int16 v22 = [(WFTrelloSessionManager *)self dateFormatter];
    uint64_t v23 = [v22 stringFromDate:v14];
    [v20 setObject:v23 forKey:@"due"];
  }
  else
  {
    __int16 v22 = [MEMORY[0x263EFF9D0] null];
    [v20 setObject:v22 forKey:@"due"];
  }

  if ([v15 length]) {
    [v20 setObject:v15 forKey:@"desc"];
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __115__WFTrelloSessionManager_createCardWithName_listIdentifier_dueDate_cardPosition_cardDescription_completionHandler___block_invoke;
  v25[3] = &unk_264E5A4C0;
  id v26 = v16;
  id v24 = v16;
  [(WFTrelloSessionManager *)self requestPath:@"cards" parameters:v20 completionHandler:v25];
}

void __115__WFTrelloSessionManager_createCardWithName_listIdentifier_dueDate_cardPosition_cardDescription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(void, void, id))(v8 + 16))(*(void *)(a1 + 32), 0, v6);
    }
    else
    {
      id v10 = 0;
      id v9 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v10];
      id v7 = v10;
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v7);
    }
  }
}

- (void)createListWithName:(id)a3 onBoardWithIdentifier:(id)a4 position:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_opt_new();
  [v14 setObject:v13 forKey:@"name"];

  [v14 setObject:v12 forKey:@"idBoard"];
  id v15 = [v11 lowercaseString];

  [v14 setObject:v15 forKey:@"pos"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __94__WFTrelloSessionManager_createListWithName_onBoardWithIdentifier_position_completionHandler___block_invoke;
  v17[3] = &unk_264E5A4C0;
  id v18 = v10;
  id v16 = v10;
  [(WFTrelloSessionManager *)self requestPath:@"lists" parameters:v14 completionHandler:v17];
}

void __94__WFTrelloSessionManager_createListWithName_onBoardWithIdentifier_position_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(void, void, id))(v8 + 16))(*(void *)(a1 + 32), 0, v6);
    }
    else
    {
      id v10 = 0;
      id v9 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v10];
      id v7 = v10;
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v7);
    }
  }
}

- (void)createBoardWithName:(id)a3 boardDescription:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_opt_new();
  [v11 setObject:v10 forKey:@"name"];

  if ([v8 length]) {
    [v11 setObject:v8 forKey:@"desc"];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__WFTrelloSessionManager_createBoardWithName_boardDescription_completionHandler___block_invoke;
  v13[3] = &unk_264E5A4C0;
  id v14 = v9;
  id v12 = v9;
  [(WFTrelloSessionManager *)self requestPath:@"boards" parameters:v11 completionHandler:v13];
}

void __81__WFTrelloSessionManager_createBoardWithName_boardDescription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    if (v6)
    {
      (*(void (**)(void, void, id))(v8 + 16))(*(void *)(a1 + 32), 0, v6);
    }
    else
    {
      id v10 = 0;
      id v9 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v10];
      id v7 = v10;
      (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v7);
    }
  }
}

- (void)getUserWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = NSString;
  id v6 = [(WFTrelloSessionManager *)self token];
  id v7 = [v5 stringWithFormat:@"tokens/%@/member", v6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__WFTrelloSessionManager_getUserWithCompletionHandler___block_invoke;
  v9[3] = &unk_264E5A4C0;
  id v10 = v4;
  id v8 = v4;
  [(WFTrelloSessionManager *)self requestPath:v7 parameters:0 completionHandler:v9];
}

void __55__WFTrelloSessionManager_getUserWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v5)
  {
    id v10 = v6;
    id v8 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v10];
    id v9 = v10;

    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
    id v6 = v9;
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
  }
}

- (void)getCardsForList:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 identifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFTrelloSessionManager.m", 77, @"Invalid parameter not satisfying: %@", @"list.identifier.length" object file lineNumber description];
  }
  id v11 = NSString;
  id v12 = [v7 identifier];
  id v13 = [v11 stringWithFormat:@"lists/%@/cards", v12];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__WFTrelloSessionManager_getCardsForList_completionHandler___block_invoke;
  v16[3] = &unk_264E5A4C0;
  id v17 = v8;
  id v14 = v8;
  [(WFTrelloSessionManager *)self requestPath:v13 parameters:0 completionHandler:v16];
}

void __60__WFTrelloSessionManager_getCardsForList_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v5)
  {
    id v10 = v6;
    id v8 = [MEMORY[0x263F86840] modelsOfClass:objc_opt_class() fromJSONArray:v5 error:&v10];
    id v9 = v10;

    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
    id v6 = v9;
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
  }
}

- (void)getListsForBoard:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 identifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFTrelloSessionManager.m", 69, @"Invalid parameter not satisfying: %@", @"board.identifier.length" object file lineNumber description];
  }
  id v11 = NSString;
  id v12 = [v7 identifier];
  id v13 = [v11 stringWithFormat:@"boards/%@/lists", v12];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__WFTrelloSessionManager_getListsForBoard_completionHandler___block_invoke;
  v16[3] = &unk_264E5A4C0;
  id v17 = v8;
  id v14 = v8;
  [(WFTrelloSessionManager *)self requestPath:v13 parameters:0 completionHandler:v16];
}

void __61__WFTrelloSessionManager_getListsForBoard_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v5)
  {
    id v10 = v6;
    id v8 = [MEMORY[0x263F86840] modelsOfClass:objc_opt_class() fromJSONArray:v5 error:&v10];
    id v9 = v10;

    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);
    id v6 = v9;
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
  }
}

- (void)getOpenBoardsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__WFTrelloSessionManager_getOpenBoardsWithCompletionHandler___block_invoke;
  v6[3] = &unk_264E5A4C0;
  id v7 = v4;
  id v5 = v4;
  [(WFTrelloSessionManager *)self requestPath:@"members/me/boards" parameters:0 completionHandler:v6];
}

void __61__WFTrelloSessionManager_getOpenBoardsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v12 = v6;
    id v7 = [MEMORY[0x263F86840] modelsOfClass:objc_opt_class() fromJSONArray:v5 error:&v12];
    id v8 = v12;

    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"(closed = NO)"];
    id v11 = [v7 filteredArrayUsingPredicate:v10];
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v8);

    id v6 = v8;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    id v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    id v6 = self->_dateFormatter;
    id v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)v6 setLocale:v7];

    [(NSDateFormatter *)self->_dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    id v8 = self->_dateFormatter;
    uint64_t v9 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
    [(NSDateFormatter *)v8 setTimeZone:v9];

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (WFTrelloSessionManager)initWithConfiguration:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFTrelloSessionManager;
  id v8 = [(WFTrelloSessionManager *)&v19 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    token = v8->_token;
    v8->_token = (NSString *)v9;

    uint64_t v11 = [NSURL URLWithString:@"https://api.trello.com/1/"];
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSURL *)v11;

    id v13 = (void *)MEMORY[0x263EFC640];
    id v14 = v6;
    if (!v6)
    {
      id v14 = objc_msgSend(MEMORY[0x263EFC648], "wf_defaultSessionConfiguration");
    }
    uint64_t v15 = [v13 sessionWithConfiguration:v14];
    session = v8->_session;
    v8->_session = (NSURLSession *)v15;

    if (!v6) {
    id v17 = v8;
    }
  }

  return v8;
}

- (WFTrelloSessionManager)init
{
  return [(WFTrelloSessionManager *)self initWithConfiguration:0 token:0];
}

@end