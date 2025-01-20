@interface ASAccountActor
- (ASAccountActor)initWithDAAccount:(id)a3;
- (BOOL)generatesBulletins;
- (BOOL)reattemptInvitationLinkageForMetaData:(id)a3 inFolderWithId:(id)a4;
- (BOOL)searchQueriesRunning;
- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5;
- (id)customSignature;
- (id)deletedItemsFolder;
- (id)draftsFolder;
- (id)encryptionIdentityPersistentReference;
- (id)folderIDsThatExternalClientsCareAboutForDataclasses:(int64_t)a3 withTag:(id *)a4;
- (id)folderIDsThatExternalClientsCareAboutWithTag:(id *)a3;
- (id)foldersTag;
- (id)inboxFolder;
- (id)mailboxes;
- (id)sentItemsFolder;
- (id)signingIdentityPersistentReference;
- (id)unactionableICSRepresentationForMetaData:(id)a3 inFolderWithId:(id)a4 outSummary:(id *)a5;
- (int)mailNumberOfPastDaysToSync;
- (int)performFetchAttachmentRequest:(id)a3 consumer:(id)a4;
- (int)performFetchMessageSearchResultRequests:(id)a3 consumer:(id)a4;
- (int)performMailboxRequest:(id)a3 mailbox:(id)a4 previousTag:(id)a5 clientWinsOnSyncConflict:(BOOL)a6 isUserRequested:(BOOL)a7 consumer:(id)a8;
- (int)performMailboxRequest:(id)a3 mailbox:(id)a4 previousTag:(id)a5 isUserRequested:(BOOL)a6 consumer:(id)a7;
- (int)performMailboxRequests:(id)a3 mailbox:(id)a4 previousTag:(id)a5 clientWinsOnSyncConflict:(BOOL)a6 isUserRequested:(BOOL)a7 consumer:(id)a8;
- (int)performMailboxRequests:(id)a3 mailbox:(id)a4 previousTag:(id)a5 isUserRequested:(BOOL)a6 consumer:(id)a7;
- (int)performMoveRequests:(id)a3 consumer:(id)a4;
- (int)performResolveRecipientsRequest:(id)a3 consumer:(id)a4;
- (int)sendMessageWithRFC822Data:(id)a3 messageID:(id)a4 outgoingMessageType:(int)a5 originalMessageFolderID:(id)a6 originalMessageItemID:(id)a7 originalMessageLongID:(id)a8 originalAccountID:(id)a9 useSmartTasksIfPossible:(BOOL)a10 isUserRequested:(BOOL)a11 consumer:(id)a12 context:(id)a13;
- (int)sendSmartMessageWithRFC822Data:(id)a3 messageID:(id)a4 outgoingMessageType:(int)a5 originalMessageFolderID:(id)a6 originalMessageItemID:(id)a7 originalMessageLongID:(id)a8 originalAccountID:(id)a9 replaceOriginalMime:(BOOL)a10 isUserRequested:(BOOL)a11 consumer:(id)a12 context:(id)a13;
- (int)supportsConversations;
- (int)supportsDraftFolderSync;
- (int)supportsEmailFlagging;
- (int)supportsMailboxSearch;
- (int)supportsSmartForwardReply;
- (int)supportsUniqueServerId;
- (void)_accountPasswordChanged;
- (void)_daemonDiedNotification:(id)a3;
- (void)_folderHierarchyChanged;
- (void)_folderUpdatedNotification:(id)a3;
- (void)_foldersThatExternalClientsCareAboutChanged;
- (void)_newASPolicyKeyNotification:(id)a3;
- (void)cancelAllSearchQueries;
- (void)cancelSearchQuery:(id)a3;
- (void)cancelTaskWithID:(int)a3;
- (void)monitorFoldersForUpdates:(id)a3;
- (void)monitorFoldersForUpdates:(id)a3 persistent:(BOOL)a4;
- (void)performFolderChange:(id)a3 isUserRequested:(BOOL)a4;
- (void)performSearchQuery:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCustomSignature:(id)a3;
- (void)setEncryptionIdentityPersistentReference:(id)a3;
- (void)setGeneratesBulletins:(BOOL)a3;
- (void)setMailNumberOfPastDaysToSync:(int)a3;
- (void)setSigningIdentityPersistentReference:(id)a3;
- (void)shutdown;
- (void)startup;
- (void)stopMonitoringAllFolders;
- (void)stopMonitoringFoldersForUpdates:(id)a3;
@end

@implementation ASAccountActor

- (ASAccountActor)initWithDAAccount:(id)a3
{
  id v4 = a3;
  if (ExchangeSyncLibraryCore_1())
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v5 = (void *)getESAccountActorClass_softClass;
    uint64_t v13 = getESAccountActorClass_softClass;
    if (!getESAccountActorClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getESAccountActorClass_block_invoke;
      v9[3] = &unk_1E6211758;
      v9[4] = &v10;
      __getESAccountActorClass_block_invoke((uint64_t)v9);
      v5 = (void *)v11[3];
    }
    v6 = v5;
    _Block_object_dispose(&v10, 8);
    v7 = (ASAccountActor *)[[v6 alloc] initWithDAAccount:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)startup
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 325, @"Must be called on subclass: %s", sel_getName(a2));
}

