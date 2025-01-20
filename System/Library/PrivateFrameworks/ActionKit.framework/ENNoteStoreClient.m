@interface ENNoteStoreClient
+ (id)noteStoreClientWithUrl:(id)a3 authenticationToken:(id)a4;
- (EDAMNoteStoreClient)client;
- (NSString)cachedAuthenticationToken;
- (NSString)cachedNoteStoreUrl;
- (id)authenticateToSharedNotebookWithGlobalId:(id)a3;
- (id)downloadProgressHandler;
- (id)uploadProgressHandler;
- (void)authenticateToSharedNoteWithGuid:(id)a3 noteKey:(id)a4 authenticationToken:(id)a5 completion:(id)a6;
- (void)authenticateToSharedNoteWithGuid:(id)a3 noteKey:(id)a4 authenticationToken:(id)a5 success:(id)a6 failure:(id)a7;
- (void)authenticateToSharedNotebook:(id)a3 completion:(id)a4;
- (void)authenticateToSharedNotebook:(id)a3 success:(id)a4 failure:(id)a5;
- (void)cancelFirstOperation;
- (void)copyNoteWithGuid:(id)a3 toNoteBookGuid:(id)a4 success:(id)a5 failure:(id)a6;
- (void)copyNoteWithGuid:(id)a3 toNotebookWithGuid:(id)a4 completion:(id)a5;
- (void)createLinkedNotebook:(id)a3 completion:(id)a4;
- (void)createLinkedNotebook:(id)a3 success:(id)a4 failure:(id)a5;
- (void)createNote:(id)a3 completion:(id)a4;
- (void)createNote:(id)a3 success:(id)a4 failure:(id)a5;
- (void)createNotebook:(id)a3 completion:(id)a4;
- (void)createNotebook:(id)a3 success:(id)a4 failure:(id)a5;
- (void)createSearch:(id)a3 completion:(id)a4;
- (void)createSearch:(id)a3 success:(id)a4 failure:(id)a5;
- (void)createSharedNotebook:(id)a3 completion:(id)a4;
- (void)createSharedNotebook:(id)a3 success:(id)a4 failure:(id)a5;
- (void)createTag:(id)a3 completion:(id)a4;
- (void)createTag:(id)a3 success:(id)a4 failure:(id)a5;
- (void)deleteNoteWithGuid:(id)a3 completion:(id)a4;
- (void)deleteNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)emailNoteWithParameters:(id)a3 completion:(id)a4;
- (void)emailNoteWithParameters:(id)a3 success:(id)a4 failure:(id)a5;
- (void)expungeInactiveNoteWithCompletion:(id)a3;
- (void)expungeInactiveNoteWithSuccess:(id)a3 failure:(id)a4;
- (void)expungeLinkedNotebookWithGuid:(id)a3 completion:(id)a4;
- (void)expungeLinkedNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)expungeNoteWithGuid:(id)a3 completion:(id)a4;
- (void)expungeNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)expungeNotebookWithGuid:(id)a3 completion:(id)a4;
- (void)expungeNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)expungeNotesWithGuids:(id)a3 completion:(id)a4;
- (void)expungeNotesWithGuids:(id)a3 success:(id)a4 failure:(id)a5;
- (void)expungeSearchWithGuid:(id)a3 completion:(id)a4;
- (void)expungeSearchWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)expungeSharedNotebooksWithIds:(id)a3 completion:(id)a4;
- (void)expungeSharedNotebooksWithIds:(id)a3 success:(id)a4 failure:(id)a5;
- (void)expungeTagWithGuid:(id)a3 completion:(id)a4;
- (void)expungeTagWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)fetchAlternateDataForResourceWithGuid:(id)a3 completion:(id)a4;
- (void)fetchAttributesForResourceWithGuid:(id)a3 completion:(id)a4;
- (void)fetchDefaultNotebookWithCompletion:(id)a3;
- (void)fetchFilteredSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 filter:(id)a5 completion:(id)a6;
- (void)fetchNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5;
- (void)fetchNoteApplicationDataWithGuid:(id)a3 completion:(id)a4;
- (void)fetchNoteContentWithGuid:(id)a3 completion:(id)a4;
- (void)fetchNoteVersionWithGuid:(id)a3 updateSequenceNum:(int)a4 resourceOptions:(unint64_t)a5 completion:(id)a6;
- (void)fetchNoteWithGuid:(id)a3 includingContent:(BOOL)a4 resourceOptions:(unint64_t)a5 completion:(id)a6;
- (void)fetchNotebookWithGuid:(id)a3 completion:(id)a4;
- (void)fetchPublicNotebookWithUserID:(int)a3 publicURI:(id)a4 completion:(id)a5;
- (void)fetchRecognitionDataForResourceWithGuid:(id)a3 completion:(id)a4;
- (void)fetchResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5;
- (void)fetchResourceApplicationDataWithGuid:(id)a3 completion:(id)a4;
- (void)fetchResourceByHashWithGuid:(id)a3 contentHash:(id)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)fetchResourceDataWithGuid:(id)a3 completion:(id)a4;
- (void)fetchResourceWithGuid:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)fetchSearchTextForNoteWithGuid:(id)a3 noteOnly:(BOOL)a4 tokenizeForIndexing:(BOOL)a5 completion:(id)a6;
- (void)fetchSearchTextForResourceWithGuid:(id)a3 completion:(id)a4;
- (void)fetchSearchWithGuid:(id)a3 completion:(id)a4;
- (void)fetchSharedNotebookByAuthWithCompletion:(id)a3;
- (void)fetchSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 fullSyncOnly:(BOOL)a5 completion:(id)a6;
- (void)fetchSyncChunkForLinkedNotebook:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 fullSyncOnly:(BOOL)a6 completion:(id)a7;
- (void)fetchSyncStateForLinkedNotebook:(id)a3 completion:(id)a4;
- (void)fetchSyncStateWithCompletion:(id)a3;
- (void)fetchTagNamesForNoteWithGuid:(id)a3 completion:(id)a4;
- (void)fetchTagWithGuid:(id)a3 completion:(id)a4;
- (void)findNoteCountsWithFilter:(id)a3 includingTrash:(BOOL)a4 completion:(id)a5;
- (void)findNoteCountsWithFilter:(id)a3 withTrash:(BOOL)a4 success:(id)a5 failure:(id)a6;
- (void)findNoteOffsetWithFilter:(id)a3 guid:(id)a4 completion:(id)a5;
- (void)findNoteOffsetWithFilter:(id)a3 guid:(id)a4 success:(id)a5 failure:(id)a6;
- (void)findNotesMetadataInternalWithFilter:(id)a3 offset:(int)a4 resultSpec:(id)a5 maxResults:(unint64_t)a6 results:(id)a7 success:(id)a8 failure:(id)a9;
- (void)findNotesMetadataWithFilter:(id)a3 maxResults:(unint64_t)a4 resultSpec:(id)a5 success:(id)a6 failure:(id)a7;
- (void)findNotesMetadataWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 resultSpec:(id)a6 completion:(id)a7;
- (void)findNotesMetadataWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 resultSpec:(id)a6 success:(id)a7 failure:(id)a8;
- (void)findNotesWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 completion:(id)a6;
- (void)findNotesWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 success:(id)a6 failure:(id)a7;
- (void)findRelatedWithQuery:(id)a3 resultSpec:(id)a4 completion:(id)a5;
- (void)findRelatedWithQuery:(id)a3 resultSpec:(id)a4 success:(id)a5 failure:(id)a6;
- (void)getDefaultNotebookWithSuccess:(id)a3 failure:(id)a4;
- (void)getFilteredSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 filter:(id)a5 success:(id)a6 failure:(id)a7;
- (void)getLinkedNotebookSyncChunk:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 fullSyncOnly:(BOOL)a6 success:(id)a7 failure:(id)a8;
- (void)getLinkedNotebookSyncState:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6;
- (void)getNoteApplicationDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getNoteContentWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getNoteSearchTextWithGuid:(id)a3 noteOnly:(BOOL)a4 tokenizeForIndexing:(BOOL)a5 success:(id)a6 failure:(id)a7;
- (void)getNoteTagNamesWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getNoteVersionWithGuid:(id)a3 updateSequenceNum:(int)a4 withResourcesData:(BOOL)a5 withResourcesRecognition:(BOOL)a6 withResourcesAlternateData:(BOOL)a7 success:(id)a8 failure:(id)a9;
- (void)getNoteWithGuid:(id)a3 withContent:(BOOL)a4 withResourcesData:(BOOL)a5 withResourcesRecognition:(BOOL)a6 withResourcesAlternateData:(BOOL)a7 success:(id)a8 failure:(id)a9;
- (void)getNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getPublicNotebookWithUserID:(int)a3 publicUri:(id)a4 success:(id)a5 failure:(id)a6;
- (void)getResourceAlternateDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6;
- (void)getResourceApplicationDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getResourceAttributesWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getResourceByHashWithGuid:(id)a3 contentHash:(id)a4 withData:(BOOL)a5 withRecognition:(BOOL)a6 withAlternateData:(BOOL)a7 success:(id)a8 failure:(id)a9;
- (void)getResourceDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getResourceRecognitionWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getResourceSearchTextWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getResourceWithGuid:(id)a3 withData:(BOOL)a4 withRecognition:(BOOL)a5 withAttributes:(BOOL)a6 withAlternateDate:(BOOL)a7 success:(id)a8 failure:(id)a9;
- (void)getSearchWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)getSharedNotebookByAuthWithSuccess:(id)a3 failure:(id)a4;
- (void)getSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 fullSyncOnly:(BOOL)a5 success:(id)a6 failure:(id)a7;
- (void)getSyncStateWithSuccess:(id)a3 failure:(id)a4;
- (void)getTagWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)listLinkedNotebooksWithCompletion:(id)a3;
- (void)listLinkedNotebooksWithSuccess:(id)a3 failure:(id)a4;
- (void)listNoteVersionsWithGuid:(id)a3 completion:(id)a4;
- (void)listNoteVersionsWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)listNotebooksWithCompletion:(id)a3;
- (void)listNotebooksWithSuccess:(id)a3 failure:(id)a4;
- (void)listSearchesWithCompletion:(id)a3;
- (void)listSearchesWithSuccess:(id)a3 failure:(id)a4;
- (void)listSharedNotebooksWithCompletion:(id)a3;
- (void)listSharedNotebooksWithSuccess:(id)a3 failure:(id)a4;
- (void)listTagsByNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)listTagsInNotebookWithGuid:(id)a3 completion:(id)a4;
- (void)listTagsWithCompletion:(id)a3;
- (void)listTagsWithSuccess:(id)a3 failure:(id)a4;
- (void)sendMessageToMembersOfSharedNotebookWithGuid:(id)a3 messageText:(id)a4 recipients:(id)a5 completion:(id)a6;
- (void)sendMessageToSharedNotebookMembersWithGuid:(id)a3 messageText:(id)a4 recipients:(id)a5 success:(id)a6 failure:(id)a7;
- (void)setCachedAuthenticationToken:(id)a3;
- (void)setCachedNoteStoreUrl:(id)a3;
- (void)setClient:(id)a3;
- (void)setDownloadProgressHandler:(id)a3;
- (void)setNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 completion:(id)a6;
- (void)setNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 success:(id)a6 failure:(id)a7;
- (void)setRecipientSettings:(id)a3 forSharedNotebookWithID:(int64_t)a4 completion:(id)a5;
- (void)setResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 completion:(id)a6;
- (void)setResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 success:(id)a6 failure:(id)a7;
- (void)setSharedNotebookRecipientSettingsWithSharedNotebookId:(int64_t)a3 recipientSettings:(id)a4 success:(id)a5 failure:(id)a6;
- (void)setUploadProgressHandler:(id)a3;
- (void)shareNoteWithGuid:(id)a3 completion:(id)a4;
- (void)shareNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)stopSharingNoteWithGuid:(id)a3 completion:(id)a4;
- (void)stopSharingNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)unsetNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5;
- (void)unsetNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6;
- (void)unsetResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5;
- (void)unsetResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6;
- (void)untagAllWithGuid:(id)a3 completion:(id)a4;
- (void)untagAllWithGuid:(id)a3 success:(id)a4 failure:(id)a5;
- (void)updateLinkedNotebook:(id)a3 completion:(id)a4;
- (void)updateLinkedNotebook:(id)a3 success:(id)a4 failure:(id)a5;
- (void)updateNote:(id)a3 completion:(id)a4;
- (void)updateNote:(id)a3 success:(id)a4 failure:(id)a5;
- (void)updateNotebook:(id)a3 completion:(id)a4;
- (void)updateNotebook:(id)a3 success:(id)a4 failure:(id)a5;
- (void)updateProgressHandlers;
- (void)updateResource:(id)a3 completion:(id)a4;
- (void)updateResource:(id)a3 success:(id)a4 failure:(id)a5;
- (void)updateSearch:(id)a3 completion:(id)a4;
- (void)updateSearch:(id)a3 success:(id)a4 failure:(id)a5;
- (void)updateSharedNotebook:(id)a3 completion:(id)a4;
- (void)updateSharedNotebook:(id)a3 success:(id)a4 failure:(id)a5;
- (void)updateTag:(id)a3 completion:(id)a4;
- (void)updateTag:(id)a3 success:(id)a4 failure:(id)a5;
@end

