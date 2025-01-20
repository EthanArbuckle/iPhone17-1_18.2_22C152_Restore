@interface IFImageBag(IconServicesAdditions)
+ (id)defaultAppClipAssetsBag;
+ (id)defaultAppIconAssetsBag;
+ (void)defaultAppIconAssetsBag;
@end

@implementation IFImageBag(IconServicesAdditions)

+ (id)defaultAppIconAssetsBag
{
  if (defaultAppIconAssetsBag_onceToken != -1) {
    dispatch_once(&defaultAppIconAssetsBag_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)defaultAppIconAssetsBag_bag;
  if (!defaultAppIconAssetsBag_bag)
  {
    v1 = _ISDefaultLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      +[IFImageBag(IconServicesAdditions) defaultAppIconAssetsBag](v1);
    }

    v0 = (void *)defaultAppIconAssetsBag_bag;
  }
  return v0;
}

+ (id)defaultAppClipAssetsBag
{
  if (defaultAppClipAssetsBag_onceToken != -1) {
    dispatch_once(&defaultAppClipAssetsBag_onceToken, &__block_literal_global_4_0);
  }
  v0 = (void *)defaultAppClipAssetsBag_bag;
  if (!defaultAppClipAssetsBag_bag)
  {
    v1 = _ISDefaultLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      -[ISStaticResources genericAppClipIconResource](v1);
    }

    v0 = (void *)defaultAppClipAssetsBag_bag;
  }
  return v0;
}

+ (void)defaultAppIconAssetsBag
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve default app icon assets", v1, 2u);
}

@end