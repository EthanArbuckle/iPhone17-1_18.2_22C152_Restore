@interface CNSharedProfileStateOracleTestDouble
+ (BOOL)isFeatureEnabled;
+ (BOOL)shouldBypassPersistenceCheck;
@end

@implementation CNSharedProfileStateOracleTestDouble

+ (BOOL)isFeatureEnabled
{
  return 1;
}

+ (BOOL)shouldBypassPersistenceCheck
{
  return 1;
}

@end