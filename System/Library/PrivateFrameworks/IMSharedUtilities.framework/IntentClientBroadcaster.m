@interface IntentClientBroadcaster
- (_TtC17IMSharedUtilities23IntentClientBroadcaster)init;
- (void)_automation_markAsReadQuery:(id)a3 finishedWithResult:(BOOL)a4;
- (void)account:(id)a3 allowListChanged:(id)a4;
- (void)account:(id)a3 avAction:(unsigned int)a4 withArguments:(id)a5 toAVChat:(id)a6 isVideo:(BOOL)a7;
- (void)account:(id)a3 blockIdleStatusChanged:(BOOL)a4;
- (void)account:(id)a3 blockListChanged:(id)a4;
- (void)account:(id)a3 blockingModeChanged:(unsigned int)a4;
- (void)account:(id)a3 buddyPictureChanged:(id)a4 imageData:(id)a5 imageHash:(id)a6;
- (void)account:(id)a3 buddyProperties:(id)a4 buddyPictures:(id)a5;
- (void)account:(id)a3 buddyPropertiesChanged:(id)a4;
- (void)account:(id)a3 capabilitiesChanged:(unint64_t)a4;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 chatPersonCentricID:(id)a7 member:(id)a8 statusChanged:(int)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 error:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 initialEmergencyQuestionnaireReceived:(id)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageReceived:(id)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageSent:(id)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messagesReceived:(id)a9 removed:(id)a10 messagesComingFromStorage:(BOOL)a11;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 statusChanged:(int)a9 handleInfo:(id)a10;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 invitationReceived:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 notifySentMessage:(id)a7 sendTime:(id)a8 isReplicating:(BOOL)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 updateProperties:(id)a7;
- (void)account:(id)a3 conference:(id)a4 changedToNewConferenceID:(id)a5;
- (void)account:(id)a3 conference:(id)a4 invitationSentSuccessfully:(BOOL)a5;
- (void)account:(id)a3 conference:(id)a4 peerID:(id)a5 propertiesUpdated:(id)a6;
- (void)account:(id)a3 conference:(id)a4 peerIDChangedFromID:(id)a5 toID:(id)a6;
- (void)account:(id)a3 conference:(id)a4 receivedAVMessage:(unsigned int)a5 from:(id)a6 sessionID:(unsigned int)a7 userInfo:(id)a8;
- (void)account:(id)a3 conference:(id)a4 receivedCancelInvitationFrom:(id)a5 properties:(id)a6;
- (void)account:(id)a3 conference:(id)a4 receivedCounterProposalFrom:(id)a5 properties:(id)a6;
- (void)account:(id)a3 conference:(id)a4 receivedInvitationFrom:(id)a5 properties:(id)a6;
- (void)account:(id)a3 conference:(id)a4 receivedResponseToInvitationFrom:(id)a5 properties:(id)a6;
- (void)account:(id)a3 conference:(id)a4 receivedUpdateFrom:(id)a5 data:(id)a6;
- (void)account:(id)a3 defaults:(id)a4 blockList:(id)a5 allowList:(id)a6 blockingMode:(unsigned int)a7 blockIdleStatus:(BOOL)a8 status:(id)a9 capabilities:(unint64_t)a10 serviceLoginStatus:(unint64_t)a11 loginStatusMessage:(id)a12;
- (void)account:(id)a3 defaultsChanged:(id)a4;
- (void)account:(id)a3 groupsChanged:(id)a4 error:(id)a5;
- (void)account:(id)a3 handleID:(id)a4 updatedLastReceivedOnGridMessageDate:(id)a5;
- (void)account:(id)a3 handleSubscriptionRequestFrom:(id)a4 withMessage:(id)a5;
- (void)account:(id)a3 loginStatusChanged:(unint64_t)a4 message:(id)a5 reason:(int)a6 properties:(id)a7;
- (void)account:(id)a3 postedError:(id)a4;
- (void)account:(id)a3 relay:(id)a4 handleCancel:(id)a5 fromPerson:(id)a6;
- (void)account:(id)a3 relay:(id)a4 handleInitate:(id)a5 fromPerson:(id)a6;
- (void)account:(id)a3 relay:(id)a4 handleUpdate:(id)a5 fromPerson:(id)a6;
- (void)account:(id)a3 statusChanged:(id)a4;
- (void)accountAdded:(id)a3 defaults:(id)a4 service:(id)a5;
- (void)accountRemoved:(id)a3;
- (void)activeAccountsChanged:(id)a3 forService:(id)a4;
- (void)attachmentQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6;
- (void)blackholedChatsExist:(BOOL)a3;
- (void)capabilitiesUpdatedForHandle:(id)a3;
- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5;
- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5 sender:(id)a6;
- (void)chat:(id)a3 engramIDUpdated:(id)a4;
- (void)chat:(id)a3 isDeletingIncomingMessagesUpdated:(BOOL)a4;
- (void)chat:(id)a3 isFilteredUpdated:(int64_t)a4;
- (void)chat:(id)a3 isRecoveredUpdated:(BOOL)a4;
- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4;
- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4 lastAddressedSIMIDUpdated:(id)a5;
- (void)chat:(id)a3 lastAddressedSIMIDUpdated:(id)a4;
- (void)chat:(id)a3 lastMessageTimeStampOnLoadUpdated:(double)a4;
- (void)chat:(id)a3 nicknamesUpdated:(id)a4;
- (void)chat:(id)a3 propertiesUpdated:(id)a4;
- (void)chat:(id)a3 uncachedAttachmentCountUpdated:(id)a4;
- (void)chat:(id)a3 updated:(id)a4;
- (void)chatLoadedWithChatIdentifier:(id)a3 chats:(id)a4;
- (void)chatsNeedRemerging:(id)a3 groupedChats:(id)a4;
- (void)collaborationNoticesDidChangeForChatGUIDs:(id)a3;
- (void)databaseChatSpamUpdated:(id)a3;
- (void)databaseUpdated;
- (void)databaseUpdated:(id)a3;
- (void)defaultsChanged:(id)a3 forService:(id)a4;
- (void)didAttemptToDisableAllDevicesResult:(BOOL)a3;
- (void)didAttemptToDisableiCloudBackups:(int64_t)a3 error:(id)a4;
- (void)didAttemptToSetEnabledTo:(BOOL)a3 result:(BOOL)a4;
- (void)didFetchCloudKitSyncDebuggingInfo:(id)a3;
- (void)didFetchRampState:(id)a3;
- (void)didFetchSyncStateStats:(id)a3;
- (void)didPerformAdditionalStorageRequiredCheckWithSuccess:(BOOL)a3 additionalStorageRequired:(unint64_t)a4 forAccountId:(id)a5 error:(id)a6;
- (void)didReceiveCollaborationMessage:(id)a3 inChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)didUpdateSettingsKeys:(id)a3;
- (void)displayPinCodeForAccount:(id)a3 pinCode:(id)a4 deviceName:(id)a5 deviceType:(id)a6 phoneNumber:(id)a7;
- (void)downloadedPurgedAssetBatchForChatIDs:(id)a3 completedTransferGUIDs:(id)a4;
- (void)engroupParticipantsUpdatedForChat:(id)a3;
- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4;
- (void)fileTransfer:(id)a3 explicitDownloadSucceededWithPath:(id)a4 livePhotoBundlePath:(id)a5;
- (void)fileTransfer:(id)a3 highQualityDownloadSucceededWithPath:(id)a4;
- (void)fileTransfer:(id)a3 updatedWithCurrentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5 averageTransferRate:(unint64_t)a6;
- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4;
- (void)fileTransferDownloadFailedWithLocalURL:(id)a3 error:(id)a4;
- (void)fileTransferDownloadedSucceededWithLocalURL:(id)a3;
- (void)fileTransferExplicitDownloadFailed:(id)a3 suggestedRetryGUID:(id)a4 error:(id)a5;
- (void)fileTransferFinishedRemoteIntentDownload:(id)a3;
- (void)fileTransferHighQualityDownloadFailed:(id)a3;
- (void)fileTransfers:(id)a3 createdWithLocalPaths:(id)a4;
- (void)finishedDownloadingPurgedAssetsForChatIDs:(id)a3;
- (void)forcedReloadingChatRegistryWithQueryID:(id)a3;
- (void)frequentRepliesQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7;
- (void)groupPhotoUpdatedForChatIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5 userInfo:(id)a6;
- (void)historicalMessageGUIDsDeleted:(id)a3 chatGUIDs:(id)a4 queryID:(id)a5;
- (void)historyQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7;
- (void)isDownloadingQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(BOOL)a6;
- (void)itemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5;
- (void)keyTransparencyOptInStateChanged:(BOOL)a3;
- (void)lastFailedMessageDateChanged:(int64_t)a3;
- (void)leftChat:(id)a3;
- (void)loadedChats:(id)a3;
- (void)loadedChats:(id)a3 queryID:(id)a4;
- (void)loadedRecoverableMessagesMetadata:(id)a3 queryID:(id)a4;
- (void)markAsSpamQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6;
- (void)markedAsReadForMessageGUID:(id)a3 success:(BOOL)a4 queryID:(id)a5;
- (void)messageItemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5;
- (void)messageQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5;
- (void)movedMessagesToRecentlyDeletedForChatsWithGUIDs:(id)a3 queryID:(id)a4 deletionDate:(id)a5;
- (void)movedMessagesToRecentlyDeletedWithQueryID:(id)a3;
- (void)networkDataAvailabilityChanged:(BOOL)a3;
- (void)newSetupInfoAvailable;
- (void)nicknameRequestResponse:(id)a3 encodedNicknameData:(id)a4;
- (void)oneTimeCodesDidChange:(id)a3;
- (void)pagedHistoryQuery:(id)a3 chatID:(id)a4 services:(id)a5 numberOfMessagesBefore:(int64_t)a6 numberOfMessagesAfter:(int64_t)a7 finishedWithResult:(id)a8 hasMessagesBefore:(BOOL)a9 hasMessagesAfter:(BOOL)a10;
- (void)pendingACRequestComplete;
- (void)pendingVCRequestComplete;
- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3;
- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3 queryID:(id)a4;
- (void)permanentlyDeletedRecoverableMessagesForChatsWithGUIDs:(id)a3 deletedChatGUIDs:(id)a4;
- (void)persistentProperty:(id)a3 changedTo:(id)a4 from:(id)a5;
- (void)pinCodeAlertCompleted:(id)a3 deviceName:(id)a4 deviceType:(id)a5 phoneNumber:(id)a6 responseFromDevice:(BOOL)a7 wasCancelled:(BOOL)a8;
- (void)previouslyBlackholedChatLoadedWithChatIdentifier:(id)a3 chats:(id)a4;
- (void)previouslyBlackholedChatLoadedWithHandleIDs:(id)a3 chat:(id)a4;
- (void)property:(id)a3 changedTo:(id)a4 from:(id)a5;
- (void)qosClassWhileServicingRequestsResponse:(unsigned int)a3 identifier:(id)a4;
- (void)receivedUrgentRequestForMessages:(id)a3;
- (void)recoveredMessagesFromRecentlyDeletedForChatsWithGUIDs:(id)a3;
- (void)recoveredMessagesWithChatGUIDs:(id)a3 queryID:(id)a4;
- (void)refreshStatusForKTPeerURI:(id)a3;
- (void)screenTimeEnablementChanged:(BOOL)a3;
- (void)service:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 messagesUpdated:(id)a6;
- (void)serviceSwitchRequestReceivedForChatWithIdentifier:(id)a3;
- (void)setupComplete;
- (void)setupComplete:(BOOL)a3 info:(id)a4;
- (void)showForgotPasswordNotificationForAccount:(id)a3;
- (void)showInvalidCertNotificationForAccount:(id)a3;
- (void)simSubscriptionsDidChange;
- (void)stickerPackRemoved:(id)a3;
- (void)stickerPackUpdated:(id)a3;
- (void)uncachedAttachmentCountQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6;
- (void)unreadCountChanged:(int64_t)a3;
- (void)updateActiveNicknameRecords:(id)a3;
- (void)updateCloudKitProgressWithDictionary:(id)a3;
- (void)updateCloudKitState;
- (void)updateCloudKitStateWithDictionary:(id)a3;
- (void)updateIgnoredNicknameRecords:(id)a3;
- (void)updateNicknameData:(id)a3;
- (void)updateNicknameHandlesForSharing:(id)a3 blocked:(id)a4;
- (void)updatePendingNicknameUpdates:(id)a3 handledNicknames:(id)a4 archivedNicknames:(id)a5;
- (void)updatePersonalNickname:(id)a3;
- (void)updateTransitionedNicknameHandles:(id)a3;
- (void)updateUnknownSenderRecords:(id)a3;
- (void)updatedSummariesForChatsWithGUIDsAndProperties:(id)a3;
- (void)vcCapabilitiesChanged:(unint64_t)a3;
@end

