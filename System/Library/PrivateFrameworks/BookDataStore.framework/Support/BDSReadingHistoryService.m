@interface BDSReadingHistoryService
- (BDSReadingHistoryService)init;
- (BDSReadingHistoryService)initWithReadingGoalsService:(id)a3 transactionProvider:(id)a4 viewStateChangeHandler:(id)a5;
- (id)serviceStatusInfo;
- (void)backupWithName:(NSString *)a3 completionHandler:(id)a4;
- (void)bookWidgetReadingHistoryStateInfoWithCompletionHandler:(id)a3;
- (void)clearDataWithCompletionHandler:(id)a3;
- (void)clearDate:(id)a3 completionHandler:(id)a4;
- (void)clearDefaultsCachedDataWithCompletionHandler:(id)a3;
- (void)clearTodayWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)handlePlaceholderStreakDayGoalNeedsUpdate:(id)a3;
- (void)handleSignificantDateChange:(id)a3;
- (void)handleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completionHandler:(id)a5;
- (void)incrementWithDate:(id)a3 by:(int64_t)a4 completionHandler:(id)a5;
- (void)listBackupWithCompletionHandler:(id)a3;
- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3;
- (void)readingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 completionHandler:(id)a6;
- (void)restoreWithName:(NSString *)a3 completionHandler:(id)a4;
- (void)setEnableCloudSync:(BOOL)a3;
@end

@implementation BDSReadingHistoryService

- (BDSReadingHistoryService)initWithReadingGoalsService:(id)a3 transactionProvider:(id)a4 viewStateChangeHandler:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (BDSReadingHistoryService *)ReadingHistoryService.init(readingGoalsService:transactionProvider:viewStateChangeHandler:)(v7, (uint64_t)a4, (uint64_t)a5);
}

- (void)dealloc
{
  v2 = self;
  ReadingHistoryService.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)clearDataWithCompletionHandler:(id)a3
{
}

- (void)clearDefaultsCachedDataWithCompletionHandler:(id)a3
{
}

- (void)clearDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = sub_1001EB0C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_1001EB0A0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  ReadingHistoryService.clearDate(_:completionHandler:)((uint64_t)v9, (uint64_t)sub_1000F33D0, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)clearTodayWithCompletionHandler:(id)a3
{
}

- (void)handleSyncFileChangeWithSyncVersionInfo:(id)a3 updateInfo:(id)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10007DC14((uint64_t *)&unk_100293160);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  if (!a3)
  {
    uint64_t v17 = type metadata accessor for CRDTModelSyncVersion();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v11, 1, 1, v17);
    id v18 = a4;
    v19 = self;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = 0;
    goto LABEL_6;
  }
  id v14 = a4;
  v15 = self;
  static CRDTModelSyncVersion.fromInfo(_:)(a3, (uint64_t)v11);
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  id v16 = [a4 update];
LABEL_6:
  ReadingHistoryService.handleSyncFileChange(syncVersion:update:completionHandler:)((uint64_t)v11, v16, (uint64_t)sub_1000F33D0, v13);

  sub_1000816A4((uint64_t)v11, (uint64_t *)&unk_100293160);
  swift_release();
}

- (void)incrementWithDate:(id)a3 by:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = sub_1001EB0C0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_1001EB0A0();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = self;
  ReadingHistoryService.increment(date:by:completionHandler:)((uint64_t)v11, a4, (uint64_t)sub_1000F0BA4, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)readingHistoryStateInfoWithRangeStart:(id)a3 rangeEnd:(id)a4 currentTime:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = sub_1001EB0C0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v22 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v22 - v16;
  id v18 = _Block_copy(a6);
  sub_1001EB0A0();
  sub_1001EB0A0();
  sub_1001EB0A0();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  uint64_t v20 = self;
  ReadingHistoryService.readingHistoryStateInfo(rangeStart:rangeEnd:currentTime:completionHandler:)((uint64_t)v17, (uint64_t)v15, (uint64_t)v12, (uint64_t)sub_1000F0B88, v19);

  swift_release();
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v12, v8);
  v21(v15, v8);
  v21(v17, v8);
}

- (void)setEnableCloudSync:(BOOL)a3
{
  v4 = self;
  ReadingHistoryService.setEnableCloudSync(_:)(a3);
}

- (id)serviceStatusInfo
{
  id v3 = objc_allocWithZone((Class)BDSReadingHistoryServiceStatusInfo);
  v4 = self;
  id v5 = [v3 initWithIsLoaded:1];
  sub_1001EC910();
  if (qword_1002910E8 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_100293A68;
  sub_10007DC14((uint64_t *)&unk_100291A20);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100215320;
  *(void *)(v7 + 56) = sub_100081668(0, (unint64_t *)&unk_100293170);
  *(void *)(v7 + 64) = sub_1000EFCBC((unint64_t *)&qword_100291A30, (unint64_t *)&unk_100293170);
  *(void *)(v7 + 32) = v5;
  id v8 = v6;
  id v9 = v5;
  sub_1001EB530();

  swift_bridgeObjectRelease();
  return v9;
}

- (void)handlePlaceholderStreakDayGoalNeedsUpdate:(id)a3
{
  uint64_t v4 = sub_1001EACA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001EAC80();
  id v8 = self;
  sub_1000E3E0C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)handleSignificantDateChange:(id)a3
{
  uint64_t v4 = sub_1001EACA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001EAC80();
  id v8 = self;
  sub_1000E4264();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)bookWidgetReadingHistoryStateInfoWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100293398;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002933A0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_1002933A8, (uint64_t)v12);
  swift_release();
}

- (BDSReadingHistoryService)init
{
  result = (BDSReadingHistoryService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)mergeMovedReadingHistoryDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100293378;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100293380;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100293388, (uint64_t)v12);
  swift_release();
}

- (void)backupWithName:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100293358;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100293360;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100293368, (uint64_t)v14);
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
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100293338;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100293340;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100293348, (uint64_t)v12);
  swift_release();
}

- (void)restoreWithName:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100293328;
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