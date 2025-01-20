@interface IMDNicknameController
+ (id)sharedInstance;
- (BOOL)_deviceUnderFirstUnlock;
- (BOOL)_isActiveForNickname:(id)a3;
- (BOOL)_isNicknamesSharingEnabled;
- (BOOL)_isUnderScrutiny;
- (BOOL)_populateNicknameDictionary:(id)a3 forKVStore:(id)a4 limitToLoad:(unint64_t)a5;
- (BOOL)_requestingToSendLocalNicknameInfo:(id)a3;
- (BOOL)_sendMessageDictionary:(id)a3 toDevice:(id)a4;
- (BOOL)_sendMessageDictionary:(id)a3 toDevice:(id)a4 sendType:(unint64_t)a5;
- (BOOL)evaluateAccountStateForFeatureEligibility;
- (BOOL)needToLoadMapsInfoFromDisk;
- (BOOL)nicknameIsUploadingToCK;
- (BOOL)replacedNicknameForHandleIDInHandledMapIfNeeded:(id)a3 nickname:(id)a4;
- (CHManager)callHistoryManager;
- (IDSKVStore)archivedNicknamesKVStore;
- (IDSKVStore)cloudkitRecordsKVStore;
- (IDSKVStore)handleSharingKVStore;
- (IDSKVStore)handledNicknamesKVStore;
- (IDSKVStore)nicknameRecordsKVStore;
- (IDSKVStore)pendingNicknameUpdatesKVStore;
- (IDSKVStore)unknownSenderRecordInfoKVStore;
- (IDSService)nicknameService;
- (IMDNicknameController)init;
- (IMNickname)personalNickname;
- (NSDictionary)activeRecords;
- (NSDictionary)ignoredRecords;
- (NSMutableArray)chatsToSendNicknameInfoTo;
- (NSMutableDictionary)activeNicknameRecords;
- (NSMutableDictionary)archivedNicknames;
- (NSMutableDictionary)handledNicknames;
- (NSMutableDictionary)ignoredNicknameRecords;
- (NSMutableDictionary)pendingNicknameUpdates;
- (NSMutableDictionary)unknownSenderRecordInfo;
- (NSMutableSet)handleAllowList;
- (NSMutableSet)handleDenyList;
- (NSMutableSet)handleTransitionedList;
- (NSSet)allowListedHandlesForSharing;
- (NSSet)denyListedHandlesForSharing;
- (NSSet)transitionedHandles;
- (double)lastMeContactStoreSync;
- (id)_diffActiveRecords:(id)a3 againstPrevious:(id)a4;
- (id)_getPendingNicknameForUpload;
- (id)_idsDeviceFromPushToken:(id)a3;
- (id)_typeOfNicknameUpdateToShare;
- (id)allNicknames;
- (id)defaults;
- (id)loadListForKey:(id)a3 list:(id)a4;
- (id)lowResWallpaperDataTag;
- (id)messageDictionaryWithPersonalRecordIDAndVersion;
- (id)newNicknameInfoToSend;
- (id)nickNameDecryptionKey;
- (id)nickNameRecordID;
- (id)nicknameForHandle:(id)a3;
- (id)nicknameForHandleURI:(id)a3;
- (id)nicknameForRecordID:(id)a3;
- (id)nicknameForRecordID:(id)a3 handle:(id)a4;
- (id)pendingPersonalNickname;
- (id)storedPersonalNickname;
- (id)substringRecordIDForNickname:(id)a3;
- (id)transferServicesController;
- (id)unknownSenderRecordInfoFor:(id)a3;
- (id)wallpaperDataTag;
- (id)wallpaperMetadataTag;
- (unint64_t)_reuploadLocalProfileVersionNumber;
- (void)NicknameWithRecordID:(id)a3 URI:(id)a4 decryptionKey:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 hasWallpaperUpdate:(BOOL)a9 dropNicknameForUnknownContacts:(BOOL)a10 withCompletionBlock:(id)a11;
- (void)_beginNicknameUpload:(id)a3;
- (void)_broadcastActiveListChanged;
- (void)_broadcastNicknamesMapChanged;
- (void)_clearActiveNicknameRecords;
- (void)_clearIgnoredNicknameRecords;
- (void)_clearSharingLists;
- (void)_clearTransitionedList;
- (void)_deleteAvatarForNickname:(id)a3;
- (void)_deleteDataUnderScrutiny;
- (void)_deleteHandleIDFromArchivedMap:(id)a3;
- (void)_deleteHandleIDFromHandledMap:(id)a3;
- (void)_deleteHandleIDFromPendingMap:(id)a3;
- (void)_deleteNicknameFromPendingMap:(id)a3;
- (void)_deleteOnDiskDataIfNeededForNickname:(id)a3 withNewNickname:(id)a4;
- (void)_deletePendingNicknameForUpload;
- (void)_deletePublicNicknameLocationAndKey;
- (void)_endNicknameUpload;
- (void)_evaluateIfAccountHasMultiplePhoneNumbers;
- (void)_getDevicesForBothNicknameServices:(id)a3 removeNewServiceURIsFromIMessageList:(BOOL)a4 completionHandler:(id)a5;
- (void)_loadAllInfoFromDiskIfAble;
- (void)_makeAllNicknameContentsClassC;
- (void)_markCurrentNicknameAsArchived:(id)a3 incrementPendingNicknameVersion:(BOOL)a4;
- (void)_markNicknamePhotoAsUpdated:(id)a3;
- (void)_markPendingNicknameAsCurrent:(id)a3 incrementPendingNicknameVersion:(BOOL)a4 updateType:(unint64_t)a5 broadcastUpdates:(BOOL)a6;
- (void)_newDeviceDidSignIntoiMessageWithRetryCount:(unint64_t)a3;
- (void)_removeFromList:(id)a3 withKey:(id)a4;
- (void)_removeFromTransitionedList:(id)a3;
- (void)_replaceUnknownSenderRecordInfoListWithInfo:(id)a3 purgeIfNeeded:(BOOL)a4;
- (void)_resetHandleSharingList;
- (void)_retryPeerRequestWithRetry:(unint64_t)a3;
- (void)_setUnderScrutiny:(BOOL)a3;
- (void)_showDebugAlertWithHeader:(id)a3 message:(id)a4;
- (void)_storePendingNicknameForUpload:(id)a3;
- (void)_storePublicNickname:(id)a3 nicknameLocation:(id)a4 encryptionKey:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8;
- (void)_syncActiveNicknameRecordsToOtherDevices;
- (void)_syncHandleAllowDenyListToOtherDevices;
- (void)_syncHandleTransitionedListToOtherDevices;
- (void)_syncIgnoredNicknameRecordsToOtherDevices;
- (void)_tryToReuploadPersonalNicknameWithRetryCount:(unint64_t)a3 reuploadVersion:(unint64_t)a4;
- (void)_updateActiveList:(id)a3 withRecords:(id)a4 broadcastUpdates:(BOOL)a5;
- (void)_updateActiveNicknameRecordsListIfNeeded:(id)a3;
- (void)_updateCloudKitRecordIDAndDecryptionKeyIfNeeded:(id)a3;
- (void)_updateDenyAllowListHandlesVersion;
- (void)_updateHandleDenyAllowListIfNeeded:(id)a3;
- (void)_updateHandleList:(id)a3 withHandles:(id)a4 forKey:(id)a5 broadcastUpdates:(BOOL)a6;
- (void)_updateHandleTransitionedListIfNeeded:(id)a3;
- (void)_updateIgnoredList:(id)a3 withRecords:(id)a4 broadcastUpdates:(BOOL)a5;
- (void)_updateIgnoredNicknameRecordsListIfNeeded:(id)a3;
- (void)_updateIsActiveListHandlesVersion;
- (void)_updateIsIgnoredListHandlesVersion;
- (void)_updateMessageDictionaryWithNicknameUpdateRecordIDs:(id)a3;
- (void)_updateMessageDictionaryWithPendingNicknameUpdates:(id)a3;
- (void)_updateNameOnlyUpdateForMessage:(id)a3 fromHandleID:(id)a4;
- (void)_updateNicknameInArchivedMap:(id)a3;
- (void)_updateNicknameInHandledMap:(id)a3 updateType:(unint64_t)a4 broadcastUpdates:(BOOL)a5;
- (void)_updateNicknameListsIfNeeded:(id)a3;
- (void)_updatePendingNicknameVersion;
- (void)_updateSharingPreferencesIfNeededFromMadridMessage:(id)a3;
- (void)_updateTransitionList:(id)a3 withHandles:(id)a4 forKey:(id)a5 broadcastUpdates:(BOOL)a6;
- (void)_updateTransitionedListHandlesVersion;
- (void)_uploadPendingNicknameIfNecessary;
- (void)_writeNicknameToKVStore:(id)a3 nickname:(id)a4;
- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4;
- (void)addNicknameToPendingUpdates:(id)a3;
- (void)aliasesDidChange:(BOOL)a3;
- (void)allowHandlesForSharing:(id)a3 onChatGUIDs:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6;
- (void)broadcastHandlesSharingNicknamesDidChange;
- (void)broadcastTransitionedHandlesDidChange;
- (void)cleanUpNicknameForIDs:(id)a3;
- (void)clearPendingNicknameForHandleID:(id)a3;
- (void)clearPendingNicknamePhotoForHandleID:(id)a3;
- (void)currentPersonalNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 completionBlock:(id)a8;
- (void)currentPersonalNicknamewithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)deleteAllPersonalNicknames:(BOOL)a3 withCompletion:(id)a4;
- (void)denyHandlesForSharing:(id)a3;
- (void)deviceSignedOutOfiMessage;
- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 isKnownSender:(BOOL)a8 shouldDecodeImageFields:(BOOL)a9 completionBlock:(id)a10;
- (void)handleNicknameUpdatesFromPeerDevice:(id)a3 fromPeerDevice:(id)a4;
- (void)ignorePendingNicknameForHandleID:(id)a3;
- (void)loadHandledTransitioned;
- (void)loadNicknamesFromKVStore;
- (void)loadPersonalNicknameIfNeeded;
- (void)loadSharingHandlesPrefs;
- (void)loadUnknownSenderRecordInfoFromKVStore;
- (void)markAllNicknamesAsPending;
- (void)markHandlesAsAllowed:(id)a3;
- (void)markNicknameAsUpdated:(id)a3;
- (void)markNicknamesAsTransitionedForHandleIDs:(id)a3 isAutoUpdate:(BOOL)a4;
- (void)markProfileRecords:(id)a3 asActive:(BOOL)a4;
- (void)markProfileRecordsAsIgnored:(id)a3 broadcastUpdates:(BOOL)a4;
- (void)newDeviceDidSignIntoiMessage;
- (void)purgeUnknownSenderRecordInfoIfNeeded;
- (void)queueChatToSendNicknamePostUploadIfNeeded:(id)a3;
- (void)reuploadProfileIfNeeded;
- (void)saveNicknameForRecordID:(id)a3 handleID:(id)a4 userNickname:(id)a5;
- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4;
- (void)sendNicknamePreferencesDidChange;
- (void)sendPendingNicknameUpdatesDidChange;
- (void)sendPersonalNicknameRecordIDAndVersionRequestedByDevice:(id)a3;
- (void)sendPersonalNicknameRecordIDAndVersionToAllPeers;
- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5;
- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5 onlySendToThoseLoggedOutOfIMessage:(BOOL)a6;
- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5 onlyUseNicknameSendingService:(BOOL)a6;
- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5 onlyUseNicknameSendingService:(BOOL)a6 onlySendToThoseLoggedOutOfIMessage:(BOOL)a7;
- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)setActiveNicknameRecords:(id)a3;
- (void)setArchivedNicknames:(id)a3;
- (void)setArchivedNicknamesKVStore:(id)a3;
- (void)setCallHistoryManager:(id)a3;
- (void)setChatsToSendNicknameInfoTo:(id)a3;
- (void)setCloudkitRecordsKVStore:(id)a3;
- (void)setHandleAllowList:(id)a3;
- (void)setHandleDenyList:(id)a3;
- (void)setHandleSharingKVStore:(id)a3;
- (void)setHandleTransitionedList:(id)a3;
- (void)setHandledNicknames:(id)a3;
- (void)setHandledNicknamesKVStore:(id)a3;
- (void)setIgnoredNicknameRecords:(id)a3;
- (void)setLastMeContactStoreSync:(double)a3;
- (void)setNeedToLoadMapsInfoFromDisk:(BOOL)a3;
- (void)setNicknameIsUploadingToCK:(BOOL)a3;
- (void)setNicknameRecordsKVStore:(id)a3;
- (void)setNicknameService:(id)a3;
- (void)setPendingNicknameUpdates:(id)a3;
- (void)setPendingNicknameUpdatesKVStore:(id)a3;
- (void)setPersonalNickname:(id)a3;
- (void)setPersonalNickname:(id)a3 completionBlock:(id)a4;
- (void)setUnknownSenderRecordInfo:(id)a3;
- (void)setUnknownSenderRecordInfoKVStore:(id)a3;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)verifyTruncatedRecordIDMatchesPersonalNickname:(id)a3 forChat:(id)a4;
@end

@implementation IMDNicknameController

+ (id)sharedInstance
{
  if (qword_1EBE2B860 != -1) {
    dispatch_once(&qword_1EBE2B860, &unk_1F3391320);
  }
  v2 = (void *)qword_1EBE2B998;

  return v2;
}

- (IMDNicknameController)init
{
  v43.receiver = self;
  v43.super_class = (Class)IMDNicknameController;
  v2 = [(IMDNicknameController *)&v43 init];
  v3 = v2;
  if (v2)
  {
    [(IMDNicknameController *)v2 _makeAllNicknameContentsClassC];
    if ([(IMDNicknameController *)v3 _nicknameFeatureEnabled])
    {
      if ((IMIsRunningInUnitTesting() & 1) == 0)
      {
        v4 = (void *)*MEMORY[0x1E4F6DDD8];
        v5 = [(id)*MEMORY[0x1E4F6DDD8] stringByAppendingPathComponent:@"nickNameKeyStore.db"];
        v6 = [v4 stringByResolvingAndStandardizingPath];
        IMSharedHelperEnsureDirectoryExistsAtPath();

        v7 = [v5 stringByResolvingAndStandardizingPath];

        uint64_t v8 = [objc_alloc(MEMORY[0x1E4F6B810]) initWithPath:v7 storeName:@"nicknamekeystore" dataProtectionClass:0];
        cloudkitRecordsKVStore = v3->_cloudkitRecordsKVStore;
        v3->_cloudkitRecordsKVStore = (IDSKVStore *)v8;

        v10 = [v4 stringByAppendingString:@"pendingNicknamesKeyStore.db"];
        v11 = [v10 stringByResolvingAndStandardizingPath];

        uint64_t v12 = [objc_alloc(MEMORY[0x1E4F6B810]) initWithPath:v11 storeName:@"pendingNicknameUpdatesStore" dataProtectionClass:0];
        pendingNicknameUpdatesKVStore = v3->_pendingNicknameUpdatesKVStore;
        v3->_pendingNicknameUpdatesKVStore = (IDSKVStore *)v12;

        v14 = [v4 stringByAppendingString:@"handledNicknamesKeyStore.db"];
        v15 = [v14 stringByResolvingAndStandardizingPath];

        uint64_t v16 = [objc_alloc(MEMORY[0x1E4F6B810]) initWithPath:v15 storeName:@"handledNicknamesStore" dataProtectionClass:0];
        handledNicknamesKVStore = v3->_handledNicknamesKVStore;
        v3->_handledNicknamesKVStore = (IDSKVStore *)v16;

        v18 = [v4 stringByAppendingString:@"archivedNicknamesKeyStore.db"];
        v19 = [v18 stringByResolvingAndStandardizingPath];

        uint64_t v20 = [objc_alloc(MEMORY[0x1E4F6B810]) initWithPath:v19 storeName:@"archivedNicknamesStore" dataProtectionClass:0];
        archivedNicknamesKVStore = v3->_archivedNicknamesKVStore;
        v3->_archivedNicknamesKVStore = (IDSKVStore *)v20;

        v22 = [v4 stringByAppendingString:@"handleSharingPreferences.db"];
        v23 = [v22 stringByResolvingAndStandardizingPath];

        uint64_t v24 = [objc_alloc(MEMORY[0x1E4F6B810]) initWithPath:v23 storeName:@"handleSharingPreferences" dataProtectionClass:0];
        handleSharingKVStore = v3->_handleSharingKVStore;
        v3->_handleSharingKVStore = (IDSKVStore *)v24;

        v26 = [v4 stringByAppendingString:@"nicknameRecordsStore.db"];
        v27 = [v26 stringByResolvingAndStandardizingPath];

        uint64_t v28 = [objc_alloc(MEMORY[0x1E4F6B810]) initWithPath:v27 storeName:@"nicknameRecordsStore" dataProtectionClass:0];
        nicknameRecordsKVStore = v3->_nicknameRecordsKVStore;
        v3->_nicknameRecordsKVStore = (IDSKVStore *)v28;

        v30 = [v4 stringByAppendingString:@"unknownSenderRecordInfoStore.db"];
        v31 = [v30 stringByResolvingAndStandardizingPath];

        uint64_t v32 = [objc_alloc(MEMORY[0x1E4F6B810]) initWithPath:v31 storeName:@"unknownSenderRecordInfoStore" dataProtectionClass:0];
        unknownSenderRecordInfoKVStore = v3->_unknownSenderRecordInfoKVStore;
        v3->_unknownSenderRecordInfoKVStore = (IDSKVStore *)v32;

        v34 = [MEMORY[0x1E4F6EAB8] sharedInstance];
        [v34 addListener:v3];

        v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v35 addObserver:v3 selector:sel__ckAccountChanged_ name:*MEMORY[0x1E4F19BE0] object:0];

        [(IMDNicknameController *)v3 _loadAllInfoFromDiskIfAble];
        [(IMDNicknameController *)v3 purgeUnknownSenderRecordInfoIfNeeded];
        uint64_t v36 = [objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.nameandphoto"];
        nicknameService = v3->_nicknameService;
        v3->_nicknameService = (IDSService *)v36;

        [(IDSService *)v3->_nicknameService addDelegate:v3 queue:MEMORY[0x1E4F14428]];
        v38 = [MEMORY[0x1E4F6AB38] sharedInstance];
        [v38 addListenerID:@"IMDNicknameController" forService:@"com.apple.private.alloy.nameandphoto"];

        v39 = (CHManager *)objc_alloc_init(MEMORY[0x1E4F57C80]);
        callHistoryManager = v3->_callHistoryManager;
        v3->_callHistoryManager = v39;

LABEL_8:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v42 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Nickname feature is turned off, don't load nickname info into memory", v42, 2u);
      }
      goto LABEL_8;
    }
  }
  return v3;
}

- (void)purgeUnknownSenderRecordInfoIfNeeded
{
  v2 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(IMDNicknameController *)self unknownSenderRecordInfo];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(IMDNicknameController *)v2 unknownSenderRecordInfo];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v7 = [(IMDNicknameController *)v2 unknownSenderRecordInfo];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        LOBYTE(v10) = 0;
        uint64_t v29 = *(void *)v33;
        uint64_t v11 = *MEMORY[0x1E4F6BEF8];
        id obj = v7;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v33 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            v14 = v2;
            v15 = [(IMDNicknameController *)v2 unknownSenderRecordInfo];
            uint64_t v16 = [v15 objectForKey:v13];

            v17 = +[IMDChatRegistry sharedInstance];
            v18 = [v17 aliasToCNIDMap];
            v19 = [v18 objectForKey:v13];

            if (v19 && ![v19 isEqualToString:v11]) {
              goto LABEL_11;
            }
            uint64_t v36 = v13;
            uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
            v21 = IMDCNRecordIDForAliases();

            uint64_t v22 = [v21 _stringForKey:v13];

            v19 = (void *)v22;
            if (v22)
            {
LABEL_11:
              LOBYTE(v22) = [v19 isEqualToString:v11] ^ 1;
            }
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = sub_1D975FA00;
            v30[3] = &unk_1E6B75D70;
            char v31 = v22;
            v23 = [MEMORY[0x1E4F28F60] predicateWithBlock:v30];
            uint64_t v24 = [v16 filteredSetUsingPredicate:v23];
            v25 = v24;
            if (v10)
            {
              BOOL v10 = 1;
            }
            else
            {
              uint64_t v26 = [v24 count];
              BOOL v10 = v26 != [v16 count];
            }
            v2 = v14;
            if ([v25 count]) {
              [v28 setObject:v25 forKey:v13];
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v9);

        if (v10) {
          [(IMDNicknameController *)v14 _replaceUnknownSenderRecordInfoListWithInfo:v28 purgeIfNeeded:0];
        }
      }
      else
      {
      }
    }
  }
}

- (void)dealloc
{
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    uint64_t v3 = [MEMORY[0x1E4F6EAB8] sharedInstance];
    [v3 removeListener:self];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)IMDNicknameController;
  [(IMDNicknameController *)&v5 dealloc];
}

- (id)defaults
{
  return (id)[MEMORY[0x1E4F6E720] sharedInstance];
}

- (BOOL)evaluateAccountStateForFeatureEligibility
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isNameAndPhotoC3Enabled];

  objc_super v5 = +[IMDCKUtilities sharedInstance];
  uint64_t v6 = v5;
  if (v4) {
    uint64_t v7 = [v5 signedIntoiCloudAccount];
  }
  else {
    uint64_t v7 = [v5 signedIntoiCloudAndiMessageAndiCloudAccountMatchesiMessageAccount];
  }
  BOOL v8 = v7;

  uint64_t v9 = [(IMDNicknameController *)self defaults];
  uint64_t v10 = *MEMORY[0x1E4F6DE00];
  uint64_t v11 = *MEMORY[0x1E4F6DE78];
  uint64_t v12 = [v9 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE78]];
  int v13 = [v12 BOOLValue];

  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = @"NO";
      if (v8) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      if (v13) {
        v15 = @"YES";
      }
      int v20 = 138412546;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Evaluating account state for feature eligibility {refreshedFeatureEligibility: %@ currentFeatureEligibility: %@}", (uint8_t *)&v20, 0x16u);
    }
  }
  if (v8 != v13)
  {
    v17 = [(IMDNicknameController *)self defaults];
    v18 = [NSNumber numberWithBool:v8];
    [v17 setValue:v18 forDomain:v10 forKey:v11];
  }
  return v8;
}

- (void)aliasesDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      int v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Received aliases did change hasMultiplePhoneNumbers %@", (uint8_t *)&v18, 0xCu);
    }
  }
  uint64_t v7 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v7 isInternalInstall])
  {
    BOOL v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v9 = [v8 isAllowMultiplePhoneNumbersSNaPEnabled];

    if (!v9)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Received device is internal install, allowing nicknames with multiple numbers.", (uint8_t *)&v18, 2u);
        }
      }
      uint64_t v11 = [(IMDNicknameController *)self defaults];
      [v11 setValue:0 forDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE38]];
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v12 = [(IMDNicknameController *)self defaults];
  uint64_t v13 = *MEMORY[0x1E4F6DE00];
  uint64_t v14 = *MEMORY[0x1E4F6DE38];
  v15 = [v12 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE38]];
  int v16 = [v15 BOOLValue];

  if (v16 == v3) {
    return;
  }
  uint64_t v11 = [(IMDNicknameController *)self defaults];
  v17 = [NSNumber numberWithBool:v3];
  [v11 setValue:v17 forDomain:v13 forKey:v14];

LABEL_17:
}

- (void)_evaluateIfAccountHasMultiplePhoneNumbers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[IMDServiceController sharedController];
  int v4 = [v3 serviceWithName:*MEMORY[0x1E4F6E1B0]];

  objc_super v5 = +[IMDAccountController sharedInstance];
  uint64_t v6 = [v5 accountsForService:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = objc_msgSend(v12, "idsAccount", (void)v15);
          int v14 = [v13 accountType];

          if (v14 == 1)
          {
            -[IMDNicknameController aliasesDidChange:](self, "aliasesDidChange:", [v12 multiplePhoneNumbersTiedToAccount]);
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (unint64_t)_reuploadLocalProfileVersionNumber
{
  unint64_t v2 = 1;
  BOOL v3 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  int v4 = [v3 objectForKey:@"nickname-reupload-profile-version"];

  if (v4) {
    unint64_t v2 = [v4 unsignedIntegerValue];
  }
  objc_super v5 = [MEMORY[0x1E4F6E720] sharedInstance];
  int v6 = [v5 getBoolFromDomain:*MEMORY[0x1E4F6DE00] forKey:@"UseOldProfilesContainer"];

  if (v6) {
    unint64_t v2 = 0;
  }

  return v2;
}

- (void)_tryToReuploadPersonalNicknameWithRetryCount:(unint64_t)a3 reuploadVersion:(unint64_t)a4
{
  if (a3 > 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "We were not successful in reuploading our nickname to the new container", (uint8_t *)location, 2u);
      }
    }
    uint64_t v9 = [(IMDNicknameController *)self defaults];
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a4];
    [v9 setValue:v10 forDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE58]];
  }
  else
  {
    location[0] = 0;
    objc_initWeak(location, self);
    id v7 = [(IMDNicknameController *)self personalNickname];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1D9760410;
    v11[3] = &unk_1E6B75D98;
    objc_copyWeak(v12, location);
    v12[1] = (id)a4;
    v12[2] = (id)a3;
    [(IMDNicknameController *)self setPersonalNickname:v7 completionBlock:v11];

    objc_destroyWeak(v12);
    objc_destroyWeak(location);
  }
}

