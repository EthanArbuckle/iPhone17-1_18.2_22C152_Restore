@interface WidgetPersonality
- (BOOL)matchesPersonality:(id)a3;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (_TtC26ContextualSuggestionClient17WidgetPersonality)init;
@end

@implementation WidgetPersonality

- (NSString)extensionBundleIdentifier
{
  return (NSString *)sub_24A79F960();
}

- (NSString)kind
{
  return (NSString *)sub_24A79F960();
}

- (BOOL)matchesPersonality:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  char v6 = sub_24A79FAF0(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (_TtC26ContextualSuggestionClient17WidgetPersonality)init
{
  result = (_TtC26ContextualSuggestionClient17WidgetPersonality *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end