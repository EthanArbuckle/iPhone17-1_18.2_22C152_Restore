@interface IXDemotingAppInstallCoordinator
+ (unint64_t)intent;
- (id)validInstallTypes;
@end

@implementation IXDemotingAppInstallCoordinator

+ (unint64_t)intent
{
  return 6;
}

- (id)validInstallTypes
{
  return &unk_1EFE06E28;
}

@end