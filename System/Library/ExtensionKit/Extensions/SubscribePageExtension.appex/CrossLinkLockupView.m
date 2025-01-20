@interface CrossLinkLockupView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension19CrossLinkLockupView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension19CrossLinkLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CrossLinkLockupView

- (_TtC22SubscribePageExtension19CrossLinkLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension19CrossLinkLockupView *)sub_10020A9E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension19CrossLinkLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10020CD70();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = sub_10075BDE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_10020B008((uint64_t)v8);
  [(CrossLinkLockupView *)v9 layoutMargins];
  id v10 = [(CrossLinkLockupView *)v9 traitCollection];
  double v11 = sub_1001DD278((uint64_t)v8);
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_lockupView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_10020B7F8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_crossLinkSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_lockupView));
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_lockupView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_crossLinkTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension19CrossLinkLockupView_crossLinkSubtitleLabel));
}

@end