@interface CCUIControlCenterMaterialView
+ (id)_auxiliaryMaterialView;
+ (id)_darkMaterialView;
+ (id)_lightFillMaterialView;
+ (id)_lightFillView;
+ (id)_moduleBackgroundMaterialView;
+ (id)_tertiaryMaterialView;
+ (id)_tertiaryView;
+ (int64_t)_controlCenterBackgroundRecipe;
+ (int64_t)_controlCenterModulesRecipe;
@end

@implementation CCUIControlCenterMaterialView

+ (id)_moduleBackgroundMaterialView
{
  v2 = [a1 _darkMaterialView];
  [v2 setGroupNameBase:@"ControlCenterModuleBackground"];
  [v2 setTag:203948575];
  return v2;
}

+ (id)_darkMaterialView
{
  v2 = (void *)MEMORY[0x1E4F743C8];
  uint64_t v3 = [a1 _controlCenterModulesRecipe];
  return (id)[v2 materialViewWithRecipe:v3];
}

+ (id)_lightFillView
{
  v2 = [MEMORY[0x1E4F743E8] _visualStylingProviderForRecipe:4 andCategory:2];
  uint64_t v3 = (void *)[v2 newAutomaticallyUpdatingViewWithStyle:4];

  return v3;
}

+ (id)_lightFillMaterialView
{
  return (id)[MEMORY[0x1E4F743C8] materialViewWithVisualStyleFromRecipe:4 category:2 style:4 options:0 initialWeighting:0 compatibleWithTraitCollection:1.0];
}

+ (id)_tertiaryView
{
  v2 = [MEMORY[0x1E4F743E8] _visualStylingProviderForRecipe:4 andCategory:2];
  uint64_t v3 = (void *)[v2 newAutomaticallyUpdatingViewWithStyle:1];

  return v3;
}

+ (id)_tertiaryMaterialView
{
  return (id)[MEMORY[0x1E4F743C8] materialViewWithVisualStyleFromRecipe:4 category:2 style:1 options:0 initialWeighting:0 compatibleWithTraitCollection:1.0];
}

+ (id)_auxiliaryMaterialView
{
  v2 = (void *)MEMORY[0x1E4F743C8];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = [v2 materialViewWithRecipeNamed:@"auxiliary" inBundle:v3 options:0 initialWeighting:0 scaleAdjustment:1.0];

  return v4;
}

+ (int64_t)_controlCenterModulesRecipe
{
  return 8;
}

+ (int64_t)_controlCenterBackgroundRecipe
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 21;
  }
  else {
    return 20;
  }
}

@end