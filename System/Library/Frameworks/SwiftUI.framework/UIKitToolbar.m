@interface UIKitToolbar
+ (BOOL)_isFromSwiftUI;
- (_TtC7SwiftUI12UIKitToolbar)init;
- (_TtC7SwiftUI12UIKitToolbar)initWithCoder:(id)a3;
- (_TtC7SwiftUI12UIKitToolbar)initWithFrame:(CGRect)a3;
- (id)initInView:(id)a3 withFrame:(CGRect)a4 withItemList:(id)a5;
@end

@implementation UIKitToolbar

- (_TtC7SwiftUI12UIKitToolbar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI12UIKitToolbar_backgroundHost) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[UIKitToolbar initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI12UIKitToolbar)init
{
  return -[UIKitToolbar initWithFrame:](self, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (_TtC7SwiftUI12UIKitToolbar)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI12UIKitToolbar_backgroundHost) = 0;
  id v4 = a3;

  result = (_TtC7SwiftUI12UIKitToolbar *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)initInView:(id)a3 withFrame:(CGRect)a4 withItemList:(id)a5
{
  id v5 = a3;
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end