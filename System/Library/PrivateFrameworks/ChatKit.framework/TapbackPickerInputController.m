@interface TapbackPickerInputController
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)supportsAdaptiveImageGlyph;
- (BOOL)supportsImagePaste;
- (NSString)textInputContextIdentifier;
- (_TtC7ChatKit28TapbackPickerInputController)init;
- (_TtC7ChatKit28TapbackPickerInputController)initWithCoder:(id)a3;
- (_TtC7ChatKit28TapbackPickerInputController)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (void)handlePayload:(id)a3 withPayloadId:(id)a4;
- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4;
@end

@implementation TapbackPickerInputController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)supportsImagePaste
{
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate;
  if (MEMORY[0x192FBC390]((char *)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(uint64_t (**)(void))(v4 + 32);
    v6 = self;
    char v7 = v5();

    swift_unknownObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

- (NSString)textInputContextIdentifier
{
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate;
  uint64_t v4 = (void *)MEMORY[0x192FBC390]((char *)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate, a2);
  if (v4)
  {
    uint64_t v5 = *((void *)v3 + 1);
    swift_getObjectType();
    v6 = *(void (**)(void))(v5 + 40);
    char v7 = self;
    v6();
    uint64_t v9 = v8;

    swift_unknownObjectRelease();
    if (v9)
    {
      uint64_t v4 = (void *)sub_18F7B97A0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return (NSString *)v4;
}

- (_TtC7ChatKit28TapbackPickerInputController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC7ChatKit28TapbackPickerInputController *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtC7ChatKit28TapbackPickerInputController)init
{
  return (_TtC7ChatKit28TapbackPickerInputController *)sub_18F76A4E8();
}

- (BOOL)becomeFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_18F76A5DC();

  return v3 & 1;
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_18F76A7F8();

  return v3 & 1;
}

- (void)handlePayload:(id)a3 withPayloadId:(id)a4
{
  id v4 = a4;
  if (a3)
  {
    uint64_t v6 = sub_18F7B9660();
    if (v4)
    {
LABEL_3:
      uint64_t v7 = sub_18F7B97E0();
      id v4 = v8;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  uint64_t v9 = self;
  sub_18F76A9C0(v6, v7, (uint64_t)v4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return 0;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_18F76B920((uint64_t)v6);
}

- (_TtC7ChatKit28TapbackPickerInputController)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC7ChatKit28TapbackPickerInputController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate);
  unsigned __int8 v3 = (char *)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_previousPayloadDelegate;

  sub_18F4C25DC((uint64_t)v3);
}

@end