@interface OrgApacheLuceneUtilNumericUtils_$2
- (OrgApacheLuceneUtilNumericUtils_$2)initWithOrgApacheLuceneIndexTermsEnum:(id)a3;
- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3;
@end

@implementation OrgApacheLuceneUtilNumericUtils_$2

- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  int PrefixCodedIntShiftWithOrgApacheLuceneUtilBytesRef = OrgApacheLuceneUtilNumericUtils_getPrefixCodedIntShiftWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3);
  if ((atomic_load_explicit(OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v4 = &OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum_values_;
  if (PrefixCodedIntShiftWithOrgApacheLuceneUtilBytesRef) {
    v4 = &qword_100563770;
  }
  return (id)*v4;
}

- (OrgApacheLuceneUtilNumericUtils_$2)initWithOrgApacheLuceneIndexTermsEnum:(id)a3
{
  return self;
}

@end