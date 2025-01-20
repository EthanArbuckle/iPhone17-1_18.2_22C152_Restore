@interface HKCodedQuantity(Display)
- (id)_shortDisplayStringForComparatorCode:()Display;
- (id)displayString;
@end

@implementation HKCodedQuantity(Display)

- (id)displayString
{
  v2 = [a1 comparatorCoding];

  if (v2)
  {
    v3 = [a1 comparatorCoding];
    v4 = [v3 code];
    v5 = [a1 _shortDisplayStringForComparatorCode:v4];

    v6 = [a1 localizedValue];
    v7 = [v5 stringByAppendingString:v6];
  }
  else
  {
    v7 = [a1 localizedValue];
  }
  return v7;
}

- (id)_shortDisplayStringForComparatorCode:()Display
{
  uint64_t v3 = _shortDisplayStringForComparatorCode__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_shortDisplayStringForComparatorCode__onceToken, &__block_literal_global_4);
  }
  v5 = [(id)_shortDisplayStringForComparatorCode__shortDisplayStringComparatorDictionary objectForKeyedSubscript:v4];

  return v5;
}

@end