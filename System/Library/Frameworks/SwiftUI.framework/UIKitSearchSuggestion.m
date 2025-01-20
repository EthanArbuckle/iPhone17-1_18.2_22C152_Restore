@interface UIKitSearchSuggestion
- (NSAttributedString)localizedAttributedSuggestion;
- (NSString)localizedDescription;
- (NSString)localizedSuggestion;
- (UIImage)iconImage;
- (_TtC7SwiftUI21UIKitSearchSuggestion)init;
- (id)representedObject;
- (void)setRepresentedObject:(id)a3;
@end

@implementation UIKitSearchSuggestion

- (NSString)localizedSuggestion
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI21UIKitSearchSuggestion_platformItem);
  if (v2)
  {
    v3 = self;
    id v4 = objc_msgSend(v2, sel_string);
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;

    v2 = (void *)MEMORY[0x18C115780](v5, v7);
    swift_bridgeObjectRelease();
  }

  return (NSString *)v2;
}

- (NSAttributedString)localizedAttributedSuggestion
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC7SwiftUI21UIKitSearchSuggestion_platformItem));
}

- (id)representedObject
{
  return 0;
}

- (void)setRepresentedObject:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  outlined destroy of Toolbar.UpdateContext?((uint64_t)v6, (uint64_t)&lazy cache variable for type metadata for Any?, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))type metadata accessor for Toolbar.UpdateContext?);
}

- (NSString)localizedDescription
{
  return (NSString *)0;
}

- (UIImage)iconImage
{
  v2 = self;
  v3 = (void *)UIKitSearchSuggestion.iconImage.getter();

  return (UIImage *)v3;
}

- (_TtC7SwiftUI21UIKitSearchSuggestion)init
{
  result = (_TtC7SwiftUI21UIKitSearchSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end