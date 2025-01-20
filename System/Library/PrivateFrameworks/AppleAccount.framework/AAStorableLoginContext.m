@interface AAStorableLoginContext
- (AAStorableLoginContext)initWithAppleID:(id)a3 altDSID:(id)a4;
- (BOOL)isBeneficiaryLogin;
- (NSString)DSID;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)cloudKitToken;
- (NSString)continuationKey;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)passwordResetKey;
- (NSString)rawPassword;
- (void)setBeneficiaryLogin:(BOOL)a3;
- (void)setCloudKitToken:(id)a3;
- (void)setContinuationKey:(id)a3;
- (void)setDSID:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setPasswordResetKey:(id)a3;
- (void)setRawPassword:(id)a3;
@end

@implementation AAStorableLoginContext

- (AAStorableLoginContext)initWithAppleID:(id)a3 altDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAStorableLoginContext;
  v8 = [(AAStorableLoginContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    appleID = v8->_appleID;
    v8->_appleID = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v11;
  }
  return v8;
}

- (void)setDSID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_DSID, a3);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 stringValue];
      DSID = self->_DSID;
      self->_DSID = v6;
    }
    else
    {
      v8 = _AALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Attempted to set invalid DSID: %@", (uint8_t *)&v9, 0xCu);
      }

      DSID = self->_DSID;
      self->_DSID = 0;
    }
  }
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)DSID
{
  return self->_DSID;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (void)setRawPassword:(id)a3
{
}

- (NSString)continuationKey
{
  return self->_continuationKey;
}

- (void)setContinuationKey:(id)a3
{
}

- (NSString)passwordResetKey
{
  return self->_passwordResetKey;
}

- (void)setPasswordResetKey:(id)a3
{
}

- (NSString)cloudKitToken
{
  return self->_cloudKitToken;
}

- (void)setCloudKitToken:(id)a3
{
}

- (BOOL)isBeneficiaryLogin
{
  return self->_beneficiaryLogin;
}

- (void)setBeneficiaryLogin:(BOOL)a3
{
  self->_beneficiaryLogin = a3;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_cloudKitToken, 0);
  objc_storeStrong((id *)&self->_passwordResetKey, 0);
  objc_storeStrong((id *)&self->_continuationKey, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_appleID, 0);
}

@end