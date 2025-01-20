@interface EDAMData
+ (id)structFields;
+ (id)structName;
- (NSData)body;
- (NSData)bodyHash;
- (NSNumber)size;
- (void)setBody:(id)a3;
- (void)setBodyHash:(id)a3;
- (void)setSize:(id)a3;
@end

@implementation EDAMData

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_12428;
  if (!structFields_structFields_12428)
  {
    v3 = +[FATField fieldWithIndex:1 type:16 optional:1 name:@"bodyHash"];
    v4 = +[FATField fieldWithIndex:2, 8, 1, @"size", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:16 optional:1 name:@"body"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_12428;
    structFields_structFields_12428 = v6;

    v2 = (void *)structFields_structFields_12428;
  }
  return v2;
}

+ (id)structName
{
  return @"Data";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_bodyHash, 0);
}

- (void)setBody:(id)a3
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setSize:(id)a3
{
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setBodyHash:(id)a3
{
}

- (NSData)bodyHash
{
  return self->_bodyHash;
}

@end