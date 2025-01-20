@interface WFTodoistSessionManager
- (NSString)syncToken;
- (NSURL)baseURL;
- (NSURLSession)session;
- (WFOAuth2Credential)credential;
- (WFTodoistSessionManager)init;
- (WFTodoistSessionManager)initWithSessionConfiguration:(id)a3;
- (void)createFileOnItemWithId:(int64_t)a3 withFile:(id)a4 completionHandler:(id)a5;
- (void)createItemInProject:(id)a3 content:(id)a4 dueDateString:(id)a5 reminderDateString:(id)a6 reminderService:(int64_t)a7 priority:(int64_t)a8 note:(id)a9 completionHandler:(id)a10;
- (void)getProjectsWithCompletionHandler:(id)a3;
- (void)requestWithCommands:(id)a3 resourceTypes:(id)a4 completionHandler:(id)a5;
- (void)setCredential:(id)a3;
- (void)setSyncToken:(id)a3;
@end

@implementation WFTodoistSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setSyncToken:(id)a3
{
}

- (NSString)syncToken
{
  return self->_syncToken;
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

- (NSURLSession)session
{
  return self->_session;
}

- (void)requestWithCommands:(id)a3 resourceTypes:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v41 = a5;
  v10 = objc_opt_new();
  v11 = (void *)MEMORY[0x263F08BD0];
  v12 = [(WFTodoistSessionManager *)self syncToken];
  v13 = [v11 queryItemWithName:@"sync_token" value:v12];
  [v10 addObject:v13];

  v14 = [(WFTodoistSessionManager *)self credential];
  v15 = [v14 accessToken];

  if (v15)
  {
    v16 = (void *)MEMORY[0x263F08BD0];
    v17 = [(WFTodoistSessionManager *)self credential];
    v18 = [v17 accessToken];
    v19 = [v16 queryItemWithName:@"token" value:v18];
    [v10 addObject:v19];
  }
  v43 = v8;
  if (objc_msgSend(v9, "count", v41))
  {
    v20 = (void *)MEMORY[0x263F08BD0];
    id v21 = [NSString alloc];
    id v47 = 0;
    v22 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:0 error:&v47];
    id v23 = v47;
    v24 = (void *)[v21 initWithData:v22 encoding:4];
    v25 = [v20 queryItemWithName:@"resource_types" value:v24];
    [v10 addObject:v25];

    id v8 = v43;
  }
  else
  {
    id v23 = 0;
  }
  if ([v8 count])
  {
    v26 = (void *)MEMORY[0x263F08BD0];
    id v27 = [NSString alloc];
    id v46 = v23;
    v28 = [MEMORY[0x263F08900] dataWithJSONObject:v8 options:0 error:&v46];
    id v29 = v46;

    v30 = (void *)[v27 initWithData:v28 encoding:4];
    v31 = [v26 queryItemWithName:@"commands" value:v30];
    [v10 addObject:v31];

    id v23 = v29;
  }
  v32 = objc_opt_new();
  [v32 setQueryItems:v10];
  v33 = (void *)MEMORY[0x263EFC5E8];
  v34 = [(WFTodoistSessionManager *)self baseURL];
  v35 = [v34 URLByAppendingPathComponent:@"sync"];
  v36 = [v33 requestWithURL:v35];

  [v36 _setNonAppInitiated:1];
  v37 = [v32 percentEncodedQuery];
  v38 = [v37 dataUsingEncoding:4];
  [v36 setHTTPBody:v38];

  [v36 setHTTPMethod:@"POST"];
  if (v23)
  {
    if (v42) {
      ((void (**)(void, void, id))v42)[2](v42, 0, v23);
    }
  }
  else
  {
    v39 = [(WFTodoistSessionManager *)self session];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __79__WFTodoistSessionManager_requestWithCommands_resourceTypes_completionHandler___block_invoke;
    v44[3] = &unk_264E5B258;
    v44[4] = self;
    v45 = v42;
    v40 = [v39 dataTaskWithRequest:v36 completionHandler:v44];
    [v40 resume];
  }
}

void __79__WFTodoistSessionManager_requestWithCommands_resourceTypes_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 length])
  {
    id v18 = v7;
    id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v18];
    id v9 = v18;

    uint64_t v10 = objc_opt_class();
    v11 = WFEnforceClass(v8, v10);

    if (v11)
    {
      v12 = [v11 objectForKeyedSubscript:@"sync_token"];
      uint64_t v13 = objc_opt_class();
      v14 = WFEnforceClass(v12, v13);

      if (v14) {
        [*(id *)(a1 + 32) setSyncToken:v14];
      }
      uint64_t v15 = *(void *)(a1 + 40);
      if (v15)
      {
        v16 = WFTodoistErrorFromResponseObject(v11);
        (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v11, v16);
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = v7;
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v9);
  }
