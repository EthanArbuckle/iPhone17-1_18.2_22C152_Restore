@interface UIKitRelationshipGestureRecognizer
- (_TtC7SwiftUI34UIKitRelationshipGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation UIKitRelationshipGestureRecognizer

- (_TtC7SwiftUI34UIKitRelationshipGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
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
  return (_TtC7SwiftUI34UIKitRelationshipGestureRecognizer *)UIKitRelationshipGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
}

@end