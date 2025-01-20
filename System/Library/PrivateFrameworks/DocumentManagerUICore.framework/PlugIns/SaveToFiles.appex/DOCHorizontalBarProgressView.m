@interface DOCHorizontalBarProgressView
- (_TtC11SaveToFiles28DOCHorizontalBarProgressView)initWithCoder:(id)a3;
- (_TtC11SaveToFiles28DOCHorizontalBarProgressView)initWithFrame:(CGRect)a3;
@end

@implementation DOCHorizontalBarProgressView

- (_TtC11SaveToFiles28DOCHorizontalBarProgressView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC11SaveToFiles28DOCHorizontalBarProgressView_changeAnimationDuration;
  *(void *)v7 = 0;
  v7[8] = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCHorizontalBarProgressView();
  return -[DOCHorizontalBarProgressView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC11SaveToFiles28DOCHorizontalBarProgressView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC11SaveToFiles28DOCHorizontalBarProgressView_changeAnimationDuration;
  *(void *)v4 = 0;
  v4[8] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCHorizontalBarProgressView();
  return [(DOCHorizontalBarProgressView *)&v6 initWithCoder:a3];
}

@end