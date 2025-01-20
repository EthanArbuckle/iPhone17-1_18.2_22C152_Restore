@interface EDAMManageNoteSharesParameters
+ (id)structFields;
+ (id)structName;
- (NSArray)invitationsToUnshare;
- (NSArray)invitationsToUpdate;
- (NSArray)membershipsToUnshare;
- (NSArray)membershipsToUpdate;
- (NSString)noteGuid;
- (void)setInvitationsToUnshare:(id)a3;
- (void)setInvitationsToUpdate:(id)a3;
- (void)setMembershipsToUnshare:(id)a3;
- (void)setMembershipsToUpdate:(id)a3;
- (void)setNoteGuid:(id)a3;
@end

@implementation EDAMManageNoteSharesParameters

+ (id)structFields
{
  v15[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1908;
  if (!structFields_structFields_1908)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"noteGuid"];
    v4 = +[FATField fieldWithIndex:type:optional:name:structClass:](FATField, "fieldWithIndex:type:optional:name:structClass:", 0, 12, 1, 0, objc_opt_class(), v3);
    v5 = +[FATField fieldWithIndex:2 type:15 optional:1 name:@"membershipsToUpdate" valueField:v4];
    v15[1] = v5;
    v6 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v7 = +[FATField fieldWithIndex:3 type:15 optional:1 name:@"invitationsToUpdate" valueField:v6];
    v15[2] = v7;
    v8 = +[FATField fieldWithIndex:0 type:8 optional:1 name:0];
    v9 = +[FATField fieldWithIndex:4 type:15 optional:1 name:@"membershipsToUnshare" valueField:v8];
    v15[3] = v9;
    v10 = +[FATField fieldWithIndex:0 type:10 optional:1 name:0];
    v11 = +[FATField fieldWithIndex:5 type:15 optional:1 name:@"invitationsToUnshare" valueField:v10];
    v15[4] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:5];
    v13 = (void *)structFields_structFields_1908;
    structFields_structFields_1908 = v12;

    v2 = (void *)structFields_structFields_1908;
  }
  return v2;
}

+ (id)structName
{
  return @"ManageNoteSharesParameters";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationsToUnshare, 0);
  objc_storeStrong((id *)&self->_membershipsToUnshare, 0);
  objc_storeStrong((id *)&self->_invitationsToUpdate, 0);
  objc_storeStrong((id *)&self->_membershipsToUpdate, 0);
  objc_storeStrong((id *)&self->_noteGuid, 0);
}

- (void)setInvitationsToUnshare:(id)a3
{
}

- (NSArray)invitationsToUnshare
{
  return self->_invitationsToUnshare;
}

- (void)setMembershipsToUnshare:(id)a3
{
}

- (NSArray)membershipsToUnshare
{
  return self->_membershipsToUnshare;
}

- (void)setInvitationsToUpdate:(id)a3
{
}

- (NSArray)invitationsToUpdate
{
  return self->_invitationsToUpdate;
}

- (void)setMembershipsToUpdate:(id)a3
{
}

- (NSArray)membershipsToUpdate
{
  return self->_membershipsToUpdate;
}

- (void)setNoteGuid:(id)a3
{
}

- (NSString)noteGuid
{
  return self->_noteGuid;
}

@end