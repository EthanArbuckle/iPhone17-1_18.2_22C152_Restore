@interface HDClinicalAuthenticationInfo
+ (BOOL)supportsSecureCoding;
- (HDClinicalAuthenticationInfo)initWithCoder:(id)a3;
- (HDClinicalAuthenticationInfo)initWithCredential:(id)a3 tokenKeyFingerprint:(id)a4;
- (HDFHIRCredential)credential;
- (NSData)tokenKeyFingerprint;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAuthenticationInfo

- (HDClinicalAuthenticationInfo)initWithCredential:(id)a3 tokenKeyFingerprint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDClinicalAuthenticationInfo;
  v8 = [(HDClinicalAuthenticationInfo *)&v14 init];
  if (v8)
  {
    v9 = (HDFHIRCredential *)[v6 copy];
    credential = v8->_credential;
    v8->_credential = v9;

    v11 = (NSData *)[v7 copy];
    tokenKeyFingerprint = v8->_tokenKeyFingerprint;
    v8->_tokenKeyFingerprint = v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDClinicalAuthenticationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credential"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenKeyFingerprint"];
    if (v6)
    {
      v14.receiver = self;
      v14.super_class = (Class)HDClinicalAuthenticationInfo;
      id v7 = [(HDClinicalAuthenticationInfo *)&v14 init];
      if (v7)
      {
        v8 = (HDFHIRCredential *)[v5 copy];
        credential = v7->_credential;
        v7->_credential = v8;

        v10 = (NSData *)[v6 copy];
        tokenKeyFingerprint = v7->_tokenKeyFingerprint;
        v7->_tokenKeyFingerprint = v10;
      }
      self = v7;
      v12 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v12 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  credential = self->_credential;
  id v5 = a3;
  [v5 encodeObject:credential forKey:@"credential"];
  [v5 encodeObject:self->_tokenKeyFingerprint forKey:@"tokenKeyFingerprint"];
}

- (HDFHIRCredential)credential
{
  return self->_credential;
}

- (NSData)tokenKeyFingerprint
{
  return self->_tokenKeyFingerprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenKeyFingerprint, 0);

  objc_storeStrong((id *)&self->_credential, 0);
}

@end