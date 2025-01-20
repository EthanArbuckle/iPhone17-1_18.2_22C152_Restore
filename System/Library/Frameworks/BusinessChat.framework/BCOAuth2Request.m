@interface BCOAuth2Request
- (BCBaseOAuth2Protocol)oauth2;
- (NSDictionary)dictionaryValue;
- (NSString)businessIdentifier;
- (id)_initWithDictionary:(id)a3 URLProvider:(id)a4;
- (id)debugDescription;
- (void)setBusinessIdentifier:(id)a3;
- (void)setOauth2:(id)a3;
@end

@implementation BCOAuth2Request

- (id)_initWithDictionary:(id)a3 URLProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"businessIdentifier"];
  uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  if (v8 == (void *)v9)
  {
  }
  else
  {
    v10 = (void *)v9;
    v11 = [v6 objectForKeyedSubscript:@"businessIdentifier"];

    if (v11)
    {
      v16.receiver = self;
      v16.super_class = (Class)BCOAuth2Request;
      v12 = [(BCOAuth2Request *)&v16 init];
      p_isa = (id *)&v12->super.isa;
      if (v12)
      {
        objc_storeStrong((id *)&v12->_businessIdentifier, v11);
        objc_storeStrong(p_isa + 2, a4);
      }
      self = p_isa;
      v14 = self;
      goto LABEL_10;
    }
  }
  v11 = LogCategory_Daemon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_228C26000, v11, OS_LOG_TYPE_ERROR, "Unable to create BCAuthenticationRequest: missing 'business identifier' in payload", buf, 2u);
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)debugDescription
{
  v2 = self;
  if (self)
  {
    v3 = [MEMORY[0x263F29C40] builderWithObject:self];
    v4 = [v2 oauth2];
    v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = (id)[v3 appendObject:v6 withName:@"Request Type"];

    v8 = [v2 businessIdentifier];
    id v9 = (id)[v3 appendObject:v8 withName:@"BusinessIdentifer"];

    v2 = [v3 build];
  }

  return v2;
}

- (NSDictionary)dictionaryValue
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

- (NSString)businessIdentifier
{
  return self->_businessIdentifier;
}

- (void)setBusinessIdentifier:(id)a3
{
}

- (BCBaseOAuth2Protocol)oauth2
{
  return self->_oauth2;
}

- (void)setOauth2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oauth2, 0);

  objc_storeStrong((id *)&self->_businessIdentifier, 0);
}

@end