@interface OrgApacheLuceneIndexTerms_$1
- (OrgApacheLuceneIndexTerms_$1)initWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermsEnum:(id)a4 withOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a5;
- (id)nextSeekTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexTerms_$1

- (id)nextSeekTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    a3 = *(OrgApacheLuceneUtilIntsRefBuilder **)((char *)&self->super.savedStates_ + 1);
  }
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneIndexTerms__1;
  return [(OrgApacheLuceneIndexAutomatonTermsEnum *)&v4 nextSeekTermWithOrgApacheLuceneUtilBytesRef:a3];
}

- (OrgApacheLuceneIndexTerms_$1)initWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermsEnum:(id)a4 withOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexTerms__1;
  [(OrgApacheLuceneIndexAutomatonTermsEnum *)&v3 dealloc];
}

@end