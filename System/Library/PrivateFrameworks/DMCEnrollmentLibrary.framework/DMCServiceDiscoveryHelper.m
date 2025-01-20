@interface DMCServiceDiscoveryHelper
- (id)_defaultServiceDiscoveryQueryItemsWithUserIdentifier:(id)a3;
- (id)_fallbackServer;
- (void)_checkForESSOWithMethod:(unint64_t)a3 authParams:(id)a4 httpResponse:(id)a5 completionHandler:(id)a6;
- (void)_discoverAppleServerWithUserIdentifier:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5;
- (void)_discoverServerURLForDomain:(id)a3 port:(id)a4 userIdentifier:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7;
- (void)_discoverServerURLForUserIdentifier:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5;
- (void)_fetchESSODictionaryFromURL:(id)a3 completionHandler:(id)a4;
- (void)_serversFromWellKnownURL:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5;
- (void)determineEnrollmentMethodWithServiceURL:(id)a3 enrollmentType:(unint64_t)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7;
- (void)discoverEnrollmentMethodWithServiceURL:(id)a3 enrollmentType:(unint64_t)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7;
- (void)discoverServerForUserIdentifier:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5;
- (void)fetchEnrollmentProfileWithServiceURL:(id)a3 authToken:(id)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7;
- (void)fetchEnrollmentProfileWithServiceURL:(id)a3 authTokens:(id)a4 enrollmentMethod:(unint64_t)a5 machineInfo:(id)a6 anchorCertificateRefs:(id)a7 completionHandler:(id)a8;
- (void)fetchEnrollmentProfileWithServiceURL:(id)a3 username:(id)a4 password:(id)a5 authTokens:(id)a6 enrollmentMethod:(unint64_t)a7 machineInfo:(id)a8 anchorCertificateRefs:(id)a9 completionHandler:(id)a10;
@end

@implementation DMCServiceDiscoveryHelper

- (void)discoverServerForUserIdentifier:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, uint64_t, void))a5;
  v11 = [v8 componentsSeparatedByString:@"@"];
  if ([v11 count] == 2)
  {
    v12 = [v11 objectAtIndexedSubscript:1];
    if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment])
    {
      v13 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225D9B000, v13, OS_LOG_TYPE_DEFAULT, "Simulating service discovery.", buf, 2u);
      }
      v14 = (void *)MEMORY[0x263F38BD0];
      v15 = [MEMORY[0x263F38B70] simulatedMDMEnrollmentMode];
      v16 = [v14 buildWithVersion:v15 baseURL:@"https://mdm.example.com/sign-in"];

      v32 = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
      v10[2](v10, v17, 3, 0);
    }
    else
    {
      uint64_t v21 = [MEMORY[0x263F38B70] serviceDiscoveryDomainWithValue:v12];

      v22 = (void *)MEMORY[0x263F38B70];
      v23 = [NSNumber numberWithInteger:443];
      v24 = [v22 serviceDiscoveryDefaultPortWithValue:v23];
      uint64_t v25 = [v24 integerValue];

      v26 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v34 = v21;
        _os_log_impl(&dword_225D9B000, v26, OS_LOG_TYPE_DEBUG, "Domain is: %{public}@", buf, 0xCu);
      }
      v27 = [NSNumber numberWithInteger:v25];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke;
      v28[3] = &unk_264779128;
      v31 = v10;
      v28[4] = self;
      id v29 = v8;
      id v30 = v9;
      [(DMCServiceDiscoveryHelper *)self _discoverServerURLForDomain:v21 port:v27 userIdentifier:v29 anchorCertificateRefs:v30 completionHandler:v28];

      v16 = v31;
      v12 = (void *)v21;
    }
  }
  else
  {
    v18 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = (uint64_t)v8;
      _os_log_impl(&dword_225D9B000, v18, OS_LOG_TYPE_ERROR, "User identifier is wrong format for discovery: %{public}@", buf, 0xCu);
    }
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F38A38];
    v12 = DMCErrorArray();
    v16 = objc_msgSend(v19, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, 15000, v12, *MEMORY[0x263F38A40], v8, 0);
    ((void (**)(id, void *, uint64_t, void *))v10)[2](v10, 0, 0, v16);
  }
}

