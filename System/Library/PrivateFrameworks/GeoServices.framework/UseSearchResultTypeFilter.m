@interface UseSearchResultTypeFilter
@end

@implementation UseSearchResultTypeFilter

id MapsFeaturesConfig_UseSearchResultTypeFilter_Metadata_block_invoke_55()
{
  v0 = NSNumber;
  v1 = +[GEOCountryConfiguration sharedConfiguration];
  v2 = [v1 countryCode];
  v3 = objc_msgSend(v0, "numberWithInt:", objc_msgSend(v2, "isEqualToString:", @"CN") ^ 1);

  return v3;
}

@end