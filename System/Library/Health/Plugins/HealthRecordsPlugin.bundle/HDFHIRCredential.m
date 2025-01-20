@interface HDFHIRCredential
+ (BOOL)_validateCodableCredential:(id)a3 forSync:(BOOL)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateInsertableCodableCredential:(id)a3 error:(id *)a4;
+ (BOOL)validateSyncableCodableCredential:(id)a3 error:(id *)a4;
+ (id)credentialFromCodable:(id)a3 accountSyncIdentifier:(id *)a4 ifValidWithError:(id *)a5;
+ (id)newCompatibleCodableCredential;
+ (id)patientHashForPatientID:(id)a3;
- (BOOL)deleteTokensWithError:(id *)a3;
- (BOOL)hasRefreshTokenWithError:(id *)a3;
- (BOOL)isEqualToCredential:(id)a3 epsilonExpiration:(double)a4;
- (BOOL)makeRefreshTokenSynchronizableIfNeededWithError:(id *)a3;
- (BOOL)storeAccessToken:(id)a3 error:(id *)a4;
- (BOOL)storeRefreshToken:(id)a3 error:(id *)a4;
- (HDFHIRCredential)credentialWithPopulatedAccessTokenWithError:(id *)a3;
- (HDFHIRCredential)initWithCodableCredential:(id)a3;
- (HDFHIRCredential)initWithCoder:(id)a3;
- (HDFHIRCredential)initWithIdentifier:(id)a3 requestedScopeString:(id)a4 expiration:(id)a5 scopeString:(id)a6 patientID:(id)a7;
- (NSUUID)identifier;
- (id)_accessTokenIdentifier;
- (id)_keychainItemWithName:(id)a3;
- (id)_refreshTokenIdentifier;
- (id)accessToken;
- (id)asNewCodableForAccountSyncIdentifier:(id)a3 receivedDate:(id)a4;
- (id)fetchAccessTokenWithError:(id *)a3;
- (id)fetchRefreshTokenWithError:(id *)a3;
- (id)refreshToken;
- (unint64_t)hash;
- (void)_commonInitWithIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDFHIRCredential

- (HDFHIRCredential)credentialWithPopulatedAccessTokenWithError:(id *)a3
{
  id v33 = 0;
  uint64_t v5 = [(HDFHIRCredential *)self fetchAccessTokenWithError:&v33];
  id v6 = v33;
  id v32 = 0;
  uint64_t v7 = [(HDFHIRCredential *)self fetchRefreshTokenWithError:&v32];
  id v8 = v32;
  v9 = v8;
  if (v5 | v7)
  {
    if (!v5 && v7 && v6)
    {
      if ((objc_msgSend(v6, "hk_isObjectNotFoundError") & 1) == 0)
      {
        _HKInitializeLogging();
        v14 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_ACEA0(v14, self);
        }
        v15 = v6;
        if (a3)
        {
LABEL_13:
          id v16 = 0;
          *a3 = v15;
          goto LABEL_29;
        }
LABEL_35:
        _HKLogDroppedError();
        goto LABEL_28;
      }
    }
    else if (v5 && !v7)
    {
      if (v8 && !objc_msgSend(v8, "hk_isObjectNotFoundError"))
      {
        _HKInitializeLogging();
        v29 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_ACE00(v29, self);
        }
        v15 = v9;
        if (a3) {
          goto LABEL_13;
        }
        goto LABEL_35;
      }
      _HKInitializeLogging();
      v17 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = [(HDFHIRCredential *)self debugDescription];
        *(_DWORD *)buf = 138543362;
        v35 = v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ no refresh token is present, will not be able to refresh the access token", buf, 0xCu);
      }
    }
    id v20 = objc_alloc((Class)HKFHIRCredential);
    v21 = [(HDFHIRCredential *)self patientID];
    v22 = [(HDFHIRCredential *)self expiration];
    v23 = [(HDFHIRCredential *)self requestedScopeString];
    v24 = [(HDFHIRCredential *)self scopes];
    id v16 = [v20 initWithAccessToken:v5 refreshToken:v7 patientID:v21 expiration:v22 requestedScopeString:v23 scopes:v24];

    goto LABEL_29;
  }
  _HKInitializeLogging();
  v10 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    v30 = v10;
    v31 = [(HDFHIRCredential *)self debugDescription];
    *(_DWORD *)buf = 138543874;
    v35 = v31;
    __int16 v36 = 2114;
    id v37 = v6;
    __int16 v38 = 2114;
    v39 = v9;
    _os_log_error_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve tokens from keychain - access token: %{public}@ - refresh token: %{public}@", buf, 0x20u);

    if (v6) {
      goto LABEL_4;
    }
