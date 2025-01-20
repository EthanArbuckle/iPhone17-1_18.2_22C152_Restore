@interface JavaUtilLoggingLoggingPermission
+ (const)__metadata;
- (BOOL)impliesWithJavaSecurityPermission:(id)a3;
- (JavaUtilLoggingLoggingPermission)initWithNSString:(id)a3 withNSString:(id)a4;
- (id)getActions;
@end

@implementation JavaUtilLoggingLoggingPermission

- (JavaUtilLoggingLoggingPermission)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (id)getActions
{
  return 0;
}

- (BOOL)impliesWithJavaSecurityPermission:(id)a3
{
  return 1;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100479038;
}

@end