@implementation IntentClientBroadcaster

- (void)fileTransfer:(id)a3 highQualityDownloadSucceededWithPath:(id)a4
{
  v4 = self;
  sub_1A08C34A0(0xD000000000000035, 0x80000001A0A32280);
}

- (void)fileTransfer:(id)a3 explicitDownloadSucceededWithPath:(id)a4 livePhotoBundlePath:(id)a5
{
  uint64_t v6 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1A09F3E18();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1A09F3E18();
  uint64_t v14 = v13;
  uint64_t v15 = sub_1A09F3E18();
  uint64_t v17 = v16;
  uint64_t v18 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v9;
  v19[6] = v11;
  v19[7] = v12;
  v19[8] = v14;
  v19[9] = v15;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1A08BE6E4((uint64_t)v8, (uint64_t)&unk_1E94FAD88, (uint64_t)v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fileTransferExplicitDownloadFailed:(id)a3 suggestedRetryGUID:(id)a4 error:(id)a5
{
  if (a4) {
    sub_1A09F3E18();
  }
  id v8 = a5;
  uint64_t v7 = self;
  sub_1A08C34A0(0xD00000000000003FLL, 0x80000001A0A322C0);

  swift_bridgeObjectRelease();
}

- (void)fileTransferHighQualityDownloadFailed:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000029, 0x80000001A0A32300);
}

