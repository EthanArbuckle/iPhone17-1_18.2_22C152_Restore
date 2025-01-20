@interface CRKASMCertificateIngestor
- (BOOL)areCertificatesValid:(id)a3 forUserIdentifier:(id)a4 error:(id *)a5;
- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isCertificateValid:(id)a3 forUserIdentifier:(id)a4 error:(id *)a5;
- (BOOL)storeCertificates:(id)a3 userIdentifier:(id)a4 error:(id *)a5;
- (CRKASMCertificateIngestor)initWithConfiguration:(id)a3;
- (CRKASMRosterProviderConfiguration)configuration;
@end

@implementation CRKASMCertificateIngestor

- (CRKASMCertificateIngestor)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMCertificateIngestor;
  v6 = [(CRKASMCertificateIngestor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (BOOL)ingestCertificates:(id)a3 forTrustedUserIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    if (a5)
    {
      CRKErrorWithCodeAndUserInfo(2, &unk_26D819F38);
      BOOL v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  if (![(CRKASMCertificateIngestor *)self areCertificatesValid:v8 forUserIdentifier:v9 error:a5])goto LABEL_6; {
  BOOL v10 = [(CRKASMCertificateIngestor *)self storeCertificates:v8 userIdentifier:v9 error:a5];
  }
LABEL_7:

  return v10;
}

- (BOOL)areCertificatesValid:(id)a3 forUserIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (!-[CRKASMCertificateIngestor isCertificateValid:forUserIdentifier:error:](self, "isCertificateValid:forUserIdentifier:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), v9, a5, (void)v17))
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)isCertificateValid:(id)a3 forUserIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CRKASMCertificateIngestor *)self configuration];
  uint64_t v11 = [v10 trustedUserCommonNamePrefix];

  uint64_t v12 = +[CRKASMCertificateParserResult resultForCertificate:v9 expectedCommonNamePrefix:v11 expectedUserIdentifier:v8];

  LOBYTE(a5) = [v12 isCertificateValidWithError:a5];
  return (char)a5;
}

- (BOOL)storeCertificates:(id)a3 userIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CRKASMCertificateIngestor *)self configuration];
  uint64_t v11 = [v10 credentialStore];

  uint64_t v12 = [v11 addCertificates:v9 forUserIdentifier:v8];

  uint64_t v13 = [v12 count];
  uint64_t v14 = [v9 count];

  if (a5 && v13 != v14)
  {
    CRKErrorWithCodeAndUserInfo(20, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13 == v14;
}

- (CRKASMRosterProviderConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end