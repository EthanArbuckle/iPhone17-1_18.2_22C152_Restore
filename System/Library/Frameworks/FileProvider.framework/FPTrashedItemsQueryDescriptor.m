@interface FPTrashedItemsQueryDescriptor
- (BOOL)supportsQueryingAllMountPoints;
- (id)name;
- (id)queryStringForMountPoint:(id)a3;
@end

@implementation FPTrashedItemsQueryDescriptor

- (id)queryStringForMountPoint:(id)a3
{
  v4 = [(FPSpotlightQueryDescriptor *)self settings];
  [v4 excludedParentOIDs];

  v5 = NSString;
  v6 = FPIsTrashedQueryStringFragment(1);
  v7 = [(FPSpotlightQueryDescriptor *)self settings];
  v8 = [v7 allowedProviders];
  v9 = FPFileProviderOriginatedItemsQueryStringFragment(v8);
  v10 = [(FPSpotlightQueryDescriptor *)self settings];
  v11 = [v10 excludedParentOIDs];
  v12 = FPExcludedOIDParentsQueryStringFragment(v11);
  v13 = [v5 stringWithFormat:@"%@ && %@ && (%@)", v6, v9, v12];

  return v13;
}

- (BOOL)supportsQueryingAllMountPoints
{
  return 0;
}

- (id)name
{
  return (id)[NSString stringWithUTF8String:"TRSH"];
}

@end