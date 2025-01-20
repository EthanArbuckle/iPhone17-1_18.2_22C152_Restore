@interface KeyboardEventListener
- (_TtC15ImagePlayground21KeyboardEventListener)init;
- (void)_keyboardDidHideWithNotification:(id)a3;
- (void)_keyboardDidShowWithNotification:(id)a3;
- (void)_keyboardWillHideWithNotification:(id)a3;
- (void)_keyboardWillShowWithNotification:(id)a3;
@end

@implementation KeyboardEventListener

- (void)_keyboardWillShowWithNotification:(id)a3
{
}

- (void)_keyboardWillHideWithNotification:(id)a3
{
}

- (void)_keyboardDidShowWithNotification:(id)a3
{
}

- (void)_keyboardDidHideWithNotification:(id)a3
{
}

- (_TtC15ImagePlayground21KeyboardEventListener)init
{
  result = (_TtC15ImagePlayground21KeyboardEventListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_243ECC0A4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15ImagePlayground21KeyboardEventListener_keyboardWillShow));
  sub_243ECC0A4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15ImagePlayground21KeyboardEventListener_keyboardWillHide));
  sub_243ECC0A4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15ImagePlayground21KeyboardEventListener_keyboardDidShow));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15ImagePlayground21KeyboardEventListener_keyboardDidHide);

  sub_243ECC0A4(v3);
}

@end