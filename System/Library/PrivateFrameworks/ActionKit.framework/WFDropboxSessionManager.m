@interface WFDropboxSessionManager
- (NSMapTable)progressTable;
- (NSURL)baseURL;
- (NSURL)contentBaseURL;
- (NSURLSession)session;
- (WFDropboxSessionManager)init;
- (WFDropboxSessionManager)initWithSessionConfiguration:(id)a3;
- (WFOAuth2Credential)credential;
- (id)saveFile:(id)a3 toPath:(id)a4 overwrite:(BOOL)a5 progress:(id)a6 completionHandler:(id)a7;
- (id)sendContentUploadRequestWithPath:(id)a3 parameters:(id)a4 data:(id)a5 inputStream:(id)a6 progress:(id)a7 completionHandler:(id)a8;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)createFolderAtPath:(id)a3 completionHandler:(id)a4;
- (void)deleteItem:(id)a3 completionHandler:(id)a4;
- (void)downloadFile:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 completionHandler:(id)a6;
- (void)getContentsOfFolderAtPath:(id)a3 completionHandler:(id)a4;
- (void)getContentsOfFolderWithParameters:(id)a3 previous:(id)a4 completionHandler:(id)a5;
- (void)getExistingSharedLinkForFile:(id)a3 completionHandler:(id)a4;
- (void)getItemAtPath:(id)a3 completionHandler:(id)a4;
- (void)getSharedLinkForFile:(id)a3 completionHandler:(id)a4;
- (void)searchFiles:(id)a3 inPath:(id)a4 completionHandler:(id)a5;
- (void)sendContentDownloadRequestWithPath:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 parameters:(id)a6 progress:(id)a7 completionHandler:(id)a8;
- (void)sendRPCRequestWithPath:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
- (void)setCredential:(id)a3;
@end

@implementation WFDropboxSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTable, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_contentBaseURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

- (NSMapTable)progressTable
{
  return self->_progressTable;
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSURL)contentBaseURL
{
  return self->_contentBaseURL;
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

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v9 = a4;
  v10 = [(WFDropboxSessionManager *)self progressTable];
  id v11 = [v10 objectForKey:v9];

  [v11 setCompletedUnitCount:a6];
}

- (void)sendRPCRequestWithPath:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263EFC5E8];
  id v10 = a4;
  id v11 = a3;
  v12 = [(WFDropboxSessionManager *)self baseURL];
  v13 = [v12 URLByAppendingPathComponent:v11];

  v14 = [v9 requestWithURL:v13];

  [v14 _setNonAppInitiated:1];
  [v14 setHTTPMethod:@"POST"];
  v15 = [MEMORY[0x263F08900] dataWithJSONObject:v10 options:0 error:0];

  [v14 setHTTPBody:v15];
  [v14 setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
  v16 = [(WFDropboxSessionManager *)self credential];
  objc_msgSend(v14, "wfo_setAuthorizationWithCredential:", v16);

  v17 = [(WFDropboxSessionManager *)self session];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __79__WFDropboxSessionManager_sendRPCRequestWithPath_parameters_completionHandler___block_invoke;
  v20[3] = &unk_264E5EC38;
  id v21 = v8;
  id v18 = v8;
  v19 = [v17 dataTaskWithRequest:v14 completionHandler:v20];
  [v19 resume];
}

void __79__WFDropboxSessionManager_sendRPCRequestWithPath_parameters_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 length])
  {
    id v11 = v7;
    id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v11];
    id v9 = v11;

    id v7 = v9;
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v8 = 0;
  if (!v7)
  {
LABEL_3:
    WFDropboxErrorFromResponseObject(v8, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v8, v7);
  }
}

