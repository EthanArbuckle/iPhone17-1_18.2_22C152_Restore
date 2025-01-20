@interface OrgApacheLuceneSearchExactPhraseScorer_$1
- (BOOL)matches;
- (OrgApacheLuceneSearchExactPhraseScorer_$1)initWithOrgApacheLuceneSearchExactPhraseScorer:(id)a3 withOrgApacheLuceneSearchDocIdSetIterator:(id)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchExactPhraseScorer_$1

- (BOOL)matches
{
  return (int)sub_1000128A0((uint64_t)self->this$0_) > 0;
}

- (OrgApacheLuceneSearchExactPhraseScorer_$1)initWithOrgApacheLuceneSearchExactPhraseScorer:(id)a3 withOrgApacheLuceneSearchDocIdSetIterator:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchExactPhraseScorer__1;
  [(OrgApacheLuceneSearchTwoPhaseIterator *)&v3 dealloc];
}

@end