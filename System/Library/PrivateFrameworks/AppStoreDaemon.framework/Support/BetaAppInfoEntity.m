@interface BetaAppInfoEntity
+ (id)databaseTable;
@end

@implementation BetaAppInfoEntity

+ (id)databaseTable
{
  return @"beta_app_info";
}

@end