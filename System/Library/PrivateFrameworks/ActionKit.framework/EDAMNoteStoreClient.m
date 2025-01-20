@interface EDAMNoteStoreClient
- (EDAMNoteStoreClient)initWithInProtocol:(id)a3 outProtocol:(id)a4;
- (EDAMNoteStoreClient)initWithProtocol:(id)a3;
- (id)acquireNoteLock:(id)a3 noteGuid:(id)a4;
- (id)authenticateToSharedNote:(id)a3 noteKey:(id)a4 authenticationToken:(id)a5;
- (id)authenticateToSharedNotebook:(id)a3 authenticationToken:(id)a4;
- (id)copyNote:(id)a3 noteGuid:(id)a4 toNotebookGuid:(id)a5;
- (id)createLinkedNotebook:(id)a3 linkedNotebook:(id)a4;
- (id)createNote:(id)a3 note:(id)a4;
- (id)createNotebook:(id)a3 notebook:(id)a4;
- (id)createOrUpdateNotebookShares:(id)a3 shareTemplate:(id)a4;
- (id)createOrUpdateSharedNotes:(id)a3 shareTemplate:(id)a4;
- (id)createSearch:(id)a3 search:(id)a4;
- (id)createSharedNotebook:(id)a3 sharedNotebook:(id)a4;
- (id)createTag:(id)a3 tag:(id)a4;
- (id)findContacts:(id)a3 query:(id)a4;
- (id)findInBusiness:(id)a3 query:(id)a4;
- (id)findNoteCounts:(id)a3 filter:(id)a4 withTrash:(BOOL)a5;
- (id)findNotes:(id)a3 filter:(id)a4 offset:(int)a5 maxNotes:(int)a6;
- (id)findNotesMetadata:(id)a3 filter:(id)a4 offset:(int)a5 maxNotes:(int)a6 resultSpec:(id)a7;
- (id)findRelated:(id)a3 query:(id)a4 resultSpec:(id)a5;
- (id)findSearchSuggestions:(id)a3 query:(id)a4 resultSpec:(id)a5;
- (id)findTimeZones:(id)a3 timeZoneSpec:(id)a4 maxTimeZones:(int)a5;
- (id)getAds:(id)a3 adParameters:(id)a4;
- (id)getDefaultNotebook:(id)a3;
- (id)getFilteredSyncChunk:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 filter:(id)a6;
- (id)getLinkedAccountSyncState:(id)a3 linkedAccount:(id)a4;
- (id)getLinkedNotebookSyncChunk:(id)a3 linkedNotebook:(id)a4 afterUSN:(int)a5 maxEntries:(int)a6 fullSyncOnly:(BOOL)a7;
- (id)getLinkedNotebookSyncState:(id)a3 linkedNotebook:(id)a4;
- (id)getNote:(id)a3 guid:(id)a4 withContent:(BOOL)a5 withResourcesData:(BOOL)a6 withResourcesRecognition:(BOOL)a7 withResourcesAlternateData:(BOOL)a8;
- (id)getNoteApplicationData:(id)a3 guid:(id)a4;
- (id)getNoteApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5;
- (id)getNoteContent:(id)a3 guid:(id)a4;
- (id)getNoteLockStatus:(id)a3 noteGuid:(id)a4;
- (id)getNoteSearchText:(id)a3 guid:(id)a4 noteOnly:(BOOL)a5 tokenizeForIndexing:(BOOL)a6;
- (id)getNoteShares:(id)a3 noteGuid:(id)a4;
- (id)getNoteSnippets:(id)a3 noteGuids:(id)a4 maxSnippetLength:(int)a5;
- (id)getNoteTagNames:(id)a3 guid:(id)a4;
- (id)getNoteVersion:(id)a3 noteGuid:(id)a4 updateSequenceNum:(int)a5 withResourcesData:(BOOL)a6 withResourcesRecognition:(BOOL)a7 withResourcesAlternateData:(BOOL)a8;
- (id)getNoteWithResultSpec:(id)a3 guid:(id)a4 resultSpec:(id)a5;
- (id)getNotebook:(id)a3 guid:(id)a4;
- (id)getNotebookShares:(id)a3 notebookGuid:(id)a4;
- (id)getNotebookSharesEmailAddresses:(id)a3 notebookGuid:(id)a4 identities:(id)a5 skipUnknownUserIdentities:(BOOL)a6;
- (id)getPreferences:(id)a3 preferenceNames:(id)a4;
- (id)getPublicNotebook:(int)a3 publicUri:(id)a4;
- (id)getRandomAd:(id)a3 adParameters:(id)a4;
- (id)getResource:(id)a3 guid:(id)a4 withData:(BOOL)a5 withRecognition:(BOOL)a6 withAttributes:(BOOL)a7 withAlternateData:(BOOL)a8;
- (id)getResourceAlternateData:(id)a3 guid:(id)a4;
- (id)getResourceApplicationData:(id)a3 guid:(id)a4;
- (id)getResourceApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5;
- (id)getResourceAttributes:(id)a3 guid:(id)a4;
- (id)getResourceByHash:(id)a3 noteGuid:(id)a4 contentHash:(id)a5 withData:(BOOL)a6 withRecognition:(BOOL)a7 withAlternateData:(BOOL)a8;
- (id)getResourceData:(id)a3 guid:(id)a4;
- (id)getResourceRecognition:(id)a3 guid:(id)a4;
- (id)getResourceSearchText:(id)a3 guid:(id)a4;
- (id)getSearch:(id)a3 guid:(id)a4;
- (id)getSharedNotebookByAuth:(id)a3;
- (id)getSyncChunk:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 fullSyncOnly:(BOOL)a6;
- (id)getSyncState:(id)a3;
- (id)getSyncStateWithMetrics:(id)a3 clientMetrics:(id)a4;
- (id)getTag:(id)a3 guid:(id)a4;
- (id)getViewersForNotes:(id)a3 noteGuids:(id)a4;
- (id)joinPublishedBusinessNotebook:(id)a3 notebookGuid:(id)a4;
- (id)listAccessibleBusinessNotebooks:(id)a3;
- (id)listLinkedNotebooks:(id)a3;
- (id)listNoteVersions:(id)a3 noteGuid:(id)a4;
- (id)listNotebooks:(id)a3;
- (id)listPublishedBusinessNotebooks:(id)a3;
- (id)listSearches:(id)a3;
- (id)listSharedNotebooks:(id)a3;
- (id)listTags:(id)a3;
- (id)listTagsByNotebook:(id)a3 notebookGuid:(id)a4;
- (id)manageNoteShares:(id)a3 parameters:(id)a4;
- (id)manageNotebookShares:(id)a3 parameters:(id)a4;
- (id)releaseNoteLock:(id)a3 noteGuid:(id)a4;
- (id)sendLogRequest:(id)a3 logRequest:(id)a4;
- (id)setNotebookRecipientSettings:(id)a3 notebookGuid:(id)a4 recipientSettings:(id)a5;
- (id)shareNote:(id)a3 guid:(id)a4;
- (id)shareNotebook:(id)a3 sharedNotebook:(id)a4 message:(id)a5;
- (id)updateNote:(id)a3 note:(id)a4;
- (id)updateNoteIfUsnMatches:(id)a3 note:(id)a4;
- (int)deleteNote:(id)a3 guid:(id)a4;
- (int)expungeInactiveNotes:(id)a3;
- (int)expungeLinkedNotebook:(id)a3 guid:(id)a4;
- (int)expungeNote:(id)a3 guid:(id)a4;
- (int)expungeNotebook:(id)a3 guid:(id)a4;
- (int)expungeNotes:(id)a3 noteGuids:(id)a4;
- (int)expungeSearch:(id)a3 guid:(id)a4;
- (int)expungeSharedNotebooks:(id)a3 sharedNotebookIds:(id)a4;
- (int)expungeTag:(id)a3 guid:(id)a4;
- (int)findNoteOffset:(id)a3 filter:(id)a4 guid:(id)a5;
- (int)renameNotebook:(id)a3 notebookGuid:(id)a4 name:(id)a5;
- (int)sendMessageToSharedNotebookMembers:(id)a3 notebookGuid:(id)a4 messageText:(id)a5 recipients:(id)a6;
- (int)setNoteApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5 value:(id)a6;
- (int)setResourceApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5 value:(id)a6;
- (int)setSharedNotebookRecipientSettings:(id)a3 sharedNotebookId:(int64_t)a4 recipientSettings:(id)a5;
- (int)shareNoteWithBusiness:(id)a3 noteGuid:(id)a4;
- (int)stopSharingNoteWithBusiness:(id)a3 noteGuid:(id)a4;
- (int)unsetNoteApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5;
- (int)unsetResourceApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5;
- (int)updateLinkedNotebook:(id)a3 linkedNotebook:(id)a4;
- (int)updateNotebook:(id)a3 notebook:(id)a4;
- (int)updatePreferences:(id)a3 preferencesToUpdate:(id)a4;
- (int)updateResource:(id)a3 resource:(id)a4;
- (int)updateSearch:(id)a3 search:(id)a4;
- (int)updateSharedNotebook:(id)a3 sharedNotebook:(id)a4;
- (int)updateTag:(id)a3 tag:(id)a4;
- (void)cancel;
- (void)emailNote:(id)a3 parameters:(id)a4;
- (void)requestAccessToNotebook:(id)a3 notebookGuid:(id)a4 privilegeLevel:(int)a5;
- (void)setDownloadProgressBlock:(id)a3;
- (void)setUploadProgressBlock:(id)a3;
- (void)stopSharingNote:(id)a3 guid:(id)a4;
- (void)stopSharingNoteWithRecipients:(id)a3 guid:(id)a4;
- (void)unpublishNotebook:(id)a3 notebookGuid:(id)a4 convertGroupSharesToIndividual:(BOOL)a5;
- (void)untagAll:(id)a3 guid:(id)a4;
- (void)updateUserSetting:(id)a3 setting:(int)a4 value:(id)a5;
@end

