@interface StateManagerVerbosity
@end

@implementation StateManagerVerbosity

id GeoOfflineConfig_StateManagerVerbosity_Metadata_block_invoke_17()
{
  v0 = NSNumber;
  v1 = +[GEOPlatform sharedPlatform];
  v2 = objc_msgSend(v0, "numberWithInt:", objc_msgSend(v1, "isInternalInstall"));

  return v2;
}

@end