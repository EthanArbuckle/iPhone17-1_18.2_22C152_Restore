@interface UIKitSplitViewController
+ (BOOL)_isFromSwiftUI;
- (BOOL)_canShowWhileLocked;
- (_TtC7SwiftUI24UIKitSplitViewController)initWithCoder:(id)a3;
- (_TtC7SwiftUI24UIKitSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7SwiftUI24UIKitSplitViewController)initWithStyle:(int64_t)a3;
@end

@implementation UIKitSplitViewController

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI24UIKitSplitViewController)initWithStyle:(int64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(UIKitSplitViewController *)&v7 initWithStyle:a3];
}

- (BOOL)_canShowWhileLocked
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing);
}

- (_TtC7SwiftUI24UIKitSplitViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(UIKitSplitViewController *)&v7 initWithCoder:a3];
}

- (_TtC7SwiftUI24UIKitSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing) = 0;
    id v11 = a4;
    a3 = (id)MEMORY[0x18C115780](v8, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC7SwiftUI24UIKitSplitViewController_allowsSecureDrawing) = 0;
    id v12 = a4;
  }
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = [(UIKitSplitViewController *)&v15 initWithNibName:a3 bundle:a4];

  return v13;
}

@end