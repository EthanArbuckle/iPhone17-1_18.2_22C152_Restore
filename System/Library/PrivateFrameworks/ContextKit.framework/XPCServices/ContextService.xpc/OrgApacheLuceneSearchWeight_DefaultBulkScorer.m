@interface OrgApacheLuceneSearchWeight_DefaultBulkScorer
+ (int)scoreRangeWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4 withOrgApacheLuceneSearchTwoPhaseIterator:(id)a5 withOrgApacheLuceneUtilBits:(id)a6 withInt:(int)a7 withInt:(int)a8;
+ (void)scoreAllWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4 withOrgApacheLuceneSearchTwoPhaseIterator:(id)a5 withOrgApacheLuceneUtilBits:(id)a6;
- (OrgApacheLuceneSearchWeight_DefaultBulkScorer)initWithOrgApacheLuceneSearchScorer:(id)a3;
- (int)scoreWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchWeight_DefaultBulkScorer

- (OrgApacheLuceneSearchWeight_DefaultBulkScorer)initWithOrgApacheLuceneSearchScorer:(id)a3
{
  return self;
}

- (int64_t)cost
{
  scorer = self->scorer_;
  if (!scorer) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneSearchScorer *)scorer cost];
}

- (int)scoreWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  if (!a3
    || (uint64_t v7 = *(void *)&a5,
        [a3 setScorerWithOrgApacheLuceneSearchScorer:self->scorer_],
        (scorer = self->scorer_) == 0))
  {
LABEL_10:
    JreThrowNullPointerException();
  }
  id v12 = [(OrgApacheLuceneSearchScorer *)scorer asTwoPhaseIterator];
  unsigned int v13 = [(OrgApacheLuceneSearchScorer *)self->scorer_ docID];
  if (a6 == 0x7FFFFFFF && !v7 && v13 == -1)
  {
    OrgApacheLuceneSearchWeight_DefaultBulkScorer_scoreAllWithOrgApacheLuceneSearchLeafCollector_withOrgApacheLuceneSearchScorer_withOrgApacheLuceneSearchTwoPhaseIterator_withOrgApacheLuceneUtilBits_(a3, self->scorer_, v12, a4);
    return 0x7FFFFFFF;
  }
  id v15 = [(OrgApacheLuceneSearchScorer *)self->scorer_ docID];
  if ((int)v15 < (int)v7)
  {
    if (v12)
    {
      v16 = (OrgApacheLuceneSearchScorer *)[v12 approximation];
      if (!v16) {
        goto LABEL_10;
      }
    }
    else
    {
      v16 = self->scorer_;
    }
    id v15 = [(OrgApacheLuceneSearchScorer *)v16 advanceWithInt:v7];
  }
  v17 = self->scorer_;
  return OrgApacheLuceneSearchWeight_DefaultBulkScorer_scoreRangeWithOrgApacheLuceneSearchLeafCollector_withOrgApacheLuceneSearchScorer_withOrgApacheLuceneSearchTwoPhaseIterator_withOrgApacheLuceneUtilBits_withInt_withInt_(a3, v17, v12, a4, v15, a6);
}

+ (int)scoreRangeWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4 withOrgApacheLuceneSearchTwoPhaseIterator:(id)a5 withOrgApacheLuceneUtilBits:(id)a6 withInt:(int)a7 withInt:(int)a8
{
  return OrgApacheLuceneSearchWeight_DefaultBulkScorer_scoreRangeWithOrgApacheLuceneSearchLeafCollector_withOrgApacheLuceneSearchScorer_withOrgApacheLuceneSearchTwoPhaseIterator_withOrgApacheLuceneUtilBits_withInt_withInt_(a3, a4, a5, a6, *(void **)&a7, a8);
}

+ (void)scoreAllWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4 withOrgApacheLuceneSearchTwoPhaseIterator:(id)a5 withOrgApacheLuceneUtilBits:(id)a6
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchWeight_DefaultBulkScorer;
  [(OrgApacheLuceneSearchWeight_DefaultBulkScorer *)&v3 dealloc];
}

@end