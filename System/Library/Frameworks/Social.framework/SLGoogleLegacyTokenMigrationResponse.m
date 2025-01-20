@interface SLGoogleLegacyTokenMigrationResponse
- (NSError)error;
- (NSString)responseBody;
- (SLGoogleLegacyTokenMigrationResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (int64_t)statusCode;
@end

@implementation SLGoogleLegacyTokenMigrationResponse

- (SLGoogleLegacyTokenMigrationResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  _SLLog(v5, 7, @"SLGoogleLegacyTokenMigrationResponse initWithData: %@ length urlResponse: %@ error: %@");

  v19.receiver = self;
  v19.super_class = (Class)SLGoogleLegacyTokenMigrationResponse;
  v12 = [(SLGoogleLegacyTokenMigrationResponse *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13->_statusCode = [v10 statusCode];
      uint64_t v14 = [[NSString alloc] initWithData:v9 encoding:4];
      responseBody = v13->_responseBody;
      v13->_responseBody = (NSString *)v14;

      v18 = [NSNumber numberWithInteger:v13->_statusCode];
      _SLLog(v5, 7, @"SLGoogleLegacyTokenMigrationResponse httpResponse status code %@");
    }
    else
    {
      _SLLog(v5, 7, @"SLGoogleLegacyTokenMigrationResponse response is not NSHTTPURLResponse. Game over.");
    }
  }

  return v13;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)responseBody
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBody, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end