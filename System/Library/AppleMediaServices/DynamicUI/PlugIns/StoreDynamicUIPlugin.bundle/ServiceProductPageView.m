@interface ServiceProductPageView
- (_TtC20StoreDynamicUIPlugin22ServiceProductPageView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin22ServiceProductPageView)initWithFrame:(CGRect)a3;
- (void)didTapPrimaryButton:(id)a3;
- (void)didTapSecondaryButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation ServiceProductPageView

- (_TtC20StoreDynamicUIPlugin22ServiceProductPageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_E6B58();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_E6E94();
}

- (void)didTapPrimaryButton:(id)a3
{
}

- (void)didTapSecondaryButton:(id)a3
{
}

- (_TtC20StoreDynamicUIPlugin22ServiceProductPageView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_EA9F8((uint64_t)self + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_destination, (void (*)(void))type metadata accessor for ServiceProductPageDestination);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_detailsView));
  swift_release();
  swift_release();
  sub_10950(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_artworkFetcher));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_primaryButton));
  sub_10950(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_primaryButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_secondaryButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_secondaryButtonHandler);

  sub_10950(v3);
}

@end