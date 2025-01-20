@interface PHCountingLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_TtC11MobilePhone15PHCountingLayer)init;
- (_TtC11MobilePhone15PHCountingLayer)initWithCoder:(id)a3;
- (_TtC11MobilePhone15PHCountingLayer)initWithLayer:(id)a3;
- (id)actionForKey:(id)a3;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation PHCountingLayer

- (int64_t)value
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC11MobilePhone15PHCountingLayer_value);
  swift_beginAccess();
  return *v2;
}

- (void)setValue:(int64_t)a3
{
  v4 = self;
  PHCountingLayer.value.setter(a3);
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  if (v3 == 0x65756C6176 && v5 == 0xE500000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    NSString v8 = String._bridgeToObjectiveC()();
    v10.receiver = ObjCClassFromMetadata;
    v10.super_class = (Class)&OBJC_METACLASS____TtC11MobilePhone15PHCountingLayer;
    unsigned __int8 v6 = [super needsDisplayForKey:v8];
    swift_bridgeObjectRelease();
  }
  return v6;
}

- (id)actionForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = PHCountingLayer.action(forKey:)(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (_TtC11MobilePhone15PHCountingLayer)init
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MobilePhone15PHCountingLayer_value) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PHCountingLayer();
  return [(PHCountingLayer *)&v3 init];
}

- (_TtC11MobilePhone15PHCountingLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MobilePhone15PHCountingLayer_value) = 0;
  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  uint64_t v4 = _bridgeAnythingToObjectiveC<A>(_:)();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PHCountingLayer();
  uint64_t v5 = [(PHCountingLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

- (_TtC11MobilePhone15PHCountingLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MobilePhone15PHCountingLayer_value) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PHCountingLayer();
  return [(PHCountingLayer *)&v5 initWithCoder:a3];
}

@end