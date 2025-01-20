@interface Music_SSMetricsComponentRenderEvent
+ (NSString)Topic;
- (_TtC9MusicCore35Music_SSMetricsComponentRenderEvent)init;
- (_TtC9MusicCore35Music_SSMetricsComponentRenderEvent)initWithBodyDictionary:(id)a3;
- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4;
@end

@implementation Music_SSMetricsComponentRenderEvent

+ (NSString)Topic
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (void)setStandardPropertiesWith:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  Music_SSMetricsComponentRenderEvent.setStandardProperties(with:completionHandler:)(a3, (uint64_t)thunk for @escaping @callee_unowned @convention(block) () -> ()partial apply, v7);

  swift_release();
}

- (_TtC9MusicCore35Music_SSMetricsComponentRenderEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Music_SSMetricsComponentRenderEvent();
  return [(Music_SSMetricsComponentRenderEvent *)&v3 init];
}

- (_TtC9MusicCore35Music_SSMetricsComponentRenderEvent)initWithBodyDictionary:(id)a3
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for Music_SSMetricsComponentRenderEvent();
  v5 = [(Music_SSMetricsComponentRenderEvent *)&v7 initWithBodyDictionary:isa];

  return v5;
}

@end