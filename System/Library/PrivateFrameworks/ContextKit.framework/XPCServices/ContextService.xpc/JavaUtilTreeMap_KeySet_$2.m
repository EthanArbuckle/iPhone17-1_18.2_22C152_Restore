@interface JavaUtilTreeMap_KeySet_$2
+ (const)__metadata;
- (JavaUtilTreeMap_KeySet_$2)initWithJavaUtilTreeMap_KeySet:(id)a3 withJavaUtilTreeMap_Node:(id)a4;
- (id)next;
@end

@implementation JavaUtilTreeMap_KeySet_$2

- (id)next
{
  v2 = [(JavaUtilTreeMap_MapIterator *)self stepBackward];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return v2[4];
}

- (JavaUtilTreeMap_KeySet_$2)initWithJavaUtilTreeMap_KeySet:(id)a3 withJavaUtilTreeMap_Node:(id)a4
{
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100436D70;
}

@end