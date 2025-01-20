@interface ContextualSuggestion
+ (BOOL)supportsSecureCoding;
- (_TtC26ContextualSuggestionClient20ContextualSuggestion)init;
- (_TtC26ContextualSuggestionClient20ContextualSuggestion)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContextualSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC26ContextualSuggestionClient20ContextualSuggestion)initWithCoder:(id)a3
{
  return (_TtC26ContextualSuggestionClient20ContextualSuggestion *)ContextualSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_24A7B3378();
  id v7 = (id)sub_24A7B3378();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (_TtC26ContextualSuggestionClient20ContextualSuggestion)init
{
  result = (_TtC26ContextualSuggestionClient20ContextualSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end