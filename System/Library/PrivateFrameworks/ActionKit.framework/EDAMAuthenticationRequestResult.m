@interface EDAMAuthenticationRequestResult
+ (id)structFields;
+ (id)structName;
- (NSNumber)result;
- (NSNumber)userId;
- (NSString)userEmail;
- (void)setResult:(id)a3;
- (void)setUserEmail:(id)a3;
- (void)setUserId:(id)a3;
@end

@implementation EDAMAuthenticationRequestResult

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_52;
  if (!structFields_structFields_52)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"userId"];
    v4 = +[FATField fieldWithIndex:2, 11, 0, @"userEmail", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"result"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_52;
    structFields_structFields_52 = v6;

    v2 = (void *)structFields_structFields_52;
  }
  return v2;
}

+ (id)structName
{
  return @"AuthenticationRequestResult";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userId, 0);
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

- (void)setUserId:(id)a3
{
}

- (NSNumber)userId
{
  return self->_userId;
}

@end