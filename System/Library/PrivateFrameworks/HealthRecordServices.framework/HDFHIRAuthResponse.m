@interface HDFHIRAuthResponse
+ (BOOL)supportsSecureCoding;
+ (id)authResponseFromServerResponseDictionary:(id)a3 baseURL:(id)a4 previousCredential:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToAuthResponse:(id)a3;
- (HDFHIRAuthResponse)initWithAccessToken:(id)a3 refreshToken:(id)a4 patientID:(id)a5 expiration:(id)a6 scope:(id)a7;
- (HDFHIRAuthResponse)initWithCoder:(id)a3;
- (NSDate)expiration;
- (NSString)accessToken;
- (NSString)patientID;
- (NSString)refreshToken;
- (NSString)scope;
- (id)descriptionForAccountEvent;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDFHIRAuthResponse

- (HDFHIRAuthResponse)initWithAccessToken:(id)a3 refreshToken:(id)a4 patientID:(id)a5 expiration:(id)a6 scope:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HDFHIRAuthResponse;
  v17 = [(HDFHIRAuthResponse *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    accessToken = v17->_accessToken;
    v17->_accessToken = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    refreshToken = v17->_refreshToken;
    v17->_refreshToken = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    patientID = v17->_patientID;
    v17->_patientID = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    expiration = v17->_expiration;
    v17->_expiration = (NSDate *)v24;

    uint64_t v26 = [v16 copy];
    scope = v17->_scope;
    v17->_scope = (NSString *)v26;
  }
  return v17;
}

+ (id)authResponseFromServerResponseDictionary:(id)a3 baseURL:(id)a4 previousCredential:(id)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:a2, a1, @"HDFHIRAuthResponse.m", 43, @"Invalid parameter not satisfying: %@", @"responseDictionary" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v41 = [MEMORY[0x263F08690] currentHandler];
  [v41 handleFailureInMethod:a2, a1, @"HDFHIRAuthResponse.m", 44, @"Invalid parameter not satisfying: %@", @"baseURL" object file lineNumber description];

