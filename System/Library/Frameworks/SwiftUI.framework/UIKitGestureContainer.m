@interface UIKitGestureContainer
- (NSArray)_childGestureRecognizerContainers;
- (NSArray)gestureRecognizers;
- (NSString)description;
- (UIResponder)nextResponder;
- (UIView)_proxyView;
- (UIWindow)_eventReceivingWindow;
- (_TtC7SwiftUI21UIKitGestureContainer)init;
- (_UIGestureRecognizerContainer)_actingParentGestureRecognizerContainer;
- (_UIGestureRecognizerContainer)_parentGestureRecognizerContainer;
- (int64_t)_compareGestureRecognizerContainer:(id)a3;
- (void)dealloc;
- (void)set_actingParentGestureRecognizerContainer:(id)a3;
@end

@implementation UIKitGestureContainer

- (UIView)_proxyView
{
  v2 = self;
  v3 = (void *)UIKitGestureContainer._proxyView.getter();

  return (UIView *)v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(UIKitGestureContainer *)&v3 dealloc];
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyGestureResponder?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI21UIKitGestureContainer_responder);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (NSString)description
{
  id v2 = self;
  unint64_t v3 = UIKitGestureContainer.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x18C115780](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (UIResponder)nextResponder
{
  id v2 = self;
  unint64_t v3 = (void *)UIKitGestureContainer.next.getter();

  return (UIResponder *)v3;
}

- (NSArray)gestureRecognizers
{
  id v2 = self;
  UIKitGestureContainer.gestureRecognizers.getter();

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIGestureRecognizer);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_UIGestureRecognizerContainer)_parentGestureRecognizerContainer
{
  id v2 = self;
  NSArray v3 = (void *)UIKitGestureContainer._parentContainer.getter();

  return (_UIGestureRecognizerContainer *)v3;
}

- (NSArray)_childGestureRecognizerContainers
{
  uint64_t Strong = swift_weakLoadStrong();
  uint64_t v4 = self;
  if (Strong)
  {
    unint64_t v5 = ViewResponder.childGestureContainers.getter();
    swift_release();
  }
  else
  {
    unint64_t v5 = MEMORY[0x1E4FBC860];
  }
  specialized _arrayForceCast<A, B>(_:)(v5);

  swift_bridgeObjectRelease();
  type metadata accessor for _UIGestureRecognizerContainer();
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (_UIGestureRecognizerContainer)_actingParentGestureRecognizerContainer
{
  id v2 = (void *)swift_unknownObjectRetain();

  return (_UIGestureRecognizerContainer *)v2;
}

- (void)set_actingParentGestureRecognizerContainer:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI21UIKitGestureContainer__actingParentContainer) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (UIWindow)_eventReceivingWindow
{
  id v2 = self;
  id v3 = UIKitGestureContainer._eventReceivingWindow.getter();

  return (UIWindow *)v3;
}

- (int64_t)_compareGestureRecognizerContainer:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  int64_t v5 = specialized UIKitGestureContainer._compare(_:)();
  swift_unknownObjectRelease();

  return v5;
}

- (_TtC7SwiftUI21UIKitGestureContainer)init
{
  result = (_TtC7SwiftUI21UIKitGestureContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end