@implementation ENNoteStoreClient

+ (id)noteStoreClientWithUrl:(id)a3 authenticationToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setCachedNoteStoreUrl:v7];

  [v8 setCachedAuthenticationToken:v6];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_cachedNoteStoreUrl, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_downloadProgressHandler, 0);
  objc_storeStrong(&self->_uploadProgressHandler, 0);
}

- (void)setCachedAuthenticationToken:(id)a3
{
}

- (NSString)cachedAuthenticationToken
{
  return self->_cachedAuthenticationToken;
}

- (void)setCachedNoteStoreUrl:(id)a3
{
}

- (NSString)cachedNoteStoreUrl
{
  return self->_cachedNoteStoreUrl;
}

- (void)setClient:(id)a3
{
}

- (id)downloadProgressHandler
{
  return self->_downloadProgressHandler;
}

- (id)uploadProgressHandler
{
  return self->_uploadProgressHandler;
}

- (void)setSharedNotebookRecipientSettingsWithSharedNotebookId:(int64_t)a3 recipientSettings:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __110__ENNoteStoreClient_setSharedNotebookRecipientSettingsWithSharedNotebookId_recipientSettings_success_failure___block_invoke;
  v14[3] = &unk_264E5C620;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self setRecipientSettings:a4 forSharedNotebookWithID:a3 completion:v14];
}

uint64_t __110__ENNoteStoreClient_setSharedNotebookRecipientSettingsWithSharedNotebookId_recipientSettings_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateSharedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__ENNoteStoreClient_updateSharedNotebook_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self updateSharedNotebook:a3 completion:v12];
}

uint64_t __58__ENNoteStoreClient_updateSharedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)authenticateToSharedNoteWithGuid:(id)a3 noteKey:(id)a4 authenticationToken:(id)a5 success:(id)a6 failure:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__ENNoteStoreClient_authenticateToSharedNoteWithGuid_noteKey_authenticationToken_success_failure___block_invoke;
  v16[3] = &unk_264E5C8A0;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENNoteStoreClient *)self authenticateToSharedNoteWithGuid:a3 noteKey:a4 authenticationToken:a5 completion:v16];
}

uint64_t __98__ENNoteStoreClient_authenticateToSharedNoteWithGuid_noteKey_authenticationToken_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)stopSharingNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_stopSharingNoteWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C670;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self stopSharingNoteWithGuid:a3 completion:v12];
}

uint64_t __61__ENNoteStoreClient_stopSharingNoteWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)shareNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__ENNoteStoreClient_shareNoteWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C7B0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self shareNoteWithGuid:a3 completion:v12];
}

uint64_t __55__ENNoteStoreClient_shareNoteWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)emailNoteWithParameters:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_emailNoteWithParameters_success_failure___block_invoke;
  v12[3] = &unk_264E5C670;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self emailNoteWithParameters:a3 completion:v12];
}

uint64_t __61__ENNoteStoreClient_emailNoteWithParameters_success_failure___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getSharedNotebookByAuthWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__ENNoteStoreClient_getSharedNotebookByAuthWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C850;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENNoteStoreClient *)self fetchSharedNotebookByAuthWithCompletion:v10];
}

uint64_t __64__ENNoteStoreClient_getSharedNotebookByAuthWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)authenticateToSharedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__ENNoteStoreClient_authenticateToSharedNotebook_success_failure___block_invoke;
  v12[3] = &unk_264E5C8A0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self authenticateToSharedNotebook:a3 completion:v12];
}

uint64_t __66__ENNoteStoreClient_authenticateToSharedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)expungeLinkedNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__ENNoteStoreClient_expungeLinkedNotebookWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self expungeLinkedNotebookWithGuid:a3 completion:v12];
}

uint64_t __67__ENNoteStoreClient_expungeLinkedNotebookWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)listLinkedNotebooksWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__ENNoteStoreClient_listLinkedNotebooksWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C5D0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENNoteStoreClient *)self listLinkedNotebooksWithCompletion:v10];
}

uint64_t __60__ENNoteStoreClient_listLinkedNotebooksWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateLinkedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__ENNoteStoreClient_updateLinkedNotebook_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self updateLinkedNotebook:a3 completion:v12];
}

uint64_t __58__ENNoteStoreClient_updateLinkedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createLinkedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__ENNoteStoreClient_createLinkedNotebook_success_failure___block_invoke;
  v12[3] = &unk_264E5C878;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self createLinkedNotebook:a3 completion:v12];
}

uint64_t __58__ENNoteStoreClient_createLinkedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)expungeSharedNotebooksWithIds:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__ENNoteStoreClient_expungeSharedNotebooksWithIds_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self expungeSharedNotebooksWithIds:a3 completion:v12];
}

uint64_t __67__ENNoteStoreClient_expungeSharedNotebooksWithIds_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)listSharedNotebooksWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__ENNoteStoreClient_listSharedNotebooksWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C5D0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENNoteStoreClient *)self listSharedNotebooksWithCompletion:v10];
}