LABEL_37:
    id v13 = v9;
    if (v13)
    {
      if (a3) {
        *a3 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
    goto LABEL_27;
  }
  if (!v6) {
    goto LABEL_37;
  }
LABEL_4:
  v11 = [v6 userInfo];
  if (v11)
  {
    v12 = [v6 userInfo];
    id v13 = [v12 mutableCopy];
  }
  else
  {
    id v13 = [&__NSDictionary0__struct mutableCopy];
  }

  [v13 setObject:v9 forKeyedSubscript:NSUnderlyingErrorKey];
  v25 = [v6 domain];
  v26 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v25, [v6 code], v13);

  id v27 = v26;
  if (v27)
  {
    if (a3) {
      *a3 = v27;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_27:
LABEL_28:
  id v16 = 0;
LABEL_29:

  return (HDFHIRCredential *)v16;
}

- (HDFHIRCredential)initWithIdentifier:(id)a3 requestedScopeString:(id)a4 expiration:(id)a5 scopeString:(id)a6 patientID:(id)a7
{
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDFHIRCredential;
  id v13 = [(HDFHIRCredential *)&v16 initWithAccessToken:0 refreshToken:0 patientID:a7 expiration:a5 requestedScopeString:a4 scopeString:a6];
  v14 = v13;
  if (v13) {
    [(HDFHIRCredential *)v13 _commonInitWithIdentifier:v12];
  }

  return v14;
}

- (HDFHIRCredential)initWithCodableCredential:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 patientID];
  unsigned int v6 = [v4 hasExpirationDate];
  if (v6)
  {
    [v4 expirationDate];
    uint64_t v7 = HDDecodeDateForValue();
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = [v4 requestedScopeString];
  unsigned int v9 = [v4 hasScopeString];
  if (v9)
  {
    v10 = [v4 scopeString];
  }
  else
  {
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)HDFHIRCredential;
  v11 = [(HDFHIRCredential *)&v15 initWithAccessToken:0 refreshToken:0 patientID:v5 expiration:v7 requestedScopeString:v8 scopeString:v10];
  if (v9) {

  }
  if (v6) {
  if (v11)
  }
  {
    id v12 = [v4 identifier];
    id v13 = +[NSUUID hk_UUIDWithData:v12];
    [(HDFHIRCredential *)v11 _commonInitWithIdentifier:v13];
  }
  return v11;
}

