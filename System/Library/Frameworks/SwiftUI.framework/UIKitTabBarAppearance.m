@interface UIKitTabBarAppearance
+ (BOOL)_isFromSwiftUI;
- (_TtC7SwiftUI21UIKitTabBarAppearance)initWithBarAppearance:(id)a3;
- (_TtC7SwiftUI21UIKitTabBarAppearance)initWithCoder:(id)a3;
- (_TtC7SwiftUI21UIKitTabBarAppearance)initWithIdiom:(int64_t)a3;
@end

@implementation UIKitTabBarAppearance

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI21UIKitTabBarAppearance)initWithIdiom:(int64_t)a3
{
  return (_TtC7SwiftUI21UIKitTabBarAppearance *)@objc UIKitNavigationBarAppearance.init(idiom:)(self, (uint64_t)a2, a3, type metadata accessor for UIKitTabBarAppearance, (SEL *)&selRef_initWithIdiom_);
}

- (_TtC7SwiftUI21UIKitTabBarAppearance)initWithBarAppearance:(id)a3
{
  return (_TtC7SwiftUI21UIKitTabBarAppearance *)@objc UIKitNavigationBarAppearance.init(idiom:)(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for UIKitTabBarAppearance, (SEL *)&selRef_initWithBarAppearance_);
}

- (_TtC7SwiftUI21UIKitTabBarAppearance)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI21UIKitTabBarAppearance *)@objc UIKitNavigationBarAppearance.init(idiom:)(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for UIKitTabBarAppearance, (SEL *)&selRef_initWithCoder_);
}

@end