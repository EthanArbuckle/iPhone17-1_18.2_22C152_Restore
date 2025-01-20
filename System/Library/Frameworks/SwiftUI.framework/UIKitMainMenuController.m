@interface UIKitMainMenuController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC7SwiftUI23UIKitMainMenuController)init;
- (void)_performMainMenuShortcutKeyCommand:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
@end

@implementation UIKitMainMenuController

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  UIKitMainMenuController.buildMenu(with:)(a3);
  swift_unknownObjectRelease();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  char v8 = UIKitMainMenuController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  _sypSgWOhTm_8((uint64_t)v10, (uint64_t)&lazy cache variable for type metadata for Any?, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))type metadata accessor for _ContiguousArrayStorage<MenuBuilderInstruction>);
  return v8 & 1;
}

- (void)_performMainMenuShortcutKeyCommand:(id)a3
{
  v4 = (UIKeyCommand *)a3;
  v5 = self;
  UIKitMainMenuController._performMainMenuShortcutKeyCommand(_:)(v4);
}

- (_TtC7SwiftUI23UIKitMainMenuController)init
{
  result = (_TtC7SwiftUI23UIKitMainMenuController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end