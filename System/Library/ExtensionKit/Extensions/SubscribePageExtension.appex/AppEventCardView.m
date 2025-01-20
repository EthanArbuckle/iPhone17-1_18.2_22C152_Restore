@interface AppEventCardView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC22SubscribePageExtension14NotifyMeButton)accessibilityNotifyMeButton;
- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension16AppEventCardView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension16AppEventCardView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)notifyMeButtonTapped:(id)a3;
@end

@implementation AppEventCardView

- (_TtC22SubscribePageExtension16AppEventCardView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension16AppEventCardView *)sub_10019ED48();
}

- (_TtC22SubscribePageExtension16AppEventCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10019FAE4();
}

- (void)dealloc
{
  v2 = self;
  sub_10019BF6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_mediaContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_kindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_notifyMeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_lockupContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_lockupTapGestureRecognizer));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_lockupViewTappedAction));
  swift_unknownObjectWeakDestroy();

  swift_release();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10019CE04();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = type metadata accessor for AppEventCardLayout(0);
  __chkstk_darwin(v4 - 8, v5);
  v7 = (uint64_t *)((char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = self;
  sub_10019D2E8((uint64_t)v7);
  sub_1006EEE08(v8, v7);
  double v10 = v9;
  double v12 = v11;
  sub_10002202C((uint64_t)v7);

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_lockupViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_10001A4E0((uint64_t)v3);
    v3(v6);
    sub_10001A4D0((uint64_t)v3);
  }
}

- (void)notifyMeButtonTapped:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_notifyMeButtonPresenter))
  {
    id v4 = a3;
    id v5 = self;
    swift_retain();
    NotifyMeButtonPresenter.didTapButton(sender:)((UIButton)v4);

    swift_release();
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return swift_dynamicCastObjCClass() == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_10019FBD4(v7);

  return v9;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_kindLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_subtitleLabel));
}

- (_TtC22SubscribePageExtension14NotifyMeButton)accessibilityNotifyMeButton
{
  return (_TtC22SubscribePageExtension14NotifyMeButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_notifyMeButton));
}

- (_TtC22SubscribePageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC22SubscribePageExtension16AppEventCardView_lockupView));
}

@end