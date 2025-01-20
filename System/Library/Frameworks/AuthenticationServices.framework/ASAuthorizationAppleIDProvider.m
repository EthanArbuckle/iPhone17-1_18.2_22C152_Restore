@interface ASAuthorizationAppleIDProvider
+ (void)initialize;
- (ASAuthorizationAppleIDRequest)createRequest;
- (void)credentialStateDidChange:(int64_t)a3 completion:(id)a4;
- (void)getCredentialStateForUserID:(NSString *)userID completion:(void *)completion;
@end

@implementation ASAuthorizationAppleIDProvider

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ASAuthorizationAppleIDProvider;
  objc_msgSendSuper2(&v3, sel_initialize);
  v2 = objc_alloc_init(ASAuthorizationAppleIDProvider);
  [MEMORY[0x263F29158] startServiceWithNotificationHandler:v2];
}

- (ASAuthorizationAppleIDRequest)createRequest
{
  v2 = objc_alloc_init(ASAuthorizationAppleIDProvider);
  objc_super v3 = [(ASAuthorizationRequest *)[ASAuthorizationAppleIDRequest alloc] initWithProvider:v2];

  return v3;
}

- (void)getCredentialStateForUserID:(NSString *)userID completion:(void *)completion
{
  v5 = completion;
  v6 = (objc_class *)MEMORY[0x263F29148];
  v7 = userID;
  id v8 = objc_alloc_init(v6);
  [v8 setUserID:v7];

  id v9 = objc_alloc_init(MEMORY[0x263F29138]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__ASAuthorizationAppleIDProvider_getCredentialStateForUserID_completion___block_invoke;
  v11[3] = &unk_264396320;
  id v12 = v5;
  id v10 = v5;
  [v9 getCredentialStateForRequest:v8 completion:v11];
}

void __73__ASAuthorizationAppleIDProvider_getCredentialStateForUserID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  switch(a2)
  {
    case 0:
      v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_7;
    case 1:
    case 4:
    case 5:
      v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_7;
    case 2:
      if (v5)
      {
        v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.AuthenticationServices.AuthorizationError" code:1000 userInfo:0];
      }
      else
      {
        v7 = 0;
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

      goto LABEL_8;
    case 3:
      v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_7:
      v6();
LABEL_8:
      id v5 = v8;
      break;
    default:
      break;
  }
}

- (void)credentialStateDidChange:(int64_t)a3 completion:(id)a4
{
  if (a3)
  {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x263F08A00];
    id v5 = (void (**)(id, uint64_t, void))a4;
    v6 = [v4 defaultCenter];
    [v6 postNotificationName:@"ASAuthorizationAppleIDCredentialRevokedNotification" object:0];

    v5[2](v5, 1, 0);
  }
}

@end