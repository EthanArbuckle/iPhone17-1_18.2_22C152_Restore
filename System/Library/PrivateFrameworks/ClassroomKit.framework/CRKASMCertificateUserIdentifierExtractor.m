@interface CRKASMCertificateUserIdentifierExtractor
+ (id)allUserIdentifiersFromCertificate:(id)a3;
+ (id)pickIdentifierFromIdentifiers:(id)a3;
+ (id)userIdentifierFromCertificate:(id)a3;
@end

@implementation CRKASMCertificateUserIdentifierExtractor

+ (id)userIdentifierFromCertificate:(id)a3
{
  v4 = [a1 allUserIdentifiersFromCertificate:a3];
  v5 = [a1 pickIdentifierFromIdentifiers:v4];

  return v5;
}

+ (id)pickIdentifierFromIdentifiers:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    v4 = [v3 componentsJoinedByString:@","];
    if (_CRKLogASM_onceToken_10 != -1) {
      dispatch_once(&_CRKLogASM_onceToken_10, &__block_literal_global_21);
    }
    v5 = _CRKLogASM_logObj_10;
    if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_10, OS_LOG_TYPE_ERROR)) {
      +[CRKASMCertificateUserIdentifierExtractor pickIdentifierFromIdentifiers:]((uint64_t)v4, v5);
    }
  }
  v6 = [v3 firstObject];

  return v6;
}

+ (id)allUserIdentifiersFromCertificate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(v3, "commonNames", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[CRKASMCertificateCommonName commonNameWithString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        v11 = v10;
        if (v10)
        {
          v12 = [v10 userIdentifier];
          if (v12) {
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v4 sortUsingSelector:sel_compare_];
  v13 = (void *)[v4 copy];

  return v13;
}

+ (void)pickIdentifierFromIdentifiers:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Certificate contains multiple user identifiers: [%@]", (uint8_t *)&v2, 0xCu);
}

@end