uint64_t __60__ENNoteStoreClient_listSharedNotebooksWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)sendMessageToSharedNotebookMembersWithGuid:(id)a3 messageText:(id)a4 recipients:(id)a5 success:(id)a6 failure:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __103__ENNoteStoreClient_sendMessageToSharedNotebookMembersWithGuid_messageText_recipients_success_failure___block_invoke;
  v16[3] = &unk_264E5C620;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENNoteStoreClient *)self sendMessageToMembersOfSharedNotebookWithGuid:a3 messageText:a4 recipients:a5 completion:v16];
}

uint64_t __103__ENNoteStoreClient_sendMessageToSharedNotebookMembersWithGuid_messageText_recipients_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createSharedNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__ENNoteStoreClient_createSharedNotebook_success_failure___block_invoke;
  v12[3] = &unk_264E5C850;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self createSharedNotebook:a3 completion:v12];
}

uint64_t __58__ENNoteStoreClient_createSharedNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getPublicNotebookWithUserID:(int)a3 publicUri:(id)a4 success:(id)a5 failure:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__ENNoteStoreClient_getPublicNotebookWithUserID_publicUri_success_failure___block_invoke;
  v14[3] = &unk_264E5C5F8;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self fetchPublicNotebookWithUserID:v8 publicURI:a4 completion:v14];
}

uint64_t __75__ENNoteStoreClient_getPublicNotebookWithUserID_publicUri_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getResourceAttributesWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__ENNoteStoreClient_getResourceAttributesWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C828;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchAttributesForResourceWithGuid:a3 completion:v12];
}

uint64_t __67__ENNoteStoreClient_getResourceAttributesWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getResourceAlternateDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__ENNoteStoreClient_getResourceAlternateDataWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C800;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchAlternateDataForResourceWithGuid:a3 completion:v12];
}

uint64_t __70__ENNoteStoreClient_getResourceAlternateDataWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getResourceRecognitionWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__ENNoteStoreClient_getResourceRecognitionWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C800;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchRecognitionDataForResourceWithGuid:a3 completion:v12];
}

uint64_t __68__ENNoteStoreClient_getResourceRecognitionWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getResourceByHashWithGuid:(id)a3 contentHash:(id)a4 withData:(BOOL)a5 withRecognition:(BOOL)a6 withAlternateData:(BOOL)a7 success:(id)a8 failure:(id)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v15 = a8;
  id v16 = a9;
  uint64_t v17 = v11;
  if (v10) {
    uint64_t v17 = v11 | 2;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __118__ENNoteStoreClient_getResourceByHashWithGuid_contentHash_withData_withRecognition_withAlternateData_success_failure___block_invoke;
  v21[3] = &unk_264E5C7D8;
  if (v9) {
    uint64_t v18 = v17 | 4;
  }
  else {
    uint64_t v18 = v17;
  }
  id v22 = v15;
  id v23 = v16;
  id v19 = v16;
  id v20 = v15;
  [(ENNoteStoreClient *)self fetchResourceByHashWithGuid:a3 contentHash:a4 options:v18 completion:v21];
}

uint64_t __118__ENNoteStoreClient_getResourceByHashWithGuid_contentHash_withData_withRecognition_withAlternateData_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getResourceDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_getResourceDataWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C800;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchResourceDataWithGuid:a3 completion:v12];
}

uint64_t __61__ENNoteStoreClient_getResourceDataWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateResource:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__ENNoteStoreClient_updateResource_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self updateResource:a3 completion:v12];
}

uint64_t __52__ENNoteStoreClient_updateResource_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)unsetResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__ENNoteStoreClient_unsetResourceApplicationDataEntryWithGuid_key_success_failure___block_invoke;
  v14[3] = &unk_264E5C620;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self unsetResourceApplicationDataEntryWithGuid:a3 key:a4 completion:v14];
}

uint64_t __83__ENNoteStoreClient_unsetResourceApplicationDataEntryWithGuid_key_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 success:(id)a6 failure:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__ENNoteStoreClient_setResourceApplicationDataEntryWithGuid_key_value_success_failure___block_invoke;
  v16[3] = &unk_264E5C620;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENNoteStoreClient *)self setResourceApplicationDataEntryWithGuid:a3 key:a4 value:a5 completion:v16];
}

uint64_t __87__ENNoteStoreClient_setResourceApplicationDataEntryWithGuid_key_value_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__ENNoteStoreClient_getResourceApplicationDataEntryWithGuid_key_success_failure___block_invoke;
  v14[3] = &unk_264E5C7B0;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self fetchResourceApplicationDataEntryWithGuid:a3 key:a4 completion:v14];
}

uint64_t __81__ENNoteStoreClient_getResourceApplicationDataEntryWithGuid_key_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getResourceApplicationDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__ENNoteStoreClient_getResourceApplicationDataWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C788;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchResourceApplicationDataWithGuid:a3 completion:v12];
}

uint64_t __72__ENNoteStoreClient_getResourceApplicationDataWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getResourceWithGuid:(id)a3 withData:(BOOL)a4 withRecognition:(BOOL)a5 withAttributes:(BOOL)a6 withAlternateDate:(BOOL)a7 success:(id)a8 failure:(id)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v15 = a8;
  id v16 = a9;
  uint64_t v17 = v12;
  if (v11) {
    uint64_t v17 = v12 | 2;
  }
  if (v9) {
    v17 |= 4uLL;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __115__ENNoteStoreClient_getResourceWithGuid_withData_withRecognition_withAttributes_withAlternateDate_success_failure___block_invoke;
  v21[3] = &unk_264E5C7D8;
  if (v10) {
    uint64_t v18 = v17 | 8;
  }
  else {
    uint64_t v18 = v17;
  }
  id v22 = v15;
  id v23 = v16;
  id v19 = v16;
  id v20 = v15;
  [(ENNoteStoreClient *)self fetchResourceWithGuid:a3 options:v18 completion:v21];
}

uint64_t __115__ENNoteStoreClient_getResourceWithGuid_withData_withRecognition_withAttributes_withAlternateDate_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getNoteVersionWithGuid:(id)a3 updateSequenceNum:(int)a4 withResourcesData:(BOOL)a5 withResourcesRecognition:(BOOL)a6 withResourcesAlternateData:(BOOL)a7 success:(id)a8 failure:(id)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a4;
  id v15 = a8;
  id v16 = a9;
  uint64_t v17 = v11;
  if (v10) {
    uint64_t v17 = v11 | 2;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __148__ENNoteStoreClient_getNoteVersionWithGuid_updateSequenceNum_withResourcesData_withResourcesRecognition_withResourcesAlternateData_success_failure___block_invoke;
  v21[3] = &unk_264E5C760;
  if (v9) {
    uint64_t v18 = v17 | 4;
  }
  else {
    uint64_t v18 = v17;
  }
  id v22 = v15;
  id v23 = v16;
  id v19 = v16;
  id v20 = v15;
  [(ENNoteStoreClient *)self fetchNoteVersionWithGuid:a3 updateSequenceNum:v12 resourceOptions:v18 completion:v21];
}

uint64_t __148__ENNoteStoreClient_getNoteVersionWithGuid_updateSequenceNum_withResourcesData_withResourcesRecognition_withResourcesAlternateData_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)listNoteVersionsWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__ENNoteStoreClient_listNoteVersionsWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C5D0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self listNoteVersionsWithGuid:a3 completion:v12];
}

uint64_t __62__ENNoteStoreClient_listNoteVersionsWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)copyNoteWithGuid:(id)a3 toNoteBookGuid:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__ENNoteStoreClient_copyNoteWithGuid_toNoteBookGuid_success_failure___block_invoke;
  v14[3] = &unk_264E5C760;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self copyNoteWithGuid:a3 toNotebookWithGuid:a4 completion:v14];
}

uint64_t __69__ENNoteStoreClient_copyNoteWithGuid_toNoteBookGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)expungeInactiveNoteWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__ENNoteStoreClient_expungeInactiveNoteWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C620;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENNoteStoreClient *)self expungeInactiveNoteWithCompletion:v10];
}

uint64_t __60__ENNoteStoreClient_expungeInactiveNoteWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)expungeNotesWithGuids:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__ENNoteStoreClient_expungeNotesWithGuids_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self expungeNotesWithGuids:a3 completion:v12];
}

uint64_t __59__ENNoteStoreClient_expungeNotesWithGuids_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)expungeNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__ENNoteStoreClient_expungeNoteWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self expungeNoteWithGuid:a3 completion:v12];
}

uint64_t __57__ENNoteStoreClient_expungeNoteWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)deleteNoteWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__ENNoteStoreClient_deleteNoteWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self deleteNoteWithGuid:a3 completion:v12];
}

uint64_t __56__ENNoteStoreClient_deleteNoteWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateNote:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__ENNoteStoreClient_updateNote_success_failure___block_invoke;
  v12[3] = &unk_264E5C760;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self updateNote:a3 completion:v12];
}

uint64_t __48__ENNoteStoreClient_updateNote_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createNote:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__ENNoteStoreClient_createNote_success_failure___block_invoke;
  v12[3] = &unk_264E5C760;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self createNote:a3 completion:v12];
}

uint64_t __48__ENNoteStoreClient_createNote_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getNoteTagNamesWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_getNoteTagNamesWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C5D0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchTagNamesForNoteWithGuid:a3 completion:v12];
}

