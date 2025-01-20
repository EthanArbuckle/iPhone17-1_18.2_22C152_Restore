@interface JavaUtilHashMap_KeyIterator
+ (const)__metadata;
- (JavaUtilHashMap_KeyIterator)initWithJavaUtilHashMap:(id)a3;
- (id)next;
@end

@implementation JavaUtilHashMap_KeyIterator

- (id)next
{
  v2 = [(JavaUtilHashMap_HashIterator *)self nextEntry];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return v2[1];
}

- (JavaUtilHashMap_KeyIterator)initWithJavaUtilHashMap:(id)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100432B28;
}

@end