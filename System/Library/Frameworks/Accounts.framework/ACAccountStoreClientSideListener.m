@interface ACAccountStoreClientSideListener
- (ACAccountStoreClientSideListener)init;
- (void)accountCredentialsDidChangeForAccountWithIdentifier:(id)a3;
@end

@implementation ACAccountStoreClientSideListener

- (ACAccountStoreClientSideListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACAccountStoreClientSideListener;
  return [(ACAccountStoreClientSideListener *)&v3 init];
}

- (void)accountCredentialsDidChangeForAccountWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__ACAccountStoreClientSideListener_accountCredentialsDidChangeForAccountWithIdentifier___block_invoke;
    block[3] = &unk_1E5BCD220;
    v8 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v5 = v8;
  }
  else
  {
    v5 = _ACLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A57C5000, v5, OS_LOG_TYPE_DEFAULT, "\"ACAccountStoreClientSideListener is ignoring credential change notification because no account ID was provided.\"", v6, 2u);
    }
  }
}

void __88__ACAccountStoreClientSideListener_accountCredentialsDidChangeForAccountWithIdentifier___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  v5[0] = @"ACAccountIdentifierKey";
  v5[1] = @"AccountIdentifier";
  v6[0] = v3;
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 postNotificationName:@"ACAccountCredentialsDidChangeNotification" object:0 userInfo:v4];
}

@end