- (void)fileTransferDownloadedSucceededWithLocalURL:(id)a3
{
  uint64_t v4 = sub_1A09F33A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A09F3358();
  id v8 = self;
  sub_1A08C34A0(0xD00000000000002ELL, 0x80000001A0A32330);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)fileTransferDownloadFailedWithLocalURL:(id)a3 error:(id)a4
{
  uint64_t v6 = sub_1A09F33A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A09F3358();
  id v10 = a4;
  uint64_t v11 = self;
  sub_1A08C34A0(0xD00000000000002FLL, 0x80000001A0A32360);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateNicknameHandlesForSharing:(id)a3 blocked:(id)a4
{
  uint64_t v5 = sub_1A09F42B8();
  uint64_t v6 = sub_1A09F42B8();
  uint64_t v7 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC21updateNicknameHandles10forSharing7blockedyShySSG_AGtF_0(v5, v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updatePendingNicknameUpdates:(id)a3 handledNicknames:(id)a4 archivedNicknames:(id)a5
{
  uint64_t v6 = sub_1A09F3D08();
  uint64_t v7 = sub_1A09F3D08();
  uint64_t v8 = sub_1A09F3D08();
  uint64_t v9 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC28updatePendingNicknameUpdates_16handledNicknames08archivedK0ySDys11AnyHashableVypG_A2ItF_0(v6, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)unreadCountChanged:(int64_t)a3
{
}

- (void)lastFailedMessageDateChanged:(int64_t)a3
{
}

- (void)pendingVCRequestComplete
{
  v2 = self;
  sub_1A08C34A0(0xD00000000000001ALL, 0x80000001A0A324F0);
}

- (void)pendingACRequestComplete
{
  v2 = self;
  sub_1A08C34A0(0xD00000000000001ALL, 0x80000001A0A32510);
}

- (void)vcCapabilitiesChanged:(unint64_t)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000019, 0x80000001A0A32530);
}

- (void)updateCloudKitState
{
  v2 = self;
  sub_1A08C34A0(0xD000000000000015, 0x80000001A0A32550);
}

- (void)didAttemptToSetEnabledTo:(BOOL)a3 result:(BOOL)a4
{
  uint64_t v4 = self;
  sub_1A08C34A0(0xD000000000000022, 0x80000001A0A32570);
}

- (void)didPerformAdditionalStorageRequiredCheckWithSuccess:(BOOL)a3 additionalStorageRequired:(unint64_t)a4 forAccountId:(id)a5 error:(id)a6
{
  if (a5) {
    sub_1A09F3E18();
  }
  id v9 = a6;
  uint64_t v8 = self;
  sub_1A08C34A0(0xD000000000000063, 0x80000001A0A325A0);

  swift_bridgeObjectRelease();
}

- (void)didAttemptToDisableAllDevicesResult:(BOOL)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000026, 0x80000001A0A32610);
}

- (void)nicknameRequestResponse:(id)a3 encodedNicknameData:(id)a4
{
  uint64_t v4 = a4;
  if (a4)
  {
    uint64_t v5 = self;
    id v6 = v4;
    uint64_t v4 = (void *)sub_1A09F33E8();
    unint64_t v8 = v7;
  }
  else
  {
    id v9 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  sub_1A08C34A0(0xD00000000000002FLL, 0x80000001A0A32640);
  sub_1A08AF2D0((uint64_t)v4, v8);
}

- (void)updateTransitionedNicknameHandles:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000025, 0x80000001A0A32670);
}

- (void)updateActiveNicknameRecords:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000001FLL, 0x80000001A0A326A0);
}

- (void)updateIgnoredNicknameRecords:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000020, 0x80000001A0A326C0);
}

- (void)updateUnknownSenderRecords:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000001ELL, 0x80000001A0A326F0);
}

- (void)updatePersonalNickname:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A08C34A0(0xD00000000000001ALL, 0x80000001A0A32710);
}

- (void)simSubscriptionsDidChange
{
  v2 = self;
  sub_1A08C34A0(0xD00000000000001BLL, 0x80000001A0A32730);
}

- (void)newSetupInfoAvailable
{
  v2 = self;
  sub_1A08C34A0(0xD000000000000017, 0x80000001A0A32750);
}

- (void)networkDataAvailabilityChanged:(BOOL)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000022, 0x80000001A0A32770);
}

- (void)property:(id)a3 changedTo:(id)a4 from:(id)a5
{
}

- (void)persistentProperty:(id)a3 changedTo:(id)a4 from:(id)a5
{
}

