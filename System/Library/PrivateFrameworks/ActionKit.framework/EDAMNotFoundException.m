@interface EDAMNotFoundException
+ (id)structFields;
+ (id)structName;
- (NSString)identifier;
- (NSString)key;
- (void)setIdentifier:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation EDAMNotFoundException

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_52_35794;
  if (!structFields_structFields_52_35794)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"identifier"];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"key"];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_52_35794;
    structFields_structFields_52_35794 = v5;

    v2 = (void *)structFields_structFields_52_35794;
  }
  return v2;
}

+ (id)structName
{
  return @"EDAMNotFoundException";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

@end