@interface SectionBackgroundView
- (_TtC12GameCenterUI21SectionBackgroundView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI21SectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SectionBackgroundView

- (_TtC12GameCenterUI21SectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI21SectionBackgroundView *)sub_1AF55B834(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI21SectionBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF55B9EC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF55BBEC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF55BF24((uint64_t)a3);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AF55C034();
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR____TtC12GameCenterUI21SectionBackgroundView_configuration, 0x89uLL);
  sub_1AF55C258((uint64_t)v3, (void (*)(void, void, void, void, void, void, void))sub_1AF3DB200);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21SectionBackgroundView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21SectionBackgroundView_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI21SectionBackgroundView_bottomSeparator));
}

@end