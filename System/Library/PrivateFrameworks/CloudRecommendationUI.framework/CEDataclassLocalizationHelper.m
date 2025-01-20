@interface CEDataclassLocalizationHelper
+ (id)localizedTextForDataclass:(id)a3;
@end

@implementation CEDataclassLocalizationHelper

+ (id)localizedTextForDataclass:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if ([v3 isEqualToString:*MEMORY[0x263EFAC58]])
  {
    id v4 = (id)*MEMORY[0x263EFACC0];
  }
  v5 = (void *)MEMORY[0x263F23150];
  v9[0] = v4;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v7 = [v5 localizedTextForDataclasses:v6 usedAtBeginningOfSentence:1 forAccount:0];

  return v7;
}

@end