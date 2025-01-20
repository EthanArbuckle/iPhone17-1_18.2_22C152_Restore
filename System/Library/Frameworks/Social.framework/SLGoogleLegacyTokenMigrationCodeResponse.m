@interface SLGoogleLegacyTokenMigrationCodeResponse
- (NSString)code;
- (SLGoogleLegacyTokenMigrationCodeResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
@end

@implementation SLGoogleLegacyTokenMigrationCodeResponse

- (SLGoogleLegacyTokenMigrationCodeResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SLGoogleLegacyTokenMigrationCodeResponse;
  v10 = [(SLGoogleLegacyTokenMigrationResponse *)&v32 initWithData:a3 urlResponse:v9 error:a5];
  v11 = v10;
  if (!a5)
  {
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1C978]);
        v13 = (void *)MEMORY[0x1E4F28D10];
        v14 = [v9 allHeaderFields];
        v15 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F1E28690];
        v16 = [v13 cookiesWithResponseHeaderFields:v14 forURL:v15];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v29 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              v23 = [v22 name];
              int v24 = [v23 isEqualToString:@"oauth_code"];

              if (v24)
              {
                _SLLog(v5, 5, @"Successfully got an auth code");
                uint64_t v25 = [v22 value];
                code = v11->_code;
                v11->_code = (NSString *)v25;

                goto LABEL_14;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v33 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
LABEL_14:
      }
    }
  }

  return v11;
}

- (NSString)code
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end