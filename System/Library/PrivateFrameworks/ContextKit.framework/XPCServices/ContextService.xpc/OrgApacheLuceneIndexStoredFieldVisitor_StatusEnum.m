@interface OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum

- (OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"YES", 0);
    OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"NO", 1);
    qword_100563688 = (uint64_t)v3;
    v4 = [OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"STOP", 2);
    qword_100563690 = (uint64_t)v4;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexStoredFieldVisitor_StatusEnum__initialized);
  }
}

@end