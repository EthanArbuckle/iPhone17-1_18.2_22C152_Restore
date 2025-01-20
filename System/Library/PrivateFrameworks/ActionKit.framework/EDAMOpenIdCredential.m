@interface EDAMOpenIdCredential
+ (id)structFields;
+ (id)structName;
- (NSNumber)serviceProvider;
- (NSString)tokenPayload;
- (void)setServiceProvider:(id)a3;
- (void)setTokenPayload:(id)a3;
@end

@implementation EDAMOpenIdCredential

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_6764;
  if (!structFields_structFields_6764)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"tokenPayload"];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:8 optional:0 name:@"serviceProvider"];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_6764;
    structFields_structFields_6764 = v5;

    v2 = (void *)structFields_structFields_6764;
  }
  return v2;
}

+ (id)structName
{
  return @"OpenIdCredential";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_tokenPayload, 0);
}

- (void)setServiceProvider:(id)a3
{
}

- (NSNumber)serviceProvider
{
  return self->_serviceProvider;
}

- (void)setTokenPayload:(id)a3
{
}

- (NSString)tokenPayload
{
  return self->_tokenPayload;
}

@end