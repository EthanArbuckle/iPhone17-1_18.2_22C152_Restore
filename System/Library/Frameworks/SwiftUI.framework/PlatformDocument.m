@interface PlatformDocument
- (_TtC7SwiftUI16PlatformDocument)initWithFileURL:(id)a3;
- (void)dealloc;
@end

@implementation PlatformDocument

- (void)dealloc
{
  v2 = self;
  PlatformDocument.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (_TtC7SwiftUI16PlatformDocument)initWithFileURL:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  MEMORY[0x1F4188790](v3 - 8);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  result = (_TtC7SwiftUI16PlatformDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end