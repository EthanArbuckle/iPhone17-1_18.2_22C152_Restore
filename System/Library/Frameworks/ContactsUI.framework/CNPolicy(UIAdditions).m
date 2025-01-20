@interface CNPolicy(UIAdditions)
- (uint64_t)_cnui_maximumNumberOfValuesForProperty:()UIAdditions;
@end

@implementation CNPolicy(UIAdditions)

- (uint64_t)_cnui_maximumNumberOfValuesForProperty:()UIAdditions
{
  id v4 = a3;
  if ([v4 isEqualToString:@"birthdays"])
  {
    uint64_t v5 = [a1 maximumCountOfValuesForContactProperty:*MEMORY[0x1E4F1AD90]];
    uint64_t v6 = [a1 maximumCountOfValuesForContactProperty:*MEMORY[0x1E4F1AEC8]] + v5;
  }
  else
  {
    uint64_t v6 = [a1 maximumCountOfValuesForContactProperty:v4];
  }

  return v6;
}

@end