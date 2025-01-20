@interface UIView(CCUIAdditions_Internal)
- (void)_controlCenterApplyGalleryModuleBackgroundMaterial;
- (void)_controlCenterApplyModuleBackgroundMaterial;
@end

@implementation UIView(CCUIAdditions_Internal)

- (void)_controlCenterApplyModuleBackgroundMaterial
{
  v1 = [a1 viewWithTag:203948575];
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  objc_msgSend(v5, "setRecipe:", +[CCUIControlCenterMaterialView _controlCenterModulesRecipe](CCUIControlCenterMaterialView, "_controlCenterModulesRecipe"));
  [v5 setGroupNameBase:@"ControlCenterModuleBackground"];
}

- (void)_controlCenterApplyGalleryModuleBackgroundMaterial
{
  v1 = [a1 viewWithTag:203948575];
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v6 = v4;

  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  [v6 setRecipeName:@"modulesGallery" fromBundle:v5];

  [v6 setGroupNameBase:@"ControlCenterGalleryModuleBackground"];
}

@end