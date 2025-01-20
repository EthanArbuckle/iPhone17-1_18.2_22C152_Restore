@interface PUPickerSuggestionAvailableClasses
+ (id)all;
- (PUPickerSuggestionAvailableClasses)init;
@end

@implementation PUPickerSuggestionAvailableClasses

+ (id)all
{
  id v2 = static PickerSuggestionAvailableClasses.all()();

  return v2;
}

- (PUPickerSuggestionAvailableClasses)init
{
  return (PUPickerSuggestionAvailableClasses *)PickerSuggestionAvailableClasses.init()();
}

@end