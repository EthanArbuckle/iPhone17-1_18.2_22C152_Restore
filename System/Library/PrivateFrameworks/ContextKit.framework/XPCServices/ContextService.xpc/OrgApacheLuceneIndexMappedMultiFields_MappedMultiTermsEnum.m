@interface OrgApacheLuceneIndexMappedMultiFields_MappedMultiTermsEnum
- (OrgApacheLuceneIndexMappedMultiFields_MappedMultiTermsEnum)initWithNSString:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withOrgApacheLuceneIndexMultiTermsEnum:(id)a5;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (int)docFreq;
- (int64_t)totalTermFreq;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMappedMultiFields_MappedMultiTermsEnum

- (OrgApacheLuceneIndexMappedMultiFields_MappedMultiTermsEnum)initWithNSString:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4 withOrgApacheLuceneIndexMultiTermsEnum:(id)a5
{
  return self;
}

- (int)docFreq
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int64_t)totalTermFreq
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    p_field = (void **)&self->field_;
LABEL_8:
    a3 = new_OrgApacheLuceneIndexMappingMultiPostingsEnum_initWithNSString_withOrgApacheLuceneIndexMergeState_(*p_field, self->mergeState_);
    goto LABEL_9;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_14;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  v7 = (void *)*((void *)a3 + 7);
  if (!v7) {
LABEL_14:
  }
    JreThrowNullPointerException();
  p_field = (void **)&self->field_;
  if (([v7 isEqual:self->field_] & 1) == 0) {
    goto LABEL_8;
  }
LABEL_9:
  in = self->super.in_;
  if (!in || !a3) {
    goto LABEL_14;
  }
  id v10 = [(OrgApacheLuceneIndexTermsEnum *)in postingsWithOrgApacheLuceneIndexPostingsEnum:*((void *)a3 + 6) withInt:v4];
  objc_opt_class();
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_15:
  }
    JreThrowClassCastException();
  [a3 resetWithOrgApacheLuceneIndexMultiPostingsEnum:v10];
  return a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMappedMultiFields_MappedMultiTermsEnum;
  [(OrgApacheLuceneIndexFilterLeafReader_FilterTermsEnum *)&v3 dealloc];
}

@end