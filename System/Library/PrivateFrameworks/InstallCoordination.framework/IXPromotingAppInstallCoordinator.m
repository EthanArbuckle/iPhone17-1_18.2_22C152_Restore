@interface IXPromotingAppInstallCoordinator
+ (unint64_t)intent;
- (id)validInstallTypes;
@end

@implementation IXPromotingAppInstallCoordinator

+ (unint64_t)intent
{
  return 5;
}

- (id)validInstallTypes
{
  return &unk_1EFE06E70;
}

@end