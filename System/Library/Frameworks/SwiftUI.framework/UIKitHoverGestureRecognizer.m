@interface UIKitHoverGestureRecognizer
- (_TtC7SwiftUI27UIKitHoverGestureRecognizer)init;
- (_TtC7SwiftUI27UIKitHoverGestureRecognizer)initWithCoder:(id)a3;
- (_TtC7SwiftUI27UIKitHoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_hoverCancelled:(id)a3 withEvent:(id)a4;
- (void)_hoverExited:(id)a3 withEvent:(id)a4;
- (void)reset;
@end

@implementation UIKitHoverGestureRecognizer

- (_TtC7SwiftUI27UIKitHoverGestureRecognizer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(UIKitHoverGestureRecognizer *)&v5 initWithTarget:0 action:0];
}

- (void).cxx_destruct
{
}

- (_TtC7SwiftUI27UIKitHoverGestureRecognizer)initWithCoder:(id)a3
{
  swift_weakInit();
  id v5 = a3;

  result = (_TtC7SwiftUI27UIKitHoverGestureRecognizer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)reset
{
  if (swift_weakLoadStrong())
  {
    lazy protocol witness table accessor for type UIKitHoverGestureRecognizer and conformance UIKitHoverGestureRecognizer();
    v3 = self;
    dispatch thunk of EventBindingBridge.reset(eventSource:resetForwardedEventDispatchers:)();

    swift_release();
  }
}

- (void)_hoverCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)_hoverExited:(id)a3 withEvent:(id)a4
{
}

- (_TtC7SwiftUI27UIKitHoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC7SwiftUI27UIKitHoverGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end