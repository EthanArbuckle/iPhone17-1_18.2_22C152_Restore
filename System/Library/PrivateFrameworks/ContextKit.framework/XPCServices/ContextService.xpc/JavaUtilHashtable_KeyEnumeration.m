@interface JavaUtilHashtable_KeyEnumeration
+ (const)__metadata;
- (JavaUtilHashtable_KeyEnumeration)initWithJavaUtilHashtable:(id)a3;
- (id)nextElement;
@end

@implementation JavaUtilHashtable_KeyEnumeration

- (id)nextElement
{
  v2 = [(JavaUtilHashtable_HashIterator *)self nextEntryNotFailFast];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return v2[1];
}

- (JavaUtilHashtable_KeyEnumeration)initWithJavaUtilHashtable:(id)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100442190;
}

@end