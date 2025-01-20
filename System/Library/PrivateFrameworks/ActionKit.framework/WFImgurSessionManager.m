@interface WFImgurSessionManager
- (NSMapTable)progressTable;
- (NSString)clientID;
- (NSURL)baseURL;
- (NSURLSession)session;
- (WFImgurSessionManager)initWithClientID:(id)a3;
- (WFImgurSessionManager)initWithClientID:(id)a3 configuration:(id)a4;
- (WFOAuth2Credential)credential;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)createAlbumWithIDs:(id)a3 title:(id)a4 description:(id)a5 layout:(id)a6 privacy:(id)a7 completionHandler:(id)a8;
- (void)getAlbumLinkFromID:(id)a3 completionHandler:(id)a4;
- (void)sendRequest:(id)a3 progress:(id)a4 completionHandler:(id)a5;
- (void)setCredential:(id)a3;
- (void)uploadImage:(id)a3 title:(id)a4 description:(id)a5 progress:(id)a6 completionHandler:(id)a7;
@end

@implementation WFImgurSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTable, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

- (NSMapTable)progressTable
{
  return self->_progressTable;
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setCredential:(id)a3
{
}

- (WFOAuth2Credential)credential
{
  return self->_credential;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v10 = a4;
  v11 = [(WFImgurSessionManager *)self progressTable];
  id v12 = [v11 objectForKey:v10];

  [v12 setTotalUnitCount:a7];
  [v12 setCompletedUnitCount:a6];
}

- (void)sendRequest:(id)a3 progress:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFImgurSessionManager *)self credential];

  if (v11)
  {
    id v12 = [(WFImgurSessionManager *)self credential];
    objc_msgSend(v8, "wfo_setAuthorizationWithCredential:", v12);
  }
  else
  {
    v13 = NSString;
    id v12 = [(WFImgurSessionManager *)self clientID];
    v14 = [v13 stringWithFormat:@"Client-ID %@", v12];
    [v8 setValue:v14 forHTTPHeaderField:@"Authorization"];
  }
  uint64_t v23 = 0;
  v24 = (id *)&v23;
  uint64_t v25 = 0x3042000000;
  v26 = __Block_byref_object_copy__8693;
  v27 = __Block_byref_object_dispose__8694;
  id v28 = 0;
  v15 = [(WFImgurSessionManager *)self session];
  v16 = [v8 HTTPBody];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __64__WFImgurSessionManager_sendRequest_progress_completionHandler___block_invoke;
  v20[3] = &unk_264E5E7F0;
  v20[4] = self;
  v22 = &v23;
  id v17 = v10;
  id v21 = v17;
  v18 = [v15 uploadTaskWithRequest:v8 fromData:v16 completionHandler:v20];

  objc_storeWeak(v24 + 5, v18);
  if (v9)
  {
    v19 = [(WFImgurSessionManager *)self progressTable];
    [v19 setObject:v9 forKey:v18];
  }
  [v18 resume];

  _Block_object_dispose(&v23, 8);
  objc_destroyWeak(&v28);
}

void __64__WFImgurSessionManager_sendRequest_progress_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) progressTable];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  id v10 = [v8 objectForKey:WeakRetained];

  objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
  v11 = [*(id *)(a1 + 32) progressTable];
  id v12 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  [v11 removeObjectForKey:v12];

  if ([v6 length])
  {
    id v31 = v7;
    v13 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v31];
    id v14 = v31;

    if (v13)
    {
      v15 = [v13 objectForKeyedSubscript:@"data"];
      v16 = [v15 objectForKeyedSubscript:@"error"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v17 = v16;
        uint64_t v18 = 0;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v16;
          v22 = [v21 objectForKeyedSubscript:@"message"];
          uint64_t v23 = objc_opt_class();
          id v24 = v22;
          if (v24 && (objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v25 = getWFGeneralLogObject();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              v26 = objc_opt_class();
              *(_DWORD *)buf = 136315906;
              v35 = "WFEnforceClass";
              __int16 v36 = 2114;
              id v37 = v24;
              __int16 v38 = 2114;
              v39 = v26;
              __int16 v40 = 2114;
              uint64_t v41 = v23;
              id v27 = v26;
              _os_log_impl(&dword_23C364000, v25, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
            }
            unint64_t v17 = 0;
          }
          else
          {
            unint64_t v17 = (unint64_t)v24;
          }

          id v28 = [v21 objectForKeyedSubscript:@"code"];
          uint64_t v18 = [v28 integerValue];
        }
        else
        {
          uint64_t v18 = 0;
          unint64_t v17 = 0;
        }
      }
      if (v17 | v18 && !v14)
      {
        if (v17)
        {
          uint64_t v32 = *MEMORY[0x263F08338];
          unint64_t v33 = v17;
          v29 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        }
        else
        {
          v29 = 0;
        }
        id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"WFImgurErrorDomain" code:v18 userInfo:v29];
      }
      uint64_t v30 = *(void *)(a1 + 40);
      if (v30) {
        (*(void (**)(uint64_t, void *, id))(v30 + 16))(v30, v13, v14);
      }
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 40);
      if (v20) {
        (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v14);
      }
    }

    id v7 = v14;
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 40);
    if (v19) {
      (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v7);
    }
  }
}

