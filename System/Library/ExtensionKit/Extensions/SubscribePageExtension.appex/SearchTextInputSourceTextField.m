@interface SearchTextInputSourceTextField
- (BOOL)scribbleInteractionShouldDelayFocus:(id)a3;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (_TtC22SubscribePageExtension30SearchTextInputSourceTextField)init;
- (void)textFieldDidChangeSelection:(id)a3;
- (void)textFieldDidEdit:(id)a3;
@end

@implementation SearchTextInputSourceTextField

- (void)textFieldDidEdit:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001D2C44();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  sub_1007675F0();
  id v8 = a3;
  v9 = self;
  LOBYTE(length) = sub_1001D249C(v8, v10, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    id v5 = a3;
  }
  else {
    id v5 = 0;
  }
  if (v5)
  {
    id v6 = a3;
    v7 = self;
    sub_1001D4294(0, 0);
  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)scribbleInteractionShouldDelayFocus:(id)a3
{
  return 1;
}

- (_TtC22SubscribePageExtension30SearchTextInputSourceTextField)init
{
  result = (_TtC22SubscribePageExtension30SearchTextInputSourceTextField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30SearchTextInputSourceTextField_textField));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension30SearchTextInputSourceTextField_scribbleInteraction));

  swift_release();
}

@end