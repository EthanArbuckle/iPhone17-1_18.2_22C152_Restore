@interface UIKitTextEditorCoordinator
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator)init;
- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
@end

@implementation UIKitTextEditorCoordinator

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  UIKitTextEditorCoordinator.textViewDidChange(_:)(v4);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = UIKitTextEditorCoordinator.textView(_:shouldChangeTextIn:replacementText:)(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIMenuElement);
  v7 = (UIMenu *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  uint64_t v9 = self;
  unint64_t v10 = (void *)specialized UIKitTextEditorCoordinator.textView(_:editMenuForTextIn:suggestedActions:)(v8, v7);

  swift_bridgeObjectRelease();

  return v10;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  v5 = self;
  UIKitTextEditorCoordinator.textViewDidChangeSelection(_:)(v4);
}

- (_TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator)init
{
  result = (_TtC7SwiftUIP33_A90AD0DD13E6C72FFE734B65FAFF6EFF26UIKitTextEditorCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end