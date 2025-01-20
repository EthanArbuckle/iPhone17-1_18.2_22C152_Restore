@interface IMDChat
+ (BOOL)identifier:(id)a3 equalsIdentifier:(id)a4;
+ (IMDChat)chatWithSyncData:(id)a3;
+ (id)_recordType;
- (BOOL)_addGroupPhotoToCKRecord:(id)a3 error:(id *)a4;
- (BOOL)_convergesGroupPhotosForReplicationService:(id)a3;
- (BOOL)_convergesParticipantsForReplicationService:(id)a3;
- (BOOL)_otherChatExistsWithChatGUID:(id)a3;
- (BOOL)applyChangesUsingSyncData:(id)a3;
- (BOOL)containsActiveBIASession;
- (BOOL)createEngramGroupOnMessageSend;
- (BOOL)deleteBIAContext;
- (BOOL)downloadingPendingSatelliteMessages;
- (BOOL)hasFetchedPersistentMenu;
- (BOOL)hasHadSuccessfulQuery;
- (BOOL)hasScheduledMessage;
- (BOOL)isArchived;
- (BOOL)isBlackholed;
- (BOOL)isBusinessChat;
- (BOOL)isChatBot;
- (BOOL)isDeletingIncomingMessages;
- (BOOL)isDownloadingPendingSatelliteMessages;
- (BOOL)isEmergencyChat;
- (BOOL)isGroupChat;
- (BOOL)isNewerThan:(id)a3;
- (BOOL)isOlderThan:(id)a3;
- (BOOL)isOscarChat;
- (BOOL)isRecovered;
- (BOOL)isSMS;
- (BOOL)isSMSSpam;
- (BOOL)isStewieChat;
- (BOOL)isStewieEmergencyChat;
- (BOOL)isStewieRoadsideChat;
- (BOOL)isStewieSharingChat;
- (BOOL)isUnnamedChat;
- (BOOL)isiMessageSpam;
- (BOOL)lastKnownHybridState;
- (BOOL)meCardUpdated;
- (BOOL)pendingENGroupParticipantUpdate;
- (BOOL)receivedBlackholeError;
- (BOOL)removeParticipant:(id)a3;
- (BOOL)removeParticipants:(id)a3;
- (BOOL)setAutoDonationBehavior:(int64_t)a3 lastModificationDate:(id)a4;
- (BOOL)updateDonationStateWithSyndicationAction:(id)a3;
- (BOOL)updateProperties:(id)a3;
- (BOOL)updateProperties:(id)a3 shouldBroadcast:(BOOL)a4;
- (BOOL)wasDowngradedToLiteMessage;
- (BOOL)wasReportedAsJunk;
- (IMDAccount)account;
- (IMDChat)initWithAccountID:(id)a3 service:(id)a4 guid:(id)a5 groupID:(id)a6 chatIdentifier:(id)a7 participants:(id)a8 roomName:(id)a9 displayName:(id)a10 lastAddressedLocalHandle:(id)a11 lastAddressedSIMID:(id)a12 properties:(id)a13 state:(int64_t)a14 style:(unsigned __int8)a15 isFiltered:(int64_t)a16 hasHadSuccessfulQuery:(BOOL)a17 engramID:(id)a18 serverChangeToken:(id)a19 cloudKitSyncState:(int64_t)a20 originalGroupID:(id)a21 lastReadMessageTimeStamp:(int64_t)a22 lastMessageTimeStampOnLoad:(int64_t)a23 cloudKitRecordID:(id)a24 isBlackholed:(BOOL)a25 autoDonationBehavior:(int64_t)a26 autoDonationBehaviorLastModificationDate:(id)a27 isRecovered:(BOOL)a28 isDeletingIncomingMessages:(BOOL)a29;
- (IMDHandle)recipient;
- (IMDService)service;
- (IMDServiceSession)serviceSession;
- (IMDaemonListenerChatProtocol)broadcaster;
- (IMMessageItem)lastMessage;
- (IMSharedEmergencyInfo)emergencyUserInfo;
- (NSArray)alternativeSpeakableMatches;
- (NSArray)participants;
- (NSArray)replySuggestions;
- (NSDate)autoDonationBehaviorLastModificationDate;
- (NSDate)lastReplicationSinceLoadDate;
- (NSDate)lastScheduledMessageCreatedDate;
- (NSDate)lastSentDowngradeRequestSinceLoadDate;
- (NSDate)lastTUConversationCreatedDate;
- (NSDate)requestedDowngradeExpirationDate;
- (NSDictionary)chatProperties;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)keyTransparencyURIToUUIDMapping;
- (NSDictionary)nicknamesForParticipants;
- (NSDictionary)properties;
- (NSNumber)cachedStewieSharingChat;
- (NSString)accountID;
- (NSString)businessName;
- (NSString)chatIdentifier;
- (NSString)cloudKitRecordID;
- (NSString)description;
- (NSString)deviceIndependentID;
- (NSString)displayName;
- (NSString)engramID;
- (NSString)groupID;
- (NSString)guid;
- (NSString)lastAddressedLocalHandle;
- (NSString)lastAddressedSIMID;
- (NSString)lastSeenMessageGuid;
- (NSString)originalGroupID;
- (NSString)personCentricID;
- (NSString)pinningIdentifier;
- (NSString)pronunciationHint;
- (NSString)requestedDowngradeService;
- (NSString)roomName;
- (NSString)serverChangeToken;
- (NSString)serviceName;
- (id)BIAContext;
- (id)_chatRegistry;
- (id)_ckUniqueID;
- (id)_copyCKRecordFromExistingCKMetadataWithZoneID:(id)a3 salt:(id)a4;
- (id)_expectedGUID;
- (id)_findChatParticipantsWithFromID:(id)a3;
- (id)_mergeParticipantIDs;
- (id)_sortedParticipantIDHashForParticipants:(id)a3;
- (id)_sortedParticipantIDHashForParticipants:(id)a3 usesPersonCentricID:(BOOL)a4;
- (id)associatedBusinessID;
- (id)cloudKitChatID;
- (id)cloudKitDebugDescription;
- (id)compressedProtobufDataForChatProto1;
- (id)copyCKRecordRepresentationWithZoneID:(id)a3 salt:(id)a4 error:(id *)a5;
- (id)copyDictionaryRepresentation:(BOOL)a3;
- (id)dictionaryRepresentationIncludingLastMessage;
- (id)generateNewGroupID;
- (id)groupPhotoGuid;
- (id)groupPhotoUploadFailureCount;
- (id)lastSentMessageDate;
- (id)lastTranslatableMessageGUIDWithLanguageCode:(id)a3;
- (id)lastUsedBIAReferenceID;
- (id)lastUsedBIAUserID;
- (id)participantHandles;
- (id)spamExtensionName;
- (int)emergencyTranscriptSharingState;
- (int)getNumberOfTimesRespondedToThread;
- (int)messageHandshakeState;
- (int)smsHandshakeState;
- (int64_t)autoDonationBehavior;
- (int64_t)cloudKitSyncState;
- (int64_t)compareBySequenceNumberAndDateDescending:(id)a3;
- (int64_t)engroupCreationDate;
- (int64_t)groupParticipantVersion;
- (int64_t)isFiltered;
- (int64_t)lastMessageTimeStampOnLoad;
- (int64_t)lastReadMessageTimeStamp;
- (int64_t)lastSentDowngradeRequestSinceLoadSessionIndex;
- (int64_t)pendingIncomingSatelliteMessageCount;
- (int64_t)rowID;
- (int64_t)spamCategory;
- (int64_t)state;
- (unint64_t)numMessagesSent;
- (unint64_t)powerLogConversationType;
- (unint64_t)repairHistory;
- (unint64_t)unreadCount;
- (unsigned)style;
- (void)_convergeGroupChatIfNeededWithServiceSession:(id)a3 account:(id)a4 replicationService:(id)a5 groupID:(id)a6 incomingParticipants:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 receivedGroupParticipantVersion:(id)a10 receivedGroupProtocolVersion:(id)a11 messageTimeStamp:(id)a12 groupPhotoCreationTime:(id)a13;
- (void)_incrementParticipantVersion;
- (void)_indexChatAndMessagesToSpotlightWithReason:(int64_t)a3;
- (void)_modifyGroupWithServiceSession:(id)a3 groupID:(id)a4 toParticipants:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 account:(id)a8 messageTimeStamp:(id)a9;
- (void)_persistMergedIDMergedChatsIfNeeded:(id)a3;
- (void)_repairChatIfNeeded;
- (void)_repairGUIDIfNeeded;
- (void)_repairMissingServiceName;
- (void)_repairParticipantForChatIDHandleIDMismatch;
- (void)_repairUnregisteredChatIfNeeded;
- (void)_resetGUIDToExpectedGUID:(id)a3;
- (void)_setAutoDonationBehavior:(int64_t)a3 lastModificationDate:(id)a4 setDirtyFlag:(BOOL)a5;
- (void)_setParticipantVersion:(int64_t)a3;
- (void)_setRowID:(int64_t)a3;
- (void)_setUnreadCount:(unint64_t)a3;
- (void)_updateCachedParticipants;
- (void)_updateIsRecovered:(BOOL)a3 silently:(BOOL)a4;
- (void)_updateLastMessage:(id)a3;
- (void)_updateRepairHistoryWithRepairHistory:(unint64_t)a3;
- (void)addBIAContextWithUserID:(id)a3 referenceID:(id)a4;
- (void)addParticipant:(id)a3;
- (void)addParticipants:(id)a3;
- (void)dealloc;
- (void)meCardHasUpdated;
- (void)recoverParticipantsIfNeeded;
- (void)resetCKSyncState;
- (void)resetParticipants:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setCachedStewieSharingChat:(id)a3;
- (void)setChatIdentifier:(id)a3;
- (void)setCloudKitRecordID:(id)a3;
- (void)setCloudKitSyncState:(int64_t)a3;
- (void)setCreateEngramGroupOnMessageSend:(BOOL)a3;
- (void)setDeletingIncomingMessages:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmergencyUserInfo:(id)a3;
- (void)setEngramID:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setGroupParticipantVersion:(int64_t)a3;
- (void)setGuid:(id)a3;
- (void)setHasHadSuccessfulQuery:(BOOL)a3;
- (void)setHasScheduledMessage:(BOOL)a3;
- (void)setIsBlackholed:(BOOL)a3;
- (void)setIsDownloadingPendingSatelliteMessages:(BOOL)a3;
- (void)setIsFiltered:(int64_t)a3;
- (void)setLastAddressedLocalHandle:(id)a3;
- (void)setLastAddressedSIMID:(id)a3;
- (void)setLastMessage:(id)a3;
- (void)setLastMessageTimeStampOnLoad:(int64_t)a3;
- (void)setLastReadMessageTimeStamp:(int64_t)a3;
- (void)setLastReplicationSinceLoadDate:(id)a3;
- (void)setLastScheduledMessageCreatedDate:(id)a3;
- (void)setLastSentDowngradeRequestSinceLoadDate:(id)a3;
- (void)setLastSentDowngradeRequestSinceLoadSessionIndex:(int64_t)a3;
- (void)setLastSentMessageDate:(id)a3;
- (void)setLastTUConversationCreatedDate:(id)a3;
- (void)setMeCardUpdated:(BOOL)a3;
- (void)setNumMessagesSent:(unint64_t)a3;
- (void)setOriginalGroupID:(id)a3;
- (void)setOscarChat:(BOOL)a3;
- (void)setParticipants:(id)a3;
- (void)setPendingENGroupParticipantUpdate:(BOOL)a3;
- (void)setPendingIncomingSatelliteMessageCount:(int64_t)a3;
- (void)setProperties:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setRecovered:(BOOL)a3;
- (void)setRepairHistory:(unint64_t)a3;
- (void)setReplySuggestions:(id)a3;
- (void)setRequestedDowngradeExpirationDate:(id)a3;
- (void)setRequestedDowngradeService:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStyle:(unsigned __int8)a3;
- (void)setWasDowngradedToLiteMessage:(BOOL)a3;
- (void)setWasReportedAsJunk:(BOOL)a3;
- (void)storeAndBroadcastChatChanges;
- (void)tearDownToneNotificationSessionIfNeeded;
- (void)updateAssociatedBusinessID:(id)a3;
- (void)updateCloudKitRecordID:(id)a3;
- (void)updateCloudKitSyncState:(int64_t)a3;
- (void)updateCollaborationMetadata:(id)a3 forMessageGUID:(id)a4;
- (void)updateDisplayName:(id)a3;
- (void)updateDisplayName:(id)a3 sender:(id)a4;
- (void)updateEmergencyTranscriptSharingStateChatProperty:(int)a3;
- (void)updateEngramID:(id)a3;
- (void)updateEngroupCreationDate:(int64_t)a3;
- (void)updateGroupID:(id)a3;
- (void)updateGroupPhotoGuid:(id)a3;
- (void)updateGroupPhotoUploadFailureCount:(id)a3;
- (void)updateHasCancellableScheduledMessage:(BOOL)a3;
- (void)updateHasHadSuccessfulQuery:(BOOL)a3;
- (void)updateIsBlackholed:(BOOL)a3;
- (void)updateIsDeletingIncomingMessages:(BOOL)a3;
- (void)updateIsDownloadingPendingSatelliteMessages:(BOOL)a3;
- (void)updateIsEmergencyChat:(BOOL)a3;
- (void)updateIsFiltered:(int64_t)a3;
- (void)updateIsRecovered:(BOOL)a3;
- (void)updateIsiMessageSpam:(BOOL)a3;
- (void)updateLastAddressedHandle:(id)a3;
- (void)updateLastAddressedHandle:(id)a3 forceUpdate:(BOOL)a4;
- (void)updateLastAddressedHandle:(id)a3 forceUpdateHandle:(BOOL)a4 lastAddressedSIMID:(id)a5;
- (void)updateLastAddressedSIMID:(id)a3;
- (void)updateLastKnownHybridStateAndRemergeIfAppropriate:(BOOL)a3;
- (void)updateLastMessageGUID:(id)a3 forLanguageCode:(id)a4;
- (void)updateLastReadMessageTimeStampIfNeeded:(int64_t)a3;
- (void)updateLastSeenMessageGuidIfNeeded:(id)a3;
- (void)updateMessageHandshakeState:(int)a3;
- (void)updateNicknamesForParticipants:(id)a3;
- (void)updateNumberOfTimesRespondedToThread;
- (void)updateOriginalGroupID:(id)a3;
- (void)updatePendingIncomingSatelliteMessageCount:(int64_t)a3;
- (void)updateReceivedBlackholeError:(BOOL)a3;
- (void)updateSMSCategory:(int64_t)a3 subCategory:(int64_t)a4;
- (void)updateSMSHandshakeState:(int)a3;
- (void)updateSMSSpamExtensionNameChatProperty:(id)a3;
- (void)updateServerChangeToken:(id)a3;
- (void)updateShouldForceToSMS:(BOOL)a3;
@end

@implementation IMDChat

- (unint64_t)unreadCount
{
  [(NSRecursiveLock *)self->_lock lock];
  unint64_t unreadCount = self->_unreadCount;
  [(NSRecursiveLock *)self->_lock unlock];
  return unreadCount;
}

- (BOOL)isBlackholed
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isBlackholed = self->_isBlackholed;
  [(NSRecursiveLock *)self->_lock unlock];
  return isBlackholed;
}

- (NSString)guid
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = (void *)[(NSString *)self->_guid copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)personCentricID
{
  v16 = (void *)MEMORY[0x1E4F6E670];
  v3 = [(IMDChat *)self guid];
  v4 = [(IMDChat *)self chatIdentifier];
  uint64_t v5 = [(IMDChat *)self style];
  v6 = [(IMDChat *)self groupID];
  v7 = [(IMDChat *)self displayName];
  BOOL v8 = [(IMDChat *)self lastKnownHybridState];
  v9 = [(IMDChat *)self account];
  v10 = [v9 service];
  char v11 = [v10 groupsMergeDisplayNames];
  v12 = [(IMDChat *)self _mergeParticipantIDs];
  LOBYTE(v15) = v11;
  v13 = [v16 personCentricIDForChatWithGUID:v3 chatIdentifier:v4 chatStyle:v5 groupID:v6 displayName:v7 lastKnownToBeHybrid:v8 mergeDisplayNames:v15 participantIDs:v12];

  return (NSString *)v13;
}

- (int64_t)compareBySequenceNumberAndDateDescending:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMDChat *)self lastScheduledMessageCreatedDate];
  v6 = [v4 lastScheduledMessageCreatedDate];
  v7 = [(IMDChat *)self lastMessage];
  uint64_t v8 = [v7 time];
  if (v5)
  {
    uint64_t v9 = [v5 laterDate:v8];

    uint64_t v8 = v9;
  }

  v10 = [v4 lastMessage];
  uint64_t v11 = [v10 time];
  if (v6)
  {
    uint64_t v12 = [v6 laterDate:v11];

    uint64_t v11 = v12;
  }

  if (v11 && v8) {
    goto LABEL_7;
  }
  if (v11 | v8)
  {
    if (!v11)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v4, "lastMessageTimeStampOnLoad"));
      uint64_t v11 = (uint64_t)v13;
LABEL_8:
      int64_t v14 = [v13 compare:v8];
      if (v14) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (!v8)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)-[IMDChat lastMessageTimeStampOnLoad](self, "lastMessageTimeStampOnLoad"));
LABEL_7:
      v13 = (void *)v11;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v15 = [v4 lastMessageTimeStampOnLoad];
    if (v15 != [(IMDChat *)self lastMessageTimeStampOnLoad])
    {
      uint64_t v21 = [v4 lastMessageTimeStampOnLoad];
      uint64_t v11 = 0;
      uint64_t v8 = 0;
      if (v21 < [(IMDChat *)self lastMessageTimeStampOnLoad]) {
        int64_t v14 = -1;
      }
      else {
        int64_t v14 = 1;
      }
      goto LABEL_23;
    }
    uint64_t v11 = 0;
    uint64_t v8 = 0;
  }
LABEL_15:
  v16 = [(IMDChat *)self lastMessage];
  uint64_t v17 = [v16 messageID];

  v18 = [v4 lastMessage];
  uint64_t v19 = [v18 messageID];

  uint64_t v20 = -1;
  if (v19 >= v17) {
    uint64_t v20 = 1;
  }
  if (v19 == v17) {
    int64_t v14 = 0;
  }
  else {
    int64_t v14 = v20;
  }
LABEL_23:

  return v14;
}

- (NSDate)lastScheduledMessageCreatedDate
{
  v2 = [(IMDChat *)self properties];
  v3 = [v2 objectForKey:@"lastScheduledMessageCreatedDate"];

  return (NSDate *)v3;
}

- (NSString)deviceIndependentID
{
  if ([(IMDChat *)self isGroupChat]) {
    [(IMDChat *)self groupID];
  }
  else {
  v3 = [(IMDChat *)self persistentID];
  }

  return (NSString *)v3;
}

- (NSString)pinningIdentifier
{
  if ([(IMDChat *)self isGroupChat] && [(IMDChat *)self isSMS])
  {
    v3 = [(IMDChat *)self participants];
    id v4 = [(IMDChat *)self _sortedParticipantIDHashForParticipants:v3 usesPersonCentricID:0];
  }
  else
  {
    id v4 = [(IMDChat *)self deviceIndependentID];
  }

  return (NSString *)v4;
}

- (BOOL)isGroupChat
{
  return [(IMDChat *)self style] != 45;
}

- (IMMessageItem)lastMessage
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = self->_lastMessage;
  [(NSRecursiveLock *)self->_lock unlock];

  return v3;
}

- (NSDictionary)properties
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = self->_properties;
  [(NSRecursiveLock *)self->_lock unlock];

  return v3;
}

- (NSString)chatIdentifier
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = (void *)[(NSString *)self->_chatIdentifier copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (unsigned)style
{
  [(NSRecursiveLock *)self->_lock lock];
  unsigned __int8 style = self->_style;
  [(NSRecursiveLock *)self->_lock unlock];
  return style;
}

- (NSString)groupID
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = (void *)[(NSString *)self->_groupID copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (BOOL)isSMS
{
  v2 = [(IMDChat *)self serviceName];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F6E1A0]];

  return v3;
}

