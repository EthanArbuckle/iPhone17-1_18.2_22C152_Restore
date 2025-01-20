@interface MacLeftButton
- (BOOL)_supportsMacIdiom;
- (_TtC8BusinessP33_5C9C658DE8F7DD0151CD16655D6CBEF813MacLeftButton)initWithCoder:(id)a3;
- (_TtC8BusinessP33_5C9C658DE8F7DD0151CD16655D6CBEF813MacLeftButton)initWithFrame:(CGRect)a3;
@end

@implementation MacLeftButton

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (_TtC8BusinessP33_5C9C658DE8F7DD0151CD16655D6CBEF813MacLeftButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MacLeftButton();
  return -[MacLeftButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8BusinessP33_5C9C658DE8F7DD0151CD16655D6CBEF813MacLeftButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MacLeftButton();
  return [(MacLeftButton *)&v5 initWithCoder:a3];
}

@end