@interface EDAMAuthenticationParameters
+ (id)structFields;
+ (id)structName;
- (NSNumber)supportsBusinessOnlyAccounts;
- (NSNumber)supportsTwoFactor;
- (NSString)consumerKey;
- (NSString)consumerSecret;
- (NSString)deviceDescription;
- (NSString)deviceIdentifier;
- (NSString)password;
- (NSString)ssoLoginToken;
- (NSString)usernameOrEmail;
- (void)setConsumerKey:(id)a3;
- (void)setConsumerSecret:(id)a3;
- (void)setDeviceDescription:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setPassword:(id)a3;
- (void)setSsoLoginToken:(id)a3;
- (void)setSupportsBusinessOnlyAccounts:(id)a3;
- (void)setSupportsTwoFactor:(id)a3;
- (void)setUsernameOrEmail:(id)a3;
@end

@implementation EDAMAuthenticationParameters

+ (id)structFields
{
  v15[9] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_421;
  if (!structFields_structFields_421)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"usernameOrEmail"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"password", v3 type optional name];
    v15[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"ssoLoginToken"];
    v15[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"consumerKey"];
    v15[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"consumerSecret"];
    v15[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"deviceIdentifier"];
    v15[5] = v8;
    v9 = +[FATField fieldWithIndex:7 type:11 optional:1 name:@"deviceDescription"];
    v15[6] = v9;
    v10 = +[FATField fieldWithIndex:8 type:2 optional:1 name:@"supportsTwoFactor"];
    v15[7] = v10;
    v11 = +[FATField fieldWithIndex:9 type:2 optional:1 name:@"supportsBusinessOnlyAccounts"];
    v15[8] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:9];
    v13 = (void *)structFields_structFields_421;
    structFields_structFields_421 = v12;

    v2 = (void *)structFields_structFields_421;
  }
  return v2;
}

+ (id)structName
{
  return @"AuthenticationParameters";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportsBusinessOnlyAccounts, 0);
  objc_storeStrong((id *)&self->_supportsTwoFactor, 0);
  objc_storeStrong((id *)&self->_deviceDescription, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_consumerSecret, 0);
  objc_storeStrong((id *)&self->_consumerKey, 0);
  objc_storeStrong((id *)&self->_ssoLoginToken, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_usernameOrEmail, 0);
}

- (void)setSupportsBusinessOnlyAccounts:(id)a3
{
}

- (NSNumber)supportsBusinessOnlyAccounts
{
  return self->_supportsBusinessOnlyAccounts;
}

- (void)setSupportsTwoFactor:(id)a3
{
}

- (NSNumber)supportsTwoFactor
{
  return self->_supportsTwoFactor;
}

- (void)setDeviceDescription:(id)a3
{
}

- (NSString)deviceDescription
{
  return self->_deviceDescription;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setConsumerSecret:(id)a3
{
}

- (NSString)consumerSecret
{
  return self->_consumerSecret;
}

- (void)setConsumerKey:(id)a3
{
}

- (NSString)consumerKey
{
  return self->_consumerKey;
}

- (void)setSsoLoginToken:(id)a3
{
}

- (NSString)ssoLoginToken
{
  return self->_ssoLoginToken;
}

- (void)setPassword:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setUsernameOrEmail:(id)a3
{
}

- (NSString)usernameOrEmail
{
  return self->_usernameOrEmail;
}

@end