- (void)reuploadProfileIfNeeded
{
  BOOL v3 = [(IMDNicknameController *)self defaults];
  int v4 = [v3 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE58]];
  unint64_t v5 = [v4 unsignedIntegerValue];

  unint64_t v6 = [(IMDNicknameController *)self _reuploadLocalProfileVersionNumber];
  if (v5 < v6)
  {
    [(IMDNicknameController *)self _tryToReuploadPersonalNicknameWithRetryCount:0 reuploadVersion:v6];
  }
}

- (NSMutableDictionary)pendingNicknameUpdates
{
  return self->_pendingNicknameUpdates;
}

- (NSMutableDictionary)handledNicknames
{
  return self->_handledNicknames;
}

- (NSMutableDictionary)archivedNicknames
{
  return self->_archivedNicknames;
}

- (void)newDeviceDidSignIntoiMessage
{
}

- (void)_retryPeerRequestWithRetry:(unint64_t)a3
{
}

- (void)_newDeviceDidSignIntoiMessageWithRetryCount:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = [(IMDNicknameController *)self defaults];
  unint64_t v5 = [v4 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE50]];
  int v6 = [v5 BOOLValue];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v9 = (void *)v8;
      uint64_t v10 = @"NO";
      if (v6) {
        uint64_t v10 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Told this device just signed into iMessage, we need to ask our peers for nickname info requestedInfoBefore %@ retry count %@", buf, 0x16u);
    }
  }
  if ((v6 & 1) == 0) {
    im_dispatch_after();
  }
}

- (void)deviceSignedOutOfiMessage
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Told this device signed out of iMessage, we need to reset the bit that we've asked for the nickname feature info", v8, 2u);
    }
  }
  int v4 = [(IMDNicknameController *)self defaults];
  uint64_t v5 = *MEMORY[0x1E4F6DE00];
  [v4 setValue:0 forDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE50]];

  int v6 = [(IMDNicknameController *)self defaults];
  [v6 setValue:MEMORY[0x1E4F1CC28] forDomain:v5 forKey:*MEMORY[0x1E4F6DE20]];

  id v7 = [(IMDNicknameController *)self defaults];
  [v7 setValue:&unk_1F33C5B20 forDomain:v5 forKey:*MEMORY[0x1E4F6DE68]];

  [(IMDNicknameController *)self _deletePublicNicknameLocationAndKey];
}

- (void)verifyTruncatedRecordIDMatchesPersonalNickname:(id)a3 forChat:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled]
    && [v7 style] == 45)
  {
    uint64_t v8 = [(IMDNicknameController *)self personalNickname];
    uint64_t v9 = [(IMDNicknameController *)self substringRecordIDForNickname:v8];

    int v10 = [v9 isEqualToString:v6];
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [(IMDNicknameController *)self personalNickname];
        uint64_t v13 = [v12 recordID];
        uint64_t v14 = (void *)v13;
        uint64_t v15 = @"NO";
        *(_DWORD *)long long v17 = 138413058;
        *(void *)&v17[4] = v6;
        if (v10) {
          uint64_t v15 = @"YES";
        }
        *(_WORD *)&v17[12] = 2112;
        *(void *)&v17[14] = v13;
        __int16 v18 = 2112;
        v19 = v9;
        __int16 v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Going to verify if truncated record ID %@ is equivalent to our personal record id %@ current truncated id %@ recordIDS are equals %@", v17, 0x2Au);
      }
    }
    if ((v10 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        long long v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v17 = 0;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Truncated record id does not match, marking this chat as dirty so we send a nickname on the next message send", v17, 2u);
        }
      }
      objc_msgSend(v7, "meCardHasUpdated", *(_OWORD *)v17);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Nickname sharing is not enabled or trying to verify on a group chat -- bailing verifying record ids", v17, 2u);
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (void)_beginNicknameUpload:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Beginning upload of nickname profile to CloudKit", buf, 2u);
    }
  }
  self->_nicknameIsUploadingToCK = 1;
  [(IMDNicknameController *)self _storePendingNicknameForUpload:v4];
  im_dispatch_after();
}

- (void)_endNicknameUpload
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_nicknameIsUploadingToCK = 0;
  [(IMDNicknameController *)self _deletePendingNicknameForUpload];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Nickname upload has completed -- sending out of band nickname updates", buf, 2u);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(IMDNicknameController *)self chatsToSendNicknameInfoTo];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v19;
    *(void *)&long long v6 = 138412290;
    long long v17 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
        int v10 = +[IMDChatRegistry sharedInstance];
        uint64_t v11 = [v10 existingChatWithGUID:v9];

        if (v11)
        {
          uint64_t v12 = [v11 participants];
          uint64_t v13 = [v11 guid];
          uint64_t v14 = [v11 lastAddressedLocalHandle];
          [(IMDNicknameController *)self sendPersonalNicknameToRecipients:v12 chatGUID:v13 fromHandle:v14];
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = v9;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "We couldn't find a chat to send nickname info to for guid %@", buf, 0xCu);
          }
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v5);
  }

  long long v16 = [(IMDNicknameController *)self chatsToSendNicknameInfoTo];
  [v16 removeAllObjects];
}

- (void)setPersonalNickname:(id)a3
{
  uint64_t v5 = (IMNickname *)a3;
  personalNickname = self->_personalNickname;
  p_personalNickname = &self->_personalNickname;
  if (personalNickname != v5)
  {
    int v10 = v5;
    objc_storeStrong((id *)p_personalNickname, a3);
    uint64_t v8 = +[IMDBroadcastController sharedProvider];
    uint64_t v9 = [v8 broadcasterForAccountListeners];
    [v9 updatePersonalNickname:*p_personalNickname];

    uint64_t v5 = v10;
  }
}

- (void)setPersonalNickname:(id)a3 completionBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v6 avatar];
      int v10 = [v9 imageFilePath];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Client request to store new personal nickname %@ path%@", buf, 0x16u);
    }
  }
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled]
    && [(IMDNicknameController *)self _isNicknamesSharingEnabled])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D976176C;
    aBlock[3] = &unk_1E6B72C60;
    id v22 = v7;
    uint64_t v11 = _Block_copy(aBlock);
    uint64_t v12 = [(IMDNicknameController *)self transferServicesController];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      [(IMDNicknameController *)self _beginNicknameUpload:v6];
      uint64_t v14 = [(IMDNicknameController *)self nickNameRecordID];
      uint64_t v15 = [v6 description];
      [(IMDNicknameController *)self _showDebugAlertWithHeader:@"Uploading Personal Nickname" message:v15];

      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      long long v16 = [(IMDNicknameController *)self transferServicesController];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1D9761784;
      v18[3] = &unk_1E6B75DC0;
      objc_copyWeak(&v20, (id *)buf);
      id v19 = v11;
      [v16 setPersonalNickname:v6 oldRecordID:v14 completionBlockWithWallpaperTags:v18];

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Trying to set a personal nickname when the feature is off", buf, 2u);
      }
    }
    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)_uploadPendingNicknameIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self _getPendingNicknameForUpload];
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        uint64_t v9 = v3;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Loaded pending nickname from disk: %@ and uploading", (uint8_t *)&v8, 0xCu);
      }
    }
    id v6 = [v3 description];
    [(IMDNicknameController *)self _showDebugAlertWithHeader:@"Found Pending Nickname Upload" message:v6];

    [(IMDNicknameController *)self setPersonalNickname:v3 completionBlock:0];
  }
  else if (v4)
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "No pending nickname found.", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)_resetHandleSharingList
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Resetting handle allow/denylist", v8, 2u);
    }
  }
  [(IMDNicknameController *)self _clearSharingLists];
  [(IMDNicknameController *)self _updateDenyAllowListHandlesVersion];
  [(IMDNicknameController *)self _syncHandleAllowDenyListToOtherDevices];
  int v4 = +[IMDBroadcastController sharedProvider];
  uint64_t v5 = [v4 broadcasterForAccountListeners];
  id v6 = [(IMDNicknameController *)self allowListedHandlesForSharing];
  id v7 = [(IMDNicknameController *)self denyListedHandlesForSharing];
  [v5 updateNicknameHandlesForSharing:v6 blocked:v7];
}

- (void)_clearSharingLists
{
  BOOL v3 = [(IMDNicknameController *)self handleAllowList];
  [v3 removeAllObjects];

  int v4 = [(IMDNicknameController *)self handleDenyList];
  [v4 removeAllObjects];

  id v5 = [(IMDNicknameController *)self handleSharingKVStore];
  [v5 deleteDatabase];
}

- (void)_clearTransitionedList
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self handleTransitionedList];
  [v3 removeAllObjects];

  int v4 = [(IMDNicknameController *)self nicknameRecordsKVStore];
  id v7 = 0;
  [v4 persistData:0 forKey:@"handleTransitionedList" error:&v7];
  id v5 = v7;

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Clearing nickname transition list, error: %@", buf, 0xCu);
    }
  }
}

- (void)_clearActiveNicknameRecords
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self activeNicknameRecords];
  [v3 removeAllObjects];

  int v4 = [(IMDNicknameController *)self nicknameRecordsKVStore];
  id v7 = 0;
  [v4 persistData:0 forKey:@"activeNicknameRecords" error:&v7];
  id v5 = v7;

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Clearing nickname active records, error: %@", buf, 0xCu);
    }
  }
}

- (void)_clearIgnoredNicknameRecords
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self ignoredNicknameRecords];
  [v3 removeAllObjects];

  int v4 = [(IMDNicknameController *)self nicknameRecordsKVStore];
  id v7 = 0;
  [v4 persistData:0 forKey:@"ignoredNicknameRecords" error:&v7];
  id v5 = v7;

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Clearing nickname ignored records, error: %@", buf, 0xCu);
    }
  }
}

- (void)currentPersonalNicknamewithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v9 = [(IMDNicknameController *)self nickNameRecordID];
  id v5 = [(IMDNicknameController *)self nickNameDecryptionKey];
  id v6 = [(IMDNicknameController *)self wallpaperDataTag];
  id v7 = [(IMDNicknameController *)self lowResWallpaperDataTag];
  int v8 = [(IMDNicknameController *)self wallpaperDataTag];
  [(IMDNicknameController *)self currentPersonalNicknameWithRecordID:v9 decryptionKey:v5 wallpaperDataTag:v6 wallpaperLowResDataTag:v7 wallpaperMetadataTag:v8 completionBlock:v4];
}

- (void)currentPersonalNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Going to retrieve the current nickname from CloudKit", buf, 2u);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D9762528;
  aBlock[3] = &unk_1E6B75DE8;
  id v21 = v19;
  id v38 = v21;
  id v22 = _Block_copy(aBlock);
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    if ([v14 length] && objc_msgSend(v15, "length"))
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = sub_1D9762540;
      v31[3] = &unk_1E6B75E10;
      id v32 = v14;
      objc_copyWeak(&v35, (id *)buf);
      id v30 = v15;
      id v23 = v15;
      id v24 = v18;
      id v25 = v16;
      id v26 = v23;
      id v33 = v23;
      id v34 = v22;
      LOBYTE(v29) = 1;
      id v27 = v26;
      id v16 = v25;
      id v18 = v24;
      [(IMDNicknameController *)self getNicknameWithRecordID:v32 decryptionKey:v27 wallpaperDataTag:v16 wallpaperLowResDataTag:v17 wallpaperMetadataTag:v24 isKnownSender:1 shouldDecodeImageFields:v29 completionBlock:v31];

      objc_destroyWeak(&v35);
      objc_destroyWeak((id *)buf);
      id v15 = v30;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not fetching current nickname", buf, 2u);
      }
    }
    if (v22) {
      (*((void (**)(void *, void, void))v22 + 2))(v22, 0, 0);
    }
  }
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 isKnownSender:(BOOL)a8 shouldDecodeImageFields:(BOOL)a9 completionBlock:(id)a10
{
  BOOL v45 = a8;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a10;
  id v19 = (objc_class *)MEMORY[0x1E4F6C3F8];
  id v44 = a4;
  id v47 = a3;
  id v20 = objc_alloc_init(v19);
  [v20 startTimingForKey:@"Nickname Download"];
  id v21 = [(IMDNicknameController *)self transferServicesController];
  char v22 = objc_opt_respondsToSelector();

  id v23 = [(IMDNicknameController *)self transferServicesController];
  v46 = v16;
  if (v22)
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = sub_1D9762A84;
    v54[3] = &unk_1E6B75E38;
    v42 = &v59;
    objc_super v43 = &v55;
    id v58 = v17;
    id v59 = v18;
    id v55 = v20;
    id v56 = v15;
    v40 = &v57;
    v41 = &v56;
    id v24 = &v58;
    id v57 = v16;
    id v25 = v17;
    id v26 = v16;
    id v27 = v15;
    id v28 = v15;
    id v29 = v18;
    id v30 = v20;
    LOBYTE(v39) = a9;
    char v31 = v44;
    [v23 getNicknameWithRecordID:v47 decryptionKey:v44 wallpaperDataTag:v28 wallpaperLowResDataTag:v26 wallpaperMetadataTag:v25 isKnownSender:v45 shouldDecodeImageFields:v39 completionBlock:v54];
  }
  else
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = sub_1D9762C74;
    v48[3] = &unk_1E6B75E38;
    v42 = &v53;
    objc_super v43 = &v49;
    id v52 = v17;
    id v53 = v18;
    id v49 = v20;
    id v50 = v15;
    v40 = &v51;
    v41 = &v50;
    id v24 = &v52;
    id v51 = v16;
    id v32 = v17;
    id v33 = v16;
    id v34 = v15;
    id v35 = v33;
    id v27 = v34;
    id v36 = v34;
    id v37 = v18;
    id v38 = v20;
    char v31 = v44;
    [v23 getNicknameWithRecordID:v47 decryptionKey:v44 wallpaperDataTag:v36 wallpaperLowResDataTag:v35 wallpaperMetadataTag:v32 isKnownSender:v45 completionBlock:v48];
  }
}

- (void)NicknameWithRecordID:(id)a3 URI:(id)a4 decryptionKey:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 hasWallpaperUpdate:(BOOL)a9 dropNicknameForUnknownContacts:(BOOL)a10 withCompletionBlock:(id)a11
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v73 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a11;
  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      __int16 v86 = 2112;
      *(void *)v87 = v18;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Asked to fetch nickname with recordID %@, sender URI: %@", buf, 0x16u);
    }
  }
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    if ([v17 length] && objc_msgSend(v18, "length") && objc_msgSend(v19, "length"))
    {
      v72 = [v18 _stripFZIDPrefix];
      v71 = [(IMDNicknameController *)self nicknameForRecordID:v17 handle:v72];
      id v24 = +[IMDChatRegistry sharedInstance];
      id v25 = [v24 aliasToCNIDMap];
      id v26 = [v25 objectForKey:v72];

      if (v26)
      {
        uint64_t v27 = *MEMORY[0x1E4F6BEF8];
        char v28 = [v26 isEqualToString:*MEMORY[0x1E4F6BEF8]];
        id v29 = v72;
        if (v72) {
          char v30 = v28;
        }
        else {
          char v30 = 0;
        }
        if ((v30 & 1) == 0)
        {
          char v31 = v26;
LABEL_29:
          v67 = v31;
          unsigned int v70 = [v31 isEqualToString:v27] ^ 1;
LABEL_31:
          if (IMOSLoggingEnabled())
          {
            id v37 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              id v38 = @"NO";
              if (v70) {
                id v38 = @"YES";
              }
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v72;
              __int16 v86 = 2112;
              *(void *)v87 = v38;
              _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Is %@ a known sender: %@", buf, 0x16u);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v67;
              __int16 v86 = 2112;
              *(void *)v87 = v72;
              _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Found contactID: %@ for handle: %@", buf, 0x16u);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              v41 = +[IMDChatRegistry sharedInstance];
              v42 = [v41 aliasToCNIDMap];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v42;
              _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "Current aliasToCNIDMap %@", buf, 0xCu);
            }
          }
          v69 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
          v68 = [v69 objectForKey:@"disable-SNaP-downloads-for-unknown-senders"];
          int v43 = [v68 BOOLValue];
          if (IMOSLoggingEnabled())
          {
            id v44 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              BOOL v45 = @"NO";
              if (v43) {
                BOOL v45 = @"YES";
              }
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v45;
              _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "IDS server bag tells us to drop all payloads from unknown senders: %@", buf, 0xCu);
            }
          }
          if (((a10 | v43) ^ 1 | v70))
          {
            if (v71)
            {
              uint64_t v46 = [v71 wallpaper];
              BOOL v47 = v46 == 0 && a9;
              if (v46 == 0 && a9) {
                v48 = 0;
              }
              else {
                v48 = (void *)v46;
              }

              int v49 = v47 & v70;
            }
            else
            {
              int v49 = 0;
            }
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = sub_1D9763AA8;
            aBlock[3] = &unk_1E6B75E60;
            id v51 = v72;
            id v84 = v51;
            v66 = (uint64_t (**)(void))_Block_copy(aBlock);
            v80[0] = MEMORY[0x1E4F143A8];
            v80[1] = 3221225472;
            v80[2] = sub_1D9763BD8;
            v80[3] = &unk_1E6B75E88;
            id v63 = v51;
            id v81 = v63;
            v82 = self;
            v64 = (uint64_t (**)(void))_Block_copy(v80);
            if (v70 & 1) != 0 || (v66[2]()) {
              int v65 = 1;
            }
            else {
              int v65 = v64[2]();
            }
            if (v71)
            {
              id v52 = [v71 avatar];
              int v53 = [v52 hasImage];

              int v54 = v65 & ~v53;
            }
            else
            {
              int v54 = 0;
            }
            if (IMOSLoggingEnabled())
            {
              id v55 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                id v56 = @"NO";
                if (v65) {
                  id v56 = @"YES";
                }
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v56;
                _os_log_impl(&dword_1D967A000, v55, OS_LOG_TYPE_INFO, "Should decode image fields: %@", buf, 0xCu);
              }
            }
            if (v71) {
              int v57 = v49;
            }
            else {
              int v57 = 1;
            }
            int v58 = IMOSLoggingEnabled();
            if (v54 | v57)
            {
              if (v58)
              {
                id v59 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v17;
                  _os_log_impl(&dword_1D967A000, v59, OS_LOG_TYPE_INFO, "Retrieving nickname from IMTransferAgent with recordID %@", buf, 0xCu);
                }
              }
              *(void *)buf = 0;
              objc_initWeak((id *)buf, self);
              v74[0] = MEMORY[0x1E4F143A8];
              v74[1] = 3221225472;
              v74[2] = sub_1D9763D40;
              v74[3] = &unk_1E6B75EB0;
              objc_copyWeak(&v79, (id *)buf);
              id v75 = v63;
              id v76 = v18;
              id v77 = v17;
              id v78 = v22;
              LOBYTE(v62) = v65;
              [(IMDNicknameController *)self getNicknameWithRecordID:v77 decryptionKey:v19 wallpaperDataTag:v73 wallpaperLowResDataTag:v20 wallpaperMetadataTag:v21 isKnownSender:v70 shouldDecodeImageFields:v62 completionBlock:v74];

              objc_destroyWeak(&v79);
              objc_destroyWeak((id *)buf);
            }
            else
            {
              v60 = v71;
              if (v58)
              {
                v61 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138413314;
                  *(void *)&uint8_t buf[4] = v17;
                  __int16 v86 = 1024;
                  *(_DWORD *)v87 = v70;
                  *(_WORD *)&v87[4] = 1024;
                  *(_DWORD *)&v87[6] = 1;
                  LOWORD(v88) = 1024;
                  *(_DWORD *)((char *)&v88 + 2) = a9;
                  HIWORD(v88) = 2112;
                  v89 = v71;
                  _os_log_impl(&dword_1D967A000, v61, OS_LOG_TYPE_INFO, "Already have this one, no need to grab it again from CloudKit with recordID %@, knownSender: %i, shouldAttemptWallpaperFetch: %i, hasWallpaperUpdate: %i, existingNickname: %@", buf, 0x28u);
                }

                v60 = v71;
              }
              (*((void (**)(id, void *, uint64_t, void, uint64_t))v22 + 2))(v22, v60, 1, 0, 1);
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              id v50 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "Refusing to download SNaP payload because the sender is unknown and we have been told drop incoming payloads from this or all unknown senders.", buf, 2u);
              }
            }
            if (v22) {
              (*((void (**)(id, void, void, void, uint64_t))v22 + 2))(v22, 0, 0, 0, 1);
            }
          }

          goto LABEL_93;
        }
      }
      else
      {
        id v29 = v72;
        if (!v72) {
          goto LABEL_30;
        }
      }
      v90[0] = v29;
      id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:1];
      id v35 = IMDCNRecordIDForAliases();

      uint64_t v36 = [v35 _stringForKey:v72];

      if (v36)
      {
        char v31 = (void *)v36;
        uint64_t v27 = *MEMORY[0x1E4F6BEF8];
        goto LABEL_29;
      }
LABEL_30:
      v67 = 0;
      unsigned int v70 = 0;
      goto LABEL_31;
    }
    if (IMOSLoggingEnabled())
    {
      id v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v17;
        __int16 v86 = 2112;
        *(void *)v87 = v18;
        *(_WORD *)&v87[8] = 2112;
        id v88 = v19;
        _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "We are missing parameters to fetch the CloudKit record (recordID: %@) (URI: %@) (decryptionKey: %@)", buf, 0x20u);
      }
    }
LABEL_20:
    (*((void (**)(id, void, void, void, uint64_t))v22 + 2))(v22, 0, 0, 0, 1);
    goto LABEL_93;
  }
  if (IMOSLoggingEnabled())
  {
    id v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Name+Photo sharing feature is disabled, not fetching CloudKit record", buf, 2u);
    }
  }
  if (v22) {
    goto LABEL_20;
  }
LABEL_93:
}

- (void)deleteAllPersonalNicknames:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(IMDNicknameController *)self _nicknameFeatureEnabled];
  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Client request to delete personal nickname with recordID", buf, 2u);
      }
    }
    uint64_t v10 = [(IMDNicknameController *)self transferServicesController];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      uint64_t v12 = [(IMDNicknameController *)self transferServicesController];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_1D9764200;
      v14[3] = &unk_1E6B75ED8;
      objc_copyWeak(&v16, (id *)buf);
      BOOL v17 = a3;
      id v15 = v6;
      [v12 deleteAllPersonalNicknamesWithCompletion:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
  else if (v8)
  {
    char v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "The nickname feature is disabled, we shouldn't make any requests to CloudKit", buf, 2u);
    }
  }
}

- (void)_updateSharingPreferencesIfNeededFromMadridMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    id v5 = [v4 objectForKey:MessageDictionaryMeCardSharingAudienceKey];
    id v6 = [v4 objectForKey:MessageDictionaryMeCardSharingEnabledKey];
    BOOL v7 = [v4 objectForKey:MessageDictionaryMeCardSharingNameForkedKey];
    int v8 = [v4 objectForKey:MessageDictionaryMeCardSharingImageForkedKey];
    id v9 = [NSString stringWithFormat:@"audienceValue %@ enabledValue %@ nameForked %@ imageForked %@", v5, v6, v7, v8];
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v9;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Going to update Me Card preferences %@", buf, 0xCu);
      }
    }
    if (v5 || v6 || v7 || v8)
    {
      [(IMDNicknameController *)self _showDebugAlertWithHeader:@"Sharing Preferences Changed" message:v9];
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v11 = [v5 integerValue];
          if (v11 <= 2)
          {
            uint64_t v12 = [(IMDNicknameController *)self defaults];
            char v13 = [NSNumber numberWithInteger:v11];
            [v12 setValue:v13 forDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE18]];
          }
        }
      }
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = [(IMDNicknameController *)self defaults];
          id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "BOOLValue"));
          [v14 setValue:v15 forDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE30]];
        }
      }
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = [(IMDNicknameController *)self defaults];
          BOOL v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "BOOLValue"));
          [v16 setValue:v17 forDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE28]];
        }
      }
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = [(IMDNicknameController *)self defaults];
          id v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
          [v18 setValue:v19 forDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE20]];

          if (([v6 BOOLValue] & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              id v20 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Not enabled, deleting local recordID and cache", buf, 2u);
              }
            }
            [(IMDNicknameController *)self _deletePublicNicknameLocationAndKey];
            [(IMDNicknameController *)self setPersonalNickname:0];
          }
        }
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "The nickname feature is disabled, not taking updates coming from madrid", buf, 2u);
    }
  }
}

