@interface CPLCloudKitIgnoredZoneIdentification
+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4;
+ (id)libraryInfoRecordName;
+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
@end

@implementation CPLCloudKitIgnoredZoneIdentification

+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  if (a4 == 0x7FFFFFFF) {
    return 0x7FFFFFFFLL;
  }
  else {
    return 0;
  }
}

+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4
{
  return 1;
}

+ (id)libraryInfoRecordName
{
  return @"PrimarySync-0000-LI";
}

@end