void __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke_2;
    v11[3] = &unk_264779128;
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v14 = v7;
    v11[4] = v8;
    id v12 = v9;
    id v13 = *(id *)(a1 + 48);
    [v4 _discoverServerURLForUserIdentifier:v5 anchorCertificateRefs:v6 completionHandler:v11];
  }
  else
  {
    v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v10();
  }
}

void __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke_3;
    v9[3] = &unk_264779100;
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    [v4 _discoverAppleServerWithUserIdentifier:v5 anchorCertificateRefs:v6 completionHandler:v9];
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v8();
  }
}

void __101__DMCServiceDiscoveryHelper_discoverServerForUserIdentifier_anchorCertificateRefs_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_225D9B000, v5, OS_LOG_TYPE_ERROR, "Failed to discover apple well-known URL with error: %{public}@", buf, 0xCu);
    }
    uint64_t v6 = [*(id *)(a1 + 32) _fallbackServer];
    id v7 = (void *)v6;
    uint64_t v8 = *(void *)(a1 + 40);
    if (v6)
    {
      uint64_t v10 = v6;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
      (*(void (**)(uint64_t, void *, uint64_t, void))(v8 + 16))(v8, v9, 3, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, uint64_t, id))(v8 + 16))(v8, 0, 2, v4);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)discoverEnrollmentMethodWithServiceURL:(id)a3 enrollmentType:(unint64_t)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __135__DMCServiceDiscoveryHelper_discoverEnrollmentMethodWithServiceURL_enrollmentType_machineInfo_anchorCertificateRefs_completionHandler___block_invoke;
  v14[3] = &unk_264779150;
  id v15 = v12;
  id v13 = v12;
  [(DMCServiceDiscoveryHelper *)self determineEnrollmentMethodWithServiceURL:a3 enrollmentType:a4 machineInfo:a5 anchorCertificateRefs:a6 completionHandler:v14];
}

void __135__DMCServiceDiscoveryHelper_discoverEnrollmentMethodWithServiceURL_enrollmentType_machineInfo_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v7 = [a3 objectForKeyedSubscript:@"url"];
  if (v7)
  {
    uint64_t v8 = [NSURL URLWithString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)determineEnrollmentMethodWithServiceURL:(id)a3 enrollmentType:(unint64_t)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7
{
  v34[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment])
  {
    v16 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225D9B000, v16, OS_LOG_TYPE_DEFAULT, "Simulating determination of enrollment method.", buf, 2u);
    }
    v17 = [MEMORY[0x263F38B70] simulatedMDMAccountDrivenEnrollmentAuthMethod];
    v18 = [MEMORY[0x263F527F0] authenticationMethod];
    char v19 = [v17 isEqualToString:v18];

    if (v19)
    {
      uint64_t v20 = 2;
    }
    else
    {
      v22 = [MEMORY[0x263F52848] authenticationMethod];
      char v23 = [v17 isEqualToString:v22];

      if (v23)
      {
        uint64_t v20 = 5;
      }
      else
      {
        v24 = [MEMORY[0x263F52838] authenticationMethod];
        int v25 = [v17 isEqualToString:v24];

        if (v25) {
          uint64_t v20 = 1;
        }
        else {
          uint64_t v20 = 2;
        }
      }
    }
    uint64_t v26 = *MEMORY[0x263F527B8];
    v33[0] = *MEMORY[0x263F527A0];
    v33[1] = v26;
    v34[0] = v17;
    v34[1] = @"https://mdm.example.com/auth";
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    (*((void (**)(id, uint64_t, void *, void, void))v15 + 2))(v15, v20, v21, 0, 0);
  }
  else
  {
    v17 = [MEMORY[0x263F089E0] requestWithURL:v12];
    [v17 setAttribution:1];
    [v17 setHTTPMethod:*MEMORY[0x263F38AA0]];
    [v17 setTimeoutInterval:*MEMORY[0x263F38AA8]];
    [v17 setValue:@"application/pkcs7-signature" forHTTPHeaderField:@"Content-Type"];
    [v17 setHTTPBody:v13];
    uint64_t v21 = objc_opt_new();
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __136__DMCServiceDiscoveryHelper_determineEnrollmentMethodWithServiceURL_enrollmentType_machineInfo_anchorCertificateRefs_completionHandler___block_invoke;
    v27[3] = &unk_264779178;
    id v28 = v12;
    id v30 = v15;
    unint64_t v31 = a4;
    id v29 = self;
    [v21 startWithRequest:v17 username:0 password:0 anchorCertificateRefs:v14 completionBlock:v27];
  }
}

