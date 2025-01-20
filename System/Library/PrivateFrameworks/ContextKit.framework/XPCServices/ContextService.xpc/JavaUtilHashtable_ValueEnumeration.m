@interface JavaUtilHashtable_ValueEnumeration
+ (const)__metadata;
- (JavaUtilHashtable_ValueEnumeration)initWithJavaUtilHashtable:(id)a3;
- (id)nextElement;
@end

@implementation JavaUtilHashtable_ValueEnumeration

- (id)nextElement
{
  v2 = [(JavaUtilHashtable_HashIterator *)self nextEntryNotFailFast];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return v2[2];
}

- (JavaUtilHashtable_ValueEnumeration)initWithJavaUtilHashtable:(id)a3
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100442290;
}

@end