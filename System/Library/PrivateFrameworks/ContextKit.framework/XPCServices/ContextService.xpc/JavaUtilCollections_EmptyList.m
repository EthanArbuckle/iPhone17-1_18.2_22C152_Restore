@interface JavaUtilCollections_EmptyList
+ (const)__metadata;
- (BOOL)containsWithId:(id)a3;
- (JavaUtilCollections_EmptyList)init;
- (id)getWithInt:(int)a3;
- (id)readResolve;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation JavaUtilCollections_EmptyList

- (BOOL)containsWithId:(id)a3
{
  return 0;
}

- (int)size
{
  return 0;
}

- (id)getWithInt:(int)a3
{
  v3 = new_JavaLangIndexOutOfBoundsException_init();
  objc_exception_throw(v3);
}

- (id)readResolve
{
  if ((atomic_load_explicit(JavaUtilCollections__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaUtilCollections_EMPTY_LIST_;
}

- (JavaUtilCollections_EmptyList)init
{
  return self;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004260F0;
}

@end