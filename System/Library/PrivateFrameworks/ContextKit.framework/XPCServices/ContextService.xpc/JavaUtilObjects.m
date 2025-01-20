@interface JavaUtilObjects
+ (BOOL)deepEqualsWithId:(id)a3 withId:(id)a4;
+ (BOOL)equalsWithId:(id)a3 withId:(id)a4;
+ (const)__metadata;
+ (id)requireNonNullWithId:(id)a3;
+ (id)requireNonNullWithId:(id)a3 withNSString:(id)a4;
+ (id)toStringWithId:(id)a3;
+ (id)toStringWithId:(id)a3 withNSString:(id)a4;
+ (int)compareWithId:(id)a3 withId:(id)a4 withJavaUtilComparator:(id)a5;
+ (int)hashCodeWithId:(id)a3;
+ (int)hash__WithNSObjectArray:(id)a3;
@end

@implementation JavaUtilObjects

+ (int)compareWithId:(id)a3 withId:(id)a4 withJavaUtilComparator:(id)a5
{
  if (a3 == a4) {
    return 0;
  }
  if (!a5) {
    JreThrowNullPointerException();
  }
  return objc_msgSend(a5, "compareWithId:withId:");
}

+ (BOOL)deepEqualsWithId:(id)a3 withId:(id)a4
{
  return JavaUtilObjects_deepEqualsWithId_withId_(a3, (uint64_t)a4);
}

+ (BOOL)equalsWithId:(id)a3 withId:(id)a4
{
  if (a3) {
    return [a3 isEqual:a4];
  }
  else {
    return a4 == 0;
  }
}

+ (int)hash__WithNSObjectArray:(id)a3
{
  return JavaUtilArrays_hashCodeWithNSObjectArray_((uint64_t)a3);
}

+ (int)hashCodeWithId:(id)a3
{
  if (a3) {
    return [a3 hash];
  }
  else {
    return 0;
  }
}

+ (id)requireNonNullWithId:(id)a3
{
  return (id)JavaUtilObjects_requireNonNullWithId_((uint64_t)a3);
}

+ (id)requireNonNullWithId:(id)a3 withNSString:(id)a4
{
  return (id)JavaUtilObjects_requireNonNullWithId_withNSString_((uint64_t)a3, (uint64_t)a4);
}

+ (id)toStringWithId:(id)a3
{
  if (a3) {
    return [a3 description];
  }
  else {
    return @"null";
  }
}

+ (id)toStringWithId:(id)a3 withNSString:(id)a4
{
  if (a3) {
    return [a3 description];
  }
  else {
    return a4;
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100472D90;
}

@end