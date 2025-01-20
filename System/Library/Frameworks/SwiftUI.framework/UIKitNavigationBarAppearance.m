@interface UIKitNavigationBarAppearance
+ (BOOL)_isFromSwiftUI;
- (_TtC7SwiftUI28UIKitNavigationBarAppearance)initWithBarAppearance:(id)a3;
- (_TtC7SwiftUI28UIKitNavigationBarAppearance)initWithCoder:(id)a3;
- (_TtC7SwiftUI28UIKitNavigationBarAppearance)initWithIdiom:(int64_t)a3;
@end

@implementation UIKitNavigationBarAppearance

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI28UIKitNavigationBarAppearance)initWithIdiom:(int64_t)a3
{
  return (_TtC7SwiftUI28UIKitNavigationBarAppearance *)@objc UIKitNavigationBarAppearance.init(idiom:)(self, (uint64_t)a2, a3, type metadata accessor for UIKitNavigationBarAppearance, (SEL *)&selRef_initWithIdiom_);
}

- (_TtC7SwiftUI28UIKitNavigationBarAppearance)initWithBarAppearance:(id)a3
{
  return (_TtC7SwiftUI28UIKitNavigationBarAppearance *)@objc UIKitNavigationBarAppearance.init(idiom:)(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for UIKitNavigationBarAppearance, (SEL *)&selRef_initWithBarAppearance_);
}

- (_TtC7SwiftUI28UIKitNavigationBarAppearance)initWithCoder:(id)a3
{
  return (_TtC7SwiftUI28UIKitNavigationBarAppearance *)@objc UIKitNavigationBarAppearance.init(idiom:)(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for UIKitNavigationBarAppearance, (SEL *)&selRef_initWithCoder_);
}

@end