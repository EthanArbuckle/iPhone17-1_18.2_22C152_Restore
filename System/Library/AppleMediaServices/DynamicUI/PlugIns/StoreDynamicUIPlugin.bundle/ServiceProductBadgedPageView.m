@interface ServiceProductBadgedPageView
- (_TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView)initWithFrame:(CGRect)a3;
- (void)didTapOffer:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ServiceProductBadgedPageView

- (_TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView *)sub_CD308(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_CE554();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_CEA88();
}

- (void)didTapOffer:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10B110();
  swift_unknownObjectRelease();
  sub_CF7C4((uint64_t)v5);

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((uint64_t)v5);
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_CF8A4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_CF928((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_scrollView));
  sub_10950(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_artworkFetcher));
  sub_10950(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_offerActionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_footerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_footerBlur));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_offerButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20StoreDynamicUIPlugin28ServiceProductBadgedPageView_contentView);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_CFF7C();
}

@end