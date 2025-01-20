@interface AcmeCertRequest
- (AcmeCertRequest)initWithSubject:(id)a3 parameters:(id)a4;
- (BOOL)deviceAttestationSupported;
- (BOOL)logAcmeCSR;
- (BOOL)permitLocalIssuer;
- (BOOL)requireAttestation;
- (BOOL)valueForBooleanDefault:(id)a3;
- (NSArray)attestationCRChain;
- (NSArray)attestationChain;
- (NSArray)attestationOids;
- (NSArray)authorizations;
- (NSArray)subject;
- (NSData)attestation;
- (NSData)csr;
- (NSDictionary)keyParams;
- (NSDictionary)parameters;
- (NSString)account;
- (NSString)acmeNewAccountURL;
- (NSString)acmeNewNonceURL;
- (NSString)acmeNewOrderURL;
- (NSString)authorizationURL;
- (NSString)certificateURL;
- (NSString)challengeURL;
- (NSString)finalizeOrderURL;
- (NSString)location;
- (NSString)nextMessageURL;
- (NSString)nonce;
- (NSString)orderURL;
- (NSString)timestamp;
- (NSString)token;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)xpc_queue;
- (OS_xpc_object)connection;
- (SecJWSEncoder)encoder;
- (__SecCertificate)certificate;
- (__SecIdentity)identity;
- (__SecIdentity)identityWithError:(id *)a3;
- (__SecKey)attestationCRKey;
- (__SecKey)privateKey;
- (__SecKey)publicKey;
- (id)acmeRequest;
- (id)attestationChainPEMRepresentation;
- (id)attestationObjectWithCertificates:(id)a3;
- (id)createCSR;
- (id)createCertificate;
- (id)createKeyPair;
- (id)executeRequest;
- (id)hardwareAttestationWithError:(id *)a3;
- (id)pollForStatus:(id)a3 until:(id)a4;
- (id)processReply:(id)a3;
- (id)requestAttestationChainWithError:(id *)a3;
- (id)sanitizeParameters;
- (id)sanitizeSubject;
- (id)sendRequestToXPCService:(id)a3 response:(id *)a4;
- (id)serialNumber;
- (int)errorStatusWithHTTPErrorCode:(int)a3;
- (int64_t)state;
- (void)dealloc;
- (void)setAccount:(id)a3;
- (void)setAcmeNewAccountURL:(id)a3;
- (void)setAcmeNewNonceURL:(id)a3;
- (void)setAcmeNewOrderURL:(id)a3;
- (void)setAttestation:(id)a3;
- (void)setAttestationCRChain:(id)a3;
- (void)setAttestationCRKey:(__SecKey *)a3;
- (void)setAttestationChain:(id)a3;
- (void)setAttestationOids:(id)a3;
- (void)setAuthorizationURL:(id)a3;
- (void)setAuthorizations:(id)a3;
- (void)setCertificate:(__SecCertificate *)a3;
- (void)setCertificateURL:(id)a3;
- (void)setChallengeURL:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCsr:(id)a3;
- (void)setEncoder:(id)a3;
- (void)setFinalizeOrderURL:(id)a3;
- (void)setIdentity:(__SecIdentity *)a3;
- (void)setKeyParams:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLogAcmeCSR:(BOOL)a3;
- (void)setNextMessageURL:(id)a3;
- (void)setNonce:(id)a3;
- (void)setOrderURL:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPermitLocalIssuer:(BOOL)a3;
- (void)setPrivateKey:(__SecKey *)a3;
- (void)setPublicKey:(__SecKey *)a3;
- (void)setQueue:(id)a3;
- (void)setRequireAttestation:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setSubject:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setToken:(id)a3;
- (void)setXpc_queue:(id)a3;
@end

@implementation AcmeCertRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_xpc_queue, 0);
  objc_storeStrong((id *)&self->_acmeNewOrderURL, 0);
  objc_storeStrong((id *)&self->_acmeNewNonceURL, 0);
  objc_storeStrong((id *)&self->_acmeNewAccountURL, 0);
  objc_storeStrong((id *)&self->_nextMessageURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_orderURL, 0);
  objc_storeStrong((id *)&self->_finalizeOrderURL, 0);
  objc_storeStrong((id *)&self->_challengeURL, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
  objc_storeStrong((id *)&self->_authorizations, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_csr, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_attestationCRChain, 0);
  objc_storeStrong((id *)&self->_attestationChain, 0);
  objc_storeStrong((id *)&self->_attestationOids, 0);
  objc_storeStrong((id *)&self->_keyParams, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setIdentity:(__SecIdentity *)a3
{
  self->_identity = a3;
}

- (__SecIdentity)identity
{
  return self->_identity;
}

- (void)setCertificate:(__SecCertificate *)a3
{
  self->_certificate = a3;
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPublicKey:(__SecKey *)a3
{
  self->_publicKey = a3;
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (void)setEncoder:(id)a3
{
}

- (SecJWSEncoder)encoder
{
  return (SecJWSEncoder *)objc_getProperty(self, a2, 240, 1);
}

- (void)setConnection:(id)a3
{
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 232, 1);
}

- (void)setXpc_queue:(id)a3
{
}

- (OS_dispatch_queue)xpc_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAcmeNewOrderURL:(id)a3
{
}

- (NSString)acmeNewOrderURL
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setAcmeNewNonceURL:(id)a3
{
}

- (NSString)acmeNewNonceURL
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAcmeNewAccountURL:(id)a3
{
}

- (NSString)acmeNewAccountURL
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setNextMessageURL:(id)a3
{
}

- (NSString)nextMessageURL
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCertificateURL:(id)a3
{
}

- (NSString)certificateURL
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setOrderURL:(id)a3
{
}

- (NSString)orderURL
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setFinalizeOrderURL:(id)a3
{
}

- (NSString)finalizeOrderURL
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setChallengeURL:(id)a3
{
}

- (NSString)challengeURL
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAuthorizationURL:(id)a3
{
}

- (NSString)authorizationURL
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAuthorizations:(id)a3
{
}

- (NSArray)authorizations
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)timestamp
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setToken:(id)a3
{
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAccount:(id)a3
{
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLocation:(id)a3
{
}

- (NSString)location
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNonce:(id)a3
{
}

- (NSString)nonce
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCsr:(id)a3
{
}

- (NSData)csr
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAttestation:(id)a3
{
}

- (NSData)attestation
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAttestationCRChain:(id)a3
{
}

- (NSArray)attestationCRChain
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAttestationCRKey:(__SecKey *)a3
{
  self->_attestationCRKey = a3;
}

- (__SecKey)attestationCRKey
{
  return self->_attestationCRKey;
}

- (void)setAttestationChain:(id)a3
{
}

- (NSArray)attestationChain
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAttestationOids:(id)a3
{
}

- (NSArray)attestationOids
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeyParams:(id)a3
{
}

- (NSDictionary)keyParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParameters:(id)a3
{
}

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubject:(id)a3
{
}

- (NSArray)subject
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequireAttestation:(BOOL)a3
{
  self->_requireAttestation = a3;
}

- (BOOL)requireAttestation
{
  return self->_requireAttestation;
}

- (void)setPermitLocalIssuer:(BOOL)a3
{
  self->_permitLocalIssuer = a3;
}

- (BOOL)permitLocalIssuer
{
  return self->_permitLocalIssuer;
}

- (void)setLogAcmeCSR:(BOOL)a3
{
  self->_logAcmeCSR = a3;
}

- (BOOL)logAcmeCSR
{
  return self->_logAcmeCSR;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (__SecIdentity)identityWithError:(id *)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  self->_identity = 0;
  uint64_t v5 = [(AcmeCertRequest *)self executeRequest];
  if (v5)
  {
    v6 = (void *)v5;
    if (self->_identity) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  certificate = self->_certificate;
  if (!certificate || (privateKey = self->_privateKey) == 0)
  {
    if (!self->_identity) {
      goto LABEL_7;
    }
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  v9 = (__SecIdentity *)SecIdentityCreate(*MEMORY[0x1E4F1CF80], certificate, privateKey);
  self->_identity = v9;
  if (v9) {
    goto LABEL_11;
  }
LABEL_7:
  v10 = [NSString stringWithFormat:@"failed to create identity (check input values)"];
  v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28760];
  uint64_t v26 = *MEMORY[0x1E4F28568];
  v27[0] = v10;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v6 = [v11 errorWithDomain:v12 code:-67838 userInfo:v13];

LABEL_8:
  v14 = self->_privateKey;
  if (v14)
  {
    v24[0] = @"class";
    v24[1] = @"v_Ref";
    v25[0] = @"keys";
    v25[1] = v14;
    CFDictionaryRef v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    SecItemDelete(v15);
  }
LABEL_12:
  publicKey = self->_publicKey;
  if (publicKey)
  {
    v22[0] = @"class";
    v22[1] = @"v_Ref";
    v23[0] = @"keys";
    v23[1] = publicKey;
    CFDictionaryRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    SecItemDelete(v17);
  }
  if (v6)
  {
    v18 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = v6;
      _os_log_impl(&dword_18B299000, v18, OS_LOG_TYPE_DEFAULT, "identityWithError: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  if (a3) {
    *a3 = v6;
  }

  return self->_identity;
}

- (id)executeRequest
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int64_t state = self->_state;
  if (state > 0)
  {
    v4 = 0;
    goto LABEL_3;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AcmeCertRequest_executeRequest__block_invoke;
  block[3] = &unk_1E5484B08;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = [(AcmeCertRequest *)self createKeyPair];
  if (v4) {
    goto LABEL_11;
  }
  v4 = [(AcmeCertRequest *)self createCSR];
  if (v4) {
    goto LABEL_11;
  }
  CFDictionaryRef v17 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"acmeDirectory"];
  v18 = [v17 absoluteString];
  nextMessageURL = self->_nextMessageURL;
  self->_nextMessageURL = v18;

  if (self->_nextMessageURL)
  {
    v4 = 0;
    int64_t v20 = 1;
  }
  else
  {
    v21 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"acmeServerURL"];
    v22 = [v21 absoluteString];
    v23 = self->_nextMessageURL;
    self->_nextMessageURL = v22;

    v24 = self->_nextMessageURL;
    self->_int64_t state = 1;
    if (v24)
    {
      v4 = 0;
      goto LABEL_33;
    }
    v4 = [(AcmeCertRequest *)self createCertificate];
    int64_t v20 = 10;
  }
  self->_int64_t state = v20;
LABEL_33:
  int64_t state = self->_state;
LABEL_3:
  if (state > 9)
  {
LABEL_11:
    id v6 = 0;
    goto LABEL_25;
  }
  uint64_t v5 = (const void *)*MEMORY[0x1E4F1CFD0];

  id v6 = 0;
  while (1)
  {

    v7 = [(AcmeCertRequest *)self acmeRequest];
    id v25 = 0;
    v4 = [(AcmeCertRequest *)self sendRequestToXPCService:v7 response:&v25];
    id v6 = v25;

    if (v4) {
      break;
    }
    uint64_t v8 = [(AcmeCertRequest *)self processReply:v6];
    if (v8)
    {
      v4 = (void *)v8;
      break;
    }
    if (self->_state >= 10)
    {
      v4 = 0;
      goto LABEL_25;
    }
  }
  v10 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v11 = self->_state;
    *(_DWORD *)buf = 134218242;
    int64_t v28 = v11;
    __int16 v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "ACME request flow failed at step %lld: %@", buf, 0x16u);
  }

  id v12 = [(NSDictionary *)self->_parameters objectForKey:@"acmeLocalIssuer"];
  v13 = v12;
  if (v12)
  {
    CFRetain(v12);
    if (!self->_permitLocalIssuer)
    {
      CFTypeID v14 = CFGetTypeID(v13);
      if (v14 != CFBooleanGetTypeID() || !v5 || !CFEqual(v13, v5)) {
        goto LABEL_23;
      }
    }
  }
  else if (!self->_permitLocalIssuer)
  {
    goto LABEL_24;
  }
  uint64_t v15 = [(AcmeCertRequest *)self createCertificate];

  v4 = (void *)v15;
  if (v13) {
LABEL_23:
  }
    CFRelease(v13);
LABEL_24:
  self->_int64_t state = 10;
LABEL_25:

  return v4;
}

void __33__AcmeCertRequest_executeRequest__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(const void **)(v2 + 264);
  if (v3)
  {
    *(void *)(v2 + 264) = 0;
    CFRelease(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v4 = *(const void **)(v2 + 272);
  if (v4)
  {
    *(void *)(v2 + 272) = 0;
    CFRelease(v4);
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v10 setLocale:v5];

  [v10 setDateFormat:@"yyyy-MM-dd-HH-mm-ss-SSSS"];
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v7 = [v10 stringFromDate:v6];
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 136);
  *(void *)(v8 + 136) = v7;

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 32) valueForBooleanDefault:@"LogAcmeCSR"];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = [*(id *)(a1 + 32) valueForBooleanDefault:@"PermitLocalIssuer"];
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = [*(id *)(a1 + 32) valueForBooleanDefault:@"RequireAttestation"];
}

