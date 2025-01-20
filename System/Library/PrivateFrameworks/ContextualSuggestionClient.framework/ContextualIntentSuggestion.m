@interface ContextualIntentSuggestion
+ (BOOL)supportsSecureCoding;
- (_TtC26ContextualSuggestionClient26ContextualIntentSuggestion)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContextualIntentSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC26ContextualSuggestionClient26ContextualIntentSuggestion)initWithCoder:(id)a3
{
  return (_TtC26ContextualSuggestionClient26ContextualIntentSuggestion *)ContextualIntentSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24A786598(v4);
  uint64_t v6 = *(uint64_t *)((char *)&v5->super.super.isa
                  + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent);
  id v7 = (id)sub_24A7B3378();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualIntentSuggestion_intent));
}

@end