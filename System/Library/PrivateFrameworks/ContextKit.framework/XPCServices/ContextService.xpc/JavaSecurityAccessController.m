@interface JavaSecurityAccessController
+ (const)__metadata;
+ (id)doPrivilegedWithCombinerWithJavaSecurityPrivilegedAction:(id)a3;
+ (id)doPrivilegedWithCombinerWithJavaSecurityPrivilegedExceptionAction:(id)a3;
+ (id)doPrivilegedWithJavaSecurityPrivilegedAction:(id)a3;
+ (id)doPrivilegedWithJavaSecurityPrivilegedAction:(id)a3 withJavaSecurityAccessControlContext:(id)a4;
+ (id)doPrivilegedWithJavaSecurityPrivilegedExceptionAction:(id)a3;
+ (id)doPrivilegedWithJavaSecurityPrivilegedExceptionAction:(id)a3 withJavaSecurityAccessControlContext:(id)a4;
+ (id)getContext;
@end

@implementation JavaSecurityAccessController

+ (id)doPrivilegedWithJavaSecurityPrivilegedAction:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 run];
}

+ (id)doPrivilegedWithJavaSecurityPrivilegedAction:(id)a3 withJavaSecurityAccessControlContext:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 run];
}

+ (id)doPrivilegedWithJavaSecurityPrivilegedExceptionAction:(id)a3
{
  return JavaSecurityAccessController_doPrivilegedWithJavaSecurityPrivilegedExceptionAction_(a3);
}

+ (id)doPrivilegedWithJavaSecurityPrivilegedExceptionAction:(id)a3 withJavaSecurityAccessControlContext:(id)a4
{
  return JavaSecurityAccessController_doPrivilegedWithJavaSecurityPrivilegedExceptionAction_(a3);
}

+ (id)doPrivilegedWithCombinerWithJavaSecurityPrivilegedAction:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 run];
}

+ (id)doPrivilegedWithCombinerWithJavaSecurityPrivilegedExceptionAction:(id)a3
{
  return JavaSecurityAccessController_doPrivilegedWithJavaSecurityPrivilegedExceptionAction_(a3);
}

+ (id)getContext
{
  v2 = new_JavaSecurityAccessControlContext_initWithJavaSecurityProtectionDomainArray_();
  return v2;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046AC30;
}

@end