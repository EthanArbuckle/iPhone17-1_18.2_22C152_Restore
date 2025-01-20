@interface JavaUtilWeakHashMap_ValuesCollection_$1
+ (const)__metadata;
- (id)getWithJavaUtilMap_Entry:(id)a3;
@end

@implementation JavaUtilWeakHashMap_ValuesCollection_$1

- (id)getWithJavaUtilMap_Entry:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 getValue];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FE0D0;
}

@end