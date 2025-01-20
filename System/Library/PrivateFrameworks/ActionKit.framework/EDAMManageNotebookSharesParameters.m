@interface EDAMManageNotebookSharesParameters
+ (id)structFields;
+ (id)structName;
- (NSArray)invitationsToCreateOrUpdate;
- (NSArray)membershipsToUpdate;
- (NSArray)unshares;
- (NSString)inviteMessage;
- (NSString)notebookGuid;
- (void)setInvitationsToCreateOrUpdate:(id)a3;
- (void)setInviteMessage:(id)a3;
- (void)setMembershipsToUpdate:(id)a3;
- (void)setNotebookGuid:(id)a3;
- (void)setUnshares:(id)a3;
@end

@implementation EDAMManageNotebookSharesParameters

+ (id)structFields
{
  v14[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1694;
  if (!structFields_structFields_1694)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"notebookGuid"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"inviteMessage", v3 type optional name];
    v14[1] = v4;
    v5 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v6 = +[FATField fieldWithIndex:3 type:15 optional:1 name:@"membershipsToUpdate" valueField:v5];
    v14[2] = v6;
    v7 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v8 = +[FATField fieldWithIndex:4 type:15 optional:1 name:@"invitationsToCreateOrUpdate" valueField:v7];
    v14[3] = v8;
    v9 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v10 = +[FATField fieldWithIndex:5 type:15 optional:1 name:@"unshares" valueField:v9];
    v14[4] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:5];
    v12 = (void *)structFields_structFields_1694;
    structFields_structFields_1694 = v11;

    v2 = (void *)structFields_structFields_1694;
  }
  return v2;
}

+ (id)structName
{
  return @"ManageNotebookSharesParameters";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unshares, 0);
  objc_storeStrong((id *)&self->_invitationsToCreateOrUpdate, 0);
  objc_storeStrong((id *)&self->_membershipsToUpdate, 0);
  objc_storeStrong((id *)&self->_inviteMessage, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
}

- (void)setUnshares:(id)a3
{
}

- (NSArray)unshares
{
  return self->_unshares;
}

- (void)setInvitationsToCreateOrUpdate:(id)a3
{
}

- (NSArray)invitationsToCreateOrUpdate
{
  return self->_invitationsToCreateOrUpdate;
}

- (void)setMembershipsToUpdate:(id)a3
{
}

- (NSArray)membershipsToUpdate
{
  return self->_membershipsToUpdate;
}

- (void)setInviteMessage:(id)a3
{
}

- (NSString)inviteMessage
{
  return self->_inviteMessage;
}

- (void)setNotebookGuid:(id)a3
{
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

@end