LABEL_11:
}

- (void)createItemInProject:(id)a3 content:(id)a4 dueDateString:(id)a5 reminderDateString:(id)a6 reminderService:(int64_t)a7 priority:(int64_t)a8 note:(id)a9 completionHandler:(id)a10
{
  v77[1] = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v67 = a6;
  id v66 = a9;
  id v62 = a10;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = objc_opt_new();
  [v17 setValue:v15 forKey:@"content"];

  id v18 = NSNumber;
  uint64_t v19 = [v16 projectId];

  v20 = [v18 numberWithInteger:v19];
  [v17 setValue:v20 forKey:@"project_id"];

  id v21 = [NSNumber numberWithInteger:a8];
  [v17 setValue:v21 forKey:@"priority"];

  v22 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v23 = *MEMORY[0x263EFF508];
  v24 = [v22 objectForKey:*MEMORY[0x263EFF508]];
  [v17 setValue:v24 forKey:@"date_lang"];

  if (v14)
  {
    v76 = @"string";
    v77[0] = v14;
    v25 = [NSDictionary dictionaryWithObjects:v77 forKeys:&v76 count:1];
    [v17 setValue:v25 forKey:@"due"];
  }
  v64 = v14;
  v26 = [MEMORY[0x263F08C38] UUID];
  id v27 = [v26 UUIDString];
  uint64_t v28 = [v27 lowercaseString];

  id v29 = [MEMORY[0x263F08C38] UUID];
  v30 = [v29 UUIDString];
  v31 = [v30 lowercaseString];

  v32 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"item_add" forKey:@"type"];
  [v32 setValue:v31 forKey:@"temp_id"];
  v61 = (void *)v28;
  [v32 setValue:v28 forKey:@"uuid"];
  [v32 setValue:v17 forKey:@"args"];
  v33 = [MEMORY[0x263F08C38] UUID];
  v34 = [v33 UUIDString];
  v65 = [v34 lowercaseString];

  if ([v67 length])
  {
    v35 = [MEMORY[0x263F08C38] UUID];
    v36 = [v35 UUIDString];
    v37 = [v36 lowercaseString];

    v38 = objc_opt_new();
    [v38 setValue:v31 forKey:@"item_id"];
    v39 = [MEMORY[0x263EFF960] currentLocale];
    v40 = [v39 objectForKey:v23];
    [v38 setValue:v40 forKey:@"date_lang"];

    id v41 = @"email";
    if (a7 == 2) {
      id v41 = @"mobile";
    }
    if (a7 == 1) {
      v42 = @"push";
    }
    else {
      v42 = v41;
    }
    [v38 setValue:v42 forKey:@"service"];
    [v38 setValue:@"absolute" forKey:@"type"];
    [v38 setValue:v37 forKey:@"id"];
    if (v67)
    {
      v74 = @"string";
      id v75 = v67;
      v43 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      [v38 setValue:v43 forKey:@"due"];
    }
    v44 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"reminder_add" forKey:@"type"];
    [v44 setValue:v37 forKey:@"temp_id"];
    [v44 setValue:v65 forKey:@"uuid"];
    [v44 setValue:v38 forKey:@"args"];
  }
  else
  {
    v44 = 0;
  }
  v45 = [MEMORY[0x263F08C38] UUID];
  id v46 = [v45 UUIDString];
  id v47 = [v46 lowercaseString];

  if ([v66 length])
  {
    v48 = objc_opt_new();
    [v48 setValue:v31 forKey:@"item_id"];
    [v48 setValue:v66 forKey:@"content"];
    v49 = [MEMORY[0x263F08C38] UUID];
    v50 = [v49 UUIDString];
    v51 = [v50 lowercaseString];

    v52 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"note_add" forKey:@"type"];
    [v52 setValue:v51 forKey:@"temp_id"];
    [v52 setValue:v47 forKey:@"uuid"];
    [v52 setValue:v48 forKey:@"args"];
  }
  else
  {
    v52 = 0;
  }
  v53 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v32, 0);
  v54 = v53;
  if (v52) {
    [v53 addObject:v52];
  }
  if (v44) {
    [v54 addObject:v44];
  }
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __136__WFTodoistSessionManager_createItemInProject_content_dueDateString_reminderDateString_reminderService_priority_note_completionHandler___block_invoke;
  v68[3] = &unk_264E5B230;
  id v69 = v61;
  id v70 = v65;
  id v72 = v31;
  id v73 = v62;
  id v71 = v47;
  id v55 = v31;
  id v56 = v62;
  id v57 = v47;
  id v58 = v65;
  id v59 = v61;
  [(WFTodoistSessionManager *)self requestWithCommands:v54 resourceTypes:0 completionHandler:v68];
}

