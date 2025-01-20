@interface OrgApacheLuceneDocumentField_StoreEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneDocumentField_StoreEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneDocumentField_StoreEnum

- (OrgApacheLuceneDocumentField_StoreEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneDocumentField_StoreEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneDocumentField_StoreEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"YES", 0);
    OrgApacheLuceneDocumentField_StoreEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneDocumentField_StoreEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"NO", 1);
    qword_100563610 = (uint64_t)v3;
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneDocumentField_StoreEnum__initialized);
  }
}

@end