void __136__DMCServiceDiscoveryHelper_determineEnrollmentMethodWithServiceURL_enrollmentType_machineInfo_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = v9;
    v11 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v36 = v12;
      __int16 v37 = 2114;
      id v38 = v10;
      _os_log_impl(&dword_225D9B000, v11, OS_LOG_TYPE_ERROR, "Failed to discover enrollment method with service URL: %{public}@, error: %{public}@", buf, 0x16u);
    }
LABEL_14:
    id v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v8;
      _os_log_impl(&dword_225D9B000, v15, OS_LOG_TYPE_ERROR, "Response from the MDM server does not follow the HTTP protocol: %@", buf, 0xCu);
    }
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F38A38];
    v18 = DMCErrorArray();
    objc_msgSend(v16, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v17, 15003, v18, 0, *MEMORY[0x263F38A40], 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  id v10 = v8;
  if ([v10 statusCode] != 200 && objc_msgSend(v10, "statusCode") != 401)
  {
    char v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  uint64_t v13 = *(void *)(a1 + 56);
  if ((unint64_t)(v13 - 1) > 2)
  {
LABEL_20:
    if ((v13 & 0xFFFFFFFFFFFFFFFELL) != 4 || [v10 statusCode] == 401)
    {
      uint64_t v20 = (void *)MEMORY[0x263F527E8];
      uint64_t v21 = [v10 allHeaderFields];
      v22 = [v21 objectForKeyedSubscript:*MEMORY[0x263F38A90]];
      id v34 = 0;
      uint64_t v23 = [v20 enrollmentMethodFromAuthenticateString:v22 outParams:&v34];
      id v24 = v34;

      if (v23)
      {
        [*(id *)(a1 + 40) _checkForESSOWithMethod:v23 authParams:v24 httpResponse:v10 completionHandler:*(void *)(a1 + 48)];
      }
      else
      {
        int v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = *MEMORY[0x263F38A38];
        v27 = DMCErrorArray();
        id v28 = objc_msgSend(v25, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v26, 15003, v27, 0, *MEMORY[0x263F38A40], 0);

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      goto LABEL_32;
    }
    id v29 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v36 = v10;
      _os_log_impl(&dword_225D9B000, v29, OS_LOG_TYPE_ERROR, "Server's response is not 401 for the BYOD/ADDE enrollment. Response: %{public}@", buf, 0xCu);
    }
    id v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F38A38];
LABEL_31:
    v33 = DMCErrorArray();
    objc_msgSend(v30, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v31, 15003, v33, 0, *MEMORY[0x263F38A40], 0);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_32:

    goto LABEL_16;
  }
  if ([v10 statusCode] != 200)
  {
    uint64_t v13 = *(void *)(a1 + 56);
    goto LABEL_20;
  }
  if (![v7 length])
  {
    char v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_29:
      v32 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      id v36 = v32;
      __int16 v37 = 2114;
      id v38 = v10;
      _os_log_impl(&dword_225D9B000, v19, OS_LOG_TYPE_ERROR, "Failed to discover enrollment method with service URL: %{public}@, response: %{public}@", buf, 0x16u);
    }
LABEL_30:
    id v30 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F38A38];
    goto LABEL_31;
  }
  id v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_15:
  v14();
LABEL_16:
}

- (void)fetchEnrollmentProfileWithServiceURL:(id)a3 authToken:(id)a4 machineInfo:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v19 = *MEMORY[0x263F527B0];
  v20[0] = a4;
  id v12 = NSDictionary;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [v12 dictionaryWithObjects:v20 forKeys:&v19 count:1];

  [(DMCServiceDiscoveryHelper *)self fetchEnrollmentProfileWithServiceURL:v17 authTokens:v18 enrollmentMethod:1 machineInfo:v15 anchorCertificateRefs:v14 completionHandler:v13];
}

- (void)fetchEnrollmentProfileWithServiceURL:(id)a3 authTokens:(id)a4 enrollmentMethod:(unint64_t)a5 machineInfo:(id)a6 anchorCertificateRefs:(id)a7 completionHandler:(id)a8
{
}

