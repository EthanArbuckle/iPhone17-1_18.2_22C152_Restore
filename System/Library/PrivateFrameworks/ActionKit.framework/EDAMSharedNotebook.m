@interface EDAMSharedNotebook
+ (id)structFields;
+ (id)structName;
- (EDAMSharedNotebookRecipientSettings)recipientSettings;
- (NSNumber)id;
- (NSNumber)notebookModifiable;
- (NSNumber)privilege;
- (NSNumber)recipientIdentityId;
- (NSNumber)recipientUserId;
- (NSNumber)serviceAssigned;
- (NSNumber)serviceCreated;
- (NSNumber)serviceUpdated;
- (NSNumber)sharerUserId;
- (NSNumber)userId;
- (NSString)email;
- (NSString)globalId;
- (NSString)notebookGuid;
- (NSString)recipientUsername;
- (NSString)username;
- (void)setEmail:(id)a3;
- (void)setGlobalId:(id)a3;
- (void)setId:(id)a3;
- (void)setNotebookGuid:(id)a3;
- (void)setNotebookModifiable:(id)a3;
- (void)setPrivilege:(id)a3;
- (void)setRecipientIdentityId:(id)a3;
- (void)setRecipientSettings:(id)a3;
- (void)setRecipientUserId:(id)a3;
- (void)setRecipientUsername:(id)a3;
- (void)setServiceAssigned:(id)a3;
- (void)setServiceCreated:(id)a3;
- (void)setServiceUpdated:(id)a3;
- (void)setSharerUserId:(id)a3;
- (void)setUserId:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation EDAMSharedNotebook

+ (id)structFields
{
  v22[16] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2155;
  if (!structFields_structFields_2155)
  {
    v21 = +[FATField fieldWithIndex:1 type:10 optional:1 name:@"id"];
    v22[0] = v21;
    v20 = +[FATField fieldWithIndex:2 type:8 optional:1 name:@"userId"];
    v22[1] = v20;
    v19 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"notebookGuid"];
    v22[2] = v19;
    v18 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"email"];
    v22[3] = v18;
    v17 = +[FATField fieldWithIndex:18 type:10 optional:1 name:@"recipientIdentityId"];
    v22[4] = v17;
    v16 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"notebookModifiable"];
    v22[5] = v16;
    v3 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"serviceCreated"];
    v22[6] = v3;
    v4 = +[FATField fieldWithIndex:10 type:10 optional:1 name:@"serviceUpdated"];
    v22[7] = v4;
    v5 = +[FATField fieldWithIndex:8 type:11 optional:1 name:@"globalId"];
    v22[8] = v5;
    v6 = +[FATField fieldWithIndex:9 type:11 optional:1 name:@"username"];
    v22[9] = v6;
    v7 = +[FATField fieldWithIndex:11 type:8 optional:1 name:@"privilege"];
    v22[10] = v7;
    v8 = +[FATField fieldWithIndex:13 type:12 optional:1 name:@"recipientSettings" structClass:objc_opt_class()];
    v22[11] = v8;
    v9 = +[FATField fieldWithIndex:14 type:8 optional:1 name:@"sharerUserId"];
    v22[12] = v9;
    v10 = +[FATField fieldWithIndex:15 type:11 optional:1 name:@"recipientUsername"];
    v22[13] = v10;
    v11 = +[FATField fieldWithIndex:17 type:8 optional:1 name:@"recipientUserId"];
    v22[14] = v11;
    v12 = +[FATField fieldWithIndex:16 type:10 optional:1 name:@"serviceAssigned"];
    v22[15] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:16];
    v14 = (void *)structFields_structFields_2155;
    structFields_structFields_2155 = v13;

    v2 = (void *)structFields_structFields_2155;
  }
  return v2;
}

+ (id)structName
{
  return @"SharedNotebook";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceAssigned, 0);
  objc_storeStrong((id *)&self->_recipientUserId, 0);
  objc_storeStrong((id *)&self->_recipientUsername, 0);
  objc_storeStrong((id *)&self->_sharerUserId, 0);
  objc_storeStrong((id *)&self->_recipientSettings, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_globalId, 0);
  objc_storeStrong((id *)&self->_serviceUpdated, 0);
  objc_storeStrong((id *)&self->_serviceCreated, 0);
  objc_storeStrong((id *)&self->_notebookModifiable, 0);
  objc_storeStrong((id *)&self->_recipientIdentityId, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

- (void)setServiceAssigned:(id)a3
{
}

- (NSNumber)serviceAssigned
{
  return self->_serviceAssigned;
}

- (void)setRecipientUserId:(id)a3
{
}

- (NSNumber)recipientUserId
{
  return self->_recipientUserId;
}

- (void)setRecipientUsername:(id)a3
{
}

- (NSString)recipientUsername
{
  return self->_recipientUsername;
}

- (void)setSharerUserId:(id)a3
{
}

- (NSNumber)sharerUserId
{
  return self->_sharerUserId;
}

- (void)setRecipientSettings:(id)a3
{
}

- (EDAMSharedNotebookRecipientSettings)recipientSettings
{
  return self->_recipientSettings;
}

- (void)setPrivilege:(id)a3
{
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setGlobalId:(id)a3
{
}

- (NSString)globalId
{
  return self->_globalId;
}

- (void)setServiceUpdated:(id)a3
{
}

- (NSNumber)serviceUpdated
{
  return self->_serviceUpdated;
}

- (void)setServiceCreated:(id)a3
{
}

- (NSNumber)serviceCreated
{
  return self->_serviceCreated;
}

- (void)setNotebookModifiable:(id)a3
{
}

- (NSNumber)notebookModifiable
{
  return self->_notebookModifiable;
}

- (void)setRecipientIdentityId:(id)a3
{
}

- (NSNumber)recipientIdentityId
{
  return self->_recipientIdentityId;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setNotebookGuid:(id)a3
{
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

- (void)setUserId:(id)a3
{
}

- (NSNumber)userId
{
  return self->_userId;
}

- (void)setId:(id)a3
{
}

- (NSNumber)id
{
  return self->_id;
}

@end