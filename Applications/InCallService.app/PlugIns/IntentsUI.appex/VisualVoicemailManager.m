@interface VisualVoicemailManager
- (BOOL)isTranscriptionEnabled;
- (VMVoicemailManager)vmdVoiceMailManager;
- (_TtC9IntentsUI22VisualVoicemailManager)init;
- (_TtC9IntentsUI22VisualVoicemailManager)initWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4;
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
- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3;
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
  return [*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager) isTranscriptionEnabled];
}

- (VMVoicemailManager)vmdVoiceMailManager
{
  return (VMVoicemailManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager));
}

- (_TtC9IntentsUI22VisualVoicemailManager)initWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC9IntentsUI22VisualVoicemailManager *)sub_100040DE0(a3, (uint64_t)sub_100046494, v6);
}

- (void)fetchMessagesWithCompletion:(id)a3
{
  uint64_t v5 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000A1670;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1000A1678;
  v12[5] = v11;
  v13 = self;
  sub_100054044((uint64_t)v7, (uint64_t)&unk_1000A1680, (uint64_t)v12);
  swift_release();
}

- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A1650;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A1658;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1660, (uint64_t)v14);
  swift_release();
}

- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A1630;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A1638;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1640, (uint64_t)v14);
  swift_release();
}

- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A1610;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A1618;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1620, (uint64_t)v14);
  swift_release();
}

- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A15F0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A15F8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1600, (uint64_t)v14);
  swift_release();
}

- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A15C0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A15C8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A15D0, (uint64_t)v14);
  swift_release();
}

- (void)messagesPassingTest:(id)a3 completion:
{
  v4 = v3;
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A1598;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000A15A0;
  v15[5] = v14;
  v16 = self;
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1418, (uint64_t)v15);
  swift_release();
}

- (_TtC9IntentsUI22VisualVoicemailManager)init
{
  result = (_TtC9IntentsUI22VisualVoicemailManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager));
  swift_release();

  swift_release();
}

- (void)handleVoiceMailsChangedNotificationWithNotification:(id)a3
{
  uint64_t v4 = sub_100061C90();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100061C70();
  uint64_t v8 = self;
  sub_100044520((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)voicemailsDidChangeInitial:(BOOL)a3 added:(id)a4 deleted:(id)a5 updated:(id)a6
{
  unint64_t v8 = (unint64_t)a4;
  if (a4)
  {
    sub_100045950();
    unint64_t v8 = sub_100062380();
  }
  if (a5)
  {
    sub_100045950();
    a5 = (id)sub_100062380();
  }
  if (a6)
  {
    sub_100045950();
    a6 = (id)sub_100062380();
  }
  v11 = self;
  sub_1000449DC(a3, v8, (unint64_t)a5, (unint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)onlineStatusDidChange
{
  v2 = self;
  sub_10004515C("%s observed voicemailsDidChange");
}

- (void)capabilitiesDidChange
{
  v2 = self;
  sub_10004515C("%s observed capabilitiesDidChange");
}

- (void)subscriptionStateStatusDidChange
{
  v2 = self;
  sub_10004515C("%s observed subscriptionStatusDidChange");
}

- (void)syncInProgresDidChange
{
  v2 = self;
  sub_10004515C("%s observed syncInProgressDidChnage");
}

- (void)managerStorageUsageDidChange
{
  v2 = self;
  sub_10004515C("%s observed manageStorageUsageDidChange");
}

- (void)transcribingStatusDidChange
{
  v2 = self;
  sub_10004515C("%s observed transcribingStatusDidChange");
}

- (void)accountsDidChange
{
  v2 = self;
  sub_10004515C("%s observed accountsDidChange");
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

- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3
{
  uint64_t v5 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_100062410();
  uint64_t v9 = self;
  uint64_t v10 = sub_100062400();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = &protocol witness table for MainActor;
  *(void *)(v11 + 32) = v9;
  *(unsigned char *)(v11 + 40) = a3;
  sub_10005FDB0((uint64_t)v7, (uint64_t)&unk_1000A2058, v11);

  swift_release();
}

@end