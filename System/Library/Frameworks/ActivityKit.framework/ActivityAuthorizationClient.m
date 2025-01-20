@interface ActivityAuthorizationClient
- (_TtC11ActivityKit27ActivityAuthorizationClient)init;
- (void)activityAuthorizationDidChangeWithOptions:(id)a3;
- (void)activityAuthorizationLevelDidChangeForBundleIdentifier:(id)a3 authorizationCount:(id)a4;
- (void)frequentUpdatesAuthorizationDidChangeWithOptions:(id)a3;
@end

@implementation ActivityAuthorizationClient

- (_TtC11ActivityKit27ActivityAuthorizationClient)init
{
  return (_TtC11ActivityKit27ActivityAuthorizationClient *)sub_242F612E0();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)activityAuthorizationLevelDidChangeForBundleIdentifier:(id)a3 authorizationCount:(id)a4
{
  uint64_t v6 = sub_242FDC0D0();
  uint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  sub_242F64390(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)activityAuthorizationDidChangeWithOptions:(id)a3
{
  id v4 = a3;
  id v9 = self;
  uint64_t v5 = sub_242FDBBF0();
  unint64_t v7 = v6;

  uint64_t v8 = (void *)sub_242FDBBD0();
  sub_242F5F7E8((uint64_t)v8, &v10);

  sub_242F649C4();
  sub_242F26068(v5, v7);
}

- (void)frequentUpdatesAuthorizationDidChangeWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  uint64_t v5 = sub_242FDBBF0();
  unint64_t v7 = v6;

  sub_242F64BA4();
  sub_242F26068(v5, v7);
}

@end