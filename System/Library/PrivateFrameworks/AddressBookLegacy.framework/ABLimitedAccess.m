@interface ABLimitedAccess
+ (BOOL)isLimitedAccessFF_Enabled;
+ (id)limitedAccessLeftJoinWhereClause;
+ (void)appendLimitedAccessLeftJoinToQueryString:(id)a3;
@end

@implementation ABLimitedAccess

+ (BOOL)isLimitedAccessFF_Enabled
{
  return _os_feature_enabled_impl();
}

+ (void)appendLimitedAccessLeftJoinToQueryString:(id)a3
{
}

+ (id)limitedAccessLeftJoinWhereClause
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @" la.BundleID = ? AND la.IsActive = %i", 1);
}

@end