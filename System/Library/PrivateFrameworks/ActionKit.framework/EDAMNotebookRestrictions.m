@interface EDAMNotebookRestrictions
+ (id)structFields;
+ (id)structName;
- (NSNumber)expungeWhichSharedNotebookRestrictions;
- (NSNumber)noCreateNotes;
- (NSNumber)noCreateSharedNotebooks;
- (NSNumber)noCreateTags;
- (NSNumber)noEmailNotes;
- (NSNumber)noExpungeNotebook;
- (NSNumber)noExpungeNotes;
- (NSNumber)noExpungeTags;
- (NSNumber)noPublishToBusinessLibrary;
- (NSNumber)noPublishToPublic;
- (NSNumber)noReadNotes;
- (NSNumber)noRenameNotebook;
- (NSNumber)noSendMessageToRecipients;
- (NSNumber)noSetDefaultNotebook;
- (NSNumber)noSetNotebookStack;
- (NSNumber)noSetParentTag;
- (NSNumber)noShareNotes;
- (NSNumber)noShareNotesWithBusiness;
- (NSNumber)noUpdateNotebook;
- (NSNumber)noUpdateNotes;
- (NSNumber)noUpdateTags;
- (NSNumber)updateWhichSharedNotebookRestrictions;
- (void)setExpungeWhichSharedNotebookRestrictions:(id)a3;
- (void)setNoCreateNotes:(id)a3;
- (void)setNoCreateSharedNotebooks:(id)a3;
- (void)setNoCreateTags:(id)a3;
- (void)setNoEmailNotes:(id)a3;
- (void)setNoExpungeNotebook:(id)a3;
- (void)setNoExpungeNotes:(id)a3;
- (void)setNoExpungeTags:(id)a3;
- (void)setNoPublishToBusinessLibrary:(id)a3;
- (void)setNoPublishToPublic:(id)a3;
- (void)setNoReadNotes:(id)a3;
- (void)setNoRenameNotebook:(id)a3;
- (void)setNoSendMessageToRecipients:(id)a3;
- (void)setNoSetDefaultNotebook:(id)a3;
- (void)setNoSetNotebookStack:(id)a3;
- (void)setNoSetParentTag:(id)a3;
- (void)setNoShareNotes:(id)a3;
- (void)setNoShareNotesWithBusiness:(id)a3;
- (void)setNoUpdateNotebook:(id)a3;
- (void)setNoUpdateNotes:(id)a3;
- (void)setNoUpdateTags:(id)a3;
- (void)setUpdateWhichSharedNotebookRestrictions:(id)a3;
@end

@implementation EDAMNotebookRestrictions

+ (id)structFields
{
  v28[22] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2222;
  if (!structFields_structFields_2222)
  {
    v27 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"noReadNotes"];
    v28[0] = v27;
    v26 = +[FATField fieldWithIndex:2 type:2 optional:1 name:@"noCreateNotes"];
    v28[1] = v26;
    v25 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"noUpdateNotes"];
    v28[2] = v25;
    v24 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"noExpungeNotes"];
    v28[3] = v24;
    v23 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"noShareNotes"];
    v28[4] = v23;
    v22 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"noEmailNotes"];
    v28[5] = v22;
    v21 = +[FATField fieldWithIndex:7 type:2 optional:1 name:@"noSendMessageToRecipients"];
    v28[6] = v21;
    v20 = +[FATField fieldWithIndex:8 type:2 optional:1 name:@"noUpdateNotebook"];
    v28[7] = v20;
    v19 = +[FATField fieldWithIndex:9 type:2 optional:1 name:@"noExpungeNotebook"];
    v28[8] = v19;
    v18 = +[FATField fieldWithIndex:10 type:2 optional:1 name:@"noSetDefaultNotebook"];
    v28[9] = v18;
    v17 = +[FATField fieldWithIndex:11 type:2 optional:1 name:@"noSetNotebookStack"];
    v28[10] = v17;
    v16 = +[FATField fieldWithIndex:12 type:2 optional:1 name:@"noPublishToPublic"];
    v28[11] = v16;
    v3 = +[FATField fieldWithIndex:13 type:2 optional:1 name:@"noPublishToBusinessLibrary"];
    v28[12] = v3;
    v4 = +[FATField fieldWithIndex:14 type:2 optional:1 name:@"noCreateTags"];
    v28[13] = v4;
    v5 = +[FATField fieldWithIndex:15 type:2 optional:1 name:@"noUpdateTags"];
    v28[14] = v5;
    v6 = +[FATField fieldWithIndex:16 type:2 optional:1 name:@"noExpungeTags"];
    v28[15] = v6;
    v7 = +[FATField fieldWithIndex:17 type:2 optional:1 name:@"noSetParentTag"];
    v28[16] = v7;
    v8 = +[FATField fieldWithIndex:18 type:2 optional:1 name:@"noCreateSharedNotebooks"];
    v28[17] = v8;
    v9 = +[FATField fieldWithIndex:19 type:8 optional:1 name:@"updateWhichSharedNotebookRestrictions"];
    v28[18] = v9;
    v10 = +[FATField fieldWithIndex:20 type:8 optional:1 name:@"expungeWhichSharedNotebookRestrictions"];
    v28[19] = v10;
    v11 = +[FATField fieldWithIndex:21 type:2 optional:1 name:@"noShareNotesWithBusiness"];
    v28[20] = v11;
    v12 = +[FATField fieldWithIndex:22 type:2 optional:1 name:@"noRenameNotebook"];
    v28[21] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:22];
    v14 = (void *)structFields_structFields_2222;
    structFields_structFields_2222 = v13;

    v2 = (void *)structFields_structFields_2222;
  }
  return v2;
}

