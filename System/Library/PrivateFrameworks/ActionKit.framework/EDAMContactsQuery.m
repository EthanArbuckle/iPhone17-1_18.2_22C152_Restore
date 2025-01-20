@interface EDAMContactsQuery
+ (id)structFields;
+ (id)structName;
- (NSNumber)maxEntries;
- (NSString)prefix;
- (void)setMaxEntries:(id)a3;
- (void)setPrefix:(id)a3;
@end

@implementation EDAMContactsQuery

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1398;
  if (!structFields_structFields_1398)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"maxEntries"];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"prefix"];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_1398;
    structFields_structFields_1398 = v5;

    v2 = (void *)structFields_structFields_1398;
  }
  return v2;
}

+ (id)structName
{
  return @"ContactsQuery";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_maxEntries, 0);
}

- (void)setPrefix:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setMaxEntries:(id)a3
{
}

- (NSNumber)maxEntries
{
  return self->_maxEntries;
}

@end