@interface EntityRotationGestureRecognizer
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (_TtC10RealityKit31EntityRotationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation EntityRotationGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  type metadata accessor for UITouch();
  lazy protocol witness table accessor for type UITouch and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type UITouch and conformance NSObject, (void (*)(uint64_t))type metadata accessor for UITouch);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  EntityRotationGestureRecognizer.touchesBegan(_:with:)(v6, v7);

  swift_bridgeObjectRelease();
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = EntityRotationGestureRecognizer.canPrevent(_:)(v4);

  return self & 1;
}

- (_TtC10RealityKit31EntityRotationGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC10RealityKit31EntityRotationGestureRecognizer *)EntityRotationGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
}

@end