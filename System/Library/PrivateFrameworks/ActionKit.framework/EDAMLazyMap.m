@interface EDAMLazyMap
+ (id)structFields;
+ (id)structName;
- (NSDictionary)fullMap;
- (NSSet)keysOnly;
- (void)setFullMap:(id)a3;
- (void)setKeysOnly:(id)a3;
@end

@implementation EDAMLazyMap

+ (id)structFields
{
  v11[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1313;
  if (!structFields_structFields_1313)
  {
    v3 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v4 = +[FATField fieldWithIndex:1 type:14 optional:1 name:@"keysOnly" valueField:v3];
    v11[0] = v4;
    v5 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v6 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v7 = +[FATField fieldWithIndex:2 type:13 optional:1 name:@"fullMap" keyField:v5 valueField:v6];
    v11[1] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    v9 = (void *)structFields_structFields_1313;
    structFields_structFields_1313 = v8;

    v2 = (void *)structFields_structFields_1313;
  }
  return v2;
}

+ (id)structName
{
  return @"LazyMap";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullMap, 0);
  objc_storeStrong((id *)&self->_keysOnly, 0);
}

- (void)setFullMap:(id)a3
{
}

- (NSDictionary)fullMap
{
  return self->_fullMap;
}

- (void)setKeysOnly:(id)a3
{
}

- (NSSet)keysOnly
{
  return self->_keysOnly;
}

@end