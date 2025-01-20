@interface DOCSafeAreaView
- (UIView)contentView;
- (_TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView)initWithEffect:(id)a3;
- (void)dealloc;
- (void)handleKeyboardNotification:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
@end

@implementation DOCSafeAreaView

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView_safeAreaView));
}

- (void)dealloc
{
  v2 = self;
  sub_10040A878();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView_safeAreaView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView_safeBottomConstraint));
  swift_bridgeObjectRelease();
}

- (_TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView_safeBottomConstraint) = 0;
  v4 = (char *)self
     + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView_keyboardFrame;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView_keyboardObservations) = (Class)_swiftEmptyArrayStorage;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView_visibilityState) = 0;
  id v5 = a3;

  result = (_TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (void)handleKeyboardNotification:(id)a3
{
  uint64_t v4 = sub_1004CA6F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CA6B0();
  v8 = self;
  sub_10040A74C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)safeAreaInsetsDidChange
{
}

- (void)layoutSubviews
{
}

- (_TtC14RecentsAvocadoP33_9A651C09AA3A0E25F88E5070D573FC2715DOCSafeAreaView)initWithEffect:(id)a3
{
}

@end