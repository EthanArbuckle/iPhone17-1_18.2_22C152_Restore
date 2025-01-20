@interface VisualVoicemailManager
- (BOOL)isTranscriptionEnabled;
- (VMVoicemailManager)vmdVoiceMailManager;
- (_TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager)init;
- (_TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager)initWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4;
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
  return [*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager) isTranscriptionEnabled];
}

- (VMVoicemailManager)vmdVoiceMailManager
{
  return (VMVoicemailManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager));
}

- (_TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager)initWithVisualVoicemailManager:(id)a3 onVoicemailsChanged:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager *)sub_10003A6E0(a3, (uint64_t)sub_100039CDC, v6);
}

- (void)fetchMessagesWithCompletion:(id)a3
{
  uint64_t v5 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100069528;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100069530;
  v12[5] = v11;
  v13 = self;
  sub_10003F63C((uint64_t)v7, (uint64_t)&unk_100069538, (uint64_t)v12);
  swift_release();
}

- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100069508;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100069510;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003F63C((uint64_t)v9, (uint64_t)&unk_100069518, (uint64_t)v14);
  swift_release();
}

- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000694E8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000694F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003F63C((uint64_t)v9, (uint64_t)&unk_1000694F8, (uint64_t)v14);
  swift_release();
}

- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000694C8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000694D0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003F63C((uint64_t)v9, (uint64_t)&unk_1000694D8, (uint64_t)v14);
  swift_release();
}

- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000694A8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000694B0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003F63C((uint64_t)v9, (uint64_t)&unk_1000694B8, (uint64_t)v14);
  swift_release();
}

- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100069478;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100069480;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003F63C((uint64_t)v9, (uint64_t)&unk_100069488, (uint64_t)v14);
  swift_release();
}

- (void)messagesPassingTest:(id)a3 completion:
{
  v4 = v3;
  uint64_t v7 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100069430;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100069440;
  v15[5] = v14;
  v16 = self;
  sub_10003F63C((uint64_t)v9, (uint64_t)&unk_100069450, (uint64_t)v15);
  swift_release();
}

- (_TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager)init
{
  result = (_TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager));
  swift_release();

  swift_release();
}

- (void)handleVoiceMailsChangedNotificationWithNotification:(id)a3
{
  uint64_t v4 = sub_100041250();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100041230();
  uint64_t v8 = self;
  sub_10003DDE8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)voicemailsDidChangeInitial:(BOOL)a3 added:(id)a4 deleted:(id)a5 updated:(id)a6
{
  unint64_t v8 = (unint64_t)a4;
  if (a4)
  {
    sub_10003F8BC();
    unint64_t v8 = sub_1000417F0();
  }
  if (a5)
  {
    sub_10003F8BC();
    a5 = (id)sub_1000417F0();
  }
  if (a6)
  {
    sub_10003F8BC();
    a6 = (id)sub_1000417F0();
  }
  v11 = self;
  sub_10003E2A4(a3, v8, (unint64_t)a5, (unint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)onlineStatusDidChange
{
  v2 = self;
  sub_10003EA24("%s observed voicemailsDidChange");
}

- (void)capabilitiesDidChange
{
  v2 = self;
  sub_10003EA24("%s observed capabilitiesDidChange");
}

- (void)subscriptionStateStatusDidChange
{
  v2 = self;
  sub_10003EA24("%s observed subscriptionStatusDidChange");
}

- (void)syncInProgresDidChange
{
  v2 = self;
  sub_10003EA24("%s observed syncInProgressDidChnage");
}

- (void)managerStorageUsageDidChange
{
  v2 = self;
  sub_10003EA24("%s observed manageStorageUsageDidChange");
}

- (void)transcribingStatusDidChange
{
  v2 = self;
  sub_10003EA24("%s observed transcribingStatusDidChange");
}

- (void)accountsDidChange
{
  v2 = self;
  sub_10003EA24("%s observed accountsDidChange");
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