@interface OrgApacheLuceneIndexSingleTermsEnum
- (OrgApacheLuceneIndexSingleTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexSingleTermsEnum

- (OrgApacheLuceneIndexSingleTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return self;
}

- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  unsigned int v3 = [a3 isEqual:*(void *)(&self->super.doSeek_ + 1)];
  if ((atomic_load_explicit(OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v4 = OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum_values_;
  if (!v3) {
    v4 = &qword_100563770;
  }
  return (id)*v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSingleTermsEnum;
  [(OrgApacheLuceneIndexFilteredTermsEnum *)&v3 dealloc];
}

@end