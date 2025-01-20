@interface AdvertsSearchResultContentView
- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension30AdvertsSearchResultContentView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)disableAdvertRotationTap;
- (void)layoutSubviews;
@end

@implementation AdvertsSearchResultContentView

- (_TtC20ProductPageExtension30AdvertsSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30AdvertsSearchResultContentView *)sub_10053B308(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30AdvertsSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10053F548();
}

- (void)disableAdvertRotationTap
{
  id v3 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_disableAdvertRotation);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    v5 = self;
    uint64_t v6 = sub_1000194C0((uint64_t)v4);
    v4(v6);
    sub_1000194B0((uint64_t)v4);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10053B570();
}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_screenshots));
  swift_bridgeObjectRelease();
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_disableAdvertRotation));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension30AdvertsSearchResultContentView_impressionsUpdateBlock);

  sub_1000194B0(v3);
}

@end