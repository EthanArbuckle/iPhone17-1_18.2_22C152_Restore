@interface CSSApplicationInfoServiceRole
- (NSString)entitlement;
- (Protocol)protocol;
- (void)configureInterfaceForRole:(id)a3;
@end

@implementation CSSApplicationInfoServiceRole

- (NSString)entitlement
{
  return (NSString *)@"com.apple.ClassroomKit.ApplicationInfoService-access";
}

- (Protocol)protocol
{
  return (Protocol *)&OBJC_PROTOCOL___CRKApplicationInfoServiceInterface;
}

- (void)configureInterfaceForRole:(id)a3
{
}

@end