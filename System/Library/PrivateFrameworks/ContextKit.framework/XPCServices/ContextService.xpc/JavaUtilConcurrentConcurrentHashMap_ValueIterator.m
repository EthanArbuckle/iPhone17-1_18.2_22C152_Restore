@interface JavaUtilConcurrentConcurrentHashMap_ValueIterator
+ (const)__metadata;
- (JavaUtilConcurrentConcurrentHashMap_ValueIterator)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilConcurrentConcurrentHashMap:(id)a7;
- (unint64_t)nextElement;
@end

@implementation JavaUtilConcurrentConcurrentHashMap_ValueIterator

- (JavaUtilConcurrentConcurrentHashMap_ValueIterator)initWithJavaUtilConcurrentConcurrentHashMap_NodeArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilConcurrentConcurrentHashMap:(id)a7
{
  return self;
}

- (unint64_t)nextElement
{
  v1 = *(unint64_t **)(a1 + 16);
  if (!v1)
  {
    v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  unint64_t v3 = atomic_load(v1 + 3);
  JreStrongAssign((id *)(a1 + 64), v1);
  -[JavaUtilConcurrentConcurrentHashMap_Traverser advance]_0(a1);
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041FDD0;
}

@end