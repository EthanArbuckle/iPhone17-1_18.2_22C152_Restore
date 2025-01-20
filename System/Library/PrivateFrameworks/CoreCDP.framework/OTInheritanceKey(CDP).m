@interface OTInheritanceKey(CDP)
- (id)accessCode;
- (uint64_t)initFromAccessKey:()CDP;
@end

@implementation OTInheritanceKey(CDP)

- (uint64_t)initFromAccessKey:()CDP
{
  id v4 = a3;
  v5 = [v4 wrappingKeyData];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[OTInheritanceKey(CDP) initFromAccessKey:](v7);
    }

    id v8 = objc_alloc(MEMORY[0x263F5B748]);
    v9 = [v4 wrappedKeyData];
    v10 = [v4 wrappingKeyData];
    v11 = [v4 beneficiaryID];
    uint64_t v23 = 0;
    v12 = (id *)&v23;
    uint64_t v13 = [v8 initWithWrappedKeyData:v9 wrappingKeyData:v10 uuid:v11 error:&v23];
  }
  else
  {
    v14 = [v4 wrappingKeyString];
    uint64_t v15 = [v14 length];

    if (!v15)
    {
      uint64_t v18 = 0;
      id v19 = 0;
      goto LABEL_14;
    }
    v16 = _CDPLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[OTInheritanceKey(CDP) initFromAccessKey:](v16);
    }

    id v17 = objc_alloc(MEMORY[0x263F5B748]);
    v9 = [v4 wrappedKeyData];
    v10 = [v4 wrappingKeyString];
    v11 = [v4 beneficiaryID];
    uint64_t v22 = 0;
    v12 = (id *)&v22;
    uint64_t v13 = [v17 initWithWrappedKeyData:v9 wrappingKeyString:v10 uuid:v11 error:&v22];
  }
  uint64_t v18 = v13;
  id v19 = *v12;

  if (v19)
  {
    v20 = _CDPLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[OTInheritanceKey(CDP) initFromAccessKey:]((uint64_t)v19, v20);
    }
  }
LABEL_14:

  return v18;
}

- (id)accessCode
{
  id v2 = objc_alloc(MEMORY[0x263F291F8]);
  v3 = [a1 uuid];
  id v4 = (void *)[v2 initWithBeneficiairyIdentifier:v3];

  v5 = [a1 claimTokenData];
  [v4 setClaimTokenData:v5];

  uint64_t v6 = [a1 claimTokenString];
  [v4 setClaimTokenString:v6];

  v7 = [a1 wrappingKeyData];
  [v4 setWrappingKeyData:v7];

  id v8 = [a1 wrappingKeyString];
  [v4 setWrappingKeyString:v8];

  v9 = [a1 wrappedKeyData];
  [v4 setWrappedKeyData:v9];

  v10 = [a1 wrappedKeyString];
  [v4 setWrappedKeyString:v10];

  return v4;
}

- (void)initFromAccessKey:()CDP .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Error creating key from access key string. Error - %@", (uint8_t *)&v2, 0xCu);
}

- (void)initFromAccessKey:()CDP .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Creating the access code from string.", v1, 2u);
}

- (void)initFromAccessKey:()CDP .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Creating the access code from data.", v1, 2u);
}

@end