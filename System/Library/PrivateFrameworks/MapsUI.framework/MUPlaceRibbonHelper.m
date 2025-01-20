@interface MUPlaceRibbonHelper
+ (id)costStringForValue:(unint64_t)a3 locale:(id)a4;
+ (id)priceRangeForMapItem:(id)a3 locale:(id)a4;
@end

@implementation MUPlaceRibbonHelper

+ (id)costStringForValue:(unint64_t)a3 locale:(id)a4
{
  if (a3)
  {
    v5 = MKCurrencySymbolForLocale();
    v6 = &stru_1EE3BF360;
    unsigned int v7 = 1;
    do
    {
      v8 = v6;
      v6 = [NSString stringWithFormat:@"%@%@", v6, v5];

      unint64_t v9 = v7++;
    }
    while (v9 < a3);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)priceRangeForMapItem:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [v6 _geoMapItem];

    if (v8)
    {
      unint64_t v9 = [v6 _geoMapItem];
      objc_msgSend(a1, "costStringForValue:locale:", objc_msgSend(v9, "_priceRange"), v7);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = &stru_1EE3BF360;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end