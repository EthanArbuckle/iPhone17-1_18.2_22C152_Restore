@interface EDAMUserException
+ (id)structFields;
+ (id)structName;
- (NSNumber)errorCode;
- (NSString)parameter;
- (void)setErrorCode:(id)a3;
- (void)setParameter:(id)a3;
@end

@implementation EDAMUserException

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_35736;
  if (!structFields_structFields_35736)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"errorCode"];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"parameter"];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_35736;
    structFields_structFields_35736 = v5;

    v2 = (void *)structFields_structFields_35736;
  }
  return v2;
}

+ (id)structName
{
  return @"EDAMUserException";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

- (void)setParameter:(id)a3
{
}

- (NSString)parameter
{
  return self->_parameter;
}

- (void)setErrorCode:(id)a3
{
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

@end