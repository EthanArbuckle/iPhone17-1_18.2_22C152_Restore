@interface HostingScrollView.PlatformGroupContainer
+ (BOOL)_supportsInvalidatingFocusCache;
- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)_swiftuiReturnsSubviewsInFocusItemsInRect;
- (NSArray)_childGestureRecognizerContainers;
- (NSArray)preferredFocusEnvironments;
- (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer)initWithCoder:(id)a3;
- (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer)initWithFrame:(CGRect)a3;
- (id)focusItemsInRect:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation HostingScrollView.PlatformGroupContainer

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer)initWithFrame:(CGRect)a3
{
  return (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer *)HostingScrollView.PlatformGroupContainer.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized HostingScrollView.PlatformGroupContainer.didUpdateFocus(in:with:)(v6);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  HostingScrollView.PlatformGroupContainer.preferredFocusEnvironments.getter();

  type metadata accessor for _UISceneBSActionHandler(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusEnvironment);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)_swiftuiReturnsSubviewsInFocusItemsInRect
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  type metadata accessor for [UIFocusItem]();
  v4 = self;
  static Update.ensure<A>(_:)();

  type metadata accessor for _UISceneBSActionHandler(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusItem);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (NSArray)_childGestureRecognizerContainers
{
  v2 = self;
  HostingScrollView.PlatformGroupContainer._childContainers.getter();

  type metadata accessor for _UIGestureRecognizerContainer();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v7 = a4;
  v8 = (char *)v13.receiver;
  if (-[HostingScrollView.PlatformGroupContainer _accessibilityAllowOutOfBoundsHitTestAtPoint:withEvent:](&v13, sel__accessibilityAllowOutOfBoundsHitTestAtPoint_withEvent_, v7, x, y))
  {
    BOOL v9 = 1;
  }
  else
  {
    v10 = (char *)MEMORY[0x18C119DF0](&v8[OBJC_IVAR____TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer_scrollView]);
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, sel_accessibilityFrame, v13.receiver, v13.super_class);
      v14.double x = x;
      v14.double y = y;
      BOOL v9 = CGRectContainsPoint(v15, v14);

      id v7 = v8;
      v8 = v11;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer)initWithCoder:(id)a3
{
  return (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer *)HostingScrollView.PlatformGroupContainer.init(coder:)(a3);
}

@end