- (void)fetchEnrollmentProfileWithServiceURL:(id)a3 username:(id)a4 password:(id)a5 authTokens:(id)a6 enrollmentMethod:(unint64_t)a7 machineInfo:(id)a8 anchorCertificateRefs:(id)a9 completionHandler:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (([MEMORY[0x263F38B70] shouldSimulateMDMAccountDrivenEnrollment] & 1) == 0
    && ![MEMORY[0x263F38B70] shouldSimulateDEPCommunication])
  {
    id v25 = [MEMORY[0x263F089E0] requestWithURL:v15];
    [v25 setAttribution:1];
    [v25 setHTTPMethod:*MEMORY[0x263F38AA0]];
    [v25 setTimeoutInterval:*MEMORY[0x263F38AA8]];
    [v25 setValue:@"application/pkcs7-signature" forHTTPHeaderField:@"Content-Type"];
    [v25 setHTTPBody:v19];
    uint64_t v26 = objc_opt_new();
    switch(a7)
    {
      case 5uLL:
        v27 = (Class *)0x263F52848;
        break;
      case 2uLL:
        v27 = (Class *)0x263F527F0;
        break;
      case 1uLL:
        v27 = (Class *)0x263F52838;
        break;
      default:
LABEL_13:
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __164__DMCServiceDiscoveryHelper_fetchEnrollmentProfileWithServiceURL_username_password_authTokens_enrollmentMethod_machineInfo_anchorCertificateRefs_completionHandler___block_invoke_2;
        v30[3] = &unk_2647791A0;
        id v31 = v15;
        id v32 = v21;
        id v29 = v21;
        [v26 startWithRequest:v25 username:v16 password:v17 anchorCertificateRefs:v20 completionBlock:v30];

        goto LABEL_14;
    }
    id v28 = (void *)[objc_alloc(*v27) initWithTokens:v18];
    [v26 setAuthenticator:v28];

    goto LABEL_13;
  }
  v22 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225D9B000, v22, OS_LOG_TYPE_DEFAULT, "Simulating enrollment profile.", buf, 2u);
  }
  dispatch_time_t v23 = dispatch_time(0, 1000000000);
  id v24 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __164__DMCServiceDiscoveryHelper_fetchEnrollmentProfileWithServiceURL_username_password_authTokens_enrollmentMethod_machineInfo_anchorCertificateRefs_completionHandler___block_invoke;
  block[3] = &unk_264778D28;
  id v34 = v21;
  id v25 = v21;
  dispatch_after(v23, v24, block);

  uint64_t v26 = v34;
LABEL_14:
}

void __164__DMCServiceDiscoveryHelper_fetchEnrollmentProfileWithServiceURL_username_password_authTokens_enrollmentMethod_machineInfo_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x263F38B70] simulatedMDMEnrollmentProfile];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __164__DMCServiceDiscoveryHelper_fetchEnrollmentProfileWithServiceURL_username_password_authTokens_enrollmentMethod_machineInfo_anchorCertificateRefs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 134218242;
    uint64_t v32 = [v7 length];
    __int16 v33 = 2114;
    id v34 = v8;
    _os_log_impl(&dword_225D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetch enrollment profile finished with data: %lu bytes, response: %{public}@", buf, 0x16u);
  }
  if (v9)
  {
    id v12 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v13;
      __int16 v33 = 2114;
      id v34 = v9;
      _os_log_impl(&dword_225D9B000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch enrollment profile with service URL: %{public}@, error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v14 = [v8 statusCode];
    if (v14 == 200)
    {
      dispatch_time_t v23 = [MEMORY[0x263F38B70] enrollmentProfileWithDefaultValue:v7];

      if ([v23 length])
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        id v25 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225D9B000, v25, OS_LOG_TYPE_ERROR, "Empty profile!", buf, 2u);
        }
        uint64_t v26 = *(void *)(a1 + 40);
        v27 = (void *)MEMORY[0x263F087E8];
        uint64_t v28 = *MEMORY[0x263F38A38];
        id v29 = DMCErrorArray();
        id v30 = objc_msgSend(v27, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v28, 15003, v29, 0, *MEMORY[0x263F38A40], 0);
        (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v30);
      }
      id v7 = v23;
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F38A38];
      if (v14 == 401)
      {
        id v18 = DMCErrorArray();
        uint64_t v19 = *MEMORY[0x263F38A40];
        id v20 = v16;
        uint64_t v21 = v17;
        uint64_t v22 = 15009;
      }
      else
      {
        id v18 = DMCErrorArray();
        uint64_t v19 = *MEMORY[0x263F38A40];
        id v20 = v16;
        uint64_t v21 = v17;
        uint64_t v22 = 15003;
      }
      id v24 = objc_msgSend(v20, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v21, v22, v18, 0, v19, 0);
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v24);
    }
  }
}