uint64_t __61__ENNoteStoreClient_getNoteTagNamesWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getResourceSearchTextWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__ENNoteStoreClient_getResourceSearchTextWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C7B0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchSearchTextForResourceWithGuid:a3 completion:v12];
}

uint64_t __67__ENNoteStoreClient_getResourceSearchTextWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getNoteSearchTextWithGuid:(id)a3 noteOnly:(BOOL)a4 tokenizeForIndexing:(BOOL)a5 success:(id)a6 failure:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __92__ENNoteStoreClient_getNoteSearchTextWithGuid_noteOnly_tokenizeForIndexing_success_failure___block_invoke;
  v16[3] = &unk_264E5C7B0;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENNoteStoreClient *)self fetchSearchTextForNoteWithGuid:a3 noteOnly:v9 tokenizeForIndexing:v8 completion:v16];
}

uint64_t __92__ENNoteStoreClient_getNoteSearchTextWithGuid_noteOnly_tokenizeForIndexing_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getNoteContentWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__ENNoteStoreClient_getNoteContentWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C7B0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchNoteContentWithGuid:a3 completion:v12];
}

uint64_t __60__ENNoteStoreClient_getNoteContentWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)unsetNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__ENNoteStoreClient_unsetNoteApplicationDataEntryWithGuid_key_success_failure___block_invoke;
  v14[3] = &unk_264E5C620;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self unsetNoteApplicationDataEntryWithGuid:a3 key:a4 completion:v14];
}

uint64_t __79__ENNoteStoreClient_unsetNoteApplicationDataEntryWithGuid_key_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 success:(id)a6 failure:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__ENNoteStoreClient_setNoteApplicationDataEntryWithGuid_key_value_success_failure___block_invoke;
  v16[3] = &unk_264E5C620;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENNoteStoreClient *)self setNoteApplicationDataEntryWithGuid:a3 key:a4 value:a5 completion:v16];
}

uint64_t __83__ENNoteStoreClient_setNoteApplicationDataEntryWithGuid_key_value_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__ENNoteStoreClient_getNoteApplicationDataEntryWithGuid_key_success_failure___block_invoke;
  v14[3] = &unk_264E5C7B0;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self fetchNoteApplicationDataEntryWithGuid:a3 key:a4 completion:v14];
}

uint64_t __77__ENNoteStoreClient_getNoteApplicationDataEntryWithGuid_key_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getNoteApplicationDataWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__ENNoteStoreClient_getNoteApplicationDataWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C788;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchNoteApplicationDataWithGuid:a3 completion:v12];
}

uint64_t __68__ENNoteStoreClient_getNoteApplicationDataWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getNoteWithGuid:(id)a3 withContent:(BOOL)a4 withResourcesData:(BOOL)a5 withResourcesRecognition:(BOOL)a6 withResourcesAlternateData:(BOOL)a7 success:(id)a8 failure:(id)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v15 = a8;
  id v16 = a9;
  uint64_t v17 = v11;
  if (v10) {
    uint64_t v17 = v11 | 2;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __135__ENNoteStoreClient_getNoteWithGuid_withContent_withResourcesData_withResourcesRecognition_withResourcesAlternateData_success_failure___block_invoke;
  v21[3] = &unk_264E5C760;
  if (v9) {
    uint64_t v18 = v17 | 4;
  }
  else {
    uint64_t v18 = v17;
  }
  id v22 = v15;
  id v23 = v16;
  id v19 = v16;
  id v20 = v15;
  [(ENNoteStoreClient *)self fetchNoteWithGuid:a3 includingContent:v12 resourceOptions:v18 completion:v21];
}

uint64_t __135__ENNoteStoreClient_getNoteWithGuid_withContent_withResourcesData_withResourcesRecognition_withResourcesAlternateData_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)findNoteCountsWithFilter:(id)a3 withTrash:(BOOL)a4 success:(id)a5 failure:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__ENNoteStoreClient_findNoteCountsWithFilter_withTrash_success_failure___block_invoke;
  v14[3] = &unk_264E5C738;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self findNoteCountsWithFilter:a3 includingTrash:v7 completion:v14];
}

uint64_t __72__ENNoteStoreClient_findNoteCountsWithFilter_withTrash_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)findNotesMetadataWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 resultSpec:(id)a6 success:(id)a7 failure:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  id v14 = a7;
  id v15 = a8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__ENNoteStoreClient_findNotesMetadataWithFilter_offset_maxNotes_resultSpec_success_failure___block_invoke;
  v18[3] = &unk_264E5C710;
  id v19 = v14;
  id v20 = v15;
  id v16 = v15;
  id v17 = v14;
  [(ENNoteStoreClient *)self findNotesMetadataWithFilter:a3 offset:v11 maxNotes:v10 resultSpec:a6 completion:v18];
}

uint64_t __92__ENNoteStoreClient_findNotesMetadataWithFilter_offset_maxNotes_resultSpec_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)findNoteOffsetWithFilter:(id)a3 guid:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__ENNoteStoreClient_findNoteOffsetWithFilter_guid_success_failure___block_invoke;
  v14[3] = &unk_264E5C620;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self findNoteOffsetWithFilter:a3 guid:a4 completion:v14];
}

uint64_t __67__ENNoteStoreClient_findNoteOffsetWithFilter_guid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)findNotesWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 success:(id)a6 failure:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__ENNoteStoreClient_findNotesWithFilter_offset_maxNotes_success_failure___block_invoke;
  v16[3] = &unk_264E5C6E8;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENNoteStoreClient *)self findNotesWithFilter:a3 offset:v9 maxNotes:v8 completion:v16];
}

uint64_t __73__ENNoteStoreClient_findNotesWithFilter_offset_maxNotes_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)findRelatedWithQuery:(id)a3 resultSpec:(id)a4 success:(id)a5 failure:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__ENNoteStoreClient_findRelatedWithQuery_resultSpec_success_failure___block_invoke;
  v14[3] = &unk_264E5C6C0;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(ENNoteStoreClient *)self findRelatedWithQuery:a3 resultSpec:a4 completion:v14];
}

uint64_t __69__ENNoteStoreClient_findRelatedWithQuery_resultSpec_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)expungeSearchWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__ENNoteStoreClient_expungeSearchWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self expungeSearchWithGuid:a3 completion:v12];
}

uint64_t __59__ENNoteStoreClient_expungeSearchWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateSearch:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__ENNoteStoreClient_updateSearch_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self updateSearch:a3 completion:v12];
}

uint64_t __50__ENNoteStoreClient_updateSearch_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createSearch:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__ENNoteStoreClient_createSearch_success_failure___block_invoke;
  v12[3] = &unk_264E5C698;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self createSearch:a3 completion:v12];
}

uint64_t __50__ENNoteStoreClient_createSearch_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getSearchWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__ENNoteStoreClient_getSearchWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C698;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchSearchWithGuid:a3 completion:v12];
}

uint64_t __55__ENNoteStoreClient_getSearchWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)listSearchesWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__ENNoteStoreClient_listSearchesWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C5D0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENNoteStoreClient *)self listSearchesWithCompletion:v10];
}

uint64_t __53__ENNoteStoreClient_listSearchesWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)expungeTagWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__ENNoteStoreClient_expungeTagWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self expungeTagWithGuid:a3 completion:v12];
}

uint64_t __56__ENNoteStoreClient_expungeTagWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)untagAllWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__ENNoteStoreClient_untagAllWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C670;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self untagAllWithGuid:a3 completion:v12];
}

uint64_t __54__ENNoteStoreClient_untagAllWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateTag:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__ENNoteStoreClient_updateTag_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self updateTag:a3 completion:v12];
}

uint64_t __47__ENNoteStoreClient_updateTag_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createTag:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__ENNoteStoreClient_createTag_success_failure___block_invoke;
  v12[3] = &unk_264E5C648;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self createTag:a3 completion:v12];
}

uint64_t __47__ENNoteStoreClient_createTag_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getTagWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__ENNoteStoreClient_getTagWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C648;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchTagWithGuid:a3 completion:v12];
}

uint64_t __52__ENNoteStoreClient_getTagWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)listTagsByNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__ENNoteStoreClient_listTagsByNotebookWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C5D0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self listTagsInNotebookWithGuid:a3 completion:v12];
}

uint64_t __64__ENNoteStoreClient_listTagsByNotebookWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)listTagsWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__ENNoteStoreClient_listTagsWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C5D0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENNoteStoreClient *)self listTagsWithCompletion:v10];
}

uint64_t __49__ENNoteStoreClient_listTagsWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)expungeNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__ENNoteStoreClient_expungeNotebookWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self expungeNotebookWithGuid:a3 completion:v12];
}

uint64_t __61__ENNoteStoreClient_expungeNotebookWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)updateNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__ENNoteStoreClient_updateNotebook_success_failure___block_invoke;
  v12[3] = &unk_264E5C620;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self updateNotebook:a3 completion:v12];
}

uint64_t __52__ENNoteStoreClient_updateNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__ENNoteStoreClient_createNotebook_success_failure___block_invoke;
  v12[3] = &unk_264E5C5F8;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self createNotebook:a3 completion:v12];
}

