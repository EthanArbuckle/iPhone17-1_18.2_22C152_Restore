@interface IMSafetyMonitorCoordinator_Impl
+ (IMSafetyMonitorCoordinator_Impl)sharedCoordinator;
- (BOOL)shouldDisallowBasedOnRegulatoryDomain;
- (BOOL)shouldDropIncomingCheckInMessageWithURL:(id)a3 senderHandle:(id)a4 isFromMe:(BOOL)a5;
- (IMSafetyMonitorCoordinator_Impl)init;
- (NSDictionary)appPayload;
- (NSString)appPayloadID;
- (int64_t)notificationContentForInitiator:(id)a3 messageURL:(id)a4 content:(id)a5;
- (void)checkPreferredHandlesCacheForInitiatorHandleID:(id)a3 andReceiver:(id)a4 completion:(id)a5;
- (void)checkPreferredHandlesCacheForReceiverWith:(id)a3 completion:(id)a4;
- (void)informOfCancelledScheduledMessageSendWithMessageGUID:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5;
- (void)informOfChangedGroupDisplayNameWithGroupID:(id)a3;
- (void)informOfChangedGroupMembershipWithGroupID:(id)a3;
- (void)informOfChangedGroupPhotoWithGroupID:(id)a3;
- (void)informOfDeletedConversationWithReceiverHandles:(id)a3;
- (void)informOfDeletedMessagesWithMessages:(id)a3;
- (void)informOfIncomingMessageWithMessage:(id)a3;
- (void)informOfKickFromGroupWithGroupID:(id)a3;
- (void)informOfOutgoingMessageWithMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5;
- (void)informOfScheduledMessageSendWithMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5;
- (void)informOfTriggeredScheduledMessageSendWithMessage:(id)a3;
- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 completion:(id)a6;
- (void)shouldShowKeyboardSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5;
- (void)shouldShowTipKitSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5;
@end

@implementation IMSafetyMonitorCoordinator_Impl

+ (IMSafetyMonitorCoordinator_Impl)sharedCoordinator
{
  if (qword_1EB4A5698 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB4A5688;

  return (IMSafetyMonitorCoordinator_Impl *)v2;
}

- (IMSafetyMonitorCoordinator_Impl)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMSafetyMonitorCoordinator_Impl_currentBestEstimates) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SafetyMonitorCoordinator();
  v2 = [(IMSafetyMonitorCoordinator_Impl *)&v4 init];
  sub_1A08EB45C();

  return v2;
}

- (NSString)appPayloadID
{
  sub_1A09F3E18();
  swift_bridgeObjectRetain();
  sub_1A09F3EA8();
  swift_bridgeObjectRelease();
  v2 = (void *)sub_1A09F3DE8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSDictionary)appPayload
{
  sub_1A08D7A5C((uint64_t)&unk_1EF2BDD80);
  v2 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (BOOL)shouldDisallowBasedOnRegulatoryDomain
{
  v2 = self;
  char v3 = sub_1A08EB114();

  return v3 & 1;
}

- (void)checkPreferredHandlesCacheForReceiverWith:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = sub_1A09F3E18();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v10;
  v15[6] = v12;
  v15[7] = sub_1A08F1B38;
  v15[8] = v13;
  v16 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A08EA764((uint64_t)v8, (uint64_t)&unk_1E94FB9E8, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)checkPreferredHandlesCacheForInitiatorHandleID:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  uint64_t v7 = sub_1A07856F8(&qword_1EB4A5650);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a5);
  uint64_t v11 = sub_1A09F3E18();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1A09F3E18();
  uint64_t v16 = v15;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v10;
  uint64_t v18 = sub_1A09F41C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = self;
  v19[5] = v11;
  v19[6] = v13;
  v19[7] = v14;
  v19[8] = v16;
  v19[9] = sub_1A08F1B38;
  v19[10] = v17;
  v20 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A08EA764((uint64_t)v9, (uint64_t)&unk_1E94FB9E0, (uint64_t)v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (BOOL)shouldDropIncomingCheckInMessageWithURL:(id)a3 senderHandle:(id)a4 isFromMe:(BOOL)a5
{
  uint64_t v5 = a5;
  uint64_t v7 = sub_1A09F33A8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A09F3358();
  sub_1A09F3E18();
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_1A09F3308();
  uint64_t v13 = (void *)sub_1A09F3DE8();
  LOBYTE(v5) = IMShouldDropIncomingCheckInMessage(v12, v13, v5);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v5;
}

- (void)informOfOutgoingMessageWithMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  sub_1A08EC624(v8, a4, a5);
}

- (void)informOfIncomingMessageWithMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A08EC6C8(v4);
}

- (void)informOfDeletedMessagesWithMessages:(id)a3
{
  sub_1A078231C(0, (unint64_t *)&qword_1E94F9288);
  unint64_t v4 = sub_1A09F4078();
  uint64_t v5 = self;
  sub_1A08ECB88(v4);

  swift_bridgeObjectRelease();
}

- (void)informOfDeletedConversationWithReceiverHandles:(id)a3
{
  if (*(void *)(sub_1A09F4078() + 16))
  {
    unint64_t v4 = self;
    id v5 = (id)sub_1A09F4068();
    IMInformSafetyMonitorManagerOfDeletedConversation(v5);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)informOfScheduledMessageSendWithMessage:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  sub_1A08ED36C(v8, a4, a5);
}

- (void)informOfCancelledScheduledMessageSendWithMessageGUID:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = self;
  if (a5)
  {
    id v10 = a5;
    uint64_t v11 = (void *)sub_1A09F3248();
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  IMInformSafetyMonitorManagerOfScheduledSendCancelledFor(v8, v6, v11);
}

- (void)informOfTriggeredScheduledMessageSendWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A08F1240(v4);
}

- (void)shouldShowKeyboardSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  BOOL v6 = _Block_copy(a5);
  sub_1A09F3E18();
  sub_1A09F3E18();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = self;
  id v9 = (void *)sub_1A09F3DE8();
  id v10 = (void *)sub_1A09F3DE8();
  v12[4] = sub_1A08F1B38;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1A08ED9EC;
  v12[3] = &unk_1EF2BE710;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  IMShouldShowKeyboardSuggestionsForCheckIn(v9, v10, v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)shouldShowTipKitSuggestionForInitiator:(id)a3 andReceiver:(id)a4 completion:(id)a5
{
  BOOL v6 = _Block_copy(a5);
  sub_1A09F3E18();
  sub_1A09F3E18();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = self;
  id v9 = (void *)sub_1A09F3DE8();
  id v10 = (void *)sub_1A09F3DE8();
  v12[4] = sub_1A08F18DC;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1A08ED9EC;
  v12[3] = &unk_1EF2BE6C0;
  uint64_t v11 = _Block_copy(v12);
  swift_retain();
  swift_release();
  IMShouldShowTipKitSuggestionsForCheckIn(v9, v10, v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (int64_t)notificationContentForInitiator:(id)a3 messageURL:(id)a4 content:(id)a5
{
  sub_1A09F3E18();
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  uint64_t v11 = (void *)sub_1A09F3DE8();
  int64_t v12 = IMPopulateNotificationUserInfoForCheckIn(v9, v11, v8);

  swift_bridgeObjectRelease();
  return v12;
}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v7 = _Block_copy(a6);
  sub_1A09F3E18();
  sub_1A09F3E18();
  sub_1A09F3E18();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = self;
  id v10 = (void *)sub_1A09F3DE8();
  uint64_t v11 = (void *)sub_1A09F3DE8();
  int64_t v12 = (void *)sub_1A09F3DE8();
  v14[4] = sub_1A08F18D4;
  v14[5] = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1107296256;
  v14[2] = sub_1A08EE024;
  v14[3] = &unk_1EF2BE648;
  uint64_t v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  IMRespondToNotificationWithIdentifier(v10, v11, v12, v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)informOfChangedGroupMembershipWithGroupID:(id)a3
{
}

- (void)informOfKickFromGroupWithGroupID:(id)a3
{
}

- (void)informOfChangedGroupDisplayNameWithGroupID:(id)a3
{
}

- (void)informOfChangedGroupPhotoWithGroupID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end