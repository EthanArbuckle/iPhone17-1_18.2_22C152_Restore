@interface HNDSpringAnimationFactory
+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5;
- (CAMediaTimingFunction)timingFunction;
- (HNDSpringAnimationFactory)init;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimation;
- (void)setTimingFunction:(id)a3;
@end

@implementation HNDSpringAnimationFactory

- (CAMediaTimingFunction)timingFunction
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HNDSpringAnimationFactory_timingFunction);
  swift_beginAccess();
  return (CAMediaTimingFunction *)*v2;
}

- (void)setTimingFunction:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HNDSpringAnimationFactory_timingFunction);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

+ (id)factoryWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  v8 = (objc_class *)type metadata accessor for SpringAnimationFactory();
  v9 = (char *)objc_allocWithZone(v8);
  *(void *)&v9[OBJC_IVAR___HNDSpringAnimationFactory_timingFunction] = 0;
  *(void *)&v9[OBJC_IVAR___HNDSpringAnimationFactory____lazy_storage___springAnimation] = 0;
  *(double *)&v9[OBJC_IVAR___HNDSpringAnimationFactory_mass] = a3;
  *(double *)&v9[OBJC_IVAR___HNDSpringAnimationFactory_stiffness] = a4;
  *(double *)&v9[OBJC_IVAR___HNDSpringAnimationFactory_damping] = a5;
  v12.receiver = v9;
  v12.super_class = v8;
  id v10 = objc_msgSendSuper2(&v12, "init");

  return v10;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  id v8 = sub_100110D20();

  swift_bridgeObjectRelease();

  return v8;
}

- (id)_timingFunctionForAnimation
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xC0);
  v3 = self;
  id v4 = (id)v2();
  if (!v4)
  {
    static os_log_type_t.info.getter();
    id result = (id)ASTLogCommon();
    if (!result)
    {
      __break(1u);
      return result;
    }
    id v6 = result;
    os_log(_:dso:log:_:_:)();

    id v4 = [objc_allocWithZone((Class)CAMediaTimingFunction) init];
  }
  v7 = v4;

  return v7;
}

- (HNDSpringAnimationFactory)init
{
  id result = (HNDSpringAnimationFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HNDSpringAnimationFactory____lazy_storage___springAnimation);
}

@end