- (BOOL)valueForBooleanDefault:(id)a3
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.security", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID()) {
      int Value = CFBooleanGetValue(v4);
    }
    else {
      int Value = 0;
    }
    CFRelease(v4);
  }
  else
  {
    int Value = 0;
  }
  return Value != 0;
}

- (id)processReply:(id)a3
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFTypeID v5 = v4;
  id v6 = 0;
  uint64_t v7 = 0;
  switch(self->_state)
  {
    case 1:
      uint64_t v8 = [v4 objectForKey:@"newAccount"];
      acmeNewAccountURL = self->_acmeNewAccountURL;
      self->_acmeNewAccountURL = v8;

      id v10 = [v5 objectForKey:@"newNonce"];
      acmeNewNonceURL = self->_acmeNewNonceURL;
      self->_acmeNewNonceURL = v10;

      id v12 = [v5 objectForKey:@"newOrder"];
      acmeNewOrderURL = self->_acmeNewOrderURL;
      self->_acmeNewOrderURL = v12;

      if (self->_acmeNewAccountURL)
      {
        CFTypeID v14 = self->_acmeNewNonceURL;
        if (v14)
        {
          if (self->_acmeNewOrderURL)
          {
            objc_storeStrong((id *)&self->_nextMessageURL, v14);
            id v6 = 0;
            uint64_t v7 = 0;
            int64_t v15 = 2;
            goto LABEL_9;
          }
        }
      }
      v64 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v65 = *MEMORY[0x1E4F28760];
      id v6 = @"failed to get directory info";
      uint64_t v109 = *MEMORY[0x1E4F28568];
      v110[0] = @"failed to get directory info";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:&v109 count:1];
      uint64_t v21 = -67683;
      v19 = v64;
      uint64_t v20 = v65;
      goto LABEL_48;
    case 2:
      v22 = [v4 objectForKey:@"Replay-Nonce"];
      nonce = self->_nonce;
      self->_nonce = v22;

      if (self->_nonce)
      {
        objc_storeStrong((id *)&self->_nextMessageURL, self->_acmeNewAccountURL);
        id v6 = 0;
        uint64_t v7 = 0;
        int64_t v15 = 3;
LABEL_9:
        self->_int64_t state = v15;
        goto LABEL_66;
      }
      v72 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v73 = *MEMORY[0x1E4F28760];
      id v6 = @"failed to get initial nonce";
      uint64_t v107 = *MEMORY[0x1E4F28568];
      v108 = @"failed to get initial nonce";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      v19 = v72;
      uint64_t v20 = v73;
      uint64_t v21 = -67673;
