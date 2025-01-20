@interface JavaUtilHashMap_ValueIterator
+ (const)__metadata;
- (JavaUtilHashMap_ValueIterator)initWithJavaUtilHashMap:(id)a3;
- (id)next;
@end

@implementation JavaUtilHashMap_ValueIterator

- (id)next
{
  v2 = [(JavaUtilHashMap_HashIterator *)self nextEntry];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return v2[2];
}

- (JavaUtilHashMap_ValueIterator)initWithJavaUtilHashMap:(id)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100432BF8;
}

@end