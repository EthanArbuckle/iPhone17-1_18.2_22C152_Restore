@interface DropletBackgroundView
- (_TtC9DropletUI21DropletBackgroundView)initWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation DropletBackgroundView

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (a4)
  {
    if (sub_24D149268() == 0xD000000000000020 && v6 == 0x800000024D14BCC0 || (sub_24D1494C8() & 1) != 0)
    {
      id v7 = a3;
      v8 = self;
      sub_24D14410C();
    }
    swift_bridgeObjectRelease();
  }
}

- (_TtC9DropletUI21DropletBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D145188();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24D143910();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType;
  sub_24D12BF7C(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_backgroundType), *((void *)v3 + 1), *((void *)v3 + 2), *((void *)v3 + 3), *((void *)v3 + 4), *((void *)v3 + 5), *((void *)v3 + 6), *((void *)v3 + 7), *((void *)v3 + 8), *((void *)v3 + 9), v3[80]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___adaptiveColorMatrixView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___colorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView_intelligentView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___topGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___leftGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___bottomGradientView));
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9DropletUI21DropletBackgroundView____lazy_storage___rightGradientView);
}

@end