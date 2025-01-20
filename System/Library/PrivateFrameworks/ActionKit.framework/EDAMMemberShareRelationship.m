@interface EDAMMemberShareRelationship
+ (id)structFields;
+ (id)structName;
- (EDAMShareRelationshipRestrictions)restrictions;
- (NSNumber)bestPrivilege;
- (NSNumber)individualPrivilege;
- (NSNumber)recipientUserId;
- (NSNumber)sharerUserId;
- (NSString)displayName;
- (void)setBestPrivilege:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIndividualPrivilege:(id)a3;
- (void)setRecipientUserId:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setSharerUserId:(id)a3;
@end

@implementation EDAMMemberShareRelationship

+ (id)structFields
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1616;
  if (!structFields_structFields_1616)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"displayName"];
    v12[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:8 optional:1 name:@"recipientUserId"];
    v12[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"bestPrivilege"];
    v12[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:8 optional:1 name:@"individualPrivilege"];
    v12[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:12 optional:1 name:@"restrictions" structClass:objc_opt_class()];
    v12[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:8 optional:1 name:@"sharerUserId"];
    v12[5] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
    v10 = (void *)structFields_structFields_1616;
    structFields_structFields_1616 = v9;

    v2 = (void *)structFields_structFields_1616;
  }
  return v2;
}

+ (id)structName
{
  return @"MemberShareRelationship";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharerUserId, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_individualPrivilege, 0);
  objc_storeStrong((id *)&self->_bestPrivilege, 0);
  objc_storeStrong((id *)&self->_recipientUserId, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)setSharerUserId:(id)a3
{
}

- (NSNumber)sharerUserId
{
  return self->_sharerUserId;
}

- (void)setRestrictions:(id)a3
{
}

- (EDAMShareRelationshipRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setIndividualPrivilege:(id)a3
{
}

- (NSNumber)individualPrivilege
{
  return self->_individualPrivilege;
}

- (void)setBestPrivilege:(id)a3
{
}

- (NSNumber)bestPrivilege
{
  return self->_bestPrivilege;
}

- (void)setRecipientUserId:(id)a3
{
}

- (NSNumber)recipientUserId
{
  return self->_recipientUserId;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

@end