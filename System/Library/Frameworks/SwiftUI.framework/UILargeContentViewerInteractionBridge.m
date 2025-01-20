@interface UILargeContentViewerInteractionBridge
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC7SwiftUI37UILargeContentViewerInteractionBridge)init;
- (id)largeContentViewerInteraction:(id)a3 itemAtPoint:(CGPoint)a4;
- (void)enabledStatusDidChange;
- (void)largeContentViewerInteraction:(id)a3 didEndOnItem:(id)a4 atPoint:(CGPoint)a5;
@end

@implementation UILargeContentViewerInteractionBridge

- (_TtC7SwiftUI37UILargeContentViewerInteractionBridge)init
{
  return (_TtC7SwiftUI37UILargeContentViewerInteractionBridge *)UILargeContentViewerInteractionBridge.init()();
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_host);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_interaction));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_simultaneousGesture));
  swift_unknownObjectRelease();
  outlined init with take of AccessibilityLargeContentViewTree((long long *)((char *)self + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_largeContentViewTree), v3);
  _s7SwiftUI33AccessibilityLargeContentViewTreeOWOsTm_0((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))outlined consume of AccessibilityLargeContentViewTree);
}

- (void)enabledStatusDidChange
{
  v2 = self;
  UILargeContentViewerInteractionBridge.enabledStatusDidChange()();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  v6 = (UIGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  v8 = self;
  Swift::Bool v9 = UILargeContentViewerInteractionBridge.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)(v6, v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  uint64_t v7 = MEMORY[0x18C119DF0]((char *)self + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_gesture, a2);
  if (!v7) {
    return 0;
  }
  v8 = (void *)v7;
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIGestureRecognizer);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  id v12 = v8;
  char v13 = static NSObject.== infix(_:_:)();

  if (v13)
  {
    type metadata accessor for UIKitGestureRecognizer();
    BOOL v14 = swift_dynamicCastClass() != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)largeContentViewerInteraction:(id)a3 didEndOnItem:(id)a4 atPoint:(CGPoint)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  specialized UILargeContentViewerInteractionBridge.largeContentViewerInteraction(_:didEndOn:at:)((uint64_t)a4);

  swift_unknownObjectRelease();
}

- (id)largeContentViewerInteraction:(id)a3 itemAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = self;
  id v9 = (void *)specialized UILargeContentViewerInteractionBridge.largeContentViewerInteraction(_:itemAt:)(x, y);

  return v9;
}

@end