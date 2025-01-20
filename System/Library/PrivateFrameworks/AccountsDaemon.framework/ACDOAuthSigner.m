@interface ACDOAuthSigner
+ (id)new;
- (ACDOAuthSigner)init;
- (ACDOAuthSigner)initWithClient:(id)a3 databaseConnection:(id)a4;
- (BOOL)_permissionGrantedForBundleID:(id)a3 onAccountType:(id)a4;
- (id)_signedRequest:(id)a3 withAccountObject:(id)a4 applicationID:(id)a5 timestamp:(id)a6;
- (id)ckForAccountType:(id)a3;
- (id)csForAccountType:(id)a3;
- (id)signedRequest:(id)a3 withAccount:(id)a4 applicationID:(id)a5 timestamp:(id)a6;
- (void)setClientBundleID:(id)a3 withHandler:(id)a4;
- (void)setShouldIncludeAppIdInRequest:(BOOL)a3;
- (void)signURLRequest:(id)a3 withAccount:(id)a4 applicationID:(id)a5 timestamp:(id)a6 handler:(id)a7;
- (void)signURLRequest:(id)a3 withAccount:(id)a4 callingPID:(id)a5 timestamp:(id)a6 handler:(id)a7;
@end

@implementation ACDOAuthSigner

+ (id)new
{
  return 0;
}

- (ACDOAuthSigner)init
{
  return 0;
}

- (ACDOAuthSigner)initWithClient:(id)a3 databaseConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACDOAuthSigner;
  v9 = [(ACDOAuthSigner *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong((id *)&v10->_databaseConnection, a4);
    v10->_shouldIncludeAppIdInRequest = 1;
    v11 = [[ACDClientAuthorizationManager alloc] initWithDatabaseConnection:v10->_databaseConnection];
    authorizationManager = v10->_authorizationManager;
    v10->_authorizationManager = v11;
  }
  return v10;
}

- (void)setShouldIncludeAppIdInRequest:(BOOL)a3
{
  self->_shouldIncludeAppIdInRequest = a3;
}

- (void)setClientBundleID:(id)a3 withHandler:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  if ([(ACDClient *)self->_client hasEntitlement:*MEMORY[0x263EFB2E0]]
    && (client = self->_client) != 0)
  {
    [(ACDClient *)client setBundleID:v9];
    v6[2](v6, 1, 0);
  }
  else
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v8);
  }
}

- (id)_signedRequest:(id)a3 withAccountObject:(id)a4 applicationID:(id)a5 timestamp:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__5;
  v35 = __Block_byref_object_dispose__5;
  id v36 = 0;
  objc_super v14 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __75__ACDOAuthSigner__signedRequest_withAccountObject_applicationID_timestamp___block_invoke;
  v26 = &unk_2643217A0;
  id v15 = v11;
  id v27 = v15;
  v30 = &v31;
  id v16 = v10;
  id v28 = v16;
  v29 = self;
  [v14 performBlockAndWait:&v23];

  id v17 = objc_alloc(MEMORY[0x263F5B5B8]);
  v18 = objc_msgSend(v17, "initWithCredential:", v32[5], v23, v24, v25, v26);
  v19 = v18;
  if (self->_shouldIncludeAppIdInRequest) {
    id v20 = v12;
  }
  else {
    id v20 = 0;
  }
  v21 = [v18 signedURLRequestWithRequest:v16 applicationID:v20 timestamp:v13];

  _Block_object_dispose(&v31, 8);

  return v21;
}

void __75__ACDOAuthSigner__signedRequest_withAccountObject_applicationID_timestamp___block_invoke(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) accountType];
  id v2 = objc_alloc_init(MEMORY[0x263F5B5B0]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = [*(id *)(a1 + 40) _propertyForKey:@"PreferredOAuthConsumerKey"];
  uint64_t v6 = [*(id *)(a1 + 40) _propertyForKey:@"PreferredOAuthConsumerSecret"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = [*(id *)(a1 + 48) ckForAccountType:v14];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setConsumerKey:v9];

    id v10 = [*(id *)(a1 + 48) csForAccountType:v14];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setConsumerSecret:v10];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setConsumerKey:v5];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setConsumerSecret:v7];
  }
  id v11 = +[ACDKeychainManager credentialForManagedAccountObject:*(void *)(a1 + 32)];
  id v12 = [v11 oauthToken];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setOauthToken:v12];

  id v13 = [v11 oauthTokenSecret];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setOauthTokenSecret:v13];
}

