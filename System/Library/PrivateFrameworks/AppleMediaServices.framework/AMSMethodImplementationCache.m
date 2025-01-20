@interface AMSMethodImplementationCache
+ (BOOL)implementationsOf:(SEL)a3 areEqualIn:(Class)a4 and:(Class)a5;
+ (void)implementationOf:(SEL)a3 forInstancesOf:(Class)a4;
- (AMSMethodImplementationCache)init;
@end

@implementation AMSMethodImplementationCache

+ (BOOL)implementationsOf:(SEL)a3 areEqualIn:(Class)a4 and:(Class)a5
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v7 = swift_getObjCClassMetadata();
  return static MethodImplementationCache.implementations(of:areEqualIn:and:)((uint64_t)a3, ObjCClassMetadata, v7);
}

+ (void)implementationOf:(SEL)a3 forInstancesOf:(Class)a4
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  return static MethodImplementationCache.implementation(of:forInstancesOf:)((uint64_t)a3, ObjCClassMetadata);
}

- (AMSMethodImplementationCache)init
{
  return (AMSMethodImplementationCache *)MethodImplementationCache.init()();
}

@end