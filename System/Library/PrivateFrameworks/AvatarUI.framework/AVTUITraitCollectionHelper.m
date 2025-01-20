@interface AVTUITraitCollectionHelper
+ (id)overridenTraitFromTrait:(id)a3;
@end

@implementation AVTUITraitCollectionHelper

+ (id)overridenTraitFromTrait:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if ([v3 userInterfaceStyle] == 2)
  {
    v5 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceLevel:1];
    v6 = (void *)MEMORY[0x263F1CB00];
    v9[0] = v3;
    v9[1] = v5;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
    v4 = [v6 traitCollectionWithTraitsFromCollections:v7];
  }
  return v4;
}

@end