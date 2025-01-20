@interface AAPaymentSummaryRequest
+ (Class)responseClass;
- (BOOL)forceGSToken;
- (NSString)heartbeatToken;
- (NSString)secondaryAuthToken;
- (id)urlRequest;
- (id)urlString;
- (void)setHeartbeatToken:(id)a3;
- (void)setSecondaryAuthToken:(id)a3;
@end

@implementation AAPaymentSummaryRequest

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 paymentSummaryURL];

  return v3;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)forceGSToken
{
  return self->_heartbeatToken == 0;
}

- (id)urlRequest
{
  v9.receiver = self;
  v9.super_class = (Class)AAPaymentSummaryRequest;
  v3 = [(AAAppleIDSettingsRequest *)&v9 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  secondaryAuthToken = self->_secondaryAuthToken;
  if (secondaryAuthToken) {
    [v4 addValue:secondaryAuthToken forHTTPHeaderField:@"X-Apple-2SV-Authenticate"];
  }
  v6 = [(AAAppleIDSettingsRequest *)self grandSlamAccount];
  v7 = objc_msgSend(v6, "aida_alternateDSID");
  objc_msgSend(v4, "aa_addGrandslamAuthorizationheaderWithAltDSID:heartbeatToken:", v7, self->_heartbeatToken);

  objc_msgSend(v4, "aa_addContentTypeHeaders:", @"application/json");

  return v4;
}

- (NSString)secondaryAuthToken
{
  return self->_secondaryAuthToken;
}

- (void)setSecondaryAuthToken:(id)a3
{
}

- (NSString)heartbeatToken
{
  return self->_heartbeatToken;
}

- (void)setHeartbeatToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatToken, 0);

  objc_storeStrong((id *)&self->_secondaryAuthToken, 0);
}

@end