- (void)_commonInitWithIdentifier:(id)a3
{
  id v4 = (NSUUID *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v4;

  self->_tokenLock._os_unfair_lock_opaque = 0;
}

+ (id)patientHashForPatientID:(id)a3
{
  return objc_msgSend(a3, "hk_SHA256Hash");
}

- (id)accessToken
{
  localAccessToken = self->_localAccessToken;
  if (localAccessToken)
  {
    v3 = localAccessToken;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HDFHIRCredential;
    v3 = [(HDFHIRCredential *)&v5 accessToken];
  }

  return v3;
}

- (id)refreshToken
{
  localRefreshToken = self->_localRefreshToken;
  if (localRefreshToken)
  {
    v3 = localRefreshToken;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HDFHIRCredential;
    v3 = [(HDFHIRCredential *)&v5 refreshToken];
  }

  return v3;
}

- (id)fetchAccessTokenWithError:(id *)a3
{
  p_tokenLock = &self->_tokenLock;
  os_unfair_lock_lock(&self->_tokenLock);
  localAccessToken = self->_localAccessToken;
  if (!localAccessToken)
  {
    uint64_t v7 = [(HDFHIRCredential *)self _accessTokenIdentifier];
    id v8 = [(HDFHIRCredential *)self _keychainItemWithName:v7];

    unsigned int v9 = [v8 fetchWithError:a3];
    v10 = self->_localAccessToken;
    self->_localAccessToken = v9;

    localAccessToken = self->_localAccessToken;
  }
  v11 = localAccessToken;
  os_unfair_lock_unlock(p_tokenLock);

  return v11;
}

- (BOOL)storeAccessToken:(id)a3 error:(id *)a4
{
  id v7 = a3;
  p_tokenLock = &self->_tokenLock;
  os_unfair_lock_lock(&self->_tokenLock);
  p_localAccessToken = &self->_localAccessToken;
  localAccessToken = self->_localAccessToken;
  self->_localAccessToken = 0;

  v11 = [(HDFHIRCredential *)self _accessTokenIdentifier];
  id v12 = [(HDFHIRCredential *)self _keychainItemWithName:v11];

  if (v7) {
    unsigned int v13 = [v12 storeLocalToken:v7 error:a4];
  }
  else {
    unsigned int v13 = [v12 deleteWithError:a4];
  }
  BOOL v14 = v13;
  if (v13) {
    objc_storeStrong((id *)p_localAccessToken, a3);
  }

  os_unfair_lock_unlock(p_tokenLock);
  return v14;
}

- (BOOL)hasRefreshTokenWithError:(id *)a3
{
  objc_super v5 = [(HDFHIRCredential *)self _refreshTokenIdentifier];
  unsigned int v6 = [(HDFHIRCredential *)self _keychainItemWithName:v5];

  LOBYTE(a3) = [v6 isPresentWithError:a3];
  return (char)a3;
}

- (BOOL)makeRefreshTokenSynchronizableIfNeededWithError:(id *)a3
{
  objc_super v5 = [(HDFHIRCredential *)self _refreshTokenIdentifier];
  unsigned int v6 = [(HDFHIRCredential *)self _keychainItemWithName:v5];

  LOBYTE(a3) = [v6 makeTokenSynchronizableIfNeededWithError:a3];
  return (char)a3;
}

- (id)fetchRefreshTokenWithError:(id *)a3
{
  p_tokenLock = &self->_tokenLock;
  os_unfair_lock_lock(&self->_tokenLock);
  localRefreshToken = self->_localRefreshToken;
  if (!localRefreshToken)
  {
    id v7 = [(HDFHIRCredential *)self _refreshTokenIdentifier];
    id v8 = [(HDFHIRCredential *)self _keychainItemWithName:v7];

    unsigned int v9 = [v8 fetchWithError:a3];
    v10 = self->_localRefreshToken;
    self->_localRefreshToken = v9;

    localRefreshToken = self->_localRefreshToken;
  }
  v11 = localRefreshToken;
  os_unfair_lock_unlock(p_tokenLock);

  return v11;
}

- (BOOL)storeRefreshToken:(id)a3 error:(id *)a4
{
  id v7 = a3;
  p_tokenLock = &self->_tokenLock;
  os_unfair_lock_lock(&self->_tokenLock);
  p_localRefreshToken = &self->_localRefreshToken;
  localRefreshToken = self->_localRefreshToken;
  self->_localRefreshToken = 0;

  v11 = [(HDFHIRCredential *)self _refreshTokenIdentifier];
  id v12 = [(HDFHIRCredential *)self _keychainItemWithName:v11];

  if (v7) {
    unsigned int v13 = [v12 storeSynchronizableToken:v7 error:a4];
  }
  else {
    unsigned int v13 = [v12 deleteWithError:a4];
  }
  BOOL v14 = v13;
  if (v13) {
    objc_storeStrong((id *)p_localRefreshToken, a3);
  }

  os_unfair_lock_unlock(p_tokenLock);
  return v14;
}

- (BOOL)deleteTokensWithError:(id *)a3
{
  BOOL v5 = [(HDFHIRCredential *)self storeAccessToken:0 error:a3];
  if (v5)
  {
    LOBYTE(v5) = [(HDFHIRCredential *)self storeRefreshToken:0 error:a3];
  }
  return v5;
}

- (id)_accessTokenIdentifier
{
  v2 = [(NSUUID *)self->_identifier UUIDString];
  v3 = +[NSString stringWithFormat:@"health-app:chr/auth/%@#access", v2];

  return v3;
}

- (id)_refreshTokenIdentifier
{
  v2 = [(NSUUID *)self->_identifier UUIDString];
  v3 = +[NSString stringWithFormat:@"health-app:chr/auth/%@#refresh", v2];

  return v3;
}

- (id)_keychainItemWithName:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)HKTokenKeychainItem) initWithName:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDFHIRCredential;
  id v4 = a3;
  [(HDFHIRCredential *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, @"identifier", v5.receiver, v5.super_class);
}

