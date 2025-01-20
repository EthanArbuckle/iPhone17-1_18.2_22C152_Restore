@interface OrgLukhnosPortmobileUtilObjects
+ (BOOL)equalsWithId:(id)a3 withId:(id)a4;
+ (id)requireNonNullWithId:(id)a3;
+ (id)requireNonNullWithId:(id)a3 withNSString:(id)a4;
+ (id)toStringWithId:(id)a3;
+ (int)hashCodeWithId:(id)a3;
+ (int)hash__WithNSObjectArray:(id)a3;
@end

@implementation OrgLukhnosPortmobileUtilObjects

+ (id)requireNonNullWithId:(id)a3
{
  return (id)OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_((uint64_t)a3);
}

+ (id)requireNonNullWithId:(id)a3 withNSString:(id)a4
{
  return (id)OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_withNSString_((uint64_t)a3, (uint64_t)a4);
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

+ (int)hash__WithNSObjectArray:(id)a3
{
  return JavaUtilArrays_hashCodeWithNSObjectArray_((uint64_t)a3);
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

+ (BOOL)equalsWithId:(id)a3 withId:(id)a4
{
  BOOL result = ((unint64_t)a3 | (unint64_t)a4) == 0;
  if (a3)
  {
    if (a4) {
      return [a3 isEqual:a4];
    }
  }
  return result;
}

@end