- (void)signURLRequest:(id)a3 withAccount:(id)a4 callingPID:(id)a5 timestamp:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__5;
  v58 = __Block_byref_object_dispose__5;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__5;
  v52 = __Block_byref_object_dispose__5;
  id v53 = 0;
  id v17 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  uint64_t v40 = MEMORY[0x263EF8330];
  uint64_t v41 = 3221225472;
  v42 = __74__ACDOAuthSigner_signURLRequest_withAccount_callingPID_timestamp_handler___block_invoke;
  v43 = &unk_264320E58;
  v46 = &v54;
  v44 = self;
  id v18 = v13;
  id v45 = v18;
  v47 = &v48;
  [v17 performBlockAndWait:&v40];

  if (!v55[5])
  {
    id v20 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263EFB070], 6, 0, v40, v41, v42, v43, v44);
    v16[2](v16, 0, v20);
    goto LABEL_19;
  }
  if (v14 && (int)objc_msgSend(v14, "intValue", v40, v41, v42, v43, v44) >= 1)
  {
    if (![(ACDClient *)self->_client hasEntitlement:*MEMORY[0x263EFB2D0]])
    {
      v32 = _ACDLogSystem();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[ACDOAuthSigner signURLRequest:withAccount:callingPID:timestamp:handler:](v32, v33, v34, v35, v36, v37, v38, v39);
      }

      id v20 = 0;
      goto LABEL_8;
    }
    [v14 intValue];
    uint64_t v19 = ACDGetAdamOrDisplayIDForPID();
  }
  else
  {
    uint64_t v19 = [(ACDClient *)self->_client adamOrDisplayID];
  }
  id v20 = (void *)v19;
LABEL_8:
  if ([(ACDClient *)self->_client hasEntitlement:*MEMORY[0x263EFB2B0]]
    || ([(ACDClient *)self->_client bundleID],
        v21 = objc_claimAutoreleasedReturnValue(),
        BOOL v22 = [(ACDOAuthSigner *)self _permissionGrantedForBundleID:v21 onAccountType:v49[5]], v21, v22))
  {
    if (v20 || !self->_shouldIncludeAppIdInRequest)
    {
      uint64_t v23 = [(ACDOAuthSigner *)self _signedRequest:v12 withAccountObject:v55[5] applicationID:v20 timestamp:v15];
      ((void (**)(id, void *, void *))v16)[2](v16, v23, 0);
    }
    else
    {
      uint64_t v24 = _ACLogSystem();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[ACDOAuthSigner signURLRequest:withAccount:callingPID:timestamp:handler:](v24, v25, v26, v27, v28, v29, v30, v31);
      }

      uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:1 userInfo:0];
      v16[2](v16, 0, v23);
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:7 userInfo:0];
    v16[2](v16, 0, v23);
  }

LABEL_19:
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
}

void __74__ACDOAuthSigner_signURLRequest_withAccount_callingPID_timestamp_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) objectID];
  uint64_t v4 = [v2 existingObjectWithURI:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = objc_alloc(MEMORY[0x263EFB220]);
    id v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) accountType];
    uint64_t v8 = [v7 initWithManagedAccountType:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (id)signedRequest:(id)a3 withAccount:(id)a4 applicationID:(id)a5 timestamp:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__5;
  uint64_t v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  id v14 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__ACDOAuthSigner_signedRequest_withAccount_applicationID_timestamp___block_invoke;
  v18[3] = &unk_264320A48;
  id v20 = &v21;
  v18[4] = self;
  id v15 = v11;
  id v19 = v15;
  [v14 performBlockAndWait:v18];

  id v16 = [(ACDOAuthSigner *)self _signedRequest:v10 withAccountObject:v22[5] applicationID:v12 timestamp:v13];

  _Block_object_dispose(&v21, 8);

  return v16;
}

void __68__ACDOAuthSigner_signedRequest_withAccount_applicationID_timestamp___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = [*(id *)(a1 + 40) objectID];
  uint64_t v3 = [v2 existingObjectWithURI:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)signURLRequest:(id)a3 withAccount:(id)a4 applicationID:(id)a5 timestamp:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__5;
  v49 = __Block_byref_object_dispose__5;
  id v50 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5;
  v43 = __Block_byref_object_dispose__5;
  id v44 = 0;
  id v17 = [(ACDDatabaseConnection *)self->_databaseConnection managedObjectContext];
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  uint64_t v33 = __77__ACDOAuthSigner_signURLRequest_withAccount_applicationID_timestamp_handler___block_invoke;
  uint64_t v34 = &unk_264320E58;
  uint64_t v37 = &v45;
  uint64_t v35 = self;
  id v18 = v13;
  id v36 = v18;
  uint64_t v38 = &v39;
  [v17 performBlockAndWait:&v31];

  if (!v46[5])
  {
    BOOL v22 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263EFB070], 6, 0, v31, v32, v33, v34, v35);
    v16[2](v16, 0, v22);
    goto LABEL_11;
  }
  BOOL v19 = -[ACDClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x263EFB2B0], v31, v32, v33, v34, v35);
  if (!v14)
  {
    uint64_t v23 = _ACDLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ACDOAuthSigner signURLRequest:withAccount:applicationID:timestamp:handler:](v23, v24, v25, v26, v27, v28, v29, v30);
    }

    goto LABEL_10;
  }
  if (!v19)
  {
    id v20 = [(ACDClient *)self->_client bundleID];
    BOOL v21 = [(ACDOAuthSigner *)self _permissionGrantedForBundleID:v20 onAccountType:v40[5]];

    if (!v21)
    {
LABEL_10:
      BOOL v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:1 userInfo:0];
      v16[2](v16, 0, v22);
      goto LABEL_11;
    }
  }
  BOOL v22 = [(ACDOAuthSigner *)self _signedRequest:v12 withAccountObject:v46[5] applicationID:v14 timestamp:v15];
  ((void (**)(id, void *, void *))v16)[2](v16, v22, 0);
