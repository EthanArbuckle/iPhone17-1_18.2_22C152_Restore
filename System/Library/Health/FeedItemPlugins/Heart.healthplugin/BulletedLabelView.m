@interface BulletedLabelView
- (_TtC5Heart17BulletedLabelView)initWithCoder:(id)a3;
- (_TtC5Heart17BulletedLabelView)initWithFrame:(CGRect)a3;
@end

@implementation BulletedLabelView

- (_TtC5Heart17BulletedLabelView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Heart17BulletedLabelView____lazy_storage___bulletLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart17BulletedLabelView____lazy_storage___textLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Heart17BulletedLabelView____lazy_storage___stackView) = 0;
  id v4 = a3;

  result = (_TtC5Heart17BulletedLabelView *)sub_240BB78D0();
  __break(1u);
  return result;
}

- (_TtC5Heart17BulletedLabelView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Heart17BulletedLabelView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart17BulletedLabelView____lazy_storage___bulletLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart17BulletedLabelView____lazy_storage___textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Heart17BulletedLabelView____lazy_storage___stackView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end