- (void)_discoverServerURLForDomain:(id)a3 port:(id)a4 userIdentifier:(id)a5 anchorCertificateRefs:(id)a6 completionHandler:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  uint64_t v17 = objc_opt_new();
  [v17 setScheme:@"https"];
  [v17 setHost:v16];

  if ([v12 intValue] != 443) {
    [v17 setPort:v12];
  }
  [v17 setPath:@"/.well-known/com.apple.remotemanagement"];
  id v18 = [(DMCServiceDiscoveryHelper *)self _defaultServiceDiscoveryQueryItemsWithUserIdentifier:v15];

  uint64_t v19 = (void *)[v18 mutableCopy];
  if ([MEMORY[0x263F38B68] isAppleInternal]
    && [MEMORY[0x263F38B58] DSLiveOnModeEnabled])
  {
    id v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"ignoreBusinessEssentialsSubscription" value:@"true"];
    [v19 addObject:v20];
  }
  [v17 setQueryItems:v19];
  uint64_t v21 = [v17 URL];
  uint64_t v22 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 138543362;
    id v24 = v21;
    _os_log_impl(&dword_225D9B000, v22, OS_LOG_TYPE_DEBUG, "Well known url is: %{public}@", (uint8_t *)&v23, 0xCu);
  }
  [(DMCServiceDiscoveryHelper *)self _serversFromWellKnownURL:v21 anchorCertificateRefs:v14 completionHandler:v13];
}

- (void)_discoverServerURLForUserIdentifier:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x263F38B70];
  id v11 = a5;
  id v12 = [v10 wellKnownDiscoveryURLWithValue:@"https://axm-servicediscovery.apple.com/mdmBaseURL"];
  if ([MEMORY[0x263F38B68] isWellKnownDiscoveryEnabled])
  {
    id v13 = [MEMORY[0x263F08BA0] componentsWithString:v12];
    id v14 = [(DMCServiceDiscoveryHelper *)self _defaultServiceDiscoveryQueryItemsWithUserIdentifier:v8];
    id v15 = (void *)[v14 mutableCopy];

    if ([MEMORY[0x263F38B68] isAppleInternal]
      && [MEMORY[0x263F38B58] DSLiveOnModeEnabled])
    {
      id v16 = [MEMORY[0x263F08BD0] queryItemWithName:@"ignoreBusinessEssentialsSubscription" value:@"true"];
      [v15 addObject:v16];
    }
    [v13 setQueryItems:v15];
    uint64_t v17 = [v13 URL];
    id v18 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v17;
      _os_log_impl(&dword_225D9B000, v18, OS_LOG_TYPE_DEBUG, "DEP service discovery url is: %{public}@", buf, 0xCu);
    }
    [(DMCServiceDiscoveryHelper *)self _serversFromWellKnownURL:v17 anchorCertificateRefs:v9 completionHandler:v11];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F38A38];
    uint64_t v21 = DMCErrorArray();
    uint64_t v22 = objc_msgSend(v19, "DMCErrorWithDomain:code:descriptionArray:errorType:", v20, 15001, v21, *MEMORY[0x263F38A40], v12, 0);
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v22);
  }
}

- (void)_discoverAppleServerWithUserIdentifier:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x263F08BA0];
  id v9 = (void *)MEMORY[0x263F38B70];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 appleMDMWellKnownURLWithDefaultValue:@"https://axm-adm-enroll.apple.com/.well-known/com.apple.remotemanagement"];
  id v16 = [v8 componentsWithString:v13];

  id v14 = [(DMCServiceDiscoveryHelper *)self _defaultServiceDiscoveryQueryItemsWithUserIdentifier:v12];

  [v16 setQueryItems:v14];
  id v15 = [v16 URL];
  [(DMCServiceDiscoveryHelper *)self _serversFromWellKnownURL:v15 anchorCertificateRefs:v11 completionHandler:v10];
}

