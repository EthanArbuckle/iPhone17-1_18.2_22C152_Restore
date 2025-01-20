@interface AppEventCardView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension14NotifyMeButton)accessibilityNotifyMeButton;
- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension16AppEventCardView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension16AppEventCardView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)notifyMeButtonTapped:(id)a3;
@end

@implementation AppEventCardView

- (_TtC20ProductPageExtension16AppEventCardView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16AppEventCardView *)sub_10015055C();
}

- (_TtC20ProductPageExtension16AppEventCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001512F8();
}

- (void)dealloc
{
  v2 = self;
  sub_10014D6B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_mediaContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_kindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_notifyMeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_borderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupTapGestureRecognizer));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupViewTappedAction));
  swift_unknownObjectWeakDestroy();

  swift_release();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10014E550();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = type metadata accessor for AppEventCardLayout(0);
  __chkstk_darwin(v4 - 8);
  v6 = (uint64_t *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = self;
  sub_10014EA34((uint64_t)v6);
  sub_10024216C(v7, v6);
  double v9 = v8;
  double v11 = v10;
  sub_100022A74((uint64_t)v6);

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_1000194C0((uint64_t)v3);
    v3(v6);
    sub_1000194B0((uint64_t)v3);
  }
}

- (void)notifyMeButtonTapped:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_notifyMeButtonPresenter))
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
  double v8 = self;
  BOOL v9 = sub_1001513E8(v7);

  return v9;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityKindLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_kindLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_subtitleLabel));
}

- (_TtC20ProductPageExtension14NotifyMeButton)accessibilityNotifyMeButton
{
  return (_TtC20ProductPageExtension14NotifyMeButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                               + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_notifyMeButton));
}

- (_TtC20ProductPageExtension15SmallLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension15SmallLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension16AppEventCardView_lockupView));
}

@end