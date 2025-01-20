@interface ASUIProductCarouselView
- (_TtC16AccessorySetupUI23ASUIProductCarouselView)initWithCoder:(id)a3;
- (_TtC16AccessorySetupUI23ASUIProductCarouselView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)pageControlChangedWithPageControl:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation ASUIProductCarouselView

- (void)pageControlChangedWithPageControl:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000076C8([v4 currentPage], 1);
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ASUIProductCarouselView();
  id v2 = v8.receiver;
  [(ASUIProductCarouselView *)&v8 layoutSubviews];
  v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  v7[4] = sub_10000C144;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_100015768;
  v7[3] = &unk_100059450;
  v5 = _Block_copy(v7);
  id v6 = v2;
  swift_release();
  [v3 animateWithDuration:0 delay:v5 usingSpringWithDamping:0 initialSpringVelocity:1.0 options:0.0 animations:0.8 completion:0.0];
  _Block_release(v5);
}

- (_TtC16AccessorySetupUI23ASUIProductCarouselView)initWithFrame:(CGRect)a3
{
  return (_TtC16AccessorySetupUI23ASUIProductCarouselView *)sub_10000B090(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16AccessorySetupUI23ASUIProductCarouselView)initWithCoder:(id)a3
{
  return (_TtC16AccessorySetupUI23ASUIProductCarouselView *)sub_10000B284(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_productScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_otaLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingOTALabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControl));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16AccessorySetupUI23ASUIProductCarouselView_backingPageControlHeightConstraint);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000BCBC();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v8 = a3;
  v9 = self;
  sub_10000BDB4(&a5->x, x);
}

@end