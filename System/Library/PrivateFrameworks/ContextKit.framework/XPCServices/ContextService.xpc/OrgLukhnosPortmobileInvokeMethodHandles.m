@interface OrgLukhnosPortmobileInvokeMethodHandles
+ (id)publicLookup;
+ (void)initialize;
@end

@implementation OrgLukhnosPortmobileInvokeMethodHandles

+ (id)publicLookup
{
  if ((atomic_load_explicit(OrgLukhnosPortmobileInvokeMethodHandles__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)OrgLukhnosPortmobileInvokeMethodHandles_publicLookupInstance_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&OrgLukhnosPortmobileInvokeMethodHandles_publicLookupInstance_, [OrgLukhnosPortmobileInvokeMethodHandles_Lookup alloc]);
    atomic_store(1u, (unsigned __int8 *)OrgLukhnosPortmobileInvokeMethodHandles__initialized);
  }
}

@end