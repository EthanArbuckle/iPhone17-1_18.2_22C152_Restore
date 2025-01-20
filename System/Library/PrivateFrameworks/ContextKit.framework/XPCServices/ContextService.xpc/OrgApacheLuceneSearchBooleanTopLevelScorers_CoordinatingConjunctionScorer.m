@interface OrgApacheLuceneSearchBooleanTopLevelScorers_CoordinatingConjunctionScorer
- (OrgApacheLuceneSearchBooleanTopLevelScorers_CoordinatingConjunctionScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withFloatArray:(id)a4 withOrgApacheLuceneSearchScorer:(id)a5 withInt:(int)a6 withOrgApacheLuceneSearchScorer:(id)a7;
- (float)score;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchBooleanTopLevelScorers_CoordinatingConjunctionScorer

- (OrgApacheLuceneSearchBooleanTopLevelScorers_CoordinatingConjunctionScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withFloatArray:(id)a4 withOrgApacheLuceneSearchScorer:(id)a5 withInt:(int)a6 withOrgApacheLuceneSearchScorer:(id)a7
{
  return self;
}

- (float)score
{
  v3 = *(void **)(&self->reqCount_ + 1);
  if (!v3
    || ([v3 score], (v5 = *(OrgApacheLuceneSearchScorer **)((char *)&self->req_ + 4)) == 0)
    || (float v6 = v4, [v5 score], (v8 = *(void *)(&self->super.coord_ + 1)) == 0))
  {
    JreThrowNullPointerException();
  }
  float v9 = v7;
  int coords_high = HIDWORD(self->coords_);
  unsigned int v11 = [*(id *)((char *)&self->req_ + 4) freq];
  uint64_t v12 = *(unsigned int *)(v8 + 8);
  int v13 = v11 + coords_high;
  if ((int)(v11 + coords_high) < 0 || v13 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v11 + coords_high);
  }
  return (float)(v6 + v9) * *(float *)(v8 + 12 + 4 * v13);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanTopLevelScorers_CoordinatingConjunctionScorer;
  [(OrgApacheLuceneSearchConjunctionScorer *)&v3 dealloc];
}

@end