- (void)stickerPackUpdated:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000016, 0x80000001A0A327F0);
}

- (void)stickerPackRemoved:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000016, 0x80000001A0A32810);
}

- (void)oneTimeCodesDidChange:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000019, 0x80000001A0A32830);
}

- (void)didFetchSyncStateStats:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000001ALL, 0x80000001A0A32850);
}

- (void)didFetchRampState:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000015, 0x80000001A0A32870);
}

- (void)didAttemptToDisableiCloudBackups:(int64_t)a3 error:(id)a4
{
  uint64_t v5 = self;
  id v6 = a4;
  sub_1A08C34A0(0xD000000000000029, 0x80000001A0A32890);
}

- (void)didFetchCloudKitSyncDebuggingInfo:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000025, 0x80000001A0A328C0);
}

- (void)account:(id)a3 conference:(id)a4 receivedInvitationFrom:(id)a5 properties:(id)a6
{
  id v6 = self;
  sub_1A08C34A0(0xD000000000000038, 0x80000001A0A328F0);
}

- (void)account:(id)a3 conference:(id)a4 receivedResponseToInvitationFrom:(id)a5 properties:(id)a6
{
  id v6 = self;
  sub_1A08C34A0(0xD000000000000042, 0x80000001A0A32930);
}

- (void)account:(id)a3 conference:(id)a4 receivedCancelInvitationFrom:(id)a5 properties:(id)a6
{
  id v6 = self;
  sub_1A08C34A0(0xD00000000000003ELL, 0x80000001A0A32980);
}

- (void)account:(id)a3 conference:(id)a4 receivedCounterProposalFrom:(id)a5 properties:(id)a6
{
  id v6 = self;
  sub_1A08C34A0(0xD00000000000003DLL, 0x80000001A0A329C0);
}

- (void)account:(id)a3 conference:(id)a4 receivedUpdateFrom:(id)a5 data:(id)a6
{
  id v7 = a6;
  uint64_t v11 = self;
  uint64_t v8 = sub_1A09F33E8();
  unint64_t v10 = v9;

  sub_1A08C34A0(0xD00000000000002ELL, 0x80000001A0A32A00);
  sub_1A08AF2E4(v8, v10);
}

- (void)account:(id)a3 conference:(id)a4 receivedAVMessage:(unsigned int)a5 from:(id)a6 sessionID:(unsigned int)a7 userInfo:(id)a8
{
  if (a8) {
    sub_1A09F3D08();
  }
  unint64_t v9 = self;
  sub_1A08C34A0(0xD000000000000040, 0x80000001A0A32A30);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 conference:(id)a4 changedToNewConferenceID:(id)a5
{
  uint64_t v5 = self;
  sub_1A08C34A0(0xD00000000000002FLL, 0x80000001A0A32A80);
}

- (void)account:(id)a3 conference:(id)a4 peerIDChangedFromID:(id)a5 toID:(id)a6
{
  id v6 = self;
  sub_1A08C34A0(0xD00000000000002FLL, 0x80000001A0A32AB0);
}

- (void)account:(id)a3 conference:(id)a4 peerID:(id)a5 propertiesUpdated:(id)a6
{
  if (a5) {
    sub_1A09F3E18();
  }
  id v7 = self;
  sub_1A08C34A0(0xD00000000000002FLL, 0x80000001A0A32AE0);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 conference:(id)a4 invitationSentSuccessfully:(BOOL)a5
{
  uint64_t v5 = self;
  sub_1A08C34A0(0xD000000000000031, 0x80000001A0A32B10);
}

- (void)account:(id)a3 avAction:(unsigned int)a4 withArguments:(id)a5 toAVChat:(id)a6 isVideo:(BOOL)a7
{
  id v7 = self;
  sub_1A08C34A0(0xD000000000000033, 0x80000001A0A32B50);
}

- (void)account:(id)a3 relay:(id)a4 handleInitate:(id)a5 fromPerson:(id)a6
{
  id v6 = self;
  sub_1A08C34A0(0xD00000000000002ALL, 0x80000001A0A32B90);
}

- (void)account:(id)a3 relay:(id)a4 handleUpdate:(id)a5 fromPerson:(id)a6
{
  id v6 = self;
  sub_1A08C34A0(0xD000000000000029, 0x80000001A0A32BC0);
}

- (void)account:(id)a3 relay:(id)a4 handleCancel:(id)a5 fromPerson:(id)a6
{
  id v6 = self;
  sub_1A08C34A0(0xD000000000000029, 0x80000001A0A32BF0);
}

- (void)messageQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  id v6 = a4;
  id v7 = self;
  sub_1A08C34A0(0xD00000000000002DLL, 0x80000001A0A32C20);
}

- (void)messageItemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  id v6 = a4;
  id v7 = self;
  sub_1A08C34A0(0xD000000000000031, 0x80000001A0A32C50);
}

- (void)itemQuery:(id)a3 finishedWithResult:(id)a4 chatGUIDs:(id)a5
{
  id v6 = a4;
  id v7 = self;
  sub_1A08C34A0(0xD00000000000002ALL, 0x80000001A0A32C90);
}

- (void)historyQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7
{
}

- (void)pagedHistoryQuery:(id)a3 chatID:(id)a4 services:(id)a5 numberOfMessagesBefore:(int64_t)a6 numberOfMessagesAfter:(int64_t)a7 finishedWithResult:(id)a8 hasMessagesBefore:(BOOL)a9 hasMessagesAfter:(BOOL)a10
{
  if (a8) {
    sub_1A09F4078();
  }
  uint64_t v11 = self;
  sub_1A08C34A0(0xD000000000000088, 0x80000001A0A32D00);

  swift_bridgeObjectRelease();
}

- (void)attachmentQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  if (a6) {
    sub_1A09F4078();
  }
  id v7 = self;
  sub_1A08C34A0(0xD000000000000036, 0x80000001A0A32D90);

  swift_bridgeObjectRelease();
}

- (void)uncachedAttachmentCountQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  id v7 = a6;
  uint64_t v8 = self;
  sub_1A08C34A0(0xD000000000000043, 0x80000001A0A32DD0);
}

- (void)isDownloadingQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(BOOL)a6
{
  id v6 = self;
  sub_1A08C34A0(0xD000000000000039, 0x80000001A0A32E20);
}

