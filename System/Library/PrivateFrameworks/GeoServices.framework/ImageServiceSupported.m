@interface ImageServiceSupported
@end

@implementation ImageServiceSupported

id GeoServicesConfig_ImageServiceSupported_Metadata_block_invoke_330()
{
  v0 = NSNumber;
  v1 = +[GEOCountryConfiguration sharedConfiguration];
  v2 = [v1 countryCode];
  v3 = objc_msgSend(v0, "numberWithBool:", objc_msgSend(v2, "isEqualToString:", @"CN"));

  return v3;
}

@end