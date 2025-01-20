@interface OrgApacheLuceneCodecsDocValuesConsumer_BitsFilteredTermsEnum
- (OrgApacheLuceneCodecsDocValuesConsumer_BitsFilteredTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withOrgApacheLuceneUtilLongBitSet:(id)a4;
- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_BitsFilteredTermsEnum

- (OrgApacheLuceneCodecsDocValuesConsumer_BitsFilteredTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withOrgApacheLuceneUtilLongBitSet:(id)a4
{
  return self;
}

- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  v3 = *(void **)(&self->super.doSeek_ + 1);
  if (!v3) {
    JreThrowNullPointerException();
  }
  unsigned int v4 = objc_msgSend(v3, "getWithLong:", -[OrgApacheLuceneIndexFilteredTermsEnum ord](self, "ord", a3));
  if ((atomic_load_explicit(OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v5 = &OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum_values_;
  if (!v4) {
    v5 = &qword_100563760;
  }
  return (id)*v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer_BitsFilteredTermsEnum;
  [(OrgApacheLuceneIndexFilteredTermsEnum *)&v3 dealloc];
}

@end