@interface SLGoogleLegacyTokenMigrationTokenResponse
- (NSString)errorMessage;
- (NSString)token;
- (SLGoogleLegacyTokenMigrationTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
@end

@implementation SLGoogleLegacyTokenMigrationTokenResponse

- (SLGoogleLegacyTokenMigrationTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)SLGoogleLegacyTokenMigrationTokenResponse;
  v7 = -[SLGoogleLegacyTokenMigrationResponse initWithData:urlResponse:error:](&v24, sel_initWithData_urlResponse_error_, a3, a4);
  v8 = v7;
  if (!a5 && v7)
  {
    v9 = [(SLGoogleLegacyTokenMigrationResponse *)v7 responseBody];
    v10 = [v9 componentsSeparatedByString:@"\n"];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v16, "hasPrefix:", @"Auth=", (void)v20))
          {
            uint64_t v17 = [v16 substringFromIndex:5];
            token = v8->_token;
            v8->_token = (NSString *)v17;

            _SLLog(v5, 5, @"Successfully got a token");
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v8;
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end