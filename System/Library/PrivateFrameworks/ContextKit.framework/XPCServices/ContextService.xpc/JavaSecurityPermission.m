@interface JavaSecurityPermission
+ (const)__metadata;
- (BOOL)impliesWithJavaSecurityPermission:(id)a3;
- (id)getActions;
- (id)getName;
- (id)newPermissionCollection;
@end

@implementation JavaSecurityPermission

- (id)getName
{
  return 0;
}

- (id)newPermissionCollection
{
  v2 = new_JavaSecurityAllPermissionCollection_init();
  return v2;
}

- (id)getActions
{
  return 0;
}

- (BOOL)impliesWithJavaSecurityPermission:(id)a3
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100480D40;
}

@end