LABEL_3:
  id v14 = objc_msgSend(v11, "hk_safeStringForKeyPath:error:", @"access_token", a6);
  if (!v14)
  {
    v19 = 0;
    goto LABEL_54;
  }
  id v15 = objc_msgSend(v11, "hk_safeStringForKeyPath:error:", @"token_type", a6);
  if (v15)
  {
    id v49 = 0;
    id v16 = objc_msgSend(v11, "hk_safeStringForKeyPath:error:", @"patient", &v49);
    id v17 = v49;
    if (!v16)
    {
      uint64_t v20 = [v11 objectForKeyedSubscript:@"patient"];

      if (v20)
      {
        id v21 = v17;
        id v18 = v21;
        if (v21)
        {
          if (a6)
          {
            id v18 = v21;
            v19 = 0;
            *a6 = v18;
            id v17 = v18;
LABEL_52:

            goto LABEL_53;
          }
          _HKLogDroppedError();
        }
        v19 = 0;
        id v17 = v18;
        goto LABEL_52;
      }
    }
    if ([v16 length])
    {
      id v18 = v16;
    }
    else
    {
      id v18 = [v13 patientID];

      if (![v18 length])
      {
        v19 = 0;
        goto LABEL_52;
      }
    }
    id v48 = v17;
    uint64_t v22 = objc_msgSend(v11, "hk_safeNumberForKeyPath:error:", @"expires_in", &v48);
    id v23 = v48;

    v45 = v22;
    if (v22)
    {
      id v43 = v18;
      v44 = v13;
      [v22 doubleValue];
      uint64_t v42 = +[HKOAuth2Credential expirationFromTimeInterval:](HKOAuth2Credential, "expirationFromTimeInterval:");
    }
    else
    {
      v28 = [v11 objectForKeyedSubscript:@"expires_in"];

      if (v28)
      {
        id v29 = v23;
        if (v29)
        {
          if (a6)
          {
            id v30 = v29;
            v19 = 0;
            *a6 = v30;
            id v27 = v30;
            id v17 = v30;
          }
          else
          {
            id v27 = v29;
            _HKLogDroppedError();
            v19 = 0;
            id v17 = v27;
          }
        }
        else
        {
          v19 = 0;
          id v17 = 0;
          id v27 = 0;
        }
        goto LABEL_51;
      }
      uint64_t v42 = 0;
      id v43 = v18;
      v44 = v13;
    }
    id v47 = v23;
    objc_msgSend(v11, "hk_safeStringForKeyPath:error:", @"refresh_token", &v47);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = v47;

    if (!v24)
    {
      v31 = [v11 objectForKeyedSubscript:@"refresh_token"];

      if (v31)
      {
        id v32 = v25;
        id v24 = v32;
        if (v32)
        {
          id v18 = v43;
          if (a6)
          {
            id v24 = v32;
            v19 = 0;
            *a6 = v24;
          }
          else
          {
            _HKLogDroppedError();
            v19 = 0;
          }
          id v17 = v24;
          id v27 = (id)v42;
        }
        else
        {
          v19 = 0;
          id v17 = 0;
          id v27 = (id)v42;
          id v18 = v43;
        }
        goto LABEL_50;
      }
      id v24 = [v44 refreshToken];
      if (!v24)
      {
        _HKInitializeLogging();
        v35 = (void *)*MEMORY[0x263F09908];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
        {
          v36 = v35;
          v37 = (objc_class *)objc_opt_class();
          v38 = NSStringFromClass(v37);
          *(_DWORD *)buf = 138543362;
          v51 = v38;
          _os_log_impl(&dword_221D38000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ No refresh_token returned and no refreshToken found in previousCredential", buf, 0xCu);
        }
        id v24 = 0;
      }
    }
    id v46 = v25;
    objc_msgSend(v11, "hk_safeStringForKeyPath:error:", @"scope", &v46);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v46;

    id v18 = v43;
    if (v26) {
      goto LABEL_19;
    }
    v33 = [v11 objectForKeyedSubscript:@"scope"];

    if (!v33)
    {
      id v26 = [v44 scopeString];
LABEL_19:
      id v27 = (id)v42;
      v19 = [[HDFHIRAuthResponse alloc] initWithAccessToken:v14 refreshToken:v24 patientID:v43 expiration:v42 scope:v26];
LABEL_49:

LABEL_50:
      id v13 = v44;
LABEL_51:

      goto LABEL_52;
    }
    id v34 = v17;
    id v26 = v34;
    if (v34)
    {
      if (a6)
      {
        id v26 = v34;
        v19 = 0;
        *a6 = v26;
LABEL_48:
        id v27 = (id)v42;
        goto LABEL_49;
      }
      _HKLogDroppedError();
    }
    v19 = 0;
    goto LABEL_48;
  }
  v19 = 0;
LABEL_53:

LABEL_54:

  return v19;
}

- (id)descriptionForAccountEvent
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HDFHIRAuthResponse *)self refreshToken];
  v6 = HKStringFromBool();
  v7 = [(HDFHIRAuthResponse *)self patientID];
  v8 = [(HDFHIRAuthResponse *)self expiration];
  v9 = HKDiagnosticStringFromDate();
  v10 = [(HDFHIRAuthResponse *)self scope];
  id v11 = [v3 stringWithFormat:@"<%@> Refresh token: %@, Patient Id: %@, Expiration: %@, Scope: %@", v4, v6, v7, v9, v10];

  return v11;
}

