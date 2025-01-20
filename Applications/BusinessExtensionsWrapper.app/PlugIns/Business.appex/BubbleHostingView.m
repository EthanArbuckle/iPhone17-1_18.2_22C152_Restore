@interface BubbleHostingView
- (_TtC8Business17BubbleHostingView)initWithCoder:(id)a3;
- (_TtC8Business17BubbleHostingView)initWithFrame:(CGRect)a3;
@end

@implementation BubbleHostingView

- (_TtC8Business17BubbleHostingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business17BubbleHostingView_delegate);
  void *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business17BubbleHostingView_subview) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BubbleHostingView();
  return -[BubbleHostingView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC8Business17BubbleHostingView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business17BubbleHostingView_delegate);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business17BubbleHostingView_subview) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BubbleHostingView();
  return [(BubbleHostingView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Business17BubbleHostingView_subview);
}

@end