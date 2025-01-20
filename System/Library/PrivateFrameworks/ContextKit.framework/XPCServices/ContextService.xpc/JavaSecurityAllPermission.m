@interface JavaSecurityAllPermission
+ (const)__metadata;
- (BOOL)impliesWithJavaSecurityPermission:(id)a3;
- (JavaSecurityAllPermission)init;
- (JavaSecurityAllPermission)initWithNSString:(id)a3 withNSString:(id)a4;
- (id)getActions;
@end

@implementation JavaSecurityAllPermission

- (JavaSecurityAllPermission)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaSecurityAllPermission)init
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
  return (const J2ObjcClassInfo *)&unk_100440368;
}

@end