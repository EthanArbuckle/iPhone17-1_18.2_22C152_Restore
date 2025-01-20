@interface HKFHIRCredential
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToCredential:(id)a3 epsilonExpiration:(double)a4;
- (HKFHIRCredential)initWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopes:(id)a7;
- (HKFHIRCredential)initWithAccessToken:(id)a3 refreshToken:(id)a4 patientID:(id)a5 expiration:(id)a6 requestedScopeString:(id)a7 scopeString:(id)a8;
- (HKFHIRCredential)initWithAccessToken:(id)a3 refreshToken:(id)a4 patientID:(id)a5 expiration:(id)a6 requestedScopeString:(id)a7 scopes:(id)a8;
- (HKFHIRCredential)initWithCoder:(id)a3;
- (NSString)patientID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRCredential

- (HKFHIRCredential)initWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopes:(id)a7
{
  v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF4A0];
  v10 = NSStringFromSelector(a2);
  [v8 raise:v9, @"The -%@ method is not available on %@", v10, objc_opt_class() format];

  return 0;
}

- (HKFHIRCredential)initWithAccessToken:(id)a3 refreshToken:(id)a4 patientID:(id)a5 expiration:(id)a6 requestedScopeString:(id)a7 scopeString:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = v20;
  if (!v17)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HKFHIRCredential.m", 39, @"Invalid parameter not satisfying: %@", @"patientID" object file lineNumber description];

    if (v21) {
      goto LABEL_3;
    }
LABEL_5:
    v22 = 0;
    goto LABEL_6;
  }
  if (!v20) {
    goto LABEL_5;
  }
LABEL_3:
  v22 = +[HKOAuth2ScopeSet scopesFromScopeString:v21];
LABEL_6:
  v24 = [(HKFHIRCredential *)self initWithAccessToken:v15 refreshToken:v16 patientID:v17 expiration:v18 requestedScopeString:v19 scopes:v22];

  return v24;
}

- (HKFHIRCredential)initWithAccessToken:(id)a3 refreshToken:(id)a4 patientID:(id)a5 expiration:(id)a6 requestedScopeString:(id)a7 scopes:(id)a8
{
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKFHIRCredential;
  id v15 = [(HKOAuth2Credential *)&v19 initWithAccessToken:a3 refreshToken:a4 expiration:a6 requestedScopeString:a7 scopes:a8];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    patientID = v15->_patientID;
    v15->_patientID = (NSString *)v16;
  }
  return v15;
}

- (BOOL)isEqualToCredential:(id)a3 epsilonExpiration:(double)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKFHIRCredential;
  if ([(HKOAuth2Credential *)&v14 isEqualToCredential:v6 epsilonExpiration:a4])
  {
    patientID = self->_patientID;
    v8 = [v6 patientID];
    if (patientID == v8)
    {
      char v12 = 1;
    }
    else
    {
      uint64_t v9 = [v6 patientID];
      if (v9)
      {
        v10 = self->_patientID;
        v11 = [v6 patientID];
        char v12 = [(NSString *)v10 isEqualToString:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)HKFHIRCredential;
  unint64_t v3 = [(HKOAuth2Credential *)&v5 hash];
  return [(NSString *)self->_patientID hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  patientID = self->_patientID;
  id v5 = a3;
  [v5 encodeObject:patientID forKey:@"patientID"];
  v6.receiver = self;
  v6.super_class = (Class)HKFHIRCredential;
  [(HKOAuth2Credential *)&v6 encodeWithCoder:v5];
}

- (HKFHIRCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"patientID"];
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)HKFHIRCredential;
    objc_super v6 = [(HKOAuth2Credential *)&v11 initWithCoder:v4];

    if (v6)
    {
      uint64_t v7 = [v5 copy];
      patientID = v6->_patientID;
      v6->_patientID = (NSString *)v7;
    }
    self = v6;
    uint64_t v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");

    uint64_t v9 = 0;
  }

  return v9;
}

- (NSString)patientID
{
  return self->_patientID;
}

- (void).cxx_destruct
{
}

@end