void __136__WFTodoistSessionManager_createItemInProject_content_dueDateString_reminderDateString_reminderService_priority_note_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v20 = a3;
  id v5 = a2;
  id v6 = [v5 objectForKeyedSubscript:@"sync_status"];
  uint64_t v7 = objc_opt_class();
  id v8 = WFEnforceClass(v6, v7);

  id v9 = [v5 objectForKeyedSubscript:@"temp_id_mapping"];

  uint64_t v10 = objc_opt_class();
  v11 = WFEnforceClass(v9, v10);

  id v12 = v20;
  if (!v20)
  {
    uint64_t v13 = [v8 objectForKeyedSubscript:a1[4]];
    WFTodoistErrorFromResponseObject(v13);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    id v12 = v21;
    if (!v21)
    {
      id v14 = [v8 objectForKeyedSubscript:a1[5]];
      WFTodoistErrorFromResponseObject(v14);
      id v22 = (id)objc_claimAutoreleasedReturnValue();

      id v12 = v22;
      if (!v22)
      {
        id v15 = [v8 objectForKeyedSubscript:a1[6]];
        WFTodoistErrorFromResponseObject(v15);
        id v23 = (id)objc_claimAutoreleasedReturnValue();

        id v12 = v23;
      }
    }
  }
  id v24 = v12;
  uint64_t v16 = a1[8];
  if (v16)
  {
    uint64_t v17 = [v11 objectForKeyedSubscript:a1[7]];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = WFEnforceClass(v17, v18);
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, [v19 integerValue], v24);
  }
}

- (void)createFileOnItemWithId:(int64_t)a3 withFile:(id)a4 completionHandler:(id)a5
{
  id v42 = a5;
  uint64_t v7 = NSString;
  id v8 = a4;
  uint64_t v9 = arc4random();
  uint64_t v10 = objc_msgSend(v7, "stringWithFormat:", @"Boundary+%08X%08X", v9, arc4random());
  v11 = [MEMORY[0x263EFF990] data];
  id v12 = [NSString stringWithFormat:@"--%@\r\n", v10];
  uint64_t v13 = [v12 dataUsingEncoding:4];
  [v11 appendData:v13];

  id v14 = [@"Content-Disposition: form-data name=\"token\"\r\n\r\n" dataUsingEncoding:4];;
  [v11 appendData:v14];

  id v15 = NSString;
  uint64_t v16 = [(WFTodoistSessionManager *)self credential];
  uint64_t v17 = [v16 accessToken];
  uint64_t v18 = [v15 stringWithFormat:@"%@\r\n", v17];
  uint64_t v19 = [v18 dataUsingEncoding:4];
  [v11 appendData:v19];

  id v20 = [NSString stringWithFormat:@"--%@\r\n", v10];
  id v21 = [v20 dataUsingEncoding:4];
  [v11 appendData:v21];

  id v22 = NSString;
  id v23 = [v8 filename];
  objc_msgSend(v22, "stringWithFormat:", @"Content-Disposition: form-data; name=\"file\"; filename=\"%@\"\r\n",
  id v24 = v23);
  v25 = [v24 dataUsingEncoding:4];
  [v11 appendData:v25];

  v26 = NSString;
  id v27 = [v8 wfType];
  uint64_t v28 = [v27 MIMEType];
  id v29 = [v26 stringWithFormat:@"Content-Type: %@\r\n\r\n", v28];
  v30 = [v29 dataUsingEncoding:4];
  [v11 appendData:v30];

  v31 = [v8 mappedData];

  [v11 appendData:v31];
  v32 = [NSString stringWithFormat:@"\r\n--%@--\r\n", v10];
  v33 = [v32 dataUsingEncoding:4];
  [v11 appendData:v33];

  v34 = (void *)MEMORY[0x263EFC5E8];
  v35 = [(WFTodoistSessionManager *)self baseURL];
  v36 = [v35 URLByAppendingPathComponent:@"upload_file"];
  v37 = [v34 requestWithURL:v36];

  [v37 _setNonAppInitiated:1];
  [v37 setHTTPMethod:@"POST"];
  [v37 setHTTPBody:v11];
  v38 = [NSString stringWithFormat:@"multipart/form-data boundary=%@", v10];;
  [v37 setValue:v38 forHTTPHeaderField:@"Content-Type"];

  v39 = [(WFTodoistSessionManager *)self session];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __77__WFTodoistSessionManager_createFileOnItemWithId_withFile_completionHandler___block_invoke;
  v44[3] = &unk_264E5B208;
  id v45 = v42;
  int64_t v46 = a3;
  v44[4] = self;
  id v40 = v42;
  id v41 = [v39 dataTaskWithRequest:v37 completionHandler:v44];
  [v41 resume];
}

