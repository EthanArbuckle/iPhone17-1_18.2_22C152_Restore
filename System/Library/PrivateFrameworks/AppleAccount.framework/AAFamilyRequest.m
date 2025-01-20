@interface AAFamilyRequest
- (AAFamilyRequest)initWithAppleAccount:(id)a3 grandSlamAccount:(id)a4 accountStore:(id)a5;
- (AAFamilyRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4;
- (AAFamilyRequest)initWithGrandSlamSigner:(id)a3;
- (BOOL)isUserInitiated;
- (id)_familyGrandSlamSigner;
- (id)urlRequest;
@end

@implementation AAFamilyRequest

- (AAFamilyRequest)initWithAppleAccount:(id)a3 grandSlamAccount:(id)a4 accountStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AAFamilyRequest;
  v12 = [(AAFamilyRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appleAccount, a3);
    v14 = [[AAGrandSlamSigner alloc] initWithAccountStore:v11 grandSlamAccount:v10 appTokenID:@"com.apple.gs.icloud.auth"];
    grandSlamSigner = v13->_grandSlamSigner;
    v13->_grandSlamSigner = v14;
  }
  return v13;
}

- (AAFamilyRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAFamilyRequest;
  v8 = [(AAFamilyRequest *)&v12 init];
  if (v8)
  {
    id v9 = [[AAGrandSlamSigner alloc] initWithAccountStore:v7 grandSlamAccount:v6 appTokenID:@"com.apple.gs.icloud.family.auth"];
    grandSlamSigner = v8->_grandSlamSigner;
    v8->_grandSlamSigner = v9;
  }
  return v8;
}

- (AAFamilyRequest)initWithGrandSlamSigner:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAFamilyRequest;
  id v6 = [(AAFamilyRequest *)&v12 init];
  if (v6)
  {
    id v7 = [v5 accountStore];
    v8 = [v5 grandSlamAccount];
    uint64_t v9 = objc_msgSend(v7, "aida_iCloudAccountMatchingAppleIDAuthAccount:", v8);
    appleAccount = v6->_appleAccount;
    v6->_appleAccount = (ACAccount *)v9;

    objc_storeStrong((id *)&v6->_grandSlamSigner, a3);
  }

  return v6;
}

- (id)_familyGrandSlamSigner
{
  familyGrandSlamSigner = self->_familyGrandSlamSigner;
  if (!familyGrandSlamSigner)
  {
    v4 = [AAGrandSlamSigner alloc];
    id v5 = [(AAGrandSlamSigner *)self->_grandSlamSigner accountStore];
    id v6 = [(AAGrandSlamSigner *)self->_grandSlamSigner grandSlamAccount];
    id v7 = [(AAGrandSlamSigner *)v4 initWithAccountStore:v5 grandSlamAccount:v6 appTokenID:@"com.apple.gs.icloud.family.auth"];
    v8 = self->_familyGrandSlamSigner;
    self->_familyGrandSlamSigner = v7;

    [(AAGrandSlamSigner *)self->_familyGrandSlamSigner setHeaderFieldKey:@"X-Apple-Family-GS-Token"];
    familyGrandSlamSigner = self->_familyGrandSlamSigner;
  }

  return familyGrandSlamSigner;
}

- (BOOL)isUserInitiated
{
  return 0;
}

- (id)urlRequest
{
  v11.receiver = self;
  v11.super_class = (Class)AAFamilyRequest;
  v3 = [(AARequest *)&v11 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_appleAccount, 0);
  objc_msgSend(v4, "aa_addDeviceInternalDevHeaderIfEnabled");
  objc_msgSend(v4, "aa_addDeviceIDHeader");
  objc_msgSend(v4, "aa_addLoggedInAppleIDHeaderWithAccount:", self->_appleAccount);
  objc_msgSend(v4, "aa_addLocationSharingAllowedHeader");
  if (![(AAGrandSlamSigner *)self->_grandSlamSigner signURLRequest:v4 isUserInitiated:[(AAFamilyRequest *)self isUserInitiated]])
  {
    id v5 = _AALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "AAGrandSlamSigner failed!", v10, 2u);
    }
  }
  id v6 = [(AAFamilyRequest *)self _familyGrandSlamSigner];
  char v7 = objc_msgSend(v6, "signURLRequest:isUserInitiated:", v4, -[AAFamilyRequest isUserInitiated](self, "isUserInitiated"));

  if ((v7 & 1) == 0)
  {
    v8 = _AALogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "AAGrandSlamSigner failed for _familyGrandSlamSigner", v10, 2u);
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyGrandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);

  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end