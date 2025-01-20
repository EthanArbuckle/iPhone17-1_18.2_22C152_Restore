@interface OrgApacheLuceneSearchConjunctionScorer_DocsAndFreqs
- (OrgApacheLuceneSearchConjunctionScorer_DocsAndFreqs)initWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConjunctionScorer_DocsAndFreqs

- (OrgApacheLuceneSearchConjunctionScorer_DocsAndFreqs)initWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  self->doc_ = -1;
  JreStrongAssign((id *)&self->iterator_, a3);
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->cost_ = (int64_t)[a3 cost];
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConjunctionScorer_DocsAndFreqs;
  [(OrgApacheLuceneSearchConjunctionScorer_DocsAndFreqs *)&v3 dealloc];
}

@end