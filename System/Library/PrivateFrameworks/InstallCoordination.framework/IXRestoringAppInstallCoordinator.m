@interface IXRestoringAppInstallCoordinator
+ (unint64_t)intent;
- (id)validInstallTypes;
@end

@implementation IXRestoringAppInstallCoordinator

+ (unint64_t)intent
{
  return 3;
}

- (id)validInstallTypes
{
  return &unk_1EFE06DB0;
}

@end