- (NSString)serviceName
{
  [(NSRecursiveLock *)self->_lock lock];
  char v3 = (void *)[(NSString *)self->_serviceName copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (NSString)displayName
{
  [(NSRecursiveLock *)self->_lock lock];
  char v3 = (void *)[(NSString *)self->_displayName copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (BOOL)lastKnownHybridState
{
  v2 = [(IMDChat *)self properties];
  char v3 = [v2 valueForKey:*MEMORY[0x1E4F6CDA8]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)_mergeParticipantIDs
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  char v4 = [(IMDChat *)self participants];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = [(IMDChat *)self participants];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 personCentricID];
        if (objc_msgSend(v12, "__im_isSipHandle"))
        {
        }
        else
        {
          int v13 = IMSharedHelperContactsBasedMergingEnabled();

          if (v13)
          {
            uint64_t v14 = [v11 CNContactID];
LABEL_12:
            uint64_t v15 = (__CFString *)v14;
            goto LABEL_14;
          }
        }
        if (IMSharedHelperPersonCentricMergingEnabled())
        {
          uint64_t v14 = [v11 personCentricID];
          goto LABEL_12;
        }
        uint64_t v15 = 0;
LABEL_14:
        if (![(__CFString *)v15 length])
        {
          uint64_t v16 = [v11 ID];

          uint64_t v15 = (__CFString *)v16;
        }
        if ([(__CFString *)v15 length]) {
          uint64_t v17 = v15;
        }
        else {
          uint64_t v17 = @"invalidHandle";
        }
        [v5 addObject:v17];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)participants
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = (void *)[(NSArray *)self->_participants copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSArray *)v3;
}

- (NSString)originalGroupID
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = (void *)[(NSString *)self->_originalGroupID copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (id)copyDictionaryRepresentation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(IMDChat *)self accountID];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [(NSRecursiveLock *)self->_lock lock];
    uint64_t v7 = (void *)[(NSMutableDictionary *)self->_chatInfo mutableCopy];
    if (v3)
    {
      uint64_t v8 = [(IMDChat *)self lastMessage];
      uint64_t v9 = (void *)[v8 copyDictionaryRepresentation];

      [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F6CDB0]];
    }
    v10 = [(IMDChat *)self personCentricID];
    [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F6CE00]];

    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    uint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1D9902EFC();
    }

    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1D9902E74(self);
    }

    int v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1D9902DEC(self);
    }

    return 0;
  }
  return v7;
}

- (IMDAccount)account
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDChat *)self accountID];

  if (!v3) {
    goto LABEL_3;
  }
  char v4 = +[IMDAccountController sharedAccountController];
  uint64_t v5 = [(IMDChat *)self accountID];
  uint64_t v6 = [v4 accountForAccountID:v5];

  if (!v6)
  {
LABEL_3:
    uint64_t v7 = [(IMDChat *)self serviceName];

    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v8 = +[IMDServiceController sharedController];
    uint64_t v9 = [(IMDChat *)self serviceName];
    v10 = [v8 serviceWithName:v9];

    if (v10)
    {
      uint64_t v11 = +[IMDAccountController sharedAccountController];
      uint64_t v12 = [v11 accountsForService:v10];
      uint64_t v6 = objc_msgSend(v12, "__imFirstObject");

      if (IMOSLoggingEnabled())
      {
        int v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 138412546;
          v18 = self;
          __int16 v19 = 2112;
          long long v20 = v6;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEBUG, "Reassociating chat: %@  to account: %@", (uint8_t *)&v17, 0x16u);
        }
      }
      uint64_t v14 = [v6 accountID];
      [(IMDChat *)self setAccountID:v14];

      uint64_t v15 = [v10 internalName];
      [(IMDChat *)self setServiceName:v15];
    }
    else
    {
LABEL_10:
      uint64_t v6 = 0;
    }
  }

  return (IMDAccount *)v6;
}

- (NSString)accountID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  accountID = self->_accountID;
  [(NSRecursiveLock *)self->_lock unlock];
  if (accountID)
  {
    char v4 = self->_accountID;
  }
  else
  {
    uint64_t v5 = [(IMDChat *)self serviceName];

    if (!v5) {
      goto LABEL_10;
    }
    uint64_t v6 = +[IMDServiceController sharedController];
    uint64_t v7 = [(IMDChat *)self serviceName];
    uint64_t v8 = [v6 serviceWithName:v7];

    if (v8)
    {
      uint64_t v9 = +[IMDAccountController sharedAccountController];
      v10 = [v9 accountsForService:v8];
      uint64_t v11 = objc_msgSend(v10, "__imFirstObject");

      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          int v16 = 138412546;
          int v17 = self;
          __int16 v18 = 2112;
          __int16 v19 = v11;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_DEBUG, "Reassociating chat: %@  to account: %@", (uint8_t *)&v16, 0x16u);
        }
      }
      int v13 = [v11 accountID];
      [(IMDChat *)self setAccountID:v13];

      uint64_t v14 = [v8 internalName];
      [(IMDChat *)self setServiceName:v14];

      char v4 = [v11 accountID];
    }
    else
    {
LABEL_10:
      char v4 = 0;
    }
  }

  return v4;
}

- (id)_sortedParticipantIDHashForParticipants:(id)a3 usesPersonCentricID:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "personCentricID", (void)v21);
        uint64_t v14 = [v13 length];

        if (v14) {
          BOOL v15 = !v4;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
          int v16 = [v12 ID];

          if (!v16) {
            continue;
          }
          uint64_t v17 = [v12 ID];
        }
        else
        {
          uint64_t v17 = [v12 personCentricID];
        }
        __int16 v18 = (void *)v17;
        [v6 addObject:v17];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  __int16 v19 = IMSHA1HashFromStrings();

  return v19;
}

- (int64_t)lastMessageTimeStampOnLoad
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t lastMessageTimeStampOnLoad = self->_lastMessageTimeStampOnLoad;
  [(NSRecursiveLock *)self->_lock unlock];
  return lastMessageTimeStampOnLoad;
}

- (int64_t)state
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t state = self->_state;
  [(NSRecursiveLock *)self->_lock unlock];
  return state;
}

- (id)groupPhotoGuid
{
  v2 = [(IMDChat *)self properties];
  BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4F6CD48]];

  return v3;
}

- (IMDServiceSession)serviceSession
{
  v2 = [(IMDChat *)self account];
  BOOL v3 = [v2 session];

  return (IMDServiceSession *)v3;
}

- (id)_findChatParticipantsWithFromID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(IMDChat *)self participants];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) ID];
        if ([v11 length])
        {
          uint64_t v12 = [v11 _stripFZIDPrefix];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (v4)
  {
    int v13 = [v4 _stripFZIDPrefix];
    [v5 addObject:v13];
  }

  return v5;
}

- (void)_setParticipantVersion:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = IMOSLoggingEnabled();
  if (a3 < 0)
  {
    if (v5)
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Received a negative participant version. This is not right!", (uint8_t *)&v9, 2u);
      }
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [(IMDChat *)self groupID];
        int v9 = 138412546;
        uint64_t v10 = v7;
        __int16 v11 = 2048;
        int64_t v12 = a3;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Setting participant version of chat %@ to %ld", (uint8_t *)&v9, 0x16u);
      }
    }
    [(IMDChat *)self setGroupParticipantVersion:a3];
  }
}

- (void)_incrementParticipantVersion
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(IMDChat *)self groupID];
      int v5 = 138412546;
      id v6 = v4;
      __int16 v7 = 2048;
      int64_t v8 = [(IMDChat *)self groupParticipantVersion];
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Incrementing participant version of chat %@ to %ld", (uint8_t *)&v5, 0x16u);
    }
  }
  [(IMDChat *)self setGroupParticipantVersion:[(IMDChat *)self groupParticipantVersion] + 1];
}

- (void)_modifyGroupWithServiceSession:(id)a3 groupID:(id)a4 toParticipants:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 account:(id)a8 messageTimeStamp:(id)a9
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v56 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v62 = a9;
  v63 = v18;
  if (!v18)
  {
    v63 = [v64 account];
  }
  __int16 v19 = [v16 _stripFZIDPrefix];

  v59 = [v17 _stripFZIDPrefix];

  objc_msgSend(v15, "__imArrayByApplyingBlock:", &unk_1F33909A0);
  uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  int v57 = [v19 isEqualToIgnoringCase:v59];
  if (IMOSLoggingEnabled())
  {
    long long v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v77 = v20;
      __int16 v78 = 2112;
      v79 = v19;
      __int16 v80 = 2112;
      v81 = v59;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, " Updating participants: %@ toIdentifier: %@, fromIdentifier: %@", buf, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      long long v23 = [(IMDChat *)self participants];
      *(_DWORD *)buf = 138412290;
      v77 = v23;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Chat participants before converge %@", buf, 0xCu);
    }
  }
  long long v24 = [(IMDChat *)self participants];
  v58 = [v24 arrayByApplyingSelector:sel_ID];

  v65 = [MEMORY[0x1E4F1CAD0] setWithArray:v58];
  v25 = (__CFString *)[v58 mutableCopy];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obuint64_t j = v20;
  char v26 = 0;
  uint64_t v27 = [(__CFString *)obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v27)
  {
    char v61 = 0;
    uint64_t v28 = *(void *)v71;
    if (v57) {
      v29 = 0;
    }
    else {
      v29 = v59;
    }
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v71 != v28) {
          objc_enumerationMutation(obj);
        }
        v31 = *(__CFString **)(*((void *)&v70 + 1) + 8 * i);
        if (([v65 containsObject:v31] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v77 = v31;
              _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "   Adding participant: %@", buf, 0xCu);
            }
          }
          v33 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_iMessageDateFromTimeStamp:", v62);
          if ([(__CFString *)v31 isEqualToString:v59])
          {
            uint64_t v34 = [v33 dateByAddingTimeInterval:-0.000002];

            char v61 = 1;
            v33 = (void *)v34;
          }
          v35 = [(IMDChat *)self chatIdentifier];
          LOBYTE(v55) = [(IMDChat *)self style];
          id v36 = (id)[v64 didChangeMemberStatus:2 forHandle:v31 fromHandle:v29 unformattedNumber:0 countryCode:0 forChat:v35 style:v55 account:v63 destinationCallerID:v19 messageTime:v33];

          char v26 = 1;
        }
        [(__CFString *)v25 removeObject:v31];
      }
      uint64_t v27 = [(__CFString *)obj countByEnumeratingWithState:&v70 objects:v75 count:16];
    }
    while (v27);
  }
  else
  {
    char v61 = 0;
  }

  if (IMOSLoggingEnabled())
  {
    v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v25;
      _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "   Participants to be removed %@", buf, 0xCu);
    }
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v38 = v25;
  uint64_t v39 = [(__CFString *)v38 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v67;
    if (v57) {
      v41 = 0;
    }
    else {
      v41 = v59;
    }
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v67 != v40) {
          objc_enumerationMutation(v38);
        }
        v43 = *(__CFString **)(*((void *)&v66 + 1) + 8 * j);
        if (([(__CFString *)v43 isEqualToIgnoringCase:v19] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v44 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v77 = v43;
              _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "   Removing participant: %@", buf, 0xCu);
            }
          }
          v45 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_iMessageDateFromTimeStamp:", v62);
          v46 = v45;
          if (v61)
          {
            uint64_t v47 = [v45 dateByAddingTimeInterval:-0.000001];

            v46 = (void *)v47;
          }
          v48 = [(IMDChat *)self chatIdentifier];
          LOBYTE(v55) = [(IMDChat *)self style];
          id v49 = (id)[v64 didChangeMemberStatus:3 forHandle:v43 fromHandle:v41 unformattedNumber:0 countryCode:0 forChat:v48 style:v55 account:v63 destinationCallerID:v19 messageTime:v46];

          char v26 = 1;
        }
      }
      uint64_t v39 = [(__CFString *)v38 countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v39);
  }

  if (IMOSLoggingEnabled())
  {
    v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = [(IMDChat *)self participants];
      *(_DWORD *)buf = 138412290;
      v77 = v51;
      _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "Chat participants after converge %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v52 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = @"NO";
      if (v26) {
        v53 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v77 = v53;
      _os_log_impl(&dword_1D967A000, v52, OS_LOG_TYPE_INFO, "Group changed and will write to db? %@", buf, 0xCu);
    }
  }
  if (v26)
  {
    v54 = +[IMDChatStore sharedInstance];
    [v54 storeChat:self];
  }
}

- (BOOL)_convergesGroupPhotosForReplicationService:(id)a3
{
  return 1;
}

- (BOOL)_convergesParticipantsForReplicationService:(id)a3
{
  if (a3) {
    return [a3 supportsCapability:*MEMORY[0x1E4F6E040]] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)_convergeGroupChatIfNeededWithServiceSession:(id)a3 account:(id)a4 replicationService:(id)a5 groupID:(id)a6 incomingParticipants:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 receivedGroupParticipantVersion:(id)a10 receivedGroupProtocolVersion:(id)a11 messageTimeStamp:(id)a12 groupPhotoCreationTime:(id)a13
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v55 = a4;
  id v57 = a5;
  id v60 = a6;
  id v62 = a7;
  id v58 = a8;
  id v19 = a9;
  id v20 = a10;
  id v65 = a11;
  id v63 = a12;
  id v64 = a13;
  long long v21 = self;
  v59 = [(IMDChat *)self _findChatParticipantsWithFromID:v19];
  long long v22 = objc_msgSend(v62, "__imArrayByApplyingBlock:", &unk_1F33909C0);
  long long v23 = objc_msgSend(v22, "__imSetFromArray");

  int v24 = [v59 isEqualToSet:v23];
  uint64_t v25 = [(IMDChat *)v21 groupParticipantVersion];
  char v26 = [(IMDChat *)v21 properties];
  char v61 = [v26 objectForKey:qword_1EA8C7048];

  v54 = v19;
  uint64_t v27 = [v63 longLongValue] / 1000000000;
  uint64_t v28 = v27 - [v61 longLongValue];
  if (IMOSLoggingEnabled())
  {
    v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219778;
      uint64_t v69 = v25;
      __int16 v70 = 2112;
      id v71 = v20;
      __int16 v72 = 2048;
      uint64_t v73 = v28;
      __int16 v74 = 2048;
      uint64_t v75 = [v61 longLongValue];
      __int16 v76 = 2048;
      uint64_t v77 = [v63 longLongValue] / 1000000000;
      v30 = @"YES";
      __int16 v78 = 2112;
      id v79 = v62;
      __int16 v80 = 2112;
      id v81 = v65;
      if (!v24) {
        v30 = @"NO";
      }
      __int16 v82 = 2112;
      v83 = v30;
      _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "receiveMessageData localVersion: %ld, receivedGroupParticipantVersion: %@, timeDifference: %lld, lastUpdated:%lld, timestamp:%lld, incomingParticipants: %@, protocolVersion: %@, isIncomingParticipantSetSame %@", buf, 0x52u);
    }
  }
  if (v25 <= [v20 integerValue])
  {
    if (v28 < 11)
    {
      int v31 = 0;
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  int v31 = 0;
  if (v65) {
    char v32 = 1;
  }
  else {
    char v32 = v24;
  }
  if ((v32 & 1) == 0 && v28 >= 11)
  {
LABEL_16:
    if (v25 == [v20 integerValue]) {
      int v31 = v24 ^ 1;
    }
    else {
      int v31 = 1;
    }
  }
LABEL_19:
  v33 = +[IMDFileTransferCenter sharedInstance];
  uint64_t v34 = [(IMDChat *)v21 groupPhotoGuid];
  v35 = [v33 transferForGUID:v34];

  if ([v64 unsignedLongLongValue])
  {
    uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_iMessageDateFromTimeStamp:", v64);
    v37 = (void *)v36;
    if (v35 && v36)
    {
      v38 = [v35 refreshDate];
      if ([v38 compare:v37] == -1)
      {
        BOOL v39 = [(IMDChat *)v21 _convergesGroupPhotosForReplicationService:v57];

        if (!v39) {
          goto LABEL_27;
        }
        [v35 setRefreshDate:v37];
        v38 = +[IMDAttachmentStore sharedInstance];
        uint64_t v40 = [v35 messageGUID];
        [v38 storeAttachment:v35 associateWithMessageWithGUID:v40];
      }
    }
  }
  else
  {
    v37 = 0;
  }
LABEL_27:
  if (v65)
  {
    if (v31)
    {
      if ([(IMDChat *)v21 _convergesParticipantsForReplicationService:v57])
      {
        int v41 = 1;
        goto LABEL_40;
      }
      if (IMOSLoggingEnabled())
      {
        v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Not converging participants, replication service does not permit it", buf, 2u);
        }
LABEL_38:
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Not converging participants. Message from legacy device", buf, 2u);
    }
    goto LABEL_38;
  }
  int v41 = 0;
LABEL_40:
  if (IMOSLoggingEnabled())
  {
    v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = @"NO";
      if (v41) {
        v44 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v69 = (uint64_t)v44;
      _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "shouldConvergeParticipants: %@", buf, 0xCu);
    }
  }
  if ([v60 length])
  {
    unint64_t v45 = [v23 count];
    if (v54)
    {
      if (v58 && v45 >= 2)
      {
        int v46 = [(IMDChat *)v21 style];
        char v47 = v41 ^ 1;
        if (v46 == 45) {
          char v47 = 1;
        }
        if ((v47 & 1) == 0)
        {
          if (v20)
          {
            if (v25 != [v20 integerValue])
            {
              if (IMOSLoggingEnabled())
              {
                v48 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v69 = (uint64_t)v20;
                  _os_log_impl(&dword_1D967A000, v48, OS_LOG_TYPE_INFO, "Setting participant version to version received: %@", buf, 0xCu);
                }
              }
              if ([v20 integerValue] > v25)
              {
                id v49 = [(IMDChat *)v21 chatIdentifier];
                objc_msgSend(v56, "didUpdateChatStatus:chat:style:", 2, v49, -[IMDChat style](v21, "style"));
              }
              -[IMDChat _setParticipantVersion:](v21, "_setParticipantVersion:", [v20 integerValue]);
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              v50 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "Incrementing participant version by 1 on message receive.", buf, 2u);
              }
            }
            [(IMDChat *)v21 _incrementParticipantVersion];
            v51 = [(IMDChat *)v21 chatIdentifier];
            objc_msgSend(v56, "didUpdateChatStatus:chat:style:", 2, v51, -[IMDChat style](v21, "style"));
          }
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = sub_1D96DD160;
          v66[3] = &unk_1E6B72B30;
          id v52 = v54;
          id v67 = v52;
          v53 = objc_msgSend(v62, "__imArrayByFilteringWithBlock:", v66);
          [(IMDChat *)v21 _modifyGroupWithServiceSession:v56 groupID:v60 toParticipants:v53 toIdentifier:v52 fromIdentifier:v58 account:v55 messageTimeStamp:v63];
        }
      }
    }
  }
}

- (NSString)pronunciationHint
{
  return 0;
}

- (NSArray)alternativeSpeakableMatches
{
  return 0;
}

- (unint64_t)powerLogConversationType
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(IMDChat *)self participants];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) isBusiness])
        {

          return 2;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  return [(IMDChat *)self style] != 45;
}

- (void)_repairChatIfNeeded
{
  [(IMDChat *)self _repairGUIDIfNeeded];

  MEMORY[0x1F4181798](self, sel__repairParticipantForChatIDHandleIDMismatch);
}

- (void)_repairUnregisteredChatIfNeeded
{
}

- (void)_repairGUIDIfNeeded
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDChat *)self chatIdentifier];
  if ([v3 length])
  {
    uint64_t v4 = [(IMDChat *)self serviceName];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      uint64_t v6 = [(IMDChat *)self guid];
      uint64_t v7 = [(IMDChat *)self _expectedGUID];
      if (![v6 length] || (objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          int64_t v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            int v18 = 138412546;
            id v19 = v6;
            __int16 v20 = 2112;
            long long v21 = v7;
            _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Chat has GUID (%@) but expected GUID (%@), recovering chat", (uint8_t *)&v18, 0x16u);
          }
        }
        [(IMDChat *)self _updateRepairHistoryWithRepairHistory:1];
        [(IMDChat *)self _resetGUIDToExpectedGUID:v7];
        long long v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F28228];
        id v17 = @"Chat GUID did not match chat properties";
        long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        long long v11 = [v9 errorWithDomain:*MEMORY[0x1E4F6C158] code:0 userInfo:v10];

        long long v12 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v12 forceAutoBugCaptureWithSubType:@"Invalid Chat GUID" errorPayload:v11];
      }
      return;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [(IMDChat *)self chatIdentifier];
      id v15 = [(IMDChat *)self serviceName];
      int v18 = 138412546;
      id v19 = v14;
      __int16 v20 = 2112;
      long long v21 = v15;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Chat has zero length identifier %@ or service %@", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (id)_expectedGUID
{
  if ([(IMDChat *)self style] == 45)
  {
    BOOL v3 = [(IMDChat *)self participants];
    unint64_t v4 = [v3 count];

    if (v4 >= 2)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Chat has greater than 1 participant but 1-1 chat style, rewriting GUID and chat identifier", v13, 2u);
        }
      }
      uint64_t v6 = +[IMDChatRegistry sharedInstance];
      uint64_t v7 = [(IMDChat *)self account];
      int64_t v8 = [v6 generateUnusedChatIdentifierForGroupChatWithAccount:v7];
      [(IMDChat *)self setChatIdentifier:v8];

      [(IMDChat *)self setStyle:43];
    }
  }
  long long v9 = [(IMDChat *)self chatIdentifier];
  long long v10 = [(IMDChat *)self serviceName];
  [(IMDChat *)self style];
  long long v11 = (void *)IMCopyGUIDForChat();

  return v11;
}

