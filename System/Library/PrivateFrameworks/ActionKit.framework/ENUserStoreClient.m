@interface ENUserStoreClient
+ (id)userStoreClientWithUrl:(id)a3 authenticationToken:(id)a4;
- (EDAMUserStoreClient)client;
- (ENUserStoreClient)initWithUserStoreUrl:(id)a3 authenticationToken:(id)a4;
- (NSString)authenticationToken;
- (id)authenticateToBusiness;
- (void)authenticateToBusinessWithCompletion:(id)a3;
- (void)authenticateToBusinessWithSuccess:(id)a3 failure:(id)a4;
- (void)checkVersionWithClientName:(id)a3 edamVersionMajor:(signed __int16)a4 edamVersionMinor:(signed __int16)a5 completion:(id)a6;
- (void)checkVersionWithClientName:(id)a3 edamVersionMajor:(signed __int16)a4 edamVersionMinor:(signed __int16)a5 success:(id)a6 failure:(id)a7;
- (void)fetchBootstrapInfoWithLocale:(id)a3 completion:(id)a4;
- (void)fetchNoteStoreURLWithCompletion:(id)a3;
- (void)fetchPremiumInfoWithCompletion:(id)a3;
- (void)fetchPublicUserInfoWithUsername:(id)a3 completion:(id)a4;
- (void)fetchUserWithCompletion:(id)a3;
- (void)getBootstrapInfoWithLocale:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getNoteStoreUrlWithSuccess:(id)a3 failure:(id)a4;
- (void)getPremiumInfoWithSuccess:(id)a3 failure:(id)a4;
- (void)getPublicUserInfoWithUsername:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getUserWithSuccess:(id)a3 failure:(id)a4;
- (void)revokeLongSessionWithAuthenticationToken:(id)a3 completion:(id)a4;
- (void)revokeLongSessionWithAuthenticationToken:(id)a3 success:(id)a4 failure:(id)a5;
- (void)setAuthenticationToken:(id)a3;
- (void)setClient:(id)a3;
@end

@implementation ENUserStoreClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setClient:(id)a3
{
}

- (EDAMUserStoreClient)client
{
  return self->_client;
}

- (void)revokeLongSessionWithAuthenticationToken:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__ENUserStoreClient_revokeLongSessionWithAuthenticationToken_success_failure___block_invoke;
  v12[3] = &unk_264E5C670;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENUserStoreClient *)self revokeLongSessionWithAuthenticationToken:a3 completion:v12];
}

uint64_t __78__ENUserStoreClient_revokeLongSessionWithAuthenticationToken_success_failure___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)authenticateToBusinessWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__ENUserStoreClient_authenticateToBusinessWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C8A0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENUserStoreClient *)self authenticateToBusinessWithCompletion:v10];
}

uint64_t __63__ENUserStoreClient_authenticateToBusinessWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getNoteStoreUrlWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__ENUserStoreClient_getNoteStoreUrlWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C7B0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENUserStoreClient *)self fetchNoteStoreURLWithCompletion:v10];
}

uint64_t __56__ENUserStoreClient_getNoteStoreUrlWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getPremiumInfoWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__ENUserStoreClient_getPremiumInfoWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E57490;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENUserStoreClient *)self fetchPremiumInfoWithCompletion:v10];
}

uint64_t __55__ENUserStoreClient_getPremiumInfoWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getPublicUserInfoWithUsername:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__ENUserStoreClient_getPublicUserInfoWithUsername_success_failure___block_invoke;
  v12[3] = &unk_264E57468;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENUserStoreClient *)self fetchPublicUserInfoWithUsername:a3 completion:v12];
}

uint64_t __67__ENUserStoreClient_getPublicUserInfoWithUsername_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getUserWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__ENUserStoreClient_getUserWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E57440;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENUserStoreClient *)self fetchUserWithCompletion:v10];
}

uint64_t __48__ENUserStoreClient_getUserWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getBootstrapInfoWithLocale:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__ENUserStoreClient_getBootstrapInfoWithLocale_success_failure___block_invoke;
  v12[3] = &unk_264E57418;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENUserStoreClient *)self fetchBootstrapInfoWithLocale:a3 completion:v12];
}

uint64_t __64__ENUserStoreClient_getBootstrapInfoWithLocale_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)checkVersionWithClientName:(id)a3 edamVersionMajor:(signed __int16)a4 edamVersionMinor:(signed __int16)a5 success:(id)a6 failure:(id)a7
{
  uint64_t v8 = a5;
  uint64_t v9 = a4;
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__ENUserStoreClient_checkVersionWithClientName_edamVersionMajor_edamVersionMinor_success_failure___block_invoke;
  v16[3] = &unk_264E573F0;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENUserStoreClient *)self checkVersionWithClientName:a3 edamVersionMajor:v9 edamVersionMinor:v8 completion:v16];
}

