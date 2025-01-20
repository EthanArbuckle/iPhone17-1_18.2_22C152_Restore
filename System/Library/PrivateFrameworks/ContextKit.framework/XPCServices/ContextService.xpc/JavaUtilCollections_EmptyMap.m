@interface JavaUtilCollections_EmptyMap
+ (const)__metadata;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)containsValueWithId:(id)a3;
- (JavaUtilCollections_EmptyMap)init;
- (id)entrySet;
- (id)getWithId:(id)a3;
- (id)keySet;
- (id)readResolve;
- (id)values;
@end

@implementation JavaUtilCollections_EmptyMap

- (BOOL)containsKeyWithId:(id)a3
{
  return 0;
}

- (BOOL)containsValueWithId:(id)a3
{
  return 0;
}

- (id)entrySet
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_EMPTY_SET_;
}

- (id)getWithId:(id)a3
{
  return 0;
}

- (id)keySet
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_EMPTY_SET_;
}

- (id)values
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_EMPTY_LIST_;
}

- (id)readResolve
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_EMPTY_MAP_;
}

- (JavaUtilCollections_EmptyMap)init
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004264B0;
}

@end