- (BOOL)_otherChatExistsWithChatGUID:(id)a3
{
  BOOL v3 = (void *)IMDChatRecordCopyChatForGUID();
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_resetGUIDToExpectedGUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a3;
  if ([(IMDChat *)self style] != 45 && [(IMDChat *)self style] != 43)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_26;
    }
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = (char)[(IMDChat *)self style];
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Chat appears to need recovery but style is not supported %c", buf, 8u);
    }
    goto LABEL_25;
  }
  if (![(IMDChat *)self _otherChatExistsWithChatGUID:v4])
  {
    long long v9 = v4;
LABEL_12:
    long long v11 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
    long long v12 = [(IMDChat *)self guid];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1D9778174;
    v16[3] = &unk_1E6B75FE8;
    BOOL v4 = v9;
    id v17 = v4;
    int v18 = self;
    [v11 resolveInconsistentGUIDForChatRecordWithGUID:v12 newGUID:v4 completionHandler:v16];

    goto LABEL_26;
  }
  if ([(IMDChat *)self style] == 43)
  {
    uint64_t v5 = +[IMDChatRegistry sharedInstance];
    uint64_t v6 = [(IMDChat *)self account];
    uint64_t v7 = [v5 generateUnusedChatIdentifierForGroupChatWithAccount:v6];

    if ([v7 length])
    {
      int64_t v8 = [(IMDChat *)self serviceName];
      [(IMDChat *)self style];
      long long v9 = (void *)IMCopyGUIDForChat();

      [(IMDChat *)self setChatIdentifier:v7];
      if (IMOSLoggingEnabled())
      {
        long long v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v20 = v7;
          __int16 v21 = 2112;
          uint64_t v22 = v9;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Chat with expected GUID already exists, generating new chat identifier %@ and GUID %@", buf, 0x16u);
        }
      }
      goto LABEL_12;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [(IMDChat *)self account];
        *(_DWORD *)buf = 138412290;
        __int16 v20 = v15;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Failed to generate new chat identifier for account %@", buf, 0xCu);
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v20 = v4;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Chat with expected GUID %@ already exists, cannot reset 1-1 chat GUID", buf, 0xCu);
    }
  }
LABEL_26:
}

- (void)_repairParticipantForChatIDHandleIDMismatch
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self style] == 45)
  {
    BOOL v3 = [(IMDChat *)self participants];
    uint64_t v4 = [v3 count];

    if (v4 == 1)
    {
      if (![(IMDChat *)self isBusinessChat] && ![(IMDChat *)self isStewieChat])
      {
        uint64_t v5 = [(IMDChat *)self guid];
        IMComponentsFromChatGUID();
        id v6 = 0;
        id v7 = 0;

        int64_t v8 = [(IMDChat *)self participants];
        long long v9 = [v8 firstObject];
        long long v10 = [v9 ID];
        BOOL v11 = +[IMDChat identifier:v6 equalsIdentifier:v10];

        if (!v11)
        {
          if (IMOSLoggingEnabled())
          {
            long long v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              uint64_t v13 = [(IMDChat *)self chatIdentifier];
              uint64_t v14 = [(IMDChat *)self participants];
              id v15 = [v14 firstObject];
              uint64_t v16 = [v15 ID];
              int v36 = 138412802;
              uint64_t v37 = (uint64_t)v6;
              __int16 v38 = 2112;
              id v39 = v13;
              __int16 v40 = 2112;
              int v41 = v16;
              _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "1-1 chat has chat identifier (from GUID: %@ from chat identifier property: %@) but its participant's handle ID (%@) is different.", (uint8_t *)&v36, 0x20u);
            }
          }
          [(IMDChat *)self _updateRepairHistoryWithRepairHistory:2];
          id v17 = (const void *)IMDHandleRecordCopyHandleForIDOnService();
          int v18 = IMOSLoggingEnabled();
          if (v17)
          {
            if (v18)
            {
              id v19 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                int v36 = 138412546;
                uint64_t v37 = (uint64_t)v6;
                __int16 v38 = 2112;
                id v39 = v7;
                _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Found handle for ID (%@) on service (%@)", (uint8_t *)&v36, 0x16u);
              }
            }
            id v20 = (id)IMDHandleRecordCopyID();
            __int16 v21 = (void *)IMDHandleRecordCopyCountry();
            uint64_t v22 = (void *)IMDHandleRecordCopyUncanonicalizedID();
            uint64_t v23 = (void *)IMDHandleRecordCopyPersonCentricID();
            CFRelease(v17);
          }
          else
          {
            if (v18)
            {
              char v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                int v36 = 138412546;
                uint64_t v37 = (uint64_t)v6;
                __int16 v38 = 2112;
                id v39 = v7;
                _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "No handle found for ID (%@) on service (%@). Creating one instead.", (uint8_t *)&v36, 0x16u);
              }
            }
            id v20 = v6;
            __int16 v21 = 0;
            uint64_t v22 = 0;
            uint64_t v23 = 0;
          }
          uint64_t v27 = [[IMDHandle alloc] initWithID:v20 unformattedID:v22 countryCode:v21 personCentricID:v23];
          v35 = v27;
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
          [(IMDChat *)self resetParticipants:v28];

          v29 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v33 = *MEMORY[0x1E4F28228];
          uint64_t v34 = @"[Chat Repair] [v2] Chat identifier for 1-1 chat did not match the participant's handle ID.";
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          int v31 = [v29 errorWithDomain:*MEMORY[0x1E4F6C158] code:0 userInfo:v30];

          char v32 = [MEMORY[0x1E4F6E890] sharedInstance];
          [v32 forceAutoBugCaptureWithSubType:@"Incorrect Chat Participant" errorPayload:v31];
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      int v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = [(IMDChat *)self participants];
        int v36 = 134217984;
        uint64_t v37 = [v25 count];
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Chat is a 1-1 chat, but has %lu participants. Not repairing participants.", (uint8_t *)&v36, 0xCu);
      }
    }
  }
}

+ (BOOL)identifier:(id)a3 equalsIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((v5 != 0) != (v6 != 0))
  {
    char v7 = 0;
  }
  else if ((unint64_t)[v5 length] >= 5 && (unint64_t)objc_msgSend(v6, "length") >= 5)
  {
    if ((IMStringIsEmail() & 1) != 0 || IMStringIsEmail())
    {
      int64_t v8 = [v5 lowercaseString];
      uint64_t v9 = [v6 lowercaseString];
    }
    else
    {
      int64_t v8 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - 5);
      uint64_t v9 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v6, "length") - 5);
    }
    long long v10 = (void *)v9;
    char v7 = [v8 isEqualToString:v9];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)_updateRepairHistoryWithRepairHistory:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(IMDChat *)self setRepairHistory:[(IMDChat *)self repairHistory] | a3];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      [(IMDChat *)self repairHistory];
      id v5 = IMStringFromChatRepairHistory();
      int v6 = 138412290;
      char v7 = v5;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Repair History Updated: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_repairMissingServiceName
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDChat *)self serviceName];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F6C158];
    uint64_t v13 = *MEMORY[0x1E4F28228];
    v14[0] = @"[IMCreateIMDChat] Chat was missing a service when loaded from the database.";
    char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v8 = [v5 errorWithDomain:v6 code:0 userInfo:v7];

    uint64_t v9 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v9 forceAutoBugCaptureWithSubType:@"Missing chat service name at load" errorPayload:v8 type:@"MissingChatService" context:0];

    long long v10 = [(IMDChat *)self guid];
    IMComponentsFromChatGUID();
    id v11 = 0;

    [(IMDChat *)self setServiceName:v11];
    [(IMDChat *)self _updateRepairHistoryWithRepairHistory:4];
    long long v12 = +[IMDChatStore sharedInstance];
    [v12 _storeChat:self updateProtectedProperties:1];
  }
}

- (IMDChat)initWithAccountID:(id)a3 service:(id)a4 guid:(id)a5 groupID:(id)a6 chatIdentifier:(id)a7 participants:(id)a8 roomName:(id)a9 displayName:(id)a10 lastAddressedLocalHandle:(id)a11 lastAddressedSIMID:(id)a12 properties:(id)a13 state:(int64_t)a14 style:(unsigned __int8)a15 isFiltered:(int64_t)a16 hasHadSuccessfulQuery:(BOOL)a17 engramID:(id)a18 serverChangeToken:(id)a19 cloudKitSyncState:(int64_t)a20 originalGroupID:(id)a21 lastReadMessageTimeStamp:(int64_t)a22 lastMessageTimeStampOnLoad:(int64_t)a23 cloudKitRecordID:(id)a24 isBlackholed:(BOOL)a25 autoDonationBehavior:(int64_t)a26 autoDonationBehaviorLastModificationDate:(id)a27 isRecovered:(BOOL)a28 isDeletingIncomingMessages:(BOOL)a29
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v71 = a4;
  uint64_t v34 = (IMDChat *)a5;
  id v69 = a6;
  id v35 = a7;
  id v68 = a8;
  id v61 = a9;
  id v62 = a10;
  id v70 = a11;
  id v65 = a12;
  id v66 = a13;
  id v67 = a18;
  id v64 = a19;
  id v36 = a21;
  id v37 = a24;
  id v38 = a27;
  if ([v35 length])
  {
    v72.receiver = self;
    v72.super_class = (Class)IMDChat;
    id v39 = [(IMDChat *)&v72 init];
    if (v39)
    {
      __int16 v40 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
      lock = v39->_lock;
      v39->_lock = v40;

      [(NSRecursiveLock *)v39->_lock lock];
      uint64_t v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      chatInfo = v39->_chatInfo;
      v39->_chatInfo = v42;

      if ([(IMDChat *)v34 rangeOfString:@";"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (IMOSLoggingEnabled())
        {
          v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v74 = v34;
            _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_DEBUG, "Attempting to init chat with invalid guid %@", buf, 0xCu);
          }
        }
        uint64_t v45 = IMCopyGUIDForChat();

        uint64_t v34 = (IMDChat *)v45;
      }
      [(IMDChat *)v39 setGroupID:v69];
      [(IMDChat *)v39 setEngramID:v67];
      [(IMDChat *)v39 setProperties:v66];
      [(IMDChat *)v39 setIsFiltered:a16];
      [(IMDChat *)v39 setLastAddressedLocalHandle:v70];
      [(IMDChat *)v39 setLastAddressedSIMID:v65];
      [(IMDChat *)v39 setChatIdentifier:v35];
      [(IMDChat *)v39 setState:a14];
      [(IMDChat *)v39 setServiceName:v71];
      [(IMDChat *)v39 setStyle:a15];
      [(IMDChat *)v39 setParticipants:v68];
      if (a15 != 45
        || [(IMDChat *)v39 isBusinessChat]
        || (MEMORY[0x1E0169B70](v35) & 1) != 0
        || ([(IMDChat *)v39 serviceName],
            int v46 = objc_claimAutoreleasedReturnValue(),
            int v47 = [v46 isEqualToString:*MEMORY[0x1E4F6E198]],
            v46,
            v47))
      {
        [(IMDChat *)v39 setDisplayName:v62];
      }
      if (v34)
      {
        [(IMDChat *)v39 setGuid:v34];
      }
      else
      {
        v51 = [NSString stringGUID];
        [(IMDChat *)v39 setGuid:v51];
      }
      [(IMDChat *)v39 setHasHadSuccessfulQuery:a17];
      [(IMDChat *)v39 setCreateEngramGroupOnMessageSend:0];
      [(IMDChat *)v39 setPendingENGroupParticipantUpdate:0];
      if (a15 != 45) {
        [(IMDChat *)v39 setRoomName:v61];
      }
      [(IMDChat *)v39 setAccountID:v63];
      [(IMDChat *)v39 _updateCachedParticipants];
      v39->_rowID = -1;
      v39->_isArchived = 0;
      [(IMDChat *)v39 setServerChangeToken:v64];
      id v52 = v36;
      if ([v52 length])
      {
        v53 = v52;
      }
      else
      {
        v54 = +[IMDServiceController sharedController];
        id v55 = [v54 serviceWithName:v71];
        int v56 = [v55 supportsCapability:*MEMORY[0x1E4F6E010]];

        if (v56)
        {
          id v57 = v69;
        }
        else
        {
          _IMDHashParticipants(v68, v70);
          id v57 = (id)objc_claimAutoreleasedReturnValue();
        }
        v53 = v57;
      }
      [(IMDChat *)v39 setOriginalGroupID:v53];
      [(IMDChat *)v39 setLastReadMessageTimeStamp:a22];
      [(IMDChat *)v39 setLastMessageTimeStampOnLoad:a23];
      [(IMDChat *)v39 setCloudKitRecordID:v37];
      [(IMDChat *)v39 setIsBlackholed:a25];
      [(IMDChat *)v39 setWasReportedAsJunk:0];
      [(IMDChat *)v39 _setAutoDonationBehavior:a26 lastModificationDate:v38 setDirtyFlag:0];
      [(IMDChat *)v39 setRecovered:a28];
      [(IMDChat *)v39 setDeletingIncomingMessages:a29];
      [(IMDChat *)v39 setCloudKitSyncState:a20];
      [(IMDChat *)v39 setPendingIncomingSatelliteMessageCount:0];
      if (IMOSLoggingEnabled())
      {
        id v58 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v74 = v39;
          _os_log_impl(&dword_1D967A000, v58, OS_LOG_TYPE_DEBUG, "Created chat: %@", buf, 0xCu);
        }
      }
      [(NSRecursiveLock *)v39->_lock unlock];
    }
    v48 = v39;
    v50 = v48;
  }
  else
  {
    v48 = self;
    if (IMOSLoggingEnabled())
    {
      id v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v74 = v34;
        _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_DEBUG, "Attempting to init chat with zero length chat identifier, guid: %@", buf, 0xCu);
      }
    }
    v50 = 0;
  }

  return v50;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = self;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_DEBUG, "Dealloc chat: %@", buf, 0xCu);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)IMDChat;
  [(IMDChat *)&v4 dealloc];
}

- (void)setGuid:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_guid != v8)
  {
    objc_super v4 = (NSString *)[(NSString *)v8 copy];
    guid = self->_guid;
    self->_guid = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CD38];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setChatIdentifier:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_chatIdentifier != v8)
  {
    objc_super v4 = (NSString *)[(NSString *)v8 copy];
    chatIdentifier = self->_chatIdentifier;
    self->_chatIdentifier = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CCF0];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setAccountID:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_accountID != v8)
  {
    objc_super v4 = (NSString *)[(NSString *)v8 copy];
    accountID = self->_accountID;
    self->_accountID = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CCD8];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setServiceName:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_serviceName != v8)
  {
    objc_super v4 = (NSString *)[(NSString *)v8 copy];
    serviceName = self->_serviceName;
    self->_serviceName = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CE40];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setParticipants:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_participants != v6)
  {
    objc_super v4 = (NSArray *)[(NSArray *)v6 copy];
    participants = self->_participants;
    self->_participants = v4;
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (NSArray)replySuggestions
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSArray *)self->_replySuggestions copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSArray *)v3;
}

- (void)setReplySuggestions:(id)a3
{
  uint64_t v8 = (NSArray *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_replySuggestions != v8)
  {
    objc_super v4 = (NSArray *)[(NSArray *)v8 copy];
    replySuggestions = self->_replySuggestions;
    self->_replySuggestions = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CE20];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (NSString)roomName
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSString *)self->_roomName copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setRoomName:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_roomName != v8)
  {
    objc_super v4 = (NSString *)[(NSString *)v8 copy];
    roomName = self->_roomName;
    self->_roomName = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CE28];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setDisplayName:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_displayName != v8)
  {
    objc_super v4 = (NSString *)[(NSString *)v8 copy];
    displayName = self->_displayName;
    self->_displayName = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CD20];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (int64_t)autoDonationBehavior
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t autoDonationBehavior = self->_autoDonationBehavior;
  [(NSRecursiveLock *)self->_lock unlock];
  return autoDonationBehavior;
}

- (NSDate)autoDonationBehaviorLastModificationDate
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = self->_autoDonationBehaviorLastModificationDate;
  [(NSRecursiveLock *)self->_lock unlock];

  return v3;
}

- (void)_setAutoDonationBehavior:(int64_t)a3 lastModificationDate:(id)a4 setDirtyFlag:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  objc_storeStrong((id *)&self->_autoDonationBehaviorLastModificationDate, a4);
  self->_int64_t autoDonationBehavior = a3;
  if (v5) {
    self->_cloudKitSyncState = 0;
  }
  if (IMOSLoggingEnabled())
  {
    long long v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int64_t autoDonationBehavior = self->_autoDonationBehavior;
      int v14 = 134217984;
      int64_t v15 = autoDonationBehavior;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEBUG, "Updating chatInfo with autoDonationBehavior: %ld", (uint8_t *)&v14, 0xCu);
    }
  }
  chatInfo = self->_chatInfo;
  uint64_t v13 = [NSNumber numberWithInteger:self->_autoDonationBehavior];
  [(NSMutableDictionary *)chatInfo setObject:v13 forKey:*MEMORY[0x1E4F6CCE8]];
}

- (BOOL)setAutoDonationBehavior:(int64_t)a3 lastModificationDate:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    [(NSRecursiveLock *)self->_lock lock];
    autoDonationBehaviorLastModificationDate = self->_autoDonationBehaviorLastModificationDate;
    if (autoDonationBehaviorLastModificationDate
      && [(NSDate *)autoDonationBehaviorLastModificationDate compare:v6] == NSOrderedDescending)
    {
      uint64_t v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = self->_autoDonationBehaviorLastModificationDate;
        guid = self->_guid;
        int v20 = 138413058;
        int64_t v21 = (int64_t)v9;
        __int16 v22 = 2112;
        id v23 = v6;
        __int16 v24 = 2048;
        int64_t v25 = a3;
        __int16 v26 = 2112;
        uint64_t v27 = guid;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Syndication Date (%@ vs %@) is in the past. Not setting syndication type %ld for chat: %@", (uint8_t *)&v20, 0x2Au);
      }
      BOOL v11 = 0;
    }
    else
    {
      long long v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = self->_guid;
        int v20 = 134218498;
        int64_t v21 = a3;
        __int16 v22 = 2112;
        id v23 = v6;
        __int16 v24 = 2112;
        int64_t v25 = (int64_t)v13;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Setting syndication type to: %ld, syndication date to: %@, for chat: %@", (uint8_t *)&v20, 0x20u);
      }

      BOOL v11 = 1;
      [(IMDChat *)self _setAutoDonationBehavior:a3 lastModificationDate:v6 setDirtyFlag:1];
      int v14 = +[IMDChatStore sharedInstance];
      [v14 storeChat:self];

      int64_t v15 = [(IMDChat *)self guid];
      IMDCoreSpotlightAddChatGUID();

      uint64_t v8 = [(IMDChat *)self copyDictionaryRepresentation:0];
      uint64_t v16 = [(IMDChat *)self broadcaster];
      id v17 = [(IMDChat *)self guid];
      [v16 chat:v17 updated:v8];
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    int v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1D9902DB8();
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (void)setGroupID:(id)a3
{
  objc_super v4 = (NSString *)a3;
  if (v4)
  {
    uint64_t v7 = v4;
    if ([(NSString *)v4 length])
    {
      [(NSRecursiveLock *)self->_lock lock];
      if (self->_groupID != v7)
      {
        BOOL v5 = (NSString *)[(NSString *)v7 copy];
        groupID = self->_groupID;
        self->_groupID = v5;

        [(NSMutableDictionary *)self->_chatInfo setObject:v7 forKey:*MEMORY[0x1E4F6CD40]];
      }
      [(NSRecursiveLock *)self->_lock unlock];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)engramID
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSString *)self->_engramID copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setEngramID:(id)a3
{
  objc_super v4 = (NSString *)a3;
  if (v4)
  {
    uint64_t v7 = v4;
    if ([(NSString *)v4 length])
    {
      [(NSRecursiveLock *)self->_lock lock];
      if (self->_engramID != v7)
      {
        BOOL v5 = (NSString *)[(NSString *)v7 copy];
        engramID = self->_engramID;
        self->_engramID = v5;

        [(NSMutableDictionary *)self->_chatInfo setObject:v7 forKey:@"engramID"];
      }
      [(NSRecursiveLock *)self->_lock unlock];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)serverChangeToken
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSString *)self->_serverChangeToken copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setServerChangeToken:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_serverChangeToken != v8)
  {
    objc_super v4 = (NSString *)[(NSString *)v8 copy];
    serverChangeToken = self->_serverChangeToken;
    self->_serverChangeToken = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CE38];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (int64_t)cloudKitSyncState
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t cloudKitSyncState = self->_cloudKitSyncState;
  [(NSRecursiveLock *)self->_lock unlock];
  return cloudKitSyncState;
}

