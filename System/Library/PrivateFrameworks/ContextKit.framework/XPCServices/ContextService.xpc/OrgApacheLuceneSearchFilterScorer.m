@interface OrgApacheLuceneSearchFilterScorer
- (OrgApacheLuceneSearchFilterScorer)initWithOrgApacheLuceneSearchScorer:(id)a3;
- (OrgApacheLuceneSearchFilterScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchWeight:(id)a4;
- (float)score;
- (id)asTwoPhaseIterator;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchFilterScorer

- (OrgApacheLuceneSearchFilterScorer)initWithOrgApacheLuceneSearchScorer:(id)a3
{
  return self;
}

- (OrgApacheLuceneSearchFilterScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchWeight:(id)a4
{
  return self;
}

- (float)score
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchScorer *)in score];
  return result;
}

- (int)freq
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)in freq];
}

- (int)docID
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)in docID];
}

- (int)nextDoc
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)in nextDoc];
}

- (int)advanceWithInt:(int)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)in advanceWithInt:*(void *)&a3];
}

- (int64_t)cost
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneSearchScorer *)in cost];
}

- (id)asTwoPhaseIterator
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)in asTwoPhaseIterator];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFilterScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end