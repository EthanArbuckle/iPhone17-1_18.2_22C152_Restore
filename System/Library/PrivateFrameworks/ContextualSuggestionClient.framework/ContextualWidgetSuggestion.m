@interface ContextualWidgetSuggestion
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC26ContextualSuggestionClient26ContextualWidgetSuggestion)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContextualWidgetSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC26ContextualSuggestionClient26ContextualWidgetSuggestion)initWithCoder:(id)a3
{
  return (_TtC26ContextualSuggestionClient26ContextualWidgetSuggestion *)ContextualWidgetSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24A7A5348(v4);
}

- (NSString)description
{
  v2 = self;
  sub_24A7A5630();

  v3 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_intent));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_scoreSpecification));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC26ContextualSuggestionClient26ContextualWidgetSuggestion_blendingClientModelSpecification);
}

@end