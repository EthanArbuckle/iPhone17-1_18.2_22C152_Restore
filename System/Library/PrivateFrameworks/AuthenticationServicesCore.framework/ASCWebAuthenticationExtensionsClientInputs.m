@interface ASCWebAuthenticationExtensionsClientInputs
+ (BOOL)supportsSecureCoding;
- (ASCWebAuthenticationExtensionsClientInputs)init;
- (ASCWebAuthenticationExtensionsClientInputs)initWithAppID:(id)a3 isGoogleLegacyAppIDSupport:(BOOL)a4;
- (ASCWebAuthenticationExtensionsClientInputs)initWithCoder:(id)a3;
- (BOOL)isGoogleLegacyAppIDSupport;
- (NSString)appID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppID:(id)a3;
- (void)setIsGoogleLegacyAppIDSupport:(BOOL)a3;
@end

@implementation ASCWebAuthenticationExtensionsClientInputs

- (ASCWebAuthenticationExtensionsClientInputs)init
{
  return [(ASCWebAuthenticationExtensionsClientInputs *)self initWithAppID:0 isGoogleLegacyAppIDSupport:0];
}

- (ASCWebAuthenticationExtensionsClientInputs)initWithAppID:(id)a3 isGoogleLegacyAppIDSupport:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASCWebAuthenticationExtensionsClientInputs;
  v8 = [(ASCWebAuthenticationExtensionsClientInputs *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appID, a3);
    v9->_isGoogleLegacyAppIDSupport = a4;
    v10 = v9;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(ASCWebAuthenticationExtensionsClientInputs *)self appID];
  v6 = objc_msgSend(v4, "initWithAppID:isGoogleLegacyAppIDSupport:", v5, -[ASCWebAuthenticationExtensionsClientInputs isGoogleLegacyAppIDSupport](self, "isGoogleLegacyAppIDSupport"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCWebAuthenticationExtensionsClientInputs)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appID"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isGoogleLegacyAppIDSupport"];

  id v7 = [(ASCWebAuthenticationExtensionsClientInputs *)self initWithAppID:v5 isGoogleLegacyAppIDSupport:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ASCWebAuthenticationExtensionsClientInputs *)self appID];
  [v5 encodeObject:v4 forKey:@"appID"];

  objc_msgSend(v5, "encodeBool:forKey:", -[ASCWebAuthenticationExtensionsClientInputs isGoogleLegacyAppIDSupport](self, "isGoogleLegacyAppIDSupport"), @"isGoogleLegacyAppIDSupport");
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (BOOL)isGoogleLegacyAppIDSupport
{
  return self->_isGoogleLegacyAppIDSupport;
}

- (void)setIsGoogleLegacyAppIDSupport:(BOOL)a3
{
  self->_isGoogleLegacyAppIDSupport = a3;
}

- (void).cxx_destruct
{
}

@end