- (id)sendContentUploadRequestWithPath:(id)a3 parameters:(id)a4 data:(id)a5 inputStream:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v39 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = (void *)MEMORY[0x263EFC5E8];
  v20 = [(WFDropboxSessionManager *)self contentBaseURL];
  v38 = v14;
  id v21 = [v20 URLByAppendingPathComponent:v14];
  v22 = [v19 requestWithURL:v21];

  v23 = v15;
  [v22 _setNonAppInitiated:1];
  [v22 setHTTPMethod:@"POST"];
  [v22 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
  v24 = [(WFDropboxSessionManager *)self credential];
  objc_msgSend(v22, "wfo_setAuthorizationWithCredential:", v24);

  if (v15)
  {
    id v37 = v18;
    v25 = [MEMORY[0x263F08900] dataWithJSONObject:v15 options:0 error:0];
    id v26 = (id)[[NSString alloc] initWithData:v25 encoding:4];
    id v27 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v26 length])
    {
      unint64_t v28 = 0;
      do
      {
        v29 = objc_msgSend(v26, "substringWithRange:", v28, 1);
        if ([v29 canBeConvertedToEncoding:1]) {
          [v27 appendString:v29];
        }
        else {
          objc_msgSend(v27, "appendFormat:", @"\\u%04x", objc_msgSend(v26, "characterAtIndex:", v28));
        }

        ++v28;
      }
      while (v28 < [v26 length]);
    }
    objc_msgSend(v27, "replaceOccurrencesOfString:withString:options:range:", @"\\/", @"/", 2, 0, objc_msgSend(v27, "length"));

    [v22 setValue:v27 forHTTPHeaderField:@"Dropbox-API-Arg"];
    id v18 = v37;
    v23 = v15;
  }
  uint64_t v43 = 0;
  v44 = (id *)&v43;
  uint64_t v45 = 0x3042000000;
  v46 = __Block_byref_object_copy__347;
  v47 = __Block_byref_object_dispose__348;
  id v48 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__WFDropboxSessionManager_sendContentUploadRequestWithPath_parameters_data_inputStream_progress_completionHandler___block_invoke;
  aBlock[3] = &unk_264E5E7F0;
  aBlock[4] = self;
  v42 = &v43;
  id v30 = v18;
  id v41 = v30;
  v31 = _Block_copy(aBlock);
  if (v16)
  {
    [v22 setHTTPBodyStream:v16];
    v32 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v16, "length"));
    [v22 setValue:v32 forHTTPHeaderField:@"Content-Length"];

    v33 = [(WFDropboxSessionManager *)self session];
    [v33 dataTaskWithRequest:v22 completionHandler:v31];
  }
  else
  {
    v33 = [(WFDropboxSessionManager *)self session];
    [v33 uploadTaskWithRequest:v22 fromData:v39 completionHandler:v31];
  v34 = };

  objc_storeWeak(v44 + 5, v34);
  if (v17)
  {
    v35 = [(WFDropboxSessionManager *)self progressTable];
    [v35 setObject:v17 forKey:v34];
  }
  [v34 resume];

  _Block_object_dispose(&v43, 8);
  objc_destroyWeak(&v48);

  return v34;
}

void __115__WFDropboxSessionManager_sendContentUploadRequestWithPath_parameters_data_inputStream_progress_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) progressTable];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  uint64_t v10 = [v8 objectForKey:WeakRetained];

  objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
  id v11 = [*(id *)(a1 + 32) progressTable];
  id v12 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  [v11 removeObjectForKey:v12];

  if ([v6 length])
  {
    id v16 = v7;
    v13 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:4 error:&v16];
    id v14 = v16;

    id v7 = v14;
    if (v14) {
      goto LABEL_8;
    }
  }
  else
  {
    v13 = 0;
    if (v7) {
      goto LABEL_8;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WFDropboxErrorFromResponseObject(v13, 1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
LABEL_8:
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, void *, id))(v15 + 16))(v15, v13, v7);
  }
}

- (void)sendContentDownloadRequestWithPath:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 parameters:(id)a6 progress:(id)a7 completionHandler:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  id v16 = (objc_class *)MEMORY[0x263EFC5E8];
  id v17 = a6;
  id v18 = a3;
  id v19 = [v16 alloc];
  v20 = [(WFDropboxSessionManager *)self contentBaseURL];
  id v21 = [v20 URLByAppendingPathComponent:v18];

  v22 = (void *)[v19 initWithURL:v21];
  [v22 _setNonAppInitiated:1];
  id v23 = [NSString alloc];
  v24 = [MEMORY[0x263F08900] dataWithJSONObject:v17 options:0 error:0];

  v25 = (void *)[v23 initWithData:v24 encoding:4];
  [v22 setValue:v25 forHTTPHeaderField:@"Dropbox-API-Arg"];

  id v26 = [(WFDropboxSessionManager *)self credential];
  objc_msgSend(v22, "wfo_setAuthorizationWithCredential:", v26);

  id v27 = [(WFDropboxSessionManager *)self session];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __124__WFDropboxSessionManager_sendContentDownloadRequestWithPath_ofType_proposedFilename_parameters_progress_completionHandler___block_invoke;
  v32[3] = &unk_264E5E7C8;
  id v33 = v13;
  id v34 = v14;
  id v35 = v15;
  id v28 = v15;
  id v29 = v14;
  id v30 = v13;
  v31 = [v27 downloadTaskWithRequest:v22 completionHandler:v32];

  [v31 resume];
}

