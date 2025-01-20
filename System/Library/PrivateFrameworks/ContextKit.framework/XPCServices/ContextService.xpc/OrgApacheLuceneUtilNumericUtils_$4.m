@interface OrgApacheLuceneUtilNumericUtils_$4
- (OrgApacheLuceneUtilNumericUtils_$4)initWithOrgApacheLuceneIndexTerms:(id)a3;
- (id)iterator;
@end

@implementation OrgApacheLuceneUtilNumericUtils_$4

- (id)iterator
{
  in = self->super.in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  id v3 = [(OrgApacheLuceneIndexTerms *)in iterator];
  return OrgApacheLuceneUtilNumericUtils_filterPrefixCodedLongsWithOrgApacheLuceneIndexTermsEnum_(v3);
}

- (OrgApacheLuceneUtilNumericUtils_$4)initWithOrgApacheLuceneIndexTerms:(id)a3
{
  return self;
}

@end