LABEL_11:

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);
}

void __77__ACDOAuthSigner_signURLRequest_withAccount_applicationID_timestamp_handler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) objectID];
  uint64_t v4 = [v2 existingObjectWithURI:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = objc_alloc(MEMORY[0x263EFB220]);
    id v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) accountType];
    uint64_t v8 = [v7 initWithManagedAccountType:v11];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)_permissionGrantedForBundleID:(id)a3 onAccountType:(id)a4
{
  id v6 = a4;
  id v7 = +[ACDClient clientWithBundleID:a3];
  uint64_t v8 = [(ACDClientAuthorizationManager *)self->_authorizationManager authorizationForClient:v7 accountType:v6];

  char v9 = [v8 isGranted];
  return v9;
}

- (id)ckForAccountType:(id)a3
{
  v14[6] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFAFA0];
  v13[0] = *MEMORY[0x263EFAFD0];
  v13[1] = v3;
  v14[0] = @"XX[E:QjlmkJZqTBNhLOT:g";
  v14[1] = @"3878861889";
  uint64_t v4 = *MEMORY[0x263EFAED8];
  v13[2] = @"com.apple.linkedin";
  v13[3] = v4;
  v14[2] = @"lh11ykuiycpw";
  v14[3] = @"b84f8d61205456:e:416:fd08c7811:4";
  uint64_t v5 = *MEMORY[0x263EFAFB8];
  v13[4] = *MEMORY[0x263EFAFD8];
  v13[5] = v5;
  v14[4] = @"97d4b8:a6350926e2ab4gedefa7432:2:88530f7";
  v14[5] = @"902265845";
  id v6 = NSDictionary;
  id v7 = a3;
  uint64_t v8 = [v6 dictionaryWithObjects:v14 forKeys:v13 count:6];
  char v9 = [v7 identifier];

  id v10 = [v8 objectForKey:v9];

  if (v10)
  {
    id v11 = decodeString(v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)csForAccountType:(id)a3
{
  v14[6] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263EFAFA0];
  v13[0] = *MEMORY[0x263EFAFD0];
  v13[1] = v3;
  v14[0] = @"Bav5TVOpCZd0XCrn8DuQrMGZbkHivaFYBnsbz3HUJE";
  v14[1] = @"9911g0d2c25782d6ebed:a4dbc14762c";
  uint64_t v4 = *MEMORY[0x263EFAED8];
  v13[2] = @"com.apple.linkedin";
  v13[3] = v4;
  v14[2] = @"{Mgj6CGuJT:c{qMb";
  v14[3] = @"f058gbed57167f91";
  uint64_t v5 = *MEMORY[0x263EFAFB8];
  v13[4] = *MEMORY[0x263EFAFD8];
  v13[5] = v5;
  v14[4] = @"33b67328e3fe8c697325g9d1666c672agbcagc1f";
  v14[5] = @"49b7ccffdbg14a5b234345cf1acc86c4";
  id v6 = NSDictionary;
  id v7 = a3;
  uint64_t v8 = [v6 dictionaryWithObjects:v14 forKeys:v13 count:6];
  char v9 = [v7 identifier];

  id v10 = [v8 objectForKey:v9];

  if (v10)
  {
    id v11 = decodeString(v10);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_databaseConnection, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)signURLRequest:(uint64_t)a3 withAccount:(uint64_t)a4 callingPID:(uint64_t)a5 timestamp:(uint64_t)a6 handler:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)signURLRequest:(uint64_t)a3 withAccount:(uint64_t)a4 callingPID:(uint64_t)a5 timestamp:(uint64_t)a6 handler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)signURLRequest:(uint64_t)a3 withAccount:(uint64_t)a4 applicationID:(uint64_t)a5 timestamp:(uint64_t)a6 handler:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end