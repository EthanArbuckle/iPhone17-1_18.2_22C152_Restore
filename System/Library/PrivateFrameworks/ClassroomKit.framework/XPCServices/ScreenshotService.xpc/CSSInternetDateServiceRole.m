@interface CSSInternetDateServiceRole
- (NSString)entitlement;
- (Protocol)protocol;
- (void)configureInterfaceForRole:(id)a3;
@end

@implementation CSSInternetDateServiceRole

- (NSString)entitlement
{
  return (NSString *)@"com.apple.ClassroomKit.InternetDateService-access";
}

- (Protocol)protocol
{
  return (Protocol *)&OBJC_PROTOCOL___CRKInternetDateFetching;
}

- (void)configureInterfaceForRole:(id)a3
{
}

@end