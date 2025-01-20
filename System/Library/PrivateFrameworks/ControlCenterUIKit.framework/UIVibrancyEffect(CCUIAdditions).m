@interface UIVibrancyEffect(CCUIAdditions)
+ (id)controlCenterKeyLineOnDarkVibrancyEffect;
+ (id)controlCenterKeyLineOnLightVibrancyEffect;
+ (id)controlCenterPrimaryOnLightVibrancyEffect;
+ (id)controlCenterPrimaryVibrancyEffect;
+ (id)controlCenterScrollViewDarkeningVibrancyEffect;
+ (id)controlCenterSecondaryOnLightVibrancyEffect;
+ (id)controlCenterSecondaryVibrancyEffect;
@end

@implementation UIVibrancyEffect(CCUIAdditions)

+ (id)controlCenterPrimaryVibrancyEffect
{
  v0 = objc_msgSend(MEMORY[0x1E4F743E8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 1);
  v1 = [v0 _visualStylingForStyle:0];
  v2 = [v1 visualEffect];

  return v2;
}

+ (id)controlCenterSecondaryVibrancyEffect
{
  +[CCUIControlCenterMaterialView _controlCenterModulesRecipe];
  v0 = _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle();
  v1 = [MEMORY[0x1E4FB1EA0] _vibrantEffectForLightMaterial:v0 darkMaterial:0 vibrancyStyle:102];

  return v1;
}

+ (id)controlCenterPrimaryOnLightVibrancyEffect
{
  v0 = objc_msgSend(MEMORY[0x1E4F743E8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 1);
  v1 = [v0 _controlCenterPrimaryOnLightVisualStyling];
  v2 = [v1 visualEffect];

  return v2;
}

+ (id)controlCenterSecondaryOnLightVibrancyEffect
{
  v0 = objc_msgSend(MEMORY[0x1E4F743E8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 1);
  v1 = [v0 _controlCenterSecondaryOnLightVisualStyling];
  v2 = [v1 visualEffect];

  return v2;
}

+ (id)controlCenterScrollViewDarkeningVibrancyEffect
{
  v0 = objc_msgSend(MEMORY[0x1E4F743E8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 2);
  v1 = [v0 _controlCenterScrollViewDarkeningVisualStyling];
  v2 = [v1 visualEffect];

  return v2;
}

+ (id)controlCenterKeyLineOnDarkVibrancyEffect
{
  v0 = objc_msgSend(MEMORY[0x1E4F743E8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 2);
  v1 = [v0 _visualStylingForStyle:5];
  v2 = [v1 visualEffect];

  return v2;
}

+ (id)controlCenterKeyLineOnLightVibrancyEffect
{
  v0 = objc_msgSend(MEMORY[0x1E4F743E8], "_visualStylingProviderForRecipe:andCategory:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"), 1);
  v1 = [v0 _controlCenterKeyLineOnLightVisualStyling];
  v2 = [v1 visualEffect];

  return v2;
}

@end