- (void)setCloudKitSyncState:(int64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  self->_int64_t cloudKitSyncState = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    id v6 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CD18]];
  }
  else
  {
    [(NSMutableDictionary *)self->_chatInfo removeObjectForKey:*MEMORY[0x1E4F6CD18]];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setOriginalGroupID:(id)a3
{
  uint64_t v7 = (NSString *)a3;
  if ([(NSString *)v7 length])
  {
    [(NSRecursiveLock *)self->_lock lock];
    if (self->_originalGroupID != v7)
    {
      objc_super v4 = (NSString *)[(NSString *)v7 copy];
      originalGroupID = self->_originalGroupID;
      self->_originalGroupID = v4;

      id v6 = self->_originalGroupID;
      if (v6) {
        [(NSMutableDictionary *)self->_chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CDE0]];
      }
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
}

- (int64_t)lastReadMessageTimeStamp
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t lastReadMessageTimeStamp = self->_lastReadMessageTimeStamp;
  [(NSRecursiveLock *)self->_lock unlock];
  return lastReadMessageTimeStamp;
}

- (void)setLastReadMessageTimeStamp:(int64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  self->_int64_t lastReadMessageTimeStamp = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    id v6 = [NSNumber numberWithLongLong:a3];
    [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CDC0]];
  }
  else
  {
    [(NSMutableDictionary *)self->_chatInfo removeObjectForKey:*MEMORY[0x1E4F6CDC0]];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSDate)lastTUConversationCreatedDate
{
  v2 = [(IMDChat *)self properties];
  BOOL v3 = [v2 objectForKey:@"lastTUConversationCreatedDate"];

  return (NSDate *)v3;
}

- (void)setLastTUConversationCreatedDate:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(IMDChat *)self lastTUConversationCreatedDate];
  if (([v5 isEqual:v4] & 1) == 0)
  {
    BOOL v11 = @"lastTUConversationCreatedDate";
    id v6 = v4;
    if (!v4)
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
    }
    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [(IMDChat *)self updateProperties:v7];

    if (!v4) {
    uint64_t v8 = [(IMDChat *)self broadcaster];
    }
    id v9 = [(IMDChat *)self guid];
    long long v10 = [(IMDChat *)self properties];
    [v8 chat:v9 propertiesUpdated:v10];
  }
}

- (void)setLastScheduledMessageCreatedDate:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(IMDChat *)self lastScheduledMessageCreatedDate];
  if (([v5 isEqual:v4] & 1) == 0)
  {
    BOOL v11 = @"lastScheduledMessageCreatedDate";
    id v6 = v4;
    if (!v4)
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
    }
    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [(IMDChat *)self updateProperties:v7];

    if (!v4) {
    uint64_t v8 = [(IMDChat *)self broadcaster];
    }
    id v9 = [(IMDChat *)self guid];
    long long v10 = [(IMDChat *)self properties];
    [v8 chat:v9 propertiesUpdated:v10];
  }
}

- (NSString)lastAddressedLocalHandle
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSString *)self->_lastAddressedLocalHandle copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setLastAddressedLocalHandle:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_lastAddressedLocalHandle != v8)
  {
    id v4 = (NSString *)[(NSString *)v8 copy];
    lastAddressedLocalHandle = self->_lastAddressedLocalHandle;
    self->_lastAddressedLocalHandle = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CD98];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (NSString)lastAddressedSIMID
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSString *)self->_lastAddressedSIMID copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSString *)v3;
}

- (void)setLastAddressedSIMID:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_lastAddressedSIMID != v8)
  {
    id v4 = (NSString *)[(NSString *)v8 copy];
    lastAddressedSIMID = self->_lastAddressedSIMID;
    self->_lastAddressedSIMID = v4;

    chatInfo = self->_chatInfo;
    uint64_t v7 = *MEMORY[0x1E4F6CDA0];
    if (v8) {
      [(NSMutableDictionary *)chatInfo setObject:v8 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v7];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setProperties:(id)a3
{
  uint64_t v7 = (NSDictionary *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_properties != v7)
  {
    objc_storeStrong((id *)&self->_properties, a3);
    chatInfo = self->_chatInfo;
    uint64_t v6 = *MEMORY[0x1E4F6CE08];
    if (v7) {
      [(NSMutableDictionary *)chatInfo setObject:v7 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)chatInfo removeObjectForKey:v6];
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setLastMessage:(id)a3
{
  BOOL v5 = (IMMessageItem *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_lastMessage != v5) {
    objc_storeStrong((id *)&self->_lastMessage, a3);
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setStyle:(unsigned __int8)a3
{
  int v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  self->_unsigned __int8 style = v3;
  chatInfo = self->_chatInfo;
  if (v3)
  {
    uint64_t v6 = [NSNumber numberWithChar:(char)v3];
    [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CE48]];
  }
  else
  {
    [(NSMutableDictionary *)self->_chatInfo removeObjectForKey:*MEMORY[0x1E4F6CE48]];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setState:(int64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  self->_int64_t state = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    uint64_t v6 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CD88]];
  }
  else
  {
    [(NSMutableDictionary *)self->_chatInfo removeObjectForKey:*MEMORY[0x1E4F6CD88]];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)_setUnreadCount:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  self->_unint64_t unreadCount = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CE50]];
  }
  else
  {
    [(NSMutableDictionary *)self->_chatInfo removeObjectForKey:*MEMORY[0x1E4F6CE50]];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)isArchived
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isArchived = self->_isArchived;
  [(NSRecursiveLock *)self->_lock unlock];
  return isArchived;
}

- (void)setIsBlackholed:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  self->_BOOL isBlackholed = v3;
  chatInfo = self->_chatInfo;
  uint64_t v6 = [NSNumber numberWithBool:v3];
  [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CD60]];

  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)hasScheduledMessage
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL hasScheduledMessage = self->_hasScheduledMessage;
  [(NSRecursiveLock *)self->_lock unlock];
  return hasScheduledMessage;
}

- (void)setHasScheduledMessage:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  self->_BOOL hasScheduledMessage = v3;
  chatInfo = self->_chatInfo;
  uint64_t v6 = [NSNumber numberWithBool:v3];
  [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CD50]];

  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (int64_t)rowID
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t rowID = self->_rowID;
  [(NSRecursiveLock *)self->_lock unlock];
  return rowID;
}

- (void)_setRowID:(int64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  self->_int64_t rowID = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    uint64_t v6 = [NSNumber numberWithLongLong:a3];
    [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CE30]];
  }
  else
  {
    [(NSMutableDictionary *)self->_chatInfo removeObjectForKey:*MEMORY[0x1E4F6CE30]];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (int64_t)isFiltered
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t isFiltered = self->_isFiltered;
  [(NSRecursiveLock *)self->_lock unlock];
  return isFiltered;
}

- (void)setIsFiltered:(int64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  self->_int64_t isFiltered = a3;
  chatInfo = self->_chatInfo;
  uint64_t v6 = [NSNumber numberWithLongLong:a3];
  [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CD78]];

  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)hasHadSuccessfulQuery
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL hasHadSuccessfulQuery = self->_hasHadSuccessfulQuery;
  [(NSRecursiveLock *)self->_lock unlock];
  return hasHadSuccessfulQuery;
}

- (void)setHasHadSuccessfulQuery:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  self->_BOOL hasHadSuccessfulQuery = v3;
  chatInfo = self->_chatInfo;
  uint64_t v6 = [NSNumber numberWithBool:v3];
  [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CD58]];

  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)setLastMessageTimeStampOnLoad:(int64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  self->_int64_t lastMessageTimeStampOnLoad = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    uint64_t v6 = [NSNumber numberWithLongLong:a3];
    [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CDB8]];
  }
  else
  {
    [(NSMutableDictionary *)self->_chatInfo removeObjectForKey:*MEMORY[0x1E4F6CDB8]];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)isRecovered
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isRecovered = self->_isRecovered;
  [(NSRecursiveLock *)self->_lock unlock];
  return isRecovered;
}

- (void)setRecovered:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  self->_BOOL isRecovered = v3;
  chatInfo = self->_chatInfo;
  uint64_t v6 = [NSNumber numberWithBool:v3];
  [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CD80]];

  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)isDeletingIncomingMessages
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isDeletingIncomingMessages = self->_isDeletingIncomingMessages;
  [(NSRecursiveLock *)self->_lock unlock];
  return isDeletingIncomingMessages;
}

- (void)setDeletingIncomingMessages:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  self->_BOOL isDeletingIncomingMessages = v3;
  chatInfo = self->_chatInfo;
  uint64_t v6 = [NSNumber numberWithBool:v3];
  [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CD68]];

  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (int64_t)pendingIncomingSatelliteMessageCount
{
  [(NSRecursiveLock *)self->_lock lock];
  int64_t pendingIncomingSatelliteMessageCount = self->_pendingIncomingSatelliteMessageCount;
  [(NSRecursiveLock *)self->_lock unlock];
  return pendingIncomingSatelliteMessageCount;
}

- (void)setPendingIncomingSatelliteMessageCount:(int64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  self->_int64_t pendingIncomingSatelliteMessageCount = a3;
  chatInfo = self->_chatInfo;
  if (a3)
  {
    uint64_t v6 = [NSNumber numberWithLongLong:a3];
    [(NSMutableDictionary *)chatInfo setObject:v6 forKey:*MEMORY[0x1E4F6CDF8]];
  }
  else
  {
    [(NSMutableDictionary *)self->_chatInfo removeObjectForKey:*MEMORY[0x1E4F6CDF8]];
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)isDownloadingPendingSatelliteMessages
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL isDownloadingPendingSatelliteMessages = self->_isDownloadingPendingSatelliteMessages;
  [(NSRecursiveLock *)self->_lock unlock];
  return isDownloadingPendingSatelliteMessages;
}

- (void)setIsDownloadingPendingSatelliteMessages:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  self->_BOOL isDownloadingPendingSatelliteMessages = v3;
  chatInfo = self->_chatInfo;
  uint64_t v6 = [NSNumber numberWithBool:v3];
  [(NSMutableDictionary *)chatInfo setObject:v6 forKey:@"downloadingPendingSatelliteMessages"];

  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (NSString)requestedDowngradeService
{
  v2 = [(IMDChat *)self properties];
  BOOL v3 = [v2 objectForKey:@"requestedDowngradeService"];

  return (NSString *)v3;
}

- (void)setRequestedDowngradeService:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(IMDChat *)self requestedDowngradeService];
  if (([v5 isEqual:v4] & 1) == 0)
  {
    BOOL v11 = @"requestedDowngradeService";
    uint64_t v6 = v4;
    if (!v4)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    }
    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [(IMDChat *)self updateProperties:v7];

    if (!v4) {
    uint64_t v8 = [(IMDChat *)self broadcaster];
    }
    id v9 = [(IMDChat *)self guid];
    long long v10 = [(IMDChat *)self properties];
    [v8 chat:v9 propertiesUpdated:v10];
  }
}

- (NSDate)requestedDowngradeExpirationDate
{
  v2 = [(IMDChat *)self properties];
  BOOL v3 = [v2 objectForKey:@"requestedDowngradeExpirationDate"];

  return (NSDate *)v3;
}

- (void)setRequestedDowngradeExpirationDate:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(IMDChat *)self requestedDowngradeExpirationDate];
  if (([v5 isEqual:v4] & 1) == 0)
  {
    BOOL v11 = @"requestedDowngradeExpirationDate";
    uint64_t v6 = v4;
    if (!v4)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    }
    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [(IMDChat *)self updateProperties:v7];

    if (!v4) {
    uint64_t v8 = [(IMDChat *)self broadcaster];
    }
    id v9 = [(IMDChat *)self guid];
    long long v10 = [(IMDChat *)self properties];
    [v8 chat:v9 propertiesUpdated:v10];
  }
}

- (IMDaemonListenerChatProtocol)broadcaster
{
  BOOL v3 = +[IMDBroadcastController sharedProvider];
  id v4 = objc_msgSend(v3, "broadcasterForChatListenersUsingBlackholeRegistry:", -[IMDChat isBlackholed](self, "isBlackholed"));

  return (IMDaemonListenerChatProtocol *)v4;
}

- (IMDHandle)recipient
{
  return (IMDHandle *)[(NSArray *)self->_participants lastObject];
}

- (void)_updateCachedParticipants
{
  BOOL v3 = [(IMDChat *)self participants];
  id v6 = [v3 arrayByApplyingSelector:sel_handleInfo];

  chatInfo = self->_chatInfo;
  uint64_t v5 = *MEMORY[0x1E4F6CDF0];
  if (v6) {
    [(NSMutableDictionary *)chatInfo setObject:v6 forKey:v5];
  }
  else {
    [(NSMutableDictionary *)chatInfo removeObjectForKey:v5];
  }
}

- (id)participantHandles
{
  v2 = [(IMDChat *)self participants];
  BOOL v3 = [v2 arrayByApplyingSelector:sel_ID];

  return v3;
}

- (void)addParticipants:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = (IMDChat *)a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = self;
      __int16 v39 = 2112;
      __int16 v40 = v28;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_DEBUG, "Chat: %@  Adding participants: %@", buf, 0x16u);
    }
  }
  if ([(IMDChat *)self style] != 45
    || ([(IMDChat *)self participants],
        id v4 = objc_claimAutoreleasedReturnValue(),
        BOOL v5 = [v4 count] == 0,
        v4,
        v5))
  {
    uint64_t v7 = [(IMDChat *)self participants];
    id v8 = (id)[v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v26 = [v8 count];
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = v28;
    uint64_t v9 = [(IMDChat *)obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "CNContactID", v26);
          BOOL v14 = v13 == 0;

          if (v14)
          {
            int64_t v15 = +[IMDChatRegistry sharedInstance];
            uint64_t v16 = [v12 ID];
            id v17 = [v15 _cnIDForHandle:v16];
            [v12 setCNContactID:v17];
          }
          uint64_t v18 = [v8 indexOfObject:v12 matchingComparison:sel_compareIDs_];
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            [v30 addObject:v12];
            [v8 addObject:v12];
          }
          else
          {
            id v19 = [v8 objectAtIndex:v18];
            if (([v19 isBetterDefinedThan:v12] & 1) == 0) {
              [v8 replaceObjectAtIndex:v18 withObject:v12];
            }
          }
        }
        uint64_t v9 = [(IMDChat *)obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v9);
    }

    [v27 setObject:v30 forKey:@"__kIMDChatParticipantsDidChangeAddedParticipantsKey"];
    [(IMDChat *)self setParticipants:v8];
    int v20 = [(IMDChat *)self participants];
    BOOL v21 = [v20 count] == (int)v26;

    if (!v21)
    {
      [(IMDChat *)self setCloudKitSyncState:0];
      __int16 v22 = +[IMDChatStore sharedInstance];
      [v22 storeChat:self];

      id v23 = [MEMORY[0x1E4F6E940] sharedCoordinator];
      __int16 v24 = [(IMDChat *)self groupID];
      [v23 informOfChangedGroupMembership:v24];
    }
    [(IMDChat *)self _updateCachedParticipants];
    int64_t v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v25, "__mainThreadPostNotificationName:object:userInfo:", @"__kIMDChatParticipantsDidChangeNotification", self, v27);
  }
  else if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v28;
      __int16 v39 = 2112;
      __int16 v40 = self;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Trying to add participants: %@ to 1:1 chat :%@", buf, 0x16u);
    }
  }
}

- (void)addParticipant:(id)a3
{
  id v7 = a3;
  id v4 = +[IMDChatRegistry sharedInstance];
  [v4 invalidatePersonCentricGroupedChatsCache];

  BOOL v5 = v7;
  if (v7)
  {
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
    [(IMDChat *)self addParticipants:v6];

    BOOL v5 = v7;
  }
}

- (BOOL)removeParticipants:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = self;
      __int16 v37 = 2112;
      id v38 = v27;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_DEBUG, "Chat: %@  Removing participants: %@", buf, 0x16u);
    }
  }
  id v4 = +[IMDChatRegistry sharedInstance];
  [v4 invalidatePersonCentricGroupedChatsCache];

  if ([(IMDChat *)self style] == 43)
  {
    BOOL v5 = [(IMDChat *)self participants];
    if ((unint64_t)[v5 count] >= 3)
    {
    }
    else
    {
      id v6 = [(IMDChat *)self service];
      char v7 = [v6 supportsCapability:*MEMORY[0x1E4F6E040]];

      if ((v7 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          id v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = self;
            _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Trying to remove participant from a group chat with 2 or less participants %@", buf, 0xCu);
          }
        }
        BOOL v9 = 0;
        goto LABEL_28;
      }
    }
  }
  uint64_t v10 = [(IMDChat *)self participants];
  id v11 = (id)[v10 mutableCopy];

  if (!v11) {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v26 = [v11 count];
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v27;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(v11, "indexOfObject:matchingComparison:", *(void *)(*((void *)&v30 + 1) + 8 * i), sel_compareIDs_, v26);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v18 = [v11 objectAtIndex:v17];
          [v12 addObject:v18];

          [v11 removeObjectAtIndex:v17];
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v14);
  }

  [v28 setObject:v12 forKey:@"__kIMDChatParticipantsDidChangeRemovedParticipantsKey"];
  [(IMDChat *)self setParticipants:v11];
  id v19 = [(IMDChat *)self participants];
  BOOL v20 = [v19 count] == (int)v26;

  if (!v20)
  {
    [(IMDChat *)self setCloudKitSyncState:0];
    BOOL v21 = +[IMDChatStore sharedInstance];
    [v21 storeChat:self];

    __int16 v22 = [MEMORY[0x1E4F6E940] sharedCoordinator];
    id v23 = [(IMDChat *)self groupID];
    [v22 informOfChangedGroupMembership:v23];
  }
  [(IMDChat *)self _updateCachedParticipants];
  __int16 v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_msgSend(v24, "__mainThreadPostNotificationName:object:userInfo:", @"__kIMDChatParticipantsDidChangeNotification", self, v28);

  BOOL v9 = 1;
LABEL_28:

  return v9;
}

- (BOOL)removeParticipant:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  BOOL v7 = -[IMDChat removeParticipants:](self, "removeParticipants:", v6, v9, v10);
  return v7;
}

- (void)resetParticipants:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412546;
      *(void *)uint64_t v14 = self;
      *(_WORD *)&v14[8] = 2112;
      *(void *)&v14[10] = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "Chat: %@  Resetting to participants: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  BOOL v6 = [(IMDChat *)self style] == 43;
  unint64_t v7 = [v4 count];
  if (v6)
  {
    if (v7 <= 1) {
      goto LABEL_7;
    }
LABEL_12:
    id v11 = +[IMDChatRegistry sharedInstance];
    [v11 invalidatePersonCentricGroupedChatsCache];

    [(IMDChat *)self setParticipants:v4];
    id v12 = +[IMDChatStore sharedInstance];
    [v12 storeChat:self];

    [(IMDChat *)self _updateCachedParticipants];
    goto LABEL_13;
  }
  if (v7 == 1) {
    goto LABEL_12;
  }
LABEL_7:
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      signed __int8 v9 = [(IMDChat *)self style];
      uint64_t v10 = [v4 count];
      int v13 = 67109376;
      *(_DWORD *)uint64_t v14 = v9;
      *(_WORD *)&v14[4] = 2048;
      *(void *)&v14[6] = v10;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Rejecting participant reset, style is %c but participant count is %llu", (uint8_t *)&v13, 0x12u);
    }
  }
LABEL_13:
}

- (void)recoverParticipantsIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self style] == 45)
  {
    BOOL v3 = [(IMDChat *)self participants];
    uint64_t v4 = [v3 count];

    if (!v4)
    {
      id v5 = [(IMDChat *)self chatIdentifier];
      if ([v5 length])
      {
        BOOL v6 = [[IMDHandle alloc] initWithID:v5 unformattedID:0 countryCode:0];
        [(IMDChat *)self addParticipant:v6];
        if (IMOSLoggingEnabled())
        {
          unint64_t v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            int v8 = 138412546;
            signed __int8 v9 = (IMDChat *)v6;
            __int16 v10 = 2112;
            id v11 = self;
            _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEBUG, "1:1 chat was missing participant, re-added %@ to %@", (uint8_t *)&v8, 0x16u);
          }
        }
      }
      else
      {
        if (!IMOSLoggingEnabled())
        {
LABEL_13:

          return;
        }
        OSLogHandleForIMFoundationCategory();
        BOOL v6 = (IMDHandle *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_INFO))
        {
          int v8 = 138412290;
          signed __int8 v9 = self;
          _os_log_impl(&dword_1D967A000, &v6->super, OS_LOG_TYPE_INFO, "Cannot recover participant due to empty chatIdentifier for chat: %@", (uint8_t *)&v8, 0xCu);
        }
      }

      goto LABEL_13;
    }
  }
}

- (IMDService)service
{
  v2 = [(IMDChat *)self account];
  BOOL v3 = [v2 service];

  return (IMDService *)v3;
}

- (int64_t)engroupCreationDate
{
  v2 = [(IMDChat *)self properties];
  BOOL v3 = [v2 objectForKey:@"EngroupCreationDateKey"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSString)businessName
{
  if ([(IMDChat *)self isChatBot])
  {
    BOOL v3 = [(IMDChat *)self properties];
    int64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6CCC8]];
  }
  else
  {
    int64_t v4 = 0;
  }

  return (NSString *)v4;
}