void __124__WFDropboxSessionManager_sendContentDownloadRequestWithPath_ofType_proposedFilename_parameters_progress_completionHandler___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [a3 allHeaderFields];
  uint64_t v10 = [v9 objectForKey:@"Dropbox-API-Result"];
  id v11 = [v10 dataUsingEncoding:4];

  if ([v11 length])
  {
    id v15 = v8;
    id v12 = [MEMORY[0x263F08900] JSONObjectWithData:v11 options:0 error:&v15];
    id v13 = v15;

    id v8 = v13;
    if (v13) {
      goto LABEL_6;
    }
  }
  else
  {
    id v12 = 0;
    if (v8) {
      goto LABEL_6;
    }
  }
  WFDropboxErrorFromResponseObject(v12, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    id v14 = [MEMORY[0x263F33870] fileWithURL:v7 options:3 ofType:a1[4] proposedFilename:a1[5]];
    goto LABEL_7;
  }
LABEL_6:
  id v14 = 0;
LABEL_7:
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)searchFiles:(id)a3 inPath:(id)a4 completionHandler:(id)a5
{
  v19[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (objc_class *)MEMORY[0x263EFF9A0];
  id v11 = a3;
  id v12 = (void *)[[v10 alloc] initWithDictionary:&unk_26F076A68];
  if (v8)
  {
    id v13 = WFDropboxProcessPath(v8);
    [v12 setObject:v13 forKey:@"path"];
  }
  v18[0] = @"query";
  v18[1] = @"options";
  v19[0] = v11;
  v19[1] = v12;
  id v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __64__WFDropboxSessionManager_searchFiles_inPath_completionHandler___block_invoke;
  v16[3] = &unk_264E5E6B8;
  id v17 = v9;
  id v15 = v9;
  [(WFDropboxSessionManager *)self sendRPCRequestWithPath:@"files/search_v2" parameters:v14 completionHandler:v16];
}

void __64__WFDropboxSessionManager_searchFiles_inPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"matches"];
  uint64_t v7 = objc_opt_class();
  id v8 = WFEnforceClass(v6, v7);

  if (v8)
  {
    id v9 = (void *)MEMORY[0x263F86840];
    uint64_t v10 = objc_opt_class();
    id v11 = [v8 valueForKeyPath:@"metadata.metadata"];
    id v14 = v5;
    id v12 = [v9 modelsOfClass:v10 fromJSONArray:v11 error:&v14];
    id v13 = v14;

    id v5 = v13;
  }
  else
  {
    id v12 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadFile:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 completionHandler:(id)a6
{
  v23[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v11;
  if (!v11)
  {
    id v15 = (void *)MEMORY[0x263F852B8];
    a6 = [v10 name];
    id v14 = [v15 typeFromFilename:a6];
  }
  id v16 = v12;
  if (!v12)
  {
    id v16 = [v10 name];
  }
  v22 = @"path";
  id v17 = [v10 identifier];
  v23[0] = v17;
  id v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __82__WFDropboxSessionManager_downloadFile_ofType_proposedFilename_completionHandler___block_invoke;
  v20[3] = &unk_264E5E7A0;
  id v19 = v13;
  id v21 = v19;
  [(WFDropboxSessionManager *)self sendContentDownloadRequestWithPath:@"files/download" ofType:v14 proposedFilename:v16 parameters:v18 progress:0 completionHandler:v20];

  if (!v12)
  {

    if (v11) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v11) {
    goto LABEL_9;
  }
LABEL_7:
}

void __82__WFDropboxSessionManager_downloadFile_ofType_proposedFilename_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  id v11 = 0;
  if (v8 && !v9)
  {
    id v15 = 0;
    id v11 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v8 error:&v15];
    id v10 = v15;
  }
  id v12 = [v7 fileURL];
  id v13 = [v11 clientModifiedDate];
  if (v13)
  {
    [v12 setResourceValue:v13 forKey:*MEMORY[0x263EFF5F8] error:0];
  }
  else
  {
    id v14 = [v11 serverModifiedDate];
    [v12 setResourceValue:v14 forKey:*MEMORY[0x263EFF5F8] error:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getExistingSharedLinkForFile:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v12 = @"path";
  id v7 = [a3 identifier];
  v13[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__WFDropboxSessionManager_getExistingSharedLinkForFile_completionHandler___block_invoke;
  v10[3] = &unk_264E5E6B8;
  id v11 = v6;
  id v9 = v6;
  [(WFDropboxSessionManager *)self sendRPCRequestWithPath:@"sharing/list_shared_links" parameters:v8 completionHandler:v10];
}

void __74__WFDropboxSessionManager_getExistingSharedLinkForFile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"links"];
  uint64_t v6 = objc_opt_class();
  id v7 = WFEnforceClass(v5, v6);

  id v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_54502);
  id v9 = [v8 firstObject];

  id v10 = [v9 objectForKeyedSubscript:@"url"];
  uint64_t v11 = objc_opt_class();
  id v12 = WFEnforceClass(v10, v11);

  if (v12)
  {
    id v13 = [NSURL URLWithString:v12];
  }
  else
  {
    id v13 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __74__WFDropboxSessionManager_getExistingSharedLinkForFile_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"link_permissions"];
  uint64_t v4 = objc_opt_class();
  id v5 = WFEnforceClass(v3, v4);

  uint64_t v6 = [v5 objectForKeyedSubscript:@"requested_visibility"];
  uint64_t v7 = objc_opt_class();
  id v8 = WFEnforceClass(v6, v7);

  id v9 = [v8 objectForKeyedSubscript:@".tag"];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = WFEnforceClass(v9, v10);

  if ([v11 isEqualToString:@"public"]) {
    id v12 = v2;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (void)getSharedLinkForFile:(id)a3 completionHandler:(id)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v15[0] = @"path";
  id v8 = [v6 identifier];
  v15[1] = @"settings";
  v16[0] = v8;
  v16[1] = &unk_26F076A40;
  id v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__WFDropboxSessionManager_getSharedLinkForFile_completionHandler___block_invoke;
  v12[3] = &unk_264E5EB10;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(WFDropboxSessionManager *)self sendRPCRequestWithPath:@"sharing/create_shared_link_with_settings" parameters:v9 completionHandler:v12];
}

