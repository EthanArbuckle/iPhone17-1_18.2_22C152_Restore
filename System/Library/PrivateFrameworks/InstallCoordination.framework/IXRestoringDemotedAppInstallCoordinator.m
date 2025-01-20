@interface IXRestoringDemotedAppInstallCoordinator
+ (unint64_t)intent;
- (id)validInstallTypes;
@end

@implementation IXRestoringDemotedAppInstallCoordinator

+ (unint64_t)intent
{
  return 4;
}

- (id)validInstallTypes
{
  return &unk_1EFE06EA0;
}

@end