@interface JavaUtilCollections_$1
+ (const)__metadata;
- (BOOL)hasNext;
- (id)next;
- (void)remove;
@end

@implementation JavaUtilCollections_$1

- (BOOL)hasNext
{
  return 0;
}

- (id)next
{
  v2 = new_JavaUtilNoSuchElementException_init();
  objc_exception_throw(v2);
}

- (void)remove
{
  v2 = new_JavaLangIllegalStateException_init();
  objc_exception_throw(v2);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042C8A0;
}

@end