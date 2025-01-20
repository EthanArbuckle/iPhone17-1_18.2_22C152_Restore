@interface FMR1ItemLocalizerContext
- (NSString)description;
- (_TtC11FMFindingUI24FMR1ItemLocalizerContext)init;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)didUpdateDevicePose:(id)a3;
- (void)didUpdateItemPosition:(id)a3;
- (void)didUpdateRangeEstimate:(id)a3;
- (void)itemChangedState:(unint64_t)a3;
- (void)itemLocalizerChangedActivity:(unint64_t)a3;
- (void)itemLocalizerChangedState:(unint64_t)a3;
- (void)pathIsDegenerate:(id)a3;
- (void)willIntegrateDevicePose:(id)a3;
- (void)willIntegrateProximity:(id)a3;
@end

@implementation FMR1ItemLocalizerContext

- (NSString)description
{
  v2 = self;
  sub_24D2E9B48();

  v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  v2 = self;
  sub_24D2E9DE8((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  sub_24D2B6E58((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI24FMR1ItemLocalizerContext_findable);

  swift_release();
  swift_bridgeObjectRelease();
  sub_24D2E44C8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11FMFindingUI24FMR1ItemLocalizerContext_incrementItemLocalizerHandler));
  sub_24D2E44C8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11FMFindingUI24FMR1ItemLocalizerContext_decrementItemLocalizerHandler));
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11FMFindingUI24FMR1ItemLocalizerContext_itemLocalizer);
}

- (void)willIntegrateProximity:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D2E9ED4((uint64_t)v4);
}

- (void)willIntegrateDevicePose:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D2EA0C4((uint64_t)v4);
}

- (void)itemLocalizerChangedState:(unint64_t)a3
{
  id v4 = self;
  sub_24D2EA2B4(a3);
}

- (void)itemLocalizerChangedActivity:(unint64_t)a3
{
  id v4 = self;
  sub_24D2EA73C(a3);
}

- (void)itemChangedState:(unint64_t)a3
{
  id v4 = self;
  sub_24D2EAB54(a3);
}

- (void)didUpdateRangeEstimate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D2EB294(v4);
}

- (void)didUpdateItemPosition:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_24D2EB79C((uint64_t)a3);
}

- (void)didUpdateDevicePose:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_24D2EB990((uint64_t)v4);
}

- (void)pathIsDegenerate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_24D2EBB80(v4);
}

- (void)didFailWithError:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_24D2EBF84(v5);
}

- (_TtC11FMFindingUI24FMR1ItemLocalizerContext)init
{
  result = (_TtC11FMFindingUI24FMR1ItemLocalizerContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end