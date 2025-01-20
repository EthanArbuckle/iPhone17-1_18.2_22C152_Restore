@interface HKFHIRCredentialRefreshResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDFHIRAuthResponse)authResponse;
- (HKFHIRCredential)credential;
- (HKFHIRCredentialRefreshResult)initWithCoder:(id)a3;
- (HKFHIRCredentialRefreshResult)initWithCredential:(id)a3 authResponse:(id)a4 endStates:(id)a5 error:(id)a6;
- (HKFHIRRequestTaskEndStates)endStates;
- (NSError)error;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRCredentialRefreshResult

- (HKFHIRCredentialRefreshResult)initWithCredential:(id)a3 authResponse:(id)a4 endStates:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKFHIRCredentialRefreshResult;
  v14 = [(HKFHIRCredentialRefreshResult *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    credential = v14->_credential;
    v14->_credential = (HKFHIRCredential *)v15;

    uint64_t v17 = [v11 copy];
    authResponse = v14->_authResponse;
    v14->_authResponse = (HDFHIRAuthResponse *)v17;

    uint64_t v19 = [v12 copy];
    endStates = v14->_endStates;
    v14->_endStates = (HKFHIRRequestTaskEndStates *)v19;

    uint64_t v21 = [v13 copy];
    error = v14->_error;
    v14->_error = (NSError *)v21;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKFHIRCredentialRefreshResult *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    credential = self->_credential;
    id v10 = [(HKFHIRCredentialRefreshResult *)v8 credential];
    if (credential != v10)
    {
      uint64_t v11 = [(HKFHIRCredentialRefreshResult *)v8 credential];
      if (!v11)
      {
        char v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      id v12 = self->_credential;
      id v13 = [(HKFHIRCredentialRefreshResult *)v8 credential];
      if (![(HKOAuth2Credential *)v12 isEqual:v13])
      {
        char v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    authResponse = self->_authResponse;
    v16 = [(HKFHIRCredentialRefreshResult *)v8 authResponse];
    if (authResponse == v16)
    {
      v42 = authResponse;
    }
    else
    {
      uint64_t v17 = [(HKFHIRCredentialRefreshResult *)v8 authResponse];
      if (!v17)
      {
        char v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = authResponse;
      uint64_t v19 = self->_authResponse;
      v4 = [(HKFHIRCredentialRefreshResult *)v8 authResponse];
      if (![(HDFHIRAuthResponse *)v19 isEqual:v4])
      {

        char v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    endStates = self->_endStates;
    uint64_t v21 = [(HKFHIRCredentialRefreshResult *)v8 endStates];
    v41 = v4;
    if (endStates == v21)
    {
      v39 = v3;
      v40 = endStates;
    }
    else
    {
      uint64_t v22 = [(HKFHIRCredentialRefreshResult *)v8 endStates];
      if (!v22)
      {
        char v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:
        }
LABEL_36:

LABEL_37:
        id v13 = v43;
        if (credential != v10) {
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
      v40 = endStates;
      v37 = (void *)v22;
      v23 = self->_endStates;
      uint64_t v24 = [(HKFHIRCredentialRefreshResult *)v8 endStates];
      v25 = v23;
      v26 = (void *)v24;
      if (![(HKFHIRRequestTaskEndStates *)v25 isEqual:v24])
      {

        char v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    error = self->_error;
    uint64_t v28 = [(HKFHIRCredentialRefreshResult *)v8 error];
    char v14 = error == (NSError *)v28;
    if (error == (NSError *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      uint64_t v30 = [(HKFHIRCredentialRefreshResult *)v8 error];
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_error;
        v33 = [(HKFHIRCredentialRefreshResult *)v8 error];
        char v14 = [(NSError *)v32 isEqual:v33];

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }
    }
    if (v40 == v21) {
      goto LABEL_42;
    }

    v3 = v39;
    goto LABEL_33;
  }
  char v14 = 1;
LABEL_41:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKFHIRCredential *)self->_credential hash];
  unint64_t v4 = [(HDFHIRAuthResponse *)self->_authResponse hash] ^ v3;
  unint64_t v5 = [(HKFHIRRequestTaskEndStates *)self->_endStates hash];
  return v4 ^ v5 ^ [(NSError *)self->_error hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  credential = self->_credential;
  id v5 = a3;
  [v5 encodeObject:credential forKey:@"credential"];
  [v5 encodeObject:self->_authResponse forKey:@"authResponse"];
  [v5 encodeObject:self->_endStates forKey:@"endStates"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (HKFHIRCredentialRefreshResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credential"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authResponse"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endStates"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    self = [(HKFHIRCredentialRefreshResult *)self initWithCredential:v5 authResponse:v6 endStates:v7 error:v8];

    v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (HKFHIRCredential)credential
{
  return self->_credential;
}

- (HDFHIRAuthResponse)authResponse
{
  return self->_authResponse;
}

- (HKFHIRRequestTaskEndStates)endStates
{
  return self->_endStates;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_endStates, 0);
  objc_storeStrong((id *)&self->_authResponse, 0);

  objc_storeStrong((id *)&self->_credential, 0);
}

@end