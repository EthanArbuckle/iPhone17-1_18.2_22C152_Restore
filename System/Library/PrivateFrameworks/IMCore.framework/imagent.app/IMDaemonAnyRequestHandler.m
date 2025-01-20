@interface IMDaemonAnyRequestHandler
- (BOOL)_clientCapabilitiesSupportAccounts:(unint64_t)a3;
- (BOOL)_shouldContinueDownloadingPurgedAttachments:(unint64_t)a3;
- (IMDaemonAnyRequestHandler)init;
- (NSMutableDictionary)downloadingCountDictionary;
- (id)_pinnedChatIdentifiersFromContext:(id)a3;
- (id)_setupInfoForCapabilities:(unint64_t)a3 context:(id)a4;
- (id)valueOfPersistentProperty:(id)a3;
- (id)valueOfProperty:(id)a3;
- (int64_t)_numberOfChatsToLoadDuringInitialSetupFromContext:(id)a3;
- (int64_t)_precacheChatCountWithCapabilities:(unint64_t)a3;
- (unint64_t)_broadcastedUncachedAttachmentCountForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 services:(id)a5 broadcaster:(id)a6;
- (void)_addAccountsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addApprovedCapabilitiesToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addChatCountsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addChatsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addGroupPhotoTransfersToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addKeyTransparencyToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_addTransfersToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5;
- (void)_cacheChatsWithPinningIdentifiers:(id)a3;
- (void)_downloadPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 retryCount:(unint64_t)a7 broadcaster:(id)a8;
- (void)_initiateScreenSharingWithID:(id)a3 isContact:(BOOL)a4 sharingMyScreen:(BOOL)a5;
- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4;
- (void)allowHandleIDsForNicknameSharing:(id)a3 onChatGUIDs:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6;
- (void)askHandleIDToShareTheirScreen:(id)a3 isContact:(BOOL)a4;
- (void)clearPendingNicknamePhotoUpdateForHandleIDs:(id)a3;
- (void)clearPendingNicknameUpdatesForHandleIDs:(id)a3;
- (void)conference:(id)a3 account:(id)a4 notifyInvitationCancelledFromPerson:(id)a5;
- (void)consumeCodeWithMessageGUID:(id)a3;
- (void)denyHandleIDsForNicknameSharing:(id)a3;
- (void)downloadPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6;
- (void)downloadStickerPackWithGUID:(id)a3 isIncomingMessage:(BOOL)a4 ignoreCache:(BOOL)a5;
- (void)downloadStickerWithGUID:(id)a3;
- (void)eagerUploadCancel:(id)a3;
- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4;
- (void)fetchActiveNicknamesWithReply:(id)a3;
- (void)fetchAutoDeletionPreferenceWithReply:(id)a3;
- (void)fetchGroupPhotoPathsForChatsWithGroupIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchHandleSharingStateWithReply:(id)a3;
- (void)fetchIgnoredNicknameHandlesWithReply:(id)a3;
- (void)fetchNicknamesWithReply:(id)a3;
- (void)fetchPersonalNicknameWithReply:(id)a3;
- (void)fetchTransitionedNicknameHandlesWithReply:(id)a3;
- (void)fetchUnknownSenderRecordsWithReply:(id)a3;
- (void)fetchiCloudAccountStatusWithReply:(id)a3;
- (void)forceReloadChatRegistryWithQueryID:(id)a3;
- (void)holdBuddyUpdatesAccount:(id)a3;
- (void)ignorePendingNicknameUpdatesForHandleIDs:(id)a3;
- (void)initiateQuickSwitch;
- (void)inviteHandleIDToShareMyScreen:(id)a3 isContact:(BOOL)a4;
- (void)locationUpdateDelivered:(id)a3;
- (void)locationUpdateSent;
- (void)markAllNicknamesAsPending;
- (void)markMessageAsReadWithGUID:(id)a3 callerOrigin:(int64_t)a4 reply:(id)a5;
- (void)markNicknamesAsTransitionedForHandleIDs:(id)a3 isAutoUpdate:(BOOL)a4;
- (void)markPlayedForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6;
- (void)markPlayedForMessageGUID:(id)a3;
- (void)markProfileRecords:(id)a3 asActive:(BOOL)a4;
- (void)markProfileRecordsAsIgnored:(id)a3;
- (void)markReadForMessageGUID:(id)a3 callerOrigin:(int64_t)a4 queryID:(id)a5;
- (void)markUnreadForMessageGUID:(id)a3 IDs:(id)a4 style:(unsigned __int8)a5 services:(id)a6;
- (void)nicknamePreferencesDidChange;
- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 reply:(id)a4;
- (void)onboardDeleteVerificationCodesIfNeededWithReply:(id)a3;
- (void)openStewieChatWithContext:(id)a3;
- (void)playSendSoundForMessageGUID:(id)a3 callerOrigin:(int64_t)a4;
- (void)preWarm;
- (void)processReceivedEmergencyMessageFromIMTool:(int64_t)a3 message:(id)a4;
- (void)requestBuddyPicturesAndPropertiesForAccount:(id)a3;
- (void)requestGroupsAccount:(id)a3;
- (void)requestNetworkDataAvailability;
- (void)requestOneTimeCodeStatus;
- (void)requestPendingACInvites;
- (void)requestPendingVCInvites;
- (void)requestProperty:(id)a3 ofPerson:(id)a4 account:(id)a5;
- (void)requestQOSClassWhileServicingRequestsWithID:(id)a3;
- (void)requestSetupWithClientID:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 reply:(id)a6;
- (void)requestSetupXPCObjectWithClientID:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 reply:(id)a6;
- (void)resumeBuddyUpdatesAccount:(id)a3;
- (void)sendClearNotice:(id)a3 toHandles:(id)a4 reply:(id)a5;
- (void)sendEmergencyQuestionnaire:(id)a3;
- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4;
- (void)sendNotice:(id)a3 toHandles:(id)a4 fromHandle:(id)a5 reply:(id)a6;
- (void)sendNotificationMessageToUniqueID:(id)a3 withCommand:(int64_t)a4;
- (void)sendQuestionnaire:(id)a3;
- (void)setAutoDeletionPreference:(BOOL)a3;
- (void)setNewPersonalNickname:(id)a3;
- (void)setValue:(id)a3 ofPersistentProperty:(id)a4;
- (void)setValue:(id)a3 ofProperty:(id)a4;
- (void)setValue:(id)a3 ofProperty:(id)a4 ofPerson:(id)a5 account:(id)a6;
- (void)simulateOneTimeCodeArriving:(id)a3;
- (void)startWatchingBuddy:(id)a3 account:(id)a4;
- (void)stopWatchingBuddy:(id)a3 account:(id)a4;
- (void)terminateForcingIfNeeded:(BOOL)a3;
@end

@implementation IMDaemonAnyRequestHandler

- (IMDaemonAnyRequestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDaemonAnyRequestHandler;
  v2 = [(IMDaemonAnyRequestHandler *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    downloadingCountDictionary = v2->_downloadingCountDictionary;
    v2->_downloadingCountDictionary = v3;
  }
  return v2;
}

- (int64_t)_numberOfChatsToLoadDuringInitialSetupFromContext:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005D60;
  v6[3] = &unk_100071840;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_addGroupPhotoTransfersToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  int v5 = a4;
  objc_super v6 = (__CFDictionary *)a3;
  if ((v5 & 0x1000000) != 0)
  {
    uint64_t v7 = +[IMDFileTransferCenter sharedInstance];
    v8 = [v7 _allFileTransfers];

    uint64_t v9 = [v8 allValues];
    if ([v9 count])
    {
      v22 = v8;
      theDict = v6;
      v24 = +[NSMutableDictionary dictionary];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v21 = v9;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v26;
        uint64_t v14 = IMFileTransferFilenameKey;
        uint64_t v15 = IMFileTransferGroupPhotoName;
        uint64_t v16 = IMFileTransferGUIDKey;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v19 = objc_msgSend(v18, "valueForKey:", v14, v21);
            if ([v19 containsString:v15])
            {
              v20 = [v18 valueForKey:v16];
              if (v20) {
                [v24 setValue:v18 forKey:v20];
              }
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v12);
      }

      objc_super v6 = theDict;
      if ([v24 count] && v24) {
        CFDictionarySetValue(theDict, IMSetupInfoGroupPhotoFileTransfersKey, v24);
      }

      uint64_t v9 = v21;
      v8 = v22;
    }
  }
}

