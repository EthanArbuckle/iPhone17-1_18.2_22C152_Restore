@interface JavaUtilHashtable_KeyIterator
+ (const)__metadata;
- (JavaUtilHashtable_KeyIterator)initWithJavaUtilHashtable:(id)a3;
- (id)next;
@end

@implementation JavaUtilHashtable_KeyIterator

- (id)next
{
  v2 = [(JavaUtilHashtable_HashIterator *)self nextEntry];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return v2[1];
}

- (JavaUtilHashtable_KeyIterator)initWithJavaUtilHashtable:(id)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100441EF0;
}

@end