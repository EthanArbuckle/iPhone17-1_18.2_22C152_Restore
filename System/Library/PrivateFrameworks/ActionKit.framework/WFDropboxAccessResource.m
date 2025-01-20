@interface WFDropboxAccessResource
- (Class)accountClass;
- (WFDropboxAccessResource)initWithDefinition:(id)a3;
- (id)associatedAppIdentifier;
- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4;
@end

@implementation WFDropboxAccessResource

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[WFDropboxAccount sessionManager];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v31[3] = &unk_264E59910;
  id v9 = v7;
  v31[4] = self;
  id v32 = v9;
  v10 = [v8 appAuthorizationSessionWithCompletionHandler:v31];
  v11 = [v10 authorizationURLs];
  v12 = (void *)[v11 mutableCopy];

  uint64_t v25 = 0;
  v26 = (id *)&v25;
  uint64_t v27 = 0x3042000000;
  v28 = __Block_byref_object_copy__22454;
  v29 = __Block_byref_object_dispose__22455;
  id v30 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_161;
  v18[3] = &unk_264E59068;
  id v13 = v10;
  id v19 = v13;
  id v14 = v12;
  id v20 = v14;
  id v15 = v6;
  id v21 = v15;
  id v16 = v9;
  v22 = self;
  id v23 = v16;
  v24 = &v25;
  v17 = (void (**)(void, void, void))[v18 copy];
  objc_storeWeak(v26 + 5, v17);
  v17[2](v17, 0, 0);

  _Block_object_dispose(&v25, 8);
  objc_destroyWeak(&v30);
}

void __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = [v5 domain];
  if ([v6 isEqualToString:@"WFOAuth2ErrorDomain"])
  {
    uint64_t v7 = [v5 code];

    if (v7 == 106)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (!v8) {
        goto LABEL_13;
      }
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_12:
      v9();
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (!v14)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (!v13) {
      goto LABEL_13;
    }
    id v9 = *(void (**)(void))(v13 + 16);
    goto LABEL_12;
  }
  v10 = +[WFOAuth2Account accountWithCredential:](WFDropboxAccount, "accountWithCredential:");
  uint64_t v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "accountClass"), "saveAccount:", v10);
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v11, v5);
  }

LABEL_13:
}

void __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_161(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) successURI];
    v4 = [v3 scheme];

    id v5 = [MEMORY[0x263F86830] sharedManager];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
    v14[3] = &unk_264E59040;
    id v15 = *(id *)(a1 + 32);
    id v16 = v5;
    id v17 = v4;
    id v6 = v4;
    id v7 = v5;
    [v7 registerHandler:v14 forIncomingRequestsWithAction:0 scheme:v6];
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) firstObject];
    if (v7)
    {
      [*(id *)(a1 + 40) removeObjectAtIndex:0];
      uint64_t v8 = [MEMORY[0x263F33718] sharedContext];
      uint64_t v9 = *(void *)(a1 + 48);
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
      [v8 openURL:v7 withBundleIdentifier:@"com.getdropbox.Dropbox" userInterface:v9 completionHandler:WeakRetained];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 64);
      v13.receiver = *(id *)(a1 + 56);
      v13.super_class = (Class)WFDropboxAccessResource;
      objc_msgSendSuper2(&v13, sel_makeAvailableWithUserInterface_completionHandler_, v11, v12);
    }
  }
}