- (void)_cacheChatsWithPinningIdentifiers:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v15;
    *(void *)&long long v5 = 134218242;
    long long v13 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v7);
        uint64_t v9 = +[IMDChatRegistry sharedInstance];
        id v10 = [v9 existingChatsWithPinningIdentifier:v8];

        if (IMOSLoggingEnabled())
        {
          id v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            id v12 = [v10 count];
            *(_DWORD *)buf = v13;
            id v19 = v12;
            __int16 v20 = 2112;
            uint64_t v21 = v8;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found %llu pinned chats for pinning identifier %@", buf, 0x16u);
          }
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)requestNetworkDataAvailability
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "requesting network data availability", v6, 2u);
    }
  }
  id v3 = +[IMDBroadcastController sharedProvider];
  id v4 = [v3 broadcasterForAllListeners];
  long long v5 = +[IMDAccountController sharedAccountController];
  objc_msgSend(v4, "networkDataAvailabilityChanged:", objc_msgSend(v5, "networkDataAvailable"));
}

- (id)_pinnedChatIdentifiersFromContext:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000083E8;
  v7[3] = &unk_100071868;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v4 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = [v4 copy];

  return v5;
}

- (id)_setupInfoForCapabilities:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [(IMDaemonAnyRequestHandler *)self _addAccountsToSetupInfo:v7 capabilities:a3 context:v6];
  [(IMDaemonAnyRequestHandler *)self _addGroupPhotoTransfersToSetupInfo:v7 capabilities:a3 context:v6];
  [(IMDaemonAnyRequestHandler *)self _addTransfersToSetupInfo:v7 capabilities:a3 context:v6];
  [(IMDaemonAnyRequestHandler *)self _addChatCountsToSetupInfo:v7 capabilities:a3 context:v6];
  [(IMDaemonAnyRequestHandler *)self _addChatsToSetupInfo:v7 capabilities:a3 context:v6];
  [(IMDaemonAnyRequestHandler *)self _addKeyTransparencyToSetupInfo:v7 capabilities:a3 context:v6];
  [(IMDaemonAnyRequestHandler *)self _addApprovedCapabilitiesToSetupInfo:v7 capabilities:a3 context:v6];

  return v7;
}

- (void)requestSetupWithClientID:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 reply:(id)a6
{
  id v8 = _Block_copy(a6);
  uint64_t v9 = sub_10004D210();
  unint64_t v11 = v10;
  uint64_t v12 = sub_10004D1E0();
  _Block_copy(v8);
  long long v13 = self;
  sub_100006BA0(v9, v11, a4, v12, v13, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)_addKeyTransparencyToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  char v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if ((v6 & 4) != 0)
  {
    uint64_t v9 = +[IMDKeyTransparencyController sharedController];
    unint64_t v10 = [v9 setupInfo];
    [v7 setObject:v10 forKeyedSubscript:IMSetupInfoKeyTransparencyInfoKey];

LABEL_6:
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Client does not want KT info", v11, 2u);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_addTransfersToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  int v5 = a4;
  char v6 = (__CFDictionary *)a3;
  if ((v5 & 0x1000100) == 0x100)
  {
    theDict = v6;
    id v7 = +[IMDFileTransferCenter sharedInstance];
    id v8 = [v7 contextStamp];

    uint64_t v9 = +[IMDFileTransferCenter sharedInstance];
    unint64_t v10 = [v9 _allFileTransfers];

    if (v10) {
      CFDictionarySetValue(theDict, IMSetupInfoFileTransfersKey, v10);
    }

    if (v8) {
      CFDictionarySetValue(theDict, IMSetupInfoFileTransfersStampKey, v8);
    }

    char v6 = theDict;
  }
}

- (void)requestSetupXPCObjectWithClientID:(id)a3 capabilities:(unint64_t)a4 context:(id)a5 reply:(id)a6
{
  id v7 = _Block_copy(a6);
  sub_10004D210();
  sub_10004D1E0();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = self;
  NSString v10 = sub_10004D200();
  Class isa = sub_10004D1C0().super.isa;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_1000086B4;
  *(void *)(v12 + 24) = v8;
  aBlock[4] = sub_100046454;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000604C;
  aBlock[3] = &unk_100072830;
  long long v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [(IMDaemonAnyRequestHandler *)v9 requestSetupWithClientID:v10 capabilities:a4 context:isa reply:v13];
  _Block_release(v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)_addChatCountsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  __int16 v6 = a4;
  id v7 = (__CFDictionary *)a3;
  id v8 = a5;
  if ((v6 & 0x8004) != 0)
  {
    uint64_t v9 = +[IMDMessageStore sharedInstance];
    NSString v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v9 unreadMessagesCount]);

    if (v10) {
      CFDictionarySetValue(v7, IMSetupInfoUnreadMessageCountKey, v10);
    }

    unint64_t v11 = +[IMDMessageStore sharedInstance];
    uint64_t v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 lastFailedMessageDate]);

    if (v12) {
      CFDictionarySetValue(v7, IMSetupInfoLastFailedMessageDateKey, v12);
    }

    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v14 = [(__CFDictionary *)v7 valueForKey:@"unreadMessageCount"];
        long long v15 = [(__CFDictionary *)v7 valueForKey:@"lastFailedMessageDate"];
        int v16 = 134218240;
        long long v17 = v14;
        __int16 v18 = 2048;
        id v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Adding unread message count (%ld) and lastFailedMessageDate (%ld) to setup info.", (uint8_t *)&v16, 0x16u);
      }
LABEL_13:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Not adding unread message count or last failed message date to setup info due to missing capability.", (uint8_t *)&v16, 2u);
    }
    goto LABEL_13;
  }
}

