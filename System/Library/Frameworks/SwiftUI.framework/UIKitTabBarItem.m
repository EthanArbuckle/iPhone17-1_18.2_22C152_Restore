@interface UIKitTabBarItem
- (_TtC7SwiftUI15UIKitTabBarItem)init;
- (_TtC7SwiftUI15UIKitTabBarItem)initWithCoder:(id)a3;
- (void)updateAccessibility;
@end

@implementation UIKitTabBarItem

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_resolvedAccessibilityLabel));

  swift_bridgeObjectRelease();
}

- (void)updateAccessibility
{
  v2 = self;
  UIKitTabBarItem.updateAccessibility()();
}

- (_TtC7SwiftUI15UIKitTabBarItem)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_resolvedAccessibilityLabel) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_accessibility);
  void *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(UIBarItem *)&v6 init];
}

- (_TtC7SwiftUI15UIKitTabBarItem)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_resolvedAccessibilityLabel) = 0;
  objc_super v6 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI15UIKitTabBarItem_accessibility);
  *objc_super v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(UIBarItem *)&v8 initWithCoder:a3];
}

@end