uint64_t __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  v4 = [a2 URL];
  [v3 resumeSessionWithURL:v4];

  id v5 = (void *)a1[5];
  uint64_t v6 = a1[6];
  return [v5 removeHandlerForIncomingRequestsWithAction:0 scheme:v6];
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (WFDropboxAccessResource)initWithDefinition:(id)a3
{
  v44[3] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)WFDropboxAccessResource;
  v3 = [(WFAccountAccessResource *)&v35 initWithDefinition:a3];
  if (v3)
  {
    if (!+[WFAccount numberOfAccounts])
    {
      if (WFMigrateDropboxToV2_onceToken != -1) {
        dispatch_once(&WFMigrateDropboxToV2_onceToken, &__block_literal_global_22466);
      }
      if ([(id)WFMigrateDropboxToV2_lock tryLock])
      {
        uint64_t v4 = *MEMORY[0x263F171C8];
        uint64_t v5 = *MEMORY[0x263F16E80];
        v43[0] = *MEMORY[0x263F171B8];
        v43[1] = v5;
        uint64_t v6 = *MEMORY[0x263F33B50];
        v44[0] = v4;
        v44[1] = v6;
        v43[2] = *MEMORY[0x263F17090];
        v44[2] = @"is.workflow.my.app.dropbox.auth";
        id v7 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v7];
        uint64_t v9 = *MEMORY[0x263F17410];
        uint64_t v10 = *MEMORY[0x263F17520];
        v41[0] = *MEMORY[0x263F17400];
        v41[1] = v10;
        uint64_t v11 = *MEMORY[0x263EFFB40];
        v42[0] = v9;
        v42[1] = v11;
        uint64_t v12 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
        [v8 addEntriesFromDictionary:v12];

        CFTypeRef result = 0;
        if (SecItemCopyMatching((CFDictionaryRef)v8, &result) || !result)
        {
          [(id)WFMigrateDropboxToV2_lock unlock];
        }
        else
        {
          id v13 = objc_alloc(MEMORY[0x263F08928]);
          id v14 = (void *)result;
          id v15 = (void *)[v13 initForReadingFromData:result error:0];

          if (v15)
          {
            id v16 = [v15 decodePropertyListForKey:*MEMORY[0x263F081D0]];
            uint64_t v17 = objc_opt_class();
            v18 = WFEnforceClass(v16, v17);

            id v19 = [v18 objectForKeyedSubscript:@"DBCredentialVersion"];
            uint64_t v20 = objc_opt_class();
            id v21 = WFEnforceClass(v19, v20);
            uint64_t v22 = [v21 integerValue];

            if (v22 == 3)
            {
              id v23 = [v18 objectForKeyedSubscript:@"kMPOAuthCredentialConsumerKey"];
              uint64_t v24 = objc_opt_class();
              uint64_t v25 = WFEnforceClass(v23, v24);

              v26 = +[WFDropboxAccount clientID];
              char v27 = [v25 isEqualToString:v26];

              if (v27)
              {
                v28 = [v18 objectForKeyedSubscript:@"kDBDropboxUserCredentials"];
                uint64_t v29 = objc_opt_class();
                id v30 = WFEnforceClass(v28, v29);

                if ([v30 count])
                {
                  v31 = +[WFDropboxAccount sessionManager];
                  v38[0] = MEMORY[0x263EF8330];
                  v38[1] = 3221225472;
                  v38[2] = __WFMigrateDropboxToV2_block_invoke_2;
                  v38[3] = &unk_264E590B8;
                  id v39 = v31;
                  v36[0] = MEMORY[0x263EF8330];
                  v36[1] = 3221225472;
                  v36[2] = __WFMigrateDropboxToV2_block_invoke_4;
                  v36[3] = &unk_264E5EEE8;
                  id v37 = v7;
                  id v32 = v31;
                  objc_msgSend(v30, "if_mapAsynchronously:completionHandler:", v38, v36);
                }
                else
                {
                  [(id)WFMigrateDropboxToV2_lock unlock];
                }
              }
              else
              {
                [(id)WFMigrateDropboxToV2_lock unlock];
              }
            }
            else
            {
              [(id)WFMigrateDropboxToV2_lock unlock];
            }
          }
          else
          {
            [(id)WFMigrateDropboxToV2_lock unlock];
          }
        }
      }
    }
    v33 = v3;
  }

  return v3;
}

- (id)associatedAppIdentifier
{
  return @"com.getdropbox.Dropbox";
}

@end