- (id)_defaultServiceDiscoveryQueryItemsWithUserIdentifier:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F38B70];
  id v4 = (void *)MEMORY[0x263F38B98];
  id v5 = a3;
  uint64_t v6 = [v4 deviceClass];
  id v7 = [v3 productNameWithDefaultValue:v6];

  id v8 = [MEMORY[0x263F08BD0] queryItemWithName:@"user-identifier" value:v5];

  v12[0] = v8;
  id v9 = [MEMORY[0x263F08BD0] queryItemWithName:@"model-family" value:v7];
  v12[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

- (void)_serversFromWellKnownURL:(id)a3 anchorCertificateRefs:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F089E0];
  id v10 = a4;
  id v11 = [v9 requestWithURL:v7];
  [v11 setAttribution:1];
  [v11 setHTTPMethod:*MEMORY[0x263F38A98]];
  [v11 setTimeoutInterval:90.0];
  id v12 = objc_opt_new();
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __94__DMCServiceDiscoveryHelper__serversFromWellKnownURL_anchorCertificateRefs_completionHandler___block_invoke;
  v15[3] = &unk_2647791A0;
  id v16 = v7;
  id v17 = v8;
  id v13 = v8;
  id v14 = v7;
  [v12 startWithRequest:v11 username:0 password:0 anchorCertificateRefs:v10 completionBlock:v15];
}

void __94__DMCServiceDiscoveryHelper__serversFromWellKnownURL_anchorCertificateRefs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    *(_DWORD *)buf = 134218242;
    uint64_t v55 = [v7 length];
    __int16 v56 = 2114;
    id v57 = v8;
    _os_log_impl(&dword_225D9B000, v11, OS_LOG_TYPE_DEFAULT, "Service URL from wellknown URL request finished with data: %lu bytes, response: %{public}@", buf, 0x16u);
  }
  if (!v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v8;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;
    id v18 = v17;
    if (!v7
      || !v8
      || !v17
      || ([v17 MIMEType],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = [v19 isEqualToString:*MEMORY[0x263F38A78]],
          v19,
          (v20 & 1) == 0))
    {
      id v29 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v55 = v30;
        __int16 v56 = 2114;
        id v57 = v8;
        _os_log_impl(&dword_225D9B000, v29, OS_LOG_TYPE_ERROR, "Invalid well-known response for %{public}@: %{public}@", buf, 0x16u);
      }
      id v31 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = *MEMORY[0x263F38A38];
      uint64_t v33 = *(void *)(a1 + 40);
      uint64_t v48 = *(void *)(a1 + 32);
      DMCErrorArray();
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = objc_msgSend(v31, "DMCErrorWithDomain:code:descriptionArray:errorType:", v32, 15002, v22, *MEMORY[0x263F38A40], v48, 0);
      (*(void (**)(uint64_t, void, void *))(v33 + 16))(v33, 0, v21);
      goto LABEL_25;
    }
    if ([v18 statusCode] != 200)
    {
      uint64_t v34 = *(void *)(a1 + 40);
      uint64_t v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F38A38];
      DMCErrorArray();
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = objc_msgSend(v35, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v36, 15003, v22, 0, *MEMORY[0x263F38A40], 0);
      (*(void (**)(uint64_t, void, void *))(v34 + 16))(v34, 0, v21);
LABEL_25:

      goto LABEL_26;
    }
    id v53 = 0;
    uint64_t v21 = [MEMORY[0x263F38BC8] loadData:v7 serializationType:1 error:&v53];
    id v22 = v53;
    if (v21)
    {
      int v23 = [v21 responseServers];
      if ([v23 count])
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_35:

        goto LABEL_25;
      }
      v42 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        uint64_t v43 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v55 = v43;
        __int16 v56 = 2114;
        id v57 = v7;
        _os_log_impl(&dword_225D9B000, v42, OS_LOG_TYPE_ERROR, "Invalid well-known servers response for %{public}@: no servers: %{public}@", buf, 0x16u);
      }
      v52 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F38A38];
      uint64_t v45 = *(void *)(a1 + 40);
      uint64_t v50 = *(void *)(a1 + 32);
      v41 = DMCErrorArray();
      v46 = objc_msgSend(v52, "DMCErrorWithDomain:code:descriptionArray:errorType:", v44, 15002, v41, *MEMORY[0x263F38A40], v50, 0);
      (*(void (**)(uint64_t, void, void *))(v45 + 16))(v45, 0, v46);
    }
    else
    {
      __int16 v37 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v55 = v38;
        __int16 v56 = 2114;
        id v57 = v22;
        _os_log_impl(&dword_225D9B000, v37, OS_LOG_TYPE_ERROR, "Invalid well-known response for %{public}@: JSON error: %{public}@", buf, 0x16u);
      }
      v51 = (void *)MEMORY[0x263F087E8];
      uint64_t v39 = *MEMORY[0x263F38A38];
      uint64_t v40 = *(void *)(a1 + 40);
      uint64_t v49 = *(void *)(a1 + 32);
      int v23 = DMCErrorArray();
      v41 = objc_msgSend(v51, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v39, 15002, v23, v22, *MEMORY[0x263F38A40], v49, 0);
      (*(void (**)(uint64_t, void, void *))(v40 + 16))(v40, 0, v41);
    }

    goto LABEL_35;
  }
  id v12 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v55 = v13;
    __int16 v56 = 2114;
    id v57 = v9;
    _os_log_impl(&dword_225D9B000, v12, OS_LOG_TYPE_ERROR, "Well-known request for %{public}@ failed: %{public}@", buf, 0x16u);
  }
  id v14 = [v9 domain];
  if (![v14 isEqualToString:*MEMORY[0x263F38AB0]])
  {

    goto LABEL_21;
  }
  uint64_t v15 = [v9 code];

  if (v15 != 23009)
  {
LABEL_21:
    id v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F38A38];
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v47 = *(void *)(a1 + 32);
    v27 = DMCErrorArray();
    uint64_t v28 = objc_msgSend(v24, "DMCErrorWithDomain:code:descriptionArray:errorType:", v25, 15001, v27, *MEMORY[0x263F38A40], v47, 0);
    (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v28);

    goto LABEL_26;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_26:
}