LABEL_48:
      uint64_t v7 = [v19 errorWithDomain:v20 code:v21 userInfo:v18];
      goto LABEL_65;
    case 3:
      v18 = [v4 objectForKey:@"orders"];
      v24 = [v5 objectForKey:@"status"];
      int v25 = [v24 isEqualToString:@"valid"];
      objc_storeStrong((id *)&self->_account, self->_location);
      if (v25 && v18)
      {
        objc_storeStrong((id *)&self->_nextMessageURL, self->_acmeNewOrderURL);
        id v6 = 0;
        uint64_t v7 = 0;
        self->_int64_t state = 4;
      }
      else
      {
        v66 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v67 = *MEMORY[0x1E4F28760];
        uint64_t v105 = *MEMORY[0x1E4F28568];
        id v6 = @"failed to establish account";
        v106 = @"failed to establish account";
        v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
        uint64_t v7 = [v66 errorWithDomain:v67 code:-67673 userInfo:v68];
      }
      goto LABEL_65;
    case 4:
      v89 = [v4 objectForKey:@"status"];
      char v87 = [v89 isEqualToString:@"pending"];
      uint64_t v26 = [v5 objectForKey:@"authorizations"];
      authorizations = self->_authorizations;
      self->_authorizations = v26;

      int64_t v28 = [(NSArray *)self->_authorizations objectAtIndex:0];
      authorizationURL = self->_authorizationURL;
      self->_authorizationURL = v28;

      v30 = [v5 objectForKey:@"finalize"];
      finalizeOrderURL = self->_finalizeOrderURL;
      self->_finalizeOrderURL = v30;

      objc_storeStrong((id *)&self->_orderURL, self->_location);
      v32 = [v5 objectForKey:@"identifiers"];
      uint64_t v33 = [v32 count];
      if (v33)
      {
        unint64_t v34 = v33;
        BOOL v35 = 0;
        for (i = 0; i != v34; BOOL v35 = i >= v34)
        {
          v37 = [v32 objectAtIndex:i];
          v38 = [v37 objectForKey:@"type"];
          int v39 = [v38 isEqualToString:@"permanent-identifier"];

          if (v39) {
            break;
          }
          ++i;
        }
      }
      else
      {
        BOOL v35 = 1;
      }
      v74 = self->_authorizationURL;
      if (v74 && !v35 && self->_finalizeOrderURL != 0 && (v87 & 1) != 0)
      {
        objc_storeStrong((id *)&self->_nextMessageURL, v74);
        id v6 = 0;
        uint64_t v7 = 0;
        self->_int64_t state = 5;
      }
      else
      {
        if (v35) {
          id v6 = @"'permanent-identifier' type not supported by this server";
        }
        else {
          id v6 = @"failed to submit order";
        }
        v75 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v76 = *MEMORY[0x1E4F28760];
        uint64_t v103 = *MEMORY[0x1E4F28568];
        v104 = v6;
        v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        uint64_t v7 = [v75 errorWithDomain:v76 code:-67673 userInfo:v77];
      }
      goto LABEL_66;
    case 5:
      v90 = [v4 objectForKey:@"status"];
      char v88 = [v90 isEqualToString:@"pending"];
      v40 = [v5 objectForKey:@"challenges"];
      uint64_t v41 = [v40 count];
      if (!v41) {
        goto LABEL_70;
      }
      uint64_t v42 = v41;
      uint64_t v43 = 0;
      break;
    case 6:
      v18 = [v4 objectForKey:@"status"];
      if ([v18 isEqualToString:@"invalid"])
      {
        v50 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v51 = *MEMORY[0x1E4F28760];
        id v6 = @"failed to successfully respond to challenge";
        uint64_t v99 = *MEMORY[0x1E4F28568];
        v100 = @"failed to successfully respond to challenge";
        v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        uint64_t v7 = [v50 errorWithDomain:v51 code:-67673 userInfo:v52];

        if (v7) {
          goto LABEL_65;
        }
      }
      else if ([v18 isEqualToString:@"valid"])
      {
        id v6 = 0;
      }
      else
      {
        uint64_t v7 = [(AcmeCertRequest *)self pollForStatus:self->_orderURL until:@"ready"];
        id v6 = 0;
        if (v7) {
          goto LABEL_65;
        }
      }
      objc_storeStrong((id *)&self->_nextMessageURL, self->_finalizeOrderURL);
      uint64_t v7 = 0;
      int64_t v63 = 7;
      goto LABEL_64;
    case 7:
      v18 = [v4 objectForKey:@"status"];
      if ([v18 isEqualToString:@"invalid"])
      {
        v53 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v54 = *MEMORY[0x1E4F28760];
        id v6 = @"failed to finalize order";
        uint64_t v97 = *MEMORY[0x1E4F28568];
        v98 = @"failed to finalize order";
        v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
        uint64_t v7 = [v53 errorWithDomain:v54 code:-67673 userInfo:v55];

        if (v7) {
          goto LABEL_65;
        }
      }
      else if ([v18 isEqualToString:@"valid"])
      {
        id v6 = 0;
      }
      else
      {
        uint64_t v7 = [(AcmeCertRequest *)self pollForStatus:self->_orderURL until:@"valid"];
        id v6 = 0;
        if (v7) {
          goto LABEL_65;
        }
      }
      objc_storeStrong((id *)&self->_nextMessageURL, self->_orderURL);
      uint64_t v7 = 0;
      int64_t v63 = 8;
      goto LABEL_64;
    case 8:
      v56 = [v4 objectForKey:@"certificate"];
      certificateURL = self->_certificateURL;
      self->_certificateURL = v56;

      v18 = [v5 objectForKey:@"status"];
      char v58 = [v18 isEqualToString:@"valid"];
      v59 = self->_certificateURL;
      if (v59 && (v58 & 1) != 0)
      {
        id v6 = 0;
      }
      else
      {
        id v6 = [NSString stringWithFormat:@"order status is \"%@\", not yet \"valid\"", v18];
        v69 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v70 = *MEMORY[0x1E4F28760];
        uint64_t v95 = *MEMORY[0x1E4F28568];
        v96 = v6;
        v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        uint64_t v7 = [v69 errorWithDomain:v70 code:-67673 userInfo:v71];

        if (v7) {
          goto LABEL_65;
        }
        v59 = self->_certificateURL;
      }
      objc_storeStrong((id *)&self->_nextMessageURL, v59);
      uint64_t v7 = 0;
      int64_t v63 = 9;
      goto LABEL_64;
    case 9:
      v18 = [v4 objectForKey:@"certificate"];
      NSLog(&cfstr_GotCertificate.isa, v18);
      v61 = (__SecCertificate *)SecCertificateCreateWithPEM(v60, (CFDataRef)v18);
      self->_certificate = v61;
      if (v61)
      {
        id v6 = 0;
      }
      else
      {
        v78 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v79 = *MEMORY[0x1E4F28760];
        id v6 = @"failed to obtain certificate";
        uint64_t v93 = *MEMORY[0x1E4F28568];
        v94 = @"failed to obtain certificate";
        v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        uint64_t v7 = [v78 errorWithDomain:v79 code:-67673 userInfo:v80];

        if (v7) {
          goto LABEL_65;
        }
      }
      nextMessageURL = self->_nextMessageURL;
      self->_nextMessageURL = 0;

      uint64_t v7 = 0;
      int64_t v63 = 10;
LABEL_64:
      self->_int64_t state = v63;
LABEL_65:

      goto LABEL_66;
    case 0xALL:
      goto LABEL_66;
    default:
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28760];
      id v6 = @"unknown or uninitialized ACME state";
      uint64_t v91 = *MEMORY[0x1E4F28568];
      v92 = @"unknown or uninitialized ACME state";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
      v19 = v16;
      uint64_t v20 = v17;
      uint64_t v21 = -909;
      goto LABEL_48;
  }
  while (1)
  {
    v44 = [v40 objectAtIndex:v43];
    v45 = [v44 objectForKey:@"type"];
    v46 = [v44 objectForKey:@"url"];
    challengeURL = self->_challengeURL;
    self->_challengeURL = v46;

    v48 = [v44 objectForKey:@"token"];
    token = self->_token;
    self->_token = v48;

    if ([v45 isEqualToString:@"device-attest-01"])
    {
      if (self->_challengeURL && self->_token) {
        break;
      }
    }

    if (v42 == ++v43) {
      goto LABEL_70;
    }
  }

LABEL_70:
  v82 = self->_challengeURL;
  if (!v82) {
    goto LABEL_75;
  }
  char v83 = v88;
  if (!self->_token) {
    char v83 = 0;
  }
  if (v83)
  {
    objc_storeStrong((id *)&self->_nextMessageURL, v82);
    id v6 = 0;
    uint64_t v7 = 0;
    self->_int64_t state = 6;
  }
  else
  {
LABEL_75:
    v84 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v85 = *MEMORY[0x1E4F28760];
    id v6 = @"failed to request authorization";
    uint64_t v101 = *MEMORY[0x1E4F28568];
    v102 = @"failed to request authorization";
    v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    uint64_t v7 = [v84 errorWithDomain:v85 code:-67673 userInfo:v86];
  }
LABEL_66:

  return v7;
}

- (id)acmeRequest
{
  v64[1] = *MEMORY[0x1E4F143B8];
  CFBooleanRef v3 = [MEMORY[0x1E4F1CA60] dictionary];
  switch(self->_state)
  {
    case 3:
      if (!self->_encoder)
      {
        int64_t v15 = objc_alloc_init(SecJWSEncoder);
        encoder = self->_encoder;
        self->_encoder = v15;
      }
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"termsOfServiceAgreed"];
      uint64_t v17 = self->_encoder;
      nonce = self->_nonce;
      acmeNewAccountURL = self->_acmeNewAccountURL;
      v59 = 0;
      uint64_t v8 = [(SecJWSEncoder *)v17 encodedJWSWithPayload:v3 kid:0 nonce:nonce url:acmeNewAccountURL error:&v59];
      v9 = v59;
      goto LABEL_13;
    case 4:
      uint64_t v20 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"clientIdentifier"];
      if (v20) {
        uint64_t v21 = (__CFString *)v20;
      }
      else {
        uint64_t v21 = @"TEST";
      }
      v62[0] = @"type";
      v62[1] = @"value";
      v63[0] = @"permanent-identifier";
      v63[1] = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
      v64[0] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
      [v3 setObject:v23 forKeyedSubscript:@"identifiers"];

      v24 = self->_encoder;
      account = self->_account;
      uint64_t v26 = self->_nonce;
      nextMessageURL = self->_nextMessageURL;
      id v58 = 0;
      uint64_t v8 = [(SecJWSEncoder *)v24 encodedJWSWithPayload:v3 kid:account nonce:v26 url:nextMessageURL error:&v58];
      int64_t v28 = v58;

      goto LABEL_14;
    case 5:
      __int16 v29 = self->_encoder;
      v30 = self->_account;
      uint64_t v31 = self->_nonce;
      v32 = self->_nextMessageURL;
      v57 = 0;
      uint64_t v8 = [(SecJWSEncoder *)v29 encodedJWSWithPayload:0 kid:v30 nonce:v31 url:v32 error:&v57];
      v9 = v57;
      goto LABEL_13;
    case 6:
      if (!self->_attestationOids)
      {
        v36 = 0;
        goto LABEL_37;
      }
      if (!self->_attestationCRKey
        || (id v56 = 0,
            [(AcmeCertRequest *)self hardwareAttestationWithError:&v56],
            BOOL v35 = (NSData *)objc_claimAutoreleasedReturnValue(),
            v36 = v56,
            attestation = self->_attestation,
            self->_attestation = v35,
            attestation,
            !v36))
      {
        id v55 = 0;
        v38 = [(AcmeCertRequest *)self requestAttestationChainWithError:&v55];
        v36 = v55;
        attestationChain = self->_attestationChain;
        self->_attestationChain = v38;

        if (!v36)
        {
          uint64_t v43 = secLogObjForScope("acme");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            NSUInteger v45 = [(NSArray *)self->_attestationChain count];
            *(_DWORD *)buf = 134217984;
            v61 = v45;
            _os_log_impl(&dword_18B299000, v43, OS_LOG_TYPE_DEFAULT, "attestation request succeeded; got %llu certificates",
              buf,
              0xCu);
          }
          goto LABEL_33;
        }
      }
      v40 = secLogObjForScope("acme");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v36;
        _os_log_impl(&dword_18B299000, v40, OS_LOG_TYPE_DEFAULT, "attestation request failed with error %@", buf, 0xCu);
      }

      uint64_t v41 = [v36 localizedDescription];
      [v3 setObject:v41 forKeyedSubscript:@"error"];

      BOOL requireAttestation = self->_requireAttestation;
      uint64_t v43 = secLogObjForScope("acme");
      BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
      if (!requireAttestation)
      {
        if (v44)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18B299000, v43, OS_LOG_TYPE_DEFAULT, "attestation not explicitly required, ignoring error", buf, 2u);
        }

        uint64_t v43 = v36;