- (id)_sortedParticipantIDHashForParticipants:(id)a3
{
  return [(IMDChat *)self _sortedParticipantIDHashForParticipants:a3 usesPersonCentricID:1];
}

- (BOOL)isOlderThan:(id)a3
{
  return [(IMDChat *)self compareBySequenceNumberAndDateDescending:a3] == 1;
}

- (BOOL)isNewerThan:(id)a3
{
  return [(IMDChat *)self compareBySequenceNumberAndDateDescending:a3] == -1;
}

- (NSString)description
{
  id v27 = NSString;
  uint64_t v26 = [(IMDChat *)self guid];
  unsigned int v25 = [(IMDChat *)self style];
  int64_t v24 = [(IMDChat *)self state];
  long long v31 = [(IMDChat *)self participants];
  long long v30 = [(IMDChat *)self roomName];
  id v23 = [(IMDChat *)self displayName];
  long long v32 = [(IMDChat *)self chatIdentifier];
  unint64_t v22 = [(IMDChat *)self unreadCount];
  int64_t v21 = [(IMDChat *)self rowID];
  v29 = [(IMDChat *)self groupID];
  BOOL v20 = [(IMDChat *)self originalGroupID];
  id v19 = [(IMDChat *)self lastAddressedLocalHandle];
  id v28 = [(IMDChat *)self lastAddressedSIMID];
  int64_t v18 = [(IMDChat *)self isFiltered];
  BOOL v3 = @"YES";
  if ([(IMDChat *)self hasHadSuccessfulQuery]) {
    int64_t v4 = @"YES";
  }
  else {
    int64_t v4 = @"NO";
  }
  uint64_t v17 = v4;
  uint64_t v16 = [(IMDChat *)self engramID];
  id v5 = [(IMDChat *)self serverChangeToken];
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMDChat cloudKitSyncState](self, "cloudKitSyncState"));
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IMDChat lastReadMessageTimeStamp](self, "lastReadMessageTimeStamp"));
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMDChat engroupCreationDate](self, "engroupCreationDate"));
  int v8 = [(IMDChat *)self cloudKitRecordID];
  if ([(IMDChat *)self isBlackholed]) {
    signed __int8 v9 = @"YES";
  }
  else {
    signed __int8 v9 = @"NO";
  }
  __int16 v10 = [(IMDChat *)self groupPhotoGuid];
  if ([(IMDChat *)self isRecovered]) {
    id v11 = @"YES";
  }
  else {
    id v11 = @"NO";
  }
  if (![(IMDChat *)self isDeletingIncomingMessages]) {
    BOOL v3 = @"NO";
  }
  [(IMDChat *)self repairHistory];
  uint64_t v12 = IMStringFromChatRepairHistory();
  objc_msgSend(v27, "stringWithFormat:", @"IMDChat: %p GUID: %@ Style: %c State: %d Participants: %@  Room Name: %@  Display Name: %@  Identifier: %@  Unread count: %d  Row ID: %lld  Group ID: %@, originalGroupID: %@ lastAddressedHandle: %@ lastAddressedSIMID: %@ isFiltered: %d, hasHadSuccessfulQuery: %@, Engram ID: %@, serverChangeToken:%@, cKSate:%@ lastReadTime:%@ engroupCreationDate: %@ %@ cloudKitRecordID, isBlackholed: %@ groupPhotoGuid: %@ isRecovered: %@ isDeletingIncomingMessages %@ repairHistory %@ pendingIncomingSatelliteMessageCount: %d", self, v26, v25, v24, v31, v30, v23, v32, v22, v21, v29, v20, v19, v28, v18, v17,
    v16,
    v5,
    v6,
    v15,
    v7,
    v8,
    v9,
    v10,
    v11,
    v3,
    v12,
  int v13 = [(IMDChat *)self pendingIncomingSatelliteMessageCount]);

  return (NSString *)v13;
}

- (NSDictionary)chatProperties
{
  id v2 = [(IMDChat *)self copyDictionaryRepresentation:0];

  return (NSDictionary *)v2;
}

- (id)dictionaryRepresentationIncludingLastMessage
{
  id v2 = [(IMDChat *)self copyDictionaryRepresentation:1];

  return v2;
}

- (NSDictionary)dictionaryRepresentation
{
  id v2 = [(IMDChat *)self copyDictionaryRepresentation:0];

  return (NSDictionary *)v2;
}

- (void)_updateLastMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412546;
      int v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "Chat: %@   Updating last message: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  [(IMDChat *)self setLastMessage:v4];
  if ([v4 isFromMe])
  {
    BOOL v6 = [v4 time];
    [(IMDChat *)self setLastSentMessageDate:v6];
  }
}

- (BOOL)updateProperties:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412546;
        int64_t v18 = self;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "Chat: %@   Property update: %@", (uint8_t *)&v17, 0x16u);
      }
    }
    [(NSRecursiveLock *)self->_lock lock];
    if ([(NSDictionary *)self->_properties count]) {
      BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_properties];
    }
    else {
      BOOL v6 = 0;
    }
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[(NSDictionary *)self->_properties mutableCopy];
    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    [(__CFDictionary *)Mutable addEntriesFromDictionary:v4];
    __int16 v9 = [MEMORY[0x1E4F1CA98] null];
    id v10 = [(__CFDictionary *)Mutable allKeysForObject:v9];

    if ([v10 count]) {
      [(__CFDictionary *)Mutable removeObjectsForKeys:v10];
    }
    char v7 = [MEMORY[0x1E4F28F98] propertyList:Mutable isValidForFormat:200];
    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v17 = 138412290;
          int64_t v18 = (IMDChat *)Mutable;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEBUG, "     Resulting properties: %@", (uint8_t *)&v17, 0xCu);
        }
      }
      if (v6 && self->_properties)
      {
        char v12 = [v6 isEqualToDictionary:Mutable];
        char v13 = Mutable ? v12 : 0;
        if (v13)
        {
          char v7 = 0;
LABEL_34:
          [(NSRecursiveLock *)self->_lock unlock];

          goto LABEL_35;
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEBUG, "     => Saving changes", (uint8_t *)&v17, 2u);
        }
      }
      [(IMDChat *)self setProperties:Mutable];
      uint64_t v14 = +[IMDChatStore sharedInstance];
      [v14 storeChat:self];
    }
    else
    {
      uint64_t v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1D9902F30();
      }
    }

    goto LABEL_34;
  }
  char v7 = 0;
LABEL_35:

  return v7;
}

- (BOOL)updateProperties:(id)a3 shouldBroadcast:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(IMDChat *)self updateProperties:a3];
  if (v6 && v4)
  {
    char v7 = [(IMDChat *)self broadcaster];
    int v8 = [(IMDChat *)self guid];
    __int16 v9 = [(IMDChat *)self properties];
    [v7 chat:v8 propertiesUpdated:v9];
  }
  return v6;
}

- (void)storeAndBroadcastChatChanges
{
  BOOL v3 = +[IMDChatStore sharedInstance];
  [v3 storeChat:self];

  id v6 = [(IMDChat *)self copyDictionaryRepresentation:0];
  BOOL v4 = [(IMDChat *)self broadcaster];
  id v5 = [(IMDChat *)self guid];
  [v4 chat:v5 updated:v6];
}

- (id)generateNewGroupID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self style] == 45)
  {
    BOOL v3 = [NSString stringGUID];
    if (!IMOSLoggingEnabled()) {
      goto LABEL_10;
    }
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      char v12 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_DEBUG, "   Generating group ID for chat: %@    groupID: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v5 = [(IMDChat *)self participants];
    id v6 = [(IMDChat *)self lastAddressedLocalHandle];
    BOOL v3 = _IMDHashParticipants(v5, v6);

    if (!IMOSLoggingEnabled()) {
      goto LABEL_10;
    }
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      char v7 = [(IMDChat *)self participants];
      int v9 = 138412802;
      id v10 = self;
      __int16 v11 = 2112;
      char v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_DEBUG, "   Generating group ID for chat: %@    groupID: %@  using IDs = %@", (uint8_t *)&v9, 0x20u);
    }
  }

LABEL_10:

  return v3;
}

- (BOOL)isUnnamedChat
{
  BOOL v3 = [(IMDChat *)self displayName];
  if (v3)
  {
    BOOL v4 = [(IMDChat *)self displayName];
    BOOL v5 = [v4 length] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)updateGroupID:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(IMDChat *)self groupID];
  char v5 = IMSharedHelperAreObjectsLogicallySame();

  if ((v5 & 1) == 0)
  {
    [(IMDChat *)self setGroupID:v6];
    [(IMDChat *)self storeAndBroadcastChatChanges];
  }
}

- (void)updateEngramID:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(IMDChat *)self engramID];
  char v5 = IMSharedHelperAreObjectsLogicallySame();

  if ((v5 & 1) == 0)
  {
    [(IMDChat *)self setEngramID:v8];
    [(IMDChat *)self storeAndBroadcastChatChanges];
    id v6 = [(IMDChat *)self broadcaster];
    char v7 = [(IMDChat *)self guid];
    [v6 chat:v7 engramIDUpdated:v8];
  }
}

- (void)updateEngroupCreationDate:(int64_t)a3
{
  if (![(IMDChat *)self engroupCreationDate])
  {
    char v5 = [(IMDChat *)self properties];
    id v6 = (void *)[v5 mutableCopy];
    char v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v10 = v8;

    int v9 = [NSNumber numberWithInteger:a3];
    [v10 setObject:v9 forKey:@"EngroupCreationDateKey"];

    [(IMDChat *)self updateProperties:v10];
  }
}

- (void)updateLastReadMessageTimeStampIfNeeded:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_lastReadMessageTimeStamp < a3)
  {
    if (IMOSLoggingEnabled())
    {
      char v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [NSNumber numberWithLongLong:self->_lastReadMessageTimeStamp];
        char v7 = [NSNumber numberWithLongLong:a3];
        id v8 = [(IMDChat *)self chatIdentifier];
        int v9 = 138412802;
        id v10 = v6;
        __int16 v11 = 2112;
        char v12 = v7;
        __int16 v13 = 2112;
        uint64_t v14 = v8;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "Updating lastReadMessageTimeStamp from: %@ to: %@ for chat: %@", (uint8_t *)&v9, 0x20u);
      }
    }
    [(IMDChat *)self setLastReadMessageTimeStamp:a3];
    [(IMDChat *)self setCloudKitSyncState:0];
    [(IMDChat *)self storeAndBroadcastChatChanges];
  }
}

- (void)updateServerChangeToken:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(IMDChat *)self serverChangeToken];
  char v6 = IMSharedHelperAreObjectsLogicallySame();

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      char v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [(IMDChat *)self serverChangeToken];
        int v9 = [(IMDChat *)self chatIdentifier];
        int v10 = 138412802;
        id v11 = v8;
        __int16 v12 = 2112;
        id v13 = v4;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEBUG, "Updating record change tag (etag) from: %@ to: %@ for chat: %@", (uint8_t *)&v10, 0x20u);
      }
    }
    [(IMDChat *)self setServerChangeToken:v4];
    [(IMDChat *)self storeAndBroadcastChatChanges];
  }
}

- (void)updateCloudKitSyncState:(int64_t)a3
{
  if (self->_cloudKitSyncState != a3)
  {
    -[IMDChat setCloudKitSyncState:](self, "setCloudKitSyncState:");
    [(IMDChat *)self storeAndBroadcastChatChanges];
  }
}

- (void)updateOriginalGroupID:(id)a3
{
  id v4 = a3;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    [(IMDChat *)self setOriginalGroupID:v4];
    [(IMDChat *)self storeAndBroadcastChatChanges];
  }
}

- (void)updateCloudKitRecordID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(IMDChat *)self cloudKitRecordID];
  char v6 = IMSharedHelperAreObjectsLogicallySame();

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      char v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [(IMDChat *)self cloudKitRecordID];
        int v9 = [(IMDChat *)self chatIdentifier];
        int v10 = 138412802;
        id v11 = v8;
        __int16 v12 = 2112;
        id v13 = v4;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEBUG, "Updating ck record ID from: %@ to: %@ for chat: %@", (uint8_t *)&v10, 0x20u);
      }
    }
    [(IMDChat *)self setCloudKitRecordID:v4];
    [(IMDChat *)self storeAndBroadcastChatChanges];
  }
}

- (void)resetCKSyncState
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_DEBUG, "resetting CK Sync state", v4, 2u);
    }
  }
  [(IMDChat *)self setCloudKitSyncState:0];
  [(IMDChat *)self setServerChangeToken:0];
  [(IMDChat *)self setCloudKitRecordID:0];
  [(IMDChat *)self storeAndBroadcastChatChanges];
}

- (void)updateLastAddressedHandle:(id)a3
{
}

- (void)updateLastAddressedHandle:(id)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4
    || ([(IMDChat *)self lastAddressedLocalHandle],
        char v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = IMSharedHelperAreObjectsLogicallySame(),
        v7,
        (v8 & 1) == 0))
  {
    if (([v6 isEqualToIgnoringCase:*MEMORY[0x1E4F6C7B8]] & 1) == 0)
    {
      char HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
      if (v6
        || (HasMultipleSubscriptions & 1) != 0
        || ([0 trimmedString],
            int v10 = objc_claimAutoreleasedReturnValue(),
            uint64_t v11 = [v10 length],
            v10,
            v11))
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            id v13 = [(IMDChat *)self lastAddressedLocalHandle];
            __int16 v14 = @"NO";
            *(_DWORD *)int64_t v18 = 138412802;
            *(void *)&v18[4] = v13;
            *(_WORD *)&v18[12] = 2112;
            if (v4) {
              __int16 v14 = @"YES";
            }
            *(void *)&v18[14] = v6;
            __int16 v19 = 2112;
            id v20 = v14;
            _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_DEBUG, "Updating last addressed handle ID from %@ to %@. force update %@", v18, 0x20u);
          }
        }
        -[IMDChat setLastAddressedLocalHandle:](self, "setLastAddressedLocalHandle:", v6, *(_OWORD *)v18);
        uint64_t v15 = +[IMDChatStore sharedInstance];
        [v15 storeChat:self];

        uint64_t v16 = [(IMDChat *)self broadcaster];
        int v17 = [(IMDChat *)self guid];
        [v16 chat:v17 lastAddressedHandleUpdated:v6];

        [(IMDChat *)self storeAndBroadcastChatChanges];
      }
    }
  }
}

- (void)updateLastAddressedSIMID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    char v5 = [(IMDChat *)self lastAddressedSIMID];
    char v6 = IMSharedHelperAreObjectsLogicallySame();

    if ((v6 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        char v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          char v8 = [(IMDChat *)self lastAddressedSIMID];
          int v12 = 138412546;
          id v13 = v8;
          __int16 v14 = 2112;
          id v15 = v4;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEBUG, "Updating last addressed sim ID from %@ to %@", (uint8_t *)&v12, 0x16u);
        }
      }
      [(IMDChat *)self setLastAddressedSIMID:v4];
      int v9 = +[IMDChatStore sharedInstance];
      [v9 storeChat:self];

      int v10 = [(IMDChat *)self broadcaster];
      uint64_t v11 = [(IMDChat *)self guid];
      [v10 chat:v11 lastAddressedSIMIDUpdated:v4];

      [(IMDChat *)self storeAndBroadcastChatChanges];
    }
  }
}

- (void)updateLastAddressedHandle:(id)a3 forceUpdateHandle:(BOOL)a4 lastAddressedSIMID:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (a4)
  {
    if ([v9 isEqualToIgnoringCase:*MEMORY[0x1E4F6C7B8]])
    {
      if (a4) {
        goto LABEL_13;
      }
LABEL_7:

      goto LABEL_13;
    }
    char HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
    if (v9 || (HasMultipleSubscriptions & 1) != 0)
    {
LABEL_24:
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v22 = [(IMDChat *)self lastAddressedLocalHandle];
          int v24 = 138412546;
          unsigned int v25 = v22;
          __int16 v26 = 2112;
          id v27 = v9;
          _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_DEBUG, "Updating last addressed handle ID from %@ to %@", (uint8_t *)&v24, 0x16u);
        }
      }
      [(IMDChat *)self setLastAddressedLocalHandle:v9];
      if (![v10 length]) {
        goto LABEL_30;
      }
      int v13 = 1;
LABEL_15:
      __int16 v14 = [(IMDChat *)self lastAddressedSIMID];
      char v15 = IMSharedHelperAreObjectsLogicallySame();

      if ((v15 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            int v17 = [(IMDChat *)self lastAddressedSIMID];
            int v24 = 138412546;
            unsigned int v25 = v17;
            __int16 v26 = 2112;
            id v27 = v10;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_DEBUG, "Updating last addressed sim ID from %@ to %@", (uint8_t *)&v24, 0x16u);
          }
        }
        [(IMDChat *)self setLastAddressedSIMID:v10];
        int64_t v18 = +[IMDChatStore sharedInstance];
        [v18 storeChat:self];

        __int16 v19 = [(IMDChat *)self broadcaster];
        id v20 = [(IMDChat *)self guid];
        if (v13) {
          [v19 chat:v20 lastAddressedHandleUpdated:v9 lastAddressedSIMIDUpdated:v10];
        }
        else {
          [v19 chat:v20 lastAddressedSIMIDUpdated:v10];
        }
        goto LABEL_32;
      }
      if (!v13) {
        goto LABEL_33;
      }
LABEL_30:
      id v23 = +[IMDChatStore sharedInstance];
      [v23 storeChat:self];

      __int16 v19 = [(IMDChat *)self broadcaster];
      id v20 = [(IMDChat *)self guid];
      [v19 chat:v20 lastAddressedHandleUpdated:v9];
LABEL_32:

      [(IMDChat *)self storeAndBroadcastChatChanges];
      goto LABEL_33;
    }
  }
  else
  {
    char v5 = [(IMDChat *)self lastAddressedLocalHandle];
    if ((IMSharedHelperAreObjectsLogicallySame() & 1) != 0
      || ([v9 isEqualToIgnoringCase:*MEMORY[0x1E4F6C7B8]] & 1) != 0)
    {
      goto LABEL_7;
    }
    char v12 = IMSharedHelperDeviceHasMultipleSubscriptions();

    if (v9 || (v12 & 1) != 0) {
      goto LABEL_24;
    }
  }
LABEL_13:
  if ([v10 length])
  {
    int v13 = 0;
    goto LABEL_15;
  }
LABEL_33:
}

- (void)updateDisplayName:(id)a3
{
}

- (void)updateDisplayName:(id)a3 sender:(id)a4
{
  int v17 = (NSString *)a3;
  id v6 = a4;
  if (self->_displayName != v17)
  {
    if (self->_style != 45
      || [(IMDChat *)self isBusinessChat]
      || [(IMDChat *)self isStewieChat]
      || ([(IMDChat *)self serviceName],
          char v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isEqualToString:*MEMORY[0x1E4F6E198]],
          v7,
          v8))
    {
      [(IMDChat *)self setDisplayName:v17];
      [(IMDChat *)self setCloudKitSyncState:0];
      id v9 = +[IMDChatStore sharedInstance];
      [v9 storeChat:self];

      id v10 = +[IMDChatVocabularyUpdater sharedInstance];
      [v10 updateVocabularyForRenamedChat:self completionHandler:0];

      [(IMDChat *)self storeAndBroadcastChatChanges];
      uint64_t v11 = +[IMDChatRegistry sharedInstance];
      [v11 updateFaceTimeGroupName:self];

      char v12 = [MEMORY[0x1E4F6E940] sharedCoordinator];
      int v13 = [(IMDChat *)self groupID];
      [v12 informOfChangedGroupDisplayName:v13];

      __int16 v14 = [(IMDChat *)self broadcaster];
      char v15 = [(IMDChat *)self guid];
      uint64_t v16 = [(IMDChat *)self personCentricID];
      [v14 chat:v15 chatPersonCentricID:v16 displayNameUpdated:v17 sender:v6];
    }
  }
}

- (void)updateIsFiltered:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self isFiltered] != a3)
  {
    BOOL v5 = [(IMDChat *)self isFiltered] == 2;
    [(IMDChat *)self setIsFiltered:a3];
    id v6 = +[IMDChatStore sharedInstance];
    [v6 storeChat:self];

    char v7 = [(IMDChat *)self broadcaster];
    int v8 = [(IMDChat *)self guid];
    [v7 chat:v8 isFilteredUpdated:a3];

    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          id v10 = [(IMDChat *)self guid];
          int v15 = 138412290;
          uint64_t v16 = v10;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_DEBUG, "Indexing with Spotlight as chat was moved out of Junk. Chat with guid: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      [(IMDChat *)self _indexChatAndMessagesToSpotlightWithReason:1002];
    }
    else if (a3 == 2)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          char v12 = [(IMDChat *)self guid];
          int v15 = 138412290;
          uint64_t v16 = v12;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEBUG, "Delete from Spotlight as chat was moved to Junk. Chat with guid: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      int v13 = [(IMDChat *)self guid];
      IMDCoreSpotlightDeleteChatGUID();
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 67109120;
        LODWORD(v16) = a3;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_DEBUG, "Updating isFiltered to: %d", (uint8_t *)&v15, 8u);
      }
    }
  }
}