uint64_t __52__ENNoteStoreClient_createNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getDefaultNotebookWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__ENNoteStoreClient_getDefaultNotebookWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C5F8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENNoteStoreClient *)self fetchDefaultNotebookWithCompletion:v10];
}

uint64_t __59__ENNoteStoreClient_getDefaultNotebookWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getNotebookWithGuid:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__ENNoteStoreClient_getNotebookWithGuid_success_failure___block_invoke;
  v12[3] = &unk_264E5C5F8;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchNotebookWithGuid:a3 completion:v12];
}

uint64_t __57__ENNoteStoreClient_getNotebookWithGuid_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)listNotebooksWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__ENNoteStoreClient_listNotebooksWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C5D0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENNoteStoreClient *)self listNotebooksWithCompletion:v10];
}

uint64_t __54__ENNoteStoreClient_listNotebooksWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getLinkedNotebookSyncChunk:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 fullSyncOnly:(BOOL)a6 success:(id)a7 failure:(id)a8
{
  BOOL v9 = a6;
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  id v14 = a7;
  id v15 = a8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __97__ENNoteStoreClient_getLinkedNotebookSyncChunk_afterUSN_maxEntries_fullSyncOnly_success_failure___block_invoke;
  v18[3] = &unk_264E5C5A8;
  id v19 = v14;
  id v20 = v15;
  id v16 = v15;
  id v17 = v14;
  [(ENNoteStoreClient *)self fetchSyncChunkForLinkedNotebook:a3 afterUSN:v11 maxEntries:v10 fullSyncOnly:v9 completion:v18];
}

uint64_t __97__ENNoteStoreClient_getLinkedNotebookSyncChunk_afterUSN_maxEntries_fullSyncOnly_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getLinkedNotebookSyncState:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__ENNoteStoreClient_getLinkedNotebookSyncState_success_failure___block_invoke;
  v12[3] = &unk_264E5C580;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENNoteStoreClient *)self fetchSyncStateForLinkedNotebook:a3 completion:v12];
}

uint64_t __64__ENNoteStoreClient_getLinkedNotebookSyncState_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getFilteredSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 filter:(id)a5 success:(id)a6 failure:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __84__ENNoteStoreClient_getFilteredSyncChunkAfterUSN_maxEntries_filter_success_failure___block_invoke;
  v16[3] = &unk_264E5C5A8;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENNoteStoreClient *)self fetchFilteredSyncChunkAfterUSN:v10 maxEntries:v9 filter:a5 completion:v16];
}

uint64_t __84__ENNoteStoreClient_getFilteredSyncChunkAfterUSN_maxEntries_filter_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 fullSyncOnly:(BOOL)a5 success:(id)a6 failure:(id)a7
{
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a6;
  id v13 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__ENNoteStoreClient_getSyncChunkAfterUSN_maxEntries_fullSyncOnly_success_failure___block_invoke;
  v16[3] = &unk_264E5C5A8;
  id v17 = v12;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENNoteStoreClient *)self fetchSyncChunkAfterUSN:v10 maxEntries:v9 fullSyncOnly:v8 completion:v16];
}

uint64_t __82__ENNoteStoreClient_getSyncChunkAfterUSN_maxEntries_fullSyncOnly_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getSyncStateWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__ENNoteStoreClient_getSyncStateWithSuccess_failure___block_invoke;
  v10[3] = &unk_264E5C580;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(ENNoteStoreClient *)self fetchSyncStateWithCompletion:v10];
}

uint64_t __53__ENNoteStoreClient_getSyncStateWithSuccess_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)findNotesMetadataInternalWithFilter:(id)a3 offset:(int)a4 resultSpec:(id)a5 maxResults:(unint64_t)a6 results:(id)a7 success:(id)a8 failure:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = (void (**)(id, id))a8;
  id v19 = a9;
  if (a6)
  {
    if ([v17 count] >= a6)
    {
      v18[2](v18, v17);
      goto LABEL_9;
    }
    unsigned int v22 = a4;
    uint64_t v20 = [v17 count];
    if (a6 - v20 >= 0x64) {
      uint64_t v21 = 100;
    }
    else {
      uint64_t v21 = a6 - v20;
    }
  }
  else
  {
    unsigned int v22 = a4;
    uint64_t v21 = 100;
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __110__ENNoteStoreClient_findNotesMetadataInternalWithFilter_offset_resultSpec_maxResults_results_success_failure___block_invoke;
  v23[3] = &unk_264E5C558;
  id v28 = v19;
  id v24 = v17;
  v25 = self;
  id v26 = v15;
  id v27 = v16;
  unint64_t v30 = a6;
  v29 = v18;
  [(ENNoteStoreClient *)self findNotesMetadataWithFilter:v26 offset:v22 maxNotes:v21 resultSpec:v27 completion:v23];

LABEL_9:
}

void __110__ENNoteStoreClient_findNotesMetadataInternalWithFilter_offset_resultSpec_maxResults_results_success_failure___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v13 = v5;
  if (a3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 notes];
    [v7 addObjectsFromArray:v8];

    id v9 = [v13 startIndex];
    LODWORD(v7) = [v9 intValue];
    uint64_t v10 = [v13 notes];
    uint64_t v11 = v7 + [v10 count];

    id v12 = [v13 totalNotes];
    LODWORD(v10) = [v12 intValue];

    if ((int)v10 > (int)v11)
    {
      [*(id *)(a1 + 40) findNotesMetadataInternalWithFilter:*(void *)(a1 + 48) offset:v11 resultSpec:*(void *)(a1 + 56) maxResults:*(void *)(a1 + 80) results:*(void *)(a1 + 32) success:*(void *)(a1 + 72) failure:*(void *)(a1 + 64)];
      goto LABEL_7;
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  v6();
LABEL_7:
}

- (void)findNotesMetadataWithFilter:(id)a3 maxResults:(unint64_t)a4 resultSpec:(id)a5 success:(id)a6 failure:(id)a7
{
  id v12 = (objc_class *)MEMORY[0x263EFF980];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = objc_alloc_init(v12);
  [(ENNoteStoreClient *)self findNotesMetadataInternalWithFilter:v16 offset:0 resultSpec:v15 maxResults:a4 results:v17 success:v14 failure:v13];
}

- (void)cancelFirstOperation
{
  id v2 = [(ENNoteStoreClient *)self client];
  [v2 cancel];
}

- (void)setRecipientSettings:(id)a3 forSharedNotebookWithID:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__ENNoteStoreClient_setRecipientSettings_forSharedNotebookWithID_completion___block_invoke;
  v10[3] = &unk_264E5C530;
  id v11 = v8;
  int64_t v12 = a4;
  void v10[4] = self;
  id v9 = v8;
  [(ENStoreClient *)self invokeAsyncInt32Block:v10 completion:a5];
}

uint64_t __77__ENNoteStoreClient_setRecipientSettings_forSharedNotebookWithID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 setSharedNotebookRecipientSettings:v3 sharedNotebookId:*(void *)(a1 + 48) recipientSettings:*(void *)(a1 + 40)];

  return v4;
}

- (void)updateSharedNotebook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__ENNoteStoreClient_updateSharedNotebook_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __53__ENNoteStoreClient_updateSharedNotebook_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 updateSharedNotebook:v3 sharedNotebook:*(void *)(a1 + 40)];

  return v4;
}

- (void)authenticateToSharedNoteWithGuid:(id)a3 noteKey:(id)a4 authenticationToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __93__ENNoteStoreClient_authenticateToSharedNoteWithGuid_noteKey_authenticationToken_completion___block_invoke;
  v16[3] = &unk_264E5C508;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v16 completion:a6];
}

id __93__ENNoteStoreClient_authenticateToSharedNoteWithGuid_noteKey_authenticationToken_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  v3 = [v2 authenticateToSharedNote:*(void *)(a1 + 40) noteKey:*(void *)(a1 + 48) authenticationToken:*(void *)(a1 + 56)];

  return v3;
}

- (void)stopSharingNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ENNoteStoreClient_stopSharingNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5DED8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncBlock:v8 completion:a4];
}

void __56__ENNoteStoreClient_stopSharingNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client];
  id v2 = [*(id *)(a1 + 32) authenticationToken];
  [v3 stopSharingNote:v2 guid:*(void *)(a1 + 40)];
}

- (void)shareNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__ENNoteStoreClient_shareNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __50__ENNoteStoreClient_shareNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 shareNote:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)emailNoteWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ENNoteStoreClient_emailNoteWithParameters_completion___block_invoke;
  v8[3] = &unk_264E5DED8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncBlock:v8 completion:a4];
}

void __56__ENNoteStoreClient_emailNoteWithParameters_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client];
  id v2 = [*(id *)(a1 + 32) authenticationToken];
  [v3 emailNote:v2 parameters:*(void *)(a1 + 40)];
}

- (void)fetchSharedNotebookByAuthWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__ENNoteStoreClient_fetchSharedNotebookByAuthWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __61__ENNoteStoreClient_fetchSharedNotebookByAuthWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getSharedNotebookByAuth:v3];

  return v4;
}