- (void)markAsSpamQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  id v7 = a6;
  uint64_t v8 = self;
  sub_1A08C34A0(0xD000000000000035, 0x80000001A0A32E60);
}

- (void)frequentRepliesQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7
{
}

- (void)_automation_markAsReadQuery:(id)a3 finishedWithResult:(BOOL)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000031, 0x80000001A0A32EF0);
}

- (void)updateCloudKitStateWithDictionary:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000001ALL, 0x80000001A0A32F30);
}

- (void)updateCloudKitProgressWithDictionary:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000001DLL, 0x80000001A0A32F50);
}

- (void)receivedUrgentRequestForMessages:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000023, 0x80000001A0A32F70);
}

- (void)defaultsChanged:(id)a3 forService:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000001ELL, 0x80000001A0A32FA0);
}

- (void)showInvalidCertNotificationForAccount:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000028, 0x80000001A0A32FC0);
}

- (void)showForgotPasswordNotificationForAccount:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000002BLL, 0x80000001A0A32FF0);
}

- (void)activeAccountsChanged:(id)a3 forService:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000024, 0x80000001A0A33020);
}

- (void)account:(id)a3 defaults:(id)a4 blockList:(id)a5 allowList:(id)a6 blockingMode:(unsigned int)a7 blockIdleStatus:(BOOL)a8 status:(id)a9 capabilities:(unint64_t)a10 serviceLoginStatus:(unint64_t)a11 loginStatusMessage:(id)a12
{
  if (a9) {
    sub_1A09F3D08();
  }
  uint64_t v13 = self;
  sub_1A08C34A0(0xD00000000000007FLL, 0x80000001A0A33050);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 loginStatusChanged:(unint64_t)a4 message:(id)a5 reason:(int)a6 properties:(id)a7
{
  if (a7) {
    sub_1A09F3D08();
  }
  uint64_t v8 = self;
  sub_1A08C34A0(0xD000000000000038, 0x80000001A0A330D0);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 defaultsChanged:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000001BLL, 0x80000001A0A33110);
}

- (void)account:(id)a3 capabilitiesChanged:(unint64_t)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000001FLL, 0x80000001A0A33130);
}

- (void)accountAdded:(id)a3 defaults:(id)a4 service:(id)a5
{
  uint64_t v5 = self;
  sub_1A08C34A0(0xD000000000000021, 0x80000001A0A33150);
}

- (void)accountRemoved:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000012, 0x80000001A0A33180);
}

- (void)account:(id)a3 blockListChanged:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000001CLL, 0x80000001A0A331A0);
}

- (void)account:(id)a3 allowListChanged:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000001CLL, 0x80000001A0A331C0);
}

- (void)account:(id)a3 blockingModeChanged:(unsigned int)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000001FLL, 0x80000001A0A331E0);
}

- (void)account:(id)a3 blockIdleStatusChanged:(BOOL)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000022, 0x80000001A0A33200);
}

- (void)account:(id)a3 buddyPropertiesChanged:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000022, 0x80000001A0A33230);
}

- (void)account:(id)a3 buddyPictureChanged:(id)a4 imageData:(id)a5 imageHash:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  uint64_t v13 = self;
  uint64_t v10 = sub_1A09F33E8();
  unint64_t v12 = v11;

  sub_1A08C34A0(0xD000000000000033, 0x80000001A0A33260);
  sub_1A08AF2E4(v10, v12);
}

- (void)account:(id)a3 buddyProperties:(id)a4 buddyPictures:(id)a5
{
  uint64_t v5 = self;
  sub_1A08C34A0(0xD000000000000029, 0x80000001A0A332A0);
}

- (void)account:(id)a3 groupsChanged:(id)a4 error:(id)a5
{
  id v6 = self;
  id v7 = a5;
  sub_1A08C34A0(0xD00000000000001FLL, 0x80000001A0A332D0);
}

- (void)account:(id)a3 handleSubscriptionRequestFrom:(id)a4 withMessage:(id)a5
{
  uint64_t v5 = self;
  sub_1A08C34A0(0xD000000000000035, 0x80000001A0A332F0);
}

- (void)account:(id)a3 statusChanged:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000019, 0x80000001A0A33330);
}

- (void)account:(id)a3 postedError:(id)a4
{
  uint64_t v5 = self;
  id v6 = a4;
  sub_1A08C34A0(0xD000000000000017, 0x80000001A0A33350);
}

- (void)updateNicknameData:(id)a3
{
  id v4 = a3;
  id v8 = self;
  uint64_t v5 = sub_1A09F33E8();
  unint64_t v7 = v6;

  sub_1A08C34A0(0xD000000000000016, 0x80000001A0A33370);
  sub_1A08AF2E4(v5, v7);
}

- (void)didUpdateSettingsKeys:(id)a3
{
  if (a3) {
    sub_1A09F4078();
  }
  id v4 = self;
  sub_1A08C34A0(0xD000000000000018, 0x80000001A0A33390);

  swift_bridgeObjectRelease();
}

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000016, 0x80000001A0A333B0);
}

- (void)setupComplete
{
  v2 = self;
  sub_1A08C34A0(0x6D6F437075746573, 0xEF29286574656C70);
}

- (void)didReceiveCollaborationMessage:(id)a3 inChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  id v7 = a3;
  id v8 = self;
  sub_1A08C34A0(0xD000000000000037, 0x80000001A0A333D0);
}

- (void)keyTransparencyOptInStateChanged:(BOOL)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000024, 0x80000001A0A33410);
}

- (void)refreshStatusForKTPeerURI:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000001CLL, 0x80000001A0A33440);
}

- (void)fileTransfer:(id)a3 createdWithProperties:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000026, 0x80000001A0A33690);
}

- (void)fileTransfer:(id)a3 updatedWithProperties:(id)a4
{
  uint64_t v5 = sub_1A09F3E18();
  uint64_t v7 = v6;
  uint64_t v8 = sub_1A09F3D08();
  id v9 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC12fileTransfer_21updatedWithPropertiesySS_SDys11AnyHashableVypGtF_0(v5, v7, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fileTransfers:(id)a3 createdWithLocalPaths:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000027, 0x80000001A0A336C0);
}

