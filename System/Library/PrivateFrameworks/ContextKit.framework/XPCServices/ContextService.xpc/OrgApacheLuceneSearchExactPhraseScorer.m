@interface OrgApacheLuceneSearchExactPhraseScorer
- (OrgApacheLuceneSearchExactPhraseScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withOrgApacheLuceneSearchPhraseQuery_PostingsAndFreqArray:(id)a4 withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer:(id)a5 withBoolean:(BOOL)a6;
- (float)score;
- (id)asTwoPhaseIterator;
- (id)description;
- (int)advanceWithInt:(int)a3;
- (int)doNextWithInt:(int)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchExactPhraseScorer

- (OrgApacheLuceneSearchExactPhraseScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withOrgApacheLuceneSearchPhraseQuery_PostingsAndFreqArray:(id)a4 withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer:(id)a5 withBoolean:(BOOL)a6
{
  return self;
}

- (id)asTwoPhaseIterator
{
  conjunction = self->conjunction_;
  v4 = [OrgApacheLuceneSearchExactPhraseScorer__1 alloc];
  JreStrongAssign((id *)&v4->this$0_, self);
  OrgApacheLuceneSearchTwoPhaseIterator_initWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)v4, (uint64_t)conjunction);
  return v4;
}

- (int)doNextWithInt:(int)a3
{
  return sub_10001267C((uint64_t)self, *(uint64_t *)&a3);
}

- (int)nextDoc
{
  conjunction = self->conjunction_;
  if (!conjunction) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = [(OrgApacheLuceneSearchConjunctionDISI *)conjunction nextDoc];
  return sub_10001267C((uint64_t)self, v4);
}

- (int)advanceWithInt:(int)a3
{
  conjunction = self->conjunction_;
  if (!conjunction) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = [(OrgApacheLuceneSearchConjunctionDISI *)conjunction advanceWithInt:*(void *)&a3];
  return sub_10001267C((uint64_t)self, v5);
}

- (id)description
{
  return (id)JreStrcat("$@C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"ExactPhraseScorer(");
}

- (int)freq
{
  return self->freq_;
}

- (int)docID
{
  conjunction = self->conjunction_;
  if (!conjunction) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI *)conjunction docID];
}

- (float)score
{
  docScorer = self->docScorer_;
  if (!docScorer) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = [(OrgApacheLuceneSearchExactPhraseScorer *)self docID];
  *(float *)&double v5 = (float)self->freq_;
  [(OrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer *)docScorer scoreWithInt:v4 withFloat:v5];
  return result;
}

- (int64_t)cost
{
  conjunction = self->conjunction_;
  if (!conjunction) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI *)conjunction cost];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchExactPhraseScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end