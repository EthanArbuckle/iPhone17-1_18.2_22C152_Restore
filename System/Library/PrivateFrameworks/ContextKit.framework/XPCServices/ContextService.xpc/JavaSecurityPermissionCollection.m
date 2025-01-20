@interface JavaSecurityPermissionCollection
+ (const)__metadata;
- (BOOL)impliesWithJavaSecurityPermission:(id)a3;
- (BOOL)isReadOnly;
- (id)elements;
- (void)addWithJavaSecurityPermission:(id)a3;
@end

@implementation JavaSecurityPermissionCollection

- (void)addWithJavaSecurityPermission:(id)a3
{
}

- (id)elements
{
  return 0;
}

- (BOOL)impliesWithJavaSecurityPermission:(id)a3
{
  return 0;
}

- (BOOL)isReadOnly
{
  return 1;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004611F8;
}

@end