@interface DEPClient
- (DEPClient)init;
- (DEPDeviceUploadCredentials)userCredentials;
- (DEPDeviceUploadOrganization)organization;
- (DEPDeviceUploadSubmitDeviceRequestPayload)deviceUploadRequest;
- (NSData)pushToken;
- (NSString)nonce;
- (NSString)pushTopic;
- (NSXPCConnection)connection;
- (id)_cloudConfigRetrievalBlockWithClientCompletionBlock:(id)a3;
- (id)_connectionError;
- (id)_organizationFromDict:(id)a3;
- (id)_organizationsFromArray:(id)a3;
- (id)_requestTypesFromDict:(id)a3;
- (id)_soldToIdsFromDict:(id)a3;
- (id)callback;
- (void)_callServiceByType:(int64_t)a3 onProxy:(id)a4 completionBlock:(id)a5;
- (void)_completeServiceWithSuccess:(BOOL)a3 response:(id)a4 error:(id)a5;
- (void)_retrieveProxyObjectAndRunServiceType:(int64_t)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)fetchConfigurationWithCompletionBlock:(id)a3;
- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3;
- (void)pingWithCompletionBlock:(id)a3;
- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4;
- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5;
- (void)setCallback:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDeviceUploadRequest:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOrganization:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setPushTopic:(id)a3;
- (void)setUserCredentials:(id)a3;
- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5;
- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5;
- (void)unenrollWithCompletionBlock:(id)a3;
@end

@implementation DEPClient

- (DEPClient)init
{
  v17.receiver = self;
  v17.super_class = (Class)DEPClient;
  v2 = [(DEPClient *)&v17 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.managedconfiguration.teslad" options:4096];
    v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38DEBD0];
    [(NSXPCConnection *)v3 setRemoteObjectInterface:v4];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __17__DEPClient_init__block_invoke;
    v15[3] = &unk_1E6CD3D80;
    v5 = v2;
    v16 = v5;
    [(NSXPCConnection *)v3 setInterruptionHandler:v15];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __17__DEPClient_init__block_invoke_2;
    v13 = &unk_1E6CD3D80;
    v6 = v5;
    v14 = v6;
    [(NSXPCConnection *)v3 setInvalidationHandler:&v10];
    [(NSXPCConnection *)v3 resume];
    connection = v6->_connection;
    v6->_connection = v3;
    v8 = v3;
  }
  return v2;
}

void __17__DEPClient_init__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _connectionError];
  [v1 _completeServiceWithSuccess:0 response:0 error:v2];
}

void __17__DEPClient_init__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _connectionError];
  [v1 _completeServiceWithSuccess:0 response:0 error:v2];
}

- (void)dealloc
{
  v3 = [(DEPClient *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)DEPClient;
  [(DEPClient *)&v4 dealloc];
}

- (id)_connectionError
{
  v8 = (void *)MEMORY[0x1E4F28C58];
  v9 = DEPErrorArray(@"CLOUD_CONFIG_XPC_FAILURE", (uint64_t)a2, v2, v3, v4, v5, v6, v7, 0, v12);
  uint64_t v10 = [v8 DEPErrorWithDomain:@"DEPCloudConfigErrorDomain" code:33023 descriptionArray:v9 errorType:@"DEPFatalError"];

  return v10;
}

- (void)_completeServiceWithSuccess:(BOOL)a3 response:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *DEPLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1DD6A9000, v10, OS_LOG_TYPE_DEFAULT, "Service completed", v13, 2u);
  }
  uint64_t v11 = [(DEPClient *)self callback];
  if (v11)
  {
    [(DEPClient *)self setCallback:0];
    ((void (**)(void, BOOL, id, id))v11)[2](v11, v6, v8, v9);
  }
  uint64_t v12 = [(DEPClient *)self connection];
  [v12 invalidate];

  [(DEPClient *)self setConnection:0];
}

