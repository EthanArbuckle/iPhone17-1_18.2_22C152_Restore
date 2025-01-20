@interface EDAMPlainCredential
+ (id)structFields;
+ (id)structName;
- (NSNumber)userId;
- (NSString)password;
- (void)setPassword:(id)a3;
- (void)setUserId:(id)a3;
@end

@implementation EDAMPlainCredential

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_27;
  if (!structFields_structFields_27)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"userId"];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"password"];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_27;
    structFields_structFields_27 = v5;

    v2 = (void *)structFields_structFields_27;
  }
  return v2;
}

+ (id)structName
{
  return @"PlainCredential";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userId, 0);
}

- (void)setPassword:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setUserId:(id)a3
{
}

- (NSNumber)userId
{
  return self->_userId;
}

@end