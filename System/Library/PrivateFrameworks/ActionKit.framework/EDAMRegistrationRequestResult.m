@interface EDAMRegistrationRequestResult
+ (id)structFields;
+ (id)structName;
- (NSNumber)result;
- (NSString)name;
- (NSString)refreshToken;
- (NSString)userEmail;
- (void)setName:(id)a3;
- (void)setRefreshToken:(id)a3;
- (void)setResult:(id)a3;
- (void)setUserEmail:(id)a3;
@end

@implementation EDAMRegistrationRequestResult

+ (id)structFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_77;
  if (!structFields_structFields_77)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"refreshToken"];
    v10[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"userEmail"];
    v10[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"result"];
    v10[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:0 name:@"name"];
    v10[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v8 = (void *)structFields_structFields_77;
    structFields_structFields_77 = v7;

    v2 = (void *)structFields_structFields_77;
  }
  return v2;
}

+ (id)structName
{
  return @"RegistrationRequestResult";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setResult:(id)a3
{
}

- (NSNumber)result
{
  return self->_result;
}

- (void)setUserEmail:(id)a3
{
}

- (NSString)userEmail
{
  return self->_userEmail;
}

- (void)setRefreshToken:(id)a3
{
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

@end