- (void)_addChatsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  id v8 = (__CFDictionary *)a3;
  id v9 = a5;
  if ((a4 & 0x4000000) == 0 && (((a4 & 0x2400000) != 0) & (a4 >> 2)) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      NSString v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v37[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Client does not want initial chat load", (uint8_t *)v37, 2u);
      }
    }
    goto LABEL_41;
  }
  unint64_t v11 = [(IMDaemonAnyRequestHandler *)self _pinnedChatIdentifiersFromContext:v9];
  uint64_t v12 = +[IMDMessageStore sharedInstance];
  long long v13 = [v12 modificationStamp];

  [(IMDaemonAnyRequestHandler *)self _cacheChatsWithPinningIdentifiers:v11];
  long long v14 = +[IMDCKSyncController sharedInstance];
  [v14 performInitialSyncOnFirstConnectionOfImagentIfNeeded];

  id v15 = [(IMDaemonAnyRequestHandler *)self _numberOfChatsToLoadDuringInitialSetupFromContext:v9];
  if ((uint64_t)v15 <= 0)
  {
    if ((a4 & 0x100000000) != 0)
    {
      id v15 = (id)IMDChatPrecacheCountClientRemote;
    }
    else
    {
      if ((a4 & 0x2400000) == 0)
      {
        [v11 count];
        goto LABEL_13;
      }
      id v15 = [(IMDaemonAnyRequestHandler *)self _precacheChatCountWithCapabilities:a4];
    }
  }
  if (v15 <= [v11 count]) {
LABEL_13:
  }
    id v15 = [v11 count];
  if (IMOSLoggingEnabled())
  {
    int v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = IMStringFromClientCapabilities();
      v37[0] = 67109378;
      v37[1] = v15;
      __int16 v38 = 2112;
      v39 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Precaching %d chats for client with capabilities %@", (uint8_t *)v37, 0x12u);
    }
  }
  if ((a4 & 0x4000000) != 0)
  {
    __int16 v18 = +[IMDChatRegistry sharedInstance];
    id v19 = [v18 _blackholedChatInfoForNumberOfChats:0x7FFFFFFFFFFFFFFFLL];

    if (v19) {
      CFDictionarySetValue(v8, IMSetupInfoChatsKey, v19);
    }

    __int16 v20 = +[IMDChatRegistry sharedInstance];
    uint64_t v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 blackholedChatsExist]);
  }
  else
  {
    int v22 = IMSharedHelperPersonCentricMergingEnabled();
    v23 = +[IMDChatRegistry sharedInstance];
    v24 = v23;
    if (v22)
    {
      long long v25 = [v23 chats];

      long long v26 = +[IMDChatRegistry sharedInstance];
      long long v27 = [v26 personCentricGroupedChatsArrayWithMaximumNumberOfChats:v15 skipsLastMessageLoading:(a4 >> 24) & 1 usingChats:v25 useCachedChatGroups:1 includingPinnedChatIdentifiers:v11 repairInconsistentMergedChats:1];

      if (v27) {
        CFDictionarySetValue(v8, IMSetupInfoPersonMergedChatsKey, v27);
      }
      long long v28 = +[IMDChatRegistry sharedInstance];
      v29 = [v28 aliasToCNIDMap];

      if (v29) {
        CFDictionarySetValue(v8, IMSetupInfoAliasToCNIDMapKey, v29);
      }

      v30 = +[IMDChatRegistry sharedInstance];
      v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v30 filterediMessageChatsExist]);

      if (v31) {
        CFDictionarySetValue(v8, IMSetupInfoFilteredIMessageChatsExistKey, v31);
      }
    }
    else
    {
      long long v25 = [v23 _chatInfoForNumberOfChats:v15];

      if (v25) {
        CFDictionarySetValue(v8, IMSetupInfoChatsKey, v25);
      }
    }

    v32 = +[IMDChatRegistry sharedInstance];
    uint64_t v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v32 blackholedChatsExist]);
  }
  if (v21) {
    CFDictionarySetValue(v8, IMSetupInfoBlackholedChatsExistKey, v21);
  }

  v33 = +[IMDMessageStore sharedInstance];
  v34 = [v33 modificationStamp];

  if (v34) {
    CFDictionarySetValue(v8, IMSetupInfoDBModificationStampKey, v34);
  }

  v35 = +[IMHandleOffGridStateManager sharedInstance];
  v36 = [v35 cachedOverrideDatesByHandleID];

  if (v36) {
    CFDictionarySetValue(v8, IMSetupInfoOffGridStatusOverrideDatesKey, v36);
  }

LABEL_41:
}

- (void)_addAccountsToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  id v8 = (__CFDictionary *)a3;
  id v9 = a5;
  NSString v10 = +[IMDServiceController sharedController];
  unint64_t v11 = [v10 allServices];

  id v12 = objc_alloc_init((Class)NSMutableArray);
  if ([(IMDaemonAnyRequestHandler *)self _clientCapabilitiesSupportAccounts:a4])
  {
    long long v13 = [v11 arrayByApplyingSelector:"internalName"];
    if (v13) {
      CFDictionarySetValue(v8, IMSetupInfoServiceNamesKey, v13);
    }
    v67 = v12;

    long long v14 = +[IMDDaemonPropertyManager sharedManager];
    id v15 = [v14 properties];
    id v16 = [v15 count];

    if (v16)
    {
      long long v17 = (const void *)IMSetupInfoPropertiesKey;
      __int16 v18 = +[IMDDaemonPropertyManager sharedManager];
      id v19 = [v18 properties];
      CFDictionarySetValue(v8, v17, v19);
    }
    id v63 = v9;
    __int16 v20 = +[IMDDaemonPropertyManager sharedManager];
    uint64_t v21 = [v20 persistentProperties];
    id v22 = [v21 count];

    if (v22)
    {
      v23 = (const void *)IMSetupInfoPersistentPropertiesKey;
      v24 = +[IMDDaemonPropertyManager sharedManager];
      long long v25 = [v24 persistentProperties];
      CFDictionarySetValue(v8, v23, v25);
    }
    v64 = v8;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v62 = v11;
    id obj = v11;
    id v68 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    if (v68)
    {
      uint64_t v66 = *(void *)v76;
      long long v26 = (void **)&_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
      do
      {
        for (i = 0; i != v68; i = (char *)i + 1)
        {
          if (*(void *)v76 != v66) {
            objc_enumerationMutation(obj);
          }
          long long v28 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          v29 = [v26[465] sharedAccountController];
          v30 = [v29 accountsForService:v28];

          v31 = [v30 arrayByApplyingSelector:"accountID"];
          v32 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v33 = [v28 internalName];
          if (v33) {
            CFDictionarySetValue(v32, IMServiceInfoInternalNameKey, v33);
          }

          v34 = [v28 serviceProperties];
          id v35 = [v34 count];

          if (v35)
          {
            v36 = (const void *)IMServiceInfoPropertiesKey;
            v37 = [v28 serviceProperties];
            CFDictionarySetValue(v32, v36, v37);
          }
          __int16 v38 = [v28 serviceDefaultsForSetup];
          id v39 = [v38 count];

          if (v39)
          {
            v40 = (const void *)IMServiceInfoDefaultsKey;
            v41 = [v28 serviceDefaultsForSetup];
            CFDictionarySetValue(v32, v40, v41);
          }
          v42 = [v28 defaultAccountSettings];
          id v43 = [v42 count];

          if (v43)
          {
            v44 = (const void *)IMServiceInfoDefaultAccountSettingsKey;
            v45 = [v28 defaultAccountSettings];
            CFDictionarySetValue(v32, v44, v45);
          }
          if ([v31 count]) {
            CFDictionarySetValue(v32, IMServiceInfoAccountsKey, v31);
          }
          v69 = v31;
          v46 = [v26[465] sharedAccountController];
          v47 = [v46 activeAccountsForService:v28];
          [v47 arrayByApplyingSelector:"accountID"];
          v49 = v48 = v26;
          id v50 = [v49 count];

          if (v50)
          {
            v51 = (const void *)IMServiceInfoActiveAccountsKey;
            v52 = [v48[465] sharedAccountController];
            v53 = [v52 activeAccountsForService:v28];
            v54 = [v53 arrayByApplyingSelector:"accountID"];
            CFDictionarySetValue(v32, v51, v54);
          }
          [v67 addObject:v32];
          id v55 = objc_alloc_init((Class)NSMutableArray);
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          id v56 = v30;
          id v57 = [v56 countByEnumeratingWithState:&v71 objects:v79 count:16];
          if (v57)
          {
            id v58 = v57;
            uint64_t v59 = *(void *)v72;
            do
            {
              for (j = 0; j != v58; j = (char *)j + 1)
              {
                if (*(void *)v72 != v59) {
                  objc_enumerationMutation(v56);
                }
                v61 = [*(id *)(*((void *)&v71 + 1) + 8 * (void)j) accountInfoToPost];
                if ([v61 count]) {
                  [v55 addObject:v61];
                }
              }
              id v58 = [v56 countByEnumeratingWithState:&v71 objects:v79 count:16];
            }
            while (v58);
          }

          if ([v55 count]) {
            CFDictionarySetValue(v32, IMServiceInfoAccountInfoKey, v55);
          }

          long long v26 = v48;
        }
        id v68 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
      }
      while (v68);
    }

    id v12 = v67;
    id v9 = v63;
    id v8 = v64;
    unint64_t v11 = v62;
    if ([v67 count]) {
      CFDictionarySetValue(v64, IMSetupInfoServicesKey, v67);
    }
  }
}

