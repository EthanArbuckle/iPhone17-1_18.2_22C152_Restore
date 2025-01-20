@interface PIVTokenSession
- (BOOL)tokenSession:(id)a3 supportsOperation:(int64_t)a4 usingKey:(id)a5 algorithm:(id)a6;
- (PIVToken)PIVToken;
- (PIVTokenSession)initWithToken:(id)a3;
- (id)authenticatedKeyForObjectID:(id)a3 operation:(id)a4 error:(id *)a5;
- (id)generalAuthenticateWithData:(id)a3 operation:(id)a4 dataTag:(unint64_t)a5 usingKey:(id)a6 error:(id *)a7;
- (id)tokenSession:(id)a3 beginAuthForOperation:(int64_t)a4 constraint:(id)a5 error:(id *)p_isa;
- (id)tokenSession:(id)a3 decryptData:(id)a4 usingKey:(id)a5 algorithm:(id)a6 error:(id *)a7;
- (id)tokenSession:(id)a3 performKeyExchangeWithPublicKey:(id)a4 usingKey:(id)a5 algorithm:(id)a6 parameters:(id)a7 error:(id *)a8;
- (id)tokenSession:(id)a3 signData:(id)a4 usingKey:(id)a5 algorithm:(id)a6 error:(id *)a7;
- (int64_t)authState;
- (void)setAuthState:(int64_t)a3;
@end

@implementation PIVTokenSession

- (PIVTokenSession)initWithToken:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PIVTokenSession;
  return [(PIVTokenSession *)&v4 initWithToken:a3];
}

- (id)tokenSession:(id)a3 beginAuthForOperation:(int64_t)a4 constraint:(id)a5 error:(id *)p_isa
{
  id v8 = a5;
  if (([v8 isEqual:@"PIN"] & 1) != 0
    || ([v8 isEqual:@"PINAlways"] & 1) != 0)
  {
    if (![(PIVTokenSession *)self authState]
      || [v8 isEqual:@"PINAlways"]
      && (id)[(PIVTokenSession *)self authState] == (id)2
      || ([(PIVTokenSession *)self smartCard],
          v9 = objc_claimAutoreleasedReturnValue(),
          [v9 context],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      v11 = [[PIVAuthOperation alloc] initWithSession:self];
    }
    else
    {
      v11 = (PIVAuthOperation *)objc_opt_new();
    }
    p_isa = (id *)&v11->super.super.super.isa;
  }
  else
  {
    v13 = sub_100002FCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100005520((uint64_t)v8, v13);
    }

    if (p_isa)
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      v14 = +[NSBundle mainBundle];
      v15 = [v14 localizedStringForKey:@"WRONG_CONSTR" value:&stru_1000083D8 table:0];
      v18 = v15;
      v16 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *p_isa = +[NSError errorWithDomain:TKErrorDomain code:-8 userInfo:v16];

      p_isa = 0;
    }
  }

  return p_isa;
}

- (BOOL)tokenSession:(id)a3 supportsOperation:(int64_t)a4 usingKey:(id)a5 algorithm:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = [(PIVTokenSession *)self token];
  v12 = [v11 keychainContents];
  v13 = [v12 keyForObjectID:v10 error:0];

  if (!v13) {
    goto LABEL_29;
  }
  if (a4 == 4)
  {
    if (![v13 canPerformKeyExchange]) {
      goto LABEL_29;
    }
    NSErrorUserInfoKey v17 = [v13 keyType];
    unsigned int v18 = [v17 isEqual:kSecAttrKeyTypeECSECPrimeRandom];

    if (!v18) {
      goto LABEL_29;
    }
    if ([v9 isAlgorithm:kSecKeyAlgorithmECDHKeyExchangeStandard]) {
      goto LABEL_17;
    }
    v22 = &kSecKeyAlgorithmECDHKeyExchangeCofactor;
    goto LABEL_25;
  }
  if (a4 == 3)
  {
    if (![v13 canDecrypt]) {
      goto LABEL_29;
    }
    v20 = [v13 keyType];
    unsigned int v21 = [v20 isEqual:kSecAttrKeyTypeRSA];

    if (!v21) {
      goto LABEL_29;
    }
    v22 = &kSecKeyAlgorithmRSAEncryptionRaw;
    goto LABEL_25;
  }
  if (a4 != 2 || ![v13 canSign]) {
    goto LABEL_29;
  }
  v14 = [v13 keyType];
  unsigned int v15 = [v14 isEqual:kSecAttrKeyTypeRSA];

  if (!v15)
  {
    v23 = [v13 keyType];
    unsigned int v24 = [v23 isEqual:kSecAttrKeyTypeECSECPrimeRandom];

    if (!v24) {
      goto LABEL_29;
    }
    if ([v13 keySizeInBits] == (id)256)
    {
      v22 = &kSecKeyAlgorithmECDSASignatureDigestX962SHA256;
    }
    else
    {
      if ([v13 keySizeInBits] != (id)384) {
        goto LABEL_29;
      }
      v22 = &kSecKeyAlgorithmECDSASignatureDigestX962SHA384;
    }
LABEL_25:
    unsigned __int8 v16 = [v9 isAlgorithm:*v22];
    goto LABEL_26;
  }
  if (![v9 isAlgorithm:kSecKeyAlgorithmRSASignatureRaw])
  {
LABEL_29:
    BOOL v19 = 0;
    goto LABEL_30;
  }
  if (([v9 supportsAlgorithm:kSecKeyAlgorithmRSASignatureDigestPKCS1v15Raw] & 1) == 0
    && ([v9 supportsAlgorithm:kSecKeyAlgorithmRSASignatureDigestPSSSHA1] & 1) == 0
    && ([v9 supportsAlgorithm:kSecKeyAlgorithmRSASignatureDigestPSSSHA224] & 1) == 0
    && ([v9 supportsAlgorithm:kSecKeyAlgorithmRSASignatureDigestPSSSHA256] & 1) == 0
    && ([v9 supportsAlgorithm:kSecKeyAlgorithmRSASignatureDigestPSSSHA384] & 1) == 0)
  {
    unsigned __int8 v16 = [v9 supportsAlgorithm:kSecKeyAlgorithmRSASignatureDigestPSSSHA512];
LABEL_26:
    BOOL v19 = v16;
    goto LABEL_30;
  }
