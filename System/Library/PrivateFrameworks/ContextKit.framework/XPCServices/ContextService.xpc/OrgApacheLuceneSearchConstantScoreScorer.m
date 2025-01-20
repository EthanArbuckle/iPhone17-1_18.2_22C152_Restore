@interface OrgApacheLuceneSearchConstantScoreScorer
- (OrgApacheLuceneSearchConstantScoreScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withFloat:(float)a4 withOrgApacheLuceneSearchDocIdSetIterator:(id)a5;
- (OrgApacheLuceneSearchConstantScoreScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withFloat:(float)a4 withOrgApacheLuceneSearchTwoPhaseIterator:(id)a5;
- (float)score;
- (id)asTwoPhaseIterator;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConstantScoreScorer

- (OrgApacheLuceneSearchConstantScoreScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withFloat:(float)a4 withOrgApacheLuceneSearchDocIdSetIterator:(id)a5
{
  return self;
}

- (OrgApacheLuceneSearchConstantScoreScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withFloat:(float)a4 withOrgApacheLuceneSearchTwoPhaseIterator:(id)a5
{
  return self;
}

- (id)asTwoPhaseIterator
{
  return self->twoPhaseIterator_;
}

- (float)score
{
  return self->score_;
}

- (int)freq
{
  return 1;
}

- (int)docID
{
  disi = self->disi_;
  if (!disi) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchDocIdSetIterator *)disi docID];
}

- (int)nextDoc
{
  disi = self->disi_;
  if (!disi) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchDocIdSetIterator *)disi nextDoc];
}

- (int)advanceWithInt:(int)a3
{
  disi = self->disi_;
  if (!disi) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchDocIdSetIterator *)disi advanceWithInt:*(void *)&a3];
}

- (int64_t)cost
{
  disi = self->disi_;
  if (!disi) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneSearchDocIdSetIterator *)disi cost];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConstantScoreScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end