- (int64_t)_precacheChatCountWithCapabilities:(unint64_t)a3
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

- (BOOL)_clientCapabilitiesSupportAccounts:(unint64_t)a3
{
  return (a3 & 0x8800000) == 0 && a3 != 0x20000000;
}

- (void)_addApprovedCapabilitiesToSetupInfo:(id)a3 capabilities:(unint64_t)a4 context:(id)a5
{
  __int16 v6 = (__CFDictionary *)a3;
  id v7 = +[IMDeviceUtilities isMessagesInstalled];
  id v8 = +[NSNumber numberWithUnsignedLongLong:a4];
  if (v8)
  {
    CFDictionarySetValue(v6, IMSetupInfoApprovedClientCapabilitiesKey, v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004CC24();
  }

  id v9 = +[NSNumber numberWithBool:v7];
  if (v9)
  {
    CFDictionarySetValue(v6, IMSetupInfoIsMessagesInstalledKey, v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004CB90();
  }
}

- (void)setValue:(id)a3 ofProperty:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMDDaemonPropertyManager sharedManager];
  [v7 setValue:v6 ofProperty:v5];
}

- (id)valueOfProperty:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDDaemonPropertyManager sharedManager];
  id v5 = [v4 valueOfProperty:v3];

  return v5;
}

- (void)setValue:(id)a3 ofPersistentProperty:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMDDaemonPropertyManager sharedManager];
  [v7 setValue:v6 ofPersistentProperty:v5];
}

- (id)valueOfPersistentProperty:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDDaemonPropertyManager sharedManager];
  id v5 = [v4 valueOfPersistentProperty:v3];

  return v5;
}

- (void)markUnreadForMessageGUID:(id)a3 IDs:(id)a4 style:(unsigned __int8)a5 services:(id)a6
{
  id v8 = a3;
  id v32 = a4;
  id v30 = a6;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      NSString v10 = +[IMDClientRequestContext currentContext];
      unint64_t v11 = [v10 listenerID];
      *(_DWORD *)buf = 138412546;
      id v39 = v11;
      __int16 v40 = 2112;
      id v41 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Request from %@ to mark message as unread with GUID %@", buf, 0x16u);
    }
  }
  id v12 = objc_alloc_init((Class)IMTimingCollection);
  [v12 startTimingForKey:@"total-time-to-mark-unread"];
  if (![v8 length])
  {
    [v12 startTimingForKey:@"search-for-guid"];
    id v13 = objc_alloc_init((Class)NSMutableSet);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v14 = v32;
    id v15 = 0;
    id v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v34;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          if ((objc_msgSend(v13, "containsObject:", v19, v30) & 1) == 0)
          {
            [v13 addObject:v19];
            MessageForChatIdentifier = (const void *)IMDMessageRecordCopyLastReadMessageForChatIdentifier();
            if (MessageForChatIdentifier)
            {
              AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef();
              CFRelease(MessageForChatIdentifier);
              if (!v15 || [v15 isOlderThanItem:AttachmentIfNeededRef])
              {
                id v22 = [AttachmentIfNeededRef copy];

                id v15 = v22;
              }
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v16);

      if (!v15) {
        goto LABEL_26;
      }
      if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v15;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "We found a message guid to mark unread %@", buf, 0xCu);
        }
      }
      [v15 guid];
      id v14 = v8;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_26:
    objc_msgSend(v12, "stopTimingForKey:", @"search-for-guid", v30);
  }
  if (objc_msgSend(v8, "length", v30))
  {
    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Marking message as unread %@", buf, 0xCu);
      }
    }
    long long v25 = +[IMDMessageStore sharedInstance];
    [v25 markMessageGUIDUnread:v8];

    long long v26 = +[IMDAccountController sharedAccountController];
    long long v27 = [v26 anySessionForServiceName:IMServiceNameiMessage];

    if (v27)
    {
      [v27 reflectMarkUnreadToPeerDevicesForMessageGUID:v8];
    }
    else if (IMOSLoggingEnabled())
    {
      long long v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "We could not find a service session for imessage to send that the message has been marked unread %@", buf, 0xCu);
      }
    }
  }
  [v12 stopTimingForKey:@"total-time-to-mark-unread"];
  if (IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v12;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "total time to mark unread %@", buf, 0xCu);
    }
  }
}

- (void)markMessageAsReadWithGUID:(id)a3 callerOrigin:(int64_t)a4 reply:(id)a5
{
  id v31 = a3;
  v29 = (void (**)(id, void))a5;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = +[IMDClientRequestContext currentContext];
      id v8 = [v7 listenerID];
      CFStringRef v9 = @"NO";
      *(_DWORD *)buf = 138412802;
      v42 = v8;
      __int16 v43 = 2112;
      if (a4 == 1) {
        CFStringRef v9 = @"YES";
      }
      id v44 = v31;
      __int16 v45 = 2112;
      CFStringRef v46 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request from %@ to mark message as read with GUID: %@ isFromSiri %@", buf, 0x20u);
    }
  }
  if (![v31 length])
  {
    v29[2](v29, 0);
    goto LABEL_25;
  }
  NSString v10 = +[IMDMessageStore sharedInstance];
  unint64_t v11 = [v10 chatsForMessageGUID:v31];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v11;
  char v12 = 0;
  id v13 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (!v13) {
    goto LABEL_23;
  }
  uint64_t v14 = *(void *)v34;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      uint64_t v17 = [v16 serviceName];
      if ([v17 length])
      {
        __int16 v18 = [v16 chatIdentifier];
        BOOL v19 = [v18 length] == 0;

        if (!v19)
        {
          __int16 v20 = [v16 chatIdentifier];
          id v39 = v20;
          uint64_t v21 = +[NSArray arrayWithObjects:&v39 count:1];
          id v22 = [v16 style];
          v23 = [v16 serviceName];
          __int16 v38 = v23;
          v24 = +[NSArray arrayWithObjects:&v38 count:1];
          id v37 = v31;
          long long v25 = +[NSArray arrayWithObjects:&v37 count:1];
          sub_10001F010(v21, (uint64_t)v22, v24, v25, 0, a4, 0);

          char v12 = 1;
          continue;
        }
      }
      else
      {
      }
      if (IMOSLoggingEnabled())
      {
        long long v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          long long v27 = [v16 chatIdentifier];
          long long v28 = [v16 serviceName];
          *(_DWORD *)buf = 138412802;
          v42 = v16;
          __int16 v43 = 2112;
          id v44 = v27;
          __int16 v45 = 2112;
          CFStringRef v46 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Empty IDs or services for chat: %@ (IDs: %@  Services: %@)", buf, 0x20u);
        }
      }
    }
    id v13 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  }
  while (v13);
LABEL_23:

  v29[2](v29, v12 & 1);
LABEL_25:
}

