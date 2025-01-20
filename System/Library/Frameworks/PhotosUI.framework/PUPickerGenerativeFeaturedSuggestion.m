@interface PUPickerGenerativeFeaturedSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldReverseSortOrder;
- (PUPickerGenerativeFeaturedSuggestion)init;
- (PUPickerGenerativeFeaturedSuggestion)initWithCoder:(id)a3;
@end

@implementation PUPickerGenerativeFeaturedSuggestion

- (PUPickerGenerativeFeaturedSuggestion)init
{
  return (PUPickerGenerativeFeaturedSuggestion *)PickerGenerativeFeaturedSuggestion.init()();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUPickerGenerativeFeaturedSuggestion)initWithCoder:(id)a3
{
  return (PUPickerGenerativeFeaturedSuggestion *)PickerGenerativeFeaturedSuggestion.init(coder:)(a3);
}

- (BOOL)shouldReverseSortOrder
{
  return 0;
}

@end