@interface EDAMShareRelationships
+ (id)structFields;
+ (id)structName;
- (EDAMShareRelationshipRestrictions)invitationRestrictions;
- (NSArray)invitations;
- (NSArray)memberships;
- (void)setInvitationRestrictions:(id)a3;
- (void)setInvitations:(id)a3;
- (void)setMemberships:(id)a3;
@end

@implementation EDAMShareRelationships

+ (id)structFields
{
  v11[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1659;
  if (!structFields_structFields_1659)
  {
    v3 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v4 = +[FATField fieldWithIndex:1 type:15 optional:1 name:@"invitations" valueField:v3];
    v5 = +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class(), v4);
    v6 = +[FATField fieldWithIndex:2 type:15 optional:1 name:@"memberships" valueField:v5];
    v11[1] = v6;
    v7 = +[FATField fieldWithIndex:3 type:12 optional:1 name:@"invitationRestrictions" structClass:objc_opt_class()];
    v11[2] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
    v9 = (void *)structFields_structFields_1659;
    structFields_structFields_1659 = v8;

    v2 = (void *)structFields_structFields_1659;
  }
  return v2;
}

+ (id)structName
{
  return @"ShareRelationships";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationRestrictions, 0);
  objc_storeStrong((id *)&self->_memberships, 0);
  objc_storeStrong((id *)&self->_invitations, 0);
}

- (void)setInvitationRestrictions:(id)a3
{
}

- (EDAMShareRelationshipRestrictions)invitationRestrictions
{
  return self->_invitationRestrictions;
}

- (void)setMemberships:(id)a3
{
}

- (NSArray)memberships
{
  return self->_memberships;
}

- (void)setInvitations:(id)a3
{
}

- (NSArray)invitations
{
  return self->_invitations;
}

@end