void __66__WFDropboxSessionManager_getSharedLinkForFile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [v5 domain];
  if (![v6 isEqualToString:@"WFDropboxErrorDomain"])
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v5 code];

  if (v7 != 110)
  {
LABEL_5:
    id v8 = [v12 objectForKeyedSubscript:@"url"];
    uint64_t v9 = objc_opt_class();
    id v10 = WFEnforceClass(v8, v9);

    if (v10)
    {
      id v11 = [NSURL URLWithString:v10];
    }
    else
    {
      id v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    goto LABEL_9;
  }
  [*(id *)(a1 + 32) getExistingSharedLinkForFile:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
LABEL_9:
}

- (void)deleteItem:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v12 = @"path";
  uint64_t v7 = [a3 path];
  v13[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__WFDropboxSessionManager_deleteItem_completionHandler___block_invoke;
  v10[3] = &unk_264E5E6B8;
  id v11 = v6;
  id v9 = v6;
  [(WFDropboxSessionManager *)self sendRPCRequestWithPath:@"files/delete" parameters:v8 completionHandler:v10];
}

void __56__WFDropboxSessionManager_deleteItem_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  id v8 = 0;
  if (v5 && !v6)
  {
    id v10 = 0;
    id v8 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v10];
    id v7 = v10;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v7);
  }
}

