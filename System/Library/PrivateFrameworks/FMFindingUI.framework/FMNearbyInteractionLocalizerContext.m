@interface FMNearbyInteractionLocalizerContext
- (BOOL)sessionShouldAttemptRelocalization:(id)a3;
- (NSString)description;
- (_TtC11FMFindingUI35FMNearbyInteractionLocalizerContext)init;
- (void)dealloc;
- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5;
- (void)session:(id)a3 didUpdateAlgorithmConvergence:(id)a4 forObject:(id)a5;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)session:(id)a3 suspendedWithReason:(int64_t)a4;
- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5;
@end

@implementation FMNearbyInteractionLocalizerContext

- (NSString)description
{
  v2 = self;
  sub_24D2DAC2C();

  v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  v2 = self;
  sub_24D2DAECC((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  sub_24D2B6E58((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_findable);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_error));
  sub_24D2E44C8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_incrementNISessionHandler));
  sub_24D2E44C8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_decrementNISessionHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_niConfiguration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_niSession));
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11FMFindingUI35FMNearbyInteractionLocalizerContext_arSession);
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D2DAFC8(v6, v7);
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  sub_24D2BC100(0, &qword_269861368);
  unint64_t v6 = sub_24D39CC10();
  id v7 = a3;
  v8 = self;
  sub_24D2E5044(v6);

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  sub_24D2E5F60(v11, a5, a6);
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  sub_24D2BC100(0, &qword_269861368);
  unint64_t v8 = sub_24D39CC10();
  id v9 = a3;
  id v10 = self;
  sub_24D2E68A8(v8, a5);

  swift_bridgeObjectRelease();
}

- (void)session:(id)a3 didUpdateAlgorithmConvergence:(id)a4 forObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_24D2E6F4C(v9, a5);
}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  id v6 = a3;
  id v7 = self;
  sub_24D2E7E38();
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_24D2E811C();
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_24D2E8358(v8);
}

- (_TtC11FMFindingUI35FMNearbyInteractionLocalizerContext)init
{
  result = (_TtC11FMFindingUI35FMNearbyInteractionLocalizerContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_24D2DFB2C((uint64_t)v6, (uint64_t)v7);
}

- (BOOL)sessionShouldAttemptRelocalization:(id)a3
{
  return 0;
}

@end