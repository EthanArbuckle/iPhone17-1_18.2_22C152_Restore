@interface ServerConnection
- (_TtC18AccessoryDataFetch16ServerConnection)init;
- (_TtC18AccessoryDataFetch16ServerConnection)initWithEnv:(int64_t)a3 version:(id)a4;
- (void)fetchCalDataWithRecId:(id)a3 keyhash:(id)a4 completion:(id)a5;
- (void)fetchUserInfoWithCompletion:(id)a3;
@end

@implementation ServerConnection

- (_TtC18AccessoryDataFetch16ServerConnection)initWithEnv:(int64_t)a3 version:(id)a4
{
  return (_TtC18AccessoryDataFetch16ServerConnection *)sub_1000077D0(a3);
}

- (void)fetchCalDataWithRecId:(id)a3 keyhash:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  uint64_t v7 = sub_10001CE50();
  unint64_t v9 = v8;
  uint64_t v10 = sub_10001CE50();
  unint64_t v12 = v11;
  _Block_copy(v6);
  v13 = self;
  sub_10000BCD4(v7, v9, v10, v12, (char *)v13, (void (**)(const void *, uint64_t, NSString, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)fetchUserInfoWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AccessoryDataFetch16ServerConnection_container);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = sub_10000B3F0;
  v7[3] = v5;
  v7[4] = self;
  v10[4] = sub_10000B3FC;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10000B054;
  v10[3] = &unk_100024E90;
  unint64_t v8 = _Block_copy(v10);
  unint64_t v9 = self;
  swift_retain();
  swift_release();
  [v6 fetchUserRecordIDWithCompletionHandler:v8];
  _Block_release(v8);

  swift_release();
}

- (_TtC18AccessoryDataFetch16ServerConnection)init
{
  result = (_TtC18AccessoryDataFetch16ServerConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18AccessoryDataFetch16ServerConnection_container);
}

@end