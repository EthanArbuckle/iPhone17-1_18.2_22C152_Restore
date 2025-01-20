@interface EDAMPublishing
+ (id)structFields;
+ (id)structName;
- (NSNumber)ascending;
- (NSNumber)order;
- (NSString)publicDescription;
- (NSString)uri;
- (void)setAscending:(id)a3;
- (void)setOrder:(id)a3;
- (void)setPublicDescription:(id)a3;
- (void)setUri:(id)a3;
@end

@implementation EDAMPublishing

+ (id)structFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1882;
  if (!structFields_structFields_1882)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"uri"];
    v10[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:8 optional:1 name:@"order"];
    v10[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"ascending"];
    v10[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"publicDescription"];
    v10[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v8 = (void *)structFields_structFields_1882;
    structFields_structFields_1882 = v7;

    v2 = (void *)structFields_structFields_1882;
  }
  return v2;
}

+ (id)structName
{
  return @"Publishing";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicDescription, 0);
  objc_storeStrong((id *)&self->_ascending, 0);
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

- (void)setPublicDescription:(id)a3
{
}

- (NSString)publicDescription
{
  return self->_publicDescription;
}

- (void)setAscending:(id)a3
{
}

- (NSNumber)ascending
{
  return self->_ascending;
}

- (void)setOrder:(id)a3
{
}

- (NSNumber)order
{
  return self->_order;
}

- (void)setUri:(id)a3
{
}

- (NSString)uri
{
  return self->_uri;
}

@end