- (void)authenticateToSharedNotebook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__ENNoteStoreClient_authenticateToSharedNotebook_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __61__ENNoteStoreClient_authenticateToSharedNotebook_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) authenticationToken];
  id v5 = [v2 authenticateToSharedNotebook:v3 authenticationToken:v4];

  return v5;
}

- (void)expungeLinkedNotebookWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__ENNoteStoreClient_expungeLinkedNotebookWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __62__ENNoteStoreClient_expungeLinkedNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 expungeLinkedNotebook:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)listLinkedNotebooksWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__ENNoteStoreClient_listLinkedNotebooksWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __55__ENNoteStoreClient_listLinkedNotebooksWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 listLinkedNotebooks:v3];

  return v4;
}

- (void)updateLinkedNotebook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__ENNoteStoreClient_updateLinkedNotebook_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __53__ENNoteStoreClient_updateLinkedNotebook_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 updateLinkedNotebook:v3 linkedNotebook:*(void *)(a1 + 40)];

  return v4;
}

- (void)createLinkedNotebook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__ENNoteStoreClient_createLinkedNotebook_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __53__ENNoteStoreClient_createLinkedNotebook_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 createLinkedNotebook:v3 linkedNotebook:*(void *)(a1 + 40)];

  return v4;
}

- (void)expungeSharedNotebooksWithIds:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__ENNoteStoreClient_expungeSharedNotebooksWithIds_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __62__ENNoteStoreClient_expungeSharedNotebooksWithIds_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 expungeSharedNotebooks:v3 sharedNotebookIds:*(void *)(a1 + 40)];

  return v4;
}

- (void)listSharedNotebooksWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__ENNoteStoreClient_listSharedNotebooksWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __55__ENNoteStoreClient_listSharedNotebooksWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 listSharedNotebooks:v3];

  return v4;
}

- (void)sendMessageToMembersOfSharedNotebookWithGuid:(id)a3 messageText:(id)a4 recipients:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __100__ENNoteStoreClient_sendMessageToMembersOfSharedNotebookWithGuid_messageText_recipients_completion___block_invoke;
  v16[3] = &unk_264E5C440;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(ENStoreClient *)self invokeAsyncInt32Block:v16 completion:a6];
}

uint64_t __100__ENNoteStoreClient_sendMessageToMembersOfSharedNotebookWithGuid_messageText_recipients_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 sendMessageToSharedNotebookMembers:v3 notebookGuid:*(void *)(a1 + 40) messageText:*(void *)(a1 + 48) recipients:*(void *)(a1 + 56)];

  return v4;
}

- (void)createSharedNotebook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__ENNoteStoreClient_createSharedNotebook_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __53__ENNoteStoreClient_createSharedNotebook_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 createSharedNotebook:v3 sharedNotebook:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchPublicNotebookWithUserID:(int)a3 publicURI:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__ENNoteStoreClient_fetchPublicNotebookWithUserID_publicURI_completion___block_invoke;
  v10[3] = &unk_264E5C4E0;
  int v12 = a3;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v10 completion:a5];
}

id __72__ENNoteStoreClient_fetchPublicNotebookWithUserID_publicURI_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [v2 getPublicNotebook:*(unsigned int *)(a1 + 48) publicUri:*(void *)(a1 + 40)];

  return v3;
}

- (void)fetchAttributesForResourceWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__ENNoteStoreClient_fetchAttributesForResourceWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __67__ENNoteStoreClient_fetchAttributesForResourceWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getResourceAttributes:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchAlternateDataForResourceWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__ENNoteStoreClient_fetchAlternateDataForResourceWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __70__ENNoteStoreClient_fetchAlternateDataForResourceWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getResourceAlternateData:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchRecognitionDataForResourceWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__ENNoteStoreClient_fetchRecognitionDataForResourceWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __72__ENNoteStoreClient_fetchRecognitionDataForResourceWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getResourceRecognition:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchResourceByHashWithGuid:(id)a3 contentHash:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__ENNoteStoreClient_fetchResourceByHashWithGuid_contentHash_options_completion___block_invoke;
  v14[3] = &unk_264E5C3F0;
  void v14[4] = self;
  id v15 = v10;
  id v16 = v11;
  unint64_t v17 = a5;
  id v12 = v11;
  id v13 = v10;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v14 completion:a6];
}

id __80__ENNoteStoreClient_fetchResourceByHashWithGuid_contentHash_options_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getResourceByHash:v3 noteGuid:*(void *)(a1 + 40) contentHash:*(void *)(a1 + 48) withData:*(void *)(a1 + 56) & 1 withRecognition:(*(void *)(a1 + 56) >> 1) & 1 withAlternateData:(*(void *)(a1 + 56) >> 2) & 1];

  return v4;
}

- (void)fetchResourceDataWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__ENNoteStoreClient_fetchResourceDataWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __58__ENNoteStoreClient_fetchResourceDataWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getResourceData:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)updateResource:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__ENNoteStoreClient_updateResource_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __47__ENNoteStoreClient_updateResource_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 updateResource:v3 resource:*(void *)(a1 + 40)];

  return v4;
}

- (void)unsetResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__ENNoteStoreClient_unsetResourceApplicationDataEntryWithGuid_key_completion___block_invoke;
  v12[3] = &unk_264E5C3C8;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENStoreClient *)self invokeAsyncInt32Block:v12 completion:a5];
}

uint64_t __78__ENNoteStoreClient_unsetResourceApplicationDataEntryWithGuid_key_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 unsetResourceApplicationDataEntry:v3 guid:*(void *)(a1 + 40) key:*(void *)(a1 + 48)];

  return v4;
}

- (void)setResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__ENNoteStoreClient_setResourceApplicationDataEntryWithGuid_key_value_completion___block_invoke;
  v16[3] = &unk_264E5C440;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(ENStoreClient *)self invokeAsyncInt32Block:v16 completion:a6];
}

uint64_t __82__ENNoteStoreClient_setResourceApplicationDataEntryWithGuid_key_value_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 setResourceApplicationDataEntry:v3 guid:*(void *)(a1 + 40) key:*(void *)(a1 + 48) value:*(void *)(a1 + 56)];

  return v4;
}

- (void)fetchResourceApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__ENNoteStoreClient_fetchResourceApplicationDataEntryWithGuid_key_completion___block_invoke;
  v12[3] = &unk_264E5C3A0;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v12 completion:a5];
}

id __78__ENNoteStoreClient_fetchResourceApplicationDataEntryWithGuid_key_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getResourceApplicationDataEntry:v3 guid:*(void *)(a1 + 40) key:*(void *)(a1 + 48)];

  return v4;
}

- (void)fetchResourceApplicationDataWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__ENNoteStoreClient_fetchResourceApplicationDataWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __69__ENNoteStoreClient_fetchResourceApplicationDataWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getResourceApplicationData:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchResourceWithGuid:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__ENNoteStoreClient_fetchResourceWithGuid_options_completion___block_invoke;
  v10[3] = &unk_264E5C300;
  void v10[4] = self;
  id v11 = v8;
  unint64_t v12 = a4;
  id v9 = v8;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v10 completion:a5];
}

id __62__ENNoteStoreClient_fetchResourceWithGuid_options_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getResource:v3 guid:*(void *)(a1 + 40) withData:*(void *)(a1 + 48) & 1 withRecognition:(*(void *)(a1 + 48) >> 1) & 1 withAttributes:(*(void *)(a1 + 48) >> 3) & 1 withAlternateData:(*(void *)(a1 + 48) >> 2) & 1];

  return v4;
}

- (void)fetchNoteVersionWithGuid:(id)a3 updateSequenceNum:(int)a4 resourceOptions:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__ENNoteStoreClient_fetchNoteVersionWithGuid_updateSequenceNum_resourceOptions_completion___block_invoke;
  v12[3] = &unk_264E5C4B8;
  void v12[4] = self;
  id v13 = v10;
  int v15 = a4;
  unint64_t v14 = a5;
  id v11 = v10;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v12 completion:a6];
}

id __91__ENNoteStoreClient_fetchNoteVersionWithGuid_updateSequenceNum_resourceOptions_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getNoteVersion:v3 noteGuid:*(void *)(a1 + 40) updateSequenceNum:*(unsigned int *)(a1 + 56) withResourcesData:*(void *)(a1 + 48) & 1 withResourcesRecognition:(*(void *)(a1 + 48) >> 1) & 1 withResourcesAlternateData:(*(void *)(a1 + 48) >> 2) & 1];

  return v4;
}

- (void)listNoteVersionsWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__ENNoteStoreClient_listNoteVersionsWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __57__ENNoteStoreClient_listNoteVersionsWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 listNoteVersions:v3 noteGuid:*(void *)(a1 + 40)];

  return v4;
}

- (void)copyNoteWithGuid:(id)a3 toNotebookWithGuid:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__ENNoteStoreClient_copyNoteWithGuid_toNotebookWithGuid_completion___block_invoke;
  v12[3] = &unk_264E5C3A0;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v12 completion:a5];
}

id __68__ENNoteStoreClient_copyNoteWithGuid_toNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = (void *)[v2 copyNote:v3 noteGuid:*(void *)(a1 + 40) toNotebookGuid:*(void *)(a1 + 48)];

  return v4;
}

- (void)expungeInactiveNoteWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__ENNoteStoreClient_expungeInactiveNoteWithCompletion___block_invoke;
  v3[3] = &unk_264E5C490;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncInt32Block:v3 completion:a3];
}

