@interface OrgApacheLuceneSearchMinShouldMatchSumScorer
- (OrgApacheLuceneSearchMinShouldMatchSumScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilCollection:(id)a4 withInt:(int)a5 withFloatArray:(id)a6;
- setDocAndFreq;
- (float)score;
- (id)getChildren;
- (id)insertTailWithOverFlowWithOrgApacheLuceneSearchDisiWrapper:(id)a3;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int64_t)cost;
- (uint64_t)doNext;
- (void)addLeadWithOrgApacheLuceneSearchDisiWrapper:(id)a3;
- (void)addTailWithOrgApacheLuceneSearchDisiWrapper:(id)a3;
- (void)advanceTail;
- (void)advanceTailWithOrgApacheLuceneSearchDisiWrapper:(id)a3;
- (void)dealloc;
- (void)pushBackLeads;
@end

@implementation OrgApacheLuceneSearchMinShouldMatchSumScorer

- (OrgApacheLuceneSearchMinShouldMatchSumScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilCollection:(id)a4 withInt:(int)a5 withFloatArray:(id)a6
{
  return self;
}

- (int64_t)cost
{
  return self->cost_;
}

- (id)getChildren
{
  return self->childScorers_;
}

- (int)nextDoc
{
  for (i = self->lead_; i; i = i->next_)
  {
    v4 = sub_100046FB8((uint64_t)self, i);
    if (v4)
    {
      v5 = v4;
      int v6 = *((_DWORD *)v4 + 6);
      int doc = self->doc_;
      v8 = (void *)v4[1];
      if (v6 == doc)
      {
        if (!v8) {
          goto LABEL_14;
        }
        unsigned int v9 = [v8 nextDoc];
      }
      else
      {
        if (!v8) {
          goto LABEL_14;
        }
        unsigned int v9 = [v8 advanceWithInt:(doc + 1)];
      }
      *((_DWORD *)v5 + 6) = v9;
      head = self->head_;
      if (!head) {
LABEL_14:
      }
        JreThrowNullPointerException();
      [(OrgApacheLuceneSearchDisiPriorityQueue *)head addWithOrgApacheLuceneSearchDisiWrapper:v5];
    }
  }
  -[OrgApacheLuceneSearchMinShouldMatchSumScorer setDocAndFreq]_0((uint64_t)self);
  return -[OrgApacheLuceneSearchMinShouldMatchSumScorer doNext]_0((uint64_t)self);
}

- setDocAndFreq
{
  uint64_t v2;
  _DWORD *result;

  JreStrongAssign((id *)(a1 + 32), [*(id *)(a1 + 48) pop]);
  v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_7;
  }
  JreStrongAssign((id *)(v2 + 32), 0);
  *(_DWORD *)(a1 + 44) = 1;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(*(void *)(a1 + 32) + 24);
  result = [*(id *)(a1 + 48) size];
  if ((int)result >= 1)
  {
    while (1)
    {
      result = [*(id *)(a1 + 48) top];
      if (!result) {
        break;
      }
      if (result[6] == *(_DWORD *)(a1 + 40))
      {
        sub_1000473E0(a1, (id *)[*(id *)(a1 + 48) pop]);
        result = [*(id *)(a1 + 48) size];
        if ((int)result > 0) {
          continue;
        }
      }
      return result;
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return result;
}

- (uint64_t)doNext
{
  int v2 = *(_DWORD *)(a1 + 44);
  for (int i = *(_DWORD *)(a1 + 16); v2 < i; int i = *(_DWORD *)(a1 + 16))
  {
    if (*(_DWORD *)(a1 + 64) + v2 >= i)
    {
      uint64_t v5 = sub_100047958(a1);
      sub_1000474B8(a1, v5);
    }
    else
    {
      for (j = *(void **)(a1 + 32); j; j = (void *)j[4])
        sub_1000477C0(a1, j);
      -[OrgApacheLuceneSearchMinShouldMatchSumScorer setDocAndFreq]_0(a1);
    }
    int v2 = *(_DWORD *)(a1 + 44);
  }
  return *(unsigned int *)(a1 + 40);
}

- (int)advanceWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  for (int i = self->lead_; i; int i = i->next_)
  {
    int v6 = sub_100046FB8((uint64_t)self, i);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)v6[1];
      if (!v8) {
        goto LABEL_13;
      }
      *((_DWORD *)v7 + 6) = [v8 advanceWithInt:v3];
      head = self->head_;
      if (!head) {
        goto LABEL_13;
      }
      [(OrgApacheLuceneSearchDisiPriorityQueue *)head addWithOrgApacheLuceneSearchDisiWrapper:v7];
    }
  }
  v10 = self->head_;
  if (!v10 || (v11 = [(OrgApacheLuceneSearchDisiPriorityQueue *)v10 top]) == 0) {
LABEL_13:
  }
    JreThrowNullPointerException();
  v12 = v11;
  while (v12[6] < (int)v3)
  {
    v13 = sub_100046FB8((uint64_t)self, v12);
    v14 = (void *)v13[1];
    if (v14)
    {
      *((_DWORD *)v13 + 6) = [v14 advanceWithInt:v3];
      v12 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self->head_ updateTopWithOrgApacheLuceneSearchDisiWrapper:v13];
      if (v12) {
        continue;
      }
    }
    goto LABEL_13;
  }
  -[OrgApacheLuceneSearchMinShouldMatchSumScorer setDocAndFreq]_0((uint64_t)self);
  return -[OrgApacheLuceneSearchMinShouldMatchSumScorer doNext]_0((uint64_t)self);
}

- (void)addLeadWithOrgApacheLuceneSearchDisiWrapper:(id)a3
{
}

- (void)pushBackLeads
{
  for (int i = self->lead_; i; int i = i->next_)
    sub_1000477C0((uint64_t)self, i);
}

- (void)advanceTailWithOrgApacheLuceneSearchDisiWrapper:(id)a3
{
}

- (void)advanceTail
{
  uint64_t v3 = sub_100047958((uint64_t)self);
  sub_1000474B8((uint64_t)self, v3);
}

- (int)freq
{
  return self->freq_;
}

- (float)score
{
  sub_1000475C8(self);
  lead = self->lead_;
  if (lead)
  {
    double v4 = 0.0;
    do
    {
      iterator = lead->iterator_;
      if (!iterator) {
        goto LABEL_11;
      }
      [(OrgApacheLuceneSearchDocIdSetIterator *)iterator score];
      double v4 = v4 + v6;
      lead = lead->next_;
    }
    while (lead);
    float v7 = v4;
  }
  else
  {
    float v7 = 0.0;
  }
  coord = self->coord_;
  if (!coord) {
LABEL_11:
  }
    JreThrowNullPointerException();
  int freq = self->freq_;
  uint64_t size = coord->super.size_;
  if (freq < 0 || freq >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, freq);
  }
  return *((float *)&coord->super.size_ + freq + 1) * v7;
}

- (int)docID
{
  return self->doc_;
}

- (id)insertTailWithOverFlowWithOrgApacheLuceneSearchDisiWrapper:(id)a3
{
  return sub_100046FB8((uint64_t)self, a3);
}

- (void)addTailWithOrgApacheLuceneSearchDisiWrapper:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchMinShouldMatchSumScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end