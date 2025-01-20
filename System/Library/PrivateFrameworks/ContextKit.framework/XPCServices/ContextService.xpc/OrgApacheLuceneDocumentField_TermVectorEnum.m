@interface OrgApacheLuceneDocumentField_TermVectorEnum
+ (id)toTermVectorWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneDocumentField_TermVectorEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneDocumentField_TermVectorEnum

+ (id)toTermVectorWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ((atomic_load_explicit(OrgApacheLuceneDocumentField_TermVectorEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v8 = (id *)OrgApacheLuceneDocumentField_TermVectorEnum_values_;
  uint64_t v9 = 1;
  if (v5) {
    uint64_t v9 = 2;
  }
  v10 = &OrgApacheLuceneDocumentField_TermVectorEnum_values_[v9];
  uint64_t v11 = 3;
  if (v5) {
    uint64_t v11 = 4;
  }
  v12 = &OrgApacheLuceneDocumentField_TermVectorEnum_values_[v11];
  if (v6) {
    v10 = v12;
  }
  if (v7) {
    v8 = (id *)v10;
  }
  return *v8;
}

- (OrgApacheLuceneDocumentField_TermVectorEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneDocumentField_TermVectorEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneDocumentField_TermVector__1Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"NO", 0);
    OrgApacheLuceneDocumentField_TermVectorEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneDocumentField_TermVector__2Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"YES", 1);
    qword_100563648 = (uint64_t)v3;
    v4 = [OrgApacheLuceneDocumentField_TermVector__3Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"WITH_POSITIONS", 2);
    qword_100563650 = (uint64_t)v4;
    BOOL v5 = [OrgApacheLuceneDocumentField_TermVector__4Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"WITH_OFFSETS", 3);
    qword_100563658 = (uint64_t)v5;
    BOOL v6 = [OrgApacheLuceneDocumentField_TermVector__5Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"WITH_POSITIONS_OFFSETS", 4);
    qword_100563660 = (uint64_t)v6;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneDocumentField_TermVectorEnum__initialized);
  }
}

@end