LABEL_33:
        v36 = 0;
        goto LABEL_34;
      }
      if (v44)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B299000, v43, OS_LOG_TYPE_DEFAULT, "attestation explicitly required, cannot continue with ACME", buf, 2u);
      }
LABEL_34:

      v46 = [(AcmeCertRequest *)self attestationObjectWithCertificates:self->_attestationChain];
      if (v46)
      {
        v47 = [(SecJWSEncoder *)self->_encoder base64URLEncodedStringRepresentationWithData:v46];
        [v3 setObject:v47 forKeyedSubscript:@"attObj"];
      }
LABEL_37:
      v48 = self->_encoder;
      v49 = self->_account;
      v50 = self->_nonce;
      uint64_t v51 = self->_nextMessageURL;
      uint64_t v54 = v36;
      uint64_t v8 = [(SecJWSEncoder *)v48 encodedJWSWithPayload:v3 kid:v49 nonce:v50 url:v51 error:&v54];
      int64_t v28 = v54;

LABEL_14:
LABEL_15:
      uint64_t v33 = [(__CFString *)v8 dataUsingEncoding:4];

      return v33;
    case 7:
      id v10 = [(SecJWSEncoder *)self->_encoder base64URLEncodedStringRepresentationWithData:self->_csr];
      [v3 setObject:v10 forKeyedSubscript:@"csr"];

      int64_t v11 = self->_encoder;
      id v12 = self->_account;
      v13 = self->_nonce;
      CFTypeID v14 = self->_nextMessageURL;
      v53 = 0;
      uint64_t v8 = [(SecJWSEncoder *)v11 encodedJWSWithPayload:v3 kid:v12 nonce:v13 url:v14 error:&v53];
      v9 = v53;
      goto LABEL_13;
    case 8:
    case 9:
      id v4 = self->_encoder;
      CFTypeID v5 = self->_account;
      id v6 = self->_nonce;
      uint64_t v7 = self->_nextMessageURL;
      v52 = 0;
      uint64_t v8 = [(SecJWSEncoder *)v4 encodedJWSWithPayload:0 kid:v5 nonce:v6 url:v7 error:&v52];
      v9 = v52;
LABEL_13:
      int64_t v28 = v9;
      goto LABEL_14;
    default:
      uint64_t v8 = @"{}";
      goto LABEL_15;
  }
}

- (id)pollForStatus:(id)a3 until:(id)a4
{
  id v4 = dispatch_semaphore_create(0);
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v4, v5);

  return 0;
}

- (id)sendRequestToXPCService:(id)a3 response:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AcmeCertRequest_sendRequestToXPCService_response___block_invoke;
  block[3] = &unk_1E5484B08;
  block[4] = self;
  id v7 = a3;
  dispatch_sync(queue, block);
  int64_t state = self->_state;
  v9 = "POST";
  if (state == 1) {
    v9 = "GET";
  }
  if (state == 2) {
    id v10 = "HEAD";
  }
  else {
    id v10 = v9;
  }
  xpc_object_t v11 = xpc_string_create(v10);
  id v12 = [(NSString *)self->_nextMessageURL UTF8String];
  if (!v12) {
    id v12 = (const char *)&unk_18B41CA07;
  }
  xpc_object_t v13 = xpc_string_create(v12);
  int64_t v14 = self->_state;
  id v15 = v7;
  v16 = (const void *)[v15 bytes];
  size_t v17 = [v15 length];

  xpc_object_t v18 = xpc_data_create(v16, v17);
  xpc_object_t v50 = v11;
  xpc_object_t v51 = v18;
  int64_t v48 = v14;
  xpc_object_t v49 = v13;
  v19 = xpc_create_with_format();
  xpc_object_t v20 = xpc_connection_send_message_with_reply_sync(self->_connection, v19);
  uint64_t v24 = MEMORY[0x18C12FBB0](v20, v21, v22, v23);
  if (v24 == MEMORY[0x1E4F145A8])
  {
    uint64_t v26 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      string = xpc_dictionary_get_string(v20, (const char *)*MEMORY[0x1E4F14530]);
      *(_DWORD *)buf = 136315138;
      int64_t v63 = string;
      v27 = "message error: %s";
      goto LABEL_15;
    }
LABEL_16:
    __int16 v29 = 0;
    CFErrorRef CFErrorWithXPCObject = 0;
    goto LABEL_17;
  }
  uint64_t v25 = v24;
  if (v24 == MEMORY[0x1E4F14578])
  {
    CFErrorRef CFErrorWithXPCObject = 0;
    __int16 v29 = 0;
    id v31 = 0;
    if (!a4) {
      goto LABEL_23;
    }
LABEL_22:
    id v31 = v29;
    *a4 = v31;
    goto LABEL_23;
  }
  if (v24 != MEMORY[0x1E4F14590])
  {
    uint64_t v26 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v63 = (const char *)v25;
      v27 = "unexpected message reply type %p";
LABEL_15:
      _os_log_impl(&dword_18B299000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  unint64_t v34 = xpc_dictionary_get_value(v20, "AcmeReply");
  uint64_t v26 = v34;
  if (v34) {
    size_t length = xpc_data_get_length(v34);
  }
  else {
    size_t length = 0;
  }
  BOOL v35 = xpc_dictionary_get_value(v20, "AcmeError");
  xpc_dictionary_get_value(v20, "AcmeStatus");
  xpc_object_t xint = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  v36 = xpc_dictionary_get_value(v20, "AcmeNonce");
  xpc_dictionary_get_value(v20, "AcmeLocation");
  xpc_object_t v57 = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  xpc_object_t xstring = v36;
  if (v36)
  {
    string_ptr = xpc_string_get_string_ptr(v36);
    v38 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", string_ptr, xpc_string_get_length(xstring), 4, v48, v13, v11, v18);
    if ([v38 length]) {
      objc_storeStrong((id *)&self->_nonce, v38);
    }
  }
  if (v57)
  {
    int v39 = xpc_string_get_string_ptr(v57);
    v40 = (void *)[[NSString alloc] initWithBytes:v39 length:xpc_string_get_length(v57) encoding:4];
    if ([v40 length]) {
      objc_storeStrong((id *)&self->_location, v40);
    }
  }
  if (v35) {
    CFErrorRef CFErrorWithXPCObject = SecCreateCFErrorWithXPCObject(v35);
  }
  else {
    CFErrorRef CFErrorWithXPCObject = 0;
  }
  if (xint) {
    int64_t value = xpc_int64_get_value(xint);
  }
  else {
    int64_t value = 0;
  }
  if (-[AcmeCertRequest errorStatusWithHTTPErrorCode:](self, "errorStatusWithHTTPErrorCode:", value, v48, v49, v50, v51))
  {
    __int16 v29 = 0;
  }
  else
  {
    if (v26) {
      bytes_ptr = xpc_data_get_bytes_ptr(v26);
    }
    else {
      bytes_ptr = &unk_18B41CA07;
    }
    uint64_t v43 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes_ptr length:length];
    if (self->_state == 9)
    {
      int v60 = @"certificate";
      uint64_t v61 = v43;
      BOOL v44 = (void *)v43;
      uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      v46 = v44;
      __int16 v29 = (void *)v45;
    }
    else
    {
      CFErrorRef v58 = CFErrorWithXPCObject;
      v52 = (void *)v43;
      __int16 v29 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v43 options:0 error:&v58];
      uint64_t v54 = v58;

      if (v54)
      {
        v47 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v63 = (const char *)v54;
          _os_log_impl(&dword_18B299000, v47, OS_LOG_TYPE_DEFAULT, "error converting json to dictionary: %@", buf, 0xCu);
        }

        v46 = v52;
        CFErrorRef CFErrorWithXPCObject = v54;
      }
      else
      {
        CFErrorRef CFErrorWithXPCObject = 0;
        v46 = v52;
      }
    }
  }
