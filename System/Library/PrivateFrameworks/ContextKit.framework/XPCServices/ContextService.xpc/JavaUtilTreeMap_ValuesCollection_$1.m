@interface JavaUtilTreeMap_ValuesCollection_$1
+ (const)__metadata;
- (JavaUtilTreeMap_ValuesCollection_$1)initWithJavaUtilTreeMap_ValuesCollection:(id)a3 withJavaUtilTreeMap_Node:(id)a4;
- (id)next;
@end

@implementation JavaUtilTreeMap_ValuesCollection_$1

- (id)next
{
  v2 = [(JavaUtilTreeMap_MapIterator *)self stepForward];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return v2[5];
}

- (JavaUtilTreeMap_ValuesCollection_$1)initWithJavaUtilTreeMap_ValuesCollection:(id)a3 withJavaUtilTreeMap_Node:(id)a4
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100436F88;
}

@end