@interface PlatformTextFieldCoordinator
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC7SwiftUI28PlatformTextFieldCoordinator)init;
- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)primaryActionTriggered:(id)a3;
- (void)textChanged:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChangeSelection:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation PlatformTextFieldCoordinator

- (void)primaryActionTriggered:(id)a3
{
  id v4 = a3;
  v5 = self;
  PlatformTextFieldCoordinator.triggerPrimaryAction()();
}

- (void)textChanged:(id)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI28PlatformTextFieldCoordinator_isUserEditing) = 1;
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_text);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    v10 = (void *)0xE000000000000000;
  }
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  PlatformTextFieldCoordinator.updateText(_:)(v11);

  swift_bridgeObjectRelease();
}

- (_TtC7SwiftUI28PlatformTextFieldCoordinator)init
{
  result = (_TtC7SwiftUI28PlatformTextFieldCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of EnvironmentValues?(*(uint64_t *)((char *)&self->super.super.isa
                                                    + OBJC_IVAR____TtC7SwiftUI28PlatformTextFieldCoordinator_environment));
  outlined destroy of PlatformItem((uint64_t)self + OBJC_IVAR____TtC7SwiftUI28PlatformTextFieldCoordinator_label);
  _sypSgWOhTm_7((uint64_t)self + OBJC_IVAR____TtC7SwiftUI28PlatformTextFieldCoordinator_field, &lazy cache variable for type metadata for PlatformTextFieldCoordinator.FieldStorage?, (uint64_t)&type metadata for PlatformTextFieldCoordinator.FieldStorage);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized PlatformTextFieldCoordinator.textFieldDidBeginEditing(_:)((uint64_t)v5);
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  specialized PlatformTextFieldCoordinator.textFieldDidEndEditing(_:reason:)((uint64_t)v6);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return @objc PlatformTextFieldCoordinator.textField(_:shouldChangeCharactersIn:replacementString:)(self, (uint64_t)a2, a3, a4.location, a4.length, (uint64_t)a5, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))PlatformTextFieldCoordinator.textField(_:shouldChangeCharactersIn:replacementString:));
}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  PlatformTextFieldCoordinator.didChangeSelection()();
}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIMenuElement);
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  v9 = self;
  PlatformTextFieldCoordinator.presentEditMenu(with:)(v10, (Swift::OpaquePointer)v7);
  v12 = v11;

  swift_bridgeObjectRelease();

  return v12;
}

- (void)textViewDidChange:(id)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI28PlatformTextFieldCoordinator_isUserEditing) = 1;
  id v4 = a3;
  id v5 = self;
  id v6 = objc_msgSend(v4, sel_attributedText);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = objc_msgSend(v6, sel_string);

    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    Swift::String v11 = v10;

    v12._countAndFlagsBits = v9;
    v12._object = v11;
    PlatformTextFieldCoordinator.updateText(_:)(v12);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized PlatformTextFieldCoordinator.textViewDidBeginEditing(_:)((uint64_t)v5);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized PlatformTextFieldCoordinator.textViewDidEndEditing(_:)((uint64_t)v5);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return @objc PlatformTextFieldCoordinator.textField(_:shouldChangeCharactersIn:replacementString:)(self, (uint64_t)a2, a3, a4.location, a4.length, (uint64_t)a5, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))PlatformTextFieldCoordinator.textView(_:shouldChangeTextIn:replacementText:));
}

@end