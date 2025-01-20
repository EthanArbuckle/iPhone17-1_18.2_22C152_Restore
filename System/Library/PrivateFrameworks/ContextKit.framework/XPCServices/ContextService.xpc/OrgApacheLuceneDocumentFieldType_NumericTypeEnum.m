@interface OrgApacheLuceneDocumentFieldType_NumericTypeEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneDocumentFieldType_NumericTypeEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneDocumentFieldType_NumericTypeEnum

- (OrgApacheLuceneDocumentFieldType_NumericTypeEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneDocumentFieldType_NumericTypeEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneDocumentFieldType_NumericTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"INT", 0);
    OrgApacheLuceneDocumentFieldType_NumericTypeEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneDocumentFieldType_NumericTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"LONG", 1);
    qword_1005639C8 = (uint64_t)v3;
    v4 = [OrgApacheLuceneDocumentFieldType_NumericTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"FLOAT", 2);
    qword_1005639D0 = (uint64_t)v4;
    v5 = [OrgApacheLuceneDocumentFieldType_NumericTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"DOUBLE", 3);
    qword_1005639D8 = (uint64_t)v5;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneDocumentFieldType_NumericTypeEnum__initialized);
  }
}

@end