@interface JavaUtilHashtable_ValueIterator
+ (const)__metadata;
- (JavaUtilHashtable_ValueIterator)initWithJavaUtilHashtable:(id)a3;
- (id)next;
@end

@implementation JavaUtilHashtable_ValueIterator

- (id)next
{
  v2 = [(JavaUtilHashtable_HashIterator *)self nextEntry];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return v2[2];
}

- (JavaUtilHashtable_ValueIterator)initWithJavaUtilHashtable:(id)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100441FC0;
}

@end