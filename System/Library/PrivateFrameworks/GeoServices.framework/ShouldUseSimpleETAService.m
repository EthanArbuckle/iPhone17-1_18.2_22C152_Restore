@interface ShouldUseSimpleETAService
@end

@implementation ShouldUseSimpleETAService

id GeoServicesConfig_ShouldUseSimpleETAService_Metadata_block_invoke_91()
{
  v0 = NSNumber;
  v1 = GEOGetURLWithSource(18, 0);
  v2 = [v0 numberWithInt:v1 != 0];

  return v2;
}

@end