- (void)markReadForMessageGUID:(id)a3 callerOrigin:(int64_t)a4 queryID:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000159F0;
  v11[3] = &unk_100071890;
  id v12 = a5;
  id v13 = v8;
  id v9 = v8;
  id v10 = v12;
  [(IMDaemonAnyRequestHandler *)self markMessageAsReadWithGUID:v9 callerOrigin:a4 reply:v11];
}

- (void)markPlayedForMessageGUID:(id)a3
{
  id v23 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = +[IMDClientRequestContext currentContext];
      id v6 = [v5 listenerID];
      *(_DWORD *)buf = 138412546;
      v29 = v6;
      __int16 v30 = 2112;
      id v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Request from %@ to mark message as played with GUID: %@", buf, 0x16u);
    }
  }
  if ([v23 length])
  {
    id v7 = +[IMDMessageStore sharedInstance];
    id v8 = [v7 chatsForMessageGUID:v23];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v25;
      *(void *)&long long v11 = 138412802;
      long long v22 = v11;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "chatIdentifier", v22);
          id v16 = IMSingleObjectArray();

          uint64_t v17 = [v14 serviceName];
          __int16 v18 = IMSingleObjectArray();

          if ([v18 count] && objc_msgSend(v16, "count"))
          {
            BOOL v19 = +[IMDMessageStore sharedInstance];
            __int16 v20 = [v19 messageWithGUID:v23];

            -[IMDaemonAnyRequestHandler markPlayedForIDs:style:onServices:message:](self, "markPlayedForIDs:style:onServices:message:", v16, [v14 style], v18, v20);
          }
          else if (IMOSLoggingEnabled())
          {
            uint64_t v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v22;
              v29 = v14;
              __int16 v30 = 2112;
              id v31 = v16;
              __int16 v32 = 2112;
              long long v33 = v18;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Empty IDs or services for chat: %@ (IDs: %@  Services: %@)", buf, 0x20u);
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v10);
    }
  }
}

- (void)markPlayedForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 message:(id)a6
{
  unsigned int v62 = a4;
  id v65 = a3;
  id v64 = a5;
  id v8 = a6;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = +[IMDClientRequestContext currentContext];
      long long v11 = [v10 listenerID];
      *(_DWORD *)buf = 138412802;
      id v74 = v11;
      __int16 v75 = 2112;
      id v76 = v65;
      __int16 v77 = 2112;
      id v78 = v64;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Request from %@ to mark message as played with IDs: %@  services: %@", buf, 0x20u);
    }
  }
  if ([v65 count] && objc_msgSend(v64, "count"))
  {
    id v12 = [v65 count];
    if (v12 == [v64 count])
    {
      id v13 = +[IMDMessageStore sharedInstance];
      uint64_t v14 = [v8 guid];
      id v15 = [v13 messageWithGUID:v14];

      if (v15)
      {
        objc_msgSend(v15, "setFlags:", (unint64_t)objc_msgSend(v15, "flags") | 0x400000);
        id v16 = +[NSDate date];
        [v15 setTimePlayed:v16];

        uint64_t v17 = +[IMDMessageStore sharedInstance];
        v67 = [v17 storeMessage:v15 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:0x400000];
      }
      else
      {
        v67 = 0;
      }
      if (IMOSLoggingEnabled())
      {
        BOOL v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v74 = v67;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Found message to mark as played: %@", buf, 0xCu);
        }
      }
      id v63 = objc_alloc_init((Class)NSMutableSet);
      if ([v65 count])
      {
        unint64_t v20 = 0;
        do
        {
          uint64_t v21 = [v65 objectAtIndex:v20];
          long long v22 = [v64 objectAtIndex:v20];
          id v23 = (void *)IMCopyGUIDForChat();

          [v63 addObject:v23];
          ++v20;
        }
        while (v20 < (unint64_t)[v65 count]);
      }
      if (v67)
      {
        long long v24 = +[IMDMessageStore sharedInstance];
        uint64_t v66 = [v24 chatForMessage:v67];

        BOOL v25 = [v66 style] == 45;
        id v26 = [v65 count];
        if (v25)
        {
          if (v26)
          {
            unint64_t v27 = 0;
            do
            {
              long long v28 = [v65 objectAtIndex:v27];
              v29 = [v64 objectAtIndex:v27];
              __int16 v30 = +[IMDChatStore sharedInstance];
              id v31 = [v30 chatsWithHandle:v28 onService:v29];

              __int16 v32 = [v31 arrayByApplyingSelector:"guid"];
              [v63 addObjectsFromArray:v32];

              ++v27;
            }
            while (v27 < (unint64_t)[v65 count]);
          }
        }
        else if (v26)
        {
          unint64_t v33 = 0;
          do
          {
            long long v34 = [v65 objectAtIndex:v33];
            long long v35 = [v64 objectAtIndex:v33];
            long long v36 = +[IMDChatStore sharedInstance];
            id v37 = [v36 chatsWithRoomname:v34 onService:v35];

            __int16 v38 = [v37 arrayByApplyingSelector:"guid"];
            [v63 addObjectsFromArray:v38];

            ++v33;
          }
          while (v33 < (unint64_t)[v65 count]);
        }
        id v39 = [v67 guid];
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v40 = v63;
        id v41 = [v40 countByEnumeratingWithState:&v68 objects:v72 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v69;
          do
          {
            for (i = 0; i != v41; i = (char *)i + 1)
            {
              if (*(void *)v69 != v42) {
                objc_enumerationMutation(v40);
              }
              uint64_t v44 = *(void *)(*((void *)&v68 + 1) + 8 * i);
              __int16 v45 = +[IMDChatRegistry sharedInstance];
              CFStringRef v46 = [v45 existingChatWithGUID:v44];

              v47 = [v46 lastMessage];
              v48 = [v47 guid];
              LODWORD(v45) = [v48 isEqualToString:v39];

              if (v45)
              {
                v49 = +[IMDChatRegistry sharedInstance];
                [v49 updateStateForChat:v66 hintMessage:v67 shouldRebuildFailedMessageDate:0];
              }
            }
            id v41 = [v40 countByEnumeratingWithState:&v68 objects:v72 count:16];
          }
          while (v41);
        }

        id v50 = [v67 accountID];
        v51 = +[IMDAccountController sharedInstance];
        v52 = [v51 sessionForAccount:v50];

        if (IMOSLoggingEnabled())
        {
          v53 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v74 = v67;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Sending played receipt for: %@", buf, 0xCu);
          }
        }
        v54 = [v66 chatIdentifier];
        objc_msgSend(v52, "sendPlayedReceiptForMessage:toChatID:identifier:style:", v67, 0, v54, objc_msgSend(v66, "style"));

        id v55 = +[IMDMessageStore sharedInstance];
        id v56 = [v67 guid];
        id v8 = [v55 messageWithGUID:v56];

        id v57 = +[IMDBroadcastController sharedProvider];
        id v58 = [v57 broadcasterForChatListeners];

        if (IMOSLoggingEnabled())
        {
          uint64_t v59 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v74 = v8;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Notifying about message: %@", buf, 0xCu);
          }
        }
        [v58 account:v50 chat:0 style:0 chatProperties:0 messageUpdated:v8];
      }
      else
      {
        id v8 = 0;
      }
      if (IMMessageItemShouldAutomaticallySave())
      {
        if (IMOSLoggingEnabled())
        {
          v60 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v74 = v65;
            __int16 v75 = 2112;
            id v76 = v64;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Automatically marking played messages as saved with IDs: %@  services: %@", buf, 0x16u);
          }
        }
        v61 = objc_alloc_init(IMDaemonChatModifyReadStateRequestHandler);
        [(IMDaemonChatModifyReadStateRequestHandler *)v61 markSavedForIDs:v65 style:v62 onServices:v64 message:v8];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v74 = v65;
        __int16 v75 = 2112;
        id v76 = v64;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Mismatched IDs and serviceNames array to mark as played (IDs: %@   Service names: %@)", buf, 0x16u);
      }
    }
  }
}

