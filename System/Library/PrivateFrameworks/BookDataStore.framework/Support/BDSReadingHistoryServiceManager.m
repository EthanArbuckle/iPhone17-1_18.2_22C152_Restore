@interface BDSReadingHistoryServiceManager
- (BDSReadingHistoryServiceManager)init;
- (BDSReadingHistoryServiceManager)initWithReadingGoalsService:(id)a3 transactionProvider:(id)a4 viewStateChangeHandler:(id)a5;
- (id)serviceStatusInfo;
- (void)backupWithName:(NSString *)a3 completionHandler:(id)a4;
- (void)bookWidgetReadingHistoryStateInfoWithCompletionHandler:(id)a3;
- (void)clearDataWithCompletionHandler:(id)a3;
- (void)clearDate:(id)a3 completionHandler:(id)a4;
- (void)clearDefaultsCachedDataWithCompletionHandler:(id)a3;
- (void)clearTodayWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)handleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completionHandler:(id)a5;
- (void)incrementWithDate:(id)a3 by:(int64_t)a4 completionHandler:(id)a5;
- (void)listBackupWithCompletionHandler:(id)a3;
- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3;
- (void)readingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 completionHandler:(id)a6;
- (void)restoreWithName:(NSString *)a3 completionHandler:(id)a4;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)transactionDidBeginWithName:(const char *)a3;
- (void)transactionWillEndWithName:(const char *)a3;
@end

@implementation BDSReadingHistoryServiceManager

- (BDSReadingHistoryServiceManager)initWithReadingGoalsService:(id)a3 transactionProvider:(id)a4 viewStateChangeHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  return (BDSReadingHistoryServiceManager *)ReadingHistoryServiceManager.init(readingGoalsService:transactionProvider:viewStateChangeHandler:)(v7, v8, (uint64_t)a5);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_100088564();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(BDSReadingHistoryServiceManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BDSReadingHistoryServiceManager_readingHistoryCloudDataManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BDSReadingHistoryServiceManager_readingHistoryCoherenceContext));
  swift_release();

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BDSReadingHistoryServiceManager__readingHistoryServiceAccessQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___BDSReadingHistoryServiceManager_outstandingTransactionCountAccessQueue));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BDSReadingHistoryServiceManager_teardownServiceTimer);
}

- (void)clearDataWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1001EC910();
  if (qword_1002910E8 != -1) {
    swift_once();
  }
  id v7 = (id)qword_100293A68;
  sub_1001EB530();

  __chkstk_darwin(v8);
  type metadata accessor for ReadingHistoryService();
  sub_1001EC9E0();
  ReadingHistoryService.clearData(completionHandler:)((uint64_t)sub_100093DCC, v5);

  swift_release();
}

- (void)clearDefaultsCachedDataWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1001EC910();
  if (qword_1002910E8 != -1) {
    swift_once();
  }
  id v7 = (id)qword_100293A68;
  sub_1001EB530();

  __chkstk_darwin(v8);
  type metadata accessor for ReadingHistoryService();
  sub_1001EC9E0();
  ReadingHistoryService.clearDefaultsCachedData(completionHandler:)((uint64_t)sub_100093DCC, v5);

  swift_release();
}

- (void)clearDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = sub_1001EB0C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1001EB0A0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_1001EC910();
  if (qword_1002910E8 != -1) {
    swift_once();
  }
  id v13 = (id)qword_100293A68;
  sub_1001EB530();

  __chkstk_darwin(v14);
  v16[-2] = v12;
  type metadata accessor for ReadingHistoryService();
  sub_1001EC9E0();
  v15 = (void *)v16[1];
  ReadingHistoryService.clearDate(_:completionHandler:)((uint64_t)v9, (uint64_t)sub_100093DCC, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)clearTodayWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1001EC910();
  if (qword_1002910E8 != -1) {
    swift_once();
  }
  id v7 = (id)qword_100293A68;
  sub_1001EB530();

  __chkstk_darwin(v8);
  type metadata accessor for ReadingHistoryService();
  sub_1001EC9E0();
  ReadingHistoryService.clearToday(completionHandler:)((uint64_t)sub_100093DCC, v5);

  swift_release();
}

- (void)handleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  ReadingHistoryServiceManager.handleSyncFileChange(syncVersionInfo:updateInfo:completionHandler:)(a3, a4, (uint64_t)sub_100093DCC, v9);

  swift_release();
}

- (void)incrementWithDate:(id)a3 by:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_1001EB0C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_1001EB0A0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = self;
  sub_1001EC910();
  if (qword_1002910E8 != -1) {
    swift_once();
  }
  id v15 = (id)qword_100293A68;
  sub_1001EB530();

  __chkstk_darwin(v16);
  v18[-2] = v14;
  type metadata accessor for ReadingHistoryService();
  sub_1001EC9E0();
  v17 = (void *)v18[1];
  ReadingHistoryService.increment(date:by:completionHandler:)((uint64_t)v11, a4, (uint64_t)sub_10009337C, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)readingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 completionHandler:(id)a6
{
  uint64_t v26 = sub_1001EB0C0();
  uint64_t v8 = *(void *)(v26 - 8);
  uint64_t v9 = __chkstk_darwin(v26);
  id v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v25 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v25 - v15;
  v17 = _Block_copy(a6);
  sub_1001EB0A0();
  sub_1001EB0A0();
  sub_1001EB0A0();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v17;
  v19 = self;
  sub_1001EC910();
  if (qword_1002910E8 != -1) {
    swift_once();
  }
  id v20 = (id)qword_100293A68;
  sub_1001EB530();

  __chkstk_darwin(v21);
  *(&v25 - 2) = (uint64_t)v19;
  type metadata accessor for ReadingHistoryService();
  sub_1001EC9E0();
  v22 = v27;
  ReadingHistoryService.readingHistoryStateInfo(rangeStart:rangeEnd:currentTime:completionHandler:)((uint64_t)v16, (uint64_t)v14, (uint64_t)v11, (uint64_t)sub_100093374, v18);

  swift_release();
  v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v24 = v26;
  v23(v11, v26);
  v23(v14, v24);
  v23(v16, v24);
}

- (id)serviceStatusInfo
{
  v2 = self;
  Class isa = ReadingHistoryServiceManager.serviceStatusInfo()().super.isa;

  return isa;
}

- (void)setEnableCloudSync:(BOOL)a3
{
  v4 = self;
  ReadingHistoryServiceManager.setEnableCloudSync(_:)(a3);
}

- (BDSReadingHistoryServiceManager)init
{
  result = (BDSReadingHistoryServiceManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)transactionDidBeginWithName:(const char *)a3
{
  v4 = self;
  ReadingHistoryServiceManager.transactionDidBegin(withName:)((uint64_t)a3);
}

- (void)transactionWillEndWithName:(const char *)a3
{
  v4 = self;
  ReadingHistoryServiceManager.transactionWillEnd(withName:)((uint64_t)a3);
}

- (void)bookWidgetReadingHistoryStateInfoWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100291B78;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100291B80;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100291B88, (uint64_t)v12);
  swift_release();
}

- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100291B58;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100291B60;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100291B68, (uint64_t)v12);
  swift_release();
}

- (void)backupWithName:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100291B38;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100291B40;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100291B48, (uint64_t)v14);
  swift_release();
}

- (void)listBackupWithCompletionHandler:(id)a3
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
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100291B18;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100291B20;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100291B28, (uint64_t)v12);
  swift_release();
}

- (void)restoreWithName:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100291AF8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100291B00;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100293860, (uint64_t)v14);
  swift_release();
}

@end