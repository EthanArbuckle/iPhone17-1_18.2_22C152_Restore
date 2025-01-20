@interface NoDetectionLabel
- (_TtC16MagnifierSupport16NoDetectionLabel)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport16NoDetectionLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation NoDetectionLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = self;
  [(NoDetectionLabel *)v9 bounds];
  double v11 = UIEdgeInsetsInsetRect(x, y, width, height, v10- *(double *)((char *)&v9->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport16NoDetectionLabel_kBottomInset), *(double *)((char *)&v9->super.super.super.super.isa+ OBJC_IVAR____TtC16MagnifierSupport16NoDetectionLabel_kSideInset));
  v12.receiver = v9;
  v12.super_class = ObjectType;
  [(NoDetectionLabel *)&v12 drawTextInRect:v11];
}

- (_TtC16MagnifierSupport16NoDetectionLabel)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport16NoDetectionLabel *)sub_2358FA7D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport16NoDetectionLabel)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport16NoDetectionLabel *)sub_2358FA918(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end