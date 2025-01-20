@interface RCSServiceSession
- (BOOL)_isActiveServiceForRelay;
- (BOOL)_messageUpgradesWhenSentFromCurrentService:(id)a3;
- (BOOL)allowedToOverwriteOriginalGroupIDForChat:(id)a3;
- (BOOL)allowedToSendMessage:(id)a3 toChat:(id)a4;
- (BOOL)chatCanMergeWithSuperChat:(id)a3;
- (BOOL)isGroupMessagingEnabledFor:(id)a3;
- (BOOL)replicationRequiredForFeaturesUsedByMessageItem:(id)a3;
- (BOOL)replicationRequiredForMessageBodyAttributeName:(id)a3;
- (BOOL)replicationRequiredForMultipleMessageParts;
- (BOOL)replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)shouldExcludeChatFromRelay:(id)a3;
- (BOOL)shouldSendReadReceiptsForChat:(id)a3 style:(unsigned __int8)a4;
- (RCSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (id)groupIDForChat:(id)a3;
- (id)makeSenderFor:(id)a3 forChat:(id)a4 chatStyle:(unsigned __int8)a5 recipients:(id)a6;
- (id)replicationPhoneNumbers;
- (int64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4;
- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5;
- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4;
- (void)_updatePhoneNumberCallerID;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)capabilitiesFound:(id)a3 destination:(id)a4 withCapabilities:(id)a5;
- (void)cleanupPendingGroupChangesFor:(id)a3;
- (void)composingIndicator:(id)a3 from:(id)a4 withID:(id)a5 withIndication:(id)a6;
- (void)destinationCapabilitiesUpdated:(id)a3 withCapabilities:(id)a4;
- (void)didDeleteChatGUID:(id)a3 chatIdentifier:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 originalGroupID:(id)a7 properties:(id)a8 lastAddressedLocalHandle:(id)a9 lastAddressedSIMID:(id)a10;
- (void)didDiscover:(id)a3 destination:(id)a4 withCapabilities:(id)a5 withResult:(id)a6;
- (void)didFinishExit:(id)a3 withResult:(id)a4;
- (void)didFinishFetchChatBotRenderInformation:(id)a3 forChatBot:(id)a4 withRenderData:(id)a5 withResult:(id)a6;
- (void)didFinishGroupChatCreation:(id)a3 forGroupChat:(id)a4 withResult:(id)a5;
- (void)didFinishGroupUpdate:(id)a3 forGroupChat:(id)a4;
- (void)didFinishParticipantsAddition:(id)a3 added:(id)a4 didNotAdd:(id)a5 withResult:(id)a6;
- (void)didFinishParticipantsRemoval:(id)a3 removed:(id)a4 didNotRemove:(id)a5 withResult:(id)a6;
- (void)didFinishSubjectChange:(id)a3 withNewSubject:(id)a4 withResult:(id)a5;
- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 fromIDSID:(id)a6;
- (void)didReportChatbotSpam:(id)a3 forChatbot:(id)a4 withResult:(id)a5;
- (void)didReportSpam:(id)a3 forDestination:(id)a4 withResult:(id)a5;
- (void)dispositionInformation:(id)a3 withStatus:(id)a4;
- (void)evictedFromGroup:(id)a3 withGroupInfo:(id)a4 evictedBy:(id)a5;
- (void)handler:(id)a3 messageIDDelivered:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8;
- (void)incomingGroupChat:(id)a3 withGroupInformation:(id)a4;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7;
- (void)leaveChat:(id)a3 style:(unsigned __int8)a4;
- (void)messageReceived:(id)a3 withID:(id)a4 ofType:(id)a5;
- (void)participantsAdded:(id)a3 toGroupChat:(id)a4 withAddedParticipants:(id)a5 addedBy:(id)a6;
- (void)participantsRemoved:(id)a3 fromGroupChat:(id)a4 withRemovedParticipants:(id)a5 removedBy:(id)a6;
- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)requestToDisableAnonymization:(id)a3 from:(id)a4 withID:(id)a5;
- (void)requestToEnableDisplayedNotifications:(id)a3 from:(id)a4 withID:(id)a5;
- (void)revokeSentMessage:(id)a3 inChat:(id)a4;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)sendLazuliSpamReport:(id)a3 isBot:(BOOL)a4 spamType:(unint64_t)a5;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7;
- (void)subjectUpdated:(id)a3 forGroupChat:(id)a4 withNewSubject:(id)a5 updatedBy:(id)a6;
- (void)systemConfigurationChanged:(id)a3 withConfiguration:(id)a4;
- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9;
- (void)waitForChatRelayReadiness:(id)a3 withBlock:(id)a4;
@end

