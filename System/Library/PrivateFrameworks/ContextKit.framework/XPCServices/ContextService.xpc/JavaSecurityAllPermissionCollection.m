@interface JavaSecurityAllPermissionCollection
+ (const)__metadata;
- (BOOL)impliesWithJavaSecurityPermission:(id)a3;
- (JavaSecurityAllPermissionCollection)init;
- (id)elements;
@end

@implementation JavaSecurityAllPermissionCollection

- (id)elements
{
  return 0;
}

- (BOOL)impliesWithJavaSecurityPermission:(id)a3
{
  return 1;
}

- (JavaSecurityAllPermissionCollection)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100474350;
}

@end