- (void)getAlbumLinkFromID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFC5E8];
  id v8 = a3;
  id v9 = [(WFImgurSessionManager *)self baseURL];
  id v10 = [NSString stringWithFormat:@"album/%@", v8];

  v11 = [v9 URLByAppendingPathComponent:v10];
  id v12 = [v7 requestWithURL:v11];

  [v12 _setNonAppInitiated:1];
  v13 = [MEMORY[0x263EFF8F8] data];
  [v12 setHTTPBody:v13];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__WFImgurSessionManager_getAlbumLinkFromID_completionHandler___block_invoke;
  v15[3] = &unk_264E5E6B8;
  id v16 = v6;
  id v14 = v6;
  [(WFImgurSessionManager *)self sendRequest:v12 progress:0 completionHandler:v15];
}

void __62__WFImgurSessionManager_getAlbumLinkFromID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = a2;
    id v11 = [v6 objectForKey:@"success"];
    uint64_t v7 = [v11 BOOLValue];
    id v8 = NSURL;
    id v9 = [v6 valueForKeyPath:@"data.link"];

    id v10 = [v8 URLWithString:v9];
    (*(void (**)(uint64_t, uint64_t, void *, id))(v3 + 16))(v3, v7, v10, v5);
  }
}

- (void)createAlbumWithIDs:(id)a3 title:(id)a4 description:(id)a5 layout:(id)a6 privacy:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = objc_opt_new();
  [v20 setValue:v18 forKey:@"title"];

  [v20 setValue:v17 forKey:@"description"];
  [v20 setValue:v16 forKey:@"layout"];

  [v20 setValue:v15 forKey:@"privacy"];
  id v21 = [v19 componentsJoinedByString:@","];

  [v20 setValue:v21 forKey:@"ids"];
  v22 = (void *)MEMORY[0x263F08BA0];
  uint64_t v23 = [(WFImgurSessionManager *)self baseURL];
  id v24 = [v23 URLByAppendingPathComponent:@"album"];
  uint64_t v25 = [v22 componentsWithURL:v24 resolvingAgainstBaseURL:0];

  v26 = objc_msgSend(NSURL, "dc_queryStringWithQueryDictionary:", v20);
  [v25 setPercentEncodedQuery:v26];

  id v27 = (void *)MEMORY[0x263EFC5E8];
  id v28 = [v25 URL];
  v29 = [v27 requestWithURL:v28];

  [v29 _setNonAppInitiated:1];
  [v29 setHTTPMethod:@"POST"];
  uint64_t v30 = objc_msgSend(NSURL, "dc_queryStringWithQueryDictionary:", v20);
  id v31 = [v30 dataUsingEncoding:4];
  [v29 setHTTPBody:v31];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __95__WFImgurSessionManager_createAlbumWithIDs_title_description_layout_privacy_completionHandler___block_invoke;
  v33[3] = &unk_264E5B148;
  v33[4] = self;
  id v34 = v14;
  id v32 = v14;
  [(WFImgurSessionManager *)self sendRequest:v29 progress:0 completionHandler:v33];
}

void __95__WFImgurSessionManager_createAlbumWithIDs_title_description_layout_privacy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v4 = [a2 valueForKeyPath:@"data.id"];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __95__WFImgurSessionManager_createAlbumWithIDs_title_description_layout_privacy_completionHandler___block_invoke_2;
    v5[3] = &unk_264E56DB0;
    id v6 = *(id *)(a1 + 40);
    [v3 getAlbumLinkFromID:v4 completionHandler:v5];
  }
}