- (BOOL)isEquivalentToAuthResponse:(id)a3
{
  v5 = (HDFHIRAuthResponse *)a3;
  if (self == v5)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    if ([(HDFHIRAuthResponse *)v5 isMemberOfClass:objc_opt_class()])
    {
      int v6 = self->_scope != 0;
      v7 = [(HDFHIRAuthResponse *)v5 scope];
      int v8 = v7 == 0;

      if (v6 != v8)
      {
        if (!self->_scope) {
          goto LABEL_6;
        }
        v9 = +[HKOAuth2ScopeSet scopesFromScopeString:](HKOAuth2ScopeSet, "scopesFromScopeString:");
        v10 = [(HDFHIRAuthResponse *)v5 scope];
        id v11 = +[HKOAuth2ScopeSet scopesFromScopeString:v10];

        LODWORD(v10) = [v9 isEqualToSet:v11];
        if (v10)
        {
LABEL_6:
          accessToken = self->_accessToken;
          id v13 = [(HDFHIRAuthResponse *)v5 accessToken];
          if (accessToken != v13)
          {
            uint64_t v14 = [(HDFHIRAuthResponse *)v5 accessToken];
            if (!v14)
            {
              LOBYTE(v17) = 0;
              goto LABEL_35;
            }
            v3 = (void *)v14;
            id v15 = self->_accessToken;
            id v16 = [(HDFHIRAuthResponse *)v5 accessToken];
            if (![(NSString *)v15 isEqualToString:v16])
            {
              LOBYTE(v17) = 0;
LABEL_34:

              goto LABEL_35;
            }
            id v34 = v16;
          }
          refreshToken = self->_refreshToken;
          v19 = [(HDFHIRAuthResponse *)v5 refreshToken];
          if (refreshToken != v19)
          {
            id v17 = [(HDFHIRAuthResponse *)v5 refreshToken];
            if (!v17) {
              goto LABEL_27;
            }
            uint64_t v20 = self->_refreshToken;
            id v21 = [(HDFHIRAuthResponse *)v5 refreshToken];
            if (![(NSString *)v20 isEqualToString:v21])
            {

              LOBYTE(v17) = 0;
              goto LABEL_30;
            }
            id v32 = v21;
            v33 = v17;
          }
          patientID = self->_patientID;
          uint64_t v23 = [(HDFHIRAuthResponse *)v5 patientID];
          LOBYTE(v17) = patientID == (NSString *)v23;
          if (patientID == (NSString *)v23)
          {
          }
          else
          {
            id v24 = (void *)v23;
            uint64_t v25 = [(HDFHIRAuthResponse *)v5 patientID];
            if (v25)
            {
              id v26 = (void *)v25;
              v31 = v3;
              id v27 = self->_patientID;
              v28 = [(HDFHIRAuthResponse *)v5 patientID];
              LOBYTE(v17) = [(NSString *)v27 isEqualToString:v28];

              if (refreshToken == v19)
              {
              }
              else
              {
              }
              BOOL v29 = accessToken == v13;
              v3 = v31;
LABEL_33:
              id v16 = v34;
              if (!v29) {
                goto LABEL_34;
              }
LABEL_35:

              goto LABEL_36;
            }
          }
          if (refreshToken != v19)
          {

LABEL_27:
            id v16 = v34;

            if (accessToken == v13) {
              goto LABEL_35;
            }
            goto LABEL_34;
          }

LABEL_30:
          BOOL v29 = accessToken == v13;
          goto LABEL_33;
        }
      }
    }
    LOBYTE(v17) = 0;
  }