- (void)_updateMessageDictionaryWithPendingNicknameUpdates:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDNicknameController *)self defaults];
  id v6 = [v5 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE48]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  int v8 = [(IMDNicknameController *)self pendingNicknameUpdates];
  id v10 = [v8 allKeys];

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1C978] array];
  }
  id v9 = [NSNumber numberWithUnsignedInteger:v7];
  [v4 setObject:v9 forKey:MessageDictionaryPendingNicknameUpdatesVersionKey];

  [v4 setObject:v10 forKey:MessageDictionaryPendingNicknameUpdatesHandlesKey];
}

- (void)_updateMessageDictionaryWithNicknameUpdateRecordIDs:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v4 = [(IMDNicknameController *)self defaults];
  id v5 = [v4 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE48]];
  uint64_t v42 = [v5 unsignedIntegerValue];

  id v6 = [(IMDNicknameController *)self pendingNicknameUpdates];
  uint64_t v7 = [v6 allValues];

  int v8 = [(IMDNicknameController *)self handledNicknames];
  id v9 = [v8 allValues];

  id v10 = [(IMDNicknameController *)self archivedNicknames];
  unint64_t v11 = [v10 allValues];

  if (v7)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_33:
    id v9 = [MEMORY[0x1E4F1C978] array];
    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_34;
  }
  uint64_t v7 = [MEMORY[0x1E4F1C978] array];
  if (!v9) {
    goto LABEL_33;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_34:
  unint64_t v11 = [MEMORY[0x1E4F1C978] array];
LABEL_4:
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v19 = [v18 objectForKeyedSubscript:@"rid"];

        if (v19)
        {
          id v20 = [v18 objectForKeyedSubscript:@"rid"];
          [v12 addObject:v20];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v15);
  }
  v40 = v13;
  v41 = v12;

  id v21 = [MEMORY[0x1E4F1CA48] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v22 = v9;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v49 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        char v28 = objc_msgSend(v27, "objectForKeyedSubscript:", @"rid", v40);

        if (v28)
        {
          id v29 = [v27 objectForKeyedSubscript:@"rid"];
          [v21 addObject:v29];
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v24);
  }

  char v30 = [MEMORY[0x1E4F1CA48] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v31 = v11;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v45;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void **)(*((void *)&v44 + 1) + 8 * k);
        id v37 = objc_msgSend(v36, "objectForKeyedSubscript:", @"rid", v40);

        if (v37)
        {
          id v38 = [v36 objectForKeyedSubscript:@"rid"];
          [v30 addObject:v38];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v33);
  }

  uint64_t v39 = [NSNumber numberWithUnsignedInteger:v42];
  [v43 setObject:v39 forKey:MessageDictionaryPendingNicknameUpdatesVersionKey];

  [v43 setObject:v41 forKey:MessageDictionaryPendingNicknameUpdatesRecordIDsKey];
  [v43 setObject:v21 forKey:MessageDictionaryCurrentNicknameUpdatesRecordIDsKey];
  [v43 setObject:v30 forKey:MessageDictionaryArchivedNicknameUpdatesRecordIDsKey];
}

- (id)messageDictionaryWithPersonalRecordIDAndVersion
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  value = objc_msgSend(NSNumber, "numberWithBool:", -[IMDNicknameController _isNicknamesSharingEnabled](self, "_isNicknamesSharingEnabled"));
  if (value) {
    CFDictionarySetValue(v3, (const void *)MessageDictionaryMeCardSharingEnabledKey, value);
  }
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = value;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Transporting sharingEnabled %@", buf, 0xCu);
    }
  }
  id v5 = [(IMDNicknameController *)self defaults];
  uint64_t v6 = *MEMORY[0x1E4F6DE00];
  uint64_t v23 = [v5 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE18]];

  if (v23) {
    CFDictionarySetValue(v3, (const void *)MessageDictionaryMeCardSharingAudienceKey, v23);
  }
  uint64_t v7 = [(IMDNicknameController *)self defaults];
  id v22 = [v7 getValueFromDomain:v6 forKey:*MEMORY[0x1E4F6DE40]];

  int v8 = [(IMDNicknameController *)self nickNameDecryptionKey];
  id v9 = [(IMDNicknameController *)self wallpaperDataTag];
  id v10 = [(IMDNicknameController *)self lowResWallpaperDataTag];
  unint64_t v11 = [(IMDNicknameController *)self wallpaperMetadataTag];
  uint64_t v12 = [(IMDNicknameController *)self nickNameRecordID];
  if (v22) {
    CFDictionarySetValue(v3, (const void *)MessageDictionaryNicknameVersionKey, v22);
  }
  if (v12) {
    CFDictionarySetValue(v3, (const void *)MessageDictionaryPersonalNicknameRecordIDKey, v12);
  }
  if (v8) {
    CFDictionarySetValue(v3, (const void *)MessageDictionaryPersonalNicknameDecryptKeyKey, v8);
  }
  if (v9) {
    CFDictionarySetValue(v3, MessageDictionaryNicknameWallpaperTagKey, v9);
  }
  if (v10) {
    CFDictionarySetValue(v3, MessageDictionaryNicknameLowResWallpaperTagKey, v10);
  }
  if (v11) {
    CFDictionarySetValue(v3, MessageDictionaryNicknameWallpaperMetadataTagKey, v11);
  }
  id v13 = [(IMDNicknameController *)self defaults];
  uint64_t v14 = [v13 getValueFromDomain:v6 forKey:*MEMORY[0x1E4F6DE30]];

  uint64_t v15 = [(IMDNicknameController *)self defaults];
  uint64_t v16 = [v15 getValueFromDomain:v6 forKey:*MEMORY[0x1E4F6DE28]];

  if (v14) {
    CFDictionarySetValue(v3, (const void *)MessageDictionaryMeCardSharingNameForkedKey, v14);
  }
  if (v16) {
    CFDictionarySetValue(v3, (const void *)MessageDictionaryMeCardSharingImageForkedKey, v16);
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = [v8 length];
      id v19 = @"YES";
      *(_DWORD *)buf = 138413570;
      uint64_t v25 = v23;
      __int16 v26 = 2112;
      if (!v18) {
        id v19 = @"NO";
      }
      uint64_t v27 = v22;
      __int16 v28 = 2112;
      id v29 = v19;
      __int16 v30 = 2112;
      id v31 = v12;
      __int16 v32 = 2112;
      uint64_t v33 = v14;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Transporting meCardSharingAudience %@ nicknameVersion %@ decryptionKey %@ nickNameID %@ nameForked %@ imageForked %@", buf, 0x3Eu);
    }
  }

  return v3;
}

- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(IMDNicknameController *)self pendingNicknameUpdates];
  int v8 = [v7 objectForKey:v6];

  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v8];
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        uint64_t v12 = v9;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Marking nickname as current %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [(IMDNicknameController *)self _markPendingNicknameAsCurrent:v9 incrementPendingNicknameVersion:1 updateType:a4 broadcastUpdates:1];
  }
}

- (void)_updateNicknameListsIfNeeded:(id)a3
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v99 = a3;
  id v4 = [v99 objectForKey:MessageDictionaryPendingNicknameUpdatesVersionKey];
  unint64_t v98 = [v4 unsignedIntegerValue];

  id v5 = [(IMDNicknameController *)self defaults];
  uint64_t v6 = *MEMORY[0x1E4F6DE48];
  uint64_t v97 = *MEMORY[0x1E4F6DE00];
  uint64_t v7 = objc_msgSend(v5, "getValueFromDomain:forKey:");
  unint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = [(IMDNicknameController *)self defaults];
  uint64_t v94 = *MEMORY[0x1E4F6DE08];
  id v10 = objc_msgSend(v9, "getValueFromDomain:forKey:", v97);
  unint64_t v11 = [v10 unsignedIntegerValue];

  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = v6;
      uint64_t v14 = [NSNumber numberWithUnsignedInteger:v98];
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:v8];
      *(_DWORD *)buf = 138412546;
      v144 = v14;
      __int16 v145 = 2112;
      v146 = v15;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "updateHandledNicknamesIfNeeded incomingPendingNicknameVersion %@ currentPendingNicknameUpdatesVersion %@", buf, 0x16u);

      uint64_t v6 = v13;
    }
  }
  if (v8 < v98 || v11 < v98)
  {
    v96 = [v99 objectForKey:MessageDictionaryPendingNicknameUpdatesHandlesKey];
    if (v96)
    {
      id v19 = [(IMDNicknameController *)self pendingNicknameUpdates];
      v104 = [v19 allKeys];

      id v20 = [v104 arrayByExcludingObjectsInArray:v96];
      if (IMOSLoggingEnabled())
      {
        id v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v144 = v104;
          __int16 v145 = 2112;
          v146 = v96;
          _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Our current pending handles %@ our incoming pending handles %@", buf, 0x16u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v144 = v20;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "We need to mark the following handles as having been updated %@", buf, 0xCu);
        }
      }
      v95 = [v20 description];
      [(IMDNicknameController *)self _showDebugAlertWithHeader:@"Peer Device Updated Handled Nicknames" message:v95];
      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      id obj = v20;
      uint64_t v23 = [obj countByEnumeratingWithState:&v130 objects:v142 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v131;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v131 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void *)(*((void *)&v130 + 1) + 8 * i);
            uint64_t v27 = [(IMDNicknameController *)self pendingNicknameUpdates];
            __int16 v28 = [v27 objectForKey:v26];

            id v29 = [v28 objectForKeyedSubscript:@"rid"];

            if (v29)
            {
              uint64_t v140 = v26;
              __int16 v30 = [v28 objectForKeyedSubscript:@"rid"];
              v141 = v30;
              id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
              [(IMDNicknameController *)self markProfileRecordsAsIgnored:v31 broadcastUpdates:0];
            }
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v130 objects:v142 count:16];
        }
        while (v23);
      }

      v103 = [(IMDNicknameController *)self defaults];
      v102 = [NSNumber numberWithUnsignedInteger:v98];
      [v103 setValue:v102 forDomain:v97 forKey:v6];
    }
    else
    {
      v104 = [v99 objectForKey:MessageDictionaryPendingNicknameUpdatesRecordIDsKey];
      id obj = [v99 objectForKey:MessageDictionaryCurrentNicknameUpdatesRecordIDsKey];
      v95 = [v99 objectForKey:MessageDictionaryArchivedNicknameUpdatesRecordIDsKey];
      if (!v104 || !obj || !v95)
      {

        goto LABEL_91;
      }
      v103 = [MEMORY[0x1E4F1CA80] set];
      long long v128 = 0u;
      long long v129 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      __int16 v32 = [(IMDNicknameController *)self archivedNicknames];
      uint64_t v33 = [v32 allValues];

      uint64_t v34 = [v33 countByEnumeratingWithState:&v126 objects:v139 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v127;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v127 != v35) {
              objc_enumerationMutation(v33);
            }
            id v37 = *(void **)(*((void *)&v126 + 1) + 8 * j);
            id v38 = [v37 objectForKeyedSubscript:@"rid"];

            if (v38)
            {
              uint64_t v39 = [v37 objectForKeyedSubscript:@"rid"];
              [v103 addObject:v39];
            }
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v126 objects:v139 count:16];
        }
        while (v34);
      }

      v102 = [MEMORY[0x1E4F1CA80] set];
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      v40 = [(IMDNicknameController *)self handledNicknames];
      v41 = [v40 allValues];

      uint64_t v42 = [v41 countByEnumeratingWithState:&v122 objects:v138 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v123;
        do
        {
          for (uint64_t k = 0; k != v42; ++k)
          {
            if (*(void *)v123 != v43) {
              objc_enumerationMutation(v41);
            }
            long long v45 = *(void **)(*((void *)&v122 + 1) + 8 * k);
            long long v46 = [v45 objectForKeyedSubscript:@"rid"];

            if (v46)
            {
              long long v47 = [v45 objectForKeyedSubscript:@"rid"];
              [v102 addObject:v47];
            }
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v122 objects:v138 count:16];
        }
        while (v42);
      }

      v101 = [MEMORY[0x1E4F1CA80] set];
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      long long v48 = [(IMDNicknameController *)self pendingNicknameUpdates];
      long long v49 = [v48 allValues];

      uint64_t v50 = [v49 countByEnumeratingWithState:&v118 objects:v137 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v119;
        do
        {
          for (uint64_t m = 0; m != v50; ++m)
          {
            if (*(void *)v119 != v51) {
              objc_enumerationMutation(v49);
            }
            long long v53 = *(void **)(*((void *)&v118 + 1) + 8 * m);
            long long v54 = [v53 objectForKeyedSubscript:@"rid"];

            if (v54)
            {
              long long v55 = [v53 objectForKeyedSubscript:@"rid"];
              [v101 addObject:v55];
            }
          }
          uint64_t v50 = [v49 countByEnumeratingWithState:&v118 objects:v137 count:16];
        }
        while (v50);
      }

      v93 = [MEMORY[0x1E4F1CAD0] setWithArray:v95];
      id v56 = (void *)[v103 mutableCopy];
      [v56 minusSet:v93];
      v91 = (void *)[v93 mutableCopy];
      [v91 minusSet:v103];
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v100 = v56;
      uint64_t v57 = [v100 countByEnumeratingWithState:&v114 objects:v136 count:16];
      if (v57)
      {
        uint64_t v58 = *(void *)v115;
        do
        {
          for (uint64_t n = 0; n != v57; ++n)
          {
            if (*(void *)v115 != v58) {
              objc_enumerationMutation(v100);
            }
            uint64_t v60 = *(void *)(*((void *)&v114 + 1) + 8 * n);
            v61 = [(IMDNicknameController *)self nicknameForRecordID:v60];
            uint64_t v62 = [v61 handle];

            if (v62)
            {
              id v63 = [(IMDNicknameController *)self archivedNicknames];
              v64 = [v61 handle];
              [v63 setValue:0 forKey:v64];

              int v65 = [v61 handle];
              [(IMDNicknameController *)self _deleteHandleIDFromArchivedMap:v65];

              v66 = [(IMDNicknameController *)self activeRecords];
              v67 = [v61 handle];
              v68 = [v66 objectForKey:v67];
              char v69 = [v68 isEqualToString:v60];

              if ((v69 & 1) == 0) {
                [(IMDNicknameController *)self _deleteOnDiskDataIfNeededForNickname:v61 withNewNickname:0];
              }
            }
          }
          uint64_t v57 = [v100 countByEnumeratingWithState:&v114 objects:v136 count:16];
        }
        while (v57);
      }

      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v70 = v91;
      uint64_t v71 = [v70 countByEnumeratingWithState:&v110 objects:v135 count:16];
      if (v71)
      {
        uint64_t v72 = *(void *)v111;
        do
        {
          for (iuint64_t i = 0; ii != v71; ++ii)
          {
            if (*(void *)v111 != v72) {
              objc_enumerationMutation(v70);
            }
            v74 = [(IMDNicknameController *)self nicknameForRecordID:*(void *)(*((void *)&v110 + 1) + 8 * ii)];
            id v75 = [v74 handle];

            if (v75)
            {
              [(IMDNicknameController *)self _markCurrentNicknameAsArchived:v74 incrementPendingNicknameVersion:0];
              id v76 = [(IMDNicknameController *)self handledNicknames];
              id v77 = [v74 handle];
              [v76 setValue:0 forKey:v77];

              id v78 = [v74 handle];
              [(IMDNicknameController *)self _deleteHandleIDFromHandledMap:v78];
            }
          }
          uint64_t v71 = [v70 countByEnumeratingWithState:&v110 objects:v135 count:16];
        }
        while (v71);
      }

      v92 = [MEMORY[0x1E4F1CAD0] setWithArray:obj];
      v90 = (void *)[v102 mutableCopy];
      [v90 minusSet:v92];
      id v79 = (void *)[v92 mutableCopy];
      [v79 minusSet:v102];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v80 = v79;
      uint64_t v81 = [v80 countByEnumeratingWithState:&v106 objects:v134 count:16];
      if (v81)
      {
        uint64_t v82 = *(void *)v107;
        v83 = (uint64_t *)MEMORY[0x1E4F6DDE0];
        do
        {
          for (juint64_t j = 0; jj != v81; ++jj)
          {
            if (*(void *)v107 != v82) {
              objc_enumerationMutation(v80);
            }
            uint64_t v85 = *(void *)(*((void *)&v106 + 1) + 8 * jj);
            __int16 v86 = [(IMDNicknameController *)self nicknameForRecordID:v85];
            if ([v104 containsObject:v85]) {
              uint64_t v87 = 12;
            }
            else {
              uint64_t v87 = *v83;
            }
            [(IMDNicknameController *)self _markPendingNicknameAsCurrent:v86 incrementPendingNicknameVersion:0 updateType:v87 broadcastUpdates:0];
          }
          uint64_t v81 = [v80 countByEnumeratingWithState:&v106 objects:v134 count:16];
        }
        while (v81);
      }

      [(IMDNicknameController *)self _broadcastNicknamesMapChanged];
      id v88 = [(IMDNicknameController *)self defaults];
      v89 = [NSNumber numberWithUnsignedInteger:v98];
      [v88 setValue:v89 forDomain:v97 forKey:v94];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      BOOL v17 = [NSNumber numberWithUnsignedInteger:v98];
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:v8];
      *(_DWORD *)buf = 138412546;
      v144 = v17;
      __int16 v145 = 2112;
      v146 = v18;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Received older version number (%@, old: %@), dropping pending nickname update", buf, 0x16u);
    }
  }
LABEL_91:
}

- (void)_showDebugAlertWithHeader:(id)a3 message:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (__CFString *)a3;
  uint64_t v6 = (__CFString *)a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Alert header: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    unint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Alert message: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (IMEnableNicknamesDebug()) {
    CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, v5, v6, @"OK");
  }
}

- (void)_updateCloudKitRecordIDAndDecryptionKeyIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:MessageDictionaryPersonalNicknameDecryptKeyKey];
  uint64_t v6 = [v4 objectForKeyedSubscript:MessageDictionaryNicknameWallpaperTagKey];
  uint64_t v7 = [v4 objectForKeyedSubscript:MessageDictionaryNicknameLowResWallpaperTagKey];
  unint64_t v8 = [v4 objectForKeyedSubscript:MessageDictionaryNicknameWallpaperMetadataTagKey];
  int v9 = [v4 objectForKeyedSubscript:MessageDictionaryPersonalNicknameRecordIDKey];
  locatiouint64_t n = 0;
  objc_initWeak(&location, self);
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1D97664D0;
    v10[3] = &unk_1E6B75F00;
    objc_copyWeak(&v16, &location);
    id v11 = v9;
    id v12 = v5;
    id v13 = v6;
    id v14 = v7;
    id v15 = v8;
    [(IMDNicknameController *)self currentPersonalNicknameWithRecordID:v11 decryptionKey:v12 wallpaperDataTag:v13 wallpaperLowResDataTag:v14 wallpaperMetadataTag:v15 completionBlock:v10];

    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);
}

- (void)_updateHandleDenyAllowListIfNeeded:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:MessageDictionaryNicknameDenyAllowListVersionKey];
  unint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [(IMDNicknameController *)self defaults];
  uint64_t v8 = *MEMORY[0x1E4F6DE00];
  uint64_t v9 = *MEMORY[0x1E4F6DDF8];
  id v10 = [v7 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DDF8]];
  unint64_t v11 = [v10 unsignedIntegerValue];

  if (v11 >= v6)
  {
    if (IMOSLoggingEnabled())
    {
      v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v46 = v6;
        __int16 v47 = 2048;
        unint64_t v48 = v11;
        _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "Received older version number (%lu, old: %lu), dropping deny/allow list update", buf, 0x16u);
      }
    }
  }
  else
  {
    long long v44 = [v4 objectForKeyedSubscript:MessageDictionaryNicknameDenyListKey];
    uint64_t v43 = [v4 objectForKeyedSubscript:MessageDictionaryNicknameAllowListKey];
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v46 = v6;
        __int16 v47 = 2048;
        unint64_t v48 = v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Received newer version number (%lu, old: %lu), updating the deny/allow list store", buf, 0x16u);
      }
    }
    if (IMEnableNicknamesDebug())
    {
      id v13 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F3398578];
      id v14 = [(IMDNicknameController *)self handleDenyList];
      id v15 = [v14 allObjects];
      uint64_t v42 = [v44 arrayByExcludingObjectsInArray:v15];

      id v16 = [(IMDNicknameController *)self handleDenyList];
      BOOL v17 = [v16 allObjects];
      v41 = [v17 arrayByExcludingObjectsInArray:v44];

      uint64_t v18 = [(IMDNicknameController *)self handleAllowList];
      id v19 = [v18 allObjects];
      id v20 = [v43 arrayByExcludingObjectsInArray:v19];

      id v21 = [(IMDNicknameController *)self handleAllowList];
      id v22 = [v21 allObjects];
      uint64_t v23 = [v22 arrayByExcludingObjectsInArray:v43];

      if ([v42 count])
      {
        uint64_t v24 = [NSString stringWithFormat:@"Deny list added: %@\n", v42];
        [v13 appendString:v24];
      }
      if ([v41 count])
      {
        if ([v13 length]) {
          [v13 appendString:@"\n"];
        }
        uint64_t v25 = [NSString stringWithFormat:@"Deny list removed: %@", v41];
        [v13 appendString:v25];
      }
      if ([v20 count])
      {
        if ([v13 length]) {
          [v13 appendString:@"\n"];
        }
        uint64_t v26 = [NSString stringWithFormat:@"Allow list added: %@", v20];
        [v13 appendString:v26];
      }
      if ([v23 count])
      {
        if ([v13 length]) {
          [v13 appendString:@"\n"];
        }
        uint64_t v27 = [NSString stringWithFormat:@"Allow list removed: %@", v23];
        [v13 appendString:v27];
      }
      if ([v13 length])
      {
        __int16 v28 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F3398578];
        if ([v42 count] || objc_msgSend(v41, "count")) {
          [v28 appendString:@"Deny list"];
        }
        if ([v20 count] || objc_msgSend(v23, "count"))
        {
          if ([v28 length]) {
            [v28 appendString:@" and "];
          }
          [v28 appendString:@"Allow list"];
        }
        [v28 appendString:@" Updated from Peer Device"];
        [(IMDNicknameController *)self _showDebugAlertWithHeader:v28 message:v13];
      }
    }
    [(IMDNicknameController *)self _clearSharingLists];
    id v29 = [(IMDNicknameController *)self handleDenyList];
    __int16 v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v44];
    [(IMDNicknameController *)self _updateHandleList:v29 withHandles:v30 forKey:@"handleBlacklist" broadcastUpdates:0];

    id v31 = [(IMDNicknameController *)self handleAllowList];
    __int16 v32 = [MEMORY[0x1E4F1CAD0] setWithArray:v43];
    [(IMDNicknameController *)self _updateHandleList:v31 withHandles:v32 forKey:@"handleWhitelist" broadcastUpdates:0];

    if (IMOSLoggingEnabled())
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Broadcasting changes to the deny and allow list", buf, 2u);
      }
    }
    uint64_t v34 = +[IMDBroadcastController sharedProvider];
    uint64_t v35 = [v34 broadcasterForAccountListeners];
    uint64_t v36 = [(IMDNicknameController *)self allowListedHandlesForSharing];
    id v37 = [(IMDNicknameController *)self denyListedHandlesForSharing];
    [v35 updateNicknameHandlesForSharing:v36 blocked:v37];

    id v38 = [(IMDNicknameController *)self defaults];
    uint64_t v39 = [NSNumber numberWithUnsignedInteger:v6];
    [v38 setValue:v39 forDomain:v8 forKey:v9];
  }
}

