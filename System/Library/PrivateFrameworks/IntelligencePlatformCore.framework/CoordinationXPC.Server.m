@interface CoordinationXPC.Server
- (_TtCC24IntelligencePlatformCore15CoordinationXPC6Server)init;
- (void)graphUpdatedWithSource:(id)a3 completion:(id)a4;
- (void)migrateViewDatabasesWithCompletion:(id)a3;
- (void)sourceUpdatedWithSourceType:(id)a3 sourceIdentifier:(id)a4 completion:(id)a5;
- (void)streamUpdatedWithStreamName:(id)a3 isDelete:(BOOL)a4 completion:(id)a5;
- (void)streamsChangedWithUpdated:(id)a3 deletes:(id)a4 completion:(id)a5;
@end

@implementation CoordinationXPC.Server

- (void)graphUpdatedWithSource:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = sub_1C7925E60();
    a3 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_copy(v6);
  v9 = self;
  sub_1C6FC5390(v7, (unint64_t)a3, (uint64_t)v9, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)sourceUpdatedWithSourceType:(id)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1C7925E60();
  unint64_t v9 = v8;
  uint64_t v10 = sub_1C7925E60();
  unint64_t v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_1C6FC59DC(v7, v9, v10, v12, (uint64_t)v13, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)streamUpdatedWithStreamName:(id)a3 isDelete:(BOOL)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1C7925E60();
  uint64_t v10 = v9;
  _Block_copy(v7);
  unint64_t v11 = self;
  sub_1C6FC60FC(v8, v10, a4, (uint64_t)v11, v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)streamsChangedWithUpdated:(id)a3 deletes:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_1C7926390();
  uint64_t v8 = sub_1C7926390();
  _Block_copy(v6);
  unint64_t v9 = self;
  sub_1C6FC6754(v7, v8, (uint64_t)v9, v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)migrateViewDatabasesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1C6FC6D34((uint64_t)v5, v4);
  _Block_release(v4);
}

- (_TtCC24IntelligencePlatformCore15CoordinationXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore15CoordinationXPC6Server *)CoordinationXPC.Server.init()();
}

@end