@interface OrgLukhnosPortmobileFileFileVisitResultEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgLukhnosPortmobileFileFileVisitResultEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgLukhnosPortmobileFileFileVisitResultEnum

- (OrgLukhnosPortmobileFileFileVisitResultEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return (id)OrgLukhnosPortmobileFileFileVisitResultEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgLukhnosPortmobileFileFileVisitResultEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"CONTINUE", 0);
    OrgLukhnosPortmobileFileFileVisitResultEnum_values_ = (uint64_t)v2;
    atomic_store(1u, (unsigned __int8 *)OrgLukhnosPortmobileFileFileVisitResultEnum__initialized);
  }
}

@end