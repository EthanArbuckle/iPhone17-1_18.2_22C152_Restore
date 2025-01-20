@interface JavaIoFilePermission
+ (const)__metadata;
- (BOOL)impliesWithJavaSecurityPermission:(id)a3;
- (JavaIoFilePermission)initWithNSString:(id)a3 withNSString:(id)a4;
- (id)getActions;
@end

@implementation JavaIoFilePermission

- (JavaIoFilePermission)initWithNSString:(id)a3 withNSString:(id)a4
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
  return (const J2ObjcClassInfo *)&unk_100462618;
}

@end