- (void)_updateHandleTransitionedListIfNeeded:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:MessageDictionaryNicknameTransitionedListVersionKey];
  unint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [(IMDNicknameController *)self defaults];
  uint64_t v8 = *MEMORY[0x1E4F6DE00];
  uint64_t v9 = *MEMORY[0x1E4F6DE70];
  id v10 = [v7 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE70]];
  unint64_t v11 = [v10 unsignedIntegerValue];

  id v12 = [v4 objectForKeyedSubscript:MessageDictionaryNicknameTransitionedListKey];
  if (v11 >= v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = 134218240;
        unint64_t v20 = v6;
        __int16 v21 = 2048;
        unint64_t v22 = v11;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Received older version number (%lu, old: %lu), dropping transitioned list update", (uint8_t *)&v19, 0x16u);
      }
    }
  }
  else
  {
    [(IMDNicknameController *)self _clearTransitionedList];
    id v13 = [(IMDNicknameController *)self handleTransitionedList];
    id v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
    [(IMDNicknameController *)self _updateTransitionList:v13 withHandles:v14 forKey:@"handleTransitionedList" broadcastUpdates:0];

    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Broadcasting changes to the transitioned list", (uint8_t *)&v19, 2u);
      }
    }
    [(IMDNicknameController *)self broadcastTransitionedHandlesDidChange];
    id v16 = [(IMDNicknameController *)self defaults];
    BOOL v17 = [NSNumber numberWithUnsignedInteger:v6];
    [v16 setValue:v17 forDomain:v8 forKey:v9];
  }
}

- (void)_updateActiveNicknameRecordsListIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:MessageDictionaryNicknameActiveListVersionKey];
  unint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [(IMDNicknameController *)self defaults];
  uint64_t v8 = *MEMORY[0x1E4F6DE00];
  uint64_t v9 = *MEMORY[0x1E4F6DDF0];
  id v10 = [v7 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DDF0]];
  unint64_t v11 = [v10 unsignedIntegerValue];

  id v12 = [v4 objectForKeyedSubscript:MessageDictionaryNicknameActiveListKey];
  if (v11 >= v6)
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = 134218240;
        unint64_t v22 = v6;
        __int16 v23 = 2048;
        unint64_t v24 = v11;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Received older version number (%lu, old: %lu), dropping active list update", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    [(IMDNicknameController *)self _clearActiveNicknameRecords];
    id v13 = [(IMDNicknameController *)self activeNicknameRecords];
    [(IMDNicknameController *)self _updateActiveList:v13 withRecords:v12 broadcastUpdates:0];

    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Broadcasting changes to the active list", (uint8_t *)&v21, 2u);
      }
    }
    id v15 = +[IMDBroadcastController sharedProvider];
    id v16 = [v15 broadcasterForAccountListeners];
    BOOL v17 = [(IMDNicknameController *)self activeRecords];
    [v16 updateActiveNicknameRecords:v17];

    uint64_t v18 = [(IMDNicknameController *)self defaults];
    int v19 = [NSNumber numberWithUnsignedInteger:v6];
    [v18 setValue:v19 forDomain:v8 forKey:v9];
  }
}

- (void)_updateIgnoredNicknameRecordsListIfNeeded:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:MessageDictionaryNicknameIgnoredListVersionKey];
  unint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [(IMDNicknameController *)self defaults];
  uint64_t v8 = *MEMORY[0x1E4F6DE00];
  uint64_t v9 = *MEMORY[0x1E4F6DE10];
  id v10 = [v7 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE10]];
  unint64_t v11 = [v10 unsignedIntegerValue];

  id v12 = [v4 objectForKeyedSubscript:MessageDictionaryNicknameIgnoredListKey];
  if (v11 >= v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v26 = 134218240;
        unint64_t v27 = v6;
        __int16 v28 = 2048;
        unint64_t v29 = v11;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Received older version number (%lu, old: %lu), dropping ignored list update", (uint8_t *)&v26, 0x16u);
      }
    }
  }
  else
  {
    id v13 = [(IMDNicknameController *)self ignoredNicknameRecords];
    int v14 = [v13 isEqualToDictionary:v12];

    if (v14)
    {
      if (IMOSLoggingEnabled())
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Received identical ignoredList. Ignoring.", (uint8_t *)&v26, 2u);
        }
      }
      id v16 = [(IMDNicknameController *)self defaults];
      BOOL v17 = [NSNumber numberWithUnsignedInteger:v6];
      [v16 setValue:v17 forDomain:v8 forKey:v9];
    }
    else
    {
      [(IMDNicknameController *)self _clearIgnoredNicknameRecords];
      int v19 = [(IMDNicknameController *)self ignoredNicknameRecords];
      [(IMDNicknameController *)self _updateIgnoredList:v19 withRecords:v12 broadcastUpdates:0];

      if (IMOSLoggingEnabled())
      {
        unint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Broadcasting changes to the ignored list", (uint8_t *)&v26, 2u);
        }
      }
      int v21 = +[IMDBroadcastController sharedProvider];
      unint64_t v22 = [v21 broadcasterForAccountListeners];
      __int16 v23 = [(IMDNicknameController *)self ignoredRecords];
      [v22 updateIgnoredNicknameRecords:v23];

      unint64_t v24 = [(IMDNicknameController *)self defaults];
      uint64_t v25 = [NSNumber numberWithUnsignedInteger:v6];
      [v24 setValue:v25 forDomain:v8 forKey:v9];
    }
  }
}

- (id)_diffActiveRecords:(id)a3 againstPrevious:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v5;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Checking new active list: %@, against previous active list: %@", buf, 0x16u);
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        int v14 = objc_msgSend(v9, "objectForKeyedSubscript:", v13, (void)v19);
        id v15 = [v6 objectForKeyedSubscript:v13];
        if (!v15 || ([v14 isEqualToString:v15] & 1) == 0) {
          [v8 setObject:v14 forKeyedSubscript:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v8;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Sending active records diff: %@", buf, 0xCu);
    }
  }
  BOOL v17 = objc_msgSend(v8, "copy", (void)v19);

  return v17;
}

- (void)_updateDenyAllowListHandlesVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self defaults];
  uint64_t v4 = *MEMORY[0x1E4F6DE00];
  uint64_t v5 = *MEMORY[0x1E4F6DDF8];
  id v6 = [v3 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DDF8]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [(IMDNicknameController *)self defaults];
  uint64_t v9 = v7 + 1;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7 + 1];
  [v8 setValue:v10 forDomain:v4 forKey:v5];

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [NSNumber numberWithUnsignedInteger:v9];
      int v13 = 138412290;
      int v14 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Updated allow list handles version to %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_updateTransitionedListHandlesVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self defaults];
  uint64_t v4 = *MEMORY[0x1E4F6DE00];
  uint64_t v5 = *MEMORY[0x1E4F6DE70];
  id v6 = [v3 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE70]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [(IMDNicknameController *)self defaults];
  uint64_t v9 = v7 + 1;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7 + 1];
  [v8 setValue:v10 forDomain:v4 forKey:v5];

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [NSNumber numberWithUnsignedInteger:v9];
      int v13 = 138412290;
      int v14 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Updated transitioned list handles version to %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_updateIsActiveListHandlesVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self defaults];
  uint64_t v4 = *MEMORY[0x1E4F6DE00];
  uint64_t v5 = *MEMORY[0x1E4F6DDF0];
  id v6 = [v3 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DDF0]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [(IMDNicknameController *)self defaults];
  uint64_t v9 = v7 + 1;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7 + 1];
  [v8 setValue:v10 forDomain:v4 forKey:v5];

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [NSNumber numberWithUnsignedInteger:v9];
      int v13 = 138412290;
      int v14 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Updated active list handles version to %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_updateIsIgnoredListHandlesVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self defaults];
  uint64_t v4 = *MEMORY[0x1E4F6DE00];
  uint64_t v5 = *MEMORY[0x1E4F6DE10];
  id v6 = [v3 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE10]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [(IMDNicknameController *)self defaults];
  uint64_t v9 = v7 + 1;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7 + 1];
  [v8 setValue:v10 forDomain:v4 forKey:v5];

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [NSNumber numberWithUnsignedInteger:v9];
      int v13 = 138412290;
      int v14 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Updated ignored list handles version to %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_syncHandleAllowDenyListToOtherDevices
{
  v13[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self handleAllowList];
  uint64_t v4 = [v3 allObjects];

  uint64_t v5 = [(IMDNicknameController *)self handleDenyList];
  id v6 = [v5 allObjects];

  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C978] array];
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_3;
  }
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = [(IMDNicknameController *)self defaults];
  uint64_t v8 = [v7 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DDF8]];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v12[0] = MessageDictionaryNicknameDenyListKey;
  v12[1] = MessageDictionaryNicknameAllowListKey;
  v13[0] = v6;
  v13[1] = v4;
  v12[2] = MessageDictionaryNicknameDenyAllowListVersionKey;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v9];
  v13[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  [(IMDNicknameController *)self _sendMessageDictionary:v11 toDevice:0];
}

- (void)_syncHandleTransitionedListToOtherDevices
{
  v11[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self handleTransitionedList];
  uint64_t v4 = [v3 allObjects];

  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C978] array];
  }
  uint64_t v5 = [(IMDNicknameController *)self defaults];
  id v6 = [v5 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE70]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  v10[0] = MessageDictionaryNicknameTransitionedListKey;
  v10[1] = MessageDictionaryNicknameTransitionedListVersionKey;
  v11[0] = v4;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
  v11[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(IMDNicknameController *)self _sendMessageDictionary:v9 toDevice:0];
}

- (void)_syncActiveNicknameRecordsToOtherDevices
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self activeNicknameRecords];
  if (!v3)
  {
    BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  uint64_t v4 = [(IMDNicknameController *)self defaults];
  uint64_t v5 = [v4 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DDF0]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v9[0] = MessageDictionaryNicknameActiveListKey;
  v9[1] = MessageDictionaryNicknameActiveListVersionKey;
  v10[0] = v3;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v6];
  v10[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  [(IMDNicknameController *)self _sendMessageDictionary:v8 toDevice:0];
}

- (void)_syncIgnoredNicknameRecordsToOtherDevices
{
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDNicknameController *)self ignoredNicknameRecords];
  if (!v3)
  {
    BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  uint64_t v4 = [(IMDNicknameController *)self defaults];
  uint64_t v5 = [v4 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE10]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  v12[0] = MessageDictionaryNicknameIgnoredListKey;
  v12[1] = MessageDictionaryNicknameIgnoredListVersionKey;
  v13[0] = v3;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v6];
  v13[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Sending ignored list to peer devices, with current version: %lu", (uint8_t *)&v10, 0xCu);
    }
  }
  [(IMDNicknameController *)self _sendMessageDictionary:v8 toDevice:0];
}

- (BOOL)_requestingToSendLocalNicknameInfo:(id)a3
{
  BOOL v3 = [a3 objectForKey:MessageDictionaryNicknameRequestPersonalNicknameInfoKey];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)handleNicknameUpdatesFromPeerDevice:(id)a3 fromPeerDevice:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    uint64_t v8 = [v6 description];
    [(IMDNicknameController *)self _showDebugAlertWithHeader:@"Nickname Updates from Peer Device" message:v8];

    if ([(IMDNicknameController *)self _requestingToSendLocalNicknameInfo:v6])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          id v12 = v7;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "We got a request to send nickname info to a specific device %@", (uint8_t *)&v11, 0xCu);
        }
      }
      [(IMDNicknameController *)self sendPersonalNicknameRecordIDAndVersionRequestedByDevice:v7];
    }
    else
    {
      [(IMDNicknameController *)self _updateSharingPreferencesIfNeededFromMadridMessage:v6];
      [(IMDNicknameController *)self _updateCloudKitRecordIDAndDecryptionKeyIfNeeded:v6];
      [(IMDNicknameController *)self _updateNicknameListsIfNeeded:v6];
      [(IMDNicknameController *)self _updateHandleDenyAllowListIfNeeded:v6];
      [(IMDNicknameController *)self _updateHandleTransitionedListIfNeeded:v6];
      [(IMDNicknameController *)self _updateActiveNicknameRecordsListIfNeeded:v6];
      [(IMDNicknameController *)self _updateIgnoredNicknameRecordsListIfNeeded:v6];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Nickname feature is disabled, ignoring updates from peer device", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)_updateNameOnlyUpdateForMessage:(id)a3 fromHandleID:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315650;
      id v27 = "-[IMDNicknameController _updateNameOnlyUpdateForMessage:fromHandleID:]";
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "%s fromHandleID: %@, message: %@", (uint8_t *)&v26, 0x20u);
    }
  }
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    uint64_t v9 = [v6 objectForKey:@"FirstName"];
    uint64_t v10 = [v6 objectForKey:@"LastName"];
    if (v9 | v10)
    {
      int v11 = [(IMDNicknameController *)self pendingNicknameUpdates];
      id v12 = [v11 objectForKey:v7];

      uint64_t v13 = [(IMDNicknameController *)self handledNicknames];
      int v14 = [v13 objectForKey:v7];

      uint64_t v15 = v12;
      if ((v12 || (uint64_t v15 = v14) != 0)
        && (id v16 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v15],
            (BOOL v17 = v16) != 0))
      {
        [v16 setFirstName:v9];
        [v17 setLastName:v10];
        int v18 = IMOSLoggingEnabled();
        if (v12)
        {
          if (v18)
          {
            long long v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              LOWORD(v26) = 0;
              _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Found an existing nickname, updating name", (uint8_t *)&v26, 2u);
            }
          }
          [(IMDNicknameController *)self _deleteHandleIDFromPendingMap:v7];
        }
        else if (v18)
        {
          id v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Found a handled nickname, updating name", (uint8_t *)&v26, 2u);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          long long v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            LOWORD(v26) = 0;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "No nickname exist, creating a pending one", (uint8_t *)&v26, 2u);
          }
        }
        BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithFirstName:v9 lastName:v10 avatar:0 pronouns:0];
      }
      pendingNicknameUpdates = self->_pendingNicknameUpdates;
      __int16 v23 = [v17 persistedDictionaryRepresentation];
      [(NSMutableDictionary *)pendingNicknameUpdates setObject:v23 forKey:v7];

      unint64_t v24 = [(IMDNicknameController *)self pendingNicknameUpdatesKVStore];
      [(IMDNicknameController *)self _writeNicknameToKVStore:v24 nickname:v17];

      [(IMDNicknameController *)self _updatePendingNicknameVersion];
      [(IMDNicknameController *)self _broadcastNicknamesMapChanged];
    }
    else
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1D9901DB0();
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Nickname feature is disabled, ignoring updates from peer device", (uint8_t *)&v26, 2u);
    }
  }
}

- (void)sendPendingNicknameUpdatesDidChange
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(IMDNicknameController *)self _updateMessageDictionaryWithPendingNicknameUpdates:v4];
  [(IMDNicknameController *)self _updateMessageDictionaryWithNicknameUpdateRecordIDs:v3];
  [(IMDNicknameController *)self _sendMessageDictionary:v4 toDevice:0 sendType:1];
  [(IMDNicknameController *)self _sendMessageDictionary:v3 toDevice:0 sendType:2];
}

- (BOOL)_isNicknamesSharingEnabled
{
  id v3 = [(IMDNicknameController *)self defaults];
  id v4 = [v3 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE20]];
  if ([v4 BOOLValue]) {
    BOOL v5 = [(IMDNicknameController *)self _nicknameFeatureEnabled];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)sendNicknamePreferencesDidChange
{
  if ([(IMDNicknameController *)self _isNicknamesSharingEnabled])
  {
    id v3 = [(IMDNicknameController *)self nickNameRecordID];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Nicknames enabled, and we already have one in cloudkit. Broadcasting to my other devices.", v9, 2u);
        }
      }
      [(IMDNicknameController *)self sendPersonalNicknameRecordIDAndVersionToAllPeers];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Nicknames not enabled, deleting the one we know about.", buf, 2u);
      }
    }
    id v7 = [(IMDNicknameController *)self storedPersonalNickname];
    if (v7)
    {
      [(IMDNicknameController *)self deleteAllPersonalNicknames:1 withCompletion:0];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "No nickname stored locally. Not querying CK.", v10, 2u);
      }
    }
  }
}

- (void)sendPersonalNicknameRecordIDAndVersionRequestedByDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDNicknameController *)self messageDictionaryWithPersonalRecordIDAndVersion];
  [(IMDNicknameController *)self _sendMessageDictionary:v5 toDevice:v4];
}

- (void)sendPersonalNicknameRecordIDAndVersionToAllPeers
{
  id v3 = [(IMDNicknameController *)self messageDictionaryWithPersonalRecordIDAndVersion];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "We should send personal nickname info to all of our own devices", v5, 2u);
    }
  }
  [(IMDNicknameController *)self _sendMessageDictionary:v3 toDevice:0];
}

- (BOOL)_sendMessageDictionary:(id)a3 toDevice:(id)a4
{
  return [(IMDNicknameController *)self _sendMessageDictionary:a3 toDevice:a4 sendType:3];
}

- (BOOL)_sendMessageDictionary:(id)a3 toDevice:(id)a4 sendType:(unint64_t)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v88 = v7;
      __int16 v89 = 2048;
      unint64_t v90 = a5;
      __int16 v91 = 2112;
      id v92 = v60;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Asked to send dictionary to device: %@, send type: %lu, dict: %@", buf, 0x20u);
    }
  }
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    if (v60)
    {
      uint64_t v9 = [(IDSService *)self->_nicknameService devices];
      uint64_t v10 = v9;
      if (v7)
      {
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v11 = v9;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v76 objects:v86 count:16];
        if (!v12)
        {
LABEL_16:

LABEL_28:
          LOBYTE(v21) = 0;
          if ((a5 & 1) == 0) {
            goto LABEL_96;
          }
          goto LABEL_57;
        }
        uint64_t v13 = *(void *)v77;
LABEL_10:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v77 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v76 + 1) + 8 * v14);
          uint64_t v75 = 0;
          id v16 = (id)IDSCopyTokenAndIDForTokenWithID();
          id v17 = 0;
          int v18 = [v15 pushToken];
          char v19 = [v18 isEqualToData:v17];

          if (v19) {
            break;
          }

          if (v12 == ++v14)
          {
            uint64_t v12 = [v11 countByEnumeratingWithState:&v76 objects:v86 count:16];
            if (v12) {
              goto LABEL_10;
            }
            goto LABEL_16;
          }
        }
        uint64_t v85 = v15;
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];

        if ((a5 & 2) == 0)
        {
          id v11 = v10;
          goto LABEL_28;
        }
        int v22 = 0;
      }
      else
      {
        int v22 = a5 & 1;
        if ((a5 & 2) == 0) {
          goto LABEL_51;
        }
      }
      if ([v10 count])
      {
        __int16 v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v60];
        [v23 setObject:@"NicknamesDidUpdate" forKey:@"MessageType"];
        v83[0] = *MEMORY[0x1E4F6AA10];
        unint64_t v24 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
        v83[1] = *MEMORY[0x1E4F6A960];
        v84[0] = v24;
        v84[1] = MEMORY[0x1E4F1CC38];
        id v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];

        id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v11 = v10;
        uint64_t v26 = [v11 countByEnumeratingWithState:&v71 objects:v82 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v72 != v27) {
                objc_enumerationMutation(v11);
              }
              id v29 = (void *)IDSCopyIDForDevice();
              if (v29) {
                [v25 addObject:v29];
              }
            }
            uint64_t v26 = [v11 countByEnumeratingWithState:&v71 objects:v82 count:16];
          }
          while (v26);
        }

        nicknameService = self->_nicknameService;
        id v69 = 0;
        id v70 = 0;
        int v21 = [MEMORY[0x1E4F6E7C0] service:nicknameService sendMessage:v23 toDestinations:v25 priority:300 options:v56 identifier:&v70 error:&v69];
        id v31 = v70;
        id v32 = v69;
        if (v32) {
          int v33 = 0;
        }
        else {
          int v33 = v21;
        }
        if (v33 == 1)
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_56;
          }
          uint64_t v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v88 = v31;
            __int16 v89 = 2112;
            unint64_t v90 = (unint64_t)v25;
            _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Successfully sent nickname to message (%@) to destinations %@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v34 = IMLogHandleForCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_1D9901DE4();
          }
        }

LABEL_56:
        if (v22)
        {
LABEL_57:
          id v35 = objc_alloc(MEMORY[0x1E4F6AB90]);
          uint64_t v36 = (void *)[v35 initWithService:*MEMORY[0x1E4F6AA78]];
          long long v55 = [v36 devices];

          id v37 = +[IMDAccountController sharedAccountController];
          uint64_t v57 = [v37 anySessionForServiceName:*MEMORY[0x1E4F6E1B0]];

          if (v57 && [v60 count])
          {
            uint64_t v59 = [MEMORY[0x1E4F1CA48] array];
            id v38 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
            uint64_t v39 = [MEMORY[0x1E4F1CA80] set];
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            id v40 = v38;
            uint64_t v41 = [v40 countByEnumeratingWithState:&v65 objects:v81 count:16];
            if (v41)
            {
              uint64_t v42 = *(void *)v66;
              do
              {
                for (uint64_t j = 0; j != v41; ++j)
                {
                  if (*(void *)v66 != v42) {
                    objc_enumerationMutation(v40);
                  }
                  long long v44 = (void *)IDSCopyIDForDevice();
                  if (v44) {
                    [v39 addObject:v44];
                  }
                }
                uint64_t v41 = [v40 countByEnumeratingWithState:&v65 objects:v81 count:16];
              }
              while (v41);
            }

            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v45 = v55;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v61 objects:v80 count:16];
            if (v46)
            {
              uint64_t v47 = *(void *)v62;
              do
              {
                for (uint64_t k = 0; k != v46; ++k)
                {
                  if (*(void *)v62 != v47) {
                    objc_enumerationMutation(v45);
                  }
                  uint64_t v49 = (void *)IDSCopyIDForDevice();
                  char v50 = [v39 containsObject:v49];
                  if (v49) {
                    char v51 = v50;
                  }
                  else {
                    char v51 = 1;
                  }
                  if ((v51 & 1) == 0)
                  {
                    if (v7)
                    {
                      if ([v49 isEqualToString:v7])
                      {
                        [v59 addObject:v49];

                        goto LABEL_88;
                      }
                    }
                    else
                    {
                      [v59 addObject:v49];
                    }
                  }
                }
                uint64_t v46 = [v45 countByEnumeratingWithState:&v61 objects:v80 count:16];
              }
              while (v46);
            }
LABEL_88:

            if ([v59 count])
            {
              if (IMOSLoggingEnabled())
              {
                long long v53 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v88 = v59;
                  _os_log_impl(&dword_1D967A000, v53, OS_LOG_TYPE_INFO, "Sending nickname info to destinations %@", buf, 0xCu);
                }
              }
              LOBYTE(v21) = [v57 sendNicknameUpdatesToPeerDevices:v60 toDestinations:v59];
            }
          }
          else if (IMOSLoggingEnabled())
          {
            long long v52 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v88 = v57;
              __int16 v89 = 2112;
              unint64_t v90 = (unint64_t)v60;
              _os_log_impl(&dword_1D967A000, v52, OS_LOG_TYPE_INFO, "We could not find a service session for imessage to send the nickname info or no contents in message dictionary %@ %@", buf, 0x16u);
            }
          }
        }
LABEL_96:

        goto LABEL_97;
      }
LABEL_51:
      LOBYTE(v21) = 0;
      id v11 = v10;
      if (v22) {
        goto LABEL_57;
      }
      goto LABEL_96;
    }
    if (IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Was asked to send a nil dictionary, bailing", buf, 2u);
      }
LABEL_24:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not sending updates to peers", buf, 2u);
    }
    goto LABEL_24;
  }
  LOBYTE(v21) = 0;
LABEL_97:

  return v21;
}

- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v30 = a4;
  LOBYTE(a4) = [(IMDNicknameController *)self _nicknameFeatureEnabled];
  int v6 = IMOSLoggingEnabled();
  if (a4)
  {
    id v29 = self;
    if (v6)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v46 = v31;
        __int16 v47 = 2112;
        id v48 = v30;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Sending name only to: %@ from: %@", buf, 0x16u);
      }
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v9 = v31;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = [[IMDHandle alloc] initWithID:*(void *)(*((void *)&v39 + 1) + 8 * i) unformattedID:*(void *)(*((void *)&v39 + 1) + 8 * i) countryCode:0];
          [v8 addObject:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v10);
    }

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v15);
          }
          char v19 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          long long v20 = [v19 ID];
          int v21 = [v20 _appearsToBePhoneNumber];

          int v22 = [v19 ID];
          __int16 v23 = v22;
          if (v21)
          {
            unint64_t v24 = (void *)IDSCopyIDForPhoneNumber();
            [v14 setObject:v19 forKey:v24];
          }
          else
          {
            int v25 = [v22 _appearsToBeEmail];

            if (v25)
            {
              __int16 v23 = [v19 ID];
              uint64_t v26 = (void *)MEMORY[0x1E01687E0]();
              [v14 setObject:v19 forKey:v26];
            }
            else
            {
              __int16 v23 = IMLogHandleForCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                sub_1D9901E4C(buf, v19, &v46, v23);
              }
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v16);
    }

    uint64_t v27 = [v14 allKeys];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1D9769E3C;
    v32[3] = &unk_1E6B75F28;
    id v33 = v30;
    uint64_t v34 = v29;
    [(IMDNicknameController *)v29 _getDevicesForBothNicknameServices:v27 removeNewServiceURIsFromIMessageList:0 completionHandler:v32];
  }
  else if (v6)
  {
    __int16 v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not sending personal nickname to chat", buf, 2u);
    }
  }
}

- (void)queueChatToSendNicknamePostUploadIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMDNicknameController *)self nicknameIsUploadingToCK])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = [v4 guid];
        int v11 = 138412290;
        uint64_t v12 = v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "We are still uploading the nickname to iCloud, queue to send info out of band for chat %@", (uint8_t *)&v11, 0xCu);
      }
    }
    if (!self->_chatsToSendNicknameInfoTo)
    {
      id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      chatsToSendNicknameInfoTo = self->_chatsToSendNicknameInfoTo;
      self->_chatsToSendNicknameInfoTo = v7;
    }
    id v9 = [(IMDNicknameController *)self chatsToSendNicknameInfoTo];
    uint64_t v10 = [v4 guid];
    [v9 addObject:v10];
  }
}

- (void)_getDevicesForBothNicknameServices:(id)a3 removeNewServiceURIsFromIMessageList:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void))a5;
  if (![v7 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        int v18 = "-[IMDNicknameController _getDevicesForBothNicknameServices:removeNewServiceURIsFromIMessageList:completionHandler:]";
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "idsHandles were nil or empty returning from %s", buf, 0xCu);
      }
    }
    v8[2](v8, 0);
  }
  uint64_t v10 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D976A574;
  block[3] = &unk_1E6B75F50;
  BOOL v16 = a4;
  id v14 = v7;
  id v15 = v8;
  int v11 = v8;
  id v12 = v7;
  dispatch_async(v10, block);
}

- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5
{
}

- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5 onlyUseNicknameSendingService:(BOOL)a6
{
}

- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5 onlySendToThoseLoggedOutOfIMessage:(BOOL)a6
{
}

- (void)sendPersonalNicknameToRecipients:(id)a3 chatGUID:(id)a4 fromHandle:(id)a5 onlyUseNicknameSendingService:(BOOL)a6 onlySendToThoseLoggedOutOfIMessage:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v32 = a4;
  id v12 = a5;
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    id v31 = [(IMDNicknameController *)self newNicknameInfoToSend];
    if (v31)
    {
      BOOL v29 = v7;
      BOOL v30 = a6;
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v47 = v33;
          __int16 v48 = 2112;
          id v49 = v32;
          __int16 v50 = 2112;
          id v51 = v12;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Attempting to send nickname to recipients: %@ on chat %@ from handle: %@", buf, 0x20u);
        }
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v15 = v33;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (v19)
            {
              long long v20 = [*(id *)(*((void *)&v41 + 1) + 8 * i) ID];
              int v21 = [v20 _appearsToBePhoneNumber];

              int v22 = [v19 ID];
              __int16 v23 = v22;
              if (v21)
              {
                unint64_t v24 = (void *)IDSCopyIDForPhoneNumber();
              }
              else
              {
                int v25 = [v22 _appearsToBeEmail];

                if (!v25) {
                  continue;
                }
                uint64_t v26 = [v19 ID];
                unint64_t v24 = (void *)MEMORY[0x1E01687E0]();
              }
              if (v24) {
                [v14 setObject:v19 forKey:v24];
              }
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v16);
      }

      uint64_t v27 = [v14 allKeys];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = sub_1D976B0F0;
      v34[3] = &unk_1E6B75F78;
      id v35 = v12;
      BOOL v39 = v29;
      id v36 = v32;
      id v37 = v31;
      long long v38 = self;
      BOOL v40 = v30;
      [(IMDNicknameController *)self _getDevicesForBothNicknameServices:v27 removeNewServiceURIsFromIMessageList:!v29 completionHandler:v34];
    }
    else
    {
      id v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1D9901F68();
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not sending personal nickname to chat", buf, 2u);
    }
  }
}

- (id)_typeOfNicknameUpdateToShare
{
  unint64_t v2 = (void *)[objc_alloc(NSNumber) initWithUnsignedLong:15];

  return v2;
}

- (id)newNicknameInfoToSend
{
  id v3 = [(IMDNicknameController *)self nickNameDecryptionKey];
  id v4 = [(IMDNicknameController *)self wallpaperDataTag];
  id v5 = [(IMDNicknameController *)self lowResWallpaperDataTag];
  int v6 = [(IMDNicknameController *)self wallpaperMetadataTag];
  BOOL v7 = [(IMDNicknameController *)self nickNameRecordID];
  if ([v3 length] && objc_msgSend(v7, "length"))
  {
    id v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = v8;
    if (v7) {
      CFDictionarySetValue(v8, MessageDictionaryNicknameCloudKitRecordKey, v7);
    }
    if (v3) {
      CFDictionarySetValue(v9, MessageDictionaryNicknameCloudKitDecryptionRecordKey, v3);
    }
    uint64_t v10 = [(IMDNicknameController *)self _typeOfNicknameUpdateToShare];
    if (v10) {
      CFDictionarySetValue(v9, MessageDictionaryNicknameUpdateInfoIncluded, v10);
    }

    int v11 = [(IMDNicknameController *)self personalNickname];
    id v12 = [v11 wallpaper];

    if (v12)
    {
      uint64_t v13 = NSStringFromBOOL();
      if (v13) {
        CFDictionarySetValue(v9, MessageDictionaryWallpaperUpdateKey, v13);
      }

      if (v4) {
        CFDictionarySetValue(v9, MessageDictionaryNicknameWallpaperTagKey, v4);
      }
      if (v5) {
        CFDictionarySetValue(v9, MessageDictionaryNicknameLowResWallpaperTagKey, v5);
      }
      if (v6) {
        CFDictionarySetValue(v9, MessageDictionaryNicknameWallpaperMetadataTagKey, v6);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "User does not have a nickname set, not adding nickname information", v16, 2u);
      }
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_idsDeviceFromPushToken:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(IMDNicknameController *)self nicknameService];
  int v6 = [v5 devices];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [v10 pushToken];
        int v12 = [v11 isEqualToData:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v15 = [v12 objectForKey:*MEMORY[0x1E4F6B020]];
  long long v16 = [v12 objectForKey:*MEMORY[0x1E4F6B040]];
  long long v17 = [v15 _FTOptionallyDecompressData];
  int v18 = JWDecodeDictionary();

  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v62 = (uint64_t)v13;
      __int16 v63 = 2112;
      long long v64 = v18;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Received a nickname update from: %@, with message: %@", buf, 0x16u);
    }
  }
  if (IMSharedHelperNickNameEnabled())
  {
    if ([v13 length])
    {
      long long v20 = [v18 _stringForKey:@"MessageType"];
      int v21 = [v20 isEqualToString:@"NicknamesDidUpdate"];

      uint64_t v57 = [v18 _stringForKey:MessageDictionaryNicknameCloudKitRecordKey];
      id v56 = [v18 _dataForKey:@"CloudKitDecryptionRecordKey"];
      long long v55 = [v18 _dataForKey:MessageDictionaryNicknameWallpaperTagKey];
      long long v54 = [v18 _dataForKey:MessageDictionaryNicknameLowResWallpaperTagKey];
      long long v53 = [v18 _dataForKey:MessageDictionaryNicknameWallpaperMetadataTagKey];
      uint64_t v22 = [v18 _stringForKey:@"WallpaperUpdateKey"];
      __int16 v23 = (void *)v22;
      unint64_t v24 = @"NO";
      if (v22) {
        unint64_t v24 = (__CFString *)v22;
      }
      uint64_t v58 = v24;

      char v52 = NSBOOLFromString();
      if (IMOSLoggingEnabled())
      {
        int v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v62 = v57;
          _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "This message came from user with nickname cloudKitRecord  %@", buf, 0xCu);
        }
      }
      uint64_t v26 = [v18 _stringForKey:@"MessageType"];
      int v27 = [v26 isEqualToString:@"NameOnlyUpdate"];

      int v28 = IMOSLoggingEnabled();
      if (v21)
      {
        if (v28)
        {
          BOOL v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v13;
            _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "This is a personal nickname update from: %@", buf, 0xCu);
          }
        }
        id v30 = (id)IDSCopyTokenAndIDForTokenWithID();
        id v31 = 0;
        id v32 = [(IMDNicknameController *)self _idsDeviceFromPushToken:v31];
        if (v32)
        {
          [(IMDNicknameController *)self handleNicknameUpdatesFromPeerDevice:v18 fromPeerDevice:v13];
        }
        else
        {
          __int16 v50 = IMLogHandleForCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            sub_1D9902014();
          }
        }
      }
      else if (v27)
      {
        if (v28)
        {
          long long v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v13;
            _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "This is a name only nickname update from: %@", buf, 0xCu);
          }
        }
        long long v43 = (void *)IDSCopyAddressDestinationForDestination();
        long long v44 = (void *)IDSCopyRawAddressForDestination();

        [(IMDNicknameController *)self _updateNameOnlyUpdateForMessage:v18 fromHandleID:v44];
      }
      else
      {
        if (v28)
        {
          id v45 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v13;
            _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, "This is a nickname update from: %@", buf, 0xCu);
          }
        }
        uint64_t v46 = IDSCopyAddressDestinationForDestination();

        int v47 = [v16 BOOLValueForKey:MessageDictionaryTrustedUserKey withDefault:1];
        if (IMOSLoggingEnabled())
        {
          __int16 v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            id v49 = @"YES";
            if (!v47) {
              id v49 = @"NO";
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v49;
            _os_log_impl(&dword_1D967A000, v48, OS_LOG_TYPE_INFO, "The sender is SNaP trusted: %@", buf, 0xCu);
          }
        }
        BYTE1(v51) = v47 ^ 1;
        LOBYTE(v51) = v52;
        -[IMDNicknameController NicknameWithRecordID:URI:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:hasWallpaperUpdate:dropNicknameForUnknownContacts:withCompletionBlock:](self, "NicknameWithRecordID:URI:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:hasWallpaperUpdate:dropNicknameForUnknownContacts:withCompletionBlock:", v57, v46, v56, v55, v54, v53, v51, &unk_1F3391340);
        id v13 = (id)v46;
      }

      uint64_t v34 = (void *)v57;
    }
    else
    {
      id v33 = IMLogHandleForCategory();
      uint64_t v34 = v33;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        sub_1D9901F9C(v33, v35, v36, v37, v38, v39, v40, v41);
        uint64_t v34 = v33;
      }
    }
  }
}

- (NSSet)allowListedHandlesForSharing
{
  unint64_t v2 = [(IMDNicknameController *)self handleAllowList];
  id v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (NSSet)denyListedHandlesForSharing
{
  unint64_t v2 = [(IMDNicknameController *)self handleDenyList];
  id v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (NSSet)transitionedHandles
{
  unint64_t v2 = [(IMDNicknameController *)self handleTransitionedList];
  id v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (NSDictionary)activeRecords
{
  unint64_t v2 = [(IMDNicknameController *)self activeNicknameRecords];
  id v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSDictionary)ignoredRecords
{
  unint64_t v2 = [(IMDNicknameController *)self ignoredNicknameRecords];
  id v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (void)broadcastHandlesSharingNicknamesDidChange
{
  id v6 = +[IMDBroadcastController sharedProvider];
  id v3 = [v6 broadcasterForAccountListeners];
  id v4 = [(IMDNicknameController *)self allowListedHandlesForSharing];
  id v5 = [(IMDNicknameController *)self denyListedHandlesForSharing];
  [v3 updateNicknameHandlesForSharing:v4 blocked:v5];
}

- (void)broadcastTransitionedHandlesDidChange
{
  id v5 = +[IMDBroadcastController sharedProvider];
  id v3 = [v5 broadcasterForAccountListeners];
  id v4 = [(IMDNicknameController *)self transitionedHandles];
  [v3 updateTransitionedNicknameHandles:v4];
}

- (void)allowHandlesForSharing:(id)a3 onChatGUIDs:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v53 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v77 = (uint64_t)v54;
      __int16 v78 = 2112;
      id v79 = v53;
      __int16 v80 = 2112;
      id v81 = v10;
      __int16 v82 = 1024;
      BOOL v83 = v6;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Asked to allow handles: %@, on chatGUIDS: %@, from handle: %@, forceSend: %{BOOL}d", buf, 0x26u);
    }
  }
  if (v6
    || ([(IMDNicknameController *)self allowListedHandlesForSharing],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v54 isSubsetOfSet:v12],
        v12,
        !v13))
  {
    if (IMOSLoggingEnabled())
    {
      long long v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = [v54 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v77 = v16;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Writing %lu nicknames to allow list", buf, 0xCu);
      }
    }
    -[IMDNicknameController markHandlesAsAllowed:](self, "markHandlesAsAllowed:", v54, v53);
    if (v53 && [v53 count])
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v17 = v53;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v68 objects:v75 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v69 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v68 + 1) + 8 * i);
            uint64_t v22 = +[IMDChatRegistry sharedInstance];
            __int16 v23 = [v22 existingChatWithGUID:v21];

            if (IMOSLoggingEnabled())
            {
              unint64_t v24 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v77 = (uint64_t)v23;
                _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "We have a chat for guid so sending nickname info %@", buf, 0xCu);
              }
            }
            int v25 = [v23 participants];
            uint64_t v26 = [v23 guid];
            [(IMDNicknameController *)self sendPersonalNicknameToRecipients:v25 chatGUID:v26 fromHandle:v10];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v68 objects:v75 count:16];
        }
        while (v18);
      }
    }
    else if (v54)
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v28 = v54;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v64 objects:v74 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v65 != v30) {
              objc_enumerationMutation(v28);
            }
            id v32 = [[IMDHandle alloc] initWithID:*(void *)(*((void *)&v64 + 1) + 8 * j) unformattedID:*(void *)(*((void *)&v64 + 1) + 8 * j) countryCode:0];
            [v27 addObject:v32];
          }
          uint64_t v29 = [v28 countByEnumeratingWithState:&v64 objects:v74 count:16];
        }
        while (v29);
      }

      id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v33 = v27;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v61;
        do
        {
          for (uint64_t k = 0; k != v34; ++k)
          {
            if (*(void *)v61 != v35) {
              objc_enumerationMutation(v33);
            }
            uint64_t v37 = *(void **)(*((void *)&v60 + 1) + 8 * k);
            uint64_t v38 = +[IMDChatRegistry sharedInstance];
            uint64_t v39 = [v37 ID];
            uint64_t v40 = [v38 allExistingChatsWithIdentifier:v39];

            if (v40) {
              [v55 addObjectsFromArray:v40];
            }
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v60 objects:v73 count:16];
        }
        while (v34);
      }

      if (IMOSLoggingEnabled())
      {
        uint64_t v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v77 = (uint64_t)v55;
          _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "Found these chats: %@", buf, 0xCu);
        }
      }
      uint64_t v42 = [v55 count];
      if (!v10 || v42)
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v44 = v55;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v56 objects:v72 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v57;
          do
          {
            uint64_t v47 = 0;
            do
            {
              if (*(void *)v57 != v46) {
                objc_enumerationMutation(v44);
              }
              __int16 v48 = *(void **)(*((void *)&v56 + 1) + 8 * v47);
              if (v10
                || ([*(id *)(*((void *)&v56 + 1) + 8 * v47) lastAddressedLocalHandle],
                    (id v10 = (id)objc_claimAutoreleasedReturnValue()) != 0))
              {
                if (IMOSLoggingEnabled())
                {
                  id v49 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, "We have a fromHandle, sending the nickname", buf, 2u);
                  }
                }
                __int16 v50 = [v48 guid];
                [(IMDNicknameController *)self sendPersonalNicknameToRecipients:v33 chatGUID:v50 fromHandle:v10];
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  uint64_t v51 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D967A000, v51, OS_LOG_TYPE_INFO, "We don't have a fromHandle, so we can't send the nickname", buf, 2u);
                  }
                }
                id v10 = 0;
              }
              ++v47;
            }
            while (v45 != v47);
            uint64_t v52 = [v44 countByEnumeratingWithState:&v56 objects:v72 count:16];
            uint64_t v45 = v52;
          }
          while (v52);
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          long long v43 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "We don't have a chat, but we do have a fromHandle, sending the nickname", buf, 2u);
          }
        }
        [(IMDNicknameController *)self sendPersonalNicknameToRecipients:v33 chatGUID:0 fromHandle:v10];
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v77 = (uint64_t)v54;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "We tried to allow handle(s) that have already been allowed, bailing. Handles: %@", buf, 0xCu);
    }
  }
}

- (void)markHandlesAsAllowed:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDNicknameController *)self allowListedHandlesForSharing];
  int v6 = [v4 isSubsetOfSet:v5];

  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        uint64_t v12 = (uint64_t)v4;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Given handles are already in our allow list, no need to do anything. Handles: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    if (v7)
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        uint64_t v12 = [v4 count];
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Writing %lu nicknames to allow list", (uint8_t *)&v11, 0xCu);
      }
    }
    id v10 = [(IMDNicknameController *)self handleAllowList];
    [(IMDNicknameController *)self _updateHandleList:v10 withHandles:v4 forKey:@"handleWhitelist" broadcastUpdates:1];

    [(IMDNicknameController *)self broadcastHandlesSharingNicknamesDidChange];
  }
}

- (void)denyHandlesForSharing:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      uint64_t v8 = [v4 count];
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Writing %lu nicknames to deny list", (uint8_t *)&v7, 0xCu);
    }
  }
  int v6 = [(IMDNicknameController *)self handleDenyList];
  [(IMDNicknameController *)self _updateHandleList:v6 withHandles:v4 forKey:@"handleBlacklist" broadcastUpdates:1];

  [(IMDNicknameController *)self broadcastHandlesSharingNicknamesDidChange];
}

- (void)markNicknamesAsTransitionedForHandleIDs:(id)a3 isAutoUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v20 = v6;
  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          int v12 = IMOSLoggingEnabled();
          if (v4)
          {
            if (v12)
            {
              uint64_t v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v26 = v11;
                _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Auto update mode is set for handle ID: %@", buf, 0xCu);
              }
            }
            [(IMDNicknameController *)self acceptPendingNicknameForHandleID:v11 updateType:12];
          }
          else if (v12)
          {
            id v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = v11;
              _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Always ask mode is set for handle ID: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v8);
    }

    if (IMOSLoggingEnabled())
    {
      long long v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = [v7 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v26 = v16;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Writing handles %lu to transitioned list", buf, 0xCu);
      }
    }
    id v17 = [(IMDNicknameController *)self handleTransitionedList];
    [(IMDNicknameController *)self _updateTransitionList:v17 withHandles:v7 forKey:@"handleTransitionedList" broadcastUpdates:1];

    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Broadcasting changes to the transitioned list", buf, 2u);
      }
    }
    [(IMDNicknameController *)self broadcastTransitionedHandlesDidChange];
  }
  else
  {
    uint64_t v19 = IMLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1D990207C();
    }
  }
}

- (void)markProfileRecords:(id)a3 asActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v7)
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v15 = 134217984;
          uint64_t v16 = [v6 count];
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Writing record IDs %lu to active list", (uint8_t *)&v15, 0xCu);
        }
      }
      uint64_t v9 = [(IMDNicknameController *)self activeNicknameRecords];
      [(IMDNicknameController *)self _updateActiveList:v9 withRecords:v6 broadcastUpdates:1];
    }
    else
    {
      if (v7)
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v15 = 134217984;
          uint64_t v16 = [v6 count];
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Removing record IDs %lu from active list", (uint8_t *)&v15, 0xCu);
        }
      }
      uint64_t v9 = [v6 allKeys];
      [(IMDNicknameController *)self _removeFromList:v9 withKey:@"activeNicknameRecords"];
    }

    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Broadcasting changes to the active list", (uint8_t *)&v15, 2u);
      }
    }
    id v10 = +[IMDBroadcastController sharedProvider];
    uint64_t v13 = [v10 broadcasterForAccountListeners];
    id v14 = [(IMDNicknameController *)self activeRecords];
    [v13 updateActiveNicknameRecords:v14];
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D99020B0();
    }
  }
}

- (void)markProfileRecordsAsIgnored:(id)a3 broadcastUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v13 = 134217984;
        uint64_t v14 = [v6 count];
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Writing record IDs %lu to ignored list", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v8 = [(IMDNicknameController *)self ignoredNicknameRecords];
    [(IMDNicknameController *)self _updateIgnoredList:v8 withRecords:v6 broadcastUpdates:v4];

    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Broadcasting changes to the ignored list", (uint8_t *)&v13, 2u);
      }
    }
    id v10 = +[IMDBroadcastController sharedProvider];
    uint64_t v11 = [v10 broadcasterForAccountListeners];
    int v12 = [(IMDNicknameController *)self ignoredRecords];
    [v11 updateIgnoredNicknameRecords:v12];
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D99020E4();
    }
  }
}

- (NSMutableSet)handleAllowList
{
  handleAllowList = self->_handleAllowList;
  if (!handleAllowList)
  {
    BOOL v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = self->_handleAllowList;
    self->_handleAllowList = v4;

    handleAllowList = self->_handleAllowList;
  }

  return handleAllowList;
}

- (NSMutableSet)handleDenyList
{
  handleDenyList = self->_handleDenyList;
  if (!handleDenyList)
  {
    BOOL v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = self->_handleDenyList;
    self->_handleDenyList = v4;

    handleDenyList = self->_handleDenyList;
  }

  return handleDenyList;
}

- (void)_updateHandleList:(id)a3 withHandles:(id)a4 forKey:(id)a5 broadcastUpdates:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 isSubsetOfSet:v10])
  {
    if (IMOSLoggingEnabled())
    {
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v11;
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Given handles are already in our list, no need to do anything. Handles: %@, key: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    [v10 unionSet:v11];
    id v22 = 0;
    uint64_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v22];
    id v15 = v22;
    uint64_t v16 = v15;
    if (!v14 || v15)
    {
      if (IMOSLoggingEnabled())
      {
        long long v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v24 = v12;
          __int16 v25 = 2112;
          id v26 = v16;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving handle list for key %@ error %@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v17 = [(IMDNicknameController *)self handleSharingKVStore];
      id v21 = 0;
      [v17 persistData:v14 forKey:v12 error:&v21];
      id v18 = v21;

      if (v18 && IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v24 = v12;
          __int16 v25 = 2112;
          id v26 = v18;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing a handle list update with key %@ -  %@", buf, 0x16u);
        }
      }
    }
    if (v6)
    {
      [(IMDNicknameController *)self _updateDenyAllowListHandlesVersion];
      [(IMDNicknameController *)self _syncHandleAllowDenyListToOtherDevices];
    }
  }
}

- (void)_updateTransitionList:(id)a3 withHandles:(id)a4 forKey:(id)a5 broadcastUpdates:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v10 unionSet:v11];
  id v22 = 0;
  int v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v22];
  id v14 = v22;
  id v15 = v14;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16)
  {
    id v18 = [(IMDNicknameController *)self nicknameRecordsKVStore];
    id v21 = 0;
    [v18 persistData:v13 forKey:v12 error:&v21];
    id v19 = v21;

    if (v19 && IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v12;
        __int16 v25 = 2112;
        id v26 = v19;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing a transitioned list update with key %@ -  %@", buf, 0x16u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving transitioned list for key %@ error %@", buf, 0x16u);
    }
  }
  if (v6)
  {
    [(IMDNicknameController *)self _updateTransitionedListHandlesVersion];
    [(IMDNicknameController *)self _syncHandleTransitionedListToOtherDevices];
  }
}

- (void)_updateActiveList:(id)a3 withRecords:(id)a4 broadcastUpdates:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (__CFString *)a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Saving new active list: %@, after previous active list: %@", buf, 0x16u);
    }
  }
  if (v8)
  {
    [v8 addEntriesFromDictionary:v9];
    id v19 = 0;
    id v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v19];
    id v12 = v19;
    int v13 = v12;
    if (!v11 || v12)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = @"activeNicknameRecords";
          __int16 v22 = 2112;
          id v23 = v13;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving active list for key %@ error %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v14 = [(IMDNicknameController *)self nicknameRecordsKVStore];
      id v18 = 0;
      [v14 persistData:v11 forKey:@"activeNicknameRecords" error:&v18];
      id v15 = v18;

      if (v15 && IMOSLoggingEnabled())
      {
        BOOL v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = @"activeNicknameRecords";
          __int16 v22 = 2112;
          id v23 = v15;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing a active list update with key %@ -  %@", buf, 0x16u);
        }
      }
    }
    if (v5)
    {
      [(IMDNicknameController *)self _updateIsActiveListHandlesVersion];
      [(IMDNicknameController *)self _syncActiveNicknameRecordsToOtherDevices];
    }
  }
}