- (void)_indexChatAndMessagesToSpotlightWithReason:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL v5 = [(IMDChat *)self guid];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = (uint64_t)v5;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_DEBUG, "Index chat to Spotlight as it was moved out of Junk. Chat with guid: %@", buf, 0xCu);
    }
  }
  id v6 = [(IMDChat *)self guid];
  IMDCoreSpotlightAddChatGUID();

  [(IMDChat *)self guid];
  uint64_t v16 = (void *)IMDChatRecordCopyChatForGUID();
  char v7 = (void *)IMDChatRecordCopyMessagesWithLimit();
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v7 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEBUG, "Starting indexing %llu messages to Spotlight", buf, 0xCu);
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        __int16 v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) guid];
        if (v14)
        {
          IMDCoreSpotlightAddMessageGUID();
        }
        else if (IMOSLoggingEnabled())
        {
          int v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEBUG, "Failed to find messageGUID for spotlight", buf, 2u);
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)updateIsBlackholed:(BOOL)a3
{
  BOOL v3 = a3;
  v36[1] = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self isBlackholed] != a3)
  {
    if (!v3)
    {
      id v4 = [MEMORY[0x1E4F6E858] sharedInstance];
      [v4 acquireAssertionToUnsuspendProcess];
    }
    [(IMDChat *)self setIsBlackholed:v3];
    BOOL v5 = +[IMDChatStore sharedInstance];
    [v5 storeChat:self];

    id v6 = +[IMDBroadcastController sharedProvider];
    uint64_t v23 = [v6 broadcasterForChatListenersUsingBlackholeRegistry:v3];

    char v7 = +[IMDBroadcastController sharedProvider];
    uint64_t v24 = [v7 broadcasterForChatListenersUsingBlackholeRegistry:v3 ^ 1];

    int v8 = [(IMDChat *)self guid];
    [v24 leftChat:v8];

    if (v3)
    {
      uint64_t v9 = [(IMDChat *)self chatIdentifier];
      id v10 = [(IMDChat *)self dictionaryRepresentationIncludingLastMessage];
      long long v35 = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      [v23 chatLoadedWithChatIdentifier:v9 chats:v11];
    }
    else
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"__kIMChatPreviouslyBlackholedChatHasBeenLoaded", 0, 0, 1u);
      uint64_t v9 = [(IMDChat *)self chatIdentifier];
      id v10 = [(IMDChat *)self dictionaryRepresentationIncludingLastMessage];
      v36[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      [v23 previouslyBlackholedChatLoadedWithChatIdentifier:v9 chats:v11];
    }

    int v13 = +[IMDChatRegistry sharedInstance];
    [v13 checkBlackholedChatsExistAfterUpdatingChatWithAdd:v3];

    [(IMDChat *)self guid];
    unint64_t v22 = (void *)IMDChatRecordCopyChatForGUID();
    if (!v3)
    {
      long long v33 = @"restoredFromBlackhole";
      uint64_t v34 = MEMORY[0x1E4F1CC38];
      __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      [(IMDChat *)self updateProperties:v14];

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = (id)IMDChatRecordCopyMessagesWithLimit();
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v15);
            }
            long long v19 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "guid", v22);
            if (v19)
            {
              IMDCoreSpotlightAddMessageGUID();
            }
            else if (IMOSLoggingEnabled())
            {
              long long v20 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109120;
                BOOL v31 = v3;
                _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_DEBUG, "Failed to find messageGUID for spotlight reindexing when isBlackholed set to (expecting 0): %d", buf, 8u);
              }
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v16);
      }

      uint64_t v21 = [(IMDChat *)self _chatRegistry];
      [v21 updateLastMessageForChat:self hintMessage:0];
    }
  }
}

- (void)updateHasCancellableScheduledMessage:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self hasScheduledMessage] != a3)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = @"NO";
        if (v3) {
          id v6 = @"YES";
        }
        int v13 = 138412290;
        __int16 v14 = v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "Updating hasScheduledMessage to: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    [(IMDChat *)self setHasScheduledMessage:v3];
    char v7 = +[IMDChatStore sharedInstance];
    [v7 storeChat:self];

    id v8 = [(IMDChat *)self copyDictionaryRepresentation:0];
    uint64_t v9 = [(IMDChat *)self broadcaster];
    id v10 = [(IMDChat *)self guid];
    [v9 chat:v10 updated:v8];

    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = @"NO";
        if (v3) {
          uint64_t v12 = @"YES";
        }
        int v13 = 138412290;
        __int16 v14 = v12;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEBUG, "Updated hasScheduledMessage to: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
}

- (void)_updateIsRecovered:(BOOL)a3 silently:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self isRecovered] != a3)
  {
    [(IMDChat *)self setRecovered:v5];
    if (!a4)
    {
      char v7 = +[IMDChatStore sharedInstance];
      [v7 storeChat:self];

      [(IMDChat *)self setCloudKitSyncState:0];
      id v8 = [(IMDChat *)self broadcaster];
      uint64_t v9 = [(IMDChat *)self guid];
      [v8 chat:v9 isRecoveredUpdated:v5];
    }
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = @"NO";
        if (v5) {
          uint64_t v11 = @"YES";
        }
        int v12 = 138412290;
        int v13 = v11;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEBUG, "Updating isRecovered to: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (void)updateIsDeletingIncomingMessages:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self isDeletingIncomingMessages] != a3)
  {
    [(IMDChat *)self setDeletingIncomingMessages:v3];
    BOOL v5 = +[IMDChatStore sharedInstance];
    [v5 storeChat:self];

    id v6 = [(IMDChat *)self broadcaster];
    char v7 = [(IMDChat *)self guid];
    [v6 chat:v7 isDeletingIncomingMessagesUpdated:v3];

    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = @"NO";
        if (v3) {
          uint64_t v9 = @"YES";
        }
        int v10 = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEBUG, "Updating isDeletingIncomingMessages to: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)updateIsRecovered:(BOOL)a3
{
}

- (void)updateIsDownloadingPendingSatelliteMessages:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isCarrierPigeonEnabled];

  if (!v6) {
    return;
  }
  char v7 = +[IMDChorosController sharedController];
  char v8 = [v7 isSatelliteConnectionActive];

  if (v8)
  {
    if ([(IMDChat *)self isDownloadingPendingSatelliteMessages] == v3) {
      return;
    }
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = [(IMDChat *)self guid];
      int v17 = 138412290;
      long long v18 = v10;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_DEBUG, "Satellite connection is inactive. Immediately setting isDownloadingPendingSatelliteMessages to NO for chat with GUID %@", (uint8_t *)&v17, 0xCu);
    }
  }
  if ([(IMDChat *)self isDownloadingPendingSatelliteMessages])
  {
    BOOL v3 = 0;
LABEL_11:
    [(IMDChat *)self setIsDownloadingPendingSatelliteMessages:v3];
    uint64_t v11 = +[IMDChatStore sharedInstance];
    [v11 storeChat:self];

    id v12 = [(IMDChat *)self copyDictionaryRepresentation:0];
    int v13 = [(IMDChat *)self broadcaster];
    uint64_t v14 = [(IMDChat *)self guid];
    [v13 chat:v14 updated:v12];

    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = @"NO";
        if (v3) {
          uint64_t v16 = @"YES";
        }
        int v17 = 138412290;
        long long v18 = v16;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEBUG, "Updating isDownloadingPendingSatelliteMessages to: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
}

- (void)updatePendingIncomingSatelliteMessageCount:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isCarrierPigeonEnabled];

  if (v6 && [(IMDChat *)self pendingIncomingSatelliteMessageCount] != a3)
  {
    [(IMDChat *)self setPendingIncomingSatelliteMessageCount:a3];
    char v7 = +[IMDChatStore sharedInstance];
    [v7 storeChat:self];

    id v8 = [(IMDChat *)self copyDictionaryRepresentation:0];
    uint64_t v9 = [(IMDChat *)self broadcaster];
    int v10 = [(IMDChat *)self guid];
    [v9 chat:v10 updated:v8];

    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12[0] = 67109120;
        v12[1] = a3;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEBUG, "Updating pendingIncomingSatelliteMessageCount to: %d", (uint8_t *)v12, 8u);
      }
    }
  }
}

- (void)updateNumberOfTimesRespondedToThread
{
  v10[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(IMDChat *)self getNumberOfTimesRespondedToThread];
  if (v3 <= 2)
  {
    uint64_t v9 = @"numberOfTimesRespondedtoThread";
    id v4 = [NSNumber numberWithInt:(v3 + 1)];
    v10[0] = v4;
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [(IMDChat *)self updateProperties:v5];

    int v6 = [(IMDChat *)self broadcaster];
    char v7 = [(IMDChat *)self guid];
    id v8 = [(IMDChat *)self properties];
    [v6 chat:v7 propertiesUpdated:v8];
  }
}

- (void)updateIsiMessageSpam:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"wasDetectedAsiMessageSpam";
  id v4 = [NSNumber numberWithBool:a3];
  v10[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(IMDChat *)self updateProperties:v5];

  int v6 = [(IMDChat *)self broadcaster];
  char v7 = [(IMDChat *)self guid];
  id v8 = [(IMDChat *)self properties];
  [v6 chat:v7 propertiesUpdated:v8];
}

- (int64_t)spamCategory
{
  int v3 = [(NSDictionary *)self->_properties objectForKey:@"wasDetectedAsSMSSpam"];
  char v4 = [v3 BOOLValue];

  if (v4) {
    return 2;
  }
  int v6 = (void *)MEMORY[0x1E4F6E938];
  char v7 = [(NSDictionary *)self->_properties objectForKey:@"SMSCategory"];
  int64_t v8 = objc_msgSend(v6, "filterActionForCategory:", (int)objc_msgSend(v7, "intValue"));

  return v8;
}

- (id)spamExtensionName
{
  return [(NSDictionary *)self->_properties objectForKey:@"smsSpamExtensionName"];
}

- (void)updateSMSCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  long long v28 = @"wasDetectedAsSMSSpam";
  v29[0] = MEMORY[0x1E4F1CC28];
  char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  [(IMDChat *)self updateProperties:v7];

  if ((unint64_t)(a3 - 3) >= 2)
  {
    if (a3 == 2)
    {
      [(IMDChat *)self updateIsFiltered:2];
      long long v26 = @"SMSCategory";
      long long v27 = &unk_1F33C5B68;
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v13 = &v27;
      uint64_t v14 = &v26;
      uint64_t v15 = 1;
    }
    else
    {
      [(IMDChat *)self updateIsFiltered:1];
      v22[0] = @"SMSCategory";
      v22[1] = @"SMSSubCategory";
      v23[0] = &unk_1F33C5B80;
      v23[1] = &unk_1F33C5B80;
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v13 = (void **)v23;
      uint64_t v14 = (__CFString **)v22;
      uint64_t v15 = 2;
    }
    uint64_t v9 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
    [(IMDChat *)self updateProperties:v9];
  }
  else
  {
    int64_t v8 = [MEMORY[0x1E4F6E938] fetchSMSFilterParamForCategory:a3 subCategory:a4];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 category];
      uint64_t v11 = [v9 subCategory];
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
    [(IMDChat *)self updateIsFiltered:a3 | (16 * a4)];
    v24[0] = @"SMSCategory";
    uint64_t v16 = [NSNumber numberWithInteger:v10];
    v24[1] = @"SMSSubCategory";
    v25[0] = v16;
    int v17 = [NSNumber numberWithInteger:v11];
    v25[1] = v17;
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    [(IMDChat *)self updateProperties:v18];
  }
  uint64_t v19 = [(IMDChat *)self broadcaster];
  long long v20 = [(IMDChat *)self guid];
  uint64_t v21 = [(IMDChat *)self properties];
  [v19 chat:v20 propertiesUpdated:v21];
}

- (void)updateShouldForceToSMS:(BOOL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = @"shouldForceToSMS";
  char v4 = [NSNumber numberWithBool:a3];
  v11[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v6 = [(IMDChat *)self updateProperties:v5];

  if (v6)
  {
    char v7 = [(IMDChat *)self broadcaster];
    int64_t v8 = [(IMDChat *)self guid];
    uint64_t v9 = [(IMDChat *)self properties];
    [v7 chat:v8 propertiesUpdated:v9];
  }
}

- (void)updateSMSSpamExtensionNameChatProperty:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v10 = @"smsSpamExtensionName";
    v11[0] = a3;
    char v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    BOOL v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];

    [(IMDChat *)self updateProperties:v6];
    char v7 = [(IMDChat *)self broadcaster];
    int64_t v8 = [(IMDChat *)self guid];
    uint64_t v9 = [(IMDChat *)self properties];
    [v7 chat:v8 propertiesUpdated:v9];
  }
}

- (void)setLastSentMessageDate:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = @"LSMD";
  v11[0] = a3;
  char v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  BOOL v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(IMDChat *)self updateProperties:v6];
  char v7 = [(IMDChat *)self broadcaster];
  int64_t v8 = [(IMDChat *)self guid];
  uint64_t v9 = [(IMDChat *)self properties];
  [v7 chat:v8 propertiesUpdated:v9];
}

- (void)updateReceivedBlackholeError:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"RBHE";
  char v4 = [NSNumber numberWithBool:a3];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(IMDChat *)self updateProperties:v5];

  BOOL v6 = [(IMDChat *)self broadcaster];
  char v7 = [(IMDChat *)self guid];
  int64_t v8 = [(IMDChat *)self properties];
  [v6 chat:v7 propertiesUpdated:v8];
}

- (void)updateSMSHandshakeState:(int)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"smsHandshakeState";
  char v4 = [NSNumber numberWithInt:*(void *)&a3];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(IMDChat *)self updateProperties:v5];

  BOOL v6 = [(IMDChat *)self broadcaster];
  char v7 = [(IMDChat *)self guid];
  int64_t v8 = [(IMDChat *)self properties];
  [v6 chat:v7 propertiesUpdated:v8];
}

- (void)updateMessageHandshakeState:(int)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"messageHandshakeState";
  char v4 = [NSNumber numberWithInt:*(void *)&a3];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(IMDChat *)self updateProperties:v5];

  BOOL v6 = [(IMDChat *)self broadcaster];
  char v7 = [(IMDChat *)self guid];
  int64_t v8 = [(IMDChat *)self properties];
  [v6 chat:v7 propertiesUpdated:v8];
}

- (void)updateLastKnownHybridStateAndRemergeIfAppropriate:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self lastKnownHybridState] != a3)
  {
    id v5 = [(IMDChat *)self personCentricID];
    uint64_t v13 = *MEMORY[0x1E4F6CDA8];
    BOOL v6 = [NSNumber numberWithBool:v3];
    v14[0] = v6;
    char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [(IMDChat *)self updateProperties:v7];

    uint64_t v8 = [(IMDChat *)self broadcaster];
    uint64_t v9 = [(IMDChat *)self guid];
    uint64_t v10 = [(IMDChat *)self properties];
    [(id)v8 chat:v9 propertiesUpdated:v10];

    uint64_t v11 = [(IMDChat *)self personCentricID];
    LOBYTE(v8) = [v5 isEqualToString:v11];

    if ((v8 & 1) == 0)
    {
      id v12 = +[IMDChatRegistry sharedInstance];
      [v12 _triggerRemergeForPersonCentricID:v5];
    }
  }
}

- (void)updateEmergencyTranscriptSharingStateChatProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self emergencyTranscriptSharingState] != a3)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        BOOL v6 = [NSNumber numberWithInt:v3];
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "Updating transcript sharing state to %@", buf, 0xCu);
      }
    }
    char v7 = objc_msgSend(NSNumber, "numberWithInt:", v3, @"emergencyTranscriptSharingState");
    uint64_t v13 = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [(IMDChat *)self updateProperties:v8];

    uint64_t v9 = [(IMDChat *)self broadcaster];
    uint64_t v10 = [(IMDChat *)self guid];
    uint64_t v11 = [(IMDChat *)self properties];
    [v9 chat:v10 propertiesUpdated:v11];
  }
}

- (BOOL)isiMessageSpam
{
  id v2 = [(IMDChat *)self properties];
  uint64_t v3 = [v2 objectForKey:@"wasDetectedAsiMessageSpam"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)isSMSSpam
{
  uint64_t v3 = [(IMDChat *)self properties];
  char v4 = [v3 objectForKey:@"wasDetectedAsSMSSpam"];

  id v5 = [(IMDChat *)self properties];
  BOOL v6 = [v5 objectForKey:@"SMSCategory"];

  BOOL v7 = v4 && ([v4 BOOLValue] & 1) != 0 || objc_msgSend(v6, "intValue") == 1;
  return v7;
}

- (int)getNumberOfTimesRespondedToThread
{
  id v2 = [(IMDChat *)self properties];
  uint64_t v3 = [v2 objectForKey:@"numberOfTimesRespondedtoThread"];
  char v4 = (void *)v3;
  id v5 = &unk_1F33C5B98;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  int v7 = [v6 intValue];
  return v7;
}

- (id)lastSentMessageDate
{
  uint64_t v3 = [(IMDChat *)self properties];
  char v4 = [v3 objectForKey:@"LSMD"];

  if (!v4)
  {
    id v5 = [(IMDChat *)self lastMessage];
    int v6 = [v5 isFromMe];

    if (v6)
    {
      int v7 = [(IMDChat *)self lastMessage];
      char v4 = [v7 time];

      [(IMDChat *)self setLastSentMessageDate:v4];
    }
    else
    {
      char v4 = 0;
    }
  }

  return v4;
}

- (BOOL)receivedBlackholeError
{
  id v2 = [(IMDChat *)self properties];
  uint64_t v3 = [v2 objectForKey:@"RBHE"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (int)smsHandshakeState
{
  id v2 = [(IMDChat *)self properties];
  uint64_t v3 = [v2 objectForKey:@"smsHandshakeState"];
  char v4 = (void *)v3;
  id v5 = &unk_1F33C5B98;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  int v7 = [v6 intValue];
  return v7;
}

- (int)messageHandshakeState
{
  id v2 = [(IMDChat *)self properties];
  uint64_t v3 = [v2 objectForKey:@"messageHandshakeState"];
  char v4 = (void *)v3;
  id v5 = &unk_1F33C5B98;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  int v7 = [v6 intValue];
  return v7;
}

- (int)emergencyTranscriptSharingState
{
  id v2 = [(IMDChat *)self properties];
  uint64_t v3 = [v2 objectForKey:@"emergencyTranscriptSharingState"];
  char v4 = (void *)v3;
  id v5 = &unk_1F33C5B98;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  int v7 = [v6 intValue];
  return v7;
}

- (NSString)lastSeenMessageGuid
{
  id v2 = [(IMDChat *)self properties];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6CDC8]];

  return (NSString *)v3;
}

- (void)updateLastSeenMessageGuidIfNeeded:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isCatchUpEnabled];

  if (v6)
  {
    int v7 = [(IMDChat *)self properties];
    uint64_t v8 = *MEMORY[0x1E4F6CDC8];
    uint64_t v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6CDC8]];

    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v9;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEBUG, "Checking if last seen message guid needs updating, old %@ new %@", buf, 0x16u);
      }
    }
    if (([v9 isEqualToString:v4] & 1) == 0)
    {
      uint64_t v16 = v8;
      uint64_t v11 = v4;
      if (!v4)
      {
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v16);
      }
      int v17 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      [(IMDChat *)self updateProperties:v12];

      if (!v4) {
      uint64_t v13 = [(IMDChat *)self broadcaster];
      }
      uint64_t v14 = [(IMDChat *)self guid];
      uint64_t v15 = [(IMDChat *)self properties];
      [v13 chat:v14 propertiesUpdated:v15];
    }
  }
}

- (id)lastTranslatableMessageGUIDWithLanguageCode:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDChat *)self properties];
  int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6CDD0]];

  int v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (void)updateLastMessageGUID:(id)a3 forLanguageCode:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(IMDChat *)self properties];
  uint64_t v9 = *MEMORY[0x1E4F6CDD0];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F6CDD0]];

  [v10 setValue:v7 forKey:v6];
  uint64_t v12 = v9;
  v13[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [(IMDChat *)self updateProperties:v11];
}

- (BOOL)isEmergencyChat
{
  id v2 = [(IMDChat *)self properties];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F6CD70]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)updateIsEmergencyChat:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F6CD70];
  char v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(IMDChat *)self updateProperties:v5];
}

- (BOOL)isStewieChat
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 stewieEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(IMDChat *)self chatIdentifier];
  char v6 = MEMORY[0x1E0169B70]();

  return v6;
}

- (BOOL)isStewieEmergencyChat
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 stewieEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(IMDChat *)self chatIdentifier];
  char v6 = IMIsStringStewieEmergency();

  return v6;
}

- (BOOL)isStewieRoadsideChat
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 stewieEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(IMDChat *)self chatIdentifier];
  char v6 = IMIsStringStewieRoadside();

  return v6;
}

