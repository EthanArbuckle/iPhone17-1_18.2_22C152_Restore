@interface DepthLabel
- (NSAttributedString)attributedText;
- (_TtC16MagnifierSupport10DepthLabel)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport10DepthLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
- (void)rotateIfPossibleTo:(int64_t)a3;
- (void)setAttributedText:(id)a3;
@end

@implementation DepthLabel

- (NSAttributedString)attributedText
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(DepthLabel *)&v4 attributedText];
  return v2;
}

- (void)setAttributedText:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  id v6 = a3;
  v7 = self;
  v8 = [(DepthLabel *)&v10 attributedText];
  v9.receiver = v7;
  v9.super_class = ObjectType;
  [(DepthLabel *)&v9 setAttributedText:v6];
  sub_2358FABB4(v8);
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  double v9 = UIEdgeInsetsInsetRect(x, y, width, height, *(double *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport10DepthLabel__topInset), 0.0);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v17.receiver = self;
  v17.super_class = ObjectType;
  v16 = self;
  -[DepthLabel drawTextInRect:](&v17, sel_drawTextInRect_, v9, v11, v13, v15);
}

- (void)rotateIfPossibleTo:(int64_t)a3
{
  objc_super v4 = self;
  sub_2358FB4DC(a3);
}

- (_TtC16MagnifierSupport10DepthLabel)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport10DepthLabel *)sub_2358FB5F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport10DepthLabel)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport10DepthLabel *)sub_2358FB878(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10DepthLabel_kDigitFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10DepthLabel_kUnitFont));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport10DepthLabel_kSpaceFont);
}

@end