- (void)_callServiceByType:(int64_t)a3 onProxy:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *DEPLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1DD6A9000, v10, OS_LOG_TYPE_DEFAULT, "Calling service on proxy", v19, 2u);
  }
  switch(a3)
  {
    case 0:
      uint64_t v11 = [(DEPClient *)self nonce];
      [v8 provisionallyEnrollWithNonce:v11 completionBlock:v9];

      [(DEPClient *)self setNonce:0];
      break;
    case 1:
      [v8 fetchConfigurationWithCompletionBlock:v9];
      break;
    case 2:
      [v8 fetchConfigurationWithoutValidationWithCompletionBlock:v9];
      break;
    case 3:
      [v8 unenrollWithCompletionBlock:v9];
      break;
    case 4:
      uint64_t v12 = [(DEPClient *)self userCredentials];
      [v8 retrieveDeviceUploadOrganizationsWithCredentials:v12 completionBlock:v9];
      goto LABEL_10;
    case 5:
      uint64_t v12 = [(DEPClient *)self userCredentials];
      [v8 retrieveDeviceUploadRequestTypesWithCredentials:v12 completionBlock:v9];
LABEL_10:

      goto LABEL_13;
    case 6:
      v13 = [(DEPClient *)self organization];
      v14 = [(DEPClient *)self userCredentials];
      [v8 retrieveDeviceUploadSoldToIdsForOrganization:v13 credentials:v14 completionBlock:v9];

      [(DEPClient *)self setOrganization:0];
      goto LABEL_13;
    case 7:
      v15 = [(DEPClient *)self deviceUploadRequest];
      v16 = [(DEPClient *)self userCredentials];
      [v8 submitDeviceUploadRequest:v15 credentials:v16 completionBlock:v9];

      [(DEPClient *)self setDeviceUploadRequest:0];
LABEL_13:
      [(DEPClient *)self setUserCredentials:0];
      break;
    case 8:
      [v8 pingWithCompletionBlock:v9];
      break;
    case 9:
      objc_super v17 = [(DEPClient *)self pushToken];
      v18 = [(DEPClient *)self pushTopic];
      [v8 syncDEPPushToken:v17 pushTopic:v18 completionBlock:v9];

      break;
    default:
      break;
  }
}

- (void)_retrieveProxyObjectAndRunServiceType:(int64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(DEPClient *)self connection];
  if (v7)
  {
    [(DEPClient *)self setCallback:v6];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__DEPClient__retrieveProxyObjectAndRunServiceType_completionBlock___block_invoke;
    v14[3] = &unk_1E6CD3DA8;
    v14[4] = self;
    id v8 = [v7 remoteObjectProxyWithErrorHandler:v14];
    if (v8)
    {
      objc_initWeak(&location, self);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __67__DEPClient__retrieveProxyObjectAndRunServiceType_completionBlock___block_invoke_2;
      v11[3] = &unk_1E6CD3DD0;
      objc_copyWeak(&v12, &location);
      id v9 = (void *)MEMORY[0x1E01BCA00](v11);
      [(DEPClient *)self _callServiceByType:a3 onProxy:v8 completionBlock:v9];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v10 = [(DEPClient *)self _connectionError];
    [(DEPClient *)self _completeServiceWithSuccess:0 response:0 error:v10];
  }
}

uint64_t __67__DEPClient__retrieveProxyObjectAndRunServiceType_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completeServiceWithSuccess:0 response:0 error:a2];
}

void __67__DEPClient__retrieveProxyObjectAndRunServiceType_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _completeServiceWithSuccess:a2 response:v8 error:v7];
}

- (void)provisionallyEnrollWithNonce:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  [(DEPClient *)self setNonce:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__DEPClient_provisionallyEnrollWithNonce_completionBlock___block_invoke;
  v8[3] = &unk_1E6CD3DF8;
  id v9 = v6;
  id v7 = v6;
  [(DEPClient *)self _retrieveProxyObjectAndRunServiceType:0 completionBlock:v8];
}

