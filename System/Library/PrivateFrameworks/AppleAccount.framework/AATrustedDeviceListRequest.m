@interface AATrustedDeviceListRequest
+ (Class)responseClass;
- (AATrustedDeviceListRequest)initWithURLString:(id)a3 accountStore:(id)a4 grandSlamAccount:(id)a5;
- (NSString)heartbeatToken;
- (id)urlRequest;
- (id)urlString;
- (void)setHeartbeatToken:(id)a3;
@end

@implementation AATrustedDeviceListRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AATrustedDeviceListRequest)initWithURLString:(id)a3 accountStore:(id)a4 grandSlamAccount:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AATrustedDeviceListRequest;
  v10 = [(AARequest *)&v14 initWithURLString:a3];
  if (v10)
  {
    v11 = [[AAGrandSlamSigner alloc] initWithAccountStore:v8 grandSlamAccount:v9 appTokenID:@"com.apple.gs.appleid.auth"];
    grandSlamSigner = v10->_grandSlamSigner;
    v10->_grandSlamSigner = v11;
  }
  return v10;
}

- (id)urlString
{
  grandSlamSigner = self->_grandSlamSigner;
  if (grandSlamSigner)
  {
    v4 = [grandSlamSigner grandSlamAccount];

    if (v4
      && ([(AAGrandSlamSigner *)self->_grandSlamSigner accountStore],
          v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      v7.receiver = self;
      v7.super_class = (Class)AATrustedDeviceListRequest;
      grandSlamSigner = [(AARequest *)&v7 urlString];
    }
    else
    {
      grandSlamSigner = 0;
    }
  }

  return grandSlamSigner;
}

- (id)urlRequest
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)AATrustedDeviceListRequest;
  v3 = [(AARequest *)&v12 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 URL];
    *(_DWORD *)buf = 138412290;
    objc_super v14 = v6;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "Sending GET to %@", buf, 0xCu);
  }
  [v4 setHTTPMethod:@"GET"];
  [(AAGrandSlamSigner *)self->_grandSlamSigner setUseAltDSID:1];
  if (![(AAGrandSlamSigner *)self->_grandSlamSigner signURLRequest:v4 isUserInitiated:0])
  {
    objc_super v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v7, OS_LOG_TYPE_DEFAULT, "AAGrandSlamSigner failed!", buf, 2u);
    }
  }
  id v8 = [(AAGrandSlamSigner *)self->_grandSlamSigner grandSlamAccount];
  id v9 = objc_msgSend(v8, "aida_alternateDSID");
  objc_msgSend(v4, "aa_addGrandslamAuthorizationheaderWithAltDSID:heartbeatToken:", v9, self->_heartbeatToken);

  objc_msgSend(v4, "aa_addDeviceIDHeader");
  v10 = +[AADeviceInfo serialNumber];
  [v4 setValue:v10 forHTTPHeaderField:@"X-Apple-I-SRL-NO"];

  objc_msgSend(v4, "aa_addContentTypeHeaders:", @"application/json");

  return v4;
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

  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
}

@end