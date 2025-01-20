@interface TransparentBlackBackgroundDecorationView
- (_TtC6HomeUI40TransparentBlackBackgroundDecorationView)initWithCoder:(id)a3;
- (_TtC6HomeUI40TransparentBlackBackgroundDecorationView)initWithFrame:(CGRect)a3;
@end

@implementation TransparentBlackBackgroundDecorationView

- (_TtC6HomeUI40TransparentBlackBackgroundDecorationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TransparentBlackBackgroundDecorationView();
  v7 = -[SolidColorSectionBackgroundDecorationView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  id v8 = objc_allocWithZone(MEMORY[0x1E4F428B8]);
  v9 = v7;
  id v10 = objc_msgSend(v8, sel_initWithWhite_alpha_, 0.0, 0.5);
  [(TransparentBlackBackgroundDecorationView *)v9 setBackgroundColor:v10];

  return v9;
}

- (_TtC6HomeUI40TransparentBlackBackgroundDecorationView)initWithCoder:(id)a3
{
  result = (_TtC6HomeUI40TransparentBlackBackgroundDecorationView *)sub_1BE9C5A78();
  __break(1u);
  return result;
}

@end