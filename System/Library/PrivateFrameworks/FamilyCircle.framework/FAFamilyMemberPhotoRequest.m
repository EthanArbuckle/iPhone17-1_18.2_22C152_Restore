@interface FAFamilyMemberPhotoRequest
+ (Class)responseClass;
- (ACAccount)iTunesAccount;
- (FAFamilyMemberPhotoRequest)initWithMemberAltDSID:(id)a3 accountStore:(id)a4;
- (FAFamilyMemberPhotoRequest)initWithMemberAltDSID:(id)a3 ephemeralAuthResults:(id)a4;
- (FAFamilyMemberPhotoRequest)initWithMemberAltDSID:(id)a3 ephemeralAuthSigner:(id)a4;
- (FAFamilyMemberPhotoRequest)initWithMemberDSID:(id)a3 accountStore:(id)a4;
- (NSNumber)familyMemberDSID;
- (NSString)familyMemberAltDSID;
- (NSString)serverCacheTag;
- (_TtP12FamilyCircle15FARequestSigner_)ephemeralAuthSigner;
- (id)fa_photoRequestBaseURLString;
- (id)urlRequest;
- (id)urlString;
- (void)setEphemeralAuthSigner:(id)a3;
- (void)setFamilyMemberAltDSID:(id)a3;
- (void)setFamilyMemberDSID:(id)a3;
- (void)setServerCacheTag:(id)a3;
- (void)setiTunesAccount:(id)a3;
- (void)urlString;
@end

@implementation FAFamilyMemberPhotoRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (FAFamilyMemberPhotoRequest)initWithMemberDSID:(id)a3 accountStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  v11.receiver = self;
  v11.super_class = (Class)FAFamilyMemberPhotoRequest;
  v9 = [(AAFamilyRequest *)&v11 initWithAppleAccount:v8 grandSlamAccount:0 accountStore:v7];

  if (v9) {
    [(FAFamilyMemberPhotoRequest *)v9 setFamilyMemberDSID:v6];
  }

  return v9;
}

- (FAFamilyMemberPhotoRequest)initWithMemberAltDSID:(id)a3 accountStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v7, "aa_primaryAppleAccount");
  v11.receiver = self;
  v11.super_class = (Class)FAFamilyMemberPhotoRequest;
  v9 = [(AAFamilyRequest *)&v11 initWithAppleAccount:v8 grandSlamAccount:0 accountStore:v7];

  if (v9) {
    [(FAFamilyMemberPhotoRequest *)v9 setFamilyMemberAltDSID:v6];
  }

  return v9;
}

- (FAFamilyMemberPhotoRequest)initWithMemberAltDSID:(id)a3 ephemeralAuthResults:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[FARequestEphemeralSigner alloc] initWithEphemeralAuthResults:v6];

  v9 = [(FAFamilyMemberPhotoRequest *)self initWithMemberAltDSID:v7 ephemeralAuthSigner:v8];
  return v9;
}

- (FAFamilyMemberPhotoRequest)initWithMemberAltDSID:(id)a3 ephemeralAuthSigner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 account];
  v12.receiver = self;
  v12.super_class = (Class)FAFamilyMemberPhotoRequest;
  v10 = [(AAFamilyRequest *)&v12 initWithAppleAccount:v9 grandSlamAccount:0 accountStore:0];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_ephemeralAuthSigner, a4);
    objc_storeStrong((id *)&v10->_familyMemberAltDSID, a3);
  }

  return v10;
}

- (id)fa_photoRequestBaseURLString
{
  v2 = [MEMORY[0x1E4F4C008] urlConfiguration];
  v3 = [v2 getFamilyMemberPhotoURL];

  return v3;
}

- (id)urlString
{
  v3 = [(FAFamilyMemberPhotoRequest *)self fa_photoRequestBaseURLString];
  familyMemberDSID = self->_familyMemberDSID;
  if (familyMemberDSID)
  {
    [NSString stringWithFormat:@"%@?memberId=%@", v3, familyMemberDSID];
    id v6 = LABEL_5:;
    goto LABEL_6;
  }
  familyMemberAltDSID = self->_familyMemberAltDSID;
  if (familyMemberAltDSID)
  {
    [NSString stringWithFormat:@"%@?memberAltDSID=%@", v3, familyMemberAltDSID];
    goto LABEL_5;
  }
  id v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[FAFamilyMemberPhotoRequest urlString](v8);
  }

  id v6 = 0;
LABEL_6:

  return v6;
}

- (id)urlRequest
{
  v11.receiver = self;
  v11.super_class = (Class)FAFamilyMemberPhotoRequest;
  v3 = [(AAFamilyRequest *)&v11 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"GET"];
  objc_msgSend(v4, "fam_addiTunesHeadersWithAccount:", self->_iTunesAccount);
  serverCacheTag = self->_serverCacheTag;
  if (serverCacheTag) {
    [v4 setValue:serverCacheTag forHTTPHeaderField:@"ETag"];
  }
  id v6 = [(FAFamilyMemberPhotoRequest *)self ephemeralAuthSigner];

  if (v6)
  {
    id v7 = [(FAFamilyMemberPhotoRequest *)self ephemeralAuthSigner];
    [v7 signURLRequest:v4];

    id v8 = [(FAFamilyMemberPhotoRequest *)self ephemeralAuthSigner];
    v9 = [v8 account];
    objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", v9, 1);
  }
  return v4;
}

- (NSNumber)familyMemberDSID
{
  return self->_familyMemberDSID;
}

- (void)setFamilyMemberDSID:(id)a3
{
}

- (NSString)familyMemberAltDSID
{
  return self->_familyMemberAltDSID;
}

- (void)setFamilyMemberAltDSID:(id)a3
{
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setiTunesAccount:(id)a3
{
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (void)setServerCacheTag:(id)a3
{
}

- (_TtP12FamilyCircle15FARequestSigner_)ephemeralAuthSigner
{
  return self->_ephemeralAuthSigner;
}

- (void)setEphemeralAuthSigner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralAuthSigner, 0);
  objc_storeStrong((id *)&self->_serverCacheTag, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_familyMemberAltDSID, 0);
  objc_storeStrong((id *)&self->_familyMemberDSID, 0);
}

- (void)urlString
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D252C000, log, OS_LOG_TYPE_ERROR, "FAFamilyMemberPhotoRequest has no memberDSID or memberAltDSID", v1, 2u);
}

@end