+ (id)structName
{
  return @"NotebookRestrictions";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noRenameNotebook, 0);
  objc_storeStrong((id *)&self->_noShareNotesWithBusiness, 0);
  objc_storeStrong((id *)&self->_expungeWhichSharedNotebookRestrictions, 0);
  objc_storeStrong((id *)&self->_updateWhichSharedNotebookRestrictions, 0);
  objc_storeStrong((id *)&self->_noCreateSharedNotebooks, 0);
  objc_storeStrong((id *)&self->_noSetParentTag, 0);
  objc_storeStrong((id *)&self->_noExpungeTags, 0);
  objc_storeStrong((id *)&self->_noUpdateTags, 0);
  objc_storeStrong((id *)&self->_noCreateTags, 0);
  objc_storeStrong((id *)&self->_noPublishToBusinessLibrary, 0);
  objc_storeStrong((id *)&self->_noPublishToPublic, 0);
  objc_storeStrong((id *)&self->_noSetNotebookStack, 0);
  objc_storeStrong((id *)&self->_noSetDefaultNotebook, 0);
  objc_storeStrong((id *)&self->_noExpungeNotebook, 0);
  objc_storeStrong((id *)&self->_noUpdateNotebook, 0);
  objc_storeStrong((id *)&self->_noSendMessageToRecipients, 0);
  objc_storeStrong((id *)&self->_noEmailNotes, 0);
  objc_storeStrong((id *)&self->_noShareNotes, 0);
  objc_storeStrong((id *)&self->_noExpungeNotes, 0);
  objc_storeStrong((id *)&self->_noUpdateNotes, 0);
  objc_storeStrong((id *)&self->_noCreateNotes, 0);
  objc_storeStrong((id *)&self->_noReadNotes, 0);
}

- (void)setNoRenameNotebook:(id)a3
{
}

- (NSNumber)noRenameNotebook
{
  return self->_noRenameNotebook;
}

- (void)setNoShareNotesWithBusiness:(id)a3
{
}

- (NSNumber)noShareNotesWithBusiness
{
  return self->_noShareNotesWithBusiness;
}

- (void)setExpungeWhichSharedNotebookRestrictions:(id)a3
{
}

- (NSNumber)expungeWhichSharedNotebookRestrictions
{
  return self->_expungeWhichSharedNotebookRestrictions;
}

- (void)setUpdateWhichSharedNotebookRestrictions:(id)a3
{
}

- (NSNumber)updateWhichSharedNotebookRestrictions
{
  return self->_updateWhichSharedNotebookRestrictions;
}

- (void)setNoCreateSharedNotebooks:(id)a3
{
}

- (NSNumber)noCreateSharedNotebooks
{
  return self->_noCreateSharedNotebooks;
}

- (void)setNoSetParentTag:(id)a3
{
}

- (NSNumber)noSetParentTag
{
  return self->_noSetParentTag;
}

- (void)setNoExpungeTags:(id)a3
{
}

- (NSNumber)noExpungeTags
{
  return self->_noExpungeTags;
}

- (void)setNoUpdateTags:(id)a3
{
}

- (NSNumber)noUpdateTags
{
  return self->_noUpdateTags;
}

- (void)setNoCreateTags:(id)a3
{
}

- (NSNumber)noCreateTags
{
  return self->_noCreateTags;
}

- (void)setNoPublishToBusinessLibrary:(id)a3
{
}

- (NSNumber)noPublishToBusinessLibrary
{
  return self->_noPublishToBusinessLibrary;
}

- (void)setNoPublishToPublic:(id)a3
{
}

- (NSNumber)noPublishToPublic
{
  return self->_noPublishToPublic;
}

- (void)setNoSetNotebookStack:(id)a3
{
}

- (NSNumber)noSetNotebookStack
{
  return self->_noSetNotebookStack;
}

- (void)setNoSetDefaultNotebook:(id)a3
{
}

- (NSNumber)noSetDefaultNotebook
{
  return self->_noSetDefaultNotebook;
}

- (void)setNoExpungeNotebook:(id)a3
{
}

- (NSNumber)noExpungeNotebook
{
  return self->_noExpungeNotebook;
}

- (void)setNoUpdateNotebook:(id)a3
{
}

- (NSNumber)noUpdateNotebook
{
  return self->_noUpdateNotebook;
}

- (void)setNoSendMessageToRecipients:(id)a3
{
}

- (NSNumber)noSendMessageToRecipients
{
  return self->_noSendMessageToRecipients;
}

- (void)setNoEmailNotes:(id)a3
{
}

- (NSNumber)noEmailNotes
{
  return self->_noEmailNotes;
}

- (void)setNoShareNotes:(id)a3
{
}

- (NSNumber)noShareNotes
{
  return self->_noShareNotes;
}

- (void)setNoExpungeNotes:(id)a3
{
}

- (NSNumber)noExpungeNotes
{
  return self->_noExpungeNotes;
}

- (void)setNoUpdateNotes:(id)a3
{
}

- (NSNumber)noUpdateNotes
{
  return self->_noUpdateNotes;
}

- (void)setNoCreateNotes:(id)a3
{
}

- (NSNumber)noCreateNotes
{
  return self->_noCreateNotes;
}

- (void)setNoReadNotes:(id)a3
{
}

- (NSNumber)noReadNotes
{
  return self->_noReadNotes;
}

@end