void __58__DEPClient_provisionallyEnrollWithNonce_completionBlock___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v18 = a3;
  id v14 = a4;
  if ((a2 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    v16 = DEPErrorArray(@"CLOUD_CONFIG_PROVISIONAL_ENROLLMENT_FAILED", v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v18);
    uint64_t v17 = [v15 DEPErrorWithDomain:@"DEPCloudConfigErrorDomain" code:33007 descriptionArray:v16 underlyingError:v14 errorType:@"DEPFatalError"];

    id v14 = (id)v17;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchConfigurationWithCompletionBlock:(id)a3
{
  id v4 = [(DEPClient *)self _cloudConfigRetrievalBlockWithClientCompletionBlock:a3];
  [(DEPClient *)self _retrieveProxyObjectAndRunServiceType:1 completionBlock:v4];
}

- (void)fetchConfigurationWithoutValidationWithCompletionBlock:(id)a3
{
  id v4 = [(DEPClient *)self _cloudConfigRetrievalBlockWithClientCompletionBlock:a3];
  [(DEPClient *)self _retrieveProxyObjectAndRunServiceType:2 completionBlock:v4];
}

- (void)unenrollWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__DEPClient_unenrollWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E6CD3DF8;
  id v7 = v4;
  id v5 = v4;
  [(DEPClient *)self _retrieveProxyObjectAndRunServiceType:3 completionBlock:v6];
}

void __41__DEPClient_unenrollWithCompletionBlock___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v18 = a3;
  id v14 = a4;
  if ((a2 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    v16 = DEPErrorArray(@"CLOUD_CONFIG_UNENROLLMENT_FAILED", v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v18);
    uint64_t v17 = [v15 DEPErrorWithDomain:@"DEPCloudConfigErrorDomain" code:33008 descriptionArray:v16 underlyingError:v14 errorType:@"DEPFatalError"];

    id v14 = (id)v17;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveDeviceUploadOrganizationsWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  [(DEPClient *)self setUserCredentials:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__DEPClient_retrieveDeviceUploadOrganizationsWithCredentials_completionBlock___block_invoke;
  v8[3] = &unk_1E6CD3E20;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(DEPClient *)self _retrieveProxyObjectAndRunServiceType:4 completionBlock:v8];
}

void __78__DEPClient_retrieveDeviceUploadOrganizationsWithCredentials_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v19 = a4;
  if (a2)
  {
    id v14 = *(void **)(a1 + 32);
    v15 = [a3 objectForKeyedSubscript:@"organizations"];
    v16 = [v14 _organizationsFromArray:v15];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    v15 = DEPErrorArray(@"CLOUD_CONFIG_DEVICE_UPLOAD_RETRIEVE_ORGANIZATION_REQUEST_FAILED", v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    uint64_t v18 = [v17 DEPErrorWithDomain:@"DEPCloudConfigErrorDomain" code:33019 descriptionArray:v15 underlyingError:v20 errorType:@"DEPFatalError"];

    v16 = 0;
    id v19 = (id)v18;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveDeviceUploadRequestTypesWithCredentials:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  [(DEPClient *)self setUserCredentials:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__DEPClient_retrieveDeviceUploadRequestTypesWithCredentials_completionBlock___block_invoke;
  v8[3] = &unk_1E6CD3E20;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(DEPClient *)self _retrieveProxyObjectAndRunServiceType:5 completionBlock:v8];
}

void __77__DEPClient_retrieveDeviceUploadRequestTypesWithCredentials_completionBlock___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v19 = a4;
  if (a2)
  {
    id v14 = [*(id *)(a1 + 32) _requestTypesFromDict:a3];
    id v15 = v19;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = DEPErrorArray(@"CLOUD_CONFIG_DEVICE_UPLOAD_RETRIEVE_REQUEST_TYPES_FAILED", v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    uint64_t v18 = [v16 DEPErrorWithDomain:@"DEPCloudConfigErrorDomain" code:33020 descriptionArray:v17 underlyingError:v20 errorType:@"DEPFatalError"];

    id v14 = 0;
    id v15 = (id)v18;
  }
  id v21 = v15;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retrieveDeviceUploadSoldToIdsForOrganization:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(DEPClient *)self setUserCredentials:a4];
  [(DEPClient *)self setOrganization:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__DEPClient_retrieveDeviceUploadSoldToIdsForOrganization_credentials_completionBlock___block_invoke;
  v11[3] = &unk_1E6CD3E20;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(DEPClient *)self _retrieveProxyObjectAndRunServiceType:6 completionBlock:v11];
}

void __86__DEPClient_retrieveDeviceUploadSoldToIdsForOrganization_credentials_completionBlock___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v19 = a4;
  if (a2)
  {
    id v14 = [*(id *)(a1 + 32) _soldToIdsFromDict:a3];
    id v15 = v19;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = DEPErrorArray(@"CLOUD_CONFIG_DEVICE_UPLOAD_RETRIEVE_ORGANIZATION_SOLD_TO_IDS_FAILED", v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    uint64_t v18 = [v16 DEPErrorWithDomain:@"DEPCloudConfigErrorDomain" code:33021 descriptionArray:v17 underlyingError:v20 errorType:@"DEPFatalError"];

    id v14 = 0;
    id v15 = (id)v18;
  }
  id v21 = v15;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)submitDeviceUploadRequest:(id)a3 credentials:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(DEPClient *)self setDeviceUploadRequest:a3];
  [(DEPClient *)self setUserCredentials:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__DEPClient_submitDeviceUploadRequest_credentials_completionBlock___block_invoke;
  v11[3] = &unk_1E6CD3DF8;
  id v12 = v8;
  id v10 = v8;
  [(DEPClient *)self _retrieveProxyObjectAndRunServiceType:7 completionBlock:v11];
}

void __67__DEPClient_submitDeviceUploadRequest_credentials_completionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v19 = a3;
  id v14 = a4;
  if (a2)
  {
    id v15 = [[DEPDeviceUploadSubmissionResponse alloc] initWithDict:v19];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = DEPErrorArray(@"CLOUD_CONFIG_DEVICE_UPLOAD_SUBMIT_REQUEST_FAILED", v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    uint64_t v18 = [v16 DEPErrorWithDomain:@"DEPCloudConfigErrorDomain" code:33022 descriptionArray:v17 underlyingError:v14 errorType:@"DEPFatalError"];

    id v15 = 0;
    id v14 = (id)v18;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)syncDEPPushToken:(id)a3 pushTopic:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(DEPClient *)self setPushToken:a3];
  [(DEPClient *)self setPushTopic:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__DEPClient_syncDEPPushToken_pushTopic_completionBlock___block_invoke;
  v11[3] = &unk_1E6CD3DF8;
  id v12 = v8;
  id v10 = v8;
  [(DEPClient *)self _retrieveProxyObjectAndRunServiceType:9 completionBlock:v11];
}

void __56__DEPClient_syncDEPPushToken_pushTopic_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v19 = a3;
  id v14 = a4;
  if ((a2 & 1) == 0)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    v16 = DEPErrorArray(@"CLOUD_CONFIG_PROVISIONAL_ENROLLMENT_FAILED", v7, v8, v9, v10, v11, v12, v13, 0, (uint64_t)v19);
    uint64_t v17 = [v15 DEPErrorWithDomain:@"DEPCloudConfigErrorDomain" code:33024 descriptionArray:v16 underlyingError:v14 errorType:@"DEPFatalError"];

    id v14 = (id)v17;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v18 + 16))(v18, a2, v19, v14);
  }
}

