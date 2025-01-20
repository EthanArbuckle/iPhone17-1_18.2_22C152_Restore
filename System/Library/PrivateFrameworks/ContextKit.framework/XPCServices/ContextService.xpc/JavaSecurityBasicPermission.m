@interface JavaSecurityBasicPermission
+ (const)__metadata;
- (BOOL)impliesWithJavaSecurityPermission:(id)a3;
- (JavaSecurityBasicPermission)initWithNSString:(id)a3;
- (JavaSecurityBasicPermission)initWithNSString:(id)a3 withNSString:(id)a4;
- (id)getActions;
@end

@implementation JavaSecurityBasicPermission

- (JavaSecurityBasicPermission)initWithNSString:(id)a3
{
  return self;
}

- (JavaSecurityBasicPermission)initWithNSString:(id)a3 withNSString:(id)a4
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
  return (const J2ObjcClassInfo *)&unk_100440A90;
}

@end