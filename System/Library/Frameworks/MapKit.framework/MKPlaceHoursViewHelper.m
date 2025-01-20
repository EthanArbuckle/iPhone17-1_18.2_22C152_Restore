@interface MKPlaceHoursViewHelper
+ (void)determineExtraRulesForPlaceHoursViews:(id)a3 withBusinessHours:(id)a4;
@end

@implementation MKPlaceHoursViewHelper

+ (void)determineExtraRulesForPlaceHoursViews:(id)a3 withBusinessHours:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] == 1)
  {
    id v7 = [v6 objectAtIndex:0];
    if ([v7 hoursType] == 1 && objc_msgSend(v5, "count") == 1)
    {
      v8 = [v5 objectAtIndex:0];
      objc_msgSend(v8, "setPlaceHoursViewOptions:", objc_msgSend(v8, "placeHoursViewOptions") | 0x10);

      goto LABEL_15;
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        v14 = objc_msgSend(v7, "objectAtIndex:", 0, (void)v15);

        if (v13 != v14) {
          objc_msgSend(v13, "setPlaceHoursViewOptions:", objc_msgSend(v13, "placeHoursViewOptions") | 0x100);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
LABEL_15:
}

@end