- (void)fileTransfer:(id)a3 updatedWithCurrentBytes:(unint64_t)a4 totalBytes:(unint64_t)a5 averageTransferRate:(unint64_t)a6
{
  uint64_t v6 = self;
  sub_1A08C34A0(0xD000000000000047, 0x80000001A0A336F0);
}

- (void)fileTransferFinishedRemoteIntentDownload:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000002CLL, 0x80000001A0A33740);
}

- (_TtC17IMSharedUtilities23IntentClientBroadcaster)init
{
  result = (_TtC17IMSharedUtilities23IntentClientBroadcaster *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)chat:(id)a3 updated:(id)a4
{
}

- (void)chat:(id)a3 propertiesUpdated:(id)a4
{
}

- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5
{
  uint64_t v7 = sub_1A09F3E18();
  uint64_t v9 = v8;
  if (a4)
  {
    uint64_t v10 = sub_1A09F3E18();
    a4 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = sub_1A09F3E18();
  uint64_t v14 = v13;
  uint64_t v15 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC4chat_0F15PersonCentricID18displayNameUpdatedySS_SSSgSStF_0(v7, v9, v10, (uint64_t)a4, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5 sender:(id)a6
{
  uint64_t v8 = sub_1A09F3E18();
  uint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = sub_1A09F3E18();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v13 = sub_1A09F3E18();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1A09F3E18();
  uint64_t v18 = v17;
  v19 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC4chat_0F15PersonCentricID18displayNameUpdated6senderySS_SSSgS2StF_0(v8, v10, v11, (uint64_t)a4, v13, v15, v16, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000023, 0x80000001A0A33840);
}

- (void)chat:(id)a3 lastAddressedSIMIDUpdated:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000022, 0x80000001A0A33870);
}

- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4 lastAddressedSIMIDUpdated:(id)a5
{
  uint64_t v5 = self;
  sub_1A08C34A0(0xD00000000000003DLL, 0x80000001A0A338A0);
}

- (void)chat:(id)a3 isFilteredUpdated:(int64_t)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000001ALL, 0x80000001A0A338E0);
}

- (void)chat:(id)a3 isRecoveredUpdated:(BOOL)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000001BLL, 0x80000001A0A33900);
}

- (void)chat:(id)a3 isDeletingIncomingMessagesUpdated:(BOOL)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000002ALL, 0x80000001A0A33920);
}

- (void)chat:(id)a3 engramIDUpdated:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000018, 0x80000001A0A33950);
}

- (void)chat:(id)a3 nicknamesUpdated:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000019, 0x80000001A0A33970);
}

- (void)chat:(id)a3 lastMessageTimeStampOnLoadUpdated:(double)a4
{
  uint64_t v6 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1A09F3E18();
  uint64_t v11 = v10;
  v16[3] = &type metadata for ChatLastMessageTimeStampOnLoadUpdatedBroadcast;
  v16[4] = sub_1A087B6BC();
  v16[0] = v9;
  v16[1] = v11;
  *(double *)&v16[2] = a4;
  uint64_t v12 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  sub_1A0883D94((uint64_t)v16, (uint64_t)v15);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  sub_1A089266C(v15, v13 + 32);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = self;
  sub_1A08BE6E4((uint64_t)v8, (uint64_t)&unk_1E94FAF30, v13);
  swift_release();
  _s17IMSharedUtilities29RemoteIntentBroadcastEncodingVwxx_0((uint64_t)v16);

  swift_bridgeObjectRelease_n();
}

- (void)serviceSwitchRequestReceivedForChatWithIdentifier:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000034, 0x80000001A0A33990);
}

- (void)capabilitiesUpdatedForHandle:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000001FLL, 0x80000001A0A339D0);
}

- (void)chat:(id)a3 uncachedAttachmentCountUpdated:(id)a4
{
  id v5 = a4;
  uint64_t v6 = self;
  sub_1A08C34A0(0xD000000000000027, 0x80000001A0A339F0);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 updateProperties:(id)a7
{
  if (a6) {
    sub_1A09F3D08();
  }
  uint64_t v8 = self;
  sub_1A08C34A0(0xD000000000000036, 0x80000001A0A33A20);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 error:(id)a7
{
  if (a6) {
    sub_1A09F3D08();
  }
  id v10 = a7;
  uint64_t v9 = self;
  sub_1A08C34A0(0xD00000000000002BLL, 0x80000001A0A33A60);

  swift_bridgeObjectRelease();
}

- (void)leftChat:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0x746168437466656CLL, 0xEC000000293A5F28);
}

- (void)engroupParticipantsUpdatedForChat:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000024, 0x80000001A0A33A90);
}

- (void)loadedChats:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0x6843646564616F6CLL, 0xEF293A5F28737461);
}

- (void)loadedChats:(id)a3 queryID:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000017, 0x80000001A0A33AC0);
}

- (void)markedAsReadForMessageGUID:(id)a3 success:(BOOL)a4 queryID:(id)a5
{
  id v5 = self;
  sub_1A08C34A0(0xD00000000000002DLL, 0x80000001A0A33AE0);
}

- (void)forcedReloadingChatRegistryWithQueryID:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000029, 0x80000001A0A33B10);
}

- (void)movedMessagesToRecentlyDeletedWithQueryID:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000002CLL, 0x80000001A0A33B40);
}

- (void)movedMessagesToRecentlyDeletedForChatsWithGUIDs:(id)a3 queryID:(id)a4 deletionDate:(id)a5
{
  uint64_t v8 = sub_1A09F4078();
  if (a4)
  {
    uint64_t v9 = sub_1A09F3E18();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = sub_1A07856F8((uint64_t *)&unk_1E94FAF20);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1A09F3458();
    uint64_t v14 = sub_1A09F3478();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_1A09F3478();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  uint64_t v16 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC38movedMessagesToRecentlyDeletedForChats9withGUIDs7queryID12deletionDateySaySSG_SSSg10Foundation0R0VSgtF_0(v8, v9, (uint64_t)a4, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A08CB514((uint64_t)v13);
}

- (void)recoveredMessagesWithChatGUIDs:(id)a3 queryID:(id)a4
{
  uint64_t v5 = sub_1A09F4078();
  uint64_t v6 = sub_1A09F3E18();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC17recoveredMessages13withChatGUIDs7queryIDySaySSG_SStF_0(v5, v6, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)loadedRecoverableMessagesMetadata:(id)a3 queryID:(id)a4
{
  sub_1A07856F8(&qword_1E94F93A0);
  uint64_t v5 = sub_1A09F3D08();
  uint64_t v6 = sub_1A09F3E18();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC33loadedRecoverableMessagesMetadata_7queryIDySDySSSDySSSo8NSNumberCGG_SStF_0(v5, v6, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000038, 0x80000001A0A33B70);
}

- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3 queryID:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000040, 0x80000001A0A33BB0);
}

- (void)permanentlyDeletedRecoverableMessagesForChatsWithGUIDs:(id)a3 deletedChatGUIDs:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000004ALL, 0x80000001A0A33C00);
}

