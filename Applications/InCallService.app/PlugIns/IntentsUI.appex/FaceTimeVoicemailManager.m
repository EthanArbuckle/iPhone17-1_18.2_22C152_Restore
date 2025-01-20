@interface FaceTimeVoicemailManager
- (BOOL)isTranscriptionEnabled;
- (VMVoicemailManager)vmdVoiceMailManager;
- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4;
- (void)deleteVoicemails:(id)a3;
- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4;
- (void)markVoicemailsAsRead:(id)a3;
- (void)messageStoreDidAddMessages:(id)a3;
- (void)messageStoreDidDeleteMessages:(id)a3;
- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3;
- (void)messageStoreDidReconnect;
- (void)messageStoreDidUpdateMessages:(id)a3;
- (void)messageStoreRequiresRefetch;
- (void)messagesPassingTest:(id)a3 completion:;
- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4;
- (void)removeVoicemailsFromTrash:(id)a3;
- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3;
- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4;
- (void)trashVoicemails:(id)a3;
- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4;
@end

@implementation FaceTimeVoicemailManager

- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A1B88;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A1B90;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1B98, (uint64_t)v14);
  swift_release();
}

- (void)messageStoreDidAddMessages:(id)a3
{
}

- (void)messageStoreDidUpdateMessages:(id)a3
{
}

- (void)messageStoreDidDeleteMessages:(id)a3
{
}

- (void)messageStoreDidDeleteMessagesWithUUIDs:(id)a3
{
}

- (void)messageStoreDidReconnect
{
}

- (void)messageStoreRequiresRefetch
{
}

- (BOOL)isTranscriptionEnabled
{
  return 1;
}

- (VMVoicemailManager)vmdVoiceMailManager
{
  return (VMVoicemailManager *)0;
}

- (void)requestInitialStateIfNecessaryAndSendNotifications:(BOOL)a3
{
  if (a3)
  {
    swift_retain();
    sub_1000488EC(0, 3);
    swift_release();
  }
}

- (void)deleteVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A1A48;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A1A50;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1A58, (uint64_t)v14);
  swift_release();
}

- (void)markVoicemailsAsRead:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A1A28;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A1A30;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1A38, (uint64_t)v14);
  swift_release();
}

- (void)trashVoicemails:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A1A08;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A1A10;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1A18, (uint64_t)v14);
  swift_release();
}

- (void)removeVoicemailsFromTrash:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A19E8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A19F0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A19F8, (uint64_t)v14);
  swift_release();
}

- (void)messagesPassingTest:(id)a3 completion:
{
  v4 = v3;
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a3);
  v11 = _Block_copy(v4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v10;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000A19B8;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000A15A0;
  v15[5] = v14;
  swift_retain();
  sub_100054044((uint64_t)v9, (uint64_t)&unk_1000A1418, (uint64_t)v15);
  swift_release();
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