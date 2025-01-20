@interface IDSAuthenticationSigningResult
- (IDSAuthenticationSigningResult)initWithSubscriptionIdentifiers:(id)a3 authenticationCertificates:(id)a4 inputData:(id)a5 nonce:(id)a6 signature:(id)a7;
- (NSArray)authenticationCertificateSignatures;
- (NSData)inputData;
- (NSData)nonce;
- (NSString)serverVerifiableEncoding;
- (id)description;
@end

@implementation IDSAuthenticationSigningResult

- (IDSAuthenticationSigningResult)initWithSubscriptionIdentifiers:(id)a3 authenticationCertificates:(id)a4 inputData:(id)a5 nonce:(id)a6 signature:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)IDSAuthenticationSigningResult;
  v17 = [(IDSAuthenticationSigningResult *)&v32 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_inputData, a5);
    objc_storeStrong((id *)&v18->_nonce, a6);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v20 = [v12 count];
    v29 = v18;
    id v31 = v14;
    if (v20 == [v13 count])
    {
      if ([v12 count])
      {
        unint64_t v21 = 0;
        do
        {
          v22 = objc_msgSend(v13, "objectAtIndexedSubscript:", v21, v29);
          v23 = [v12 objectAtIndexedSubscript:v21];
          v24 = (void *)[objc_alloc(MEMORY[0x1E4F6B3D0]) initWithSubscriptionIdentifier:v23 authenticationCertificate:v22 signature:v16 nonce:v15];
          [v19 addObject:v24];

          ++v21;
        }
        while ([v12 count] > v21);
      }
    }
    else
    {
      v25 = [MEMORY[0x1E4F6C3B8] sms];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_191A2EB38((uint64_t)v12, (uint64_t)v13, v25);
      }
    }
    uint64_t v26 = objc_msgSend(v19, "copy", v29);
    v18 = v30;
    authenticationCertificateSignatures = v30->_authenticationCertificateSignatures;
    v30->_authenticationCertificateSignatures = (NSArray *)v26;

    id v14 = v31;
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(IDSAuthenticationSigningResult *)self authenticationCertificateSignatures];
  v6 = [v3 stringWithFormat:@"<%@: %p authenticationCertificateSignatures: %@>", v4, self, v5];

  return v6;
}

- (NSArray)authenticationCertificateSignatures
{
  return self->_authenticationCertificateSignatures;
}

- (NSData)inputData
{
  return self->_inputData;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_inputData, 0);

  objc_storeStrong((id *)&self->_authenticationCertificateSignatures, 0);
}

- (NSString)serverVerifiableEncoding
{
  v2 = [(IDSAuthenticationSigningResult *)self authenticationCertificateSignatures];
  v3 = [v2 firstObject];
  uint64_t v4 = [v3 serverVerifiableEncoding];

  return (NSString *)v4;
}

@end