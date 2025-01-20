@interface EDAMNoteMemberShareRelationship
+ (id)structFields;
+ (id)structName;
- (EDAMNoteShareRelationshipRestrictions)restrictions;
- (NSNumber)privilege;
- (NSNumber)recipientUserId;
- (NSNumber)sharerUserId;
- (NSString)displayName;
- (void)setDisplayName:(id)a3;
- (void)setPrivilege:(id)a3;
- (void)setRecipientUserId:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setSharerUserId:(id)a3;
@end

@implementation EDAMNoteMemberShareRelationship

+ (id)structFields
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1867;
  if (!structFields_structFields_1867)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"displayName"];
    v4 = +[FATField fieldWithIndex:2, 8, 1, @"recipientUserId", v3 type optional name];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"privilege"];
    v11[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:12 optional:1 name:@"restrictions" structClass:objc_opt_class()];
    v11[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"sharerUserId"];
    v11[4] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
    v9 = (void *)structFields_structFields_1867;
    structFields_structFields_1867 = v8;

    v2 = (void *)structFields_structFields_1867;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteMemberShareRelationship";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharerUserId, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
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

- (EDAMNoteShareRelationshipRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setPrivilege:(id)a3
{
}

- (NSNumber)privilege
{
  return self->_privilege;
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