uint64_t __95__WFImgurSessionManager_createAlbumWithIDs_title_description_layout_privacy_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)uploadImage:(id)a3 title:(id)a4 description:(id)a5 progress:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_opt_new();
  [v16 setValue:v14 forKey:@"title"];

  [v16 setValue:v13 forKey:@"description"];
  id v17 = NSString;
  uint64_t v18 = arc4random();
  id v19 = objc_msgSend(v17, "stringWithFormat:", @"Boundary+%08X%08X", v18, arc4random());
  uint64_t v20 = [MEMORY[0x263EFF990] data];
  id v21 = [NSString stringWithFormat:@"--%@\r\n", v19];
  v22 = [v21 dataUsingEncoding:4];
  [v20 appendData:v22];

  uint64_t v23 = NSString;
  id v24 = [v15 filename];
  objc_msgSend(v23, "stringWithFormat:", @"Content-Disposition: form-data; name=\"image\"; filename=\"%@\"\r\n",
  uint64_t v25 = v24);
  v26 = [v25 dataUsingEncoding:4];
  [v20 appendData:v26];

  id v27 = [NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
  id v28 = [v27 dataUsingEncoding:4];
  [v20 appendData:v28];

  v29 = [v15 mappedData];

  [v20 appendData:v29];
  uint64_t v30 = [NSString stringWithFormat:@"\r\n"];
  id v31 = [v30 dataUsingEncoding:4];
  [v20 appendData:v31];

  id v32 = [NSString stringWithFormat:@"--%@--\r\n", v19];
  unint64_t v33 = [v32 dataUsingEncoding:4];
  [v20 appendData:v33];

  id v34 = (void *)MEMORY[0x263F08BA0];
  v35 = [(WFImgurSessionManager *)self baseURL];
  __int16 v36 = [v35 URLByAppendingPathComponent:@"image"];
  id v37 = [v34 componentsWithURL:v36 resolvingAgainstBaseURL:0];

  __int16 v38 = objc_msgSend(NSURL, "dc_queryStringWithQueryDictionary:", v16);
  [v37 setPercentEncodedQuery:v38];

  v39 = (void *)MEMORY[0x263EFC5E8];
  __int16 v40 = [v37 URL];
  uint64_t v41 = [v39 requestWithURL:v40];

  [v41 _setNonAppInitiated:1];
  [v41 setHTTPMethod:@"POST"];
  [v41 setHTTPBody:v20];
  uint64_t v42 = [NSString stringWithFormat:@"multipart/form-data boundary=%@", v19];;
  [v41 setValue:v42 forHTTPHeaderField:@"Content-Type"];

  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __82__WFImgurSessionManager_uploadImage_title_description_progress_completionHandler___block_invoke;
  v45[3] = &unk_264E5E6B8;
  id v46 = v11;
  id v43 = v11;
  [(WFImgurSessionManager *)self sendRequest:v41 progress:v12 completionHandler:v45];
}

void __82__WFImgurSessionManager_uploadImage_title_description_progress_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = a2;
    id v12 = [v6 objectForKey:@"success"];
    uint64_t v7 = [v12 BOOLValue];
    id v8 = NSURL;
    id v9 = [v6 valueForKeyPath:@"data.link"];
    id v10 = [v8 URLWithString:v9];
    id v11 = [v6 valueForKeyPath:@"data.id"];

    (*(void (**)(uint64_t, uint64_t, void *, void *, id))(v3 + 16))(v3, v7, v10, v11, v5);
  }
}

- (WFImgurSessionManager)initWithClientID:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFImgurSessionManager;
  id v8 = [(WFImgurSessionManager *)&v21 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientID = v8->_clientID;
    v8->_clientID = (NSString *)v9;

    id v11 = (void *)MEMORY[0x263EFC640];
    id v12 = v7;
    if (!v7)
    {
      id v12 = objc_msgSend(MEMORY[0x263EFC648], "wf_defaultSessionConfiguration");
    }
    uint64_t v13 = [v11 sessionWithConfiguration:v12 delegate:v8 delegateQueue:0];
    session = v8->_session;
    v8->_session = (NSURLSession *)v13;

    if (!v7) {
    uint64_t v15 = [NSURL URLWithString:@"https://api.imgur.com/3/"];
    }
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSURL *)v15;

    uint64_t v17 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    progressTable = v8->_progressTable;
    v8->_progressTable = (NSMapTable *)v17;

    id v19 = v8;
  }

  return v8;
}

- (WFImgurSessionManager)initWithClientID:(id)a3
{
  return [(WFImgurSessionManager *)self initWithClientID:a3 configuration:0];
}

@end