@implementation EDAMNoteStoreClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outProtocol, 0);
  objc_storeStrong((id *)&self->_inProtocol, 0);
}

- (id)getLinkedAccountSyncState:(id)a3 linkedAccount:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"linkedAccount" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getLinkedAccountSyncState" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getLinkedAccountSyncState" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)sendLogRequest:(id)a3 logRequest:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"logRequest" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"sendLogRequest" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"sendLogRequest" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (int)renameNotebook:(id)a3 notebookGuid:(id)a4 name:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"notebookGuid"];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"name"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"renameNotebook" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  v19 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[3] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"renameNotebook" fromProtocol:inProtocol withResponseTypes:v23];
  LODWORD(v17) = [v24 intValue];

  return (int)v17;
}

- (id)getNotebookSharesEmailAddresses:(id)a3 notebookGuid:(id)a4 identities:(id)a5 skipUnknownUserIdentities:(BOOL)a6
{
  BOOL v30 = a6;
  v35[4] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v32 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v11 = +[FATArgument argumentWithField:v32 value:v10];

  v35[0] = v11;
  v12 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"notebookGuid"];
  v13 = +[FATArgument argumentWithField:v12 value:v9];

  v35[1] = v13;
  v14 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v15 = +[FATField fieldWithIndex:3 type:15 optional:0 name:@"identities" valueField:v14];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v35[2] = v16;
  v17 = +[FATField fieldWithIndex:4 type:2 optional:0 name:@"skipUnknownUserIdentities"];
  v18 = [NSNumber numberWithBool:v30];
  v19 = +[FATArgument argumentWithField:v17 value:v18];
  v35[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
  +[ENTProtocolUtil sendMessage:@"getNotebookSharesEmailAddresses" toProtocol:outProtocol withArguments:v20];

  inProtocol = self->_inProtocol;
  v22 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  v23 = +[FATField fieldWithIndex:0 type:14 optional:0 name:@"success" valueField:v22];
  v34[0] = v23;
  v24 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v34[1] = v24;
  v25 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v34[2] = v25;
  v26 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v34[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  v28 = +[ENTProtocolUtil readMessage:@"getNotebookSharesEmailAddresses" fromProtocol:inProtocol withResponseTypes:v27];

  return v28;
}

- (void)unpublishNotebook:(id)a3 notebookGuid:(id)a4 convertGroupSharesToIndividual:(BOOL)a5
{
  BOOL v5 = a5;
  v26[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v11 = +[FATArgument argumentWithField:v10 value:v9];

  v26[0] = v11;
  v12 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"notebookGuid"];
  v13 = +[FATArgument argumentWithField:v12 value:v8];

  v26[1] = v13;
  v14 = +[FATField fieldWithIndex:3 type:2 optional:0 name:@"convertGroupSharesToIndividual"];
  v15 = [NSNumber numberWithBool:v5];
  v16 = +[FATArgument argumentWithField:v14 value:v15];
  v26[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  +[ENTProtocolUtil sendMessage:@"unpublishNotebook" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  v19 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v25[0] = v19;
  v20 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v25[1] = v20;
  v21 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v25[2] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  id v23 = +[ENTProtocolUtil readMessage:@"unpublishNotebook" fromProtocol:inProtocol withResponseTypes:v22];
}

- (id)joinPublishedBusinessNotebook:(id)a3 notebookGuid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"notebookGuid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"joinPublishedBusinessNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"joinPublishedBusinessNotebook" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)manageNoteShares:(id)a3 parameters:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"parameters" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"manageNoteShares" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"manageNoteShares" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getNoteShares:(id)a3 noteGuid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getNoteShares" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getNoteShares" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getNotebookShares:(id)a3 notebookGuid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"notebookGuid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getNotebookShares" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getNotebookShares" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)manageNotebookShares:(id)a3 parameters:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"parameters" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"manageNotebookShares" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"manageNotebookShares" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)updateNoteIfUsnMatches:(id)a3 note:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"note" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"updateNoteIfUsnMatches" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"updateNoteIfUsnMatches" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getViewersForNotes:(id)a3 noteGuids:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v25[0] = v10;
  v11 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  v12 = +[FATField fieldWithIndex:2 type:15 optional:0 name:@"noteGuids" valueField:v11];
  v13 = +[FATArgument argumentWithField:v12 value:v7];

  v25[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  +[ENTProtocolUtil sendMessage:@"getViewersForNotes" toProtocol:outProtocol withArguments:v14];

  inProtocol = self->_inProtocol;
  v16 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  v17 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v18 = +[FATField fieldWithIndex:0 type:13 optional:0 name:@"success" keyField:v16 valueField:v17];
  v19 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v18 type optional name structClass];
  v24[1] = v19;
  v20 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v24[2] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  v22 = +[ENTProtocolUtil readMessage:@"getViewersForNotes" fromProtocol:inProtocol withResponseTypes:v21];

  return v22;
}

- (id)releaseNoteLock:(id)a3 noteGuid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"releaseNoteLock" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"releaseNoteLock" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)acquireNoteLock:(id)a3 noteGuid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"acquireNoteLock" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"acquireNoteLock" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getNoteLockStatus:(id)a3 noteGuid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getNoteLockStatus" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getNoteLockStatus" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (void)requestAccessToNotebook:(id)a3 notebookGuid:(id)a4 privilegeLevel:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v26[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authToken"];
  v11 = +[FATArgument argumentWithField:v10 value:v9];

  v26[0] = v11;
  v12 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"notebookGuid"];
  v13 = +[FATArgument argumentWithField:v12 value:v8];

  v26[1] = v13;
  v14 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"privilegeLevel"];
  v15 = [NSNumber numberWithInt:v5];
  v16 = +[FATArgument argumentWithField:v14 value:v15];
  v26[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  +[ENTProtocolUtil sendMessage:@"requestAccessToNotebook" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  v19 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v25[0] = v19;
  v20 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v25[1] = v20;
  v21 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v25[2] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  id v23 = +[ENTProtocolUtil readMessage:@"requestAccessToNotebook" fromProtocol:inProtocol withResponseTypes:v22];
}

- (int)stopSharingNoteWithBusiness:(id)a3 noteGuid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"stopSharingNoteWithBusiness" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"stopSharingNoteWithBusiness" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (int)shareNoteWithBusiness:(id)a3 noteGuid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"shareNoteWithBusiness" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[3] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"shareNoteWithBusiness" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (id)findInBusiness:(id)a3 query:(id)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v22[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"query" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v22[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  +[ENTProtocolUtil sendMessage:@"findInBusiness" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v15 type optional name structClass];
  v21[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v21[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  v19 = +[ENTProtocolUtil readMessage:@"findInBusiness" fromProtocol:inProtocol withResponseTypes:v18];

  return v19;
}

- (id)findContacts:(id)a3 query:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"query" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"findContacts" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v15];
  v17 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v16 type optional name structClass];
  v22[1] = v17;
  v18 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  v20 = +[ENTProtocolUtil readMessage:@"findContacts" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)findTimeZones:(id)a3 timeZoneSpec:(id)a4 maxTimeZones:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v11 = +[FATArgument argumentWithField:v10 value:v9];

  v28[0] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"timeZoneSpec" structClass:objc_opt_class()];
  v13 = +[FATArgument argumentWithField:v12 value:v8];

  v28[1] = v13;
  v14 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"maxTimeZones"];
  v15 = [NSNumber numberWithInt:v5];
  v16 = +[FATArgument argumentWithField:v14 value:v15];
  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"findTimeZones" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  v19 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v20 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v19];
  v27[0] = v20;
  v21 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v21;
  v22 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  v24 = +[ENTProtocolUtil readMessage:@"findTimeZones" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (void)updateUserSetting:(id)a3 setting:(int)a4 value:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v26[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v11 = +[FATArgument argumentWithField:v10 value:v9];

  v26[0] = v11;
  v12 = +[FATField fieldWithIndex:2 type:8 optional:0 name:@"setting"];
  v13 = [NSNumber numberWithInt:v5];
  v14 = +[FATArgument argumentWithField:v12 value:v13];
  v26[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"value"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v26[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  +[ENTProtocolUtil sendMessage:@"updateUserSetting" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  v19 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v25[0] = v19;
  v20 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v25[1] = v20;
  v21 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v25[2] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  id v23 = +[ENTProtocolUtil readMessage:@"updateUserSetting" fromProtocol:inProtocol withResponseTypes:v22];
}

- (id)findSearchSuggestions:(id)a3 query:(id)a4 resultSpec:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"query" structClass:objc_opt_class()];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"resultSpec" structClass:objc_opt_class()];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"findSearchSuggestions" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  v19 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"findSearchSuggestions" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (id)findRelated:(id)a3 query:(id)a4 resultSpec:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"query" structClass:objc_opt_class()];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"resultSpec" structClass:objc_opt_class()];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"findRelated" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  v19 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"findRelated" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (id)createOrUpdateSharedNotes:(id)a3 shareTemplate:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v25[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"shareTemplate" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v25[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  +[ENTProtocolUtil sendMessage:@"createOrUpdateSharedNotes" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v15];
  v17 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v16 type optional name structClass];
  v24[1] = v17;
  v18 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v24[2] = v18;
  v19 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v24[3] = v19;
  v20 = +[FATField fieldWithIndex:4 type:12 optional:0 name:@"invalidContactsException" structClass:objc_opt_class()];
  v24[4] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:5];
  v22 = +[ENTProtocolUtil readMessage:@"createOrUpdateSharedNotes" fromProtocol:inProtocol withResponseTypes:v21];

  return v22;
}

