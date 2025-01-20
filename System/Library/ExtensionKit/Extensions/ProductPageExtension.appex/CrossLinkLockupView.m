@interface CrossLinkLockupView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension19CrossLinkLockupView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension19CrossLinkLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CrossLinkLockupView

- (_TtC20ProductPageExtension19CrossLinkLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension19CrossLinkLockupView *)sub_10036584C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension19CrossLinkLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100367850();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = sub_1007702E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_100365E70((uint64_t)v7);
  [(CrossLinkLockupView *)v8 layoutMargins];
  id v9 = [(CrossLinkLockupView *)v8 traitCollection];
  double v10 = sub_10026875C((uint64_t)v7);
  double v12 = v11;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension19CrossLinkLockupView_lockupView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_100366660();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19CrossLinkLockupView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19CrossLinkLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19CrossLinkLockupView_crossLinkSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19CrossLinkLockupView_lockupView));
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension19CrossLinkLockupView_lockupView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension19CrossLinkLockupView_crossLinkTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension19CrossLinkLockupView_crossLinkSubtitleLabel));
}

@end