uint64_t __55__ENNoteStoreClient_expungeInactiveNoteWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 expungeInactiveNotes:v3];

  return v4;
}

- (void)expungeNotesWithGuids:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__ENNoteStoreClient_expungeNotesWithGuids_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __54__ENNoteStoreClient_expungeNotesWithGuids_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 expungeNotes:v3 noteGuids:*(void *)(a1 + 40)];

  return v4;
}

- (void)expungeNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__ENNoteStoreClient_expungeNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __52__ENNoteStoreClient_expungeNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 expungeNote:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)deleteNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__ENNoteStoreClient_deleteNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __51__ENNoteStoreClient_deleteNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 deleteNote:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)updateNote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__ENNoteStoreClient_updateNote_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __43__ENNoteStoreClient_updateNote_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 updateNote:v3 note:*(void *)(a1 + 40)];

  return v4;
}

- (void)createNote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__ENNoteStoreClient_createNote_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __43__ENNoteStoreClient_createNote_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 createNote:v3 note:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchTagNamesForNoteWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__ENNoteStoreClient_fetchTagNamesForNoteWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __61__ENNoteStoreClient_fetchTagNamesForNoteWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getNoteTagNames:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchSearchTextForResourceWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__ENNoteStoreClient_fetchSearchTextForResourceWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __67__ENNoteStoreClient_fetchSearchTextForResourceWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getResourceSearchText:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchSearchTextForNoteWithGuid:(id)a3 noteOnly:(BOOL)a4 tokenizeForIndexing:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __92__ENNoteStoreClient_fetchSearchTextForNoteWithGuid_noteOnly_tokenizeForIndexing_completion___block_invoke;
  v12[3] = &unk_264E5C468;
  void v12[4] = self;
  id v13 = v10;
  BOOL v14 = a4;
  BOOL v15 = a5;
  id v11 = v10;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v12 completion:a6];
}

id __92__ENNoteStoreClient_fetchSearchTextForNoteWithGuid_noteOnly_tokenizeForIndexing_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getNoteSearchText:v3 guid:*(void *)(a1 + 40) noteOnly:*(unsigned __int8 *)(a1 + 48) tokenizeForIndexing:*(unsigned __int8 *)(a1 + 49)];

  return v4;
}

- (void)fetchNoteContentWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__ENNoteStoreClient_fetchNoteContentWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __57__ENNoteStoreClient_fetchNoteContentWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getNoteContent:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)unsetNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__ENNoteStoreClient_unsetNoteApplicationDataEntryWithGuid_key_completion___block_invoke;
  v12[3] = &unk_264E5C3C8;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENStoreClient *)self invokeAsyncInt32Block:v12 completion:a5];
}

uint64_t __74__ENNoteStoreClient_unsetNoteApplicationDataEntryWithGuid_key_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 unsetNoteApplicationDataEntry:v3 guid:*(void *)(a1 + 40) key:*(void *)(a1 + 48)];

  return v4;
}

- (void)setNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 value:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__ENNoteStoreClient_setNoteApplicationDataEntryWithGuid_key_value_completion___block_invoke;
  v16[3] = &unk_264E5C440;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(ENStoreClient *)self invokeAsyncInt32Block:v16 completion:a6];
}

uint64_t __78__ENNoteStoreClient_setNoteApplicationDataEntryWithGuid_key_value_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 setNoteApplicationDataEntry:v3 guid:*(void *)(a1 + 40) key:*(void *)(a1 + 48) value:*(void *)(a1 + 56)];

  return v4;
}

- (void)fetchNoteApplicationDataEntryWithGuid:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__ENNoteStoreClient_fetchNoteApplicationDataEntryWithGuid_key_completion___block_invoke;
  v12[3] = &unk_264E5C3A0;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v12 completion:a5];
}

id __74__ENNoteStoreClient_fetchNoteApplicationDataEntryWithGuid_key_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getNoteApplicationDataEntry:v3 guid:*(void *)(a1 + 40) key:*(void *)(a1 + 48)];

  return v4;
}

- (void)fetchNoteApplicationDataWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__ENNoteStoreClient_fetchNoteApplicationDataWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __65__ENNoteStoreClient_fetchNoteApplicationDataWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getNoteApplicationData:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchNoteWithGuid:(id)a3 includingContent:(BOOL)a4 resourceOptions:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__ENNoteStoreClient_fetchNoteWithGuid_includingContent_resourceOptions_completion___block_invoke;
  v12[3] = &unk_264E5C350;
  void v12[4] = self;
  id v13 = v10;
  BOOL v15 = a4;
  unint64_t v14 = a5;
  id v11 = v10;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v12 completion:a6];
}

id __83__ENNoteStoreClient_fetchNoteWithGuid_includingContent_resourceOptions_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getNote:v3 guid:*(void *)(a1 + 40) withContent:*(unsigned __int8 *)(a1 + 56) withResourcesData:*(void *)(a1 + 48) & 1 withResourcesRecognition:(*(void *)(a1 + 48) >> 1) & 1 withResourcesAlternateData:(*(void *)(a1 + 48) >> 2) & 1];

  return v4;
}

- (void)findNoteCountsWithFilter:(id)a3 includingTrash:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__ENNoteStoreClient_findNoteCountsWithFilter_includingTrash_completion___block_invoke;
  v10[3] = &unk_264E5C418;
  void v10[4] = self;
  id v11 = v8;
  BOOL v12 = a4;
  id v9 = v8;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v10 completion:a5];
}

id __72__ENNoteStoreClient_findNoteCountsWithFilter_includingTrash_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 findNoteCounts:v3 filter:*(void *)(a1 + 40) withTrash:*(unsigned __int8 *)(a1 + 48)];

  return v4;
}

- (void)findNotesMetadataWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 resultSpec:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __87__ENNoteStoreClient_findNotesMetadataWithFilter_offset_maxNotes_resultSpec_completion___block_invoke;
  v16[3] = &unk_264E5C3F0;
  void v16[4] = self;
  id v17 = v12;
  int v19 = a4;
  int v20 = a5;
  id v18 = v13;
  id v14 = v13;
  id v15 = v12;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v16 completion:a7];
}

id __87__ENNoteStoreClient_findNotesMetadataWithFilter_offset_maxNotes_resultSpec_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 findNotesMetadata:v3 filter:*(void *)(a1 + 40) offset:*(unsigned int *)(a1 + 56) maxNotes:*(unsigned int *)(a1 + 60) resultSpec:*(void *)(a1 + 48)];

  return v4;
}

- (void)findNoteOffsetWithFilter:(id)a3 guid:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__ENNoteStoreClient_findNoteOffsetWithFilter_guid_completion___block_invoke;
  v12[3] = &unk_264E5C3C8;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENStoreClient *)self invokeAsyncInt32Block:v12 completion:a5];
}

uint64_t __62__ENNoteStoreClient_findNoteOffsetWithFilter_guid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 findNoteOffset:v3 filter:*(void *)(a1 + 40) guid:*(void *)(a1 + 48)];

  return v4;
}

- (void)findNotesWithFilter:(id)a3 offset:(int)a4 maxNotes:(int)a5 completion:(id)a6
{
  id v10 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__ENNoteStoreClient_findNotesWithFilter_offset_maxNotes_completion___block_invoke;
  v12[3] = &unk_264E5C300;
  void v12[4] = self;
  id v13 = v10;
  int v14 = a4;
  int v15 = a5;
  id v11 = v10;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v12 completion:a6];
}

id __68__ENNoteStoreClient_findNotesWithFilter_offset_maxNotes_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 findNotes:v3 filter:*(void *)(a1 + 40) offset:*(unsigned int *)(a1 + 48) maxNotes:*(unsigned int *)(a1 + 52)];

  return v4;
}

- (void)findRelatedWithQuery:(id)a3 resultSpec:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__ENNoteStoreClient_findRelatedWithQuery_resultSpec_completion___block_invoke;
  v12[3] = &unk_264E5C3A0;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v12 completion:a5];
}

id __64__ENNoteStoreClient_findRelatedWithQuery_resultSpec_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 findRelated:v3 query:*(void *)(a1 + 40) resultSpec:*(void *)(a1 + 48)];

  return v4;
}

- (void)expungeSearchWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__ENNoteStoreClient_expungeSearchWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __54__ENNoteStoreClient_expungeSearchWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 expungeSearch:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)updateSearch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__ENNoteStoreClient_updateSearch_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __45__ENNoteStoreClient_updateSearch_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 updateSearch:v3 search:*(void *)(a1 + 40)];

  return v4;
}

- (void)createSearch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__ENNoteStoreClient_createSearch_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __45__ENNoteStoreClient_createSearch_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 createSearch:v3 search:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchSearchWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__ENNoteStoreClient_fetchSearchWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __52__ENNoteStoreClient_fetchSearchWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getSearch:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)listSearchesWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__ENNoteStoreClient_listSearchesWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __48__ENNoteStoreClient_listSearchesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 listSearches:v3];

  return v4;
}

- (void)expungeTagWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__ENNoteStoreClient_expungeTagWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __51__ENNoteStoreClient_expungeTagWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 expungeTag:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)untagAllWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__ENNoteStoreClient_untagAllWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5DED8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncBlock:v8 completion:a4];
}

