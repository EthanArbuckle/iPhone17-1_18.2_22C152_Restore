@interface ASMigrator
- (BOOL)performMigration;
- (id)dataClassName;
@end

@implementation ASMigrator

- (id)dataClassName
{
  return @"MobileAsset";
}

- (BOOL)performMigration
{
  return 1;
}
@end