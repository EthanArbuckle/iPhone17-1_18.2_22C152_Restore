@interface OrgApacheLuceneDocumentField_IndexEnum
+ (id)toIndexWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4;
+ (id)toIndexWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneDocumentField_IndexEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneDocumentField_IndexEnum

+ (id)toIndexWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4
{
  return (id)OrgApacheLuceneDocumentField_IndexEnum_toIndexWithBoolean_withBoolean_(a3, a4);
}

+ (id)toIndexWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneDocumentField_IndexEnum__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  v8 = (id *)OrgApacheLuceneDocumentField_IndexEnum_values_;
  }
  uint64_t v9 = 3;
  if (v6) {
    uint64_t v9 = 4;
  }
  v10 = &OrgApacheLuceneDocumentField_IndexEnum_values_[v9];
  uint64_t v11 = 2;
  if (v6) {
    uint64_t v11 = 1;
  }
  v12 = &OrgApacheLuceneDocumentField_IndexEnum_values_[v11];
  if (!a5) {
    v10 = v12;
  }
  if (v7) {
    v8 = (id *)v10;
  }
  return *v8;
}

- (OrgApacheLuceneDocumentField_IndexEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneDocumentField_IndexEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneDocumentField_Index__1Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"NO", 0);
    OrgApacheLuceneDocumentField_IndexEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneDocumentField_Index__2Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"ANALYZED", 1);
    qword_100563620 = (uint64_t)v3;
    v4 = [OrgApacheLuceneDocumentField_Index__3Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"NOT_ANALYZED", 2);
    qword_100563628 = (uint64_t)v4;
    v5 = [OrgApacheLuceneDocumentField_Index__4Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"NOT_ANALYZED_NO_NORMS", 3);
    qword_100563630 = (uint64_t)v5;
    BOOL v6 = [OrgApacheLuceneDocumentField_Index__5Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"ANALYZED_NO_NORMS", 4);
    qword_100563638 = (uint64_t)v6;
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneDocumentField_IndexEnum__initialized);
  }
}

@end