- (void)_updateIgnoredList:(id)a3 withRecords:(id)a4 broadcastUpdates:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    [v8 addEntriesFromDictionary:v9];
    id v19 = 0;
    id v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v19];
    id v11 = v19;
    id v12 = v11;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      id v15 = [(IMDNicknameController *)self nicknameRecordsKVStore];
      id v18 = 0;
      [v15 persistData:v10 forKey:@"ignoredNicknameRecords" error:&v18];
      id v16 = v18;

      if (v16 && IMOSLoggingEnabled())
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = @"ignoredNicknameRecords";
          __int16 v22 = 2112;
          id v23 = v16;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing a ignored list update with key %@ -  %@", buf, 0x16u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = @"ignoredNicknameRecords";
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving ignored list for key %@ error %@", buf, 0x16u);
      }
    }
    if (v5)
    {
      [(IMDNicknameController *)self _updateIsIgnoredListHandlesVersion];
      [(IMDNicknameController *)self _syncIgnoredNicknameRecordsToOtherDevices];
    }
  }
}

- (id)unknownSenderRecordInfoFor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMDNicknameController *)self unknownSenderRecordInfo];
  BOOL v6 = [v5 objectForKey:v4];

  int v7 = [MEMORY[0x1E4F6E8B8] processSetOfUnknownSenderRecords:v6];

  return v7;
}

- (void)_replaceUnknownSenderRecordInfoListWithInfo:(id)a3 purgeIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    [(IMDNicknameController *)self setUnknownSenderRecordInfo:v6];
    int v7 = (void *)MEMORY[0x1E4F28DB0];
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = [(IMDNicknameController *)self unknownSenderRecordInfo];
    id v10 = [v8 dictionaryWithDictionary:v9];
    id v21 = 0;
    id v11 = [v7 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v21];
    id v12 = v21;

    if (!v11 || v12)
    {
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v23 = @"unknownSenderRecordInfoKey";
          __int16 v24 = 2112;
          id v25 = v12;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving unknown sender payload update for key %@ error %@", buf, 0x16u);
        }
      }
    }
    else
    {
      BOOL v13 = [(IMDNicknameController *)self unknownSenderRecordInfoKVStore];
      id v20 = 0;
      [v13 persistData:v11 forKey:@"unknownSenderRecordInfoKey" error:&v20];
      id v14 = v20;

      if (v14 && IMOSLoggingEnabled())
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v23 = @"unknownSenderRecordInfoKey";
          __int16 v24 = 2112;
          id v25 = v14;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing an unknown sender payload update with key %@ -  %@", buf, 0x16u);
        }
      }
    }
    if (v4) {
      [(IMDNicknameController *)self purgeUnknownSenderRecordInfoIfNeeded];
    }
    uint64_t v17 = +[IMDBroadcastController sharedProvider];
    id v18 = [v17 broadcasterForAccountListeners];
    id v19 = [(IMDNicknameController *)self unknownSenderRecordInfo];
    [v18 updateUnknownSenderRecords:v19];
  }
}

- (void)_removeFromTransitionedList:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (__CFString *)a3;
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    BOOL v5 = [(__CFString *)v4 handle];
    if (v5)
    {
      id v6 = [(IMDNicknameController *)self handleTransitionedList];
      uint64_t v7 = [v6 count];

      if (v7)
      {
        id v8 = [(IMDNicknameController *)self handleTransitionedList];
        [v8 removeObject:v5];

        id v9 = (void *)MEMORY[0x1E4F28DB0];
        id v10 = [(IMDNicknameController *)self handleTransitionedList];
        id v20 = 0;
        id v11 = [v9 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v20];
        id v12 = v20;

        if (!v11 || v12)
        {
          if (IMOSLoggingEnabled())
          {
            id v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v22 = @"handleTransitionedList";
              __int16 v23 = 2112;
              id v24 = v12;
              _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving list for key %@ error %@", buf, 0x16u);
            }
          }
        }
        else
        {
          BOOL v13 = [(IMDNicknameController *)self nicknameRecordsKVStore];
          id v19 = 0;
          [v13 persistData:v11 forKey:@"handleTransitionedList" error:&v19];
          id v14 = v19;

          if (v14 && IMOSLoggingEnabled())
          {
            id v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              __int16 v22 = @"handleTransitionedList";
              __int16 v23 = 2112;
              id v24 = v14;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing list update with key %@ -  %@", buf, 0x16u);
            }
          }
        }
        [(IMDNicknameController *)self _updateTransitionedListHandlesVersion];
        [(IMDNicknameController *)self _syncHandleTransitionedListToOtherDevices];
        [(IMDNicknameController *)self broadcastTransitionedHandlesDidChange];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v22 = v4;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "No handle id for nickname %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Feature is not enabled", buf, 2u);
    }
  }
}

- (void)_removeFromList:(id)a3 withKey:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_46;
    }
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Feature is not enabled", buf, 2u);
    }
LABEL_8:

    goto LABEL_46;
  }
  if (![v6 count])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_46;
    }
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "No nickname handle id provided", buf, 2u);
    }
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"ignoredNicknameRecords"])
  {
    uint64_t v8 = [(IMDNicknameController *)self ignoredNicknameRecords];
  }
  else
  {
    if (![v7 isEqualToString:@"activeNicknameRecords"]) {
      goto LABEL_46;
    }
    uint64_t v8 = [(IMDNicknameController *)self activeNicknameRecords];
  }
  id v10 = (void *)v8;
  if (v8)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v16 = [v10 objectForKeyedSubscript:v15];
          BOOL v17 = v16 == 0;

          if (v17)
          {
            if (IMOSLoggingEnabled())
            {
              __int16 v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v32 = v15;
                _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Handle id is already removed from list %@", buf, 0xCu);
              }
            }
            goto LABEL_45;
          }
          [v10 removeObjectForKey:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v26 = 0;
    id v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v26];
    id v19 = v26;
    id v11 = v19;
    if (!v18 || v19)
    {
      if (IMOSLoggingEnabled())
      {
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v7;
          __int16 v33 = 2112;
          id v34 = v11;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Nicknames - We had a problem archiving list for key %@ error %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v20 = [(IMDNicknameController *)self nicknameRecordsKVStore];
      id v25 = 0;
      [v20 persistData:v18 forKey:v7 error:&v25];
      id v21 = v25;

      if (v21 && IMOSLoggingEnabled())
      {
        __int16 v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v7;
          __int16 v33 = 2112;
          id v34 = v21;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Nicknames - We had a problem writing list update with key %@ -  %@", buf, 0x16u);
        }
      }
    }
    if ([v7 isEqualToString:@"ignoredNicknameRecords"])
    {
      [(IMDNicknameController *)self _updateIsIgnoredListHandlesVersion];
      [(IMDNicknameController *)self _syncIgnoredNicknameRecordsToOtherDevices];
    }
    else if ([v7 isEqualToString:@"activeNicknameRecords"])
    {
      [(IMDNicknameController *)self _updateIsActiveListHandlesVersion];
      [(IMDNicknameController *)self _syncActiveNicknameRecordsToOtherDevices];
    }

LABEL_45:
  }
LABEL_46:
}

- (void)_updatePendingNicknameVersion
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(IMDNicknameController *)self defaults];
  uint64_t v4 = *MEMORY[0x1E4F6DE00];
  uint64_t v5 = *MEMORY[0x1E4F6DE48];
  id v6 = [v3 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE48]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  uint64_t v8 = [(IMDNicknameController *)self defaults];
  uint64_t v9 = v7 + 1;
  id v10 = [NSNumber numberWithUnsignedInteger:v7 + 1];
  [v8 setValue:v10 forDomain:v4 forKey:v5];

  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [NSNumber numberWithUnsignedInteger:v9];
      int v13 = 138412290;
      id v14 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Updated pending nickname version to %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)saveNicknameForRecordID:(id)a3 handleID:(id)a4 userNickname:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v10 setRecordID:v8];
  [v10 setHandle:v9];
  BOOL v11 = [(IMDNicknameController *)self replacedNicknameForHandleIDInHandledMapIfNeeded:v9 nickname:v10];
  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v28 = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "We replaced userNickname in our handled map w/ an existing handled record", v28, 2u);
      }
    }
  }
  else
  {
    if (v12)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "We could not replace incoming nickname in our handled map, add to pending", buf, 2u);
      }
    }
    [(IMDNicknameController *)self addNicknameToPendingUpdates:v10];
  }
  uint64_t v15 = [v10 preBlastDoorPayloadData];

  if (v9 && v15)
  {
    id v16 = [(IMDNicknameController *)self unknownSenderRecordInfo];
    BOOL v17 = [v16 objectForKey:v9];
    id v18 = (void *)[v17 mutableCopy];
    id v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [MEMORY[0x1E4F1CA80] set];
    }
    id v21 = v20;

    __int16 v22 = [v10 preBlastDoorPayloadData];
    __int16 v23 = (void *)[v22 mutableCopy];

    id v24 = [MEMORY[0x1E4F1C9C8] now];
    [v23 setObject:v24 forKey:@"date"];

    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v23];
    [v21 addObject:v25];

    id v26 = [(IMDNicknameController *)self unknownSenderRecordInfo];
    long long v27 = (void *)[v26 mutableCopy];

    [v27 setObject:v21 forKey:v9];
    [(IMDNicknameController *)self _replaceUnknownSenderRecordInfoListWithInfo:v27 purgeIfNeeded:1];
  }
  else
  {
    [(IMDNicknameController *)self purgeUnknownSenderRecordInfoIfNeeded];
  }
}

- (void)clearPendingNicknameForHandleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_pendingNicknameUpdates objectForKey:v4];
  uint64_t v6 = [v5 count];
  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "We got a pending nickname to handle %@", (uint8_t *)&v11, 0xCu);
      }
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v5];
    [(IMDNicknameController *)self markNicknameAsUpdated:v9];
  }
  else if (v7)
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "We don't have a pending nickname to clear for handle ID %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)ignorePendingNicknameForHandleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_pendingNicknameUpdates objectForKey:v4];
  uint64_t v6 = [v5 count];
  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "We got a malicious pending nickname to handle %@", (uint8_t *)&v13, 0xCu);
      }
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v5];
    [v9 setFirstName:&stru_1F3398578];
    [v9 setLastName:&stru_1F3398578];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F6E8C8]) initWithImageName:&stru_1F3398578 imageFilePath:&stru_1F3398578 contentIsSensitive:0];
    [v9 setAvatar:v10];
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F6EAC8]) initWithFileName:0 filePath:0 lowResFileName:0 lowResFilePath:0 metadata:0 contentIsSensitive:0];
    [v9 setWallpaper:v11];
    [(IMDNicknameController *)self markNicknameAsUpdated:v9];
    [(IMDNicknameController *)self _updatePendingNicknameVersion];
    [(IMDNicknameController *)self sendPendingNicknameUpdatesDidChange];
  }
  else if (v7)
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "We don't have a malicious pending nickname to clear for handle ID %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)clearPendingNicknamePhotoForHandleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_pendingNicknameUpdates objectForKey:v4];
  uint64_t v6 = [v5 count];
  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "We got a pending nickname photo to handle %@", (uint8_t *)&v11, 0xCu);
      }
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v5];
    [(IMDNicknameController *)self _markNicknamePhotoAsUpdated:v9];
    [(IMDNicknameController *)self _updatePendingNicknameVersion];
    [(IMDNicknameController *)self sendPendingNicknameUpdatesDidChange];
  }
  else if (v7)
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "We don't have a pending nickname to clear for handle ID %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_markNicknamePhotoAsUpdated:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = [v4 handle];
        int v20 = 138412290;
        id v21 = v7;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Marking nickname photo %@ as handled", (uint8_t *)&v20, 0xCu);
      }
    }
    pendingNicknameUpdates = self->_pendingNicknameUpdates;
    id v9 = [v4 handle];
    [(NSMutableDictionary *)pendingNicknameUpdates removeObjectForKey:v9];

    [(IMDNicknameController *)self _deleteNicknameFromPendingMap:v4];
    id v10 = objc_alloc(MEMORY[0x1E4F6E8B8]);
    int v11 = [v4 firstName];
    id v12 = [v4 lastName];
    uint64_t v13 = [v4 pronouns];
    id v14 = (void *)[v10 initWithFirstName:v11 lastName:v12 avatar:0 pronouns:v13];

    if ([v14 isUpdateFromNickname:v4 withOptions:20])
    {
      uint64_t v15 = [v14 persistedDictionaryRepresentation];
      id v16 = self->_pendingNicknameUpdates;
      BOOL v17 = [v4 handle];
      [(NSMutableDictionary *)v16 setObject:v15 forKey:v17];

      id v18 = [(IMDNicknameController *)self pendingNicknameUpdatesKVStore];
      [(IMDNicknameController *)self _writeNicknameToKVStore:v18 nickname:v14];
    }
    [(IMDNicknameController *)self _updateNicknameInHandledMap:v4 updateType:*MEMORY[0x1E4F6DDE0] broadcastUpdates:1];
    [(IMDNicknameController *)self _updatePendingNicknameVersion];
    [(IMDNicknameController *)self _broadcastNicknamesMapChanged];
  }
  else if (v5)
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Trying to update a nil nickname", (uint8_t *)&v20, 2u);
    }
  }
}

- (void)_broadcastNicknamesMapChanged
{
  id v7 = +[IMDBroadcastController sharedProvider];
  id v3 = [v7 broadcasterForAccountListeners];
  id v4 = [(IMDNicknameController *)self pendingNicknameUpdates];
  int v5 = [(IMDNicknameController *)self handledNicknames];
  uint64_t v6 = [(IMDNicknameController *)self archivedNicknames];
  [v3 updatePendingNicknameUpdates:v4 handledNicknames:v5 archivedNicknames:v6];
}

- (void)_broadcastActiveListChanged
{
  id v5 = +[IMDBroadcastController sharedProvider];
  id v3 = [v5 broadcasterForAccountListeners];
  id v4 = [(IMDNicknameController *)self activeRecords];
  [v3 updateActiveNicknameRecords:v4];
}

- (void)addNicknameToPendingUpdates:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (self->_pendingNicknameUpdates)
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_21:
    if (!IMOSLoggingEnabled()) {
      goto LABEL_34;
    }
    __int16 v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Tried to add a nil nickname to our pending map", (uint8_t *)&v30, 2u);
    }
LABEL_24:

    goto LABEL_34;
  }
  Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  pendingNicknameUpdates = self->_pendingNicknameUpdates;
  self->_pendingNicknameUpdates = Mutable;

  if (!v5) {
    goto LABEL_21;
  }
LABEL_3:
  uint64_t v6 = [v5 handle];

  if (!v6)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_34;
    }
    __int16 v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412290;
      id v31 = v5;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Tried to add nickname to our pending map without a handle %@", (uint8_t *)&v30, 0xCu);
    }
    goto LABEL_24;
  }
  id v7 = [v5 avatar];
  char v8 = [v7 hasImage];

  if (v8)
  {
LABEL_11:
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v30 = 138412290;
        id v31 = v5;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Adding new nickname to our pending map %@", (uint8_t *)&v30, 0xCu);
      }
    }
    uint64_t v15 = self->_pendingNicknameUpdates;
    id v16 = [v5 persistedDictionaryRepresentation];
    BOOL v17 = [v5 handle];
    [(NSMutableDictionary *)v15 setObject:v16 forKey:v17];

    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = self->_pendingNicknameUpdates;
        int v30 = 138412546;
        id v31 = v5;
        __int16 v32 = 2112;
        __int16 v33 = v19;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "add nickname to pending updates %@ %@", (uint8_t *)&v30, 0x16u);
      }
    }
    [(IMDNicknameController *)self _removeFromTransitionedList:v5];
    int v20 = [(IMDNicknameController *)self pendingNicknameUpdatesKVStore];
    [(IMDNicknameController *)self _writeNicknameToKVStore:v20 nickname:v5];

    [(IMDNicknameController *)self _updatePendingNicknameVersion];
    [(IMDNicknameController *)self _broadcastNicknamesMapChanged];
    goto LABEL_34;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412290;
      id v31 = v5;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "New pending nickname has no image %@", (uint8_t *)&v30, 0xCu);
    }
  }
  id v10 = [(IMDNicknameController *)self handledNicknames];
  int v11 = [v5 handle];
  id v12 = [v10 objectForKey:v11];

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v12];
  if ([v5 isUpdateFromNickname:v13 withOptions:4])
  {

    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412290;
      id v31 = v13;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "New pending nickname name hasn't changed, silently updating record ID for previously handled nickname %@", (uint8_t *)&v30, 0xCu);
    }
  }
  id v25 = [v5 recordID];
  [v13 setRecordID:v25];

  handledNicknames = self->_handledNicknames;
  long long v27 = [v13 persistedDictionaryRepresentation];
  long long v28 = [v13 handle];
  [(NSMutableDictionary *)handledNicknames setObject:v27 forKey:v28];

  long long v29 = [(IMDNicknameController *)self handledNicknamesKVStore];
  [(IMDNicknameController *)self _writeNicknameToKVStore:v29 nickname:v13];

LABEL_34:
}

- (BOOL)replacedNicknameForHandleIDInHandledMapIfNeeded:(id)a3 nickname:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(IMDNicknameController *)self handledNicknames];
  id v9 = [v8 objectForKey:v6];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v9];
  if (v10)
  {
    int v11 = [v7 isUpdateFromNickname:v10 withOptions:8];
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = @"NO";
        int v16 = 138412802;
        BOOL v17 = v10;
        __int16 v18 = 2112;
        if (v11) {
          uint64_t v13 = @"YES";
        }
        id v19 = v7;
        __int16 v20 = 2112;
        id v21 = v13;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Existing nickname %@ and new nickname %@ are different %@", (uint8_t *)&v16, 0x20u);
      }
    }
    if ((v11 & 1) == 0)
    {
      [(IMDNicknameController *)self _updateNicknameInHandledMap:v7 updateType:*MEMORY[0x1E4F6DDE0] broadcastUpdates:1];
      [(IMDNicknameController *)self _updatePendingNicknameVersion];
      [(IMDNicknameController *)self _broadcastNicknamesMapChanged];
    }
    char v14 = v11 ^ 1;
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)_markPendingNicknameAsCurrent:(id)a3 incrementPendingNicknameVersion:(BOOL)a4 updateType:(unint64_t)a5 broadcastUpdates:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  *(void *)&v34[13] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v10)
  {
    int v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    char v12 = [v11 isNameAndPhotoC3Enabled];

    if (v12)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          char v14 = [v10 recordID];
          uint64_t v15 = [v10 handle];
          int v31 = 138412546;
          __int16 v32 = v14;
          __int16 v33 = 2112;
          *(void *)uint64_t v34 = v15;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Marking nickname %@ as current for handle %@", (uint8_t *)&v31, 0x16u);
        }
      }
      int v16 = [(IMDNicknameController *)self handledNicknames];
      BOOL v17 = [v10 handle];
      __int16 v18 = [v16 objectForKey:v17];

      if (v18) {
        BOOL v19 = (a5 & 0xC) != 0;
      }
      else {
        BOOL v19 = 0;
      }
      int v20 = IMOSLoggingEnabled();
      if (v19)
      {
        if (v20)
        {
          id v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = [v10 handle];
            int v31 = 138412290;
            __int16 v32 = v22;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Found current nickname with photo or poster update, moving to archive for handle %@", (uint8_t *)&v31, 0xCu);
          }
        }
        __int16 v23 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v18];
        [(IMDNicknameController *)self _markCurrentNicknameAsArchived:v23 incrementPendingNicknameVersion:0];
      }
      else
      {
        if (v20)
        {
          long long v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            long long v28 = [v10 handle];
            int v31 = 138412802;
            __int16 v32 = v28;
            __int16 v33 = 1024;
            *(_DWORD *)uint64_t v34 = (a5 & 0xC) != 0;
            v34[2] = 2112;
            *(void *)&v34[3] = v18;
            _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "No current nickname with a different photo or poster found, nothing to archive for handle %@. isPhotoOrWallpaperUpdate: %{BOOL}d Current nickname dict: %@.", (uint8_t *)&v31, 0x1Cu);
          }
        }
        if (!a5)
        {
          pendingNicknameUpdates = self->_pendingNicknameUpdates;
          int v30 = [v10 handle];
          [(NSMutableDictionary *)pendingNicknameUpdates removeObjectForKey:v30];

          [(IMDNicknameController *)self _deleteNicknameFromPendingMap:v10];
          if (v8) {
            [(IMDNicknameController *)self _updatePendingNicknameVersion];
          }
          [(IMDNicknameController *)self _broadcastNicknamesMapChanged];
          goto LABEL_29;
        }
      }
      [(IMDNicknameController *)self _updateNicknameInHandledMap:v10 updateType:a5 broadcastUpdates:v6];
LABEL_29:
      if (v8) {
        [(IMDNicknameController *)self _updatePendingNicknameVersion];
      }
      [(IMDNicknameController *)self _broadcastNicknamesMapChanged];
      if (v6) {
        [(IMDNicknameController *)self sendPendingNicknameUpdatesDidChange];
      }

      goto LABEL_34;
    }
    [(IMDNicknameController *)self _updateNicknameInHandledMap:v10 updateType:a5 broadcastUpdates:v6];
    id v25 = self->_pendingNicknameUpdates;
    id v26 = [v10 handle];
    [(NSMutableDictionary *)v25 removeObjectForKey:v26];

    [(IMDNicknameController *)self _deleteNicknameFromPendingMap:v10];
    if (v8) {
      [(IMDNicknameController *)self _updatePendingNicknameVersion];
    }
    [(IMDNicknameController *)self _broadcastNicknamesMapChanged];
  }
  else if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Trying to update a nil nickname", (uint8_t *)&v31, 2u);
    }
  }
LABEL_34:
}

- (void)_markCurrentNicknameAsArchived:(id)a3 incrementPendingNicknameVersion:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v5 handle];
      int v11 = 138412290;
      char v12 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Marking nickname %@ as archived", (uint8_t *)&v11, 0xCu);
    }
  }
  BOOL v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v9 = [v8 isNameAndPhotoC3Enabled];

  if ((v9 & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Name Photo FF not enabled", (uint8_t *)&v11, 2u);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v5)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Trying to update a nil nickname", (uint8_t *)&v11, 2u);
    }
    goto LABEL_15;
  }
  [(IMDNicknameController *)self _updateNicknameInArchivedMap:v5];
LABEL_16:
}

- (void)_deleteOnDiskDataIfNeededForNickname:(id)a3 withNewNickname:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 avatar];
  BOOL v8 = [v7 imageFilePath];

  if ([v8 length]
    && ([v6 avatar],
        char v9 = objc_claimAutoreleasedReturnValue(),
        [v9 imageFilePath],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v8 isEqualToString:v10],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        char v14 = [v6 handle];
        *(_DWORD *)buf = 138412546;
        uint64_t v39 = v14;
        __int16 v40 = 2112;
        uint64_t v41 = v8;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "For nickname %@, deleting old avatar image at path during mark as updated %@", buf, 0x16u);
      }
    }
    uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v37 = 0;
    [v15 removeItemAtPath:v8 error:&v37];
    id v12 = v37;

    if (v12)
    {
      int v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1D99021E8();
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  BOOL v17 = [v5 wallpaper];
  __int16 v18 = [v17 filePath];

  if ([v18 length])
  {
    BOOL v19 = [v6 wallpaper];
    int v20 = [v19 filePath];
    char v21 = [v18 isEqualToString:v20];

    if ((v21 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          __int16 v23 = [v6 handle];
          *(_DWORD *)buf = 138412546;
          uint64_t v39 = v23;
          __int16 v40 = 2112;
          uint64_t v41 = v18;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "For nickname %@, deleting old wallpaper image at path during mark as updated %@", buf, 0x16u);
        }
      }

      id v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v36 = 0;
      [v24 removeItemAtPath:v18 error:&v36];
      id v12 = v36;

      if (v12)
      {
        id v25 = IMLogHandleForCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_1D9902180();
        }
      }
    }
  }
  id v26 = [v5 wallpaper];
  long long v27 = [v26 lowResFilePath];

  if ([v27 length])
  {
    long long v28 = [v6 wallpaper];
    long long v29 = [v28 lowResFilePath];
    char v30 = [v27 isEqualToString:v29];

    if ((v30 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        int v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = [v6 handle];
          *(_DWORD *)buf = 138412546;
          uint64_t v39 = v32;
          __int16 v40 = 2112;
          uint64_t v41 = v8;
          _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "For nickname %@, deleting old watch wallpaper image at path during mark as updated %@", buf, 0x16u);
        }
      }

      __int16 v33 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v35 = 0;
      [v33 removeItemAtPath:v27 error:&v35];
      id v12 = v35;

      if (v12)
      {
        uint64_t v34 = IMLogHandleForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_1D9902118();
        }
      }
    }
  }
}