- (id)mailboxes
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 25, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (id)inboxFolder
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 303, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (id)sentItemsFolder
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 309, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (id)deletedItemsFolder
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 315, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)mailNumberOfPastDaysToSync
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 32, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)supportsMailboxSearch
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 38, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)supportsEmailFlagging
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 43, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)supportsConversations
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 48, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)supportsDraftFolderSync
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 53, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)supportsSmartForwardReply
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 58, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)supportsUniqueServerId
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 63, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (BOOL)generatesBulletins
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 68, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (void)setGeneratesBulletins:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 73, @"Must be called on subclass: %s", sel_getName(a2));
}

- (id)signingIdentityPersistentReference
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 77, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (void)setSigningIdentityPersistentReference:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 82, @"Must be called on subclass: %s", sel_getName(a2));
}

- (id)encryptionIdentityPersistentReference
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 86, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (void)setEncryptionIdentityPersistentReference:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 91, @"Must be called on subclass: %s", sel_getName(a2));
}

- (id)customSignature
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 95, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (void)setCustomSignature:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 100, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)setMailNumberOfPastDaysToSync:(int)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 105, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)monitorFoldersForUpdates:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 110, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)monitorFoldersForUpdates:(id)a3 persistent:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 115, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)stopMonitoringFoldersForUpdates:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 120, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)stopMonitoringAllFolders
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 125, @"Must be called on subclass: %s", sel_getName(a2));
}

- (id)foldersTag
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 129, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (id)folderIDsThatExternalClientsCareAboutWithTag:(id *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 135, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (id)folderIDsThatExternalClientsCareAboutForDataclasses:(int64_t)a3 withTag:(id *)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 141, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (BOOL)setFolderIdsThatExternalClientsCareAboutAdded:(id)a3 deleted:(id)a4 foldersTag:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 147, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (BOOL)reattemptInvitationLinkageForMetaData:(id)a3 inFolderWithId:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 153, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (id)unactionableICSRepresentationForMetaData:(id)a3 inFolderWithId:(id)a4 outSummary:(id *)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 158, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)sendMessageWithRFC822Data:(id)a3 messageID:(id)a4 outgoingMessageType:(int)a5 originalMessageFolderID:(id)a6 originalMessageItemID:(id)a7 originalMessageLongID:(id)a8 originalAccountID:(id)a9 useSmartTasksIfPossible:(BOOL)a10 isUserRequested:(BOOL)a11 consumer:(id)a12 context:(id)a13
{
  v15 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, *(void *)&a5, a6, a7, a8);
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 173, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)sendSmartMessageWithRFC822Data:(id)a3 messageID:(id)a4 outgoingMessageType:(int)a5 originalMessageFolderID:(id)a6 originalMessageItemID:(id)a7 originalMessageLongID:(id)a8 originalAccountID:(id)a9 replaceOriginalMime:(BOOL)a10 isUserRequested:(BOOL)a11 consumer:(id)a12 context:(id)a13
{
  v15 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, *(void *)&a5, a6, a7, a8);
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 188, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)performMailboxRequest:(id)a3 mailbox:(id)a4 previousTag:(id)a5 isUserRequested:(BOOL)a6 consumer:(id)a7
{
  return [(ASAccountActor *)self performMailboxRequest:a3 mailbox:a4 previousTag:a5 clientWinsOnSyncConflict:0 isUserRequested:a6 consumer:a7];
}

- (int)performMailboxRequests:(id)a3 mailbox:(id)a4 previousTag:(id)a5 isUserRequested:(BOOL)a6 consumer:(id)a7
{
  return [(ASAccountActor *)self performMailboxRequests:a3 mailbox:a4 previousTag:a5 clientWinsOnSyncConflict:0 isUserRequested:a6 consumer:a7];
}

- (int)performMailboxRequest:(id)a3 mailbox:(id)a4 previousTag:(id)a5 clientWinsOnSyncConflict:(BOOL)a6 isUserRequested:(BOOL)a7 consumer:(id)a8
{
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7, a8);
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 229, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)performMailboxRequests:(id)a3 mailbox:(id)a4 previousTag:(id)a5 clientWinsOnSyncConflict:(BOOL)a6 isUserRequested:(BOOL)a7 consumer:(id)a8
{
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7, a8);
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 240, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)performMoveRequests:(id)a3 consumer:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 247, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)performFetchAttachmentRequest:(id)a3 consumer:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 254, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)performFetchMessageSearchResultRequests:(id)a3 consumer:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 260, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (int)performResolveRecipientsRequest:(id)a3 consumer:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 266, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (void)performFolderChange:(id)a3 isUserRequested:(BOOL)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 271, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)cancelTaskWithID:(int)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 276, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)performSearchQuery:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 282, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)cancelSearchQuery:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 287, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)cancelAllSearchQueries
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 292, @"Must be called on subclass: %s", sel_getName(a2));
}

- (BOOL)searchQueriesRunning
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 297, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (id)draftsFolder
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 321, @"Must be called on subclass: %s", sel_getName(a2));

  return 0;
}

- (void)setAccount:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 329, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)shutdown
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 333, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)_daemonDiedNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 340, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)_folderUpdatedNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 345, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)_newASPolicyKeyNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 349, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)_folderHierarchyChanged
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 353, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)_foldersThatExternalClientsCareAboutChanged
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 357, @"Must be called on subclass: %s", sel_getName(a2));
}

- (void)_accountPasswordChanged
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ASAccountActor.m", 361, @"Must be called on subclass: %s", sel_getName(a2));
}

@end