- (id)authenticateToSharedNote:(id)a3 noteKey:(id)a4 authenticationToken:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"guid"];
  v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteKey"];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"authenticationToken"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"authenticateToSharedNote" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  v19 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"authenticateToSharedNote" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (void)stopSharingNoteWithRecipients:(id)a3 guid:(id)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v21[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v21[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  +[ENTProtocolUtil sendMessage:@"stopSharingNoteWithRecipients" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:2, 12, 0, @"notFoundException", objc_opt_class(), v15 type optional name structClass];
  v20[1] = v16;
  v17 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v20[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"stopSharingNoteWithRecipients" fromProtocol:inProtocol withResponseTypes:v18];
}

- (void)stopSharingNote:(id)a3 guid:(id)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v21[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v21[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  +[ENTProtocolUtil sendMessage:@"stopSharingNote" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:2, 12, 0, @"notFoundException", objc_opt_class(), v15 type optional name structClass];
  v20[1] = v16;
  v17 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v20[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"stopSharingNote" fromProtocol:inProtocol withResponseTypes:v18];
}

- (id)shareNote:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"shareNote" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:11 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"shareNote" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (void)emailNote:(id)a3 parameters:(id)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v21[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"parameters" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v21[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  +[ENTProtocolUtil sendMessage:@"emailNote" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:2, 12, 0, @"notFoundException", objc_opt_class(), v15 type optional name structClass];
  v20[1] = v16;
  v17 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v20[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"emailNote" fromProtocol:inProtocol withResponseTypes:v18];
}

- (id)getSharedNotebookByAuth:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"getSharedNotebookByAuth" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v11 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v10 type optional name structClass];
  v17[1] = v11;
  v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v17[2] = v12;
  v13 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v17[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
  v15 = +[ENTProtocolUtil readMessage:@"getSharedNotebookByAuth" fromProtocol:inProtocol withResponseTypes:v14];

  return v15;
}

- (id)authenticateToSharedNotebook:(id)a3 authenticationToken:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"shareKeyOrGlobalId"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"authenticationToken"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"authenticateToSharedNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"authenticateToSharedNotebook" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (int)expungeLinkedNotebook:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"expungeLinkedNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"expungeLinkedNotebook" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (id)listLinkedNotebooks:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v19[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  +[ENTProtocolUtil sendMessage:@"listLinkedNotebooks" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v11 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v10];
  v12 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v11 type optional name structClass];
  v18[1] = v12;
  v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v18[2] = v13;
  v14 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v18[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];
  v16 = +[ENTProtocolUtil readMessage:@"listLinkedNotebooks" fromProtocol:inProtocol withResponseTypes:v15];

  return v16;
}

- (int)updateLinkedNotebook:(id)a3 linkedNotebook:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"linkedNotebook" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"updateLinkedNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"updateLinkedNotebook" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (id)createLinkedNotebook:(id)a3 linkedNotebook:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"linkedNotebook" structClass:objc_opt_class()];
  v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"createLinkedNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"createLinkedNotebook" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (int)expungeSharedNotebooks:(id)a3 sharedNotebookIds:(id)a4
{
  v24[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v9 = +[FATArgument argumentWithField:v8 value:v7];

  v24[0] = v9;
  id v10 = +[FATField fieldWithIndex:0 type:10 optional:1 name:0];
  v11 = +[FATField fieldWithIndex:2 type:15 optional:0 name:@"sharedNotebookIds" valueField:v10];
  v12 = +[FATArgument argumentWithField:v11 value:v6];

  v24[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  +[ENTProtocolUtil sendMessage:@"expungeSharedNotebooks" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v23[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v23[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v23[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v23[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"expungeSharedNotebooks" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v6) = [v20 intValue];

  return (int)v6;
}

- (id)listSharedNotebooks:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  id v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v19[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  +[ENTProtocolUtil sendMessage:@"listSharedNotebooks" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v11 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v10];
  v12 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v11 type optional name structClass];
  v18[1] = v12;
  v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v18[2] = v13;
  v14 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v18[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];
  v16 = +[ENTProtocolUtil readMessage:@"listSharedNotebooks" fromProtocol:inProtocol withResponseTypes:v15];

  return v16;
}

- (int)sendMessageToSharedNotebookMembers:(id)a3 notebookGuid:(id)a4 messageText:(id)a5 recipients:(id)a6
{
  void v34[4] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v30 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v13 = +[FATArgument argumentWithField:v30 value:v12];

  v34[0] = v13;
  v14 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"notebookGuid"];
  v15 = +[FATArgument argumentWithField:v14 value:v11];

  v34[1] = v15;
  v16 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"messageText"];
  v17 = +[FATArgument argumentWithField:v16 value:v10];

  v34[2] = v17;
  v18 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  id v19 = +[FATField fieldWithIndex:4 type:15 optional:0 name:@"recipients" valueField:v18];
  v20 = +[FATArgument argumentWithField:v19 value:v9];

  v34[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  +[ENTProtocolUtil sendMessage:@"sendMessageToSharedNotebookMembers" toProtocol:outProtocol withArguments:v21];

  inProtocol = self->_inProtocol;
  id v23 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v33[0] = v23;
  v24 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v33[1] = v24;
  v25 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v33[2] = v25;
  v26 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v33[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  v28 = +[ENTProtocolUtil readMessage:@"sendMessageToSharedNotebookMembers" fromProtocol:inProtocol withResponseTypes:v27];
  LODWORD(inProtocol) = [v28 intValue];

  return (int)inProtocol;
}

- (id)setNotebookRecipientSettings:(id)a3 notebookGuid:(id)a4 recipientSettings:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"notebookGuid"];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"recipientSettings" structClass:objc_opt_class()];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"setNotebookRecipientSettings" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"setNotebookRecipientSettings" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (int)setSharedNotebookRecipientSettings:(id)a3 sharedNotebookId:(int64_t)a4 recipientSettings:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a3;
  id v10 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v11 = +[FATArgument argumentWithField:v10 value:v9];

  v28[0] = v11;
  id v12 = +[FATField fieldWithIndex:2 type:10 optional:0 name:@"sharedNotebookId"];
  v13 = [NSNumber numberWithLongLong:a4];
  v14 = +[FATArgument argumentWithField:v12 value:v13];
  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"recipientSettings" structClass:objc_opt_class()];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"setSharedNotebookRecipientSettings" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"setSharedNotebookRecipientSettings" fromProtocol:inProtocol withResponseTypes:v23];
  LODWORD(v17) = [v24 intValue];

  return (int)v17;
}