LABEL_17:

  if (a4) {
    goto LABEL_22;
  }
  if (v29) {

  }
  id v31 = 0;
LABEL_23:

  v32 = CFErrorWithXPCObject;
  return v32;
}

void __52__AcmeCertRequest_sendRequestToXPCService_response___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 224))
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.security.XPCAcmeService", 0);
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_time_t v5 = *(void **)(v4 + 224);
    *(void *)(v4 + 224) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 232))
  {
    xpc_connection_t v6 = xpc_connection_create("com.apple.security.XPCAcmeService", *(dispatch_queue_t *)(v2 + 224));
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 232);
    *(void *)(v7 + 232) = v6;

    xpc_connection_set_event_handler(*(xpc_connection_t *)(*(void *)(a1 + 32) + 232), &__block_literal_global_186);
    v9 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 232);
    xpc_connection_resume(v9);
  }
}

void __52__AcmeCertRequest_sendRequestToXPCService_response___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = MEMORY[0x18C12FBB0]();
  uint64_t v4 = MEMORY[0x1E4F145A8];
  dispatch_time_t v5 = secLogObjForScope("SecError");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v6)
    {
      string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E4F14530]);
      int v9 = 136315138;
      id v10 = string;
      uint64_t v7 = "connection error: %s";
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    int v9 = 134217984;
    id v10 = (const char *)v2;
    uint64_t v7 = "unexpected connection event %p";
LABEL_6:
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
  }
}

- (int)errorStatusWithHTTPErrorCode:(int)a3
{
  if (a3 > 399)
  {
    if ((a3 - 400) > 0x11) {
      goto LABEL_11;
    }
    if (((1 << (a3 + 112)) & 0x2021A) == 0)
    {
      if (a3 == 400) {
        return -67847;
      }
LABEL_11:
      if ((a3 - 500) <= 7 && ((1 << (a3 + 12)) & 0x89) != 0) {
        return -67585;
      }
      return a3;
    }
    return -67585;
  }
  int result = 0;
  if ((a3 - 200) >= 2 && a3 != 100)
  {
    if (a3 != 204) {
      return a3;
    }
    return -67585;
  }
  return result;
}

- (id)attestationChainPEMRepresentation
{
  if (self->_attestationChain)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
    NSUInteger v4 = [(NSArray *)self->_attestationChain count];
    if (v4)
    {
      NSUInteger v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(NSArray *)self->_attestationChain objectAtIndex:i];
        if (v7)
        {
          CFStringRef v8 = SecCertificateCopyPEMRepresentation((uint64_t)v7);
          if (v8)
          {
            CFStringRef v9 = v8;
            [v3 appendString:v8];
            CFRelease(v9);
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)createCertificate
{
  v12[1] = *MEMORY[0x1E4F143B8];
  SelfSignedCertificateWithError = (__SecCertificate *)SecGenerateSelfSignedCertificateWithError((const __CFArray *)self->_subject, (const __CFDictionary *)self->_parameters, v2, self->_privateKey, 0);
  NSUInteger v5 = 0;
  self->_certificate = SelfSignedCertificateWithError;
  if (!SelfSignedCertificateWithError)
  {
    BOOL v6 = [NSString stringWithFormat:@"failed to create certificate (bad input values)"];
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28760];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = v6;
    CFStringRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    NSUInteger v5 = [v7 errorWithDomain:v8 code:-67838 userInfo:v9];
  }

  return v5;
}

- (id)hardwareAttestationWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  attestation = self->_attestation;
  if (attestation)
  {
    self->_attestation = 0;
  }
  attestationCRKey = self->_attestationCRKey;
  if (attestationCRKey && (privateKey = self->_privateKey) != 0)
  {
    SecKeyCreateAttestation((uint64_t)attestationCRKey, (uint64_t)privateKey, (__CFString **)&v23);
    uint64_t v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    CFStringRef v9 = self->_attestation;
    self->_attestation = v8;

    id v10 = v23;
    BOOL v11 = v23 != 0;
  }
  else
  {
    id v12 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_attestationCRKey) {
        xpc_object_t v13 = @"_privateKey";
      }
      else {
        xpc_object_t v13 = @"_attestationCRKey";
      }
      *(_DWORD *)buf = 138412290;
      v27 = v13;
      _os_log_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEFAULT, "missing %@ for attestation", buf, 0xCu);
    }

    id v14 = [(NSDictionary *)self->_parameters objectForKey:@"acmeLocalIssuer"];
    BOOL v11 = 0;
    id v10 = 0;
    if (!self->_permitLocalIssuer && v14)
    {
      CFTypeID v15 = CFGetTypeID(v14);
      if (v15 == CFBooleanGetTypeID() && *MEMORY[0x1E4F1CFD0]) {
        CFEqual(v14, (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
      }
      id v10 = 0;
      BOOL v11 = 0;
    }
  }
  if (!self->_attestation && !v11)
  {
    v16 = [NSString stringWithFormat:@"failed to create attestation"];
    size_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28760];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    uint64_t v25 = v16;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    xpc_object_t v20 = [v17 errorWithDomain:v18 code:-50 userInfo:v19];

    id v23 = v20;
    id v10 = v23;
  }
  if (a3)
  {
    *a3 = v10;
  }
  else if (v10)
  {
    id v23 = 0;
    CFRelease(v10);
  }
  uint64_t v21 = self->_attestation;

  return v21;
}

- (id)attestationObjectWithCertificates:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)MEMORY[0x18C12E850]();
  BOOL v6 = objc_alloc_init(SecCBORArray);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count] == 2 && objc_msgSend(v4, "count"))
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [v4 objectAtIndexedSubscript:v7];
      if (v8)
      {
        CFStringRef v9 = (void *)v8;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        CFTypeID v10 = CFGetTypeID(v9);
        if (v10 != SecCertificateGetTypeID()) {
          goto LABEL_10;
        }
        CFDataRef v11 = SecCertificateCopyData((SecCertificateRef)v9);

        CFStringRef v9 = v11;
        if (v11) {
          break;
        }
      }
LABEL_11:
      if (++v7 >= (unint64_t)[v4 count]) {
        goto LABEL_12;
      }
    }
    id v12 = [[SecCBORData alloc] initWith:v9];
    [(SecCBORArray *)v6 addObject:v12];

LABEL_10:
    goto LABEL_11;
  }
LABEL_12:
  xpc_object_t v13 = objc_alloc_init(SecCBORMap);
  id v14 = [[SecCBORString alloc] initWith:@"x5c"];
  [(SecCBORMap *)v13 setKey:v14 value:v6];

  CFTypeID v15 = objc_alloc_init(SecCBORMap);
  v16 = [[SecCBORString alloc] initWith:@"fmt"];
  size_t v17 = [[SecCBORString alloc] initWith:@"apple"];
  [(SecCBORMap *)v15 setKey:v16 value:v17];

  uint64_t v18 = [[SecCBORString alloc] initWith:@"attStmt"];
  [(SecCBORMap *)v15 setKey:v18 value:v13];

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [(SecCBORMap *)v15 write:v19];
  xpc_object_t v20 = (void *)[v19 copy];

  if (v20 && self->_logAcmeCSR)
  {
    uint64_t v21 = [NSString stringWithFormat:@"/tmp/AcmeAtt_%@", self->_timestamp];
    uint64_t v22 = [(SecJWSEncoder *)self->_encoder base64URLEncodedStringRepresentationWithData:v20];
    id v23 = [v22 dataUsingEncoding:4];

    [v23 writeToFile:v21 atomically:1];
  }

  return v20;
}

