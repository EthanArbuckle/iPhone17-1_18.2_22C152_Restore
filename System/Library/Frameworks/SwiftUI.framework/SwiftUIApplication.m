@interface SwiftUIApplication
- (BOOL)_supportsPrintCommand;
- (_TtC7SwiftUIP33_ACC2C5639A7D76F611E170E831FCA49118SwiftUIApplication)init;
- (id)_extendLaunchTest;
@end

@implementation SwiftUIApplication

- (id)_extendLaunchTest
{
  if (static AppGraph.shared
    && (type metadata accessor for AccessibilityValueStorage?(0, (unint64_t *)&lazy cache variable for type metadata for String?), v3 = self, swift_retain(), static Update.ensure<A>(_:)(), v3, swift_release(), v6))
  {
    v4 = (void *)MEMORY[0x18C115780]();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (_TtC7SwiftUIP33_ACC2C5639A7D76F611E170E831FCA49118SwiftUIApplication)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SwiftUIApplication *)&v3 init];
}

- (BOOL)_supportsPrintCommand
{
  if (!static AppGraph.shared) {
    return 0;
  }
  uint64_t v2 = one-time initialization token for printing;
  objc_super v3 = self;
  uint64_t v4 = swift_retain();
  if (v2 != -1) {
    uint64_t v4 = swift_once();
  }
  MEMORY[0x1F4188790](v4);
  static Update.ensure<A>(_:)();

  swift_release();
  return v6;
}

@end