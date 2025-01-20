@interface ContextualSuggestionContext
+ (BOOL)supportsSecureCoding;
- (_TtC26ContextualSuggestionClient27ContextualSuggestionContext)init;
- (_TtC26ContextualSuggestionClient27ContextualSuggestionContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContextualSuggestionContext

- (_TtC26ContextualSuggestionClient27ContextualSuggestionContext)initWithCoder:(id)a3
{
  return (_TtC26ContextualSuggestionClient27ContextualSuggestionContext *)ContextualSuggestionContext.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ContextualSuggestionContext.encode(with:)((NSCoder)v4);
}

- (_TtC26ContextualSuggestionClient27ContextualSuggestionContext)init
{
  result = (_TtC26ContextualSuggestionClient27ContextualSuggestionContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26ContextualSuggestionClient27ContextualSuggestionContext_representation));
  swift_bridgeObjectRelease();
}

@end