- (void)recoveredMessagesFromRecentlyDeletedForChatsWithGUIDs:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000038, 0x80000001A0A33C50);
}

- (void)chatsNeedRemerging:(id)a3 groupedChats:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000023, 0x80000001A0A33C90);
}

- (void)chatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000025, 0x80000001A0A33CC0);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 invitationReceived:(id)a7
{
  if (a6) {
    sub_1A09F3D08();
  }
  id v9 = a7;
  id v10 = self;
  sub_1A08C34A0(0xD000000000000038, 0x80000001A0A33CF0);

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageSent:(id)a9
{
  uint64_t v24 = sub_1A09F3E18();
  uint64_t v14 = v13;
  if (a4)
  {
    uint64_t v15 = sub_1A09F3E18();
    a4 = v16;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v15 = 0;
  if (a6) {
LABEL_3:
  }
    a6 = (id)sub_1A09F3D08();
LABEL_4:
  uint64_t v17 = sub_1A09F3E18();
  uint64_t v19 = v18;
  if (a8)
  {
    uint64_t v20 = sub_1A09F3E18();
    a8 = v21;
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v22 = a9;
  v23 = self;
  sub_1A08C9F44(v24, v14, v15, (uint64_t)a4, a5, (uint64_t)a6, v17, v19, v20, (uint64_t)a8, v22);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 notifySentMessage:(id)a7 sendTime:(id)a8 isReplicating:(BOOL)a9
{
  int v12 = a5;
  uint64_t v15 = sub_1A09F3E18();
  uint64_t v17 = v16;
  if (a4)
  {
    uint64_t v18 = sub_1A09F3E18();
    a4 = v19;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v18 = 0;
  if (a6) {
LABEL_3:
  }
    a6 = (id)sub_1A09F3D08();
LABEL_4:
  id v20 = a7;
  id v21 = a8;
  id v22 = self;
  sub_1A08CA178(v15, v17, v18, (uint64_t)a4, v12, (uint64_t)a6, v20, v21, a9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageReceived:(id)a9
{
  uint64_t v25 = sub_1A09F3E18();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1A09F3E18();
  uint64_t v16 = v15;
  if (a6) {
    uint64_t v17 = sub_1A09F3D08();
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = sub_1A09F3E18();
  uint64_t v20 = v19;
  if (a8)
  {
    uint64_t v21 = sub_1A09F3E18();
    a8 = v22;
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v23 = a9;
  uint64_t v24 = self;
  sub_1A08CA3AC(v25, v13, v14, v16, a5, v17, v18, v20, v21, (uint64_t)a8, v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messagesReceived:(id)a9 removed:(id)a10 messagesComingFromStorage:(BOOL)a11
{
  uint64_t v27 = sub_1A09F3E18();
  uint64_t v15 = v14;
  uint64_t v26 = sub_1A09F3E18();
  uint64_t v17 = v16;
  if (a6) {
    a6 = (id)sub_1A09F3D08();
  }
  uint64_t v18 = sub_1A09F3E18();
  uint64_t v20 = v19;
  if (a8)
  {
    uint64_t v21 = sub_1A09F3E18();
    a8 = v22;
  }
  else
  {
    uint64_t v21 = 0;
  }
  sub_1A0878768();
  uint64_t v23 = sub_1A09F4078();
  uint64_t v24 = sub_1A09F4078();
  uint64_t v25 = self;
  sub_1A08CA5E0(v27, v15, v26, v17, a5, (uint64_t)a6, v18, v20, v21, (uint64_t)a8, v23, v24, a11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7
{
  uint64_t v12 = sub_1A09F3E18();
  uint64_t v14 = v13;
  if (a4)
  {
    uint64_t v15 = sub_1A09F3E18();
    a4 = v16;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v15 = 0;
  if (a6) {
LABEL_3:
  }
    a6 = (id)sub_1A09F3D08();
LABEL_4:
  id v17 = a7;
  uint64_t v18 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC7account_4chat5style0G10Properties14messageUpdatedySS_SSSgSo11IMChatStyleVSDys11AnyHashableVypGSgSo6IMItemCtF_0(v12, v14, v15, (uint64_t)a4, a5, (uint64_t)a6, v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7
{
  uint64_t v11 = sub_1A09F3E18();
  uint64_t v13 = v12;
  if (a4)
  {
    uint64_t v14 = sub_1A09F3E18();
    a4 = v15;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v14 = 0;
  if (a6) {
LABEL_3:
  }
    a6 = (id)sub_1A09F3D08();
LABEL_4:
  sub_1A07856F8((uint64_t *)&unk_1E94F9030);
  uint64_t v16 = sub_1A09F4078();
  id v17 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC7account_4chat5style0G10Properties15messagesUpdatedySS_SSSgSo11IMChatStyleVSDys11AnyHashableVypGSgSayANGtF_0(v11, v13, v14, (uint64_t)a4, a5, (uint64_t)a6, v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 messagesUpdated:(id)a6
{
  uint64_t v10 = sub_1A09F3E18();
  uint64_t v12 = v11;
  if (a4)
  {
    uint64_t v13 = sub_1A09F3E18();
    a4 = v14;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v13 = 0;
  if (a6) {
LABEL_3:
  }
    a6 = (id)sub_1A09F4078();
LABEL_4:
  uint64_t v15 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC7service_4chat5style15messagesUpdatedySS_SSSgSo11IMChatStyleVSayypGSgtF_0(v10, v12, v13, (uint64_t)a4, a5, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 statusChanged:(int)a9 handleInfo:(id)a10
{
  uint64_t v13 = (uint64_t)a10;
  uint64_t v25 = sub_1A09F3E18();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1A09F3E18();
  uint64_t v18 = v17;
  if (a6) {
    a6 = (id)sub_1A09F3D08();
  }
  uint64_t v19 = sub_1A09F3E18();
  uint64_t v21 = v20;
  if (a8)
  {
    uint64_t v22 = sub_1A09F3E18();
    a8 = v23;
    if (!a10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v22 = 0;
  if (a10) {
LABEL_5:
  }
    uint64_t v13 = sub_1A09F4078();
LABEL_6:
  uint64_t v24 = self;
  sub_1A08CAF0C(v25, v15, v16, v18, a5, (uint64_t)a6, v19, v21, v22, (uint64_t)a8, a9, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 chatPersonCentricID:(id)a7 member:(id)a8 statusChanged:(int)a9
{
  uint64_t v12 = sub_1A09F3E18();
  uint64_t v14 = v13;
  uint64_t v15 = sub_1A09F3E18();
  uint64_t v17 = v16;
  if (a6) {
    a6 = (id)sub_1A09F3D08();
  }
  if (a7)
  {
    uint64_t v18 = sub_1A09F3E18();
    a7 = v19;
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v20 = sub_1A09F3D08();
  uint64_t v21 = self;
  sub_1A08CB154(v12, v14, v15, v17, a5, (uint64_t)a6, v18, (uint64_t)a7, v20, a9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)account:(id)a3 handleID:(id)a4 updatedLastReceivedOnGridMessageDate:(id)a5
{
  uint64_t v7 = sub_1A07856F8((uint64_t *)&unk_1E94FAF20);
  MEMORY[0x1F4188790](v7 - 8);
  id v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1A09F3458();
    uint64_t v10 = sub_1A09F3478();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1A09F3478();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  uint64_t v12 = self;
  sub_1A08C34A0(0xD000000000000039, 0x80000001A0A33D30);

  sub_1A08CB514((uint64_t)v9);
}

- (void)downloadedPurgedAssetBatchForChatIDs:(id)a3 completedTransferGUIDs:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD00000000000003ELL, 0x80000001A0A33D70);
}

- (void)finishedDownloadingPurgedAssetsForChatIDs:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000002CLL, 0x80000001A0A33DB0);
}

- (void)historicalMessageGUIDsDeleted:(id)a3 chatGUIDs:(id)a4 queryID:(id)a5
{
  if (a3)
  {
    sub_1A09F4078();
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    sub_1A09F4078();
LABEL_4:
  if (a5) {
    sub_1A09F3E18();
  }
  uint64_t v8 = self;
  sub_1A08C34A0(0xD000000000000033, 0x80000001A0A33DE0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)previouslyBlackholedChatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000039, 0x80000001A0A33E20);
}

- (void)previouslyBlackholedChatLoadedWithHandleIDs:(id)a3 chat:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000033, 0x80000001A0A33E60);
}

- (void)blackholedChatsExist:(BOOL)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000018, 0x80000001A0A33EA0);
}

- (void)groupPhotoUpdatedForChatIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5 userInfo:(id)a6
{
  uint64_t v9 = sub_1A09F3E18();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1A09F3E18();
  uint64_t v14 = v13;
  if (a6) {
    a6 = (id)sub_1A09F3D08();
  }
  uint64_t v15 = self;
  _s17IMSharedUtilities23IntentClientBroadcasterC17groupPhotoUpdated17forChatIdentifier5style7account8userInfoySS_So11IMChatStyleVSSSDys11AnyHashableVypGSgtF_0(v9, v11, a4, v12, v14, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)displayPinCodeForAccount:(id)a3 pinCode:(id)a4 deviceName:(id)a5 deviceType:(id)a6 phoneNumber:(id)a7
{
  id v8 = a4;
  uint64_t v9 = self;
  sub_1A08C34A0(0xD000000000000045, 0x80000001A0A33EC0);
}

- (void)pinCodeAlertCompleted:(id)a3 deviceName:(id)a4 deviceType:(id)a5 phoneNumber:(id)a6 responseFromDevice:(BOOL)a7 wasCancelled:(BOOL)a8
{
  id v8 = self;
  sub_1A08C34A0(0xD00000000000005BLL, 0x80000001A0A33F10);
}

- (void)screenTimeEnablementChanged:(BOOL)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000001FLL, 0x80000001A0A33F70);
}

- (void)collaborationNoticesDidChangeForChatGUIDs:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000002CLL, 0x80000001A0A33F90);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 initialEmergencyQuestionnaireReceived:(id)a9
{
  if (a6)
  {
    sub_1A09F3D08();
    if (!a8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a8) {
LABEL_3:
  }
    sub_1A09F3E18();
LABEL_4:
  id v11 = a9;
  uint64_t v12 = self;
  sub_1A08C34A0(0xD000000000000067, 0x80000001A0A33FC0);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)qosClassWhileServicingRequestsResponse:(unsigned int)a3 identifier:(id)a4
{
  id v4 = self;
  sub_1A08C34A0(0xD000000000000035, 0x80000001A0A34030);
}

- (void)updatedSummariesForChatsWithGUIDsAndProperties:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD000000000000031, 0x80000001A0A34070);
}

- (void)databaseUpdated
{
  v2 = self;
  sub_1A08C34A0(0xD000000000000011, 0x80000001A0A342C0);
}

- (void)databaseUpdated:(id)a3
{
  uint64_t v4 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1A09F3E18();
  uint64_t v9 = v8;
  v14[3] = &type metadata for ChatDatabaseUpdatedStampBroadcast;
  v14[4] = sub_1A087B4C4();
  v14[0] = v7;
  v14[1] = v9;
  uint64_t v10 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  sub_1A0883D94((uint64_t)v14, (uint64_t)v13);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  *(void *)(v11 + 24) = 0;
  sub_1A089266C(v13, v11 + 32);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = self;
  sub_1A08BE6E4((uint64_t)v6, (uint64_t)&unk_1E94FAF30, v11);
  swift_release();
  _s17IMSharedUtilities29RemoteIntentBroadcastEncodingVwxx_0((uint64_t)v14);

  swift_bridgeObjectRelease_n();
}

- (void)databaseChatSpamUpdated:(id)a3
{
  v3 = self;
  sub_1A08C34A0(0xD00000000000001BLL, 0x80000001A0A342E0);
}

@end