- (id)requestAttestationChainWithError:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  xpc_object_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  xpc_object_t v51 = __Block_byref_object_copy__15168;
  v52 = __Block_byref_object_dispose__15169;
  id v53 = 0;
  if (![(AcmeCertRequest *)self deviceAttestationSupported])
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-67849 userInfo:0];
    }
    id v26 = (id)v49[5];
    goto LABEL_58;
  }
  CFAbsoluteTimeGetCurrent();
  if (requestAttestationChainWithError__onceToken != -1) {
    dispatch_once(&requestAttestationChainWithError__onceToken, &__block_literal_global_143);
  }
  id v36 = [(NSString *)self->_token dataUsingEncoding:4];
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  [v4 setObject:&unk_1ED86CD08 forKeyedSubscript:@"Validity"];
  [v4 setObject:self->_attestationOids forKeyedSubscript:@"OIDSToInclude"];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"UseXPC"];
  v37 = v4;
  if (v36)
  {
    long long md = 0u;
    long long v57 = 0u;
    id v5 = v36;
    CC_SHA256((const void *)[v5 bytes], objc_msgSend(v5, "length"), (unsigned __int8 *)&md);
    BOOL v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&md length:32];
    [v37 setObject:v6 forKeyedSubscript:@"nonce"];

    id v4 = v37;
  }
  attestation = self->_attestation;
  if (attestation) {
    [v4 setObject:attestation forKeyedSubscript:@"ClientAttestationData"];
  }
  attestationCRKey = self->_attestationCRKey;
  if (!attestationCRKey) {
    goto LABEL_13;
  }
  CFStringRef v9 = SecKeyCopyPublicKey(attestationCRKey);
  CFTypeID v10 = v9;
  if (!v9)
  {
    v27 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(md) = 0;
      _os_log_impl(&dword_18B299000, v27, OS_LOG_TYPE_DEFAULT, "Failed to obtain public key for attestation key, skipping attestation", (uint8_t *)&md, 2u);
    }

    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-67811 userInfo:0];
      id v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    }
    goto LABEL_56;
  }
  *(void *)&long long md = 0;
  CFDataRef v11 = SecKeyCopyExternalRepresentation(v9, (CFErrorRef *)&md);
  CFRelease(v10);
  if ((void)md || !v11)
  {
    v30 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B299000, v30, OS_LOG_TYPE_DEFAULT, "Failed to copy public key data for co-residency, skipping attestation", buf, 2u);
    }

    id v31 = (const void *)md;
    if (a3)
    {
      *a3 = (id)md;
    }
    else if ((void)md)
    {
      *(void *)&long long md = 0;
      CFRelease(v31);
    }

LABEL_56:
    id v26 = 0;
    goto LABEL_57;
  }
  [v37 setObject:v11 forKeyedSubscript:@"ClientAttestationPublicKey"];

  id v4 = v37;
LABEL_13:
  if (self->_attestationCRChain)
  {
    id v12 = [MEMORY[0x1E4F1CA58] data];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    xpc_object_t v13 = self->_attestationCRChain;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v44 objects:v60 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v13);
          }
          CFDataRef v17 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v44 + 1) + 8 * i));
          [v12 appendData:v17];
        }
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v44 objects:v60 count:16];
      }
      while (v14);
    }

    [v37 setObject:v12 forKeyedSubscript:@"ClientDirectAttestationCertificate"];
    id v4 = v37;
  }
  int v39 = (void *)[v4 copy];
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  *(void *)&long long md = 0;
  *((void *)&md + 1) = &md;
  *(void *)&long long v57 = 0x3032000000;
  *((void *)&v57 + 1) = __Block_byref_object_copy__15168;
  CFErrorRef v58 = __Block_byref_object_dispose__15169;
  id v59 = 0;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  for (int j = 2; j != -1; --j)
  {
    uint64_t v21 = (void (*)(__SecKey *, void *, void *))requestAttestationChainWithError__soft_AppAttest_DeviceAttestation_AttestKey;
    privateKey = self->_privateKey;
    v40[0] = v19;
    v40[1] = 3221225472;
    v40[2] = __52__AcmeCertRequest_requestAttestationChainWithError___block_invoke_148;
    v40[3] = &unk_1E5484AC0;
    p_long long md = &md;
    uint64_t v43 = &v48;
    id v23 = v18;
    uint64_t v41 = v23;
    v21(privateKey, v39, v40);
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    if (v49[5])
    {
      uint64_t v28 = secLogObjForScope("acme");
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
LABEL_48:

        uint64_t v25 = v41;
        goto LABEL_49;
      }
      *(_WORD *)buf = 0;
      __int16 v29 = "Successfully retrieved attestation certificate";
LABEL_47:
      _os_log_impl(&dword_18B299000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
      goto LABEL_48;
    }
    if ([*(id *)(*((void *)&md + 1) + 40) code] != -67671)
    {
      v32 = secLogObjForScope("acme");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = [*(id *)(*((void *)&md + 1) + 40) code];
        *(_DWORD *)buf = 134217984;
        uint64_t v55 = v33;
        _os_log_impl(&dword_18B299000, v32, OS_LOG_TYPE_DEFAULT, "Attempt to fetch attestation certificate failed (error %lld)", buf, 0xCu);
      }

      uint64_t v28 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_48;
      }
      *(_WORD *)buf = 0;
      __int16 v29 = "Failed to fetch attestation certificate, not retrying";
      goto LABEL_47;
    }
    uint64_t v24 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v55) = j;
      _os_log_impl(&dword_18B299000, v24, OS_LOG_TYPE_DEFAULT, "Failed to fetch attestation certificate, %u retries left", buf, 8u);
    }
  }
  uint64_t v25 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "Out of retries retrieving attestation certificate", buf, 2u);
  }
LABEL_49:

  unint64_t v34 = *(void **)(*((void *)&md + 1) + 40);
  if (a3)
  {
    *a3 = v34;
  }
  else
  {
    *(void *)(*((void *)&md + 1) + 40) = 0;
  }
  id v26 = (id)v49[5];
  _Block_object_dispose(&md, 8);

LABEL_57:
LABEL_58:
  _Block_object_dispose(&v48, 8);

  return v26;
}

void __52__AcmeCertRequest_requestAttestationChainWithError___block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  if (v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v5;
LABEL_3:
    CFTypeID v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
    goto LABEL_8;
  }
  if (v13 && [v13 count] == 2)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v13;
    goto LABEL_3;
  }
  uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-67671 userInfo:0];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  CFTypeID v10 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
LABEL_8:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __52__AcmeCertRequest_requestAttestationChainWithError___block_invoke()
{
}

- (BOOL)deviceAttestationSupported
{
  if (deviceAttestationSupported_onceToken != -1) {
    dispatch_once(&deviceAttestationSupported_onceToken, &__block_literal_global_15182);
  }
  return deviceAttestationSupported_appAttestSupported;
}

uint64_t __45__AcmeCertRequest_deviceAttestationSupported__block_invoke()
{
  v1 = 0;
  _getAppAttestInternalSymbol(&v1, "AppAttest_DeviceAttestation_IsSupported");
  uint64_t result = v1();
  deviceAttestationSupported_appAttestSupported = result;
  return result;
}

