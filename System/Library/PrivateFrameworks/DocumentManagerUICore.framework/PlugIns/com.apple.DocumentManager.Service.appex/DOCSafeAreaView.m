@interface DOCSafeAreaView
- (UIView)contentView;
- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView)initWithEffect:(id)a3;
- (void)dealloc;
- (void)handleKeyboardNotification:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
@end

@implementation DOCSafeAreaView

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView_safeAreaView));
}

- (void)dealloc
{
  v2 = self;
  sub_1003857AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView_safeAreaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView_safeBottomConstraint));
  swift_bridgeObjectRelease();
}

- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView_safeBottomConstraint) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView_keyboardFrame;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView_keyboardObservations) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView_visibilityState) = 0;
  id v5 = a3;

  result = (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (void)handleKeyboardNotification:(id)a3
{
  uint64_t v4 = sub_1004C9F00();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004C9EC0();
  v8 = self;
  sub_100385680();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)safeAreaInsetsDidChange
{
}

- (void)layoutSubviews
{
}

- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB15DOCSafeAreaView)initWithEffect:(id)a3
{
}

@end