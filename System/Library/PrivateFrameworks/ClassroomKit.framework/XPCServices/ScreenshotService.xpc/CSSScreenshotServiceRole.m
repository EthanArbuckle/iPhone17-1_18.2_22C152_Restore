@interface CSSScreenshotServiceRole
- (NSString)entitlement;
- (Protocol)protocol;
- (void)configureInterfaceForRole:(id)a3;
@end

@implementation CSSScreenshotServiceRole

- (NSString)entitlement
{
  return (NSString *)@"com.apple.ClassroomKit.ScreenshotService-access";
}

- (Protocol)protocol
{
  return (Protocol *)&OBJC_PROTOCOL___CRKScreenshotServiceInterface;
}

- (void)configureInterfaceForRole:(id)a3
{
}

@end