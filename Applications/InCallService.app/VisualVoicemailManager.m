@interface VisualVoicemailManager
- (BOOL)isTranscriptionEnabled;
- (VMVoicemailManager)vmdVoiceMailManager;
- (_TtC13InCallService22VisualVoicemailManager)init;
- (_TtC13InCallService22VisualVoicemailManager)initWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4;
- (void)accountsDidChange;
- (void)capabilitiesDidChange;
- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4;
- (void)deleteVoicemails:(id)a3;
- (void)fetchMessagesWithCompletion:(id)a3;
- (void)handleVoiceMailsChangedNotificationWithNotification:(id)a3;
- (void)managerStorageUsageDidChange;
- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4;
- (void)markVoicemailsAsRead:(id)a3;
- (void)messagesPassingTest:(id)a3 completion:;
- (void)onlineStatusDidChange;
- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4;
- (void)removeVoicemailsFromTrash:(id)a3;
- (void)subscriptionStateStatusDidChange;
- (void)syncInProgresDidChange;
- (void)transcribingStatusDidChange;
- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4;
- (void)trashVoicemails:(id)a3;
- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4;
- (void)voicemailsDidChangeInitial:(BOOL)a3 added:(id)a4 deleted:(id)a5 updated:(id)a6;
@end

@implementation VisualVoicemailManager

- (BOOL)isTranscriptionEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_100119CF8();

  return v3 & 1;
}

- (VMVoicemailManager)vmdVoiceMailManager
{
  v2 = sub_100119D58();

  return (VMVoicemailManager *)v2;
}

- (_TtC13InCallService22VisualVoicemailManager)initWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC13InCallService22VisualVoicemailManager *)sub_100119D88(a3, (uint64_t)sub_10011F72C, v6);
}

- (void)fetchMessagesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  uint64_t v6 = self;

  sub_1001BB654((uint64_t)&unk_100320CD8, v5);
}

- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4
{
}

- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4
{
}

- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4
{
}

- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4
{
}

- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4
{
}

- (void)messagesPassingTest:(id)a3 completion:
{
  v4 = v3;
  uint64_t v6 = _Block_copy(a3);
  v7 = _Block_copy(v4);
  v8 = (void *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v7;
  v8[4] = self;
  v9 = self;

  sub_1001BB654((uint64_t)&unk_100320C60, (uint64_t)v8);
}

- (_TtC13InCallService22VisualVoicemailManager)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService22VisualVoicemailManager_visualVoicemailManager));
  swift_release();

  swift_release();
}

- (void)handleVoiceMailsChangedNotificationWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_10011C9B4((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)voicemailsDidChangeInitial:(BOOL)a3 added:(id)a4 deleted:(id)a5 updated:(id)a6
{
  unint64_t v8 = (unint64_t)a4;
  BOOL v9 = a3;
  if (a4)
  {
    sub_10011EC80();
    unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a5)
  {
    sub_10011EC80();
    a5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a6)
  {
    sub_10011EC80();
    a6 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v11 = self;
  sub_10011CD28(v9, v8, (unint64_t)a5, (unint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)onlineStatusDidChange
{
  v2 = self;
  sub_10011D39C("%s observed voicemailsDidChange");
}

- (void)capabilitiesDidChange
{
  v2 = self;
  sub_10011D39C("%s observed capabilitiesDidChange");
}

- (void)subscriptionStateStatusDidChange
{
  v2 = self;
  sub_10011D39C("%s observed subscriptionStatusDidChange");
}

- (void)syncInProgresDidChange
{
  v2 = self;
  sub_10011D39C("%s observed syncInProgressDidChnage");
}

- (void)managerStorageUsageDidChange
{
  v2 = self;
  sub_10011D39C("%s observed manageStorageUsageDidChange");
}

- (void)transcribingStatusDidChange
{
  v2 = self;
  sub_10011D39C("%s observed transcribingStatusDidChange");
}

- (void)accountsDidChange
{
  v2 = self;
  sub_10011D39C("%s observed accountsDidChange");
}

- (void)deleteVoicemails:(id)a3
{
}

- (void)markVoicemailsAsRead:(id)a3
{
}

- (void)trashVoicemails:(id)a3
{
}

- (void)removeVoicemailsFromTrash:(id)a3
{
}

@end