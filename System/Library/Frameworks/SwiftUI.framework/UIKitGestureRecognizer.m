@interface UIKitGestureRecognizer
- (BOOL)shouldReceiveEvent:(id)a3;
- (_TtC7SwiftUI22UIKitGestureRecognizer)init;
- (_TtC7SwiftUI22UIKitGestureRecognizer)initWithCoder:(id)a3;
- (_TtC7SwiftUI22UIKitGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_scrollingChangedWithEvent:(id)a3;
- (void)_transformChangedWithEvent:(id)a3;
- (void)_updateForActiveEvents;
- (void)reset;
@end

@implementation UIKitGestureRecognizer

- (_TtC7SwiftUI22UIKitGestureRecognizer)init
{
  return (_TtC7SwiftUI22UIKitGestureRecognizer *)UIKitGestureRecognizer.init()();
}

- (_TtC7SwiftUI22UIKitGestureRecognizer)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized UIKitGestureRecognizer.init(coder:)();
}

- (void)reset
{
  v2 = self;
  UIKitGestureRecognizer.reset()();
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = UIKitGestureRecognizer.shouldReceive(_:)((UIEvent)v4);

  return self & 1;
}

- (void)_updateForActiveEvents
{
  v2 = self;
  UIKitGestureRecognizer._updateForActiveEvents()();
}

- (_TtC7SwiftUI22UIKitGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC7SwiftUI22UIKitGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)_transformChangedWithEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  UIKitGestureRecognizer._transformChanged(with:)(v4);
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  UIKitGestureRecognizer._scrollingChanged(with:)((unint64_t)v4);
}

@end