@interface OrgApacheLuceneUtilNumericUtils_LongRangeBuilder
- (void)addRangeWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (void)addRangeWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
@end

@implementation OrgApacheLuceneUtilNumericUtils_LongRangeBuilder

- (void)addRangeWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (void)addRangeWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v9 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
  v10 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
  OrgApacheLuceneUtilNumericUtils_longToPrefixCodedBytesWithLong_withInt_withOrgApacheLuceneUtilBytesRefBuilder_(a3, v5, v9, v11, v12, v13, v14, v15);
  OrgApacheLuceneUtilNumericUtils_longToPrefixCodedBytesWithLong_withInt_withOrgApacheLuceneUtilBytesRefBuilder_(a4, v5, v10, v16, v17, v18, v19, v20);
  id v21 = [(OrgApacheLuceneUtilBytesRefBuilder *)v9 get];
  id v22 = [(OrgApacheLuceneUtilBytesRefBuilder *)v10 get];
  [(OrgApacheLuceneUtilNumericUtils_LongRangeBuilder *)self addRangeWithOrgApacheLuceneUtilBytesRef:v21 withOrgApacheLuceneUtilBytesRef:v22];
}

@end