@interface FAFamilySetupBuddyMLRequest
- (ACAccount)iTunesAccount;
- (BOOL)isUserInitiated;
- (NSString)inviteCode;
- (id)urlRequest;
- (id)urlString;
- (void)setInviteCode:(id)a3;
- (void)setiTunesAccount:(id)a3;
@end

@implementation FAFamilySetupBuddyMLRequest

- (BOOL)isUserInitiated
{
  return 1;
}

- (id)urlString
{
  v2 = [MEMORY[0x263F259C0] urlConfiguration];
  v3 = [v2 familySetupUIURL];

  return v3;
}

- (id)urlRequest
{
  v12[1] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)FAFamilySetupBuddyMLRequest;
  v3 = [(AAFamilyRequest *)&v10 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  if (self->_iTunesAccount)
  {
    objc_msgSend(v4, "fam_addiTunesHeadersWithAccount:");
  }
  else
  {
    v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2189F0000, v5, OS_LOG_TYPE_DEFAULT, "No iTunes account provided to family setup UI request.", v9, 2u);
    }
  }
  inviteCode = self->_inviteCode;
  if (inviteCode)
  {
    v11 = @"invite-code";
    v12[0] = inviteCode;
    v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    objc_msgSend(v4, "aa_setBodyWithParameters:", v7);
  }
  return v4;
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setiTunesAccount:(id)a3
{
}

- (NSString)inviteCode
{
  return self->_inviteCode;
}

- (void)setInviteCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteCode, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
}

@end