- (id)createCSR
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  CFTypeID v10 = __Block_byref_object_copy__15168;
  uint64_t v11 = __Block_byref_object_dispose__15169;
  id v12 = 0;
  uint64_t v3 = [(AcmeCertRequest *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__AcmeCertRequest_createCSR__block_invoke;
  v6[3] = &unk_1E54849D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __28__AcmeCertRequest_createCSR__block_invoke(uint64_t a1)
{
  CFDataRef CertificateRequest = SecGenerateCertificateRequest(*(const __CFArray **)(*(void *)(a1 + 32) + 32), *(const __CFDictionary **)(*(void *)(a1 + 32) + 40), *(void **)(*(void *)(a1 + 32) + 248), *(__SecKey **)(*(void *)(a1 + 32) + 256));
  uint64_t v3 = *(void *)(a1 + 32);
  CFDataRef v10 = CertificateRequest;
  if (*(unsigned char *)(v3 + 8))
  {
    id v4 = [NSString stringWithFormat:@"/tmp/AcmeCsr_%@", *(void *)(v3 + 136)];
    [(__CFData *)v10 writeToFile:v4 atomically:1];

    CFDataRef v5 = v10;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    CFDataRef v5 = CertificateRequest;
  }
  objc_storeStrong((id *)(v3 + 96), v5);
  CFDataRef v6 = v10;
  if (!v10)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-67838 userInfo:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    CFDataRef v6 = 0;
  }
}

- (id)createKeyPair
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(AcmeCertRequest *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__AcmeCertRequest_createKeyPair__block_invoke;
  v6[3] = &unk_1E54849D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __32__AcmeCertRequest_createKeyPair__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(const void **)(v2 + 256);
  if (v3)
  {
    *(void *)(v2 + 256) = 0;
    CFRelease(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v4 = *(const void **)(v2 + 248);
  if (v4)
  {
    *(void *)(v2 + 248) = 0;
    CFRelease(v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(*(void *)(a1 + 32) + 256) = SecKeyCreateRandomKey(*(CFDictionaryRef *)(v2 + 48), (CFErrorRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  CFDataRef v5 = *(__SecKey **)(*(void *)(a1 + 32) + 256);
  if (!v5
    || (*(void *)(*(void *)(a1 + 32) + 248) = SecKeyCopyPublicKey(v5),
        uint64_t v6 = *(void *)(a1 + 32),
        !*(void *)(v6 + 256))
    || !*(void *)(v6 + 248))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-26275 userInfo:0];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(const void **)(v8 + 256);
    if (v9)
    {
      *(void *)(v8 + 256) = 0;
      CFRelease(v9);
      uint64_t v8 = *(void *)(a1 + 32);
    }
    uint64_t v10 = *(const void **)(v8 + 248);
    if (v10)
    {
      *(void *)(v8 + 248) = 0;
      CFRelease(v10);
    }
  }
}

- (id)sanitizeParameters
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__15168;
  uint64_t v14 = __Block_byref_object_dispose__15169;
  id v15 = 0;
  uint64_t v3 = [(AcmeCertRequest *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__AcmeCertRequest_sanitizeParameters__block_invoke;
  v9[3] = &unk_1E54849D8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v3, v9);

  id v4 = (void *)v11[5];
  if (!v4)
  {
    uint64_t v5 = [(AcmeCertRequest *)self sanitizeSubject];
    uint64_t v6 = (void *)v11[5];
    v11[5] = v5;

    id v4 = (void *)v11[5];
  }
  id v7 = v4;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __37__AcmeCertRequest_sanitizeParameters__block_invoke(uint64_t a1)
{
  v86[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  id v4 = [*(id *)(a1 + 32) parameters];
  [v2 setDictionary:v4];

  uint64_t v5 = (const void *)[v2 objectForKey:@"hardwareBound"];
  uint64_t v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFBooleanGetTypeID())
    {
      uint64_t v11 = "kSecUseHardwareBoundKey";
      goto LABEL_86;
    }
    if (*MEMORY[0x1E4F1CFD0] && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
      [v3 setObject:@"com.apple.setoken" forKeyedSubscript:@"tkid"];
    }
  }
  uint64_t v8 = [v2 objectForKey:@"type"];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = "kSecAttrKeyType";
    }
    [v3 setObject:v9 forKeyedSubscript:@"type"];

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_86;
    }
  }
  else
  {
    uint64_t v12 = (const void *)*MEMORY[0x1E4F1CFD0];
    if (v6 && v12) {
      BOOL v13 = CFEqual(v6, v12) != 0;
    }
    else {
      BOOL v13 = v6 == v12;
    }
    if (v13) {
      uint64_t v14 = @"73";
    }
    else {
      uint64_t v14 = @"42";
    }
    id v15 = v14;
    [v3 setObject:v15 forKeyedSubscript:@"type"];
  }
  uint64_t v16 = [v2 objectForKey:@"bsiz"];
  if (v16)
  {
    CFDataRef v17 = (void *)v16;
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();
    if (v18) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = "kSecAttrKeySizeInBits";
    }
    [v3 setObject:v17 forKeyedSubscript:@"bsiz"];

    if ((v18 & 1) == 0) {
      goto LABEL_86;
    }
    goto LABEL_36;
  }
  uint64_t v19 = [v2 objectForKey:@"type"];
  xpc_object_t v20 = (const void *)*MEMORY[0x1E4F1CFD0];
  if (!v6 || !v20)
  {
    if (v6 != v20) {
      goto LABEL_32;
    }
LABEL_34:
    uint64_t v21 = &unk_1ED86CCC0;
    goto LABEL_35;
  }
  if (CFEqual(v6, v20)) {
    goto LABEL_34;
  }
LABEL_32:
  if (([v19 isEqualToString:@"42"] & 1) == 0) {
    goto LABEL_34;
  }
  uint64_t v21 = &unk_1ED86CCD8;
LABEL_35:

  [v3 setObject:v21 forKeyedSubscript:@"bsiz"];
LABEL_36:
  uint64_t v22 = [v2 objectForKey:@"private"];
  if (v22)
  {
    id v23 = (void *)v22;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v3 setObject:v23 forKeyedSubscript:@"private"];

      uint64_t v11 = "kSecPrivateKeyAttrs";
      goto LABEL_86;
    }
    if (!v6 || (CFTypeID v24 = CFGetTypeID(v6), v24 != CFBooleanGetTypeID()))
    {
      [v3 setObject:v23 forKeyedSubscript:@"private"];
      uint64_t v25 = [v23 objectForKey:@"labl"];
      if (v25) {
        [v3 setObject:v25 forKeyedSubscript:@"labl"];
      }
      id v26 = [v23 objectForKey:@"atag"];
      if (v26) {
        [v3 setObject:v26 forKeyedSubscript:@"atag"];
      }
      uint64_t v27 = [v23 objectForKey:@"perm"];
      if (v27) {
        [v3 setObject:v27 forKeyedSubscript:@"perm"];
      }
      uint64_t v28 = [v23 objectForKey:@"extr"];
      if (v28) {
        [v3 setObject:v28 forKeyedSubscript:@"extr"];
      }
      uint64_t v29 = [v23 objectForKey:@"sens"];
      if (v29) {
        [v3 setObject:v29 forKeyedSubscript:@"sens"];
      }
      uint64_t v30 = [v23 objectForKey:@"nleg"];
      if (v30) {
        [v3 setObject:v30 forKeyedSubscript:@"nleg"];
      }
      uint64_t v31 = [v23 objectForKey:@"accc"];
      if (v31) {
        [v3 setObject:v31 forKeyedSubscript:@"accc"];
      }
    }
    [v3 setObject:v23 forKeyedSubscript:@"private"];
  }
  v32 = [v2 objectForKey:@"labl"];
  if (v32)
  {
    objc_opt_class();
    char v33 = objc_opt_isKindOfClass();
    [v3 setObject:v32 forKeyedSubscript:@"labl"];
    if ((v33 & 1) == 0)
    {

      uint64_t v11 = "kSecAttrLabel";
      goto LABEL_86;
    }
  }

  unint64_t v34 = [v2 objectForKey:@"atag"];
  if (v34)
  {
    objc_opt_class();
    char v35 = objc_opt_isKindOfClass();
    [v3 setObject:v34 forKeyedSubscript:@"atag"];
    if ((v35 & 1) == 0)
    {

      uint64_t v11 = "kSecAttrApplicationTag";
      goto LABEL_86;
    }
  }

  id v36 = (const void *)[v2 objectForKey:@"perm"];
  if (v36)
  {
    v37 = v36;
    CFTypeID v38 = CFGetTypeID(v36);
    CFTypeID TypeID = CFBooleanGetTypeID();
    [v3 setObject:v37 forKeyedSubscript:@"perm"];
    if (v38 != TypeID)
    {
      uint64_t v11 = "kSecAttrIsPermanent";
      goto LABEL_86;
    }
  }
  v40 = (const void *)[v2 objectForKey:@"extr"];
  if (v40)
  {
    uint64_t v41 = v40;
    CFTypeID v42 = CFGetTypeID(v40);
    CFTypeID v43 = CFBooleanGetTypeID();
    [v3 setObject:v41 forKeyedSubscript:@"extr"];
    if (v42 != v43)
    {
      uint64_t v11 = "kSecAttrIsExtractable";
      goto LABEL_86;
    }
  }
  long long v44 = (const void *)[v2 objectForKey:@"sens"];
  if (v44)
  {
    long long v45 = v44;
    CFTypeID v46 = CFGetTypeID(v44);
    CFTypeID v47 = CFBooleanGetTypeID();
    [v3 setObject:v45 forKeyedSubscript:@"sens"];
    if (v46 != v47)
    {
      uint64_t v11 = "kSecAttrIsSensitive";
      goto LABEL_86;
    }
  }
  uint64_t v48 = (const void *)[v2 objectForKey:@"nleg"];
  if (v48)
  {
    xpc_object_t v49 = v48;
    CFTypeID v50 = CFGetTypeID(v48);
    CFTypeID v51 = CFBooleanGetTypeID();
    [v3 setObject:v49 forKeyedSubscript:@"nleg"];
    if (v50 != v51)
    {
      uint64_t v11 = "kSecUseDataProtectionKeychain";
      goto LABEL_86;
    }
  }
  v52 = (const void *)[v2 objectForKey:@"accc"];
  if (v52)
  {
    id v53 = v52;
    CFTypeID v54 = CFGetTypeID(v52);
    CFTypeID v55 = SecAccessControlGetTypeID();
    [v3 setObject:v53 forKeyedSubscript:@"accc"];
    if (v54 != v55)
    {
      uint64_t v11 = "kSecAttrAccessControl";
      goto LABEL_86;
    }
  }
  id v56 = [v2 objectForKey:@"clientIdentifier"];
  if (!v56 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v11 = "kSecClientIdentifier";
    goto LABEL_86;
  }

  long long v57 = [v2 objectForKey:@"certificateLifetime"];
  if (v57)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCertificateLifetime";
      goto LABEL_86;
    }
  }

  CFErrorRef v58 = [v2 objectForKey:@"certificateSerial"];
  if (v58)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCertificateSerialNumber";
      goto LABEL_86;
    }
  }
  else
  {
    v66 = [*(id *)(a1 + 32) serialNumber];
    [v2 setObject:v66 forKeyedSubscript:@"certificateSerial"];
  }
  uint64_t v67 = [v2 objectForKey:@"keyUsage"];
  if (v67)
  {
    v68 = (void *)v67;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCertificateKeyUsage";
      goto LABEL_86;
    }
  }
  else
  {
    v68 = &unk_1ED86CCF0;
    [v2 setObject:&unk_1ED86CCF0 forKeyedSubscript:@"keyUsage"];
  }

  uint64_t v69 = [v2 objectForKey:@"certificateEKUs"];
  if (v69)
  {
    uint64_t v70 = (void *)v69;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCertificateExtendedKeyUsage";
      goto LABEL_86;
    }
  }
  else
  {
    v86[0] = @"1.3.6.1.5.5.7.3.2";
    uint64_t v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:1];
    [v2 setObject:v70 forKeyedSubscript:@"certificateEKUs"];
  }

  uint64_t v71 = [v2 objectForKey:kSecCMSSignHashAlgorithm];
  if (v71)
  {
    id v72 = (id)v71;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v11 = "kSecCMSSignHashAlgorithm";
      goto LABEL_86;
    }
  }
  else
  {
    id v72 = (id)kSecCMSHashingAlgorithmSHA256;
    [v2 setObject:v72 forKeyedSubscript:kSecCMSSignHashAlgorithm];
  }

  uint64_t v73 = [v2 objectForKey:@"subjectAltName"];
  if (v73 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v11 = "kSecSubjectAltName";
  }
  else
  {

    v74 = [v2 objectForKey:@"acmeDirectory"];
    if (v74 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      uint64_t v11 = "kSecACMEDirectoryURL";
    }
    else
    {

      v75 = (const void *)[v2 objectForKey:@"attestationIdentity"];
      if (v75 && (CFTypeID v76 = CFGetTypeID(v75), v76 != SecIdentityGetTypeID()))
      {
        uint64_t v11 = "kSecAttestationIdentity";
      }
      else
      {
        v77 = [v2 objectForKey:@"attestationOids"];
        if (v77)
        {
          objc_opt_class();
          char v78 = objc_opt_isKindOfClass();
          if (v78) {
            uint64_t v11 = 0;
          }
          else {
            uint64_t v11 = "kSecAttestationOids";
          }
        }
        else
        {
          uint64_t v11 = 0;
          char v78 = 1;
        }
        [*(id *)(a1 + 32) setAttestationOids:v77];

        if (v78)
        {
          uint64_t v79 = (const void *)[v2 objectForKey:@"attestationKey"];
          v80 = v79;
          if (v79 && (CFTypeID v81 = CFGetTypeID(v79), v81 != SecKeyGetTypeID()))
          {
            [*(id *)(a1 + 32) setAttestationCRKey:v80];
            uint64_t v11 = "kSecAttestationKey";
          }
          else
          {
            [*(id *)(a1 + 32) setAttestationCRKey:v80];
            v82 = [v2 objectForKey:@"attestationChain"];
            if (v82)
            {
              objc_opt_class();
              char v83 = objc_opt_isKindOfClass();
              if (v83) {
                uint64_t v11 = 0;
              }
              else {
                uint64_t v11 = "kSecAttestationChain";
              }
            }
            else
            {
              uint64_t v11 = 0;
              char v83 = 1;
            }
            [*(id *)(a1 + 32) setAttestationCRChain:v82];

            if (v83)
            {
              [*(id *)(a1 + 32) setParameters:v2];
              [*(id *)(a1 + 32) setKeyParams:v3];
              goto LABEL_87;
            }
          }
        }
      }
    }
  }
