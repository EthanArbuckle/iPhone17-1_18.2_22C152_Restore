@interface TextAnimator
- (NSDictionary)configuration;
- (NSString)fromPhase;
- (NSString)toPhase;
- (_NSTextAnimation)animation;
- (_NSTextAnimatorStateSnapshot)stateSnapshot;
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator)init;
- (double)duration;
- (double)nextAnimationTriggerDelay;
- (int64_t)state;
- (void)cancel;
- (void)invalidate;
- (void)pause;
- (void)resume;
- (void)setConfiguration:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateSnapshot:(id)a3;
- (void)setToPhase:(id)a3;
- (void)start;
- (void)startWithDuration:(double)a3;
@end

@implementation TextAnimator

- (int64_t)state
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator_state);
}

- (void)setState:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator_state) = (Class)a3;
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator)init
{
  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator_textAnimation));
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)start
{
  v2 = self;
  TextAnimator.start()();
}

- (void)startWithDuration:(double)a3
{
  v4 = self;
  TextAnimator.start(duration:)(a3);
}

- (void)pause
{
  v2 = self;
  TextAnimator.pause()();
}

- (void)resume
{
  v2 = self;
  TextAnimator.resume()();
}

- (void)invalidate
{
  v2 = self;
  TextAnimator.invalidate()();
}

- (_NSTextAnimation)animation
{
  return (_NSTextAnimation *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator_textAnimation));
}

- (double)duration
{
  v2 = self;
  double v3 = TextAnimator.duration.getter();

  return v3;
}

- (NSString)toPhase
{
  v2 = self;
  double v3 = (void *)TextAnimator.toPhase.getter();

  return (NSString *)v3;
}

- (void)setToPhase:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator__phase);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NSString)fromPhase
{
  v2 = self;
  double v3 = (void *)TextAnimator.fromPhase.getter();

  return (NSString *)v3;
}

- (NSDictionary)configuration
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator__configuration))
  {
    swift_bridgeObjectRetain();
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (swift_weakLoadStrong()) {
      swift_release();
    }
    v2.super.isa = 0;
  }

  return (NSDictionary *)v2.super.isa;
}

- (void)setConfiguration:(id)a3
{
  if (a3) {
    uint64_t v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D412TextAnimator__configuration) = v4;

  swift_bridgeObjectRelease();
}

- (_NSTextAnimatorStateSnapshot)stateSnapshot
{
  NSDictionary v2 = self;
  double v3 = (void *)TextAnimator.stateSnapshot.getter();

  return (_NSTextAnimatorStateSnapshot *)v3;
}

- (void)setStateSnapshot:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  TextAnimator.stateSnapshot.setter((uint64_t)a3);
}

- (double)nextAnimationTriggerDelay
{
  NSDictionary v2 = self;
  double v3 = TextAnimator.nextAnimationTriggerDelay.getter();

  return v3;
}

- (void)cancel
{
  NSDictionary v2 = self;
  TextAnimator.cancel()();
}

@end