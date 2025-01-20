@interface EDAMInvitationShareRelationship
+ (id)structFields;
+ (id)structName;
- (EDAMUserIdentity)recipientUserIdentity;
- (NSNumber)privilege;
- (NSNumber)sharerUserId;
- (NSString)displayName;
- (void)setDisplayName:(id)a3;
- (void)setPrivilege:(id)a3;
- (void)setRecipientUserIdentity:(id)a3;
- (void)setSharerUserId:(id)a3;
@end

@implementation EDAMInvitationShareRelationship

+ (id)structFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1581;
  if (!structFields_structFields_1581)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"displayName"];
    v10[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:12 optional:1 name:@"recipientUserIdentity" structClass:objc_opt_class()];
    v10[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"privilege"];
    v10[2] = v5;
    v6 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"sharerUserId"];
    v10[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v8 = (void *)structFields_structFields_1581;
    structFields_structFields_1581 = v7;

    v2 = (void *)structFields_structFields_1581;
  }
  return v2;
}

+ (id)structName
{
  return @"InvitationShareRelationship";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharerUserId, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_recipientUserIdentity, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)setSharerUserId:(id)a3
{
}

- (NSNumber)sharerUserId
{
  return self->_sharerUserId;
}

- (void)setPrivilege:(id)a3
{
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setRecipientUserIdentity:(id)a3
{
}

- (EDAMUserIdentity)recipientUserIdentity
{
  return self->_recipientUserIdentity;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

@end