uint64_t __98__ENUserStoreClient_checkVersionWithClientName_edamVersionMajor_edamVersionMinor_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)revokeLongSessionWithAuthenticationToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__ENUserStoreClient_revokeLongSessionWithAuthenticationToken_completion___block_invoke;
  v8[3] = &unk_264E5DED8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncBlock:v8 completion:a4];
}

void __73__ENUserStoreClient_revokeLongSessionWithAuthenticationToken_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  [v2 revokeLongSession:*(void *)(a1 + 40)];
}

- (void)authenticateToBusinessWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__ENUserStoreClient_authenticateToBusinessWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __58__ENUserStoreClient_authenticateToBusinessWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [*(id *)(a1 + 32) authenticationToken];
  v4 = [v2 authenticateToBusiness:v3];

  return v4;
}

- (void)fetchNoteStoreURLWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__ENUserStoreClient_fetchNoteStoreURLWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __53__ENUserStoreClient_fetchNoteStoreURLWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [*(id *)(a1 + 32) authenticationToken];
  v4 = [v2 getNoteStoreUrl:v3];

  return v4;
}

- (void)fetchPremiumInfoWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__ENUserStoreClient_fetchPremiumInfoWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __52__ENUserStoreClient_fetchPremiumInfoWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [*(id *)(a1 + 32) authenticationToken];
  v4 = [v2 getPremiumInfo:v3];

  return v4;
}

- (void)fetchPublicUserInfoWithUsername:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__ENUserStoreClient_fetchPublicUserInfoWithUsername_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __64__ENUserStoreClient_fetchPublicUserInfoWithUsername_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 getPublicUserInfo:*(void *)(a1 + 40)];

  return v3;
}

- (void)fetchUserWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __45__ENUserStoreClient_fetchUserWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __45__ENUserStoreClient_fetchUserWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [*(id *)(a1 + 32) authenticationToken];
  v4 = [v2 getUser:v3];

  return v4;
}

- (void)fetchBootstrapInfoWithLocale:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__ENUserStoreClient_fetchBootstrapInfoWithLocale_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __61__ENUserStoreClient_fetchBootstrapInfoWithLocale_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 getBootstrapInfo:*(void *)(a1 + 40)];

  return v3;
}

- (void)checkVersionWithClientName:(id)a3 edamVersionMajor:(signed __int16)a4 edamVersionMinor:(signed __int16)a5 completion:(id)a6
{
  id v10 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __93__ENUserStoreClient_checkVersionWithClientName_edamVersionMajor_edamVersionMinor_completion___block_invoke;
  v12[3] = &unk_264E573C8;
  void v12[4] = self;
  id v13 = v10;
  signed __int16 v14 = a4;
  signed __int16 v15 = a5;
  id v11 = v10;
  [(ENStoreClient *)self invokeAsyncBoolBlock:v12 completion:a6];
}

uint64_t __93__ENUserStoreClient_checkVersionWithClientName_edamVersionMajor_edamVersionMinor_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [v2 checkVersion:*(void *)(a1 + 40) edamVersionMajor:*(__int16 *)(a1 + 48) edamVersionMinor:*(__int16 *)(a1 + 50)];

  return v3;
}

- (id)authenticateToBusiness
{
  uint64_t v3 = [(ENUserStoreClient *)self client];
  v4 = [(ENUserStoreClient *)self authenticationToken];
  v5 = [v3 authenticateToBusiness:v4];

  return v5;
}

- (ENUserStoreClient)initWithUserStoreUrl:(id)a3 authenticationToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ENUserStoreClient;
  uint64_t v8 = [(ENStoreClient *)&v14 init];
  if (v8)
  {
    id v9 = [NSURL URLWithString:v6];
    id v10 = [[ENTHTTPClient alloc] initWithURL:v9];
    id v11 = [[ENTBinaryProtocol alloc] initWithTransport:v10];
    id v12 = [[EDAMUserStoreClient alloc] initWithProtocol:v11];
    [(ENUserStoreClient *)v8 setClient:v12];

    [(ENUserStoreClient *)v8 setAuthenticationToken:v7];
  }

  return v8;
}

+ (id)userStoreClientWithUrl:(id)a3 authenticationToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithUserStoreUrl:v7 authenticationToken:v6];

  return v8;
}

@end