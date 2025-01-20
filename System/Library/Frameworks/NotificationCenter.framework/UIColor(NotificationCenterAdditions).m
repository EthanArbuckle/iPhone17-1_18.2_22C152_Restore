@interface UIColor(NotificationCenterAdditions)
+ (id)nc_labelColor;
@end

@implementation UIColor(NotificationCenterAdditions)

+ (id)nc_labelColor
{
  v17[3] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F1C550];
  v15 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:0];
  v16[0] = v15;
  v14 = [MEMORY[0x263F54000] _visualStylingProviderForRecipe:3 category:1 andUserInterfaceStyle:1];
  v13 = [v14 _visualStylingForStyle:0];
  v12 = [v13 color];
  v17[0] = v12;
  v1 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
  v16[1] = v1;
  v2 = [MEMORY[0x263F54000] _visualStylingProviderForRecipe:3 category:1 andUserInterfaceStyle:1];
  v3 = [v2 _visualStylingForStyle:0];
  v4 = [v3 color];
  v17[1] = v4;
  v5 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  v16[2] = v5;
  v6 = [MEMORY[0x263F54000] _visualStylingProviderForRecipe:3 category:1 andUserInterfaceStyle:2];
  v7 = [v6 _visualStylingForStyle:0];
  v8 = [v7 color];
  v17[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  v10 = [v0 _dynamicColorWithColorsByTraitCollection:v9];

  return v10;
}

@end