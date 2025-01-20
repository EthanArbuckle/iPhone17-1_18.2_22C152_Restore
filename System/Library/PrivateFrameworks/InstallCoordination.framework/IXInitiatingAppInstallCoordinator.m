@interface IXInitiatingAppInstallCoordinator
+ (unint64_t)intent;
- (id)validInstallTypes;
@end

@implementation IXInitiatingAppInstallCoordinator

+ (unint64_t)intent
{
  return 1;
}

- (id)validInstallTypes
{
  return &unk_1EFE06E88;
}

@end