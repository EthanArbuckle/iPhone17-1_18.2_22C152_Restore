@interface AAiCloudLoginAccountRequester
+ (id)delegateParamsForAllDelegates;
+ (id)delegateParamsForiCloudOnly;
- (void)loginWithAccount:(id)a3 forDelegates:(id)a4 completion:(id)a5;
@end

@implementation AAiCloudLoginAccountRequester

+ (id)delegateParamsForAllDelegates
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.gamecenter";
  v4[1] = @"com.apple.mobileme";
  v5[0] = MEMORY[0x1E4F1CC08];
  v5[1] = MEMORY[0x1E4F1CC08];
  v4[2] = @"com.apple.private.ids";
  v5[2] = &unk_1EF483D28;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

+ (id)delegateParamsForiCloudOnly
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"com.apple.mobileme";
  v5[0] = MEMORY[0x1E4F1CC08];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)loginWithAccount:(id)a3 forDelegates:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[AALoginAccountRequest alloc] initWithAccount:v9 delegates:v8];

  v11 = objc_msgSend(v9, "_aa_termsServerInfo");
  [(AALoginAccountRequest *)v10 setServerInfo:v11];

  objc_msgSend(v9, "_aa_setTermsServerInfo:", 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__AAiCloudLoginAccountRequester_loginWithAccount_forDelegates_completion___block_invoke;
  v13[3] = &unk_1E5A481E8;
  id v14 = v7;
  id v12 = v7;
  [(AARequest *)v10 performSignedRequestWithHandler:v13];
}

uint64_t __74__AAiCloudLoginAccountRequester_loginWithAccount_forDelegates_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end