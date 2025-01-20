@interface KCSRPServerContext
- (BOOL)resetWithPassword:(id)a3 error:(id *)a4;
- (KCSRPServerContext)initWithUser:(id)a3 password:(id)a4 digestInfo:(const ccdigest_info *)a5 group:(ccdh_gp *)a6 randomSource:(ccrng_state *)a7;
- (KCSRPServerContext)initWithUser:(id)a3 salt:(id)a4 verifier:(id)a5 digestInfo:(const ccdigest_info *)a6 group:(ccdh_gp *)a7 randomSource:(ccrng_state *)a8;
- (NSData)salt;
- (NSData)verifier;
- (id)copyChallengeFor:(id)a3 error:(id *)a4;
- (id)copyConfirmationFor:(id)a3 error:(id *)a4;
- (void)setVerifier:(id)a3;
@end

@implementation KCSRPServerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_salt, 0);
}

- (void)setVerifier:(id)a3
{
}

- (NSData)verifier
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)salt
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (id)copyConfirmationFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(KCSRPContext *)self context];
  uint64_t v7 = ccsrp_session_size();
  if (!ExactDataSizeRequirement(v6, v7, a4, @"response data")) {
    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x263EFF990];
  [(KCSRPContext *)self context];
  v9 = [v8 dataWithLength:ccsrp_session_size()];
  [(KCSRPContext *)self context];
  [v6 bytes];
  id v10 = v9;
  [v10 mutableBytes];
  int v11 = ccsrp_server_verify_session();
  if (!CoreCryptoError(v11 ^ 1u, a4, @"SRP verification failed", v12, v13, v14, v15, v16, v18))
  {

LABEL_4:
    id v10 = 0;
  }

  return v10;
}

- (id)copyChallengeFor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(KCSRPContext *)self context];
  uint64_t v7 = ccsrp_exchange_size();
  if (!ExactDataSizeRequirement(v6, v7, a4, @"start data")) {
    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x263EFF990];
  [(KCSRPContext *)self context];
  id v20 = [v8 dataWithLength:ccsrp_exchange_size()];
  [(KCSRPContext *)self context];
  [(KCSRPContext *)self rng];
  [(KCSRPContext *)self userNameString];
  v9 = [(KCSRPServerContext *)self salt];
  [v9 length];
  id v10 = [(KCSRPServerContext *)self salt];
  [v10 bytes];
  id v11 = [(KCSRPServerContext *)self verifier];
  [v11 bytes];
  [v6 bytes];
  id v12 = v20;
  [v12 mutableBytes];
  uint64_t started = ccsrp_server_start_authentication();

  if (!CoreCryptoError(started, a4, @"Server start authentication failed: %d", v14, v15, v16, v17, v18, started))
  {

LABEL_4:
    id v12 = 0;
  }

  return v12;
}

- (KCSRPServerContext)initWithUser:(id)a3 salt:(id)a4 verifier:(id)a5 digestInfo:(const ccdigest_info *)a6 group:(ccdh_gp *)a7 randomSource:(ccrng_state *)a8
{
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)KCSRPServerContext;
  uint64_t v17 = [(KCSRPContext *)&v20 initWithUser:a3 digestInfo:a6 group:a7 randomSource:a8];
  uint64_t v18 = v17;
  if (v17)
  {
    [(KCSRPServerContext *)v17 setVerifier:v16];
    objc_storeStrong((id *)&v18->_salt, a4);
  }

  return v18;
}

- (KCSRPServerContext)initWithUser:(id)a3 password:(id)a4 digestInfo:(const ccdigest_info *)a5 group:(ccdh_gp *)a6 randomSource:(ccrng_state *)a7
{
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)KCSRPServerContext;
  uint64_t v13 = [(KCSRPContext *)&v17 initWithUser:a3 digestInfo:a5 group:a6 randomSource:a7];
  uint64_t v14 = v13;
  if (!v13 || (id v15 = 0, [(KCSRPServerContext *)v13 resetWithPassword:v12 error:0])) {
    id v15 = v14;
  }

  return v15;
}

- (BOOL)resetWithPassword:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263EFF990];
  id v6 = a3;
  uint64_t v7 = [v5 dataWithLength:16];
  v8 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", 8 * MEMORY[0x21D465DA0]((void)-[KCSRPContext context](self, "context")[8]));
  v9 = [(KCSRPContext *)self dataForPassword:v6];

  v21 = [(KCSRPContext *)self context];
  [(KCSRPContext *)self rng];
  [(KCSRPContext *)self userNameString];
  [v9 length];
  id v10 = v9;
  [v10 bytes];
  [v7 length];
  id v11 = v7;
  [v11 mutableBytes];
  id v12 = v8;
  [v12 mutableBytes];
  uint64_t salt_and_verification = ccsrp_generate_salt_and_verification();
  BOOL v19 = CoreCryptoError(salt_and_verification, a4, @"Error generating SRP salt/verifier", v14, v15, v16, v17, v18, (uint64_t)v21);
  if (v19)
  {
    [(KCSRPServerContext *)self setVerifier:v12];
    objc_storeStrong((id *)&self->_salt, v11);
  }

  return v19;
}

@end