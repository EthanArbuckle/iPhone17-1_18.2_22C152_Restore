@interface OrgApacheLuceneSearchSloppyPhraseScorer
- (BOOL)advancePPWithOrgApacheLuceneSearchPhrasePositions:(id)a3;
- (BOOL)advanceRptsWithOrgApacheLuceneSearchPhrasePositions:(id)a3;
- (OrgApacheLuceneSearchSloppyPhraseScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withOrgApacheLuceneSearchPhraseQuery_PostingsAndFreqArray:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer:(id)a6 withBoolean:(BOOL)a7;
- (float)score;
- (float)sloppyFreq;
- (id)asTwoPhaseIterator;
- (id)description;
- (id)gatherRptGroupsWithJavaUtilLinkedHashMap:(id)a3;
- (id)lesserWithOrgApacheLuceneSearchPhrasePositions:(id)a3 withOrgApacheLuceneSearchPhrasePositions:(id)a4;
- (id)ppTermsBitSetsWithOrgApacheLuceneSearchPhrasePositionsArray:(id)a3 withJavaUtilHashMap:(id)a4;
- (id)repeatingPPsWithJavaUtilHashMap:(id)a3;
- (id)termGroupsWithJavaUtilLinkedHashMap:(id)a3 withJavaUtilArrayList:(id)a4;
- (int)advanceWithInt:(int)a3;
- (int)collideWithOrgApacheLuceneSearchPhrasePositions:(id)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int)tpPosWithOrgApacheLuceneSearchPhrasePositions:(id)a3;
- (int64_t)cost;
- (void)dealloc;
- (void)sortRptGroupsWithJavaUtilArrayList:(id)a3;
- (void)unionTermGroupsWithJavaUtilArrayList:(id)a3;
@end

@implementation OrgApacheLuceneSearchSloppyPhraseScorer

- (OrgApacheLuceneSearchSloppyPhraseScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withOrgApacheLuceneSearchPhraseQuery_PostingsAndFreqArray:(id)a4 withInt:(int)a5 withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer:(id)a6 withBoolean:(BOOL)a7
{
  return self;
}

- (BOOL)advancePPWithOrgApacheLuceneSearchPhrasePositions:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  unsigned int v5 = [a3 nextPosition];
  if (v5)
  {
    int v6 = *((_DWORD *)a3 + 2);
    if (v6 > self->end_) {
      self->end_ = v6;
    }
  }
  return v5;
}

- (BOOL)advanceRptsWithOrgApacheLuceneSearchPhrasePositions:(id)a3
{
  return sub_1000CA594((uint64_t)self, a3);
}

- (id)lesserWithOrgApacheLuceneSearchPhrasePositions:(id)a3 withOrgApacheLuceneSearchPhrasePositions:(id)a4
{
  if (!a3 || !a4) {
    JreThrowNullPointerException();
  }
  int v4 = *((_DWORD *)a3 + 2);
  int v5 = *((_DWORD *)a4 + 2);
  if (v4 >= v5 && (v4 != v5 || *((_DWORD *)a3 + 4) >= *((_DWORD *)a4 + 4))) {
    return a4;
  }
  return a3;
}

- (int)collideWithOrgApacheLuceneSearchPhrasePositions:(id)a3
{
  return sub_1000CA8E0((uint64_t)self, a3);
}

- (void)sortRptGroupsWithJavaUtilArrayList:(id)a3
{
}

- (id)gatherRptGroupsWithJavaUtilLinkedHashMap:(id)a3
{
  return sub_1000CB1F8((uint64_t)self, a3);
}

- (int)tpPosWithOrgApacheLuceneSearchPhrasePositions:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return *((_DWORD *)a3 + 4) + *((_DWORD *)a3 + 2);
}

- (id)repeatingPPsWithJavaUtilHashMap:(id)a3
{
  return sub_1000CB810((uint64_t)self, a3);
}

- (id)ppTermsBitSetsWithOrgApacheLuceneSearchPhrasePositionsArray:(id)a3 withJavaUtilHashMap:(id)a4
{
  return sub_1000CB978((uint64_t)a3, a4);
}

- (void)unionTermGroupsWithJavaUtilArrayList:(id)a3
{
}

- (id)termGroupsWithJavaUtilLinkedHashMap:(id)a3 withJavaUtilArrayList:(id)a4
{
  return sub_1000CBBA8(a3, a4);
}

- (int)freq
{
  return self->numMatches_;
}

- (float)sloppyFreq
{
  return self->sloppyFreq_;
}

- (int)docID
{
  conjunction = self->conjunction_;
  if (!conjunction) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI *)conjunction docID];
}

- (int)nextDoc
{
  conjunction = self->conjunction_;
  if (!conjunction) {
    JreThrowNullPointerException();
  }
  unsigned int v4 = [(OrgApacheLuceneSearchConjunctionDISI *)conjunction nextDoc];
  int v5 = 0x7FFFFFFF;
  if (v4 != 0x7FFFFFFF)
  {
    unsigned int v6 = v4;
    float v7 = sub_1000CA31C((uint64_t)self);
    self->sloppyFreq_ = v7;
    int v5 = v6;
    if (v7 == 0.0)
    {
      while (1)
      {
        unsigned int v9 = [(OrgApacheLuceneSearchConjunctionDISI *)self->conjunction_ nextDoc];
        if (v9 == 0x7FFFFFFF) {
          break;
        }
        int v5 = v9;
        float v8 = sub_1000CA31C((uint64_t)self);
        self->sloppyFreq_ = v8;
        if (v8 != 0.0) {
          return v5;
        }
      }
      return 0x7FFFFFFF;
    }
  }
  return v5;
}

- (float)score
{
  docScorer = self->docScorer_;
  if (!docScorer) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = [(OrgApacheLuceneSearchSloppyPhraseScorer *)self docID];
  *(float *)&double v5 = self->sloppyFreq_;
  [(OrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer *)docScorer scoreWithInt:v4 withFloat:v5];
  return result;
}

- (int)advanceWithInt:(int)a3
{
  conjunction = self->conjunction_;
  if (!conjunction) {
    JreThrowNullPointerException();
  }
  unsigned int v5 = [(OrgApacheLuceneSearchConjunctionDISI *)conjunction advanceWithInt:*(void *)&a3];
  int v6 = 0x7FFFFFFF;
  if (v5 != 0x7FFFFFFF)
  {
    unsigned int v7 = v5;
    float v8 = sub_1000CA31C((uint64_t)self);
    self->sloppyFreq_ = v8;
    int v6 = v7;
    if (v8 == 0.0)
    {
      while (1)
      {
        unsigned int v10 = [(OrgApacheLuceneSearchConjunctionDISI *)self->conjunction_ nextDoc];
        if (v10 == 0x7FFFFFFF) {
          break;
        }
        int v6 = v10;
        float v9 = sub_1000CA31C((uint64_t)self);
        self->sloppyFreq_ = v9;
        if (v9 != 0.0) {
          return v6;
        }
      }
      return 0x7FFFFFFF;
    }
  }
  return v6;
}

- (int64_t)cost
{
  conjunction = self->conjunction_;
  if (!conjunction) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI *)conjunction cost];
}

- (id)description
{
  return (id)JreStrcat("$@C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"scorer(");
}

- (id)asTwoPhaseIterator
{
  conjunction = self->conjunction_;
  uint64_t v4 = [OrgApacheLuceneSearchSloppyPhraseScorer__2 alloc];
  JreStrongAssign((id *)&v4->this$0_, self);
  OrgApacheLuceneSearchTwoPhaseIterator_initWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)v4, (uint64_t)conjunction);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchSloppyPhraseScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end