- (void)_updateNicknameInHandledMap:(id)a3 updateType:(unint64_t)a4 broadcastUpdates:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v9 = v8;
  if (self->_handledNicknames)
  {
    if (!v8) {
      return;
    }
  }
  else
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    handledNicknames = self->_handledNicknames;
    self->_handledNicknames = Mutable;

    if (!v9) {
      return;
    }
  }
  if (a4)
  {
    id v12 = [v9 handle];
    if ([v12 length])
    {
      uint64_t v13 = self->_handledNicknames;
      char v14 = [v9 handle];
      uint64_t v15 = [(NSMutableDictionary *)v13 objectForKey:v14];

      if (v15)
      {
        int v16 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v15];
        if (IMOSLoggingEnabled())
        {
          BOOL v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            __int16 v18 = [v16 recordID];
            BOOL v19 = [v9 recordID];
            *(_DWORD *)buf = 138412802;
            uint64_t v51 = v12;
            __int16 v52 = 2112;
            id v53 = v18;
            __int16 v54 = 2112;
            id v55 = v19;
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Replacing handled nickname for handle id %@ from record id %@ to new record id %@", buf, 0x20u);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          int v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            char v21 = [v9 handle];
            *(_DWORD *)buf = 138412290;
            uint64_t v51 = v21;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "No current nickname found for handle %@", buf, 0xCu);
          }
        }
        int v16 = 0;
      }
      if ((*MEMORY[0x1E4F6DDE0] & ~a4) != 0)
      {
        if (v16) {
          uint64_t v27 = [v16 copy];
        }
        else {
          uint64_t v27 = [objc_alloc(MEMORY[0x1E4F6E8B8]) initWithFirstName:0 lastName:0 avatar:0 pronouns:0 wallpaper:0];
        }
        long long v28 = (void *)v27;
        long long v29 = [v9 recordID];
        [v28 setRecordID:v29];

        char v30 = [v9 handle];
        [v28 setHandle:v30];

        if ((a4 & 0xC) != 0)
        {
          if (IMOSLoggingEnabled())
          {
            int v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              __int16 v32 = [v9 handle];
              *(_DWORD *)buf = 138412290;
              uint64_t v51 = v32;
              _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Wallpaper and photo update for handle %@", buf, 0xCu);
            }
          }
          __int16 v33 = [v9 avatar];
          [v28 setAvatar:v33];

          uint64_t v34 = [v9 wallpaper];
          [v28 setWallpaper:v34];
        }
        if ((a4 & 2) != 0)
        {
          if (IMOSLoggingEnabled())
          {
            id v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              id v36 = [v9 handle];
              *(_DWORD *)buf = 138412290;
              uint64_t v51 = v36;
              _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Name update for handle %@", buf, 0xCu);
            }
          }
          id v37 = [v9 firstName];
          [v28 setFirstName:v37];

          uint64_t v38 = [v9 lastName];
          [v28 setLastName:v38];
        }
        uint64_t v39 = self->_handledNicknames;
        __int16 v40 = [v28 persistedDictionaryRepresentation];
        [(NSMutableDictionary *)v39 setObject:v40 forKey:v12];

        uint64_t v41 = [(IMDNicknameController *)self handledNicknamesKVStore];
        [(IMDNicknameController *)self _writeNicknameToKVStore:v41 nickname:v28];

        if (([v9 isUpdateFromNickname:v28 withOptions:8] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              long long v43 = [v9 handle];
              *(_DWORD *)buf = 138412290;
              uint64_t v51 = v43;
              _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Deleting pending update as this is the same as current for %@", buf, 0xCu);
            }
          }
          [(NSMutableDictionary *)self->_pendingNicknameUpdates removeObjectForKey:v12];
          [(IMDNicknameController *)self _deleteNicknameFromPendingMap:v9];
        }

        char v9 = v28;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            __int16 v23 = [v9 handle];
            *(_DWORD *)buf = 138412290;
            uint64_t v51 = v23;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Update everything for handle %@", buf, 0xCu);
          }
        }
        id v24 = self->_handledNicknames;
        id v25 = [v9 persistedDictionaryRepresentation];
        [(NSMutableDictionary *)v24 setObject:v25 forKey:v12];

        id v26 = [(IMDNicknameController *)self handledNicknamesKVStore];
        [(IMDNicknameController *)self _writeNicknameToKVStore:v26 nickname:v9];

        [(NSMutableDictionary *)self->_pendingNicknameUpdates removeObjectForKey:v12];
        [(IMDNicknameController *)self _deleteNicknameFromPendingMap:v9];
      }
      id v44 = [v9 handle];
      uint64_t v45 = objc_msgSend(v9, "recordID", v44);
      id v49 = v45;
      uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];

      uint64_t v47 = [(IMDNicknameController *)self activeNicknameRecords];
      [(IMDNicknameController *)self _updateActiveList:v47 withRecords:v46 broadcastUpdates:v5];
    }
    else
    {
      uint64_t v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1D99022B8();
      }
    }
  }
  else
  {
    id v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1D9902250();
    }
  }
}

- (void)_updateNicknameInArchivedMap:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_archivedNicknames)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    archivedNicknames = self->_archivedNicknames;
    self->_archivedNicknames = Mutable;
  }
  handledNicknames = self->_handledNicknames;
  id v8 = [v4 handle];
  char v9 = [(NSMutableDictionary *)handledNicknames objectForKey:v8];

  if (v9)
  {
    id v10 = self->_archivedNicknames;
    char v11 = [v4 handle];
    id v12 = [(NSMutableDictionary *)v10 objectForKey:v11];

    if (v12)
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v12];
      BOOL v14 = [(IMDNicknameController *)self _isActiveForNickname:v13];
      int v15 = IMOSLoggingEnabled();
      if (v14)
      {
        if (v15)
        {
          int v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v26 = 138412290;
            uint64_t v27 = v13;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Not removing archived nickname as archived nickname is active: %@", (uint8_t *)&v26, 0xCu);
          }
        }
        goto LABEL_18;
      }
      if (v15)
      {
        BOOL v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          __int16 v18 = [v4 handle];
          BOOL v19 = [v13 recordID];
          int v20 = [v4 recordID];
          int v26 = 138412802;
          uint64_t v27 = v18;
          __int16 v28 = 2112;
          long long v29 = v19;
          __int16 v30 = 2112;
          int v31 = v20;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Replacing archived nickname for handle id %@ from record id %@ to new record id %@", (uint8_t *)&v26, 0x20u);
        }
      }
      [(IMDNicknameController *)self _deleteOnDiskDataIfNeededForNickname:v13 withNewNickname:v4];
    }
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v9];
    char v21 = [MEMORY[0x1E4F1C9C8] now];
    [v13 setArchivedDate:v21];

    uint64_t v22 = self->_archivedNicknames;
    __int16 v23 = [v13 persistedDictionaryRepresentation];
    id v24 = [v4 handle];
    [(NSMutableDictionary *)v22 setObject:v23 forKey:v24];

    id v25 = [(IMDNicknameController *)self archivedNicknamesKVStore];
    [(IMDNicknameController *)self _writeNicknameToKVStore:v25 nickname:v13];

LABEL_18:
    goto LABEL_19;
  }
  id v12 = IMLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1D9902320(v4, v12);
  }
LABEL_19:
}

- (BOOL)_isActiveForNickname:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMDNicknameController *)self activeRecords];
  id v6 = [v4 handle];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = [v4 recordID];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)markNicknameAsUpdated:(id)a3
{
  id v12 = a3;
  id v4 = [(IMDNicknameController *)self handledNicknames];
  BOOL v5 = [v12 handle];
  id v6 = [v4 objectForKey:v5];

  if (v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v6];
    if ([v12 isUpdateFromNickname:v7 withOptions:4]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    if ([v12 isUpdateFromNickname:v7 withOptions:2]) {
      uint64_t v9 = v8 | 4;
    }
    else {
      uint64_t v9 = v8;
    }
    int v10 = [v12 isUpdateFromNickname:v7 withOptions:32];
    if ([v12 isUpdateFromNickname:v7 withOptions:16] | v10) {
      uint64_t v11 = v9 | 8;
    }
    else {
      uint64_t v11 = v9;
    }
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F6DDE0];
  }
  [(IMDNicknameController *)self _markPendingNicknameAsCurrent:v12 incrementPendingNicknameVersion:1 updateType:v11 broadcastUpdates:1];
}

- (void)_writeNicknameToKVStore:(id)a3 nickname:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "writing nickname %@ to kvstore %@", buf, 0x16u);
    }
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v9 = [v6 persistedDictionaryRepresentation];
  id v17 = 0;
  int v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v17];
  id v11 = v17;

  if (!v10 || v11)
  {
    if (IMOSLoggingEnabled())
    {
      int v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v11;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "We had a problem archiving the nickname object %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v12 = [v6 handle];
    id v16 = 0;
    [v5 persistData:v10 forKey:v12 error:&v16];
    id v13 = v16;

    if (v13 && IMOSLoggingEnabled())
    {
      BOOL v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v13;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "We had a problem writing the nickname to the pendingNicknameUpdatesKVStore %@", buf, 0xCu);
      }
    }
  }
}

- (void)_deleteNicknameFromPendingMap:(id)a3
{
  id v4 = [a3 handle];
  [(IMDNicknameController *)self _deleteHandleIDFromPendingMap:v4];
}

- (void)_deleteHandleIDFromPendingMap:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDNicknameController *)self pendingNicknameUpdatesKVStore];
  id v8 = 0;
  [v5 persistData:0 forKey:v4 error:&v8];
  id v6 = v8;

  if (v6 && IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "We got an error trying to remove %@ from the pending map %@", buf, 0x16u);
    }
  }
}

- (void)_deleteHandleIDFromHandledMap:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDNicknameController *)self handledNicknamesKVStore];
  id v8 = 0;
  [v5 persistData:0 forKey:v4 error:&v8];
  id v6 = v8;

  if (v6 && IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "We got an error trying to remove %@ from the handled map %@", buf, 0x16u);
    }
  }
}

- (void)_deleteHandleIDFromArchivedMap:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDNicknameController *)self archivedNicknamesKVStore];
  id v8 = 0;
  [v5 persistData:0 forKey:v4 error:&v8];
  id v6 = v8;

  if (v6 && IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "We got an error trying to remove %@ from the handled map %@", buf, 0x16u);
    }
  }
}

- (void)cleanUpNicknameForIDs:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v50 = v5;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Got called to clean up nickname for ids %@", buf, 0xCu);
      }
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v38 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v8)
    {
      char v9 = 0;
      uint64_t v10 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v13 = [(IMDNicknameController *)self handleAllowList];
          int v14 = [v13 containsObject:v12];

          if (v14)
          {
            if (IMOSLoggingEnabled())
            {
              int v15 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                __int16 v50 = v12;
                _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Removing %@ from allow list ", buf, 0xCu);
              }
            }
            id v16 = [(IMDNicknameController *)self handleAllowList];
            [v16 removeObject:v12];

            id v17 = [(IMDNicknameController *)self handleAllowList];
            __int16 v18 = [MEMORY[0x1E4F1CAD0] set];
            [(IMDNicknameController *)self _updateHandleList:v17 withHandles:v18 forKey:@"handleWhitelist" broadcastUpdates:0];

            char v9 = 1;
          }
          id v19 = [(IMDNicknameController *)self handleDenyList];
          int v20 = [v19 containsObject:v12];

          if (v20)
          {
            if (IMOSLoggingEnabled())
            {
              id v21 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                __int16 v50 = v12;
                _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Removing %@ from deny list ", buf, 0xCu);
              }
            }
            uint64_t v22 = [(IMDNicknameController *)self handleDenyList];
            [v22 removeObject:v12];

            __int16 v23 = [(IMDNicknameController *)self handleDenyList];
            id v24 = [MEMORY[0x1E4F1CAD0] set];
            [(IMDNicknameController *)self _updateHandleList:v23 withHandles:v24 forKey:@"handleBlacklist" broadcastUpdates:0];

            char v9 = 1;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v8);

      if (v9)
      {
        if (IMOSLoggingEnabled())
        {
          id v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Sending updated allow and deny lists to peers and client", buf, 2u);
          }
        }
        [(IMDNicknameController *)self broadcastHandlesSharingNicknamesDidChange];
        [(IMDNicknameController *)self _updateDenyAllowListHandlesVersion];
        [(IMDNicknameController *)self _syncHandleAllowDenyListToOtherDevices];
      }
    }
    else
    {
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v27 = v7;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (!v28)
    {

LABEL_63:
      id v5 = v38;
      goto LABEL_64;
    }
    char v29 = 0;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        __int16 v33 = [(NSMutableDictionary *)self->_pendingNicknameUpdates objectForKey:v32];

        if (v33)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v34 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v50 = v32;
              _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Removing %@ from pending nickname updates", buf, 0xCu);
            }
          }
          [(NSMutableDictionary *)self->_pendingNicknameUpdates removeObjectForKey:v32];
          [(IMDNicknameController *)self _deleteHandleIDFromPendingMap:v32];
          char v29 = 1;
        }
        id v35 = [(NSMutableDictionary *)self->_handledNicknames objectForKey:v32];

        if (v35)
        {
          if (IMOSLoggingEnabled())
          {
            id v36 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v50 = v32;
              _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "Removing %@ from handled nickname updates", buf, 0xCu);
            }
          }
          [(NSMutableDictionary *)self->_handledNicknames removeObjectForKey:v32];
          [(IMDNicknameController *)self _deleteHandleIDFromHandledMap:v32];
          char v29 = 1;
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v28);

    id v5 = v38;
    if (v29)
    {
      if (IMOSLoggingEnabled())
      {
        id v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Sending updated handled and pending nicknames to peers and client", buf, 2u);
        }
      }
      [(IMDNicknameController *)self _broadcastNicknamesMapChanged];
      [(IMDNicknameController *)self _updatePendingNicknameVersion];
      [(IMDNicknameController *)self sendPendingNicknameUpdatesDidChange];
      goto LABEL_63;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "No handles to clean up, returning.", buf, 2u);
    }
  }
LABEL_64:
}

- (BOOL)_deviceUnderFirstUnlock
{
  unint64_t v2 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  char v3 = [v2 isUnderFirstDataProtectionLock];

  return v3;
}

- (BOOL)_isUnderScrutiny
{
  unint64_t v2 = [(IMDNicknameController *)self defaults];
  char v3 = [v2 getValueFromDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE60]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)_setUnderScrutiny:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IMDNicknameController *)self defaults];
  char v4 = [NSNumber numberWithBool:v3];
  [v5 setValue:v4 forDomain:*MEMORY[0x1E4F6DE00] forKey:*MEMORY[0x1E4F6DE60]];
}

- (void)_deleteDataUnderScrutiny
{
  BOOL v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    sub_1D99023B8();
  }

  if (IMOSLoggingEnabled())
  {
    char v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Deleting data from pending nicknames KVStore", buf, 2u);
    }
  }
  id v5 = [(IMDNicknameController *)self pendingNicknameUpdatesKVStore];
  [v5 deleteDatabase];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Deleting data from handled nicknames KVStore", v13, 2u);
    }
  }
  id v7 = [(IMDNicknameController *)self handledNicknamesKVStore];
  [v7 deleteDatabase];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Deleting data from archived nicknames KVStore", v12, 2u);
    }
  }
  char v9 = [(IMDNicknameController *)self archivedNicknamesKVStore];
  [v9 deleteDatabase];
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v11 = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Exiting scrutiny mode", v11, 2u);
    }
  }
  [(IMDNicknameController *)self _setUnderScrutiny:0];
}

- (void)_loadAllInfoFromDiskIfAble
{
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    BOOL v3 = [(IMDNicknameController *)self _deviceUnderFirstUnlock];
    int v4 = IMOSLoggingEnabled();
    if (v3)
    {
      if (v4)
      {
        id v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Device is under first unlock so we need to put updates into a temporary map until we leave first unlock", buf, 2u);
        }
      }
      self->_needToLoadMapsInfoFromDisuint64_t k = 1;
    }
    else
    {
      if (v4)
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v14 = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "We are not under first unlock so we are able to load all data", v14, 2u);
        }
      }
      if ([(IMDNicknameController *)self _isUnderScrutiny])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v13 = 0;
            _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "IMDNicknameController is already in scrutiny mode before attempting to load data from disk. Will delete existing data.", v13, 2u);
          }
        }
        [(IMDNicknameController *)self _deleteDataUnderScrutiny];
      }
      [(IMDNicknameController *)self loadPersonalNicknameIfNeeded];
      [(IMDNicknameController *)self reuploadProfileIfNeeded];
      [(IMDNicknameController *)self loadNicknamesFromKVStore];
      [(IMDNicknameController *)self loadSharingHandlesPrefs];
      [(IMDNicknameController *)self loadHandledTransitioned];
      [(IMDNicknameController *)self loadUnknownSenderRecordInfoFromKVStore];
      char v9 = [(IMDNicknameController *)self activeNicknameRecords];
      uint64_t v10 = [(IMDNicknameController *)self loadListForKey:@"activeNicknameRecords" list:v9];
      [(IMDNicknameController *)self setActiveNicknameRecords:v10];

      __int16 v11 = [(IMDNicknameController *)self ignoredNicknameRecords];
      id v12 = [(IMDNicknameController *)self loadListForKey:@"ignoredNicknameRecords" list:v11];
      [(IMDNicknameController *)self setIgnoredNicknameRecords:v12];

      [(IMDNicknameController *)self evaluateAccountStateForFeatureEligibility];
      [(IMDNicknameController *)self _evaluateIfAccountHasMultiplePhoneNumbers];
      [(IMDNicknameController *)self _uploadPendingNicknameIfNecessary];
      self->_needToLoadMapsInfoFromDisuint64_t k = 0;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not loading nickname info from disk", v16, 2u);
    }
  }
}

- (void)loadPersonalNicknameIfNeeded
{
  if ([(IMDNicknameController *)self _nicknameFeatureEnabled])
  {
    BOOL v3 = [(IMDNicknameController *)self storedPersonalNickname];
    if (v3)
    {
      [(IMDNicknameController *)self setPersonalNickname:v3];
    }
    else
    {
      int v4 = [(IMDNicknameController *)self nickNameRecordID];

      if (v4)
      {
        *(void *)buf = 0;
        objc_initWeak((id *)buf, self);
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = sub_1D9773404;
        v5[3] = &unk_1E6B75FC0;
        objc_copyWeak(&v6, (id *)buf);
        [(IMDNicknameController *)self currentPersonalNicknamewithCompletionBlock:v5];
        objc_destroyWeak(&v6);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Not going to load personal nickname, feature is disabled", buf, 2u);
    }
  }
}

- (void)loadNicknamesFromKVStore
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!self->_pendingNicknameUpdates)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    pendingNicknameUpdates = self->_pendingNicknameUpdates;
    self->_pendingNicknameUpdates = Mutable;
  }
  if (!self->_handledNicknames)
  {
    id v5 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    handledNicknames = self->_handledNicknames;
    self->_handledNicknames = v5;
  }
  if (!self->_archivedNicknames)
  {
    id v7 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    archivedNicknames = self->_archivedNicknames;
    self->_archivedNicknames = v7;
  }
  if (IMOSLoggingEnabled())
  {
    char v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:0x7FFFFFFFLL];
      int v32 = 138412290;
      __int16 v33 = v10;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Limit to load of nicknames %@", (uint8_t *)&v32, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Setting the IMDNicknameController scrutiny flag", (uint8_t *)&v32, 2u);
    }
  }
  [(IMDNicknameController *)self _setUnderScrutiny:1];
  id v12 = self->_pendingNicknameUpdates;
  uint64_t v13 = [(IMDNicknameController *)self pendingNicknameUpdatesKVStore];
  BOOL v14 = [(IMDNicknameController *)self _populateNicknameDictionary:v12 forKVStore:v13 limitToLoad:0x7FFFFFFFLL];

  int v15 = self->_handledNicknames;
  id v16 = [(IMDNicknameController *)self handledNicknamesKVStore];
  BOOL v17 = [(IMDNicknameController *)self _populateNicknameDictionary:v15 forKVStore:v16 limitToLoad:0x7FFFFFFFLL];

  __int16 v18 = self->_archivedNicknames;
  id v19 = [(IMDNicknameController *)self archivedNicknamesKVStore];
  BOOL v20 = [(IMDNicknameController *)self _populateNicknameDictionary:v18 forKVStore:v19 limitToLoad:0x7FFFFFFFLL];

  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Clearing the IMDNicknameController scrutiny flag", (uint8_t *)&v32, 2u);
    }
  }
  [(IMDNicknameController *)self _setUnderScrutiny:0];
  if ((!v14 || !v17 || !v20) && IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = @"NO";
      if (v17) {
        id v24 = @"YES";
      }
      else {
        id v24 = @"NO";
      }
      if (v14) {
        id v25 = @"YES";
      }
      else {
        id v25 = @"NO";
      }
      int v32 = 138412802;
      __int16 v33 = v24;
      __int16 v34 = 2112;
      id v35 = v25;
      if (v20) {
        __int16 v23 = @"YES";
      }
      __int16 v36 = 2112;
      id v37 = v23;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "We did not have success loading handled nicknames %@ - updates %@ - archived %@", (uint8_t *)&v32, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = self->_pendingNicknameUpdates;
      int v32 = 138412290;
      __int16 v33 = v27;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Created pending nickname map %@", (uint8_t *)&v32, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      char v29 = self->_handledNicknames;
      int v32 = 138412290;
      __int16 v33 = v29;
      _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Created handled nickname map %@", (uint8_t *)&v32, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      int v31 = self->_archivedNicknames;
      int v32 = 138412290;
      __int16 v33 = v31;
      _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Created archived nickname map %@", (uint8_t *)&v32, 0xCu);
    }
  }
}

- (void)loadHandledTransitioned
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_handleTransitionedList)
  {
    BOOL v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    handleTransitionedList = self->_handleTransitionedList;
    self->_handleTransitionedList = v3;
  }
  id v5 = [(IMDNicknameController *)self nicknameRecordsKVStore];
  id v23 = 0;
  id v6 = [v5 dataForKey:@"handleTransitionedList" error:&v23];
  id v7 = v23;

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = (uint64_t)v7;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the handle transitioned list data store %@", buf, 0xCu);
      }
    }
  }
  else
  {
    char v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    if (v6)
    {
      id v22 = 0;
      BOOL v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v13 fromData:v6 error:&v22];
      id v15 = v22;
      if (v15 && IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = (uint64_t)v15;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive transitioned list %@", buf, 0xCu);
        }
      }
      BOOL v17 = [(IMDNicknameController *)self handleTransitionedList];
      [v17 unionSet:v14];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "No transitioned list data to load", buf, 2u);
        }
      }
      BOOL v14 = 0;
      id v15 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        BOOL v20 = [(IMDNicknameController *)self handleTransitionedList];
        uint64_t v21 = [v20 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = v21;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Successfully loaded %lu transitioned list handles", buf, 0xCu);
      }
    }
  }
}

- (id)loadListForKey:(id)a3 list:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)a4;
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  char v9 = [(IMDNicknameController *)self nicknameRecordsKVStore];
  id v25 = 0;
  uint64_t v10 = [v9 dataForKey:v6 error:&v25];
  id v11 = v25;

  if (v11)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_8:
      id v13 = v8;
      goto LABEL_9;
    }
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = (uint64_t)v11;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the data store %@", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (!v10)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_8;
    }
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "No list data to load", buf, 2u);
    }
    goto LABEL_7;
  }
  id v15 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v16 = objc_opt_class();
  id v24 = 0;
  BOOL v17 = [v15 unarchivedDictionaryWithKeysOfClass:v16 objectsOfClass:objc_opt_class() fromData:v10 error:&v24];
  id v18 = v24;
  if (v18)
  {
    id v19 = v18;
    if (IMOSLoggingEnabled())
    {
      BOOL v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = (uint64_t)v19;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive list %@", buf, 0xCu);
      }
    }
    id v13 = v8;
  }
  else
  {
    uint64_t v21 = (void *)[v17 mutableCopy];

    [v21 addEntriesFromDictionary:Mutable];
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = [v21 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v27 = v23;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Successfully loaded %lu list handles", buf, 0xCu);
      }
    }
    id v13 = v21;
  }