@implementation RCSServiceSession

- (void)sendLazuliSpamReport:(id)a3 isBot:(BOOL)a4 spamType:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = self;
  RCSServiceSession.sendLazuliSpamReport(_:isBot:spamType:)(v8, v6, a5);
}

- (BOOL)isGroupMessagingEnabledFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  unsigned __int8 v6 = _sSo17RCSServiceSessionC3RCSE23isGroupMessagingEnabled3forSbSo7IMDChatC_tF_0(v4);

  return v6 & 1;
}

- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  if (!a5) {
    return 104857600;
  }
  uint64_t v6 = sub_F7220();
  uint64_t v8 = v7;
  v9 = self;
  sub_BBA8(v6, v8, (SEL *)&selRef_maxTransferSize);
  int64_t v11 = v10;
  LOBYTE(v6) = v12;

  swift_bridgeObjectRelease();
  if (v6) {
    return 104857600;
  }
  return v11;
}

- (void)systemConfigurationChanged:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  RCSServiceSession.systemConfigurationChanged(_:with:)(v6, v7);
}

- (void)messageReceived:(id)a3 withID:(id)a4 ofType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = self;
  RCSServiceSession.messageReceived(_:with:ofType:)(v8, v9, v10);
}

- (void)dispositionInformation:(id)a3 withStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  RCSServiceSession.dispositionInformation(_:with:)(v6, v7);
}

- (void)composingIndicator:(id)a3 from:(id)a4 withID:(id)a5 withIndication:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  RCSServiceSession.composingIndicator(_:from:with:withIndication:)(v10, v11, v12, v13);
}

- (void)requestToDisableAnonymization:(id)a3 from:(id)a4 withID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_1DE64(v8, v9, v10, 0xD00000000000002ALL, 0x8000000000102AC0);
}

- (void)requestToEnableDisplayedNotifications:(id)a3 from:(id)a4 withID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_1DE64(v8, v9, v10, 0xD000000000000032, 0x8000000000102A80);
}

- (void)didFinishFetchChatBotRenderInformation:(id)a3 forChatBot:(id)a4 withRenderData:(id)a5 withResult:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_1E22C(v11, a5);
}

- (void)destinationCapabilitiesUpdated:(id)a3 withCapabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  RCSServiceSession.destinationCapabilitiesUpdated(_:withCapabilities:)(v6, v7);
}

- (void)didDiscover:(id)a3 destination:(id)a4 withCapabilities:(id)a5 withResult:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  RCSServiceSession.didDiscover(_:destination:withCapabilities:with:)(v10, v11, a5, v13);
}

- (void)capabilitiesFound:(id)a3 destination:(id)a4 withCapabilities:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  RCSServiceSession.capabilitiesFound(_:destination:withCapabilities:)(v8, v9, v10);
}

- (void)subjectUpdated:(id)a3 forGroupChat:(id)a4 withNewSubject:(id)a5 updatedBy:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  RCSServiceSession.subjectUpdated(_:forGroupChat:withNewSubject:updatedBy:)(v10, v11, a5, a6);
}

