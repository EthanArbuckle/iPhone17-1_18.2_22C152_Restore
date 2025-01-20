@interface BulletCircleImageView
- (_TtC5Heart21BulletCircleImageView)initWithCoder:(id)a3;
- (_TtC5Heart21BulletCircleImageView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation BulletCircleImageView

- (_TtC5Heart21BulletCircleImageView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart21BulletCircleImageView____lazy_storage___iconView) = 0;
  id v4 = a3;

  result = (_TtC5Heart21BulletCircleImageView *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v3 = self;
  id v4 = UIGraphicsGetCurrentContext();
  if (v4)
  {
    c = v4;
    CGContextSetLineWidth(v4, 2.0);
    if (qword_268C9E6B8 != -1) {
      swift_once();
    }
    v5 = (CGColor *)objc_msgSend((id)qword_268C9FE40, sel_CGColor);
    CGContextSetStrokeColorWithColor(c, v5);

    [(BulletCircleImageView *)v3 bounds];
    CGRect v10 = CGRectInset(v9, 1.0, 1.0);
    CGContextAddEllipseInRect(c, v10);
    CGContextStrokePath(c);

    v6 = c;
  }
  else
  {
    v6 = v3;
  }
}

- (_TtC5Heart21BulletCircleImageView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  v3 = *(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC5Heart21BulletCircleImageView_item);
  id v4 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC5Heart21BulletCircleImageView_item);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC5Heart21BulletCircleImageView_item));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Heart21BulletCircleImageView____lazy_storage___iconView);
}

@end