- (id)saveFile:(id)a3 toPath:(id)a4 overwrite:(BOOL)a5 progress:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  v76[4] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v42 = a4;
  id v13 = a6;
  id v14 = a7;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = __Block_byref_object_copy__54533;
  v73[4] = __Block_byref_object_dispose__54534;
  id v15 = v12;
  id v74 = v15;
  id v16 = [v15 modificationDate];
  id v17 = v16;
  if (v16)
  {
    id v43 = v16;
  }
  else
  {
    id v43 = [v15 creationDate];
  }

  v75[0] = @"path";
  uint64_t v18 = WFDropboxProcessPath(v42);
  id v19 = (void *)v18;
  v20 = @"add";
  if (v9) {
    v20 = @"overwrite";
  }
  v76[0] = v18;
  v76[1] = v20;
  v75[1] = @"mode";
  v75[2] = @"autorename";
  uint64_t v21 = MEMORY[0x263EFFA88];
  if (v9) {
    uint64_t v21 = MEMORY[0x263EFFA80];
  }
  v76[2] = v21;
  v75[3] = @"client_modified";
  v22 = +[WFDropboxMetadata clientModifiedDateJSONTransformer];
  id v23 = [v22 reverseTransformedValue:v43];
  v76[3] = v23;
  id v41 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:4];

  uint64_t v24 = [v15 fileSize];
  [v13 setTotalUnitCount:v24];
  [v13 setCompletedUnitCount:0];
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__54533;
  v71[4] = __Block_byref_object_dispose__54534;
  id v72 = 0;
  v25 = objc_opt_new();
  id v26 = [WFStorageServiceCancellableOperation alloc];
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke;
  v68[3] = &unk_264E5EEC0;
  id v27 = v25;
  id v69 = v27;
  v70 = v71;
  v40 = [(WFStorageServiceCancellableOperation *)v26 initWithCancelBlock:v68];
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__234;
  v66 = __Block_byref_object_dispose__235;
  id v67 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_236;
  aBlock[3] = &unk_264E5E6E0;
  id v28 = v14;
  id v59 = v28;
  v60 = v73;
  v61 = &v62;
  id v29 = _Block_copy(aBlock);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_2;
  v44[3] = &unk_264E5E758;
  uint64_t v55 = 157286400;
  uint64_t v56 = v24;
  id v30 = v13;
  id v45 = v30;
  id v31 = v15;
  id v46 = v31;
  unint64_t v57 = (v24 + 157286399) / 0x9600000uLL;
  id v32 = v27;
  v52 = v71;
  id v47 = v32;
  id v48 = self;
  id v33 = v41;
  id v49 = v33;
  id v34 = v29;
  id v50 = v34;
  id v35 = v28;
  id v51 = v35;
  v53 = v73;
  v54 = &v62;
  v36 = _Block_copy(v44);
  id v37 = _Block_copy(v36);
  v38 = (void *)v63[5];
  v63[5] = (uint64_t)v37;

  (*((void (**)(void *, void, void))v36 + 2))(v36, 0, 0);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v73, 8);

  return v40;
}

uint64_t __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
  id v2 = *(void **)(a1 + 32);
  return [v2 unlock];
}