- (id)_fallbackServer
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F38B70] serviceDiscoveryFallbackURLWithValue:0];
  v3 = [MEMORY[0x263F38B70] serviceDiscoveryFallbackServerVersion];
  id v4 = [NSURL URLWithString:v2];

  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543618;
      id v10 = v2;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_ERROR, "Invalid fallback service URL: %{public}@, fallabck server version: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = [MEMORY[0x263F38BD0] buildWithVersion:v3 baseURL:v2];
  }

  return v7;
}

- (void)_checkForESSOWithMethod:(unint64_t)a3 authParams:(id)a4 httpResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  uint64_t v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)MEMORY[0x263F38B58];
    uint64_t v15 = v13;
    int v16 = [v14 ESSOTestModeEnabled];
    id v17 = @"off";
    if (v16) {
      id v17 = @"on";
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = v17;
    _os_log_impl(&dword_225D9B000, v15, OS_LOG_TYPE_DEFAULT, "ESSO Test Mode is %{public}@", buf, 0xCu);
  }
  id v18 = [v12 allHeaderFields];

  int v19 = [MEMORY[0x263F38B58] ESSOTestModeEnabled];
  char v20 = (void *)MEMORY[0x263F38A88];
  if (!v19) {
    char v20 = (void *)MEMORY[0x263F38A80];
  }
  uint64_t v21 = [v18 objectForKeyedSubscript:*v20];

  if (v21)
  {
    uint64_t v22 = [NSURL URLWithString:v21];
    if (v22)
    {
      int v23 = (void *)v22;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __95__DMCServiceDiscoveryHelper__checkForESSOWithMethod_authParams_httpResponse_completionHandler___block_invoke;
      v28[3] = &unk_2647791C8;
      id v30 = v11;
      unint64_t v31 = a3;
      id v29 = v10;
      [(DMCServiceDiscoveryHelper *)self _fetchESSODictionaryFromURL:v23 completionHandler:v28];
    }
    else
    {
      id v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F38A38];
      uint64_t v26 = DMCErrorArray();
      v27 = objc_msgSend(v24, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v25, 15003, v26, 0, *MEMORY[0x263F38A40], 0);

      (*((void (**)(id, void, void, void, void *))v11 + 2))(v11, 0, 0, 0, v27);
    }
  }
  else
  {
    (*((void (**)(id, unint64_t, id, void, void))v11 + 2))(v11, a3, v10, 0, 0);
  }
}

void __95__DMCServiceDiscoveryHelper__checkForESSOWithMethod_authParams_httpResponse_completionHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = a1[5];
  if (a2)
  {
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[4];
    uint64_t v11 = *MEMORY[0x263F527C8];
    v12[0] = a2;
    uint64_t v6 = NSDictionary;
    id v7 = a2;
    id v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, void))(v3 + 16))(v3, v4, v5, v8, 0);
  }
  else
  {
    id v10 = *(void (**)(uint64_t, void, void, void, uint64_t))(v3 + 16);
    id v8 = 0;
    v10(v3, 0, 0, 0, a3);
  }
}

