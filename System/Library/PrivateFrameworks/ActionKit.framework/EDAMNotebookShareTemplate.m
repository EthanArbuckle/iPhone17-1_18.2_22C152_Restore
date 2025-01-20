@interface EDAMNotebookShareTemplate
+ (id)structFields;
+ (id)structName;
- (NSArray)recipientContacts;
- (NSNumber)privilege;
- (NSNumber)recipientThreadId;
- (NSString)notebookGuid;
- (void)setNotebookGuid:(id)a3;
- (void)setPrivilege:(id)a3;
- (void)setRecipientContacts:(id)a3;
- (void)setRecipientThreadId:(id)a3;
@end

@implementation EDAMNotebookShareTemplate

+ (id)structFields
{
  v11[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1815;
  if (!structFields_structFields_1815)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"notebookGuid"];
    v11[0] = v3;
    v4 = +[FATField fieldWithIndex:4 type:10 optional:1 name:@"recipientThreadId"];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v6 = +[FATField fieldWithIndex:2 type:15 optional:1 name:@"recipientContacts" valueField:v5];
    v11[2] = v6;
    v7 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"privilege"];
    v11[3] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
    v9 = (void *)structFields_structFields_1815;
    structFields_structFields_1815 = v8;

    v2 = (void *)structFields_structFields_1815;
  }
  return v2;
}

+ (id)structName
{
  return @"NotebookShareTemplate";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_recipientContacts, 0);
  objc_storeStrong((id *)&self->_recipientThreadId, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
}

- (void)setPrivilege:(id)a3
{
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setRecipientContacts:(id)a3
{
}

- (NSArray)recipientContacts
{
  return self->_recipientContacts;
}

- (void)setRecipientThreadId:(id)a3
{
}

- (NSNumber)recipientThreadId
{
  return self->_recipientThreadId;
}

- (void)setNotebookGuid:(id)a3
{
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

@end