- (HDFHIRCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)HDFHIRCredential;
    unsigned int v6 = [(HDFHIRCredential *)&v9 initWithCoder:v4];

    if (v6) {
      [(HDFHIRCredential *)v6 _commonInitWithIdentifier:v5];
    }
    self = v6;
    id v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");

    id v7 = 0;
  }

  return v7;
}

+ (id)credentialFromCodable:(id)a3 accountSyncIdentifier:(id *)a4 ifValidWithError:(id *)a5
{
  id v8 = a3;
  if ([a1 validateSyncableCodableCredential:v8 error:a5])
  {
    if (a4)
    {
      objc_super v9 = [v8 accountSyncIdentifier];
      *a4 = +[NSUUID hk_UUIDWithData:v9];
    }
    v10 = [[HDFHIRCredential alloc] initWithCodableCredential:v8];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)newCompatibleCodableCredential
{
  id v2 = objc_alloc_init((Class)HDCodableFHIRCredential);
  id v3 = objc_alloc_init((Class)HDCodableMessageVersion);
  [v2 setMessageVersion:v3];

  id v4 = [v2 messageVersion];
  [v4 setEntityVersion:1];

  objc_super v5 = [v2 messageVersion];
  [v5 setCompatibilityVersion:1];

  return v2;
}

- (id)asNewCodableForAccountSyncIdentifier:(id)a3 receivedDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HDFHIRCredential.m", 216, @"Invalid parameter not satisfying: %@", @"receivedDate" object file lineNumber description];
  }
  id v9 = [(id)objc_opt_class() newCompatibleCodableCredential];
  v10 = [(HDFHIRCredential *)self identifier];
  v11 = objc_msgSend(v10, "hk_dataForUUIDBytes");
  [v9 setIdentifier:v11];

  if (v7)
  {
    id v12 = objc_msgSend(v7, "hk_dataForUUIDBytes");
    [v9 setAccountSyncIdentifier:v12];
  }
  unsigned int v13 = [(HDFHIRCredential *)self requestedScopeString];
  [v9 setRequestedScopeString:v13];

  HDEncodeValueForDate();
  objc_msgSend(v9, "setReceivedDate:");
  BOOL v14 = [(HDFHIRCredential *)self expiration];

  if (v14)
  {
    objc_super v15 = [(HDFHIRCredential *)self expiration];
    HDEncodeValueForDate();
    objc_msgSend(v9, "setExpirationDate:");
  }
  objc_super v16 = [(HDFHIRCredential *)self scopeString];
  id v17 = [v16 length];

  if (v17)
  {
    v18 = [(HDFHIRCredential *)self scopeString];
    [v9 setScopeString:v18];
  }
  v19 = [(HDFHIRCredential *)self patientID];
  id v20 = [v19 length];

  if (v20)
  {
    v21 = [(HDFHIRCredential *)self patientID];
    [v9 setPatientID:v21];
  }

  return v9;
}

