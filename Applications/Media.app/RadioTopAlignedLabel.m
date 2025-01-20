@interface RadioTopAlignedLabel
- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09720RadioTopAlignedLabel)initWithCoder:(id)a3;
- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09720RadioTopAlignedLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation RadioTopAlignedLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  id v8 = [(RadioTopAlignedLabel *)v7 numberOfLines];
  v9 = (objc_class *)type metadata accessor for RadioTopAlignedLabel();
  v11.receiver = v7;
  v11.super_class = v9;
  -[RadioTopAlignedLabel textRectForBounds:limitedToNumberOfLines:](&v11, "textRectForBounds:limitedToNumberOfLines:", v8, x, y, width, height);
  v10.receiver = v7;
  v10.super_class = v9;
  -[RadioTopAlignedLabel drawTextInRect:](&v10, "drawTextInRect:");
}

- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09720RadioTopAlignedLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RadioTopAlignedLabel();
  return -[RadioTopAlignedLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09720RadioTopAlignedLabel)initWithCoder:(id)a3
{
  return (_TtC5MediaP33_FE8CA25A25B2965822BC9858B997E09720RadioTopAlignedLabel *)sub_100037530(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for RadioTopAlignedLabel);
}

@end