- (BOOL)isStewieSharingChat
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isTranscriptSharingEnabled];

  if (!v4) {
    return 0;
  }
  cachedStewieSharingChat = self->_cachedStewieSharingChat;
  if (!cachedStewieSharingChat)
  {
    char v6 = NSNumber;
    id v7 = [(IMDChat *)self emergencyUserInfo];
    [v6 numberWithInt:v7 != 0];
    uint64_t v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_cachedStewieSharingChat;
    self->_cachedStewieSharingChat = v8;

    cachedStewieSharingChat = self->_cachedStewieSharingChat;
  }

  return [(NSNumber *)cachedStewieSharingChat BOOLValue];
}

- (void)setEmergencyUserInfo:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isTranscriptSharingEnabled];

  if (v6)
  {
    uint64_t v12 = *MEMORY[0x1E4F6CD28];
    id v7 = [v4 dictionaryRepresentation];
    v13[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [(IMDChat *)self updateProperties:v8];

    uint64_t v9 = [(IMDChat *)self broadcaster];
    uint64_t v10 = [(IMDChat *)self guid];
    uint64_t v11 = [(IMDChat *)self properties];
    [v9 chat:v10 propertiesUpdated:v11];
  }
}

- (IMSharedEmergencyInfo)emergencyUserInfo
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isTranscriptSharingEnabled];

  if (v4)
  {
    id v5 = [(IMDChat *)self properties];
    int v6 = [v5 objectForKey:*MEMORY[0x1E4F6CD28]];

    id v7 = [MEMORY[0x1E4F6E9A0] infoFromDictionary:v6 isStewieTranscriptSharingMessage:0];
  }
  else
  {
    id v7 = 0;
  }

  return (IMSharedEmergencyInfo *)v7;
}

- (id)associatedBusinessID
{
  if ([(IMDChat *)self isStewieRoadsideChat])
  {
    uint64_t v3 = [(IMDChat *)self properties];
    int v4 = [v3 objectForKey:*MEMORY[0x1E4F6CCE0]];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)updateAssociatedBusinessID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(IMDChat *)self isStewieRoadsideChat])
  {
    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D9902FDC();
    }
    goto LABEL_13;
  }
  if (([v4 _appearsToBeBusinessID] & 1) == 0)
  {
    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D9902F64((uint64_t)v4, v10);
    }
    goto LABEL_13;
  }
  id v5 = [(IMDChat *)self associatedBusinessID];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = [(IMDChat *)self guid];
        *(_DWORD *)buf = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        long long v18 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEBUG, "Updating Associated business ID to: %@ for chat guid: %@", buf, 0x16u);
      }
    }
    uint64_t v13 = *MEMORY[0x1E4F6CCE0];
    id v14 = v4;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [(IMDChat *)self updateProperties:v9];

    uint64_t v10 = [(IMDChat *)self broadcaster];
    uint64_t v11 = [(IMDChat *)self guid];
    uint64_t v12 = [(IMDChat *)self properties];
    [v10 chat:v11 propertiesUpdated:v12];

LABEL_13:
  }
}

- (BOOL)isOscarChat
{
  if ([(IMDChat *)self isFiltered] != 2) {
    return 0;
  }
  uint64_t v3 = [(IMDChat *)self account];
  id v4 = [v3 service];
  id v5 = [v4 internalName];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F6E1B0]];

  return v6;
}

- (void)updateHasHadSuccessfulQuery:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(IMDChat *)self hasHadSuccessfulQuery] != a3)
  {
    [(IMDChat *)self setHasHadSuccessfulQuery:v3];
    id v5 = +[IMDChatStore sharedInstance];
    [v5 storeChat:self];
  }
}

- (void)updateGroupPhotoGuid:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDChat *)self groupPhotoGuid];
  char v6 = v5;
  if (v4)
  {
    if (([v5 isEqualToString:v4] & 1) == 0)
    {
      [(IMDChat *)self setCloudKitSyncState:0];
      uint64_t v14 = *MEMORY[0x1E4F6CD48];
      v15[0] = v4;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [(IMDChat *)self updateProperties:v7];
LABEL_6:

      uint64_t v9 = [(IMDChat *)self broadcaster];
      uint64_t v10 = [(IMDChat *)self guid];
      uint64_t v11 = [(IMDChat *)self properties];
      [v9 chat:v10 propertiesUpdated:v11];
    }
  }
  else if (v5)
  {
    [(IMDChat *)self setCloudKitSyncState:0];
    uint64_t v12 = *MEMORY[0x1E4F6CD48];
    id v7 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v13 = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [(IMDChat *)self updateProperties:v8];

    goto LABEL_6;
  }
}

- (id)groupPhotoUploadFailureCount
{
  id v2 = [(IMDChat *)self properties];
  BOOL v3 = [v2 objectForKey:@"GPUFC"];

  return v3;
}

- (void)updateGroupPhotoUploadFailureCount:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDChat *)self groupPhotoUploadFailureCount];
  char v6 = v5;
  if (v4)
  {
    if (([v5 isEqualToNumber:v4] & 1) == 0)
    {
      uint64_t v14 = @"GPUFC";
      v15[0] = v4;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [(IMDChat *)self updateProperties:v7];
LABEL_6:

      uint64_t v9 = [(IMDChat *)self broadcaster];
      uint64_t v10 = [(IMDChat *)self guid];
      uint64_t v11 = [(IMDChat *)self properties];
      [v9 chat:v10 propertiesUpdated:v11];
    }
  }
  else if (v5)
  {
    uint64_t v12 = @"GPUFC";
    id v7 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v13 = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [(IMDChat *)self updateProperties:v8];

    goto LABEL_6;
  }
}

- (id)_chatRegistry
{
  return +[IMDChatRegistry sharedInstance];
}

- (void)_persistMergedIDMergedChatsIfNeeded:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_DEBUG, "Trying to persist legacy mergedID-based merged chats - 48047873", buf, 2u);
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [(IMDChat *)self participants];
  uint64_t v26 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v35;
    *(void *)&long long v5 = 138412290;
    long long v22 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v35 != v25)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v27 = v6;
        uint64_t v8 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
        long long v28 = objc_msgSend(v8, "CNContactID", v22);
        uint64_t v9 = [v8 personCentricID];
        uint64_t v10 = (void *)v9;
        if (v28) {
          BOOL v11 = 1;
        }
        else {
          BOOL v11 = v9 == 0;
        }
        if (!v11)
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v12 = v23;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v46 count:16];
          if (v13)
          {
            id v29 = 0;
            uint64_t v14 = *(void *)v31;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v31 != v14) {
                  objc_enumerationMutation(v12);
                }
                id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                if (v16 != v8)
                {
                  __int16 v17 = [*(id *)(*((void *)&v30 + 1) + 8 * i) CNContactID];
                  long long v18 = [v16 personCentricID];
                  if ([v18 isEqualToString:v10])
                  {
                    if (IMOSLoggingEnabled())
                    {
                      uint64_t v19 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138413058;
                        uint64_t v39 = v8;
                        __int16 v40 = 2112;
                        id v41 = v16;
                        __int16 v42 = 2112;
                        v43 = v17;
                        __int16 v44 = 2112;
                        uint64_t v45 = v10;
                        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_DEBUG, "For handle [%@] we found another handle [%@] with contactID [%@] that has the same mergedID: [%@]", buf, 0x2Au);
                      }
                    }
                    if (v17)
                    {

                      id v29 = v17;
LABEL_34:
                      if (IMOSLoggingEnabled())
                      {
                        __int16 v20 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v39 = v8;
                          __int16 v40 = 2112;
                          id v41 = v29;
                          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_DEBUG, "handle [%@] gets a mergedContactID: [%@]", buf, 0x16u);
                        }
                      }
                      [v8 setCNContactID:v29];

                      goto LABEL_44;
                    }
                    if (!v29) {
                      id v29 = v10;
                    }
                  }
                }
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v46 count:16];
              if (v13) {
                continue;
              }
              break;
            }

            if (v29) {
              goto LABEL_34;
            }
          }
          else
          {
          }
          if (IMOSLoggingEnabled())
          {
            id v21 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v22;
              uint64_t v39 = v8;
              _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_DEBUG, "handle [%@] doesn't have mergedID siblings", buf, 0xCu);
            }
          }
        }
LABEL_44:

        uint64_t v6 = v27 + 1;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v26);
  }
}

- (id)cloudKitChatID
{
  if ([(IMDChat *)self style] == 45) {
    [(IMDChat *)self guid];
  }
  else {
  BOOL v3 = [(IMDChat *)self originalGroupID];
  }
  id v4 = (void *)[v3 copy];

  return v4;
}

- (id)_ckUniqueID
{
  if ([(IMDChat *)self style] == 45)
  {
    BOOL v3 = [(IMDChat *)self guid];
  }
  else
  {
    id v4 = NSString;
    long long v5 = [(IMDChat *)self serviceName];
    uint64_t v6 = [(IMDChat *)self groupID];
    BOOL v3 = [v4 stringWithFormat:@"%@:%@", v5, v6];
  }

  return v3;
}

- (id)cloudKitDebugDescription
{
  BOOL v3 = NSString;
  id v4 = [(IMDChat *)self _ckUniqueID];
  int64_t v5 = [(IMDChat *)self cloudKitSyncState];
  uint64_t v6 = [(IMDChat *)self serverChangeToken];
  uint64_t v7 = [v3 stringWithFormat:@"<IMDChat %p _ckUniqueID %@, ckSyncState %ld recordChangeTag %@>", self, v4, v5, v6];

  return v7;
}

- (int64_t)groupParticipantVersion
{
  id v2 = [(IMDChat *)self properties];
  BOOL v3 = [v2 objectForKey:@"pv"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setGroupParticipantVersion:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(IMDChat *)self groupID];
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2048;
      int64_t v14 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "Setting participant version of chat %@ to %ld", buf, 0x16u);
    }
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", a3, @"pv");
  uint64_t v10 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [(IMDChat *)self updateProperties:v8];
}

- (BOOL)isBusinessChat
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(IMDChat *)self participants];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isBusiness])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isChatBot
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(IMDChat *)self hasFetchedPersistentMenu]) {
    return 1;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(IMDChat *)self participants];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = [v9 personCentricID];
        if (objc_msgSend(v10, "__im_isSipHandle"))
        {

LABEL_15:
          BOOL v3 = 1;
          goto LABEL_16;
        }
        BOOL v11 = [v9 ID];
        char v12 = objc_msgSend(v11, "__im_isChatBot");

        if (v12) {
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v3 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
LABEL_16:

  return v3;
}

- (BOOL)hasFetchedPersistentMenu
{
  BOOL v3 = [(IMDChat *)self properties];
  if (v3)
  {
    uint64_t v4 = [(IMDChat *)self properties];
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6DF00]];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)addBIAContextWithUserID:(id)a3 referenceID:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v5 = a4;
  BOOL v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isBIAEnabled];

  if (v7)
  {
    if ([v35 length])
    {
      long long v8 = [(IMDChat *)self properties];
      long long v9 = [v8 objectForKey:@"AMB-BIAContext"];
      long long v10 = (void *)[v9 mutableCopy];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      obuint64_t j = v10;
      BOOL v11 = 0;
      uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v41 != v13) {
              objc_enumerationMutation(obj);
            }
            long long v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            long long v16 = [v15 valueForKey:@"userId"];
            if ([v35 isEqualToString:v16])
            {
              id v17 = v15;

              long long v18 = [v17 valueForKey:@"referenceIds"];
              long long v38 = 0u;
              long long v39 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v37;
                do
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    if (*(void *)v37 != v20) {
                      objc_enumerationMutation(v18);
                    }
                    [v5 isEqualToString:*(void *)(*((void *)&v36 + 1) + 8 * j)];
                  }
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v45 count:16];
                }
                while (v19);
              }

              BOOL v11 = v17;
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v12);
      }

      if (!obj) {
        obuint64_t j = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      }
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (!v11)
      {
        id v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
        if ([v35 length]) {
          [v23 setValue:v35 forKey:@"userId"];
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_DEBUG, "Adding a new BIA Context to Chat Properties", buf, 2u);
          }
        }
        [obj addObject:v23];
        [v22 setObject:obj forKeyedSubscript:@"AMB-BIAContext"];
      }
      if ([v5 length])
      {
        uint64_t v25 = [(IMDChat *)self properties];
        uint64_t v26 = [v25 objectForKey:@"AMB-BIALastUsedReferenceID"];

        if (([v5 isEqualToString:v26] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_DEBUG, "Updating lastUsedBIAReferenceID", buf, 2u);
            }
          }
          [v22 setObject:v5 forKeyedSubscript:@"AMB-BIALastUsedReferenceID"];
        }
      }
      if ([v22 count])
      {
        [(IMDChat *)self updateProperties:v22];
        long long v28 = [(IMDChat *)self broadcaster];
        id v29 = [(IMDChat *)self guid];
        long long v30 = [(IMDChat *)self properties];
        [v28 chat:v29 propertiesUpdated:v30];

        if (IMOSLoggingEnabled())
        {
          long long v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_DEBUG, "Updated Chat Properties for BIA", buf, 2u);
          }
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      long long v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_DEBUG, "BIA userID not provided. Early return.", buf, 2u);
      }
    }
  }
}

- (id)BIAContext
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isBIAEnabled];

  if (v4)
  {
    id v5 = [(IMDChat *)self properties];
    BOOL v6 = [v5 objectForKey:@"AMB-BIAContext"];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)deleteBIAContext
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isBIAEnabled];

  if (!v4) {
    return 0;
  }
  v13[0] = @"AMB-BIAContext";
  id v5 = [MEMORY[0x1E4F1CA98] null];
  v13[1] = @"AMB-BIALastUsedReferenceID";
  v14[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1CA98] null];
  v14[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  BOOL v8 = [(IMDChat *)self updateProperties:v7];

  long long v9 = [(IMDChat *)self broadcaster];
  long long v10 = [(IMDChat *)self guid];
  BOOL v11 = [(IMDChat *)self properties];
  [v9 chat:v10 propertiesUpdated:v11];

  return v8;
}

- (id)lastUsedBIAUserID
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isBIAEnabled];

  if (v4)
  {
    id v5 = [(IMDChat *)self properties];
    BOOL v6 = [v5 objectForKey:@"AMB-BIAContext"];
    int v7 = [v6 lastObject];

    BOOL v8 = [v7 valueForKey:@"userId"];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)lastUsedBIAReferenceID
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isBIAEnabled];

  if (v4)
  {
    id v5 = [(IMDChat *)self properties];
    BOOL v6 = [v5 objectForKey:@"AMB-BIALastUsedReferenceID"];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)containsActiveBIASession
{
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isBIAEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(IMDChat *)self lastUsedBIAUserID];
  BOOL v6 = [v5 length] != 0;

  return v6;
}

- (NSDictionary)keyTransparencyURIToUUIDMapping
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [(IMDChat *)self properties];
  BOOL v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6CD90]];

  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        BOOL v11 = [v3 objectForKeyedSubscript:v10];
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = (void *)[v4 copy];

  return (NSDictionary *)v13;
}

- (void)tearDownToneNotificationSessionIfNeeded
{
  id v3 = [MEMORY[0x1E4F6E858] sharedInstance];
  [v3 tearDownSessionForChatIdentifier:self->_chatIdentifier];
}

- (void)updateNicknamesForParticipants:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = +[IMDNicknameController sharedInstance];
        BOOL v11 = [v9 ID];
        uint64_t v12 = [v10 nicknameForHandleURI:v11];

        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v24 = v12;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEBUG, "Loaded message profile: %@", buf, 0xCu);
            }
          }
          long long v14 = [v12 dictionaryRepresentation];
          long long v15 = [v9 ID];
          [v4 setObject:v14 forKey:v15];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  [(NSRecursiveLock *)self->_lock lock];
  if ([v4 count])
  {
    [(NSMutableDictionary *)self->_chatInfo setObject:v4 forKey:*MEMORY[0x1E4F6CDE8]];
    objc_storeStrong((id *)&self->_nicknamesForParticipants, v4);
  }
  [(NSRecursiveLock *)self->_lock unlock];
  long long v16 = [(IMDChat *)self broadcaster];
  long long v17 = [(IMDChat *)self guid];
  [v16 chat:v17 nicknamesUpdated:v4];
}

- (void)meCardHasUpdated
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_DEBUG, "The meCard has been edited", v4, 2u);
    }
  }
  [(IMDChat *)self setMeCardUpdated:1];
}

- (unint64_t)repairHistory
{
  id v2 = [(IMDChat *)self properties];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6CE18]];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setRepairHistory:(unint64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F6CE18];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(IMDChat *)self updateProperties:v5];
}

- (BOOL)downloadingPendingSatelliteMessages
{
  return self->_isDownloadingPendingSatelliteMessages;
}

- (void)setRecipient:(id)a3
{
}

- (NSString)cloudKitRecordID
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setCloudKitRecordID:(id)a3
{
}

- (BOOL)wasDowngradedToLiteMessage
{
  return self->_wasDowngradedToLiteMessage;
}

- (void)setWasDowngradedToLiteMessage:(BOOL)a3
{
  self->_wasDowngradedToLiteMessage = a3;
}

- (NSDate)lastSentDowngradeRequestSinceLoadDate
{
  return (NSDate *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLastSentDowngradeRequestSinceLoadDate:(id)a3
{
}

- (int64_t)lastSentDowngradeRequestSinceLoadSessionIndex
{
  return self->_lastSentDowngradeRequestSinceLoadSessionIndex;
}

- (void)setLastSentDowngradeRequestSinceLoadSessionIndex:(int64_t)a3
{
  self->_lastSentDowngradeRequestSinceLoadSessionIndex = a3;
}

- (NSDate)lastReplicationSinceLoadDate
{
  return self->_lastReplicationSinceLoadDate;
}

- (void)setLastReplicationSinceLoadDate:(id)a3
{
}

- (BOOL)createEngramGroupOnMessageSend
{
  return self->_createEngramGroupOnMessageSend;
}

- (void)setCreateEngramGroupOnMessageSend:(BOOL)a3
{
  self->_createEngramGroupOnMessageSend = a3;
}

- (BOOL)pendingENGroupParticipantUpdate
{
  return self->_pendingENGroupParticipantUpdate;
}

- (void)setPendingENGroupParticipantUpdate:(BOOL)a3
{
  self->_pendingENGroupParticipantUpdate = a3;
}

- (NSDictionary)nicknamesForParticipants
{
  return self->_nicknamesForParticipants;
}

- (BOOL)wasReportedAsJunk
{
  return self->_wasReportedAsJunk;
}

- (void)setWasReportedAsJunk:(BOOL)a3
{
  self->_wasReportedAsJunk = a3;
}

- (void)setOscarChat:(BOOL)a3
{
  self->_oscarChat = a3;
}

- (NSNumber)cachedStewieSharingChat
{
  return self->_cachedStewieSharingChat;
}

- (void)setCachedStewieSharingChat:(id)a3
{
}

- (unint64_t)numMessagesSent
{
  return self->_numMessagesSent;
}

- (void)setNumMessagesSent:(unint64_t)a3
{
  self->_numMessagesSent = a3;
}

- (BOOL)meCardUpdated
{
  return self->_meCardUpdated;
}

- (void)setMeCardUpdated:(BOOL)a3
{
  self->_meCardUpdated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStewieSharingChat, 0);
  objc_storeStrong((id *)&self->_nicknamesForParticipants, 0);
  objc_storeStrong((id *)&self->_lastReplicationSinceLoadDate, 0);
  objc_storeStrong((id *)&self->_lastSentDowngradeRequestSinceLoadDate, 0);
  objc_storeStrong((id *)&self->_cloudKitRecordID, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_autoDonationBehaviorLastModificationDate, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_originalGroupID, 0);
  objc_storeStrong((id *)&self->_chatInfo, 0);
  objc_storeStrong((id *)&self->_lastMessage, 0);
  objc_storeStrong((id *)&self->_replySuggestions, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_lastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_lastAddressedLocalHandle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_engramID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)updateCollaborationMetadata:(id)a3 forMessageGUID:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = a4;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 arrayWithObjects:v9 count:1];

  IMDCoreSpotlightReindexMessagesWithCollaborationMetadata();
}

- (BOOL)updateDonationStateWithSyndicationAction:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (__CFString *)a3;
  id v5 = v4;
  if (!v4)
  {
    long long v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D99042C8((uint64_t)self, v9);
    }
    goto LABEL_14;
  }
  if ([(__CFString *)v4 isAutoDonatingMessages]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = [(__CFString *)v5 syndicationStartDate];
  BOOL v8 = [(IMDChat *)self setAutoDonationBehavior:v6 lastModificationDate:v7];

  long long v9 = IMLogHandleForCategory();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (!v8)
  {
    if (v10)
    {
      long long v15 = [(IMDChat *)self guid];
      int v17 = 138412546;
      long long v18 = v15;
      __int16 v19 = 2112;
      long long v20 = v5;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Chat %@ not updated with incoming SyndicationAction: %@", (uint8_t *)&v17, 0x16u);
    }
LABEL_14:
    BOOL v14 = 0;
    goto LABEL_15;
  }
  if (v10)
  {
    BOOL v11 = [(IMDChat *)self guid];
    int v12 = [(__CFString *)v5 isAutoDonatingMessages];
    uint64_t v13 = @"NO";
    int v17 = 138412802;
    long long v18 = v11;
    __int16 v19 = 2112;
    if (v12) {
      uint64_t v13 = @"YES";
    }
    long long v20 = v13;
    __int16 v21 = 2112;
    long long v22 = v5;
    BOOL v14 = 1;
    _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Updated chat with GUID: %@ donation setting to %@ with SyndicationAction: %@", (uint8_t *)&v17, 0x20u);
  }
  else
  {
    BOOL v14 = 1;
  }
LABEL_15:

  return v14;
}