void __77__WFTodoistSessionManager_createFileOnItemWithId_withFile_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v33[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if ([v6 length])
  {
    id v32 = v7;
    id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v32];
    id v9 = v32;

    uint64_t v10 = objc_opt_class();
    v11 = WFEnforceClass(v8, v10);

    id v7 = v9;
    if (v9 || (WFTodoistErrorFromResponseObject(v11), (id v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      if (v12) {
        (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v7);
      }
    }
    else
    {
      id v14 = objc_opt_new();
      id v15 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
      [v14 setValue:v15 forKey:@"item_id"];

      [v14 setValue:&stru_26F008428 forKey:@"content"];
      [v14 setValue:v11 forKey:@"file_attachment"];
      uint64_t v16 = [MEMORY[0x263F08C38] UUID];
      uint64_t v17 = [v16 UUIDString];
      uint64_t v18 = [v17 lowercaseString];

      uint64_t v19 = [MEMORY[0x263F08C38] UUID];
      id v20 = [v19 UUIDString];
      id v21 = [v20 lowercaseString];

      id v22 = [MEMORY[0x263EFF9A0] dictionaryWithObject:@"note_add" forKey:@"type"];
      [v22 setValue:v21 forKey:@"temp_id"];
      [v22 setValue:v18 forKey:@"uuid"];
      [v22 setValue:v14 forKey:@"args"];
      id v23 = *(void **)(a1 + 32);
      v33[0] = v22;
      id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __77__WFTodoistSessionManager_createFileOnItemWithId_withFile_completionHandler___block_invoke_2;
      v28[3] = &unk_264E5EB10;
      id v29 = v18;
      id v25 = *(id *)(a1 + 40);
      id v30 = v21;
      id v31 = v25;
      id v26 = v21;
      id v27 = v18;
      [v23 requestWithCommands:v24 resourceTypes:0 completionHandler:v28];

      id v7 = 0;
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v7);
    }
  }
}

void __77__WFTodoistSessionManager_createFileOnItemWithId_withFile_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v17 = a3;
  id v5 = a2;
  id v6 = [v5 objectForKeyedSubscript:@"sync_status"];
  uint64_t v7 = objc_opt_class();
  id v8 = WFEnforceClass(v6, v7);

  id v9 = [v5 objectForKeyedSubscript:@"temp_id_mapping"];

  uint64_t v10 = objc_opt_class();
  v11 = WFEnforceClass(v9, v10);

  if (!v17)
  {
    uint64_t v12 = [v8 objectForKeyedSubscript:a1[4]];
    WFTodoistErrorFromResponseObject(v12);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v13 = a1[6];
  if (v13)
  {
    id v14 = [v11 objectForKeyedSubscript:a1[5]];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = WFEnforceClass(v14, v15);
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, [v16 integerValue], v17);
  }
}

- (void)getProjectsWithCompletionHandler:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9[0] = @"projects";
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__WFTodoistSessionManager_getProjectsWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5E6B8;
  id v8 = v4;
  id v6 = v4;
  [(WFTodoistSessionManager *)self requestWithCommands:0 resourceTypes:v5 completionHandler:v7];
}

void __60__WFTodoistSessionManager_getProjectsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"projects"];
  uint64_t v7 = objc_opt_class();
  id v8 = WFEnforceClass(v6, v7);

  if (v5)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = 0;
    id v9 = [MEMORY[0x263F86840] modelsOfClass:objc_opt_class() fromJSONArray:v8 error:&v10];
    id v5 = v10;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFTodoistSessionManager)initWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFTodoistSessionManager;
  id v5 = [(WFTodoistSessionManager *)&v15 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFC640];
    uint64_t v7 = v4;
    if (!v4)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263EFC648], "wf_defaultSessionConfiguration");
    }
    uint64_t v8 = [v6 sessionWithConfiguration:v7];
    session = v5->_session;
    v5->_session = (NSURLSession *)v8;

    if (!v4) {
    uint64_t v10 = [NSURL URLWithString:@"https://todoist.com/API/v8"];
    }
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    syncToken = v5->_syncToken;
    v5->_syncToken = (NSString *)@"*";

    uint64_t v13 = v5;
  }

  return v5;
}

- (WFTodoistSessionManager)init
{
  return [(WFTodoistSessionManager *)self initWithSessionConfiguration:0];
}

@end