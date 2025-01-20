@interface PeriodicFPCK
- (void)saveCheckpointWithReport:(id)a3;
- (void)sendDiagnosticsForItemIDs:(id)a3;
- (void)shouldPauseWithCompletion:(id)a3;
@end

@implementation PeriodicFPCK

- (void)sendDiagnosticsForItemIDs:(id)a3
{
  uint64_t v5 = sub_10002B7CC(&qword_100AD6540);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  swift_retain();
  uint64_t v9 = sub_10096AF60();
  unint64_t v11 = v10;

  uint64_t v12 = sub_10096C270();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = v9;
  v13[6] = v11;
  swift_retain();
  sub_10001EBB0(v9, v11);
  sub_10030E7D8((uint64_t)v7, (uint64_t)&unk_100ADAAD0, (uint64_t)v13);
  swift_release();
  sub_10001E9C0(v9, v11);
  swift_release();
}

- (void)shouldPauseWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  _Block_copy(v3);
  uint64_t v4 = swift_retain();
  sub_10070B7B4(v4, (uint64_t)v3);
  _Block_release(v3);
  _Block_release(v3);

  swift_release();
}

- (void)saveCheckpointWithReport:(id)a3
{
  v3 = *(void (**)(id))&self->saveCheckpoint[13];
  id v4 = a3;
  swift_retain();
  v3(v4);

  swift_release();
}

@end