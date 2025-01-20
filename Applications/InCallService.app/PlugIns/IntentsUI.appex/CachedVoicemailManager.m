@interface CachedVoicemailManager
- (void)fetchMessagesWithCompletion:(id)a3;
- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4;
@end

@implementation CachedVoicemailManager

- (void)fetchMessagesWithCompletion:(id)a3
{
  sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1000A1428;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000A1430;
  v11[5] = v10;
  swift_retain();
  sub_100054044((uint64_t)v6, (uint64_t)&unk_1000A1438, (uint64_t)v11);
  swift_release();
}

- (void)voicemailWithIdentifier:(MPMessageID *)a3 completion:(id)a4
{
  sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1000A1410;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000A15A0;
  v13[5] = v12;
  v14 = a3;
  swift_retain();
  sub_100054044((uint64_t)v8, (uint64_t)&unk_1000A1418, (uint64_t)v13);
  swift_release();
}

@end