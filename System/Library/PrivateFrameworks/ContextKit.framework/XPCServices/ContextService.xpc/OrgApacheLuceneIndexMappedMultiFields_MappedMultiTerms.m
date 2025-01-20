@interface OrgApacheLuceneIndexMappedMultiFields_MappedMultiTerms
- (OrgApacheLuceneIndexMappedMultiFields_MappedMultiTerms)initWithNSString:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withOrgApacheLuceneIndexMultiTerms:(id)a5;
- (id)iterator;
- (int)getDocCount;
- (int64_t)getSumDocFreq;
- (int64_t)getSumTotalTermFreq;
- (int64_t)size;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMappedMultiFields_MappedMultiTerms

- (OrgApacheLuceneIndexMappedMultiFields_MappedMultiTerms)initWithNSString:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withOrgApacheLuceneIndexMultiTerms:(id)a5
{
  return self;
}

- (id)iterator
{
  in = self->super.in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  id v4 = [(OrgApacheLuceneIndexTerms *)in iterator];
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v4 == (id)OrgApacheLuceneIndexTermsEnum_EMPTY_)
  {
    if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    return (id)OrgApacheLuceneIndexTermsEnum_EMPTY_;
  }
  else
  {
    field = self->field_;
    mergeState = self->mergeState_;
    objc_opt_class();
    if (v4 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    v7 = [OrgApacheLuceneIndexMappedMultiFields_MappedMultiTermsEnum alloc];
    sub_1000C9E14((uint64_t)v7, field, mergeState, v4);
    return v7;
  }
}

- (int64_t)size
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int64_t)getSumTotalTermFreq
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int64_t)getSumDocFreq
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int)getDocCount
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMappedMultiFields_MappedMultiTerms;
  [(OrgApacheLuceneIndexFilterLeafReader_FilterTerms *)&v3 dealloc];
}

@end