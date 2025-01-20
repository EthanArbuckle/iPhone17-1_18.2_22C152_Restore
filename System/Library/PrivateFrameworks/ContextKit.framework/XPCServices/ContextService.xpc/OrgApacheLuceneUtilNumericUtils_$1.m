@interface OrgApacheLuceneUtilNumericUtils_$1
- (OrgApacheLuceneUtilNumericUtils_$1)initWithOrgApacheLuceneIndexTermsEnum:(id)a3;
- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3;
@end

@implementation OrgApacheLuceneUtilNumericUtils_$1

- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  int PrefixCodedLongShiftWithOrgApacheLuceneUtilBytesRef = OrgApacheLuceneUtilNumericUtils_getPrefixCodedLongShiftWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  if ((atomic_load_explicit(OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v9 = &OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum_values_;
  if (PrefixCodedLongShiftWithOrgApacheLuceneUtilBytesRef) {
    v9 = &qword_100563770;
  }
  return (id)*v9;
}

- (OrgApacheLuceneUtilNumericUtils_$1)initWithOrgApacheLuceneIndexTermsEnum:(id)a3
{
  return self;
}

@end