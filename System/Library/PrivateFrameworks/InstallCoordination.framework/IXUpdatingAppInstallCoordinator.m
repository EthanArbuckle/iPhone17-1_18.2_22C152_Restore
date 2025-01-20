@interface IXUpdatingAppInstallCoordinator
+ (unint64_t)intent;
- (id)validInstallTypes;
@end

@implementation IXUpdatingAppInstallCoordinator

+ (unint64_t)intent
{
  return 2;
}

- (id)validInstallTypes
{
  return &unk_1EFE06E58;
}

@end