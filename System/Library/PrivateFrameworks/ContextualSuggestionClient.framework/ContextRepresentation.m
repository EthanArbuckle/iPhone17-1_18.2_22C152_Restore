@interface ContextRepresentation
+ (BOOL)supportsSecureCoding;
- (_TtC26ContextualSuggestionClient21ContextRepresentation)init;
- (_TtC26ContextualSuggestionClient21ContextRepresentation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContextRepresentation

- (_TtC26ContextualSuggestionClient21ContextRepresentation)initWithCoder:(id)a3
{
  return (_TtC26ContextualSuggestionClient21ContextRepresentation *)ContextRepresentation.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ContextRepresentation.encode(with:)((NSCoder)v4);
}

- (_TtC26ContextualSuggestionClient21ContextRepresentation)init
{
  result = (_TtC26ContextualSuggestionClient21ContextRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end