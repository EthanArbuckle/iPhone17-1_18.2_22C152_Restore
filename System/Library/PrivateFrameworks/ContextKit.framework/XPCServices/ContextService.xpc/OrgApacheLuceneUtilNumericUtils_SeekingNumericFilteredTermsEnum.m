@interface OrgApacheLuceneUtilNumericUtils_SeekingNumericFilteredTermsEnum
- (OrgApacheLuceneUtilNumericUtils_SeekingNumericFilteredTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
@end

@implementation OrgApacheLuceneUtilNumericUtils_SeekingNumericFilteredTermsEnum

- (OrgApacheLuceneUtilNumericUtils_SeekingNumericFilteredTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3
{
  return self;
}

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  tenum = self->super.tenum_;
  if (!tenum) {
    JreThrowNullPointerException();
  }
  id v5 = [(OrgApacheLuceneIndexTermsEnum *)tenum seekCeilWithOrgApacheLuceneUtilBytesRef:a3];
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v5 == (id)OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_) {
    goto LABEL_8;
  }
  JreStrongAssign((id *)&self->super.actualTerm_, [(OrgApacheLuceneIndexTermsEnum *)self->super.tenum_ term]);
  id v6 = [(OrgApacheLuceneUtilNumericUtils_SeekingNumericFilteredTermsEnum *)self acceptWithOrgApacheLuceneUtilBytesRef:self->super.actualTerm_];
  if ((atomic_load_explicit(OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v6 != (id)OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum_values_)
  {
LABEL_8:
    if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    return (id)OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_;
  }
  return v5;
}

@end