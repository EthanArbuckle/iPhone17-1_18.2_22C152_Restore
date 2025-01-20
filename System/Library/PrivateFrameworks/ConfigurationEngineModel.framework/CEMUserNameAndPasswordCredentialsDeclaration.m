@interface CEMUserNameAndPasswordCredentialsDeclaration
+ (NSSet)allowedPayloadKeys;
+ (id)buildRequiredOnlyWithUserName:(id)a3 withPassword:(id)a4;
+ (id)buildWithUserName:(id)a3 withPassword:(id)a4;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSString)payloadPassword;
- (NSString)payloadUserName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setPayloadPassword:(id)a3;
- (void)setPayloadUserName:(id)a3;
@end

@implementation CEMUserNameAndPasswordCredentialsDeclaration

+ (NSSet)allowedPayloadKeys
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"UserName";
  v6[1] = @"Password";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithUserName:(id)a3 withPassword:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadUserName:v6];

  [v7 setPayloadPassword:v5];

  return v7;
}

+ (id)buildRequiredOnlyWithUserName:(id)a3 withPassword:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadUserName:v6];

  [v7 setPayloadPassword:v5];

  return v7;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMUserNameAndPasswordCredentialsDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  id v20 = 0;
  v13 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UserName" isRequired:1 defaultValue:0 error:&v20];
  id v14 = v20;
  payloadUserName = self->_payloadUserName;
  self->_payloadUserName = v13;

  if (!v14)
  {
    id v19 = 0;
    v16 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Password" isRequired:1 defaultValue:0 error:&v19];
    id v14 = v19;
    payloadPassword = self->_payloadPassword;
    self->_payloadPassword = v16;
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"UserName" withValue:self->_payloadUserName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Password" withValue:self->_payloadPassword isRequired:1 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CEMUserNameAndPasswordCredentialsDeclaration;
  v4 = [(CEMPayloadBase *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_payloadUserName copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_payloadPassword copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)payloadUserName
{
  return self->_payloadUserName;
}

- (void)setPayloadUserName:(id)a3
{
}

- (NSString)payloadPassword
{
  return self->_payloadPassword;
}

- (void)setPayloadPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadPassword, 0);

  objc_storeStrong((id *)&self->_payloadUserName, 0);
}

@end