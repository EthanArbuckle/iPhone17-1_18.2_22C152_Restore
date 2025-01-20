@interface SURLSessionViewModel
- (_TtC13FTMInternal_420SURLSessionViewModel)init;
- (void)slicingDescriptorsDidUpdate:(id)a3 withDescriptors:(id)a4 appInfo:(id)a5 andStatus:(BOOL)a6;
- (void)slicingRunningAppStateChanged:(id)a3;
@end

@implementation SURLSessionViewModel

- (_TtC13FTMInternal_420SURLSessionViewModel)init
{
  result = (_TtC13FTMInternal_420SURLSessionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel__model;
  uint64_t v4 = sub_100157064(&qword_1002DC2A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FTMInternal_420SURLSessionViewModel_coreTelephonyService);
}

- (void)slicingDescriptorsDidUpdate:(id)a3 withDescriptors:(id)a4 appInfo:(id)a5 andStatus:(BOOL)a6
{
  sub_100167598(0, &qword_1002DC298);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  sub_10020C9EC(v8, v9, v11);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)slicingRunningAppStateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10020CC6C(v4);
}

@end