void __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_236(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_opt_class();
  id v8 = WFEnforceClass(v6, v7);

  BOOL v9 = 0;
  if (!v5 && v8)
  {
    id v15 = 0;
    BOOL v9 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v8 error:&v15];
    id v5 = v15;
  }
  uint64_t v10 = a1[4];
  if (v10) {
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v9, v5);
  }
  uint64_t v11 = *(void *)(a1[5] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;

  uint64_t v13 = *(void *)(a1[6] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

void __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v53[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = *(void *)(a1 + 112);
  uint64_t v7 = v6 * a2;
  if (*(void *)(a1 + 120) - v6 * a2 >= v6) {
    uint64_t v8 = *(void *)(a1 + 112);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 120) - v6 * a2;
  }
  objc_msgSend(*(id *)(a1 + 32), "becomeCurrentWithPendingUnitCount:");
  BOOL v9 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:*(void *)(a1 + 112)];
  [*(id *)(a1 + 32) resignCurrent];
  if ([*(id *)(a1 + 40) representationType])
  {
    uint64_t v10 = [WFFileChunkInputStream alloc];
    uint64_t v11 = [*(id *)(a1 + 40) fileURL];
    id v12 = [(WFFileChunkInputStream *)v10 initWithURL:v11 offset:v7 length:v8];
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 40) data];
    uint64_t v13 = objc_msgSend(v11, "subdataWithRange:", v7, v8);
    id v12 = 0;
  }

  if (!a2)
  {
    if (*(void *)(a1 + 128) >= 2uLL)
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_3;
      aBlock[3] = &unk_264E5E708;
      id v45 = *(id *)(a1 + 80);
      long long v46 = *(_OWORD *)(a1 + 96);
      uint64_t v47 = 0;
      id v26 = _Block_copy(aBlock);
      [*(id *)(a1 + 48) lock];
      uint64_t v27 = [*(id *)(a1 + 56) sendContentUploadRequestWithPath:@"files/upload_session/start" parameters:0 data:v13 inputStream:v12 progress:v9 completionHandler:v26];
      uint64_t v28 = *(void *)(*(void *)(a1 + 88) + 8);
      id v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;

      [*(id *)(a1 + 48) unlock];
      id v15 = v45;
      goto LABEL_17;
    }
    id v15 = 0;
    goto LABEL_14;
  }
  v52[0] = @"session_id";
  v52[1] = @"offset";
  v53[0] = v5;
  id v14 = [NSNumber numberWithUnsignedLongLong:v7];
  v53[1] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

  unint64_t v16 = *(void *)(a1 + 128);
  BOOL v17 = v16 > 1;
  unint64_t v18 = v16 - 1;
  if (!v17)
  {
LABEL_14:
    [*(id *)(a1 + 48) lock];
    uint64_t v23 = [*(id *)(a1 + 56) sendContentUploadRequestWithPath:@"files/upload" parameters:*(void *)(a1 + 64) data:v13 inputStream:v12 progress:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 72)];
    uint64_t v24 = *(void *)(*(void *)(a1 + 88) + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    [*(id *)(a1 + 48) unlock];
    goto LABEL_17;
  }
  if (v18 == a2)
  {
    v20 = *(void **)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 64);
    v50[0] = @"commit";
    v50[1] = @"cursor";
    v51[0] = v19;
    v51[1] = v15;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
    id v22 = (id)[v20 sendContentUploadRequestWithPath:@"files/upload_session/finish" parameters:v21 data:v13 inputStream:v12 progress:v9 completionHandler:*(void *)(a1 + 72)];
  }
  else
  {
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    v38 = __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_4;
    id v39 = &unk_264E5E730;
    id v41 = *(id *)(a1 + 80);
    long long v42 = *(_OWORD *)(a1 + 96);
    uint64_t v43 = a2;
    id v40 = v5;
    id v30 = _Block_copy(&v36);
    objc_msgSend(*(id *)(a1 + 48), "lock", v36, v37, v38, v39);
    id v31 = *(void **)(a1 + 56);
    id v48 = @"cursor";
    id v49 = v15;
    id v32 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    uint64_t v33 = [v31 sendContentUploadRequestWithPath:@"files/upload_session/append_v2" parameters:v32 data:v13 inputStream:v12 progress:v9 completionHandler:v30];
    uint64_t v34 = *(void *)(*(void *)(a1 + 88) + 8);
    id v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v33;

    [*(id *)(a1 + 48) unlock];
  }
LABEL_17:
}

void __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v15 objectForKeyedSubscript:@"session_id"];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = WFEnforceClass(v8, v9);

  if (v5 || !v10)
  {
    (*(void (**)(void))(a1[4] + 16))();
    uint64_t v11 = *(void *)(a1[5] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    uint64_t v13 = *(void *)(a1[6] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
  else
  {
    (*(void (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16))();
  }
}

void __80__WFDropboxSessionManager_saveFile_toPath_overwrite_progress_completionHandler___block_invoke_4(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v4 = *(void *)(a1[6] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    uint64_t v6 = *(void *)(a1[7] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(*(void *)(a1[7] + 8) + 40) + 16);
    v8();
  }
}

- (void)createFolderAtPath:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v12 = @"path";
  uint64_t v7 = WFDropboxProcessPath(a3);
  v13[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__WFDropboxSessionManager_createFolderAtPath_completionHandler___block_invoke;
  v10[3] = &unk_264E5E6B8;
  id v11 = v6;
  id v9 = v6;
  [(WFDropboxSessionManager *)self sendRPCRequestWithPath:@"files/create_folder" parameters:v8 completionHandler:v10];
}

void __64__WFDropboxSessionManager_createFolderAtPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = 0;
  if (v5 && !v6)
  {
    id v10 = 0;
    uint64_t v8 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v10];
    id v7 = v10;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v7);
  }
}

- (void)getContentsOfFolderWithParameters:(id)a3 previous:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 objectForKeyedSubscript:@"cursor"];
  id v12 = @"files/list_folder/continue";
  if (!v11) {
    id v12 = @"files/list_folder";
  }
  uint64_t v13 = v12;

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__WFDropboxSessionManager_getContentsOfFolderWithParameters_previous_completionHandler___block_invoke;
  void v16[3] = &unk_264E5EB10;
  unint64_t v18 = self;
  id v19 = v9;
  id v17 = v8;
  id v14 = v8;
  id v15 = v9;
  [(WFDropboxSessionManager *)self sendRPCRequestWithPath:v13 parameters:v10 completionHandler:v16];
}

