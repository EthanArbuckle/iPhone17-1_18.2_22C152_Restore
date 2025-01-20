@interface JavaUtilTreeMap_BoundEnum
+ (const)__metadata;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (JavaUtilTreeMap_BoundEnum)initWithNSString:(id)a3 withInt:(int)a4;
- (id)leftCapWithId:(id)a3;
- (id)rightCapWithId:(id)a3;
@end

@implementation JavaUtilTreeMap_BoundEnum

- (id)leftCapWithId:(id)a3
{
  return 0;
}

- (id)rightCapWithId:(id)a3
{
  return 0;
}

- (JavaUtilTreeMap_BoundEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return JavaUtilTreeMap_BoundEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [JavaUtilTreeMap_Bound__1Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"INCLUSIVE", 0);
    JavaUtilTreeMap_BoundEnum_values_[0] = (uint64_t)v2;
    v3 = [JavaUtilTreeMap_Bound__2Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"EXCLUSIVE", 1);
    qword_100563F18 = (uint64_t)v3;
    v4 = [JavaUtilTreeMap_Bound__3Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"NO_BOUND", 2);
    qword_100563F20 = (uint64_t)v4;
    atomic_store(1u, (unsigned __int8 *)JavaUtilTreeMap_BoundEnum__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100437100;
}

@end