LABEL_9:

  return v13;
}

- (void)loadSharingHandlesPrefs
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!self->_handleAllowList)
  {
    BOOL v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    handleAllowList = self->_handleAllowList;
    self->_handleAllowList = v3;
  }
  if (!self->_handleDenyList)
  {
    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    handleDenyList = self->_handleDenyList;
    self->_handleDenyList = v5;
  }
  id v7 = [(IMDNicknameController *)self handleSharingKVStore];
  id v37 = 0;
  uint64_t v8 = [v7 dataForKey:@"handleWhitelist" error:&v37];
  id v9 = v37;

  if (!v9)
  {
    id v11 = [(IMDNicknameController *)self handleSharingKVStore];
    id v36 = 0;
    uint64_t v12 = [v11 dataForKey:@"handleBlacklist" error:&v36];
    id v9 = v36;

    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v39 = (uint64_t)v9;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the handle deny list data store %@", buf, 0xCu);
        }
      }
LABEL_43:

      goto LABEL_44;
    }
    BOOL v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    id v18 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
    if (v8)
    {
      id v35 = 0;
      __int16 v33 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v18 fromData:v8 error:&v35];
      id v19 = v35;
      if (v19 && IMOSLoggingEnabled())
      {
        BOOL v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v39 = (uint64_t)v19;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive allow list %@", buf, 0xCu);
        }
      }
      uint64_t v21 = [(IMDNicknameController *)self handleAllowList];
      [v21 unionSet:v33];

      if (v12)
      {
LABEL_22:
        id v34 = v19;
        id v22 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v18 fromData:v12 error:&v34];
        id v23 = v34;

        if (v23 && IMOSLoggingEnabled())
        {
          id v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = (uint64_t)v23;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive deny list %@", buf, 0xCu);
          }
        }
        id v25 = [(IMDNicknameController *)self handleDenyList];
        [v25 unionSet:v22];

LABEL_38:
        if (IMOSLoggingEnabled())
        {
          uint64_t v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            char v29 = [(IMDNicknameController *)self handleAllowList];
            uint64_t v30 = [v29 count];
            int v31 = [(IMDNicknameController *)self handleDenyList];
            uint64_t v32 = [v31 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v39 = v30;
            __int16 v40 = 2048;
            uint64_t v41 = v32;
            _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Successfully loaded %lu allow list handles %lu deny list handles", buf, 0x16u);
          }
        }

        goto LABEL_43;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "No allow list data to load", buf, 2u);
        }
      }
      __int16 v33 = 0;
      id v19 = 0;
      if (v12) {
        goto LABEL_22;
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "No deny list data to load", buf, 2u);
      }
    }
    id v22 = 0;
    id v23 = v19;
    goto LABEL_38;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = (uint64_t)v9;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the handle allow list data store %@", buf, 0xCu);
    }
  }
LABEL_44:
}

- (void)loadUnknownSenderRecordInfoFromKVStore
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!self->_unknownSenderRecordInfo)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    unknownSenderRecordInfo = self->_unknownSenderRecordInfo;
    self->_unknownSenderRecordInfo = Mutable;
  }
  id v5 = [(IMDNicknameController *)self unknownSenderRecordInfoKVStore];
  id v27 = 0;
  id v25 = [v5 dataForKey:@"unknownSenderRecordInfoKey" error:&v27];
  id v6 = v27;

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = (uint64_t)v6;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Nicknames - We got an error loading the unknown sender payload data store %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v24, "setWithObjects:", v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    if (v25)
    {
      id v26 = 0;
      uint64_t v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v16 fromData:v25 error:&v26];
      id v18 = v26;
      if (v18 && IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v29 = (uint64_t)v18;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Nicknames - Failed to unarchive unknown sender payloads list %@", buf, 0xCu);
        }
      }
      [(NSMutableDictionary *)self->_unknownSenderRecordInfo addEntriesFromDictionary:v17];
    }
    else if (IMOSLoggingEnabled())
    {
      BOOL v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "No unknown sender info payloads data to load", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = [(IMDNicknameController *)self unknownSenderRecordInfo];
        uint64_t v23 = [v22 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v29 = v23;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Successfully loaded %lu unknown sender payload list handles", buf, 0xCu);
      }
    }
  }
}

- (BOOL)_populateNicknameDictionary:(id)a3 forKVStore:(id)a4 limitToLoad:(unint64_t)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v32 = 0;
  id v23 = a4;
  id v24 = [v23 datasUpToLimit:a5 deleteContext:0 error:&v32];
  id v25 = v32;
  if (v25)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v25;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "We got an error loading the nicknames data store %@", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = v24;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v29;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * v11);
          uint64_t v13 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v14 = IMNicknameUnarchivingClasses();
          id v27 = 0;
          uint64_t v15 = [v13 _strictlyUnarchivedObjectOfClasses:v14 fromData:v12 error:&v27];
          id v16 = v27;

          if (v15) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17)
          {
            id v19 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v15];
            BOOL v20 = [v19 handle];

            if (v20)
            {
              uint64_t v21 = [v19 handle];
              [v26 setObject:v15 forKey:v21];
            }
            else
            {
              uint64_t v21 = IMLogHandleForCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v34 = v19;
                _os_log_error_impl(&dword_1D967A000, v21, OS_LOG_TYPE_ERROR, "Nickname does not have a handle %@", buf, 0xCu);
              }
            }
          }
          else if (IMOSLoggingEnabled())
          {
            id v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v34 = v16;
              __int16 v35 = 2112;
              id v36 = v8;
              _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "We had an error %@ unarchiving data %@", buf, 0x16u);
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v9);
    }
  }
  return v25 == 0;
}

- (void)_makeAllNicknameContentsClassC
{
  v28[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(IMDNicknameController *)self defaults];
  uint64_t v19 = *MEMORY[0x1E4F6DDD0];
  uint64_t v20 = *MEMORY[0x1E4F6DE00];
  char v3 = objc_msgSend(v2, "getBoolFromDomain:forKey:");

  if ((v3 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Converting all nickname contents to Class C!", buf, 2u);
      }
    }
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = (void *)*MEMORY[0x1E4F6DDD8];
    id v7 = [v5 enumeratorAtPath:*MEMORY[0x1E4F6DDD8]];

    id v8 = [v7 nextObject];
    if (v8)
    {
      uint64_t v9 = *MEMORY[0x1E4F28370];
      uint64_t v10 = *MEMORY[0x1E4F28358];
      do
      {
        uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v27 = v9;
        v28[0] = v10;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        uint64_t v13 = [v6 stringByAppendingPathComponent:v8];
        id v22 = 0;
        char v14 = [v11 setAttributes:v12 ofItemAtPath:v13 error:&v22];
        id v15 = v22;

        if ((v14 & 1) == 0 && IMOSLoggingEnabled())
        {
          id v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v24 = v8;
            __int16 v25 = 2112;
            id v26 = v15;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Failed making file class C: %@ with error %@", buf, 0x16u);
          }
        }
        uint64_t v17 = [v7 nextObject];

        id v8 = (void *)v17;
      }
      while (v17);
    }
    id v18 = [(IMDNicknameController *)self defaults];
    [v18 setBool:1 forDomain:v20 forKey:v19];
  }
}

- (void)_storePublicNickname:(id)a3 nicknameLocation:(id)a4 encryptionKey:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v42 = a6;
  id v41 = a7;
  id v39 = a8;
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v47 = (uint64_t)v14;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v15;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Storing personal nickname %@ and recordID %@ on disk", buf, 0x16u);
    }
  }
  id v18 = objc_msgSend(v15, "dataUsingEncoding:", 4, v39);
  uint64_t v19 = [v14 dataRepresentation];
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [v19 length];
      uint64_t v22 = [v18 length];
      uint64_t v23 = [v16 length];
      *(_DWORD *)buf = 134218496;
      uint64_t v47 = v21;
      __int16 v48 = 2048;
      uint64_t v49 = v22;
      __int16 v50 = 2048;
      uint64_t v51 = v23;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Writing nickname data of size %lu, recordID data of size %lu, and encryption key of size %lu to disk", buf, 0x20u);
    }
  }
  if (v19)
  {
    id v24 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
    id v45 = 0;
    [v24 persistData:v18 forKey:@"NicknameRecordID" error:&v45];
    unint64_t v25 = (unint64_t)v45;

    id v26 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
    id v44 = 0;
    [v26 persistData:v16 forKey:@"NicknameRecordKey" error:&v44];
    unint64_t v27 = (unint64_t)v44;

    long long v28 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
    id v43 = 0;
    [v28 persistData:v19 forKey:@"NicknameDataKey" error:&v43];
    id v29 = v43;

    long long v30 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
    [v30 persistData:v42 forKey:@"NicknameWallpaperDataTag" error:0];

    long long v31 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
    [v31 persistData:v41 forKey:@"NicknameLowResWallpaperDataTag" error:0];

    id v32 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
    [v32 persistData:v40 forKey:@"NicknameWallpaperMetadataTag" error:0];

    if (v25 | v27)
    {
      __int16 v33 = IMLogHandleForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1D99024C8();
      }

      id v34 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
      [v34 persistData:0 forKey:@"NicknameRecordKey" error:0];

      __int16 v35 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
      [v35 persistData:0 forKey:@"NicknameRecordID" error:0];
    }
    if (v29)
    {
      id v36 = IMLogHandleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1D9902460();
      }

      id v37 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
      [v37 persistData:0 forKey:@"NicknameDataKey" error:0];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "Personal nickname data is nil, not writing to disk", buf, 2u);
      }
    }
    unint64_t v25 = 0;
    unint64_t v27 = 0;
    id v29 = 0;
  }
}

- (void)_storePendingNicknameForUpload:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Storing pending nickname %@ while waiting on upload", buf, 0xCu);
    }
  }
  id v6 = [v4 dataRepresentation];
  if (v6)
  {
    id v7 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
    id v11 = 0;
    [v7 persistData:v6 forKey:@"NicknamePendingKey" error:&v11];
    id v8 = v11;

    if (v8)
    {
      uint64_t v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1D9902530();
      }

      uint64_t v10 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
      [v10 persistData:0 forKey:@"NicknamePendingKey" error:0];
    }
  }
}

- (id)_getPendingNicknameForUpload
{
  unint64_t v2 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v15 = 0;
  char v3 = [v2 dataForKey:@"NicknamePendingKey" error:&v15];
  id v4 = v15;

  if (v4)
  {

    char v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1D9902600();
    }
LABEL_4:
    id v5 = 0;
    goto LABEL_11;
  }
  if (![v3 length])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "storedPersonalNickname is nil", buf, 2u);
      }
    }
    goto LABEL_4;
  }
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v14 = 0;
  id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v3 error:&v14];
  id v9 = v14;
  if (v9)
  {

    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D9902598();
    }

    id v5 = 0;
  }

LABEL_11:

  return v5;
}

- (void)_deletePendingNicknameForUpload
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v5 = 0;
  [v2 persistData:0 forKey:@"NicknamePendingKey" error:&v5];
  id v3 = v5;

  if (v3 && IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Error deleting data from kvStore %@", buf, 0xCu);
    }
  }
}

- (void)_deletePublicNicknameLocationAndKey
{
  id v3 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v21 = 0;
  [v3 persistData:0 forKey:@"NicknameRecordID" error:&v21];
  id v4 = v21;

  id v5 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v20 = v4;
  [v5 persistData:0 forKey:@"NicknameRecordKey" error:&v20];
  id v6 = v20;

  id v7 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v19 = v6;
  [v7 persistData:0 forKey:@"NicknameDataKey" error:&v19];
  id v8 = v19;

  id v9 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v18 = v8;
  [v9 persistData:0 forKey:@"NicknameWallpaperDataTag" error:&v18];
  id v10 = v18;

  id v11 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v17 = v10;
  [v11 persistData:0 forKey:@"NicknameLowResWallpaperDataTag" error:&v17];
  id v12 = v17;

  id v13 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v16 = v12;
  [v13 persistData:0 forKey:@"NicknameWallpaperMetadataTag" error:&v16];
  id v14 = v16;

  [(IMDNicknameController *)self setPersonalNickname:0];
  if (v14)
  {
    id v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1D9902668();
    }
  }
}

- (id)nickNameDecryptionKey
{
  unint64_t v2 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v7 = 0;
  id v3 = [v2 dataForKey:@"NicknameRecordKey" error:&v7];
  id v4 = v7;

  if (v4)
  {

    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D99026D0();
    }

    id v3 = 0;
  }

  return v3;
}

- (id)wallpaperDataTag
{
  unint64_t v2 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v7 = 0;
  id v3 = [v2 dataForKey:@"NicknameWallpaperDataTag" error:&v7];
  id v4 = v7;

  if (v4)
  {

    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D9902738();
    }

    id v3 = 0;
  }

  return v3;
}

- (id)lowResWallpaperDataTag
{
  unint64_t v2 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v7 = 0;
  id v3 = [v2 dataForKey:@"NicknameLowResWallpaperDataTag" error:&v7];
  id v4 = v7;

  if (v4)
  {

    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D99027A0();
    }

    id v3 = 0;
  }

  return v3;
}

- (id)wallpaperMetadataTag
{
  unint64_t v2 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v7 = 0;
  id v3 = [v2 dataForKey:@"NicknameWallpaperMetadataTag" error:&v7];
  id v4 = v7;

  if (v4)
  {

    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D9902808();
    }

    id v3 = 0;
  }

  return v3;
}

- (id)nickNameRecordID
{
  unint64_t v2 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v8 = 0;
  id v3 = [v2 dataForKey:@"NicknameRecordID" error:&v8];
  id v4 = v8;

  if (v3)
  {
    id v5 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = 0;
    if (!v4) {
      goto LABEL_8;
    }
  }

  id v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1D99026D0();
  }

  id v5 = 0;
LABEL_8:

  return v5;
}

- (id)storedPersonalNickname
{
  id v3 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v21 = 0;
  id v4 = [v3 dataForKey:@"NicknameDataKey" error:&v21];
  id v5 = v21;

  if (v5)
  {

    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1D9902870();
    }

    id v7 = [v5 description];
    [(IMDNicknameController *)self _showDebugAlertWithHeader:@"Error Loading Personal Nickname From Disk" message:v7];

LABEL_5:
    id v8 = 0;
    goto LABEL_29;
  }
  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Stored personal nickname doesn't exist", buf, 2u);
      }
    }
    if ([(IMDNicknameController *)self _isNicknamesSharingEnabled]) {
      [(IMDNicknameController *)self _showDebugAlertWithHeader:@"No Personal Nickname On Disk" message:0];
    }
    goto LABEL_5;
  }
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v19 = 0;
  id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v11 fromData:v4 error:&v19];
  id v12 = v19;
  if (v12)
  {

    id v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1D9902598();
    }
    id v8 = 0;
    goto LABEL_19;
  }
  if (v8)
  {
    id v13 = [v8 description];
    [(IMDNicknameController *)self _showDebugAlertWithHeader:@"Loaded Personal Nickname From Disk" message:v13];
LABEL_19:
  }
  id v15 = [v8 recordID];

  if (!v15)
  {
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Nickname loaded from disk did not have a recordID. Attempting to load recordID from disk.", buf, 2u);
      }
    }
    id v17 = [(IMDNicknameController *)self nickNameRecordID];
    if (v17) {
      [v8 setRecordID:v17];
    }
  }
LABEL_29:

  return v8;
}

- (id)pendingPersonalNickname
{
  unint64_t v2 = [(IMDNicknameController *)self cloudkitRecordsKVStore];
  id v13 = 0;
  id v3 = [v2 dataForKey:@"NicknamePendingKey" error:&v13];
  id v4 = v13;

  if (v4)
  {

    id v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1D9902940();
    }
    id v5 = 0;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v12 = 0;
    id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v3 error:&v12];
    id v9 = v12;
    if (v9)
    {

      uint64_t v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1D99028D8();
      }

      id v5 = 0;
    }
  }

  return v5;
}

- (void)_deleteAvatarForNickname:(id)a3
{
  id v3 = [a3 avatar];
  id v4 = [v3 imageFilePath];

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = 0;
  [v5 removeItemAtPath:v4 error:&v8];
  id v6 = v8;

  if (v6)
  {
    uint64_t v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D99029A8();
    }
  }
}

- (id)allNicknames
{
  id v3 = [(IMDNicknameController *)self handledNicknames];
  id v4 = [v3 allValues];

  id v5 = [(IMDNicknameController *)self pendingNicknameUpdates];
  id v6 = [v5 allValues];

  uint64_t v7 = [(IMDNicknameController *)self archivedNicknames];
  id v8 = [v7 allValues];

  id v9 = [v6 arrayByAddingObjectsFromArray:v4];
  uint64_t v10 = [v9 arrayByAddingObjectsFromArray:v8];

  return v10;
}

- (id)nicknameForRecordID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(IMDNicknameController *)self allNicknames];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          uint64_t v10 = [v9 recordID];
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {

            goto LABEL_20;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Did not find nickname for recordID %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Passed in empty recordID", buf, 2u);
    }
  }
  id v9 = 0;
LABEL_20:

  return v9;
}

- (id)nicknameForRecordID:(id)a3 handle:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = [(IMDNicknameController *)self nicknameForHandle:v7];
    id v9 = v8;
    if (v8
      && ([v8 recordID],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v6 isEqualToString:v10],
          v10,
          v11))
    {
      id v12 = v9;
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Found existing nickname", (uint8_t *)&v16, 2u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412290;
          id v17 = v7;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "No nickname for handle %@", (uint8_t *)&v16, 0xCu);
        }
      }
      id v12 = 0;
    }
  }
  else
  {
    id v12 = [(IMDNicknameController *)self nicknameForRecordID:v6];
  }

  return v12;
}

- (id)nicknameForHandleURI:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "I'm being asked for handleURI %@", (uint8_t *)&v9, 0xCu);
    }
  }
  id v6 = [v4 _stripFZIDPrefix];

  id v7 = [(IMDNicknameController *)self nicknameForHandle:v6];

  return v7;
}

- (id)nicknameForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDNicknameController *)self pendingNicknameUpdates];
  id v6 = [v5 objectForKey:v4];

  if (v6
    || ([(IMDNicknameController *)self handledNicknames],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKey:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)substringRecordIDForNickname:(id)a3
{
  id v3 = a3;
  id v4 = [v3 recordID];
  unint64_t v5 = [v4 length];

  if (v5 < 5)
  {
    id v7 = &stru_1F3398578;
  }
  else
  {
    id v6 = [v3 recordID];
    id v7 = [v6 substringToIndex:3];
  }

  return v7;
}

- (id)transferServicesController
{
  return (id)[MEMORY[0x1E4F6EBF8] sharedInstance];
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "System did leave first unlock, loading maps into memory", v4, 2u);
    }
  }
  [(IMDNicknameController *)self _loadAllInfoFromDiskIfAble];
}

- (void)markAllNicknamesAsPending
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(IMDNicknameController *)self loadNicknamesFromKVStore];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(IMDNicknameController *)self handledNicknames];
  id v4 = [v3 allKeys];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        id v10 = [(IMDNicknameController *)self handledNicknames];
        uint64_t v11 = [v10 objectForKey:v9];

        id v12 = (void *)[objc_alloc(MEMORY[0x1E4F6E8B8]) initWithDictionaryRepresentation:v11];
        [(IMDNicknameController *)self _deleteHandleIDFromHandledMap:v9];
        [v12 setRecordID:@"FakeID"];
        [v12 setFirstName:@"First"];
        [v12 setLastName:@"Last"];
        [(IMDNicknameController *)self addNicknameToPendingUpdates:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (IMNickname)personalNickname
{
  return self->_personalNickname;
}

- (NSMutableDictionary)unknownSenderRecordInfo
{
  return self->_unknownSenderRecordInfo;
}

- (void)setUnknownSenderRecordInfo:(id)a3
{
}

- (IDSKVStore)cloudkitRecordsKVStore
{
  return self->_cloudkitRecordsKVStore;
}

- (void)setCloudkitRecordsKVStore:(id)a3
{
}

- (double)lastMeContactStoreSync
{
  return self->_lastMeContactStoreSync;
}

- (void)setLastMeContactStoreSync:(double)a3
{
  self->_lastMeContactStoreSync = a3;
}

- (IDSKVStore)pendingNicknameUpdatesKVStore
{
  return self->_pendingNicknameUpdatesKVStore;
}

- (void)setPendingNicknameUpdatesKVStore:(id)a3
{
}

- (IDSKVStore)handledNicknamesKVStore
{
  return self->_handledNicknamesKVStore;
}

- (void)setHandledNicknamesKVStore:(id)a3
{
}

- (IDSKVStore)archivedNicknamesKVStore
{
  return self->_archivedNicknamesKVStore;
}

- (void)setArchivedNicknamesKVStore:(id)a3
{
}

- (IDSKVStore)unknownSenderRecordInfoKVStore
{
  return self->_unknownSenderRecordInfoKVStore;
}

- (void)setUnknownSenderRecordInfoKVStore:(id)a3
{
}

- (IDSKVStore)handleSharingKVStore
{
  return self->_handleSharingKVStore;
}

- (void)setHandleSharingKVStore:(id)a3
{
}

- (IDSKVStore)nicknameRecordsKVStore
{
  return self->_nicknameRecordsKVStore;
}

- (void)setNicknameRecordsKVStore:(id)a3
{
}

- (void)setPendingNicknameUpdates:(id)a3
{
}

- (NSMutableSet)handleTransitionedList
{
  return self->_handleTransitionedList;
}

- (void)setHandleTransitionedList:(id)a3
{
}

- (NSMutableDictionary)activeNicknameRecords
{
  return self->_activeNicknameRecords;
}

- (void)setActiveNicknameRecords:(id)a3
{
}

- (NSMutableDictionary)ignoredNicknameRecords
{
  return self->_ignoredNicknameRecords;
}

- (void)setIgnoredNicknameRecords:(id)a3
{
}

- (void)setHandledNicknames:(id)a3
{
}

- (void)setArchivedNicknames:(id)a3
{
}

- (void)setHandleAllowList:(id)a3
{
}

- (void)setHandleDenyList:(id)a3
{
}

- (BOOL)needToLoadMapsInfoFromDisk
{
  return self->_needToLoadMapsInfoFromDisk;
}

- (void)setNeedToLoadMapsInfoFromDisk:(BOOL)a3
{
  self->_needToLoadMapsInfoFromDisuint64_t k = a3;
}

- (NSMutableArray)chatsToSendNicknameInfoTo
{
  return self->_chatsToSendNicknameInfoTo;
}

- (void)setChatsToSendNicknameInfoTo:(id)a3
{
}

- (BOOL)nicknameIsUploadingToCK
{
  return self->_nicknameIsUploadingToCK;
}

- (void)setNicknameIsUploadingToCK:(BOOL)a3
{
  self->_nicknameIsUploadingToCK = a3;
}

- (IDSService)nicknameService
{
  return self->_nicknameService;
}

- (void)setNicknameService:(id)a3
{
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (void)setCallHistoryManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_storeStrong((id *)&self->_nicknameService, 0);
  objc_storeStrong((id *)&self->_chatsToSendNicknameInfoTo, 0);
  objc_storeStrong((id *)&self->_handleDenyList, 0);
  objc_storeStrong((id *)&self->_handleAllowList, 0);
  objc_storeStrong((id *)&self->_archivedNicknames, 0);
  objc_storeStrong((id *)&self->_handledNicknames, 0);
  objc_storeStrong((id *)&self->_ignoredNicknameRecords, 0);
  objc_storeStrong((id *)&self->_activeNicknameRecords, 0);
  objc_storeStrong((id *)&self->_handleTransitionedList, 0);
  objc_storeStrong((id *)&self->_pendingNicknameUpdates, 0);
  objc_storeStrong((id *)&self->_nicknameRecordsKVStore, 0);
  objc_storeStrong((id *)&self->_handleSharingKVStore, 0);
  objc_storeStrong((id *)&self->_unknownSenderRecordInfoKVStore, 0);
  objc_storeStrong((id *)&self->_archivedNicknamesKVStore, 0);
  objc_storeStrong((id *)&self->_handledNicknamesKVStore, 0);
  objc_storeStrong((id *)&self->_pendingNicknameUpdatesKVStore, 0);
  objc_storeStrong((id *)&self->_cloudkitRecordsKVStore, 0);
  objc_storeStrong((id *)&self->_unknownSenderRecordInfo, 0);

  objc_storeStrong((id *)&self->_personalNickname, 0);
}

@end