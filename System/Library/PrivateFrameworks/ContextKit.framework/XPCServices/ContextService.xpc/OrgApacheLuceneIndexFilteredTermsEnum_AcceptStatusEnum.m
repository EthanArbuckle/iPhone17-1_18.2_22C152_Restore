@interface OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum

- (OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"YES", 0);
    OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"YES_AND_SEEK", 1);
    qword_100563758 = (uint64_t)v3;
    v4 = [OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"NO", 2);
    qword_100563760 = (uint64_t)v4;
    v5 = [OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"NO_AND_SEEK", 3);
    qword_100563768 = (uint64_t)v5;
    v6 = [OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"END", 4);
    qword_100563770 = (uint64_t)v6;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum__initialized);
  }
}

@end