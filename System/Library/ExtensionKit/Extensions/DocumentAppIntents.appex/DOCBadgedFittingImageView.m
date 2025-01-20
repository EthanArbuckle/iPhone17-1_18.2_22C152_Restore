@interface DOCBadgedFittingImageView
- (_TtC18DocumentAppIntents25DOCBadgedFittingImageView)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents25DOCBadgedFittingImageView)initWithFrame:(CGRect)a3;
- (_TtC18DocumentAppIntents25DOCBadgedFittingImageView)initWithImage:(id)a3;
- (_TtC18DocumentAppIntents25DOCBadgedFittingImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation DOCBadgedFittingImageView

- (_TtC18DocumentAppIntents25DOCBadgedFittingImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v7 = -[DOCBadgedFittingImageView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
  id v8 = [(DOCBadgedFittingImageView *)v7 layer];
  [v8 setMagnificationFilter:kCAFilterTrilinear];

  return v7;
}

- (_TtC18DocumentAppIntents25DOCBadgedFittingImageView)initWithCoder:(id)a3
{
  result = (_TtC18DocumentAppIntents25DOCBadgedFittingImageView *)sub_1004F6110();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents25DOCBadgedFittingImageView)initWithImage:(id)a3
{
  id v3 = a3;
  result = (_TtC18DocumentAppIntents25DOCBadgedFittingImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents25DOCBadgedFittingImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC18DocumentAppIntents25DOCBadgedFittingImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end