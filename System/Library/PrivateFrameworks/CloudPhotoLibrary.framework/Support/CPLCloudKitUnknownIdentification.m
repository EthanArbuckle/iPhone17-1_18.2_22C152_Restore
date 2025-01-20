@interface CPLCloudKitUnknownIdentification
+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4;
+ (id)recordNamesForScopeInfo;
@end

@implementation CPLCloudKitUnknownIdentification

+ (id)recordNamesForScopeInfo
{
  return &__NSArray0__struct;
}

+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4
{
  return 1;
}

@end