LABEL_17:
  BOOL v19 = 1;
LABEL_30:

  return v19;
}

- (id)authenticatedKeyForObjectID:(id)a3 operation:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PIVTokenSession *)self token];
  v11 = [v10 keychainContents];
  v12 = [v11 keyForObjectID:v9 error:a5];

  if (!v12) {
    goto LABEL_12;
  }
  v13 = [v12 constraints];
  v14 = [v13 objectForKeyedSubscript:v8];
  unsigned __int8 v15 = [v14 isEqual:&__kCFBooleanTrue];

  if (v15)
  {
LABEL_9:
    id v20 = v12;
    goto LABEL_13;
  }
  if (![(PIVTokenSession *)self authState]) {
    goto LABEL_10;
  }
  unsigned __int8 v16 = [v12 constraints];
  NSErrorUserInfoKey v17 = [v16 objectForKeyedSubscript:v8];
  if ([v17 isEqual:@"PINAlways"]
    && (id)[(PIVTokenSession *)self authState] == (id)2)
  {

    goto LABEL_10;
  }
  unsigned int v18 = [(PIVTokenSession *)self smartCard];
  BOOL v19 = [v18 context];

  if (v19)
  {
    [(PIVTokenSession *)self setAuthState:2];
    goto LABEL_9;
  }
LABEL_10:
  if (a5)
  {
    +[NSError errorWithDomain:TKErrorDomain code:-9 userInfo:0];
    id v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_12:
  id v20 = 0;
LABEL_13:

  return v20;
}

- (id)generalAuthenticateWithData:(id)a3 operation:(id)a4 dataTag:(unint64_t)a5 usingKey:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  v14 = [(PIVTokenSession *)self authenticatedKeyForObjectID:v13 operation:a4 error:a7];
  if (v14)
  {
    __int16 v32 = 0;
    id v15 = objc_alloc((Class)TKBERTLVRecord);
    id v16 = objc_alloc((Class)TKBERTLVRecord);
    NSErrorUserInfoKey v17 = +[NSData data];
    id v18 = [v16 initWithTag:130 value:v17];
    v39[0] = v18;
    id v31 = v12;
    id v19 = [objc_alloc((Class)TKBERTLVRecord) initWithTag:a5 value:v12];
    v39[1] = v19;
    id v20 = +[NSArray arrayWithObjects:v39 count:2];
    id v21 = [v15 initWithTag:124 records:v20];

    v22 = [(PIVTokenSession *)self smartCard];
    [v22 setUseCommandChaining:1];

    v23 = [(PIVTokenSession *)self smartCard];
    unsigned int v24 = objc_msgSend(v23, "sendIns:p1:p2:request:expectedTag:sw:error:", 135, objc_msgSend(v14, "algID"), objc_msgSend(v14, "keyID"), v21, 124, &v32, a7);

    if (v24)
    {
      v25 = [v24 value];
      v26 = +[TKBERTLVRecord recordFromData:v25];

      if ([v26 tag] == (id)130)
      {
        v27 = [v26 value];
        id v12 = v31;
      }
      else
      {
        v28 = sub_100002FCC();
        id v12 = v31;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v30 = [(PIVTokenSession *)self token];
          *(_DWORD *)buf = 138543874;
          v34 = v30;
          __int16 v35 = 2114;
          id v36 = v13;
          __int16 v37 = 2112;
          v38 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@: crypto with key %{public}@ returned bad formatted response %@", buf, 0x20u);
        }
        if (a7)
        {
          +[NSError errorWithDomain:TKErrorDomain code:-3 userInfo:0];
          v27 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = 0;
        }
      }
    }
    else
    {
      v27 = 0;
      id v12 = v31;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)tokenSession:(id)a3 signData:(id)a4 usingKey:(id)a5 algorithm:(id)a6 error:(id *)a7
{
  return [(PIVTokenSession *)self generalAuthenticateWithData:a4 operation:&off_100008628 dataTag:129 usingKey:a5 error:a7];
}

- (id)tokenSession:(id)a3 decryptData:(id)a4 usingKey:(id)a5 algorithm:(id)a6 error:(id *)a7
{
  return [(PIVTokenSession *)self generalAuthenticateWithData:a4 operation:&off_100008640 dataTag:129 usingKey:a5 error:a7];
}

- (id)tokenSession:(id)a3 performKeyExchangeWithPublicKey:(id)a4 usingKey:(id)a5 algorithm:(id)a6 parameters:(id)a7 error:(id *)a8
{
  return [(PIVTokenSession *)self generalAuthenticateWithData:a4 operation:&off_100008658 dataTag:133 usingKey:a5 error:a8];
}

- (PIVToken)PIVToken
{
  return (PIVToken *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)authState
{
  return self->_authState;
}

- (void)setAuthState:(int64_t)a3
{
  self->_authState = a3;
}

- (void).cxx_destruct
{
}

@end