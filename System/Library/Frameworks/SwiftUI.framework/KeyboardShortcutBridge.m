@interface KeyboardShortcutBridge
- (_TtC7SwiftUI22KeyboardShortcutBridge)init;
- (void)_performShortcutKeyCommand:(id)a3;
@end

@implementation KeyboardShortcutBridge

- (_TtC7SwiftUI22KeyboardShortcutBridge)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUI22KeyboardShortcutBridge_currentBindings;
  uint64_t v5 = MEMORY[0x1E4FBC860];
  *(void *)v4 = MEMORY[0x1E4FBC860];
  *((_DWORD *)v4 + 2) = -1;
  v6 = (char *)self + OBJC_IVAR____TtC7SwiftUI22KeyboardShortcutBridge_updatedBindings;
  *(void *)v6 = v5;
  *((_DWORD *)v6 + 2) = -1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI22KeyboardShortcutBridge_shortcutMap) = (Class)MEMORY[0x1E4FBC868];
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI22KeyboardShortcutBridge_isObservingPreferences) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(KeyboardShortcutBridge *)&v8 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)_performShortcutKeyCommand:(id)a3
{
  v4 = (UIKeyCommand *)a3;
  uint64_t v5 = self;
  KeyboardShortcutBridge._performShortcutKeyCommand(_:)(v4);
}

@end