+ (BOOL)validateInsertableCodableCredential:(id)a3 error:(id *)a4
{
  return [a1 _validateCodableCredential:a3 forSync:0 error:a4];
}

+ (BOOL)validateSyncableCodableCredential:(id)a3 error:(id *)a4
{
  return [a1 _validateCodableCredential:a3 forSync:1 error:a4];
}

+ (BOOL)_validateCodableCredential:(id)a3 forSync:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  if ([v7 hasMessageVersion])
  {
    id v9 = [v7 messageVersion];
    int v10 = [v9 compatibilityVersion];

    if (v10 >= 2)
    {
      v11 = [v7 messageVersion];
      id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"compatibility version is higher (%lu) than what we support (%lu)", (int)[v11 compatibilityVersion], 1);
      [v8 addObject:v12];
    }
  }
  else
  {
    [v8 addObject:@"no compatibility version"];
  }
  unsigned int v13 = [v7 identifier];
  id v14 = [v13 length];

  if (v14)
  {
    objc_super v15 = [v7 identifier];
    objc_super v16 = +[NSUUID hk_UUIDWithData:v15];

    if (v16) {
      goto LABEL_10;
    }
    CFStringRef v17 = @"invalid identifier bytes (not a UUID)";
  }
  else
  {
    CFStringRef v17 = @"no identifier";
  }
  [v8 addObject:v17];
LABEL_10:
  if (!v6) {
    goto LABEL_16;
  }
  v18 = [v7 accountSyncIdentifier];
  id v19 = [v18 length];

  if (v19)
  {
    id v20 = [v7 accountSyncIdentifier];
    v21 = +[NSUUID hk_UUIDWithData:v20];

    if (v21) {
      goto LABEL_16;
    }
    CFStringRef v22 = @"invalid account sync identifier bytes (not a UUID)";
  }
  else
  {
    CFStringRef v22 = @"no account sync identifier";
  }
  [v8 addObject:v22];
LABEL_16:
  v23 = [v7 patientID];
  id v24 = [v23 length];

  if (!v24) {
    [v8 addObject:@"no patient id"];
  }
  v25 = [v7 requestedScopeString];
  id v26 = [v25 length];

  if (!v26) {
    [v8 addObject:@"no requested scope string"];
  }
  if (([v7 hasReceivedDate] & 1) == 0) {
    [v8 addObject:@"no received date"];
  }
  id v27 = [v8 count];
  if (v27)
  {
    v28 = [v8 componentsJoinedByString:@"; "];
    +[NSError hk_assignError:a5, 3, @"codable FHIR credential is invalid: %@", v28 code format];
  }
  return v27 == 0;
}

