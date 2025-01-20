@interface BSBrand(BusinessServicesUI)
+ (id)makeBrandPlacecardForBrand:()BusinessServicesUI;
- (id)hoursConfig;
- (id)primaryBrandColor;
- (id)secondaryBrandColor;
@end

@implementation BSBrand(BusinessServicesUI)

+ (id)makeBrandPlacecardForBrand:()BusinessServicesUI
{
  v3 = (void *)MEMORY[0x263F2BD88];
  v4 = [a3 shim];
  v5 = [v3 wrapperFor:v4];
  v6 = +[_BSUIBrandPlacecardViewControllerObjcShim makeBrandPlacecardViewControllerWithBrandObjcShimOpaqueWrapper:v5];

  return v6;
}

- (id)hoursConfig
{
  v1 = (void *)MEMORY[0x263F2BD88];
  v2 = [a1 shim];
  v3 = [v1 wrapperFor:v2];
  v4 = +[_BSUIBrandPlacecardViewControllerObjcShim hoursConfigurationFor:v3];

  return v4;
}

- (id)primaryBrandColor
{
  id v2 = objc_alloc(MEMORY[0x263F825C8]);
  v3 = [a1 _primaryBrandColorHexString];
  v4 = (void *)[v2 initWithHexString:v3];

  return v4;
}

- (id)secondaryBrandColor
{
  id v2 = objc_alloc(MEMORY[0x263F825C8]);
  v3 = [a1 _secondaryBrandColorHexString];
  v4 = (void *)[v2 initWithHexString:v3];

  return v4;
}

@end