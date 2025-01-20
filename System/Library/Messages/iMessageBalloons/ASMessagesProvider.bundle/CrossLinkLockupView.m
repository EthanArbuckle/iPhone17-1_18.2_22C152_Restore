@interface CrossLinkLockupView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider15SmallLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider19CrossLinkLockupView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider19CrossLinkLockupView)initWithFrame:(CGRect)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (void)layoutSubviews;
@end

@implementation CrossLinkLockupView

- (_TtC18ASMessagesProvider19CrossLinkLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider19CrossLinkLockupView *)sub_11C7D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider19CrossLinkLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_11EB04();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = sub_771DE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_11CDF4((uint64_t)v7);
  [(CrossLinkLockupView *)v8 layoutMargins];
  id v9 = [(CrossLinkLockupView *)v8 traitCollection];
  double v10 = sub_2005C4((uint64_t)v7);
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
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider19CrossLinkLockupView_lockupView) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_11D5E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19CrossLinkLockupView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19CrossLinkLockupView_crossLinkTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19CrossLinkLockupView_crossLinkSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider19CrossLinkLockupView_lockupView));
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC18ASMessagesProvider15SmallLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR____TtC18ASMessagesProvider19CrossLinkLockupView_lockupView));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider19CrossLinkLockupView_crossLinkTitleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC18ASMessagesProvider19CrossLinkLockupView_crossLinkSubtitleLabel));
}

@end