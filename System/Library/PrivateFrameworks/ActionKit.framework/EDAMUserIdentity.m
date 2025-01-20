@interface EDAMUserIdentity
+ (id)structFields;
+ (id)structName;
- (NSNumber)longIdentifier;
- (NSNumber)type;
- (NSString)stringIdentifier;
- (void)setLongIdentifier:(id)a3;
- (void)setStringIdentifier:(id)a3;
- (void)setType:(id)a3;
@end

@implementation EDAMUserIdentity

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2760;
  if (!structFields_structFields_2760)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"type"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"stringIdentifier", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:10 optional:1 name:@"longIdentifier"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_2760;
    structFields_structFields_2760 = v6;

    v2 = (void *)structFields_structFields_2760;
  }
  return v2;
}

+ (id)structName
{
  return @"UserIdentity";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longIdentifier, 0);
  objc_storeStrong((id *)&self->_stringIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setLongIdentifier:(id)a3
{
}

- (NSNumber)longIdentifier
{
  return self->_longIdentifier;
}

- (void)setStringIdentifier:(id)a3
{
}

- (NSString)stringIdentifier
{
  return self->_stringIdentifier;
}

- (void)setType:(id)a3
{
}

- (NSNumber)type
{
  return self->_type;
}

@end