- (void)playSendSoundForMessageGUID:(id)a3 callerOrigin:(int64_t)a4
{
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      CFStringRef v7 = @"NO";
      if (a4 == 1) {
        CFStringRef v7 = @"YES";
      }
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      CFStringRef v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request to play send sound for message with GUID: %@ isFromSiri %@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v8 = +[IMDMessageStore sharedInstance];
  id v9 = [v8 messageWithGUID:v5];

  if (v9)
  {
    +[IMDSoundUtilities playMessageSentSoundIfNeeded:v9];
  }
  else if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Could not find message item matching guid, not playing send sound. GUID: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)requestBuddyPicturesAndPropertiesForAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 accountForAccountID:v3];

  id v6 = [v5 session];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412802;
      CFStringRef v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      __int16 v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "requestBuddyPicturesAndPropertiesForAccount: %@   session: %@  account: %@", (uint8_t *)&v13, 0x20u);
    }
  }
  id v8 = +[IMDBroadcastController sharedProvider];
  id v9 = [v6 service];
  id v10 = [v8 broadcasterForListenersSupportingService:v9];

  int v11 = [v6 buddyProperties];
  id v12 = [v6 buddyPictures];
  [v10 account:v3 buddyProperties:v11 buddyPictures:v12];
}

- (void)forceReloadChatRegistryWithQueryID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Forcing reload chats", v8, 2u);
    }
  }
  id v5 = +[IMDChatRegistry sharedInstance];
  [v5 _forceReloadChats:1];

  if (v3)
  {
    id v6 = +[IMDClientRequestContext currentContext];
    CFStringRef v7 = [v6 replyProxy];
    [v7 forcedReloadingChatRegistryWithQueryID:v3];
  }
}

- (void)requestOneTimeCodeStatus
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Request to get one time codes", v4, 2u);
    }
  }
  id v3 = +[IMDOneTimeCodeManager sharedInstance];
  [v3 broadcastCodeStatusToClients];
}

- (void)consumeCodeWithMessageGUID:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Request to consume code with message guid: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [(IMDaemonAnyRequestHandler *)self markReadForMessageGUID:v4 callerOrigin:0 queryID:0];
  id v6 = +[IMDOneTimeCodeManager sharedInstance];
  [v6 consumeCodeWithGuid:v4];

  CFStringRef v7 = +[IMMetricsCollector sharedInstance];
  [v7 trackEvent:IMMetricsCollecterEventConsumedOTC];
}

- (void)onboardDeleteVerificationCodesIfNeededWithReply:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Processing request to onboarding delete verification codes if needed", v6, 2u);
    }
  }
  id v5 = +[IMDOneTimeCodeManager sharedInstance];
  [v5 onboardDeleteVerificationCodesIfNeededWithCompletionHandler:v3];
}

- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMDOneTimeCodeManager sharedInstance];
  [v7 onboardDeleteVerificationCodesIfNeededWithMessage:v6 completionHandler:v5];
}

- (void)setAutoDeletionPreference:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[IMDOneTimeCodeManager sharedInstance];
  [v4 setAutoDeletionPreference:v3];
}

- (void)fetchAutoDeletionPreferenceWithReply:(id)a3
{
  if (a3)
  {
    id v5 = (void (**)(id, id))a3;
    BOOL v3 = +[IMDOneTimeCodeManager sharedInstance];
    id v4 = [v3 autoDeletionPreference];

    v5[2](v5, v4);
  }
}

- (void)simulateOneTimeCodeArriving:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Recevied request to simulate a One Time Code. Passing on to listeners.", v6, 2u);
    }
  }
  id v5 = +[IMDOneTimeCodeManager sharedInstance];
  [v5 startTrackingCode:v3];
}

- (void)preWarm
{
  v2 = +[IMDAccountController sharedInstance];
  id v3 = [v2 anySessionForServiceName:IMServiceNameiMessage];

  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v3 preWarm];
  }

  _objc_release_x2();
}

- (void)downloadPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CFStringRef v14 = +[NSNumber numberWithUnsignedChar:v8];
      int v23 = 138413058;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      id v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Request to download attachments for chatIdentifiers %@ style %@ services %@ chat guid %@", (uint8_t *)&v23, 0x2Au);
    }
  }
  __int16 v15 = +[IMDClientRequestContext currentContext];
  id v16 = [v15 replyProxy];

  __int16 v17 = +[IMDChatUtilities _stringForChatIDs:v10 onServices:v11];
  unint64_t v18 = [(IMDaemonAnyRequestHandler *)self _broadcastedUncachedAttachmentCountForChatWithGUID:v12 chatIdentifiers:v10 services:v11 broadcaster:v16];
  if (IMOSLoggingEnabled())
  {
    BOOL v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      unint64_t v20 = +[NSNumber numberWithUnsignedInteger:v18];
      int v23 = 138412546;
      id v24 = v20;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Purged count starts at %@ for key %@", (uint8_t *)&v23, 0x16u);
    }
  }
  downloadingCountDictionary = self->_downloadingCountDictionary;
  long long v22 = +[NSNumber numberWithUnsignedInteger:v18];
  [(NSMutableDictionary *)downloadingCountDictionary setObject:v22 forKey:v17];

  [(IMDaemonAnyRequestHandler *)self _downloadPurgedAttachmentsForIDs:v10 style:v8 onServices:v11 chatID:v12 retryCount:0 broadcaster:v16];
}

- (BOOL)_shouldContinueDownloadingPurgedAttachments:(unint64_t)a3
{
  id v4 = +[IDSServerBag sharedInstanceForBagType:1];
  id v5 = [v4 objectForKey:@"ck-client-download-purged-attachments-max-retry-count"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)[v5 intValue] >= 1) {
    unint64_t v6 = (int)[v5 intValue];
  }
  else {
    unint64_t v6 = 5;
  }
  if (v6 <= a3 && IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = +[NSNumber numberWithUnsignedInteger:v6];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Cannot continue downloading purged attachments becaused reach max retry count of %@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v6 > a3;
}

- (void)_downloadPurgedAttachmentsForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 retryCount:(unint64_t)a7 broadcaster:(id)a8
{
  uint64_t v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (IMOSLoggingEnabled())
  {
    unint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      BOOL v19 = +[NSNumber numberWithUnsignedChar:v12];
      *(_DWORD *)buf = 138413058;
      id v38 = v14;
      __int16 v39 = 2112;
      id v40 = v19;
      __int16 v41 = 2112;
      id v42 = v15;
      __int16 v43 = 2112;
      id v44 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Request to download attachments for chatIdentifiers %@ style %@ services %@ chat guid %@", buf, 0x2Au);
    }
  }
  unint64_t v20 = +[IMDChatUtilities _stringForChatIDs:v14 onServices:v15];
  uint64_t v21 = +[IMDChatUtilities sharedUtilities];
  long long v22 = [v21 currentlyDownloadingSet];
  [v22 addObject:v20];

  int v23 = +[IMDCKAttachmentSyncController sharedInstance];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000177BC;
  v29[3] = &unk_1000718E0;
  v29[4] = self;
  id v30 = v16;
  id v31 = v14;
  id v32 = v15;
  id v33 = v17;
  id v34 = v20;
  unint64_t v35 = a7;
  char v36 = v12;
  id v24 = v20;
  id v25 = v17;
  id v26 = v15;
  id v27 = v14;
  id v28 = v16;
  [v23 downloadAttachmentAssetsForChatIDs:v27 services:v26 style:v12 completion:v29];
}