- (void)pingWithCompletionBlock:(id)a3
{
}

- (id)_cloudConfigRetrievalBlockWithClientCompletionBlock:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__DEPClient__cloudConfigRetrievalBlockWithClientCompletionBlock___block_invoke;
  v7[3] = &unk_1E6CD3DF8;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1E01BCA00](v7);

  return v5;
}

void __65__DEPClient__cloudConfigRetrievalBlockWithClientCompletionBlock___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v20 = v7;
  if (a2)
  {
    v16 = (void *)[v20 mutableCopy];
    [v16 setObject:&unk_1F38DC3B0 forKeyedSubscript:@"ConfigurationSource"];
    uint64_t v17 = v20;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = DEPErrorArray(@"CLOUD_CONFIG_NOT_AVAILABLE", v9, v10, v11, v12, v13, v14, v15, 0, (uint64_t)v20);
    uint64_t v19 = [v18 DEPErrorWithDomain:@"DEPCloudConfigErrorDomain" code:33001 descriptionArray:v17 underlyingError:v8 errorType:@"DEPFatalError"];

    v16 = v20;
    id v8 = (id)v19;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_organizationsFromArray:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[DEPClient _organizationFromDict:](self, "_organizationFromDict:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];
  return v12;
}

- (id)_organizationFromDict:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[DEPDeviceUploadOrganization alloc] initWithDict:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_requestTypesFromDict:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [DEPDeviceUploadRequestType alloc];
        uint64_t v12 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v16);
        uint64_t v13 = [(DEPDeviceUploadRequestType *)v11 initWithCode:v10 name:v12];

        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  long long v14 = (void *)[v4 copy];
  return v14;
}

- (id)_soldToIdsFromDict:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 objectForKeyedSubscript:@"soldToIds"];
  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 objectForKeyedSubscript:@"soldToIds"];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKeyedSubscript:@"soldToId"];
            [v4 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
    }
  }
  long long v14 = (void *)[v4 copy];

  return v14;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (DEPDeviceUploadCredentials)userCredentials
{
  return self->_userCredentials;
}

- (void)setUserCredentials:(id)a3
{
}

- (DEPDeviceUploadOrganization)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
}

- (DEPDeviceUploadSubmitDeviceRequestPayload)deviceUploadRequest
{
  return self->_deviceUploadRequest;
}

- (void)setDeviceUploadRequest:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_deviceUploadRequest, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_userCredentials, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end