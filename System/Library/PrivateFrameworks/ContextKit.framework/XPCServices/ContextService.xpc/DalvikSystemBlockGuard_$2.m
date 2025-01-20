@interface DalvikSystemBlockGuard_$2
+ (const)__metadata;
- (DalvikSystemBlockGuard_$2)init;
- (id)initialValue;
@end

@implementation DalvikSystemBlockGuard_$2

- (id)initialValue
{
  if ((atomic_load_explicit(DalvikSystemBlockGuard__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)DalvikSystemBlockGuard_LAX_POLICY_;
}

- (DalvikSystemBlockGuard_$2)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100444FB0;
}

@end