LABEL_36:

  return (char)v17;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HDFHIRAuthResponse *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    if ([(HDFHIRAuthResponse *)v5 isMemberOfClass:objc_opt_class()])
    {
      int v6 = v5;
      accessToken = self->_accessToken;
      int v8 = [(HDFHIRAuthResponse *)v6 accessToken];
      if (accessToken != v8)
      {
        uint64_t v9 = [(HDFHIRAuthResponse *)v6 accessToken];
        if (!v9)
        {
          char v13 = 0;
          goto LABEL_52;
        }
        v10 = (void *)v9;
        id v11 = self->_accessToken;
        id v12 = [(HDFHIRAuthResponse *)v6 accessToken];
        if (![(NSString *)v11 isEqualToString:v12])
        {
          char v13 = 0;
LABEL_51:

          goto LABEL_52;
        }
        v57 = v10;
        v56 = v12;
      }
      refreshToken = self->_refreshToken;
      id v15 = [(HDFHIRAuthResponse *)v6 refreshToken];
      if (refreshToken != v15)
      {
        uint64_t v16 = [(HDFHIRAuthResponse *)v6 refreshToken];
        if (!v16)
        {
LABEL_32:

LABEL_33:
          char v13 = 0;
          goto LABEL_50;
        }
        v55 = (void *)v16;
        id v17 = self->_refreshToken;
        v3 = [(HDFHIRAuthResponse *)v6 refreshToken];
        if (![(NSString *)v17 isEqualToString:v3])
        {
LABEL_31:

          goto LABEL_32;
        }
      }
      patientID = self->_patientID;
      v19 = [(HDFHIRAuthResponse *)v6 patientID];
      v54 = patientID;
      if (patientID == v19)
      {
        v53 = refreshToken;
        id v26 = v15;
      }
      else
      {
        uint64_t v20 = [(HDFHIRAuthResponse *)v6 patientID];
        if (!v20)
        {
          uint64_t v52 = v3;
          char v13 = 0;
          goto LABEL_47;
        }
        v51 = (void *)v20;
        v53 = refreshToken;
        id v21 = v19;
        uint64_t v22 = self->_patientID;
        uint64_t v23 = [(HDFHIRAuthResponse *)v6 patientID];
        id v24 = v22;
        uint64_t v25 = (void *)v23;
        if (![(NSString *)v24 isEqualToString:v23])
        {

          if (refreshToken == v15)
          {

            goto LABEL_33;
          }
          goto LABEL_31;
        }
        id v26 = v15;
        id v47 = v25;
        v19 = v21;
      }
      expiration = self->_expiration;
      uint64_t v28 = [(HDFHIRAuthResponse *)v6 expiration];
      BOOL v29 = (NSDate *)v28;
      v50 = expiration;
      uint64_t v52 = v3;
      if (expiration == (NSDate *)v28)
      {
        id v48 = (NSDate *)v28;
        id v49 = v19;
        id v15 = v26;
      }
      else
      {
        uint64_t v30 = [(HDFHIRAuthResponse *)v6 expiration];
        if (!v30)
        {
          char v13 = 0;
          id v15 = v26;
          refreshToken = v53;
          uint64_t v42 = v54;
          goto LABEL_37;
        }
        id v46 = (void *)v30;
        id v49 = v19;
        v31 = self->_expiration;
        uint64_t v32 = [(HDFHIRAuthResponse *)v6 expiration];
        v33 = v31;
        id v34 = (void *)v32;
        id v15 = v26;
        if (![(NSDate *)v33 isEqualToDate:v32])
        {

          char v13 = 0;
          v19 = v49;
          refreshToken = v53;
          id v43 = v54;
          goto LABEL_45;
        }
        v45 = v34;
        id v48 = v29;
      }
      scope = self->_scope;
      uint64_t v36 = [(HDFHIRAuthResponse *)v6 scope];
      char v13 = scope == (NSString *)v36;
      if (scope == (NSString *)v36)
      {

        BOOL v29 = v48;
        refreshToken = v53;
        if (v50 == v48) {
          goto LABEL_41;
        }
      }
      else
      {
        v37 = (void *)v36;
        uint64_t v38 = [(HDFHIRAuthResponse *)v6 scope];
        refreshToken = v53;
        if (v38)
        {
          v39 = (void *)v38;
          v40 = self->_scope;
          v41 = [(HDFHIRAuthResponse *)v6 scope];
          char v13 = [(NSString *)v40 isEqualToString:v41];

          if (v50 == v48)
          {
          }
          else
          {
          }
          goto LABEL_44;
        }

        BOOL v29 = v48;
        if (v50 == v48)
        {
LABEL_41:

LABEL_44:
          v19 = v49;
          id v43 = v54;
LABEL_45:
          if (v43 != v19)
          {
LABEL_46:
          }
LABEL_47:

          if (refreshToken != v15)
          {
          }
LABEL_50:
          id v12 = v56;
          v10 = v57;
          if (accessToken != v8) {
            goto LABEL_51;
          }
LABEL_52:

          goto LABEL_53;
        }
      }

      v19 = v49;
      uint64_t v42 = v54;
LABEL_37:

      if (v42 == v19) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
    char v13 = 0;
  }
LABEL_53:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_accessToken hash];
  NSUInteger v4 = [(NSString *)self->_refreshToken hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_patientID hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_expiration hash];
  return v6 ^ [(NSString *)self->_scope hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(HDFHIRAuthResponse *)self accessToken];
  [v4 encodeObject:v5 forKey:@"accessToken"];

  uint64_t v6 = [(HDFHIRAuthResponse *)self refreshToken];
  [v4 encodeObject:v6 forKey:@"refreshToken"];

  v7 = [(HDFHIRAuthResponse *)self patientID];
  [v4 encodeObject:v7 forKey:@"patientID"];

  int v8 = [(HDFHIRAuthResponse *)self expiration];
  [v4 encodeObject:v8 forKey:@"expiration"];

  id v9 = [(HDFHIRAuthResponse *)self scope];
  [v4 encodeObject:v9 forKey:@"scope"];
}

- (HDFHIRAuthResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessToken"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refreshToken"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"patientID"];
  int v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scope"];
  if (v5 && v7)
  {
    self = [(HDFHIRAuthResponse *)self initWithAccessToken:v5 refreshToken:v6 patientID:v7 expiration:v8 scope:v9];
    v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }

  return v10;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSString)patientID
{
  return self->_patientID;
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (NSString)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_patientID, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);

  objc_storeStrong((id *)&self->_accessToken, 0);
}

@end