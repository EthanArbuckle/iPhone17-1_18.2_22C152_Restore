@interface ATXContextualSuggestionSnapshot
+ (BOOL)supportsSecureCoding;
- (ATXContextualSuggestionSnapshot)init;
- (ATXContextualSuggestionSnapshot)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXContextualSuggestionSnapshot

- (ATXContextualSuggestionSnapshot)initWithCoder:(id)a3
{
  return (ATXContextualSuggestionSnapshot *)ContextualSuggestionSnapshot.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  type metadata accessor for ContextualSuggestionContext();
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_24A7B3408();
  id v8 = (id)sub_24A7B3378();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (ATXContextualSuggestionSnapshot)init
{
  result = (ATXContextualSuggestionSnapshot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end