- (int)updateSharedNotebook:(id)a3 sharedNotebook:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"sharedNotebook" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"updateSharedNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"updateSharedNotebook" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (id)createOrUpdateNotebookShares:(id)a3 shareTemplate:(id)a4
{
  v24[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v24[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"shareTemplate" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v24[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  +[ENTProtocolUtil sendMessage:@"createOrUpdateNotebookShares" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v15 type optional name structClass];
  v23[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v23[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v23[3] = v18;
  id v19 = +[FATField fieldWithIndex:4 type:12 optional:0 name:@"invalidContactsException" structClass:objc_opt_class()];
  void v23[4] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];
  v21 = +[ENTProtocolUtil readMessage:@"createOrUpdateNotebookShares" fromProtocol:inProtocol withResponseTypes:v20];

  return v21;
}

- (id)shareNotebook:(id)a3 sharedNotebook:(id)a4 message:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"sharedNotebook" structClass:objc_opt_class()];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"message"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"shareNotebook" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"shareNotebook" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (id)createSharedNotebook:(id)a3 sharedNotebook:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"sharedNotebook" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"createSharedNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"createSharedNotebook" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getPublicNotebook:(int)a3 publicUri:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v22[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"userId"];
  id v9 = [NSNumber numberWithInt:v4];
  id v10 = +[FATArgument argumentWithField:v8 value:v9];
  v22[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"publicUri"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v22[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  +[ENTProtocolUtil sendMessage:@"getPublicNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:1, 12, 0, @"systemException", objc_opt_class(), v15 type optional name structClass];
  v21[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v21[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"getPublicNotebook" fromProtocol:inProtocol withResponseTypes:v18];

  return v19;
}

- (id)getRandomAd:(id)a3 adParameters:(id)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v22[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"adParameters" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v22[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  +[ENTProtocolUtil sendMessage:@"getRandomAd" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v15 type optional name structClass];
  v21[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v21[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"getRandomAd" fromProtocol:inProtocol withResponseTypes:v18];

  return v19;
}

- (id)getAds:(id)a3 adParameters:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"adParameters" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getAds" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v15];
  v17 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v16 type optional name structClass];
  v22[1] = v17;
  v18 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  v20 = +[ENTProtocolUtil readMessage:@"getAds" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getResourceAttributes:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getResourceAttributes" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getResourceAttributes" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getResourceAlternateData:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getResourceAlternateData" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:16 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getResourceAlternateData" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getResourceRecognition:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getResourceRecognition" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:16 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getResourceRecognition" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getResourceByHash:(id)a3 noteGuid:(id)a4 contentHash:(id)a5 withData:(BOOL)a6 withRecognition:(BOOL)a7 withAlternateData:(BOOL)a8
{
  BOOL v32 = a8;
  BOOL v34 = a7;
  BOOL v8 = a6;
  v43[6] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v40 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v39 = +[FATArgument argumentWithField:v40 value:v13];

  v43[0] = v39;
  v37 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  v36 = +[FATArgument argumentWithField:v37 value:v12];

  v43[1] = v36;
  v35 = +[FATField fieldWithIndex:3 type:16 optional:0 name:@"contentHash"];
  v33 = +[FATArgument argumentWithField:v35 value:v11];

  v43[2] = v33;
  v14 = +[FATField fieldWithIndex:4 type:2 optional:0 name:@"withData"];
  v15 = [NSNumber numberWithBool:v8];
  v16 = +[FATArgument argumentWithField:v14 value:v15];
  v43[3] = v16;
  v17 = +[FATField fieldWithIndex:5 type:2 optional:0 name:@"withRecognition"];
  v18 = [NSNumber numberWithBool:v34];
  id v19 = +[FATArgument argumentWithField:v17 value:v18];
  v43[4] = v19;
  v20 = +[FATField fieldWithIndex:6 type:2 optional:0 name:@"withAlternateData"];
  v21 = [NSNumber numberWithBool:v32];
  v22 = +[FATArgument argumentWithField:v20 value:v21];
  v43[5] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:6];
  +[ENTProtocolUtil sendMessage:@"getResourceByHash" toProtocol:outProtocol withArguments:v23];

  inProtocol = self->_inProtocol;
  v25 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v42[0] = v25;
  v26 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v42[1] = v26;
  v27 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v42[2] = v27;
  v28 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v42[3] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  BOOL v30 = +[ENTProtocolUtil readMessage:@"getResourceByHash" fromProtocol:inProtocol withResponseTypes:v29];

  return v30;
}

- (id)getResourceData:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getResourceData" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:16 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getResourceData" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (int)updateResource:(id)a3 resource:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"resource" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"updateResource" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"updateResource" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (int)unsetResourceApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"key"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"unsetResourceApplicationDataEntry" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"unsetResourceApplicationDataEntry" fromProtocol:inProtocol withResponseTypes:v23];
  LODWORD(v17) = [v24 intValue];

  return (int)v17;
}

- (int)setResourceApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5 value:(id)a6
{
  void v33[4] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v14 = +[FATArgument argumentWithField:v13 value:v12];

  v33[0] = v14;
  v15 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v16 = +[FATArgument argumentWithField:v15 value:v11];

  v33[1] = v16;
  v17 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"key"];
  v18 = +[FATArgument argumentWithField:v17 value:v10];

  v33[2] = v18;
  id v19 = +[FATField fieldWithIndex:4 type:11 optional:0 name:@"value"];
  v20 = +[FATArgument argumentWithField:v19 value:v9];

  v33[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  +[ENTProtocolUtil sendMessage:@"setResourceApplicationDataEntry" toProtocol:outProtocol withArguments:v21];

  inProtocol = self->_inProtocol;
  id v23 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v32[0] = v23;
  v24 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v32[1] = v24;
  v25 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v32[2] = v25;
  v26 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v32[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  v28 = +[ENTProtocolUtil readMessage:@"setResourceApplicationDataEntry" fromProtocol:inProtocol withResponseTypes:v27];
  LODWORD(inProtocol) = [v28 intValue];

  return (int)inProtocol;
}

- (id)getResourceApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"key"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"getResourceApplicationDataEntry" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:11 optional:0 name:@"success"];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"getResourceApplicationDataEntry" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (id)getResourceApplicationData:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getResourceApplicationData" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getResourceApplicationData" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getResource:(id)a3 guid:(id)a4 withData:(BOOL)a5 withRecognition:(BOOL)a6 withAttributes:(BOOL)a7 withAlternateData:(BOOL)a8
{
  BOOL v35 = a8;
  BOOL v31 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  v43[6] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v11 = a4;
  id v12 = a3;
  v40 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v39 = +[FATArgument argumentWithField:v40 value:v12];

  v43[0] = v39;
  v38 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v36 = +[FATArgument argumentWithField:v38 value:v11];

  v43[1] = v36;
  BOOL v34 = +[FATField fieldWithIndex:3 type:2 optional:0 name:@"withData"];
  v33 = [NSNumber numberWithBool:v9];
  BOOL v32 = +[FATArgument argumentWithField:v34 value:v33];
  v43[2] = v32;
  id v13 = +[FATField fieldWithIndex:4 type:2 optional:0 name:@"withRecognition"];
  v14 = [NSNumber numberWithBool:v8];
  v15 = +[FATArgument argumentWithField:v13 value:v14];
  v43[3] = v15;
  v16 = +[FATField fieldWithIndex:5 type:2 optional:0 name:@"withAttributes"];
  v17 = [NSNumber numberWithBool:v31];
  v18 = +[FATArgument argumentWithField:v16 value:v17];
  v43[4] = v18;
  id v19 = +[FATField fieldWithIndex:6 type:2 optional:0 name:@"withAlternateData"];
  v20 = [NSNumber numberWithBool:v35];
  v21 = +[FATArgument argumentWithField:v19 value:v20];
  v43[5] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:6];
  +[ENTProtocolUtil sendMessage:@"getResource" toProtocol:outProtocol withArguments:v22];

  inProtocol = self->_inProtocol;
  v24 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v42[0] = v24;
  v25 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v42[1] = v25;
  v26 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v42[2] = v26;
  v27 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v42[3] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  v29 = +[ENTProtocolUtil readMessage:@"getResource" fromProtocol:inProtocol withResponseTypes:v28];

  return v29;
}

- (id)getNoteVersion:(id)a3 noteGuid:(id)a4 updateSequenceNum:(int)a5 withResourcesData:(BOOL)a6 withResourcesRecognition:(BOOL)a7 withResourcesAlternateData:(BOOL)a8
{
  BOOL v35 = a8;
  BOOL v31 = a7;
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  v43[6] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v11 = a4;
  id v12 = a3;
  v40 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v39 = +[FATArgument argumentWithField:v40 value:v12];

  v43[0] = v39;
  v38 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  v36 = +[FATArgument argumentWithField:v38 value:v11];

  v43[1] = v36;
  BOOL v34 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"updateSequenceNum"];
  v33 = [NSNumber numberWithInt:v9];
  BOOL v32 = +[FATArgument argumentWithField:v34 value:v33];
  v43[2] = v32;
  id v13 = +[FATField fieldWithIndex:4 type:2 optional:0 name:@"withResourcesData"];
  v14 = [NSNumber numberWithBool:v8];
  v15 = +[FATArgument argumentWithField:v13 value:v14];
  v43[3] = v15;
  v16 = +[FATField fieldWithIndex:5 type:2 optional:0 name:@"withResourcesRecognition"];
  v17 = [NSNumber numberWithBool:v31];
  v18 = +[FATArgument argumentWithField:v16 value:v17];
  v43[4] = v18;
  id v19 = +[FATField fieldWithIndex:6 type:2 optional:0 name:@"withResourcesAlternateData"];
  v20 = [NSNumber numberWithBool:v35];
  v21 = +[FATArgument argumentWithField:v19 value:v20];
  v43[5] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:6];
  +[ENTProtocolUtil sendMessage:@"getNoteVersion" toProtocol:outProtocol withArguments:v22];

  inProtocol = self->_inProtocol;
  v24 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v42[0] = v24;
  v25 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v42[1] = v25;
  v26 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v42[2] = v26;
  v27 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v42[3] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  v29 = +[ENTProtocolUtil readMessage:@"getNoteVersion" fromProtocol:inProtocol withResponseTypes:v28];

  return v29;
}

- (id)listNoteVersions:(id)a3 noteGuid:(id)a4
{
  v24[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v24[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v24[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  +[ENTProtocolUtil sendMessage:@"listNoteVersions" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  v15 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v15];
  v23[0] = v16;
  v17 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v23[1] = v17;
  v18 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v23[2] = v18;
  id v19 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v23[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  v21 = +[ENTProtocolUtil readMessage:@"listNoteVersions" fromProtocol:inProtocol withResponseTypes:v20];

  return v21;
}

- (id)copyNote:(id)a3 noteGuid:(id)a4 toNotebookGuid:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"noteGuid"];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"toNotebookGuid"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"copyNote" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"copyNote" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (int)expungeInactiveNotes:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  id v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"expungeInactiveNotes" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v17[0] = v10;
  id v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v17[1] = v11;
  id v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v17[2] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  v14 = +[ENTProtocolUtil readMessage:@"expungeInactiveNotes" fromProtocol:inProtocol withResponseTypes:v13];
  int v15 = [v14 intValue];

  return v15;
}

- (int)expungeNotes:(id)a3 noteGuids:(id)a4
{
  v24[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v9 = +[FATArgument argumentWithField:v8 value:v7];

  v24[0] = v9;
  id v10 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  id v11 = +[FATField fieldWithIndex:2 type:15 optional:0 name:@"noteGuids" valueField:v10];
  id v12 = +[FATArgument argumentWithField:v11 value:v6];

  v24[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  +[ENTProtocolUtil sendMessage:@"expungeNotes" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v23[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v23[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v23[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v23[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"expungeNotes" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v6) = [v20 intValue];

  return (int)v6;
}

- (int)expungeNote:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"expungeNote" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"expungeNote" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (int)deleteNote:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"deleteNote" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"deleteNote" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (id)updateNote:(id)a3 note:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"note" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"updateNote" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"updateNote" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)createNote:(id)a3 note:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"note" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"createNote" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"createNote" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getNoteTagNames:(id)a3 guid:(id)a4
{
  v24[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v24[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v24[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  +[ENTProtocolUtil sendMessage:@"getNoteTagNames" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  v16 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v15];
  v23[0] = v16;
  v17 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v23[1] = v17;
  v18 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v23[2] = v18;
  id v19 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v23[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  v21 = +[ENTProtocolUtil readMessage:@"getNoteTagNames" fromProtocol:inProtocol withResponseTypes:v20];

  return v21;
}

- (id)getResourceSearchText:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getResourceSearchText" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:11 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getResourceSearchText" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getNoteSearchText:(id)a3 guid:(id)a4 noteOnly:(BOOL)a5 tokenizeForIndexing:(BOOL)a6
{
  BOOL v28 = a6;
  BOOL v6 = a5;
  void v33[4] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a4;
  id v9 = a3;
  BOOL v30 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v30 value:v9];

  v33[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v8];

  v33[1] = v12;
  id v13 = +[FATField fieldWithIndex:3 type:2 optional:0 name:@"noteOnly"];
  v14 = [NSNumber numberWithBool:v6];
  int v15 = +[FATArgument argumentWithField:v13 value:v14];
  v33[2] = v15;
  v16 = +[FATField fieldWithIndex:4 type:2 optional:0 name:@"tokenizeForIndexing"];
  v17 = [NSNumber numberWithBool:v28];
  v18 = +[FATArgument argumentWithField:v16 value:v17];
  v33[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  +[ENTProtocolUtil sendMessage:@"getNoteSearchText" toProtocol:outProtocol withArguments:v19];

  inProtocol = self->_inProtocol;
  v21 = +[FATField fieldWithIndex:0 type:11 optional:0 name:@"success"];
  v32[0] = v21;
  v22 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v32[1] = v22;
  id v23 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v32[2] = v23;
  v24 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v32[3] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  v26 = +[ENTProtocolUtil readMessage:@"getNoteSearchText" fromProtocol:inProtocol withResponseTypes:v25];

  return v26;
}

- (id)getNoteContent:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getNoteContent" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:11 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getNoteContent" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (int)unsetNoteApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  int v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"key"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"unsetNoteApplicationDataEntry" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"unsetNoteApplicationDataEntry" fromProtocol:inProtocol withResponseTypes:v23];
  LODWORD(v17) = [v24 intValue];

  return (int)v17;
}

- (int)setNoteApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5 value:(id)a6
{
  void v33[4] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v14 = +[FATArgument argumentWithField:v13 value:v12];

  v33[0] = v14;
  int v15 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v16 = +[FATArgument argumentWithField:v15 value:v11];

  v33[1] = v16;
  v17 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"key"];
  v18 = +[FATArgument argumentWithField:v17 value:v10];

  v33[2] = v18;
  id v19 = +[FATField fieldWithIndex:4 type:11 optional:0 name:@"value"];
  v20 = +[FATArgument argumentWithField:v19 value:v9];

  v33[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  +[ENTProtocolUtil sendMessage:@"setNoteApplicationDataEntry" toProtocol:outProtocol withArguments:v21];

  inProtocol = self->_inProtocol;
  id v23 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v32[0] = v23;
  v24 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v32[1] = v24;
  v25 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v32[2] = v25;
  v26 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v32[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  BOOL v28 = +[ENTProtocolUtil readMessage:@"setNoteApplicationDataEntry" fromProtocol:inProtocol withResponseTypes:v27];
  LODWORD(inProtocol) = [v28 intValue];

  return (int)inProtocol;
}

- (id)getNoteApplicationDataEntry:(id)a3 guid:(id)a4 key:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  int v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"key"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"getNoteApplicationDataEntry" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:11 optional:0 name:@"success"];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"getNoteApplicationDataEntry" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (id)getNoteApplicationData:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getNoteApplicationData" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getNoteApplicationData" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (int)updatePreferences:(id)a3 preferencesToUpdate:(id)a4
{
  v25[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v9 = +[FATArgument argumentWithField:v8 value:v7];

  v25[0] = v9;
  id v10 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  id v11 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  id v12 = +[FATField fieldWithIndex:0 type:15 optional:1 name:0 valueField:v11];
  id v13 = +[FATField fieldWithIndex:2 type:13 optional:0 name:@"preferencesToUpdate" keyField:v10 valueField:v12];
  v14 = +[FATArgument argumentWithField:v13 value:v6];

  v25[1] = v14;
  int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  +[ENTProtocolUtil sendMessage:@"updatePreferences" toProtocol:outProtocol withArguments:v15];

  inProtocol = self->_inProtocol;
  v17 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v24[0] = v17;
  v18 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v24[1] = v18;
  id v19 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v24[2] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:3];
  v21 = +[ENTProtocolUtil readMessage:@"updatePreferences" fromProtocol:inProtocol withResponseTypes:v20];
  LODWORD(inProtocol) = [v21 intValue];

  return (int)inProtocol;
}

- (id)getPreferences:(id)a3 preferenceNames:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  id v12 = +[FATField fieldWithIndex:2 type:15 optional:0 name:@"preferenceNames" valueField:v11];
  id v13 = +[FATArgument argumentWithField:v12 value:v7];

  v23[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getPreferences" toProtocol:outProtocol withArguments:v14];

  inProtocol = self->_inProtocol;
  v16 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v17 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v16 type optional name structClass];
  v22[1] = v17;
  v18 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  v20 = +[ENTProtocolUtil readMessage:@"getPreferences" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getNote:(id)a3 guid:(id)a4 withContent:(BOOL)a5 withResourcesData:(BOOL)a6 withResourcesRecognition:(BOOL)a7 withResourcesAlternateData:(BOOL)a8
{
  BOOL v35 = a8;
  BOOL v31 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  v43[6] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v11 = a4;
  id v12 = a3;
  v40 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  v39 = +[FATArgument argumentWithField:v40 value:v12];

  v43[0] = v39;
  v38 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v36 = +[FATArgument argumentWithField:v38 value:v11];

  v43[1] = v36;
  BOOL v34 = +[FATField fieldWithIndex:3 type:2 optional:0 name:@"withContent"];
  v33 = [NSNumber numberWithBool:v9];
  BOOL v32 = +[FATArgument argumentWithField:v34 value:v33];
  v43[2] = v32;
  id v13 = +[FATField fieldWithIndex:4 type:2 optional:0 name:@"withResourcesData"];
  v14 = [NSNumber numberWithBool:v8];
  int v15 = +[FATArgument argumentWithField:v13 value:v14];
  v43[3] = v15;
  v16 = +[FATField fieldWithIndex:5 type:2 optional:0 name:@"withResourcesRecognition"];
  v17 = [NSNumber numberWithBool:v31];
  v18 = +[FATArgument argumentWithField:v16 value:v17];
  v43[4] = v18;
  id v19 = +[FATField fieldWithIndex:6 type:2 optional:0 name:@"withResourcesAlternateData"];
  v20 = [NSNumber numberWithBool:v35];
  v21 = +[FATArgument argumentWithField:v19 value:v20];
  v43[5] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:6];
  +[ENTProtocolUtil sendMessage:@"getNote" toProtocol:outProtocol withArguments:v22];

  inProtocol = self->_inProtocol;
  v24 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v42[0] = v24;
  v25 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v42[1] = v25;
  v26 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v42[2] = v26;
  v27 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v42[3] = v27;
  BOOL v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
  v29 = +[ENTProtocolUtil readMessage:@"getNote" fromProtocol:inProtocol withResponseTypes:v28];

  return v29;
}

- (id)getNoteWithResultSpec:(id)a3 guid:(id)a4 resultSpec:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  int v15 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"resultSpec" structClass:objc_opt_class()];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"getNoteWithResultSpec" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"getNoteWithResultSpec" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (id)findNoteCounts:(id)a3 filter:(id)a4 withTrash:(BOOL)a5
{
  BOOL v5 = a5;
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v11 = +[FATArgument argumentWithField:v10 value:v9];

  v28[0] = v11;
  id v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"filter" structClass:objc_opt_class()];
  id v13 = +[FATArgument argumentWithField:v12 value:v8];

  v28[1] = v13;
  v14 = +[FATField fieldWithIndex:3 type:2 optional:0 name:@"withTrash"];
  int v15 = [NSNumber numberWithBool:v5];
  v16 = +[FATArgument argumentWithField:v14 value:v15];
  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"findNoteCounts" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"findNoteCounts" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (id)getNoteSnippets:(id)a3 noteGuids:(id)a4 maxSnippetLength:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v30[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v11 = +[FATArgument argumentWithField:v10 value:v9];

  v30[0] = v11;
  id v12 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  id v13 = +[FATField fieldWithIndex:2 type:15 optional:0 name:@"noteGuids" valueField:v12];
  v14 = +[FATArgument argumentWithField:v13 value:v8];

  v30[1] = v14;
  int v15 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"maxSnippetLength"];
  v16 = [NSNumber numberWithInt:v5];
  v17 = +[FATArgument argumentWithField:v15 value:v16];
  v30[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  +[ENTProtocolUtil sendMessage:@"getNoteSnippets" toProtocol:outProtocol withArguments:v18];

  inProtocol = self->_inProtocol;
  v20 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  v21 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
  v22 = +[FATField fieldWithIndex:0 type:13 optional:0 name:@"success" keyField:v20 valueField:v21];
  v29[0] = v22;
  id v23 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v29[1] = v23;
  v24 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v29[2] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  v26 = +[ENTProtocolUtil readMessage:@"getNoteSnippets" fromProtocol:inProtocol withResponseTypes:v25];

  return v26;
}

- (id)findNotesMetadata:(id)a3 filter:(id)a4 offset:(int)a5 maxNotes:(int)a6 resultSpec:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  v38[5] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  BOOL v35 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  BOOL v34 = +[FATArgument argumentWithField:v35 value:v13];

  v38[0] = v34;
  BOOL v32 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"filter" structClass:objc_opt_class()];
  BOOL v31 = +[FATArgument argumentWithField:v32 value:v12];

  v38[1] = v31;
  v14 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"offset"];
  int v15 = [NSNumber numberWithInt:v8];
  v16 = +[FATArgument argumentWithField:v14 value:v15];
  v38[2] = v16;
  v17 = +[FATField fieldWithIndex:4 type:8 optional:0 name:@"maxNotes"];
  v18 = [NSNumber numberWithInt:v7];
  id v19 = +[FATArgument argumentWithField:v17 value:v18];
  v38[3] = v19;
  v20 = +[FATField fieldWithIndex:5 type:12 optional:0 name:@"resultSpec" structClass:objc_opt_class()];
  v21 = +[FATArgument argumentWithField:v20 value:v11];

  v38[4] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:5];
  +[ENTProtocolUtil sendMessage:@"findNotesMetadata" toProtocol:outProtocol withArguments:v22];

  inProtocol = self->_inProtocol;
  v24 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v37[0] = v24;
  v25 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v37[1] = v25;
  v26 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v37[2] = v26;
  v27 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v37[3] = v27;
  BOOL v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
  v29 = +[ENTProtocolUtil readMessage:@"findNotesMetadata" fromProtocol:inProtocol withResponseTypes:v28];

  return v29;
}

- (int)findNoteOffset:(id)a3 filter:(id)a4 guid:(id)a5
{
  v28[3] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v12 = +[FATArgument argumentWithField:v11 value:v10];

  v28[0] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"filter" structClass:objc_opt_class()];
  v14 = +[FATArgument argumentWithField:v13 value:v9];

  v28[1] = v14;
  int v15 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"guid"];
  v16 = +[FATArgument argumentWithField:v15 value:v8];

  v28[2] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  +[ENTProtocolUtil sendMessage:@"findNoteOffset" toProtocol:outProtocol withArguments:v17];

  inProtocol = self->_inProtocol;
  id v19 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v27[0] = v19;
  v20 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v27[1] = v20;
  v21 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v27[2] = v21;
  v22 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v27[3] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v24 = +[ENTProtocolUtil readMessage:@"findNoteOffset" fromProtocol:inProtocol withResponseTypes:v23];
  LODWORD(v17) = [v24 intValue];

  return (int)v17;
}

- (id)findNotes:(id)a3 filter:(id)a4 offset:(int)a5 maxNotes:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  void v33[4] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a4;
  id v9 = a3;
  BOOL v30 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v30 value:v9];

  v33[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"filter" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v8];

  v33[1] = v12;
  id v13 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"offset"];
  v14 = [NSNumber numberWithInt:v6];
  int v15 = +[FATArgument argumentWithField:v13 value:v14];
  v33[2] = v15;
  v16 = +[FATField fieldWithIndex:4 type:8 optional:0 name:@"maxNotes"];
  v17 = [NSNumber numberWithInt:a6];
  v18 = +[FATArgument argumentWithField:v16 value:v17];
  v33[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  +[ENTProtocolUtil sendMessage:@"findNotes" toProtocol:outProtocol withArguments:v19];

  inProtocol = self->_inProtocol;
  v21 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v32[0] = v21;
  v22 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v32[1] = v22;
  id v23 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v32[2] = v23;
  v24 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v32[3] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  v26 = +[ENTProtocolUtil readMessage:@"findNotes" fromProtocol:inProtocol withResponseTypes:v25];

  return v26;
}

- (int)expungeSearch:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"expungeSearch" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"expungeSearch" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (int)updateSearch:(id)a3 search:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"search" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"updateSearch" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"updateSearch" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (id)createSearch:(id)a3 search:(id)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v22[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"search" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v22[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  +[ENTProtocolUtil sendMessage:@"createSearch" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v15 type optional name structClass];
  v21[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v21[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"createSearch" fromProtocol:inProtocol withResponseTypes:v18];

  return v19;
}

- (id)getSearch:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getSearch" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getSearch" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)listSearches:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  uint64_t v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"listSearches" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  id v11 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v10];
  v17[0] = v11;
  id v12 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v17[1] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v17[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  int v15 = +[ENTProtocolUtil readMessage:@"listSearches" fromProtocol:inProtocol withResponseTypes:v14];

  return v15;
}

- (int)expungeTag:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"expungeTag" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"expungeTag" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (void)untagAll:(id)a3 guid:(id)a4
{
  v21[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v21[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v21[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  +[ENTProtocolUtil sendMessage:@"untagAll" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:2, 12, 0, @"systemException", objc_opt_class(), v15 type optional name structClass];
  v20[1] = v16;
  v17 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v20[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"untagAll" fromProtocol:inProtocol withResponseTypes:v18];
}

- (int)updateTag:(id)a3 tag:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"tag" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"updateTag" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"updateTag" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (id)createTag:(id)a3 tag:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"tag" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"createTag" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"createTag" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getTag:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getTag" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getTag" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)listTagsByNotebook:(id)a3 notebookGuid:(id)a4
{
  v24[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v24[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"notebookGuid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v24[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  +[ENTProtocolUtil sendMessage:@"listTagsByNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v15];
  v23[0] = v16;
  v17 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v23[1] = v17;
  v18 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v23[2] = v18;
  id v19 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v23[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  v21 = +[ENTProtocolUtil readMessage:@"listTagsByNotebook" fromProtocol:inProtocol withResponseTypes:v20];

  return v21;
}

- (id)listTags:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  uint64_t v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"listTags" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  id v11 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v10];
  v17[0] = v11;
  id v12 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v17[1] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v17[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  int v15 = +[ENTProtocolUtil readMessage:@"listTags" fromProtocol:inProtocol withResponseTypes:v14];

  return v15;
}

- (int)expungeNotebook:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"expungeNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"expungeNotebook" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (int)updateNotebook:(id)a3 notebook:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notebook" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"updateNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:8 optional:0 name:@"success"];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"updateNotebook" fromProtocol:inProtocol withResponseTypes:v19];
  LODWORD(v7) = [v20 intValue];

  return (int)v7;
}

- (id)createNotebook:(id)a3 notebook:(id)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v22[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"notebook" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v22[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  +[ENTProtocolUtil sendMessage:@"createNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v15 type optional name structClass];
  v21[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v21[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"createNotebook" fromProtocol:inProtocol withResponseTypes:v18];

  return v19;
}

- (id)getDefaultNotebook:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  uint64_t v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"getDefaultNotebook" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16[0] = v10;
  id v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  id v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v16[2] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v14 = +[ENTProtocolUtil readMessage:@"getDefaultNotebook" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (id)getNotebook:(id)a3 guid:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:11 optional:0 name:@"guid"];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getNotebook" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getNotebook" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)listAccessibleBusinessNotebooks:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  uint64_t v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"listAccessibleBusinessNotebooks" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  id v11 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v10];
  v17[0] = v11;
  id v12 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v17[1] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v17[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  int v15 = +[ENTProtocolUtil readMessage:@"listAccessibleBusinessNotebooks" fromProtocol:inProtocol withResponseTypes:v14];

  return v15;
}

- (id)listPublishedBusinessNotebooks:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  uint64_t v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"listPublishedBusinessNotebooks" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  id v11 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v10];
  v17[0] = v11;
  id v12 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v17[1] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v17[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  int v15 = +[ENTProtocolUtil readMessage:@"listPublishedBusinessNotebooks" fromProtocol:inProtocol withResponseTypes:v14];

  return v15;
}

- (id)listNotebooks:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  uint64_t v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v18[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  +[ENTProtocolUtil sendMessage:@"listNotebooks" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
  id v11 = +[FATField fieldWithIndex:0 type:15 optional:0 name:@"success" valueField:v10];
  v17[0] = v11;
  id v12 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v17[1] = v12;
  id v13 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  void v17[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  int v15 = +[ENTProtocolUtil readMessage:@"listNotebooks" fromProtocol:inProtocol withResponseTypes:v14];

  return v15;
}

- (id)getLinkedNotebookSyncChunk:(id)a3 linkedNotebook:(id)a4 afterUSN:(int)a5 maxEntries:(int)a6 fullSyncOnly:(BOOL)a7
{
  BOOL v31 = a7;
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  v38[5] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v10 = a4;
  id v11 = a3;
  BOOL v35 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  BOOL v34 = +[FATArgument argumentWithField:v35 value:v11];

  v38[0] = v34;
  BOOL v32 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"linkedNotebook" structClass:objc_opt_class()];
  BOOL v30 = +[FATArgument argumentWithField:v32 value:v10];

  v38[1] = v30;
  id v12 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"afterUSN"];
  id v13 = [NSNumber numberWithInt:v8];
  v14 = +[FATArgument argumentWithField:v12 value:v13];
  v38[2] = v14;
  int v15 = +[FATField fieldWithIndex:4 type:8 optional:0 name:@"maxEntries"];
  v16 = [NSNumber numberWithInt:v7];
  v17 = +[FATArgument argumentWithField:v15 value:v16];
  v38[3] = v17;
  v18 = +[FATField fieldWithIndex:5 type:2 optional:0 name:@"fullSyncOnly"];
  id v19 = [NSNumber numberWithBool:v31];
  v20 = +[FATArgument argumentWithField:v18 value:v19];
  v38[4] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:5];
  +[ENTProtocolUtil sendMessage:@"getLinkedNotebookSyncChunk" toProtocol:outProtocol withArguments:v21];

  inProtocol = self->_inProtocol;
  id v23 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v37[0] = v23;
  v24 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v37[1] = v24;
  v25 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v37[2] = v25;
  v26 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  v37[3] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
  BOOL v28 = +[ENTProtocolUtil readMessage:@"getLinkedNotebookSyncChunk" fromProtocol:inProtocol withResponseTypes:v27];

  return v28;
}

- (id)getLinkedNotebookSyncState:(id)a3 linkedNotebook:(id)a4
{
  v23[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v23[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"linkedNotebook" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v23[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  +[ENTProtocolUtil sendMessage:@"getLinkedNotebookSyncState" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v22[0] = v15;
  v16 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v22[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v22[2] = v17;
  v18 = +[FATField fieldWithIndex:3 type:12 optional:0 name:@"notFoundException" structClass:objc_opt_class()];
  void v22[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  v20 = +[ENTProtocolUtil readMessage:@"getLinkedNotebookSyncState" fromProtocol:inProtocol withResponseTypes:v19];

  return v20;
}

- (id)getFilteredSyncChunk:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 filter:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  void v32[4] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v9 = a6;
  id v10 = a3;
  v29 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  BOOL v28 = +[FATArgument argumentWithField:v29 value:v10];

  v32[0] = v28;
  id v11 = +[FATField fieldWithIndex:2 type:8 optional:0 name:@"afterUSN"];
  id v12 = [NSNumber numberWithInt:v7];
  id v13 = +[FATArgument argumentWithField:v11 value:v12];
  v32[1] = v13;
  v14 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"maxEntries"];
  int v15 = [NSNumber numberWithInt:v6];
  v16 = +[FATArgument argumentWithField:v14 value:v15];
  v32[2] = v16;
  v17 = +[FATField fieldWithIndex:4 type:12 optional:0 name:@"filter" structClass:objc_opt_class()];
  v18 = +[FATArgument argumentWithField:v17 value:v9];

  v32[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  +[ENTProtocolUtil sendMessage:@"getFilteredSyncChunk" toProtocol:outProtocol withArguments:v19];

  inProtocol = self->_inProtocol;
  v21 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v31[0] = v21;
  v22 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v31[1] = v22;
  id v23 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v31[2] = v23;
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
  v25 = +[ENTProtocolUtil readMessage:@"getFilteredSyncChunk" fromProtocol:inProtocol withResponseTypes:v24];

  return v25;
}

- (id)getSyncChunk:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 fullSyncOnly:(BOOL)a6
{
  BOOL v26 = a6;
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  void v32[4] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v8 = a3;
  v29 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  BOOL v28 = +[FATArgument argumentWithField:v29 value:v8];

  v32[0] = v28;
  id v9 = +[FATField fieldWithIndex:2 type:8 optional:0 name:@"afterUSN"];
  id v10 = [NSNumber numberWithInt:v7];
  id v11 = +[FATArgument argumentWithField:v9 value:v10];
  v32[1] = v11;
  id v12 = +[FATField fieldWithIndex:3 type:8 optional:0 name:@"maxEntries"];
  id v13 = [NSNumber numberWithInt:v6];
  v14 = +[FATArgument argumentWithField:v12 value:v13];
  v32[2] = v14;
  int v15 = +[FATField fieldWithIndex:4 type:2 optional:0 name:@"fullSyncOnly"];
  v16 = [NSNumber numberWithBool:v26];
  v17 = +[FATArgument argumentWithField:v15 value:v16];
  v32[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  +[ENTProtocolUtil sendMessage:@"getSyncChunk" toProtocol:outProtocol withArguments:v18];

  inProtocol = self->_inProtocol;
  v20 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v31[0] = v20;
  v21 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v31[1] = v21;
  v22 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v31[2] = v22;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
  v24 = +[ENTProtocolUtil readMessage:@"getSyncChunk" fromProtocol:inProtocol withResponseTypes:v23];

  return v24;
}

- (id)getSyncStateWithMetrics:(id)a3 clientMetrics:(id)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v7 = a4;
  id v8 = a3;
  id v9 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v10 = +[FATArgument argumentWithField:v9 value:v8];

  v22[0] = v10;
  id v11 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"clientMetrics" structClass:objc_opt_class()];
  id v12 = +[FATArgument argumentWithField:v11 value:v7];

  v22[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  +[ENTProtocolUtil sendMessage:@"getSyncStateWithMetrics" toProtocol:outProtocol withArguments:v13];

  inProtocol = self->_inProtocol;
  int v15 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16 = +[FATField fieldWithIndex:1, 12, 0, @"userException", objc_opt_class(), v15 type optional name structClass];
  v21[1] = v16;
  v17 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v21[2] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  id v19 = +[ENTProtocolUtil readMessage:@"getSyncStateWithMetrics" fromProtocol:inProtocol withResponseTypes:v18];

  return v19;
}

- (id)getSyncState:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  outProtocol = self->_outProtocol;
  id v5 = a3;
  uint64_t v6 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"authenticationToken"];
  id v7 = +[FATArgument argumentWithField:v6 value:v5];

  v17[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  +[ENTProtocolUtil sendMessage:@"getSyncState" toProtocol:outProtocol withArguments:v8];

  inProtocol = self->_inProtocol;
  id v10 = +[FATField fieldWithIndex:0 type:12 optional:0 name:@"success" structClass:objc_opt_class()];
  v16[0] = v10;
  id v11 = +[FATField fieldWithIndex:1 type:12 optional:0 name:@"userException" structClass:objc_opt_class()];
  v16[1] = v11;
  id v12 = +[FATField fieldWithIndex:2 type:12 optional:0 name:@"systemException" structClass:objc_opt_class()];
  v16[2] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v14 = +[ENTProtocolUtil readMessage:@"getSyncState" fromProtocol:inProtocol withResponseTypes:v13];

  return v14;
}

- (EDAMNoteStoreClient)initWithInProtocol:(id)a3 outProtocol:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDAMNoteStoreClient;
  id v9 = [(EDAMNoteStoreClient *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inProtocol, a3);
    objc_storeStrong((id *)&v10->_outProtocol, a4);
  }

  return v10;
}

- (EDAMNoteStoreClient)initWithProtocol:(id)a3
{
  return [(EDAMNoteStoreClient *)self initWithInProtocol:a3 outProtocol:a3];
}

- (void)setDownloadProgressBlock:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_ProgressBlocks.isa);
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id, uint64_t, uint64_t, uint64_t))v4 + 2))(v4, 1, 1, 1);
    v3 = v4;
  }
}

- (void)setUploadProgressBlock:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_ProgressBlocks.isa);
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id, uint64_t, uint64_t, uint64_t))v4 + 2))(v4, 1, 1, 1);
    v3 = v4;
  }
}

- (void)cancel
{
  id v2 = [(ENTProtocol *)self->_outProtocol transport];
  [v2 cancel];
}

@end