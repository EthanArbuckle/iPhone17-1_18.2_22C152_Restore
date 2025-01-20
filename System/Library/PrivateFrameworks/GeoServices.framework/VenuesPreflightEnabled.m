@interface VenuesPreflightEnabled
@end

@implementation VenuesPreflightEnabled

id GeoServicesConfig_VenuesPreflightEnabled_Metadata_block_invoke_312()
{
  v0 = NSNumber;
  v1 = +[GEOPlatform sharedPlatform];
  v2 = objc_msgSend(v0, "numberWithBool:", objc_msgSend(v1, "isInternalInstall"));

  return v2;
}

@end