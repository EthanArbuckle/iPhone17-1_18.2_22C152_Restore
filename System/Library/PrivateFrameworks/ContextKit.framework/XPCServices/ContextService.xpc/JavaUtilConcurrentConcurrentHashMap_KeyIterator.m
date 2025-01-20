@interface JavaUtilConcurrentConcurrentHashMap_KeyIterator
+ (const)__metadata;
- (JavaUtilConcurrentConcurrentHashMap_KeyIterator)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilConcurrentConcurrentHashMap:(id)a7;
- (uint64_t)nextElement;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_KeyIterator

- (JavaUtilConcurrentConcurrentHashMap_KeyIterator)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilConcurrentConcurrentHashMap:(id)a7
{
  return self;
}

- (uint64_t)nextElement
{
  v1 = *(void **)(a1 + 16);
  if (!v1)
  {
    v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  uint64_t v3 = v1[2];
  JreStrongAssign((id *)(a1 + 64), v1);
  -[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0(a1);
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041FCD0;
}

@end