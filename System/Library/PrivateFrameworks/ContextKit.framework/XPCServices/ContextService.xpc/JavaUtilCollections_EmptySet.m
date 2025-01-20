@interface JavaUtilCollections_EmptySet
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (JavaUtilCollections_EmptySet)init;
- (id)iterator;
- (id)readResolve;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation JavaUtilCollections_EmptySet

- (BOOL)containsWithId:(id)a3
{
  return 0;
}

- (int)size
{
  return 0;
}

- (id)iterator
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100560C38;
}

- (id)readResolve
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_EMPTY_SET_;
}

- (JavaUtilCollections_EmptySet)init
{
  return self;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100426288;
}

@end