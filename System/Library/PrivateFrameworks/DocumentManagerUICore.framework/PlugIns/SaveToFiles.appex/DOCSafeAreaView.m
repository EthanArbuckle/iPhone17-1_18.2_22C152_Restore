@interface DOCSafeAreaView
- (UIView)contentView;
- (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView)initWithCoder:(id)a3;
- (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView)initWithEffect:(id)a3;
- (void)dealloc;
- (void)handleKeyboardNotification:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
@end

@implementation DOCSafeAreaView

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView_safeAreaView));
}

- (void)dealloc
{
  v2 = self;
  sub_1000482D8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView_safeAreaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView_safeBottomConstraint));
  swift_bridgeObjectRelease();
}

- (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView_safeBottomConstraint) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView_keyboardFrame;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView_keyboardObservations) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView_visibilityState) = 0;
  id v5 = a3;

  result = (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView *)sub_1004D2DC0();
  __break(1u);
  return result;
}

- (void)handleKeyboardNotification:(id)a3
{
  uint64_t v4 = sub_1004CDE50();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CDE10();
  v8 = self;
  sub_1000481AC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)safeAreaInsetsDidChange
{
}

- (void)layoutSubviews
{
}

- (_TtC11SaveToFilesP33_E4D4759C26D0AE14667925660959E6D415DOCSafeAreaView)initWithEffect:(id)a3
{
}

@end