- (void)incomingGroupChat:(id)a3 withGroupInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  RCSServiceSession.incomingGroupChat(_:withGroupInformation:)(v6, v7);
}

- (void)participantsRemoved:(id)a3 fromGroupChat:(id)a4 withRemovedParticipants:(id)a5 removedBy:(id)a6
{
}

- (void)participantsAdded:(id)a3 toGroupChat:(id)a4 withAddedParticipants:(id)a5 addedBy:(id)a6
{
}

- (void)didFinishGroupUpdate:(id)a3 forGroupChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  RCSServiceSession.didFinishGroupUpdate(_:forGroupChat:)(v6, v7);
}

- (void)didFinishExit:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  RCSServiceSession.didFinishExit(_:with:)(v6, v7);
}

- (void)evictedFromGroup:(id)a3 withGroupInfo:(id)a4 evictedBy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  RCSServiceSession.evicted(fromGroup:withGroupInfo:evictedBy:)(v8, v9, a5);
}

- (void)didFinishParticipantsAddition:(id)a3 added:(id)a4 didNotAdd:(id)a5 withResult:(id)a6
{
}

- (void)didFinishParticipantsRemoval:(id)a3 removed:(id)a4 didNotRemove:(id)a5 withResult:(id)a6
{
}

- (void)didFinishGroupChatCreation:(id)a3 forGroupChat:(id)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  RCSServiceSession.didFinishGroupChatCreation(_:forGroupChat:with:)(v8, v9, v10);
}

- (void)didFinishSubjectChange:(id)a3 withNewSubject:(id)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  RCSServiceSession.didFinishSubjectChange(_:withNewSubject:with:)(v8, a4, v10);
}

- (void)didReportChatbotSpam:(id)a3 forChatbot:(id)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  RCSServiceSession.didReportChatbotSpam(_:forChatbot:with:)(v8, v9, v10);
}

- (void)didReportSpam:(id)a3 forDestination:(id)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  RCSServiceSession.didReportSpam(_:for:with:)(v8, v9, v10);
}

