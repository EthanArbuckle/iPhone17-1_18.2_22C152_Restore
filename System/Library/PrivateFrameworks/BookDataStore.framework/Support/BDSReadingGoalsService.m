@interface BDSReadingGoalsService
- (BDSReadingGoalsService)init;
- (void)changeBooksFinishedGoalTo:(int64_t)a3 completionHandler:(id)a4;
- (void)changeDailyGoalTo:(double)a3 completionHandler:(id)a4;
- (void)clearDataWithCompletionHandler:(id)a3;
- (void)clearLocalCachedDataWithCompletionHandler:(id)a3;
- (void)stateInfoWithCompletionHandler:(id)a3;
@end

@implementation BDSReadingGoalsService

- (BDSReadingGoalsService)init
{
  return (BDSReadingGoalsService *)ReadingGoalsService.init()();
}

- (void)changeBooksFinishedGoalTo:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100292338;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100292340;
  v14[5] = v13;
  v15 = self;
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100292348, (uint64_t)v14);
  swift_release();
}

- (void)changeDailyGoalTo:(double)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(double *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100292318;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100292320;
  v14[5] = v13;
  v15 = self;
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100292328, (uint64_t)v14);
  swift_release();
}

- (void)clearDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002922F8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100292300;
  v12[5] = v11;
  v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100292308, (uint64_t)v12);
  swift_release();
}

- (void)clearLocalCachedDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002922D8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002922E0;
  v12[5] = v11;
  v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_1002922E8, (uint64_t)v12);
  swift_release();
}

- (void)stateInfoWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1002922C8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100291B00;
  v12[5] = v11;
  v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100293860, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end