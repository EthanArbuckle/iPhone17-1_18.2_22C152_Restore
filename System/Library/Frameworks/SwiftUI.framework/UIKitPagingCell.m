@interface UIKitPagingCell
- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF015UIKitPagingCell)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF015UIKitPagingCell)initWithFrame:(CGRect)a3;
@end

@implementation UIKitPagingCell

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF015UIKitPagingCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF015UIKitPagingCell_host) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for UIKitPagingCell();
  return -[UIKitPagingCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF015UIKitPagingCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF015UIKitPagingCell_host) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIKitPagingCell();
  return [(UIKitPagingCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF015UIKitPagingCell_host));
}

@end