- (void)cleanupPendingGroupChangesFor:(id)a3
{
  uint64_t v4 = sub_F7220();
  uint64_t v6 = v5;
  id v7 = self;
  sub_2A264(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 fromIDSID:(id)a6
{
  uint64_t v10 = sub_F7220();
  id v12 = v11;
  if (a6)
  {
    uint64_t v13 = sub_F7220();
    a6 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v15 = a3;
  v16 = self;
  RCSServiceSession.didReceiveMessage(_:forChat:style:fromIDSID:)(v15, v10, v12, a5, v13, (uint64_t)a6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)leaveChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v6 = sub_F7220();
  uint64_t v8 = v7;
  id v9 = self;
  RCSServiceSession.leaveChat(_:style:)(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v11 = (uint64_t)a3;
  if (a3)
  {
    sub_551C(&qword_1284E8);
    uint64_t v11 = sub_F7410();
  }
  if (a5)
  {
    uint64_t v13 = sub_F7220();
    a5 = v14;
    if (a6)
    {
LABEL_5:
      uint64_t v15 = sub_F7220();
      a6 = v16;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if (a6) {
      goto LABEL_5;
    }
  }
  uint64_t v15 = 0;
LABEL_8:
  id v17 = a4;
  v18 = self;
  sub_47ED8(2, v11, v13, (uint64_t)a5, v15, (uint64_t)a6, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v9 = (uint64_t)a3;
  if (a3)
  {
    sub_551C(&qword_1284E8);
    uint64_t v9 = sub_F7410();
  }
  if (a4)
  {
    uint64_t v11 = sub_F7220();
    a4 = v12;
    if (a5)
    {
LABEL_5:
      uint64_t v13 = sub_F7220();
      a5 = v14;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a5) {
      goto LABEL_5;
    }
  }
  uint64_t v13 = 0;
LABEL_8:
  uint64_t v15 = self;
  sub_47ED8(3, v9, v11, (uint64_t)a4, v13, (uint64_t)a5, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)replicationPhoneNumbers
{
  v2 = self;
  RCSServiceSession.replicationPhoneNumbers()();

  v3 = (void *)sub_F7610();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v6 = sub_F7220();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_F7220();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = self;
  v12._countAndFlagsBits = v6;
  v12._object = v8;
  v13.value._countAndFlagsBits = v9;
  v13.value._object = a4;
  Swift::Bool v14 = RCSServiceSession.replicationRequirementsSatisfied(forPhoneNumber:simID:)(v12, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (BOOL)replicationRequiredForFeaturesUsedByMessageItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  RCSServiceSession.replicationRequiredForFeaturesUsed(by:)(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)replicationRequiredForMultipleMessageParts
{
  return 0;
}

- (BOOL)replicationRequiredForMessageBodyAttributeName:(id)a3
{
  uint64_t v4 = sub_F7220();
  uint64_t v6 = v5;
  if (sub_F7220() == v4 && v7 == v6)
  {
    swift_bridgeObjectRelease_n();
    return 0;
  }
  else
  {
    char v9 = sub_F7B60();
    uint64_t v10 = self;
    swift_bridgeObjectRelease();
    if (v9)
    {

      swift_bridgeObjectRelease();
      return 0;
    }
    else
    {
      Swift::String v12 = (void *)sub_F71F0();
      v14.receiver = v10;
      v14.super_class = (Class)RCSServiceSession;
      BOOL v11 = [(RCSServiceSession *)&v14 replicationRequiredForMessageBodyAttributeName:v12];

      swift_bridgeObjectRelease();
    }
  }
  return v11;
}

- (RCSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  RCSServiceSession.init(account:service:replicatingFor:)(v7, v8, a5);
  return result;
}

- (BOOL)shouldExcludeChatFromRelay:(id)a3
{
  return 0;
}

- (int64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  sub_F7220();
  sub_F7220();
  uint64_t v5 = self;
  uint64_t v6 = self;
  id v7 = [v5 sharedManager];
  id v8 = (void *)sub_F71F0();
  id v9 = (void *)sub_F71F0();
  id v10 = [v7 groupMessagingMaxGroupSizeForPhoneNumber:v8 simID:v9];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (int64_t)v10;
}

- (BOOL)_isActiveServiceForRelay
{
  v3 = self;
  uint64_t v4 = self;
  id v5 = [v3 sharedFeatureFlags];
  LODWORD(v3) = [v5 isLazuliEnabled];

  if (v3)
  {
    if (IMSharedHelperRetrieveSimDetailsFromTelephony())
    {
      sub_3DC58();
      uint64_t v7 = v6;

      return v7 == 5;
    }
    else
    {

      return 1;
    }
  }
  else
  {

    return 0;
  }
}

- (id)makeSenderFor:(id)a3 forChat:(id)a4 chatStyle:(unsigned __int8)a5 recipients:(id)a6
{
  sub_551C(&qword_128730);
  sub_F7410();
  id v10 = a3;
  BOOL v11 = a4;
  Swift::String v12 = self;
  RCSServiceSession.makeSender(for:for:chatStyle:recipients:)(v10, v11, a5);
  objc_super v14 = v13;

  swift_bridgeObjectRelease();

  return v14;
}

- (void)revokeSentMessage:(id)a3 inChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  RCSServiceSession.revokeSentMessage(_:in:)(v6, v7);
}

- (void)didDeleteChatGUID:(id)a3 chatIdentifier:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 originalGroupID:(id)a7 properties:(id)a8 lastAddressedLocalHandle:(id)a9 lastAddressedSIMID:(id)a10
{
  int v32 = a5;
  uint64_t v31 = sub_F7220();
  uint64_t v15 = v14;
  uint64_t v30 = sub_F7220();
  id v17 = v16;
  if (a6)
  {
    sub_F7220();
    if (a7) {
      goto LABEL_3;
    }
  }
  else if (a7)
  {
LABEL_3:
    uint64_t v29 = sub_F7220();
    a7 = v18;
    if (!a8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v29 = 0;
  if (a8) {
LABEL_4:
  }
    a8 = (id)sub_F71B0();
LABEL_5:
  v19 = self;
  id v20 = a10;
  id v21 = a9;
  if (v21)
  {
    v22 = v21;
    uint64_t v23 = sub_F7220();
    uint64_t v25 = v24;

    if (v20)
    {
LABEL_7:
      uint64_t v26 = sub_F7220();
      uint64_t v28 = v27;

      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    if (v20) {
      goto LABEL_7;
    }
  }
  uint64_t v26 = 0;
  uint64_t v28 = 0;
LABEL_13:
  sub_5FFDC(v31, v15, v30, v17, v32, v29, (uint64_t)a7, (uint64_t)a8, v23, v25, v26, v28);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)shouldSendReadReceiptsForChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v6 = sub_F7220();
  unint64_t v8 = v7;
  id v9 = self;
  unsigned __int8 v10 = RCSServiceSession.shouldSendReadReceipts(forChat:style:)(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v7 = a5;
  if (a4)
  {
    sub_F7220();
    uint64_t v11 = v10;
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a5)
    {
LABEL_3:
      sub_F7220();
      id v7 = v12;
      if (v11) {
        goto LABEL_4;
      }
LABEL_8:
      id v17 = a3;
      v18 = self;
      uint64_t v15 = 0;
      if (v7) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  if (!v11) {
    goto LABEL_8;
  }
LABEL_4:
  id v13 = a3;
  objc_super v14 = self;
  uint64_t v15 = (void *)sub_F71F0();
  if (v7)
  {
LABEL_5:
    v16 = (void *)sub_F71F0();
    goto LABEL_10;
  }
LABEL_9:
  v16 = 0;
LABEL_10:
  [(RCSServiceSession *)self sendReadReceiptForMessage:a3 toChatID:v15 identifier:v16 style:v6 reflectOnly:0];

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7
{
  id v9 = a5;
  if (a4)
  {
    sub_F7220();
    if (v9)
    {
LABEL_3:
      uint64_t v12 = sub_F7220();
      id v9 = v13;
      goto LABEL_6;
    }
  }
  else if (a5)
  {
    goto LABEL_3;
  }
  uint64_t v12 = 0;
LABEL_6:
  id v14 = a3;
  uint64_t v15 = self;
  sub_60D0C(a3, v12, (unint64_t)v9, a6, a7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)chatCanMergeWithSuperChat:(id)a3
{
  id v4 = a3;
  id v5 = self;
  BOOL CanMerge13withSuperChatSbSo7IMDChatC_tF_0 = _sSo17RCSServiceSessionC3RCSE12chatCanMerge13withSuperChatSbSo7IMDChatC_tF_0(v4);

  return CanMerge13withSuperChatSbSo7IMDChatC_tF_0;
}

- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9
{
  if (a3)
  {
    uint64_t v31 = sub_F7220();
    uint64_t v33 = v14;
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v33 = 0;
    if (a4)
    {
LABEL_3:
      uint64_t v30 = sub_F7220();
      uint64_t v16 = v15;
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v29 = 0;
      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  uint64_t v30 = 0;
  uint64_t v16 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v29 = sub_F7220();
  a5 = v17;
  if (a6)
  {
LABEL_5:
    a6 = (id)sub_F7220();
    v19 = v18;
    goto LABEL_10;
  }
LABEL_9:
  v19 = 0;
LABEL_10:
  id v20 = a7;
  id v21 = a9;
  v22 = self;
  if (v20)
  {
    uint64_t v23 = sub_F7220();
    uint64_t v25 = v24;

    if (v21)
    {
LABEL_12:
      uint64_t v26 = sub_F7220();
      uint64_t v28 = v27;

      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    if (v21) {
      goto LABEL_12;
    }
  }
  uint64_t v26 = 0;
  uint64_t v28 = 0;
LABEL_15:
  RCSServiceSession.updateDisplayName(_:fromDisplayName:fromID:forChatID:identifier:style:messageID:)(v31, v33, v30, v16, v29, (unint64_t)a5, (uint64_t)a6, v19, v23, v25, a8, v26, v28);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  int v23 = a6;
  if (a3)
  {
    uint64_t v10 = sub_F7220();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  uint64_t v13 = sub_F7220();
  uint64_t v15 = v14;
  uint64_t v16 = sub_F7220();
  uint64_t v18 = v17;
  uint64_t v19 = sub_F7220();
  uint64_t v21 = v20;
  v22 = self;
  RCSServiceSession.sendGroupPhotoUpdate(_:toChatID:identifier:style:account:isPhotoRefresh:)(v10, v12, v13, v15, v16, v18, v23, v19, v21, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)_updatePhoneNumberCallerID
{
  v2.receiver = self;
  v2.super_class = (Class)RCSServiceSession;
  [(RCSServiceSession *)&v2 _updatePhoneNumberCallerID];
}

- (id)groupIDForChat:(id)a3
{
  id v4 = a3;
  id v5 = self;
  RCSServiceSession.groupID(for:)(v4);

  uint64_t v6 = (void *)sub_F71F0();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)allowedToSendMessage:(id)a3 toChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  RCSServiceSession.allowed(toSendMessage:to:)(v6, v7);
  char v10 = v9;

  return v10 & 1;
}

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4
{
  id v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = *(void *)(*(void *)&self->IMDTelephonyServiceSession_opaque[OBJC_IVAR___RCSServiceSession_state] + 112);
  if (v8)
  {
    uint64_t v9 = v7;
    char v10 = *(void (**)(void (*)(uint64_t, uint64_t), uint64_t, double))(*(void *)v8 + 144);
    uint64_t v11 = self;
    swift_retain();
    v10(sub_61814, v9, a4);

    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)allowedToOverwriteOriginalGroupIDForChat:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char v6 = _sSo17RCSServiceSessionC3RCSE33allowedToOverwriteOriginalGroupID3forSbSo7IMDChatC_tF_0(v4);

  return v6 & 1;
}

- (void)waitForChatRelayReadiness:(id)a3 withBlock:(id)a4
{
  char v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_61444(v7, v8, (void (**)(void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (BOOL)_messageUpgradesWhenSentFromCurrentService:(id)a3
{
  id v4 = a3;
  id v5 = self;
  char v6 = _sSo17RCSServiceSessionC3RCSE24_messageUpgradesWhenSent18fromCurrentServiceSbSo13IMMessageItemC_tF_0(v4);

  return v6 & 1;
}

- (void).cxx_destruct
{
}

- (void)handler:(id)a3 messageIDDelivered:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8
{
  if (a4)
  {
    uint64_t v14 = sub_F7220();
    uint64_t v16 = v15;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v14 = 0;
  uint64_t v16 = 0;
  if (a5) {
LABEL_3:
  }
    sub_F7220();
LABEL_4:
  if (a6) {
    sub_F7220();
  }
  id v17 = a3;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = self;
  sub_6DA28(v14, v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v7 = sub_551C((uint64_t *)&unk_128000);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  swift_unknownObjectRetain();
  uint64_t v11 = self;
  sub_F74F0();
  uint64_t v12 = sub_F7520();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 0, 1, v12);
  sub_F74E0();
  id v13 = v10;
  swift_unknownObjectRetain();
  uint64_t v14 = v11;
  uint64_t v15 = sub_F74D0();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v14;
  v16[5] = v13;
  v16[6] = a4;
  sub_9EAC((uint64_t)v9, (uint64_t)&unk_128E08, (uint64_t)v16);

  swift_unknownObjectRelease();
  swift_release();
}

@end