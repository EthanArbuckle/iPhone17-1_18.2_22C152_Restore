@interface PHRingLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_TtC11MobilePhone11PHRingLayer)init;
- (_TtC11MobilePhone11PHRingLayer)initWithCoder:(id)a3;
- (_TtC11MobilePhone11PHRingLayer)initWithLayer:(id)a3;
- (double)percentage;
- (id)actionForKey:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)setPercentage:(double)a3;
@end

@implementation PHRingLayer

- (double)percentage
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC11MobilePhone11PHRingLayer_percentage);
  swift_beginAccess();
  return *v2;
}

- (void)setPercentage:(double)a3
{
  v5 = (double *)((char *)self + OBJC_IVAR____TtC11MobilePhone11PHRingLayer_percentage);
  swift_beginAccess();
  double *v5 = a3;
  [(PHRingLayer *)self setNeedsDisplay];
}

- (_TtC11MobilePhone11PHRingLayer)init
{
  return (_TtC11MobilePhone11PHRingLayer *)PHRingLayer.init()();
}

- (_TtC11MobilePhone11PHRingLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC11MobilePhone11PHRingLayer *)PHRingLayer.init(layer:)(v4);
}

- (_TtC11MobilePhone11PHRingLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized PHRingLayer.init(coder:)();
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_getObjCClassMetadata();
  if (v3 == 0x61746E6563726570 && v5 == 0xEA00000000006567
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    NSString v8 = String._bridgeToObjectiveC()();
    v10.receiver = ObjCClassFromMetadata;
    v10.super_class = (Class)&OBJC_METACLASS____TtC11MobilePhone11PHRingLayer;
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
  id v8 = PHRingLayer.action(forKey:)(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  PHRingLayer.draw(in:)(v4);
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11MobilePhone11PHRingLayer_strokeColor);
}

@end