- (BOOL)isEqualToCredential:(id)a3 epsilonExpiration:(double)a4
{
  id v8 = a3;
  id v9 = [(HDFHIRCredential *)self expiration];
  int v10 = [v8 expiration];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  unsigned int v13 = (NSUUID *)&stru_20;
  identifier = self->_identifier;
  objc_super v15 = [v8 identifier];
  if (identifier != v15)
  {
    uint64_t v16 = [v8 identifier];
    if (!v16)
    {
      unsigned __int8 v23 = 0;
      goto LABEL_36;
    }
    CFStringRef v17 = (void *)v16;
    unsigned int v13 = self->_identifier;
    id v4 = [v8 identifier];
    if (![(NSUUID *)v13 isEqual:v4])
    {
      unsigned __int8 v23 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v48 = v17;
  }
  double v18 = fabs(v12);
  id v19 = [(HDFHIRCredential *)self patientID];
  id v20 = [v8 patientID];
  if (v19 == v20)
  {
    if (v18 <= a4) {
      goto LABEL_14;
    }
LABEL_12:
    unsigned __int8 v23 = 0;
    goto LABEL_33;
  }
  uint64_t v21 = [v8 patientID];
  if (!v21) {
    goto LABEL_12;
  }
  unsigned int v13 = (NSUUID *)v21;
  objc_super v5 = [(HDFHIRCredential *)self patientID];
  CFStringRef v22 = [v8 patientID];
  if (([v5 isEqualToString:v22] & 1) == 0)
  {

    unsigned __int8 v23 = 0;
    goto LABEL_34;
  }
  v44 = v22;
  if (v18 > a4)
  {
    v45 = v5;
    unsigned __int8 v23 = 0;
LABEL_32:

    goto LABEL_33;
  }
LABEL_14:
  v46 = v19;
  id v24 = [(HDFHIRCredential *)self requestedScopeString];
  v42 = [v8 requestedScopeString];
  v43 = v24;
  v45 = v5;
  if (v24 == v42)
  {
    v40 = v13;
    v41 = v4;
LABEL_20:
    id v19 = v46;
    v29 = [(HDFHIRCredential *)self scopes];
    uint64_t v30 = [v8 scopes];
    unsigned __int8 v23 = v29 == (void *)v30;
    if (v29 == (void *)v30)
    {
    }
    else
    {
      v31 = (void *)v30;
      uint64_t v32 = [v8 scopes];
      if (v32)
      {
        v47 = (void *)v32;
        id v33 = [(HDFHIRCredential *)self scopes];
        v34 = [v8 scopes];
        unsigned __int8 v23 = [v33 isEqual:v34];

        if (v43 == v42)
        {
        }
        else
        {
        }
LABEL_40:
        unsigned int v13 = v40;
        id v4 = v41;
        CFStringRef v22 = v44;
        if (v19 == v20) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }
    v35 = v42;
    id v24 = v43;
    if (v43 == v42)
    {

      id v19 = v46;
      goto LABEL_40;
    }

    unsigned int v13 = v40;
    id v4 = v41;
    CFStringRef v22 = v44;
    goto LABEL_31;
  }
  uint64_t v25 = [v8 requestedScopeString];
  if (v25)
  {
    id v26 = (void *)v25;
    v41 = v4;
    id v27 = [(HDFHIRCredential *)self requestedScopeString];
    v28 = [v8 requestedScopeString];
    v39 = v27;
    if (([v27 isEqualToString:v28] & 1) == 0)
    {

      unsigned __int8 v23 = 0;
      id v19 = v46;
      CFStringRef v22 = v44;
      id v4 = v41;
      if (v46 == v20) {
        goto LABEL_33;
      }
      goto LABEL_32;
    }
    id v37 = v28;
    __int16 v38 = v26;
    v40 = v13;
    goto LABEL_20;
  }
  unsigned __int8 v23 = 0;
  CFStringRef v22 = v44;
  v35 = v42;
LABEL_31:

  id v19 = v46;
  if (v46 != v20) {
    goto LABEL_32;
  }
LABEL_33:

LABEL_34:
  CFStringRef v17 = v48;
  if (identifier != v15) {
    goto LABEL_35;
  }
LABEL_36:

  return v23;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSUUID *)self->_identifier hash];
  id v4 = [(HDFHIRCredential *)self patientID];
  unint64_t v5 = (unint64_t)[v4 hash];
  BOOL v6 = [(HDFHIRCredential *)self expiration];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];
  id v8 = [(HDFHIRCredential *)self requestedScopeString];
  unint64_t v9 = v7 ^ (unint64_t)[v8 hash];
  int v10 = [(HDFHIRCredential *)self scopes];
  unint64_t v11 = v9 ^ (unint64_t)[v10 hash] ^ v3;

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localRefreshToken, 0);

  objc_storeStrong((id *)&self->_localAccessToken, 0);
}

@end