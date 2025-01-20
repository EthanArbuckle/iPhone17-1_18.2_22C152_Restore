@interface JavaUtilCollections_ReverseComparator
+ (const)__metadata;
+ (void)initialize;
- (id)readResolve;
- (int)compareWithId:(id)a3 withId:(id)a4;
@end

@implementation JavaUtilCollections_ReverseComparator

- (int)compareWithId:(id)a3 withId:(id)a4
{
  v6 = (void *)JavaLangComparable_class_();
  if (!a4) {
    JreThrowNullPointerException();
  }
  if (([v6 isInstance:a4] & 1) == 0) {
    JreThrowClassCastException();
  }
  return [a4 compareToWithId:a3];
}

- (id)readResolve
{
  return (id)qword_100560C48;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_100560C48, [JavaUtilCollections_ReverseComparator alloc]);
    atomic_store(1u, (unsigned __int8 *)JavaUtilCollections_ReverseComparator__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100426620;
}

@end