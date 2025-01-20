@interface UIKitAction
+ (BOOL)_isFromSwiftUI;
- (_TtC7SwiftUIP33_BF747AB022DCE7FC5B6AD0F035BC8E0D11UIKitAction)initWithCoder:(id)a3;
@end

@implementation UIKitAction

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUIP33_BF747AB022DCE7FC5B6AD0F035BC8E0D11UIKitAction)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(UIMenuElement *)&v5 initWithCoder:a3];
}

@end