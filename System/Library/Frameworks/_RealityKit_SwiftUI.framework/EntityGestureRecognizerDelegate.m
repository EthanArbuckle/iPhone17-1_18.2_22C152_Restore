@interface EntityGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (_TtC19_RealityKit_SwiftUIP33_D3054C8CC2B5FD3485D9DD74FE19D26731EntityGestureRecognizerDelegate)init;
@end

@implementation EntityGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = EntityGestureRecognizerDelegate.gestureRecognizer(_:shouldRequireFailureOf:)(v6, v7);

  return v9 & 1;
}

- (_TtC19_RealityKit_SwiftUIP33_D3054C8CC2B5FD3485D9DD74FE19D26731EntityGestureRecognizerDelegate)init
{
  result = (_TtC19_RealityKit_SwiftUIP33_D3054C8CC2B5FD3485D9DD74FE19D26731EntityGestureRecognizerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19_RealityKit_SwiftUIP33_D3054C8CC2B5FD3485D9DD74FE19D26731EntityGestureRecognizerDelegate_entityTranslateGesture);
}

@end