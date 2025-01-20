@interface JavaUtilCollections_UnmodifiableRandomAccessList
+ (const)__metadata;
- (JavaUtilCollections_UnmodifiableRandomAccessList)initWithJavaUtilList:(id)a3;
- (id)subListWithInt:(int)a3 withInt:(int)a4;
- (id)writeReplace;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation JavaUtilCollections_UnmodifiableRandomAccessList

- (JavaUtilCollections_UnmodifiableRandomAccessList)initWithJavaUtilList:(id)a3
{
  return self;
}

- (id)subListWithInt:(int)a3 withInt:(int)a4
{
  list = self->super.list_;
  if (!list) {
    JreThrowNullPointerException();
  }
  v5 = sub_1001CCDC0([(JavaUtilList *)list subListWithInt:*(void *)&a3 withInt:*(void *)&a4]);
  return v5;
}

- (id)writeReplace
{
  v2 = sub_1001CCE14(self->super.list_);
  return v2;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100429190;
}

@end