+ (id)_recordType
{
  return @"chatEncryptedv2";
}

- (id)_copyCKRecordFromExistingCKMetadataWithZoneID:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IMDChat *)self serverChangeToken];
  long long v9 = [(IMDChat *)self cloudKitRecordID];
  BOOL v10 = [(IMDChat *)self guid];
  BOOL v11 = +[CKRecordUtilities recordNameForRecordChangeTag:v8 ckRecordID:v9 salt:v7 guid:v10];

  if ([v11 length])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    uint64_t v13 = +[IMDChat _recordType];
    BOOL v14 = +[CKRecordUtilities recordIDUsingName:v11 zoneID:v6];
    long long v15 = (void *)[v12 initWithRecordType:v13 recordID:v14];

    long long v16 = [(IMDChat *)self serverChangeToken];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      long long v18 = [(IMDChat *)self serverChangeToken];
      [v15 setEtag:v18];

      [v15 setKnownToServer:1];
    }
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (BOOL)_addGroupPhotoToCKRecord:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[IMDFileTransferCenter sharedInstance];
  BOOL v8 = [(IMDChat *)self groupPhotoGuid];
  long long v9 = [v7 transferForGUID:v8];

  if (!v9 || ([v9 localURL], BOOL v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMCloudKitChatSyncErrorDomain" code:1 userInfo:0];
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_19;
    }
    __int16 v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      long long v20 = [(IMDChat *)self groupPhotoGuid];
      *(_DWORD *)buf = 138412290;
      id v29 = v20;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Transfer not found for group photo guid %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (([v9 isFinished] & 1) == 0)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMCloudKitChatSyncErrorDomain" code:2 userInfo:0];
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_19;
    }
    __int16 v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = [(IMDChat *)self groupPhotoGuid];
      *(_DWORD *)buf = 138412290;
      id v29 = v21;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Transfer not finished for group photo guid %@", buf, 0xCu);
    }
LABEL_18:

LABEL_19:
    BOOL v17 = 0;
    goto LABEL_20;
  }
  BOOL v11 = [v9 localURL];
  id v27 = 0;
  char v12 = [v11 checkResourceIsReachableAndReturnError:&v27];
  id v13 = v27;

  if (v12)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F19E50]);
    long long v15 = [v9 localURL];
    long long v16 = (void *)[v14 initWithFileURL:v15];

    BOOL v17 = v16 != 0;
    if (v16)
    {
      [v6 _setCKRecordAsset:v16 forKey:@"gp"];
      long long v18 = [(IMDChat *)self groupPhotoGuid];
      [v6 _setCKRecordString:v18 forKey:@"gpid"];
    }
    else
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMCloudKitChatSyncErrorDomain" code:4 userInfo:0];
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = [v9 localURL];
          *(_DWORD *)buf = 138412290;
          id v29 = v26;
          _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "ckAsset not able to initialize from transfer file URL: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMCloudKitChatSyncErrorDomain" code:3 userInfo:0];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = [v9 localURL];
        *(_DWORD *)buf = 138412546;
        id v29 = v24;
        __int16 v30 = 2112;
        id v31 = v13;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Resource not reachable for %@ with error %@", buf, 0x16u);
      }
    }
    BOOL v17 = 0;
  }

LABEL_20:
  return v17;
}

- (id)copyCKRecordRepresentationWithZoneID:(id)a3 salt:(id)a4 error:(id *)a5
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(IMDChat *)self _copyCKRecordFromExistingCKMetadataWithZoneID:v8 salt:v9];
  if (v10) {
    goto LABEL_4;
  }
  if ([v9 length])
  {
    BOOL v11 = [(IMDChat *)self guid];
    char v12 = +[CKRecordUtilities recordIDUsingSalt:v9 zoneID:v8 guid:v11];

    id v13 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    id v14 = +[IMDChat _recordType];
    id v10 = (id)[v13 initWithRecordType:v14 recordID:v12];

LABEL_4:
    long long v15 = [(IMDChat *)self chatIdentifier];
    [v10 _setCKRecordString:v15 forKey:@"cid"];

    long long v16 = [(IMDChat *)self guid];
    [v10 _setCKRecordString:v16 forKey:@"guid"];

    BOOL v17 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[IMDChat style](self, "style"));
    [v10 _setCKRecordNumber:v17 forKey:@"stl"];

    long long v18 = [(IMDChat *)self serviceName];
    [v10 _setCKRecordString:v18 forKey:@"svc"];

    __int16 v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMDChat state](self, "state"));
    [v10 _setCKRecordNumber:v19 forKey:@"ste"];

    long long v20 = [(IMDChat *)self groupID];
    [v10 _setCKRecordString:v20 forKey:@"gid"];

    __int16 v21 = [(IMDChat *)self originalGroupID];
    [v10 _setCKRecordString:v21 forKey:@"ogid"];

    long long v22 = [(IMDChat *)self displayName];
    [v10 _setCKRecordString:v22 forKey:@"name"];

    uint64_t v23 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IMDChat isFiltered](self, "isFiltered"));
    [v10 _setCKRecordNumber:v23 forKey:@"filt"];

    uint64_t v24 = [(IMDChat *)self lastAddressedLocalHandle];
    [v10 _setCKRecordString:v24 forKey:@"lah"];

    uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[IMDChat hasHadSuccessfulQuery](self, "hasHadSuccessfulQuery"));
    [v10 _setCKRecordNumber:v25 forKey:@"sqry"];

    uint64_t v26 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IMDChat lastReadMessageTimeStamp](self, "lastReadMessageTimeStamp"));
    [v10 _setCKRecordNumber:v26 forKey:@"rwm"];

    id v27 = [(IMDChat *)self participants];
    long long v28 = objc_msgSend(v27, "__imArrayByApplyingBlock:", &unk_1F33922C0);

    [v10 _setCKRecordArray:v28 forKey:@"ptcpts"];
    id v29 = [(IMDChat *)self groupPhotoGuid];
    char IsEmpty = IMStringIsEmpty();

    if ((IsEmpty & 1) != 0
      || [(IMDChat *)self _addGroupPhotoToCKRecord:v10 error:a5])
    {
      id v31 = [(IMDChat *)self properties];
      uint64_t v32 = JWEncodeDictionary();
      [v10 _setCKRecordData:v32 forKey:@"prop"];

      long long v33 = [(IMDChat *)self autoDonationBehaviorLastModificationDate];

      if (v33)
      {
        v50[0] = @"st";
        long long v34 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMDChat autoDonationBehavior](self, "autoDonationBehavior"));
        v50[1] = @"sd";
        v51[0] = v34;
        id v35 = NSNumber;
        long long v36 = [(IMDChat *)self autoDonationBehaviorLastModificationDate];
        long long v37 = objc_msgSend(v35, "numberWithLongLong:", objc_msgSend(v36, "__im_nanosecondTimeInterval"));
        v51[1] = v37;
        long long v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
      }
      else
      {
        uint64_t v48 = @"st";
        long long v34 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMDChat autoDonationBehavior](self, "autoDonationBehavior"));
        id v49 = v34;
        long long v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      }

      if (IMOSLoggingEnabled())
      {
        long long v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          int v46 = 138412290;
          uint64_t v47 = v38;
          _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Syncing new syndication attributes up %@", (uint8_t *)&v46, 0xCu);
        }
      }
      long long v40 = JWEncodeDictionary();
      [v10 _setCKRecordData:v40 forKey:@"prop001"];

      long long v41 = [(IMDChat *)self compressedProtobufDataForChatProto1];
      [v10 _setCKRecordData:v41 forKey:@"proto001"];

      id v42 = v10;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          LOWORD(v46) = 0;
          _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "Couldn't add group photo to CKRecord. Returning nil.", (uint8_t *)&v46, 2u);
        }
      }
      id v42 = 0;
    }

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v45 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      LOWORD(v46) = 0;
      _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, "*********Cannot create record without a salt", (uint8_t *)&v46, 2u);
    }
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"IMCloudKitChatSyncErrorDomain" code:0 userInfo:0];
    id v42 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v42 = 0;
  }
LABEL_20:

  return v42;
}

+ (IMDChat)chatWithSyncData:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3
    && ([v3 sourceRecordType],
        id v5 = objc_claimAutoreleasedReturnValue(),
        +[IMDChat _recordType],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    __int16 v78 = [v4 stringForKey:@"svc"];
    __int16 v82 = [v4 stringForKey:@"guid"];
    __int16 v80 = [v4 stringForKey:@"gid"];
    uint64_t v84 = [v4 stringForKey:@"cid"];
    id v79 = [v4 stringForKey:@"ogid"];
    id v81 = [v4 arrayForKey:@"ptcpts"];
    uint64_t v77 = objc_msgSend(v81, "__imArrayByApplyingBlock:", &unk_1F33922E0);
    v86 = [v4 stringForKey:@"name"];
    id v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v9 = [v86 stringByTrimmingCharactersInSet:v8];
    uint64_t v10 = [v9 length];

    if (!v10)
    {

      v86 = 0;
    }
    __int16 v76 = [v4 stringForKey:@"lah"];
    uint64_t v75 = [v4 dictForKey:@"prop"];
    BOOL v11 = [v4 numberForKey:@"ste"];
    uint64_t v71 = [v11 integerValue];

    char v12 = [v4 numberForKey:@"stl"];
    char v13 = [v12 integerValue];

    id v14 = [v4 numberForKey:@"filt"];
    unsigned int v15 = [v14 BOOLValue];

    long long v16 = [v4 numberForKey:@"sqry"];
    char v17 = [v16 BOOLValue];

    long long v18 = [v4 numberForKey:@"rwm"];
    uint64_t v19 = [v18 longLongValue];

    long long v20 = v84;
    if (v13 == 45) {
      long long v20 = 0;
    }
    id v74 = v20;
    v85 = [v4 dictForKey:@"prop001"];
    int v21 = IMOSLoggingEnabled();
    if (v85)
    {
      if (v21)
      {
        long long v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v85;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Server Chat record has props001 %@, pulling isAutoDonating and donationDate", buf, 0xCu);
        }
      }
      uint64_t v23 = [v85 objectForKey:@"st"];
      uint64_t v24 = v23;
      if (v23) {
        uint64_t v25 = (int)[v23 intValue];
      }
      else {
        uint64_t v25 = 0;
      }
      id v29 = [v85 objectForKey:@"sd"];
      __int16 v30 = v29;
      if (v29)
      {
        uint64_t v73 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v29, "longLongValue"));
      }
      else
      {
        uint64_t v73 = 0;
      }
    }
    else
    {
      if (v21)
      {
        long long v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Server Chat record had props001 data, but we failed to decode to a dictionary!", buf, 2u);
        }
      }
      uint64_t v25 = 0;
      uint64_t v73 = 0;
    }
    v83 = [v4 dataForKey:@"proto001"];
    if ([v83 length])
    {
      id v31 = objc_alloc(MEMORY[0x1E4F6E9B8]);
      uint64_t v32 = [v83 _FTOptionallyDecompressData];
      long long v33 = (void *)[v31 initWithData:v32];

      unsigned __int8 v34 = [v33 isRecovered];
    }
    else
    {
      unsigned __int8 v34 = 0;
    }
    id v35 = [IMDChat alloc];
    long long v36 = [v4 sourceRecordChangeTag];
    long long v37 = [v4 sourceRecordName];
    LOWORD(v69) = v34;
    LOBYTE(v68) = 0;
    LOBYTE(v67) = v17;
    LOBYTE(v66) = v13;
    id v27 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v35, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", &stru_1F3398578, v78, v82, v80, v84, v77, v74, v86, v76, 0, v75, v71, v66, v15,
            v67,
            0,
            v36,
            1,
            v79,
            v19,
            -1,
            v37,
            v68,
            v25,
            v73,
            v69);

    long long v38 = [v4 assetURLForKey:@"gp"];
    long long v39 = [v4 stringForKey:@"gpid"];
    long long v40 = v39;
    if (v38 && [v39 length])
    {
      if (IMOSLoggingEnabled())
      {
        long long v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "Group photo exists, setting up transfer", buf, 2u);
        }
      }
      id v42 = (void *)IMDCopyAttachmentPersistentPath();
      if ([v42 length])
      {
        long long v43 = [v42 stringByDeletingLastPathComponent];
        IMSharedHelperEnsureDirectoryExistsAtPath();

        __int16 v44 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v45 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v42];
        id v88 = 0;
        char v46 = [v44 moveItemAtURL:v38 toURL:v45 error:&v88];
        id v72 = v88;

        if (v46)
        {
          uint64_t v47 = +[IMDFileTransferCenter sharedInstance];
          uint64_t v48 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v42];
          int v49 = [v47 registerGUID:v40 forNewOutgoingTransferWithLocalURL:v48];

          if (v49)
          {
            if (IMOSLoggingEnabled())
            {
              v50 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v94 = v82;
                __int16 v95 = 2112;
                id v96 = v42;
                _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "Created transfer %@, finalAssetPath %@", buf, 0x16u);
              }
            }
            v51 = +[IMDFileTransferCenter sharedInstance];
            id v70 = [v51 transferForGUID:v40];

            if (IMOSLoggingEnabled())
            {
              id v52 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v94 = v70;
                _os_log_impl(&dword_1D967A000, v52, OS_LOG_TYPE_INFO, "Found transfer: %@", buf, 0xCu);
              }
            }
            [v70 setCloudKitSyncState:1];
            v53 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v91 = *MEMORY[0x1E4F28370];
            uint64_t v92 = *MEMORY[0x1E4F28358];
            v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
            id v87 = 0;
            char v55 = [v53 setAttributes:v54 ofItemAtPath:v42 error:&v87];
            id v56 = v87;

            if ((v55 & 1) == 0 && IMOSLoggingEnabled())
            {
              id v57 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v94 = v42;
                __int16 v95 = 2112;
                id v96 = v56;
                _os_log_impl(&dword_1D967A000, v57, OS_LOG_TYPE_INFO, "Failed making group photo file class C: %@ with error %@", buf, 0x16u);
              }
            }
            id v58 = +[IMDAttachmentStore sharedInstance];
            int v59 = [v58 storeAttachment:v70 associateWithMessageWithGUID:0 chatGUID:v82 storeAtExternalLocation:1];

            if (v59)
            {
              uint64_t v89 = *MEMORY[0x1E4F6CD48];
              v90 = v40;
              id v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
              [(IMDChat *)v27 updateProperties:v60];

              id v61 = +[IMDFileTransferCenter sharedInstance];
              [v61 updateTransfer:v40];

              if (IMOSLoggingEnabled())
              {
                id v62 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v94 = v82;
                  __int16 v95 = 2112;
                  id v96 = v70;
                  _os_log_impl(&dword_1D967A000, v62, OS_LOG_TYPE_INFO, "Group photo stored for chat guid %@ with transfer %@", buf, 0x16u);
                }
              }
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            id v64 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v94 = v38;
              __int16 v95 = 2112;
              id v96 = v42;
              __int16 v97 = 2112;
              id v98 = v72;
              _os_log_impl(&dword_1D967A000, v64, OS_LOG_TYPE_INFO, "Failed to move group photo file from %@ to %@, error %@", buf, 0x20u);
            }
          }
          [MEMORY[0x1E4F6E780] cleanUpAssetURL:v38];
        }
      }
      else if (IMOSLoggingEnabled())
      {
        id v63 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v94 = v82;
          __int16 v95 = 2112;
          id v96 = v38;
          __int16 v97 = 2112;
          id v98 = v42;
          _os_log_impl(&dword_1D967A000, v63, OS_LOG_TYPE_INFO, "Failed to write asset to disk because of nil path! Asset from ckrecord with guid %@ has path %@, finalAssetPath %@", buf, 0x20u);
        }
      }
    }
    [MEMORY[0x1E4F6E780] cleanUpAssetURL:v38];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v94 = v4;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Invalid record passed to chatWithCKRecord %@", buf, 0xCu);
      }
    }
    id v27 = 0;
  }

  return v27;
}

- (BOOL)applyChangesUsingSyncData:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(IMDChat *)self cloudKitSyncState];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = [(IMDChat *)self guid];
      int v37 = 138412546;
      int64_t v38 = (int64_t)v7;
      __int16 v39 = 2048;
      *(void *)long long v40 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "applying changes on chat %@ state %ld", (uint8_t *)&v37, 0x16u);
    }
  }
  uint64_t v8 = [(IMDChat *)self lastReadMessageTimeStamp];
  id v9 = [v4 numberForKey:@"rwm"];
  LODWORD(v8) = v8 < [v9 longLongValue];

  if (v8)
  {
    uint64_t v10 = [v4 numberForKey:@"rwm"];
    -[IMDChat setLastReadMessageTimeStamp:](self, "setLastReadMessageTimeStamp:", [v10 longLongValue]);

    int v11 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      char v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int64_t v13 = [(IMDChat *)self lastReadMessageTimeStamp];
        id v14 = [v4 numberForKey:@"rwm"];
        int v37 = 134218242;
        int64_t v38 = v13;
        __int16 v39 = 2112;
        *(void *)long long v40 = v14;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Local last read timestamp %lld, server record last read timestamp %@", (uint8_t *)&v37, 0x16u);
      }
    }
    int v11 = 0;
  }
  unsigned int v15 = [v4 dictForKey:@"prop001"];
  int v16 = IMOSLoggingEnabled();
  if (v15)
  {
    if (v16)
    {
      char v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v37 = 138412290;
        int64_t v38 = (int64_t)v15;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Server Chat record has props001 %@, pulling syndication_type and syndication_ranges", (uint8_t *)&v37, 0xCu);
      }
    }
    long long v18 = [v15 objectForKey:@"st"];
    uint64_t v19 = v18;
    if (v18) {
      [v18 intValue];
    }
    long long v20 = [v15 objectForKey:@"sd"];
    if (IMOSLoggingEnabled())
    {
      int v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        long long v22 = [(IMDChat *)self autoDonationBehaviorLastModificationDate];
        uint64_t v23 = objc_msgSend(v22, "__im_nanosecondTimeInterval");
        int v37 = 138412546;
        int64_t v38 = (int64_t)v15;
        __int16 v39 = 2048;
        *(void *)long long v40 = v23;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Server Chat record has older props001 %@, local syndicationDate: %lu, skipping", (uint8_t *)&v37, 0x16u);
      }
    }
  }
  else if (v16)
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Server Chat record had props001 data, but we failed to decode to a dictionary!", (uint8_t *)&v37, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [(IMDChat *)self guid];
      int v37 = 138412802;
      int64_t v38 = (int64_t)v26;
      __int16 v39 = 1024;
      *(_DWORD *)long long v40 = v11;
      *(_WORD *)&v40[4] = 2112;
      *(void *)&v40[6] = @"YES";
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Updating chat:%@ madeChanges %d serverHadMoreRecentData %@", (uint8_t *)&v37, 0x1Cu);
    }
  }
  if (v5 != 1)
  {
    [(IMDChat *)self setCloudKitSyncState:1];
    int v11 = 1;
  }
  if (IMOSLoggingEnabled())
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = [(IMDChat *)self guid];
      id v29 = [v4 sourceRecordName];
      __int16 v30 = [v4 sourceRecordChangeTag];
      int v37 = 138412802;
      int64_t v38 = (int64_t)v28;
      __int16 v39 = 2112;
      *(void *)long long v40 = v29;
      *(_WORD *)&v40[8] = 2112;
      *(void *)&v40[10] = v30;
      _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Updating chat %@ record name %@ change tag %@", (uint8_t *)&v37, 0x20u);
    }
  }
  id v31 = [v4 sourceRecordChangeTag];
  [(IMDChat *)self setServerChangeToken:v31];

  uint64_t v32 = [v4 sourceRecordName];
  [(IMDChat *)self setCloudKitRecordID:v32];

  long long v33 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v34 = [v33 isMessagesIniCloudVersion2];

  if (v34)
  {
    id v35 = +[IMDChatStore sharedInstance];
    [v35 storeChat:self];
  }
  else
  {
    [(IMDChat *)self storeAndBroadcastChatChanges];
  }

  return v11 != 0;
}

- (id)compressedProtobufDataForChatProto1
{
  id v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v3, "setIsRecovered:", -[IMDChat isRecovered](self, "isRecovered"));
  id v4 = [v3 data];
  int64_t v5 = (void *)[v4 _FTCopyGzippedData];

  return v5;
}

@end