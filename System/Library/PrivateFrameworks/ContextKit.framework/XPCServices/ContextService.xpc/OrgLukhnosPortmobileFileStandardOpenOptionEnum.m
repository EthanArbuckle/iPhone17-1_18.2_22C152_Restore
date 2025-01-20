@interface OrgLukhnosPortmobileFileStandardOpenOptionEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgLukhnosPortmobileFileStandardOpenOptionEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgLukhnosPortmobileFileStandardOpenOptionEnum

- (OrgLukhnosPortmobileFileStandardOpenOptionEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgLukhnosPortmobileFileStandardOpenOptionEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgLukhnosPortmobileFileStandardOpenOptionEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"READ", 0);
    OrgLukhnosPortmobileFileStandardOpenOptionEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgLukhnosPortmobileFileStandardOpenOptionEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"WRITE", 1);
    qword_100563308 = (uint64_t)v3;
    v4 = [OrgLukhnosPortmobileFileStandardOpenOptionEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"CREATE", 2);
    qword_100563310 = (uint64_t)v4;
    atomic_store(1u, (unsigned __int8 *)OrgLukhnosPortmobileFileStandardOpenOptionEnum__initialized);
  }
}

@end