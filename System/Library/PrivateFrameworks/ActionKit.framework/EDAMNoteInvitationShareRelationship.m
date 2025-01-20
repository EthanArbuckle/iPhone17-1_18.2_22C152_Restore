@interface EDAMNoteInvitationShareRelationship
+ (id)structFields;
+ (id)structName;
- (NSNumber)privilege;
- (NSNumber)recipientIdentityId;
- (NSNumber)sharerUserId;
- (NSString)displayName;
- (void)setDisplayName:(id)a3;
- (void)setPrivilege:(id)a3;
- (void)setRecipientIdentityId:(id)a3;
- (void)setSharerUserId:(id)a3;
@end

@implementation EDAMNoteInvitationShareRelationship

+ (id)structFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1879;
  if (!structFields_structFields_1879)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"displayName"];
    v10[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:10 optional:1 name:@"recipientIdentityId"];
    v10[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"privilege"];
    v10[2] = v5;
    v6 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"sharerUserId"];
    v10[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v8 = (void *)structFields_structFields_1879;
    structFields_structFields_1879 = v7;

    v2 = (void *)structFields_structFields_1879;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteInvitationShareRelationship";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharerUserId, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_recipientIdentityId, 0);
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

- (void)setRecipientIdentityId:(id)a3
{
}

- (NSNumber)recipientIdentityId
{
  return self->_recipientIdentityId;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

@end