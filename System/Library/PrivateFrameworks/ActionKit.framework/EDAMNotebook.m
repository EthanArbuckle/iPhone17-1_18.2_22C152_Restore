@interface EDAMNotebook
+ (id)structFields;
+ (id)structName;
- (EDAMBusinessNotebook)businessNotebook;
- (EDAMNotebookRecipientSettings)recipientSettings;
- (EDAMNotebookRestrictions)restrictions;
- (EDAMPublishing)publishing;
- (EDAMUser)contact;
- (NSArray)sharedNotebookIds;
- (NSArray)sharedNotebooks;
- (NSNumber)defaultNotebook;
- (NSNumber)published;
- (NSNumber)serviceCreated;
- (NSNumber)serviceUpdated;
- (NSNumber)updateSequenceNum;
- (NSString)guid;
- (NSString)name;
- (NSString)stack;
- (void)setBusinessNotebook:(id)a3;
- (void)setContact:(id)a3;
- (void)setDefaultNotebook:(id)a3;
- (void)setGuid:(id)a3;
- (void)setName:(id)a3;
- (void)setPublished:(id)a3;
- (void)setPublishing:(id)a3;
- (void)setRecipientSettings:(id)a3;
- (void)setRestrictions:(id)a3;
- (void)setServiceCreated:(id)a3;
- (void)setServiceUpdated:(id)a3;
- (void)setSharedNotebookIds:(id)a3;
- (void)setSharedNotebooks:(id)a3;
- (void)setStack:(id)a3;
- (void)setUpdateSequenceNum:(id)a3;
@end

@implementation EDAMNotebook

+ (id)structFields
{
  v23[15] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2407;
  if (!structFields_structFields_2407)
  {
    v22 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"guid"];
    v23[0] = v22;
    v21 = +[FATField fieldWithIndex:2 type:11 optional:1 name:@"name"];
    v23[1] = v21;
    v20 = +[FATField fieldWithIndex:5 type:8 optional:1 name:@"updateSequenceNum"];
    v23[2] = v20;
    v19 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"defaultNotebook"];
    v23[3] = v19;
    v18 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"serviceCreated"];
    v23[4] = v18;
    v17 = +[FATField fieldWithIndex:8 type:10 optional:1 name:@"serviceUpdated"];
    v23[5] = v17;
    v16 = +[FATField fieldWithIndex:10 type:12 optional:1 name:@"publishing" structClass:objc_opt_class()];
    v23[6] = v16;
    v3 = +[FATField fieldWithIndex:11 type:2 optional:1 name:@"published"];
    v23[7] = v3;
    v4 = +[FATField fieldWithIndex:12 type:11 optional:1 name:@"stack"];
    v23[8] = v4;
    v5 = +[FATField fieldWithIndex:0 type:10 optional:1 name:0];
    v6 = +[FATField fieldWithIndex:13 type:15 optional:1 name:@"sharedNotebookIds" valueField:v5];
    v23[9] = v6;
    v7 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v8 = +[FATField fieldWithIndex:14 type:15 optional:1 name:@"sharedNotebooks" valueField:v7];
    v23[10] = v8;
    v9 = +[FATField fieldWithIndex:15 type:12 optional:1 name:@"businessNotebook" structClass:objc_opt_class()];
    v23[11] = v9;
    v10 = +[FATField fieldWithIndex:16 type:12 optional:1 name:@"contact" structClass:objc_opt_class()];
    v23[12] = v10;
    v11 = +[FATField fieldWithIndex:17 type:12 optional:1 name:@"restrictions" structClass:objc_opt_class()];
    v23[13] = v11;
    v12 = +[FATField fieldWithIndex:18 type:12 optional:1 name:@"recipientSettings" structClass:objc_opt_class()];
    v23[14] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:15];
    v14 = (void *)structFields_structFields_2407;
    structFields_structFields_2407 = v13;

    v2 = (void *)structFields_structFields_2407;
  }
  return v2;
}

+ (id)structName
{
  return @"Notebook";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientSettings, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_businessNotebook, 0);
  objc_storeStrong((id *)&self->_sharedNotebooks, 0);
  objc_storeStrong((id *)&self->_sharedNotebookIds, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_published, 0);
  objc_storeStrong((id *)&self->_publishing, 0);
  objc_storeStrong((id *)&self->_serviceUpdated, 0);
  objc_storeStrong((id *)&self->_serviceCreated, 0);
  objc_storeStrong((id *)&self->_defaultNotebook, 0);
  objc_storeStrong((id *)&self->_updateSequenceNum, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setRecipientSettings:(id)a3
{
}

- (EDAMNotebookRecipientSettings)recipientSettings
{
  return self->_recipientSettings;
}

- (void)setRestrictions:(id)a3
{
}

- (EDAMNotebookRestrictions)restrictions
{
  return self->_restrictions;
}

- (void)setContact:(id)a3
{
}

- (EDAMUser)contact
{
  return self->_contact;
}

- (void)setBusinessNotebook:(id)a3
{
}

- (EDAMBusinessNotebook)businessNotebook
{
  return self->_businessNotebook;
}

- (void)setSharedNotebooks:(id)a3
{
}

- (NSArray)sharedNotebooks
{
  return self->_sharedNotebooks;
}

- (void)setSharedNotebookIds:(id)a3
{
}

- (NSArray)sharedNotebookIds
{
  return self->_sharedNotebookIds;
}

- (void)setStack:(id)a3
{
}

- (NSString)stack
{
  return self->_stack;
}

- (void)setPublished:(id)a3
{
}

- (NSNumber)published
{
  return self->_published;
}

- (void)setPublishing:(id)a3
{
}

- (EDAMPublishing)publishing
{
  return self->_publishing;
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

- (void)setDefaultNotebook:(id)a3
{
}

- (NSNumber)defaultNotebook
{
  return self->_defaultNotebook;
}

- (void)setUpdateSequenceNum:(id)a3
{
}

- (NSNumber)updateSequenceNum
{
  return self->_updateSequenceNum;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

@end