void __49__ENNoteStoreClient_untagAllWithGuid_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) client];
  id v2 = [*(id *)(a1 + 32) authenticationToken];
  [v3 untagAll:v2 guid:*(void *)(a1 + 40)];
}

- (void)updateTag:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__ENNoteStoreClient_updateTag_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __42__ENNoteStoreClient_updateTag_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 updateTag:v3 tag:*(void *)(a1 + 40)];

  return v4;
}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__ENNoteStoreClient_createTag_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __42__ENNoteStoreClient_createTag_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 createTag:v3 tag:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchTagWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__ENNoteStoreClient_fetchTagWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __49__ENNoteStoreClient_fetchTagWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getTag:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)listTagsInNotebookWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__ENNoteStoreClient_listTagsInNotebookWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __59__ENNoteStoreClient_listTagsInNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 listTagsByNotebook:v3 notebookGuid:*(void *)(a1 + 40)];

  return v4;
}

- (void)listTagsWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__ENNoteStoreClient_listTagsWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __44__ENNoteStoreClient_listTagsWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 listTags:v3];

  return v4;
}

- (void)expungeNotebookWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__ENNoteStoreClient_expungeNotebookWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __56__ENNoteStoreClient_expungeNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 expungeNotebook:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)updateNotebook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__ENNoteStoreClient_updateNotebook_completion___block_invoke;
  v8[3] = &unk_264E5C378;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncInt32Block:v8 completion:a4];
}

uint64_t __47__ENNoteStoreClient_updateNotebook_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 updateNotebook:v3 notebook:*(void *)(a1 + 40)];

  return v4;
}

- (void)createNotebook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ENSession sharedSession];
  objc_msgSend(v8, "listNotebooks_cleanCache");

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__ENNoteStoreClient_createNotebook_completion___block_invoke;
  v10[3] = &unk_264E5C328;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v10 completion:v7];
}

id __47__ENNoteStoreClient_createNotebook_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 createNotebook:v3 notebook:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchDefaultNotebookWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__ENNoteStoreClient_fetchDefaultNotebookWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __56__ENNoteStoreClient_fetchDefaultNotebookWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getDefaultNotebook:v3];

  return v4;
}

- (void)fetchNotebookWithGuid:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__ENNoteStoreClient_fetchNotebookWithGuid_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __54__ENNoteStoreClient_fetchNotebookWithGuid_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getNotebook:v3 guid:*(void *)(a1 + 40)];

  return v4;
}

- (void)listNotebooksWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__ENNoteStoreClient_listNotebooksWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __49__ENNoteStoreClient_listNotebooksWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 listNotebooks:v3];

  return v4;
}

- (void)fetchSyncChunkForLinkedNotebook:(id)a3 afterUSN:(int)a4 maxEntries:(int)a5 fullSyncOnly:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97__ENNoteStoreClient_fetchSyncChunkForLinkedNotebook_afterUSN_maxEntries_fullSyncOnly_completion___block_invoke;
  v14[3] = &unk_264E5C350;
  void v14[4] = self;
  id v15 = v12;
  int v16 = a4;
  int v17 = a5;
  BOOL v18 = a6;
  id v13 = v12;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v14 completion:a7];
}

id __97__ENNoteStoreClient_fetchSyncChunkForLinkedNotebook_afterUSN_maxEntries_fullSyncOnly_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getLinkedNotebookSyncChunk:v3 linkedNotebook:*(void *)(a1 + 40) afterUSN:*(unsigned int *)(a1 + 48) maxEntries:*(unsigned int *)(a1 + 52) fullSyncOnly:*(unsigned __int8 *)(a1 + 56)];

  return v4;
}

- (void)fetchSyncStateForLinkedNotebook:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__ENNoteStoreClient_fetchSyncStateForLinkedNotebook_completion___block_invoke;
  v8[3] = &unk_264E5C328;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v8 completion:a4];
}

id __64__ENNoteStoreClient_fetchSyncStateForLinkedNotebook_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getLinkedNotebookSyncState:v3 linkedNotebook:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchFilteredSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 filter:(id)a5 completion:(id)a6
{
  id v10 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__ENNoteStoreClient_fetchFilteredSyncChunkAfterUSN_maxEntries_filter_completion___block_invoke;
  v12[3] = &unk_264E5C300;
  int v14 = a3;
  int v15 = a4;
  void v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v12 completion:a6];
}

id __81__ENNoteStoreClient_fetchFilteredSyncChunkAfterUSN_maxEntries_filter_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getFilteredSyncChunk:v3 afterUSN:*(unsigned int *)(a1 + 48) maxEntries:*(unsigned int *)(a1 + 52) filter:*(void *)(a1 + 40)];

  return v4;
}

- (void)fetchSyncChunkAfterUSN:(int)a3 maxEntries:(int)a4 fullSyncOnly:(BOOL)a5 completion:(id)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__ENNoteStoreClient_fetchSyncChunkAfterUSN_maxEntries_fullSyncOnly_completion___block_invoke;
  v6[3] = &unk_264E5C2D8;
  v6[4] = self;
  int v7 = a3;
  int v8 = a4;
  BOOL v9 = a5;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v6 completion:a6];
}

id __79__ENNoteStoreClient_fetchSyncChunkAfterUSN_maxEntries_fullSyncOnly_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getSyncChunk:v3 afterUSN:*(unsigned int *)(a1 + 40) maxEntries:*(unsigned int *)(a1 + 44) fullSyncOnly:*(unsigned __int8 *)(a1 + 48)];

  return v4;
}

- (void)fetchSyncStateWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__ENNoteStoreClient_fetchSyncStateWithCompletion___block_invoke;
  v3[3] = &unk_264E5C2B0;
  v3[4] = self;
  [(ENStoreClient *)self invokeAsyncObjectBlock:v3 completion:a3];
}

id __50__ENNoteStoreClient_fetchSyncStateWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = [*(id *)(a1 + 32) authenticationToken];
  uint64_t v4 = [v2 getSyncState:v3];

  return v4;
}

- (id)authenticateToSharedNotebookWithGlobalId:(id)a3
{
  id v4 = a3;
  id v5 = [(ENNoteStoreClient *)self client];
  id v6 = [(ENNoteStoreClient *)self authenticationToken];
  int v7 = [v5 authenticateToSharedNotebook:v4 authenticationToken:v6];

  return v7;
}

- (EDAMNoteStoreClient)client
{
  client = self->_client;
  if (!client)
  {
    id v4 = [(ENNoteStoreClient *)self noteStoreUrl];
    id v5 = [NSURL URLWithString:v4];
    id v6 = [[ENTHTTPClient alloc] initWithURL:v5];
    int v7 = [[ENTBinaryProtocol alloc] initWithTransport:v6];
    int v8 = [[EDAMNoteStoreClient alloc] initWithProtocol:v7];
    BOOL v9 = self->_client;
    self->_client = v8;

    [(ENNoteStoreClient *)self updateProgressHandlers];
    client = self->_client;
  }
  return client;
}

- (void)updateProgressHandlers
{
  if (self->_client)
  {
    id v3 = [(ENNoteStoreClient *)self uploadProgressHandler];

    if (v3)
    {
      id v4 = [(ENNoteStoreClient *)self uploadProgressHandler];
      client = self->_client;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __43__ENNoteStoreClient_updateProgressHandlers__block_invoke;
      v13[3] = &unk_264E5C288;
      id v14 = v4;
      id v6 = v4;
      [(EDAMNoteStoreClient *)client setUploadProgressBlock:v13];
    }
    else
    {
      [(EDAMNoteStoreClient *)self->_client setUploadProgressBlock:0];
    }
    int v7 = [(ENNoteStoreClient *)self downloadProgressHandler];

    if (v7)
    {
      int v8 = [(ENNoteStoreClient *)self downloadProgressHandler];
      BOOL v9 = self->_client;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __43__ENNoteStoreClient_updateProgressHandlers__block_invoke_2;
      v11[3] = &unk_264E5C288;
      id v12 = v8;
      id v10 = v8;
      [(EDAMNoteStoreClient *)v9 setDownloadProgressBlock:v11];
    }
    else
    {
      [(EDAMNoteStoreClient *)self->_client setDownloadProgressBlock:0];
    }
  }
}

uint64_t __43__ENNoteStoreClient_updateProgressHandlers__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 1) {
    return (*(uint64_t (**)(double))(*(void *)(result + 32) + 16))((double)a3 / (double)a4);
  }
  return result;
}

uint64_t __43__ENNoteStoreClient_updateProgressHandlers__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 1) {
    return (*(uint64_t (**)(double))(*(void *)(result + 32) + 16))((double)a3 / (double)a4);
  }
  return result;
}

- (void)setDownloadProgressHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id downloadProgressHandler = self->_downloadProgressHandler;
  self->_id downloadProgressHandler = v4;

  [(ENNoteStoreClient *)self updateProgressHandlers];
}

- (void)setUploadProgressHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id uploadProgressHandler = self->_uploadProgressHandler;
  self->_id uploadProgressHandler = v4;

  [(ENNoteStoreClient *)self updateProgressHandlers];
}

@end