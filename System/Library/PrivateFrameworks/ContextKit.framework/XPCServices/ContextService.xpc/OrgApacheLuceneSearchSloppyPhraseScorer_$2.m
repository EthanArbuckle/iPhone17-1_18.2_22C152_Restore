@interface OrgApacheLuceneSearchSloppyPhraseScorer_$2
- (BOOL)matches;
- (OrgApacheLuceneSearchSloppyPhraseScorer_$2)initWithOrgApacheLuceneSearchSloppyPhraseScorer:(id)a3 withOrgApacheLuceneSearchDocIdSetIterator:(id)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchSloppyPhraseScorer_$2

- (BOOL)matches
{
  self->this$0_->sloppyFreq_ = sub_1000CA31C((uint64_t)self->this$0_);
  return self->this$0_->sloppyFreq_ != 0.0;
}

- (OrgApacheLuceneSearchSloppyPhraseScorer_$2)initWithOrgApacheLuceneSearchSloppyPhraseScorer:(id)a3 withOrgApacheLuceneSearchDocIdSetIterator:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchSloppyPhraseScorer__2;
  [(OrgApacheLuceneSearchTwoPhaseIterator *)&v3 dealloc];
}

@end