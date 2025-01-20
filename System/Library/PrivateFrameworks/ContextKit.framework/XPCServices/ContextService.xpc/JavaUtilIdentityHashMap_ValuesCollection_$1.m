@interface JavaUtilIdentityHashMap_ValuesCollection_$1
+ (const)__metadata;
- (id)getWithJavaUtilMapEntry:(id)a3;
@end

@implementation JavaUtilIdentityHashMap_ValuesCollection_$1

- (id)getWithJavaUtilMapEntry:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return (id)*((void *)a3 + 2);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100474220;
}

@end