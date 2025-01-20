@interface URLAction
- (_TtC21CloudRecommendationUI9URLAction)init;
- (void)liftUIPresenterDidCancelWithUserInfo:(id)a3;
- (void)liftUIPresenterDidCompleteWithUserInfo:(id)a3;
- (void)liftUIPresenterDidLoadWithSuccess:(BOOL)a3 error:(id)a4;
- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5;
- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4;
@end

@implementation URLAction

- (void)liftUIPresenterDidLoadWithSuccess:(BOOL)a3 error:(id)a4
{
  v5 = self;
  id v6 = a4;
  sub_24A38FCBC(a4);
}

- (void)liftUIPresenterDidCompleteWithUserInfo:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_24A3983A8();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_24A38E954(v4);

  swift_bridgeObjectRelease();
}

- (void)liftUIPresenterDidCancelWithUserInfo:(id)a3
{
  if (a3) {
    sub_24A3983A8();
  }
  uint64_t v4 = self;
  sub_24A38FEC8();

  swift_bridgeObjectRelease();
}

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  v8 = self;
  id v9 = a5;
  sub_24A390038(a5);
}

- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_24A390370(a4);
}

- (_TtC21CloudRecommendationUI9URLAction)init
{
  result = (_TtC21CloudRecommendationUI9URLAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21CloudRecommendationUI9URLAction_activeRecommendation);
}

@end