- (unint64_t)_broadcastedUncachedAttachmentCountForChatWithGUID:(id)a3 chatIdentifiers:(id)a4 services:(id)a5 broadcaster:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = +[IMDCKUtilities sharedInstance];
  unsigned __int8 v14 = [v13 cloudKitSyncingEnabled];

  if (v14)
  {
    id v15 = +[IMDCKAttachmentSyncController sharedInstance];
    id v16 = [v15 purgedAttachmentsCountForChatsWithChatIdentifiers:v10 services:v11];
    id v17 = +[NSNumber numberWithUnsignedInteger:v16];
    [v12 chat:v9 uncachedAttachmentCountUpdated:v17];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "CloudKit syncing disabled, not broadcasting uncached attachment count for %@ on %@", (uint8_t *)&v20, 0x16u);
      }
    }
    id v16 = 0;
  }

  return (unint64_t)v16;
}

- (void)initiateQuickSwitch
{
  id v2 = +[IMDQuickSwitchController sharedInstance];
  [v2 dummyMethod];
}

- (void)requestQOSClassWhileServicingRequestsWithID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = qos_class_self();
  id v6 = +[IMDBroadcastController sharedProvider];
  id v5 = [v6 broadcasterForChatListeners];
  [v5 qosClassWhileServicingRequestsResponse:v4 identifier:v3];
}

- (void)fetchGroupPhotoPathsForChatsWithGroupIDs:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetching group photo paths for chats with group IDs from the database.", buf, 2u);
    }
  }
  uint64_t v8 = +[IMDDatabase synchronousDatabase];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018238;
  v10[3] = &unk_100071818;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchGroupPhotoPathsForChatsWithGroupIDs:v5 completionHandler:v10];
}

- (void)fetchNicknamesWithReply:(id)a3
{
  id v3 = (void (**)(id, id, void *, void *))a3;
  uint64_t v4 = +[IMDNicknameController sharedInstance];
  id v9 = [v4 pendingNicknameUpdates];

  id v5 = +[IMDNicknameController sharedInstance];
  id v6 = [v5 handledNicknames];

  id v7 = +[IMDNicknameController sharedInstance];
  uint64_t v8 = [v7 archivedNicknames];

  v3[2](v3, v9, v6, v8);
}

- (void)fetchHandleSharingStateWithReply:(id)a3
{
  id v3 = (void (**)(id, id, void *))a3;
  uint64_t v4 = +[IMDNicknameController sharedInstance];
  id v7 = [v4 allowListedHandlesForSharing];

  id v5 = +[IMDNicknameController sharedInstance];
  id v6 = [v5 denyListedHandlesForSharing];

  v3[2](v3, v7, v6);
}

- (void)fetchTransitionedNicknameHandlesWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  uint64_t v4 = +[IMDNicknameController sharedInstance];
  id v5 = [v4 transitionedHandles];

  v3[2](v3, v5);
}

- (void)fetchActiveNicknamesWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  uint64_t v4 = +[IMDNicknameController sharedInstance];
  id v5 = [v4 activeRecords];

  v3[2](v3, v5);
}

- (void)fetchIgnoredNicknameHandlesWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  uint64_t v4 = +[IMDNicknameController sharedInstance];
  id v5 = [v4 ignoredRecords];

  v3[2](v3, v5);
}

- (void)fetchUnknownSenderRecordsWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  uint64_t v4 = +[IMDNicknameController sharedInstance];
  id v5 = [v4 unknownSenderRecordInfo];

  v3[2](v3, v5);
}

- (void)clearPendingNicknameUpdatesForHandleIDs:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        id v9 = +[IMDNicknameController sharedInstance];
        [v9 clearPendingNicknameForHandleID:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)ignorePendingNicknameUpdatesForHandleIDs:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        id v9 = +[IMDNicknameController sharedInstance];
        [v9 ignorePendingNicknameForHandleID:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[IMDNicknameController sharedInstance];
  [v6 acceptPendingNicknameForHandleID:v5 updateType:a4];
}

- (void)clearPendingNicknamePhotoUpdateForHandleIDs:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        id v9 = +[IMDNicknameController sharedInstance];
        [v9 clearPendingNicknamePhotoForHandleID:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)allowHandleIDsForNicknameSharing:(id)a3 onChatGUIDs:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[IMDNicknameController sharedInstance];
  [v12 allowHandlesForSharing:v11 onChatGUIDs:v10 fromHandle:v9 forceSend:v6];
}

- (void)denyHandleIDsForNicknameSharing:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDNicknameController sharedInstance];
  [v4 denyHandlesForSharing:v3];
}

- (void)markNicknamesAsTransitionedForHandleIDs:(id)a3 isAutoUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[IMDNicknameController sharedInstance];
  [v6 markNicknamesAsTransitionedForHandleIDs:v5 isAutoUpdate:v4];
}

- (void)markProfileRecords:(id)a3 asActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[IMDNicknameController sharedInstance];
  [v6 markProfileRecords:v5 asActive:v4];
}

- (void)markProfileRecordsAsIgnored:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDNicknameController sharedInstance];
  [v4 markProfileRecordsAsIgnored:v3 broadcastUpdates:1];
}

- (void)nicknamePreferencesDidChange
{
  id v2 = +[IMDNicknameController sharedInstance];
  [v2 sendNicknamePreferencesDidChange];
}

- (void)setNewPersonalNickname:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDNicknameController sharedInstance];
  [v4 setPersonalNickname:v3 completionBlock:&stru_100071920];
}

- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMDNicknameController sharedInstance];
  [v7 sendNameOnlyToHandleIDs:v6 fromHandleID:v5];
}

- (void)fetchPersonalNicknameWithReply:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = +[IMDNicknameController sharedInstance];
  id v5 = [v4 personalNickname];

  v3[2](v3, v5);
}

- (void)fetchiCloudAccountStatusWithReply:(id)a3
{
  id v6 = a3;
  id v3 = +[IMDNicknameController sharedInstance];
  id v4 = [v3 evaluateAccountStateForFeatureEligibility];

  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id, id))v6 + 2))(v6, v4);
    id v5 = v6;
  }
}

- (void)markAllNicknamesAsPending
{
  id v2 = +[IMDNicknameController sharedInstance];
  [v2 markAllNicknamesAsPending];
}

- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 anySessionForServiceName:IMServiceNameiMessage];

  [v8 eagerUploadTransfer:v6 recipients:v5];
}

- (void)eagerUploadCancel:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 anySessionForServiceName:IMServiceNameiMessage];

  [v5 eagerUploadCancel:v3];
}

- (void)downloadStickerWithGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = +[IMDStickerRegistry sharedInstance];
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got a request to download sticker with GUID %@ stickerStore %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)downloadStickerPackWithGUID:(id)a3 isIncomingMessage:(BOOL)a4 ignoreCache:(BOOL)a5
{
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = +[IMDStickerRegistry sharedInstance];
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Got a request to download sticker pack with GUID %@ stickerStore %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)sendEmergencyQuestionnaire:(id)a3
{
  id v3 = a3;
  id v4 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v5 = [v4 stewieEnabled];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request to send Stewie emergency chat", v8, 2u);
      }
    }
    id v7 = +[IMDChorosController sharedController];
    [v7 sendEmergencyQuestionnaire:v3];
  }
}

- (void)processReceivedEmergencyMessageFromIMTool:(int64_t)a3 message:(id)a4
{
  id v8 = a4;
  unsigned int v5 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v6 = [v5 stewieEnabled];

  if (v6)
  {
    id v7 = +[IMDChorosController sharedController];
    [v7 processReceivedEmergencyMessageFromIMTool:a3 message:v8];
  }
}