void __88__WFDropboxSessionManager_getContentsOfFolderWithParameters_previous_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v8 = [v5 objectForKeyedSubscript:@"entries"];
    uint64_t v9 = objc_opt_class();
    id v10 = WFEnforceClass(v8, v9);

    if (v10)
    {
      id v25 = 0;
      id v11 = [MEMORY[0x263F86840] modelsOfClass:objc_opt_class() fromJSONArray:v10 error:&v25];
      id v12 = v25;
      if (!v12)
      {
        uint64_t v13 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:v11];
        id v14 = [v5 objectForKeyedSubscript:@"has_more"];
        uint64_t v15 = objc_opt_class();
        unint64_t v16 = WFEnforceClass(v14, v15);
        int v17 = [v16 BOOLValue];

        unint64_t v18 = [v5 objectForKeyedSubscript:@"cursor"];
        uint64_t v19 = objc_opt_class();
        v20 = WFEnforceClass(v18, v19);

        if (v17 && v20)
        {
          uint64_t v21 = *(void **)(a1 + 40);
          id v26 = @"cursor";
          uint64_t v27 = v20;
          id v22 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          [v21 getContentsOfFolderWithParameters:v22 previous:v13 completionHandler:*(void *)(a1 + 48)];
        }
        else
        {
          uint64_t v23 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1];
          v28[0] = v23;
          uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
          id v22 = [v13 sortedArrayUsingDescriptors:v24];

          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        }

        id v7 = 0;
        goto LABEL_13;
      }
      id v7 = v12;
    }
    else
    {
      id v7 = 0;
      id v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:

    goto LABEL_14;
  }
  id v7 = v6;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_14:
}

- (void)getContentsOfFolderAtPath:(id)a3 completionHandler:(id)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"path";
  id v6 = a4;
  id v7 = WFDropboxProcessPath(a3);
  v9[1] = @"recursive";
  v10[0] = v7;
  v10[1] = MEMORY[0x263EFFA80];
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [(WFDropboxSessionManager *)self getContentsOfFolderWithParameters:v8 previous:MEMORY[0x263EFFA68] completionHandler:v6];
}

- (void)getItemAtPath:(id)a3 completionHandler:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v12 = @"path";
  id v7 = WFDropboxProcessPath(a3);
  v13[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__WFDropboxSessionManager_getItemAtPath_completionHandler___block_invoke;
  void v10[3] = &unk_264E5E6B8;
  id v11 = v6;
  id v9 = v6;
  [(WFDropboxSessionManager *)self sendRPCRequestWithPath:@"files/get_metadata" parameters:v8 completionHandler:v10];
}

void __59__WFDropboxSessionManager_getItemAtPath_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  id v8 = 0;
  if (v5 && !v6)
  {
    id v10 = 0;
    id v8 = [MEMORY[0x263F86840] modelOfClass:objc_opt_class() fromJSONDictionary:v5 error:&v10];
    id v7 = v10;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v7);
  }
}

- (WFDropboxSessionManager)initWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFDropboxSessionManager;
  id v5 = [(WFDropboxSessionManager *)&v18 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFC640];
    id v7 = v4;
    if (!v4)
    {
      id v7 = objc_msgSend(MEMORY[0x263EFC648], "wf_defaultSessionConfiguration");
    }
    uint64_t v8 = [v6 sessionWithConfiguration:v7 delegate:v5 delegateQueue:0];
    session = v5->_session;
    v5->_session = (NSURLSession *)v8;

    if (!v4) {
    uint64_t v10 = [NSURL URLWithString:@"https://api.dropboxapi.com/2"];
    }
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    uint64_t v12 = [NSURL URLWithString:@"https://content.dropboxapi.com/2"];
    contentBaseURL = v5->_contentBaseURL;
    v5->_contentBaseURL = (NSURL *)v12;

    uint64_t v14 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    progressTable = v5->_progressTable;
    v5->_progressTable = (NSMapTable *)v14;

    unint64_t v16 = v5;
  }

  return v5;
}

- (WFDropboxSessionManager)init
{
  return [(WFDropboxSessionManager *)self initWithSessionConfiguration:0];
}

@end