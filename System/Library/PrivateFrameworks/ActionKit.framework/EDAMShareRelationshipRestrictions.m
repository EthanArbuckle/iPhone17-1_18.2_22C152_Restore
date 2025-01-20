@interface EDAMShareRelationshipRestrictions
+ (id)structFields;
+ (id)structName;
- (NSNumber)noSetFullAccess;
- (NSNumber)noSetModify;
- (NSNumber)noSetReadOnly;
- (NSNumber)noSetReadPlusActivity;
- (void)setNoSetFullAccess:(id)a3;
- (void)setNoSetModify:(id)a3;
- (void)setNoSetReadOnly:(id)a3;
- (void)setNoSetReadPlusActivity:(id)a3;
@end

@implementation EDAMShareRelationshipRestrictions

+ (id)structFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1540;
  if (!structFields_structFields_1540)
  {
    v3 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"noSetReadOnly"];
    v10[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:2 optional:1 name:@"noSetReadPlusActivity"];
    v10[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"noSetModify"];
    v10[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"noSetFullAccess"];
    v10[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v8 = (void *)structFields_structFields_1540;
    structFields_structFields_1540 = v7;

    v2 = (void *)structFields_structFields_1540;
  }
  return v2;
}

+ (id)structName
{
  return @"ShareRelationshipRestrictions";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noSetFullAccess, 0);
  objc_storeStrong((id *)&self->_noSetModify, 0);
  objc_storeStrong((id *)&self->_noSetReadPlusActivity, 0);
  objc_storeStrong((id *)&self->_noSetReadOnly, 0);
}

- (void)setNoSetFullAccess:(id)a3
{
}

- (NSNumber)noSetFullAccess
{
  return self->_noSetFullAccess;
}

- (void)setNoSetModify:(id)a3
{
}

- (NSNumber)noSetModify
{
  return self->_noSetModify;
}

- (void)setNoSetReadPlusActivity:(id)a3
{
}

- (NSNumber)noSetReadPlusActivity
{
  return self->_noSetReadPlusActivity;
}

- (void)setNoSetReadOnly:(id)a3
{
}

- (NSNumber)noSetReadOnly
{
  return self->_noSetReadOnly;
}

@end