- (void)locationUpdateSent
{
  id v2 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v3 = [v2 stewieEnabled];

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Request to show a location update was sent", v6, 2u);
      }
    }
    unsigned int v5 = +[IMDChorosController sharedController];
    [v5 locationUpdateSent];
  }
}

- (void)sendQuestionnaire:(id)a3
{
  id v3 = a3;
  id v4 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v5 = [v4 stewieEnabled];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request to send Stewie questionnaire", v8, 2u);
      }
    }
    id v7 = +[IMDChorosController sharedController];
    [v7 sendQuestionnaire:v3];
  }
}

- (void)locationUpdateDelivered:(id)a3
{
  id v3 = a3;
  id v4 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v5 = [v4 stewieEnabled];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request to show a location update was sent", v8, 2u);
      }
    }
    id v7 = +[IMDChorosController sharedController];
    [v7 locationUpdateDelivered:v3];
  }
}

- (void)openStewieChatWithContext:(id)a3
{
  id v3 = a3;
  id v4 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v5 = [v4 stewieEnabled];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request to open Stewie chat", v8, 2u);
      }
    }
    id v7 = +[IMDChorosController sharedController];
    [v7 openStewieChatWithContext:v3];
  }
}

- (void)holdBuddyUpdatesAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDAccountController sharedAccountController];
  unsigned int v5 = [v4 sessionForAccount:v3];

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    unsigned int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = +[IMDAccountController sharedAccountController];
  id v9 = [v8 accountForAccountID:v3];
  __int16 v10 = [v9 service];
  id v11 = [v10 internalName];
  unsigned int v5 = [v7 anySessionForServiceName:v11];

  if (v5)
  {
LABEL_7:
    [v5 holdBuddyUpdates];
  }
  else if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)resumeBuddyUpdatesAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDAccountController sharedAccountController];
  unsigned int v5 = [v4 sessionForAccount:v3];

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    unsigned int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = +[IMDAccountController sharedAccountController];
  id v9 = [v8 accountForAccountID:v3];
  __int16 v10 = [v9 service];
  id v11 = [v10 internalName];
  unsigned int v5 = [v7 anySessionForServiceName:v11];

  if (v5)
  {
LABEL_7:
    [v5 resumeBuddyUpdates];
  }
  else if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)startWatchingBuddy:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  __int16 v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  id v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 startWatchingBuddy:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)stopWatchingBuddy:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  __int16 v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  id v12 = [v11 accountForAccountID:v6];
  int v13 = [v12 service];
  id v14 = [v13 internalName];
  id v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 stopWatchingBuddy:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)requestProperty:(id)a3 ofPerson:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = +[IMDAccountController sharedAccountController];
  id v11 = [v10 sessionForAccount:v9];

  if (v11) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  int v13 = +[IMDAccountController sharedAccountController];
  id v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 accountForAccountID:v9];
  int v16 = [v15 service];
  id v17 = [v16 internalName];
  id v11 = [v13 anySessionForServiceName:v17];

  if (v11)
  {
LABEL_7:
    [v11 requestProperty:v7 ofPerson:v8];
  }
  else if (IMOSLoggingEnabled())
  {
    unint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)setValue:(id)a3 ofProperty:(id)a4 ofPerson:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = +[IMDAccountController sharedAccountController];
  id v14 = [v13 sessionForAccount:v12];

  if (v14) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  int v16 = +[IMDAccountController sharedAccountController];
  id v17 = +[IMDAccountController sharedAccountController];
  unint64_t v18 = [v17 accountForAccountID:v12];
  int v19 = [v18 service];
  id v20 = [v19 internalName];
  id v14 = [v16 anySessionForServiceName:v20];

  if (v14)
  {
LABEL_7:
    [v14 setValue:v9 ofProperty:v10 ofPerson:v11];
  }
  else if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)requestGroupsAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDAccountController sharedAccountController];
  id v5 = [v4 sessionForAccount:v3];

  if (v5) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = +[IMDAccountController sharedAccountController];
  id v8 = +[IMDAccountController sharedAccountController];
  id v9 = [v8 accountForAccountID:v3];
  id v10 = [v9 service];
  id v11 = [v10 internalName];
  id v5 = [v7 anySessionForServiceName:v11];

  if (v5)
  {
LABEL_7:
    [v5 requestGroups];
  }
  else if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)sendNotificationMessageToUniqueID:(id)a3 withCommand:(int64_t)a4
{
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = +[NSNumber numberWithInteger:a4];
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Calling sendNotificationMessageToUniqueID with uniqueId %@ and command %@", (uint8_t *)&v9, 0x16u);
    }
  }
  id v8 = +[IMMessageNotificationController sharedInstance];
  [v8 sendNotificationMessageToUniqueID:v5 withCommmand:a4];
}

- (void)_initiateScreenSharingWithID:(id)a3 isContact:(BOOL)a4 sharingMyScreen:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if (qword_10007D330 != -1) {
    dispatch_once(&qword_10007D330, &stru_100071940);
  }
  if (off_10007D328)
  {
    id v8 = v7;
    int v9 = v8;
    if (v6)
    {
      id v10 = +[NSCharacterSet characterSetWithCharactersInString:@":"];
      __int16 v11 = [v10 invertedSet];
      int v9 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v11];
    }
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Initiating screen sharing with %@", (uint8_t *)&v16, 0xCu);
      }
    }
    int v13 = (void (*)(id, BOOL, BOOL))off_10007D328;
    id v14 = v9;
    v13([v14 UTF8String], v6, v5);
  }
  else if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Unable to weak link RFBStartAppleIDScreenSharingConnection. Screen sharing will be unavailable.", (uint8_t *)&v16, 2u);
    }
  }
}

- (void)inviteHandleIDToShareMyScreen:(id)a3 isContact:(BOOL)a4
{
}

- (void)askHandleIDToShareTheirScreen:(id)a3 isContact:(BOOL)a4
{
}

- (void)requestPendingVCInvites
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 136315138;
      id v4 = "-[IMDaemonAnyRequestHandler requestPendingVCInvites]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Ignoring request for %s", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)requestPendingACInvites
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 136315138;
      id v4 = "-[IMDaemonAnyRequestHandler requestPendingACInvites]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Ignoring request for %s", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)conference:(id)a3 account:(id)a4 notifyInvitationCancelledFromPerson:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[IMDaemonAnyRequestHandler conference:account:notifyInvitationCancelledFromPerson:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Ignoring request for %s", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)terminateForcingIfNeeded:(BOOL)a3
{
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      BOOL v5 = "-[IMDaemonAnyRequestHandler terminateForcingIfNeeded:]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Ignoring request for %s", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)sendNotice:(id)a3 toHandles:(id)a4 fromHandle:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t))a6;
  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412802;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Client request to send notice %@ toHandles %@ fromHandle: %@", (uint8_t *)&v16, 0x20u);
    }
  }
  id v14 = +[IMDCollaborationNoticeController sharedController];
  id v15 = [v14 noticeDispatcher];
  [v15 sendNotice:v9 toHandles:v10 fromHandle:v11];

  v12[2](v12, 1);
}

- (void)sendClearNotice:(id)a3 toHandles:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Client request to send clear notice %@ toHandles %@", (uint8_t *)&v13, 0x16u);
    }
  }
  id v11 = +[IMDCollaborationNoticeController sharedController];
  id v12 = [v11 noticeDispatcher];
  [v12 sendClearNotice:v7 toHandles:v8];

  v9[2](v9, 1);
}

- (NSMutableDictionary)downloadingCountDictionary
{
  return self->_downloadingCountDictionary;
}

- (void).cxx_destruct
{
}

@end