- (void)_fetchESSODictionaryFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F089E0] requestWithURL:v5];
  [v7 setAttribution:1];
  [v7 setHTTPMethod:*MEMORY[0x263F38A98]];
  [v7 setTimeoutInterval:90.0];
  id v8 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__DMCServiceDiscoveryHelper__fetchESSODictionaryFromURL_completionHandler___block_invoke;
  v11[3] = &unk_2647791A0;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 startWithRequest:v7 username:0 password:0 anchorCertificateRefs:0 completionBlock:v11];
}

void __75__DMCServiceDiscoveryHelper__fetchESSODictionaryFromURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    *(_DWORD *)buf = 134218242;
    uint64_t v45 = [v7 length];
    __int16 v46 = 2114;
    id v47 = v8;
    _os_log_impl(&dword_225D9B000, v11, OS_LOG_TYPE_DEFAULT, "Fetch ESSO dictionary request finished with data: %lu bytes, response: %{public}@", buf, 0x16u);
  }
  if (!v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v19 = v8;
    }
    else {
      int v19 = 0;
    }
    id v20 = v19;
    id v17 = v20;
    if (v7
      && v8
      && v20
      && ([v20 MIMEType],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v21 isEqualToString:*MEMORY[0x263F38A78]],
          v21,
          (v22 & 1) != 0))
    {
      if ([v17 statusCode] == 200)
      {
        id v43 = 0;
        int v23 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v43];
        id v18 = v43;
        if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          uint64_t v33 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v45 = v34;
            __int16 v46 = 2114;
            id v47 = v18;
            _os_log_impl(&dword_225D9B000, v33, OS_LOG_TYPE_ERROR, "Invalid ESSO dictionary response for %{public}@: JSON error: %{public}@", buf, 0x16u);
          }
          uint64_t v35 = (void *)MEMORY[0x263F087E8];
          uint64_t v36 = *MEMORY[0x263F38A38];
          uint64_t v37 = *(void *)(a1 + 40);
          uint64_t v42 = *(void *)(a1 + 32);
          uint64_t v38 = DMCErrorArray();
          uint64_t v39 = objc_msgSend(v35, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v36, 15027, v38, v18, *MEMORY[0x263F38A40], v42, 0);
          (*(void (**)(uint64_t, void, void *))(v37 + 16))(v37, 0, v39);

          goto LABEL_22;
        }
        id v24 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      }
      else
      {
        uint64_t v30 = *(void *)(a1 + 40);
        unint64_t v31 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = *MEMORY[0x263F38A38];
        DMCErrorArray();
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        int v23 = objc_msgSend(v31, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v32, 15003, v18, 0, *MEMORY[0x263F38A40], 0);
        id v24 = *(void (**)(void))(v30 + 16);
      }
    }
    else
    {
      uint64_t v25 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v26;
        __int16 v46 = 2114;
        id v47 = v8;
        _os_log_impl(&dword_225D9B000, v25, OS_LOG_TYPE_ERROR, "Invalid well-known response for %{public}@: %{public}@", buf, 0x16u);
      }
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F38A38];
      uint64_t v29 = *(void *)(a1 + 40);
      uint64_t v41 = *(void *)(a1 + 32);
      DMCErrorArray();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      int v23 = objc_msgSend(v27, "DMCErrorWithDomain:code:descriptionArray:errorType:", v28, 15027, v18, *MEMORY[0x263F38A40], v41, 0);
      id v24 = *(void (**)(void))(v29 + 16);
    }
    v24();
LABEL_22:

    goto LABEL_23;
  }
  id v12 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v45 = v13;
    __int16 v46 = 2114;
    id v47 = v9;
    _os_log_impl(&dword_225D9B000, v12, OS_LOG_TYPE_ERROR, "Fetch ESSO dictionary request for %{public}@ failed: %{public}@", buf, 0x16u);
  }
  id v14 = (void *)MEMORY[0x263F087E8];
  uint64_t v15 = *MEMORY[0x263F38A38];
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v40 = *(void *)(a1 + 32);
  id v17 = DMCErrorArray();
  objc_msgSend(v14, "DMCErrorWithDomain:code:descriptionArray:errorType:", v15, 15026, v17, *MEMORY[0x263F38A40], v40, 0);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, 0, v18);
LABEL_23:
}

@end