LABEL_86:
  id v59 = objc_msgSend(NSString, "stringWithFormat:", @"SecRequestClientIdentity parameters dictionary has missing value or wrong type for %s key", v11);
  int v60 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v61 = *MEMORY[0x1E4F28760];
  uint64_t v84 = *MEMORY[0x1E4F28568];
  uint64_t v85 = v59;
  v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
  uint64_t v63 = [v60 errorWithDomain:v61 code:-50 userInfo:v62];
  uint64_t v64 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v65 = *(void **)(v64 + 40);
  *(void *)(v64 + 40) = v63;

LABEL_87:
}

- (id)sanitizeSubject
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__15168;
  uint64_t v11 = __Block_byref_object_dispose__15169;
  id v12 = 0;
  uint64_t v3 = [(AcmeCertRequest *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__AcmeCertRequest_sanitizeSubject__block_invoke;
  v6[3] = &unk_1E54849D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__AcmeCertRequest_sanitizeSubject__block_invoke(uint64_t a1)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    unint64_t v3 = 0;
LABEL_6:
    id v4 = "unknown";
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v3 = 0;
    LODWORD(v2) = 0;
    goto LABEL_6;
  }
  unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  id v4 = 0;
  LODWORD(v2) = 1;
LABEL_7:
  uint64_t v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  if (v3 && v2)
  {
    unint64_t v5 = 1;
    while (1)
    {
      uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) objectAtIndex:v5 - 1];
      if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(NSString, "stringWithFormat:", @"index %lu", v5 - 1);
        id v12 = objc_claimAutoreleasedReturnValue();
        [v12 UTF8String];

        uint64_t v7 = 0;
LABEL_22:
        objc_msgSend(NSString, "stringWithFormat:", @"index %lu", v5 - 1);
        uint64_t v8 = (__CFString *) objc_claimAutoreleasedReturnValue();
        id v4 = (const char *)[(__CFString *)v8 UTF8String];
        goto LABEL_23;
      }
      uint64_t v7 = [v6 objectAtIndex:0];
      if (!v7) {
        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v8 = [v7 objectAtIndex:0];
      uint64_t v9 = [v7 objectAtIndex:1];
      if (v8
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && v9
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v26 = v9;
        uint64_t v10 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@".0123456789"];
        id v11 = [v10 invertedSet];

        if ([(__CFString *)v8 rangeOfCharacterFromSet:v11] == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_30;
        }
        if ([(__CFString *)v8 isEqualToString:@"EMAIL"])
        {

          uint64_t v8 = @"1.2.840.113549.1.9.1";
LABEL_30:
          uint64_t v9 = v26;

LABEL_31:
          v30[0] = v8;
          v30[1] = v9;
          [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
          uint64_t v14 = v13 = v9;
          v31[0] = v14;
          id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

          uint64_t v9 = v13;
          [v27 addObject:v15];

          id v4 = 0;
          goto LABEL_32;
        }
        if ([&unk_1ED86CBD0 containsObject:v8]) {
          goto LABEL_30;
        }
        id v16 = [NSString stringWithFormat:@"index %lu \"%@\"", v5 - 1, v8];
        id v4 = (const char *)[v16 UTF8String];

        uint64_t v9 = v26;
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"index %lu", v5 - 1);
        id v11 = objc_claimAutoreleasedReturnValue();
        id v4 = (const char *)[v11 UTF8String];
      }

      if (!v4) {
        goto LABEL_31;
      }
LABEL_32:

LABEL_23:
      LOBYTE(v2) = v4 == 0;
      if (v5 < v3)
      {
        ++v5;
        if (!v4) {
          continue;
        }
      }
      break;
    }
  }
  if (v2)
  {
    CFDataRef v17 = *(void **)(a1 + 32);
    char v18 = v27;
    [v17 setSubject:v27];
  }
  else
  {
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"SecRequestClientIdentity: subject array has missing value or wrong type for %s key", v4);
    xpc_object_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28760];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    uint64_t v29 = v19;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v23 = [v20 errorWithDomain:v21 code:-50 userInfo:v22];
    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    char v18 = v27;
  }
}

- (id)serialNumber
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 0;
  v9[0] = bswap64(dispatch_time(0, 0));
  uint64_t v3 = 8;
  while (!*((unsigned char *)v9 + v2))
  {
    ++v2;
    if (!--v3)
    {
      uint64_t v2 = 8;
      break;
    }
  }
  id v4 = [MEMORY[0x1E4F1CA58] dataWithCapacity:0];
  unint64_t v5 = v4;
  uint64_t v6 = (char *)v9 + v2;
  if (*v6 < 0)
  {
    char v8 = 0;
    [v4 appendBytes:&v8 length:1];
  }
  [v5 appendBytes:v6 length:v3];

  return v5;
}

- (void)dealloc
{
  privateKey = self->_privateKey;
  if (privateKey)
  {
    self->_privateKey = 0;
    CFRelease(privateKey);
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    self->_publicKey = 0;
    CFRelease(publicKey);
  }
  certificate = self->_certificate;
  if (certificate)
  {
    self->_certificate = 0;
    CFRelease(certificate);
  }
  identity = self->_identity;
  if (identity)
  {
    self->_identity = 0;
    CFRelease(identity);
  }
  v7.receiver = self;
  v7.super_class = (Class)AcmeCertRequest;
  [(AcmeCertRequest *)&v7 dealloc];
}

- (AcmeCertRequest)initWithSubject:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AcmeCertRequest;
  char v8 = [(AcmeCertRequest *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(AcmeCertRequest *)v8 setSubject:v6];
    [(AcmeCertRequest *)v9 setParameters:v7];
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.certrequest", 0);
    [(AcmeCertRequest *)v9 setQueue:v10];
  }
  return v9;
}

@end