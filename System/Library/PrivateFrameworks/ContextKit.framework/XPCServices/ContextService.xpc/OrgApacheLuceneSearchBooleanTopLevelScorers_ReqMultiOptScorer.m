@interface OrgApacheLuceneSearchBooleanTopLevelScorers_ReqMultiOptScorer
- (OrgApacheLuceneSearchBooleanTopLevelScorers_ReqMultiOptScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4 withInt:(int)a5 withFloatArray:(id)a6;
- (float)score;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchBooleanTopLevelScorers_ReqMultiOptScorer

- (OrgApacheLuceneSearchBooleanTopLevelScorers_ReqMultiOptScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4 withInt:(int)a5 withFloatArray:(id)a6
{
  self->requiredCount_ = a5;
  JreStrongAssign((id *)&self->coords_, a6);
  return self;
}

- (float)score
{
  reqScorer = self->super.reqScorer_;
  if (!reqScorer) {
    goto LABEL_15;
  }
  id v4 = [(OrgApacheLuceneSearchScorer *)reqScorer docID];
  [(OrgApacheLuceneSearchScorer *)self->super.reqScorer_ score];
  float v6 = v5;
  p_optScorer = &self->super.optScorer_;
  optScorer = self->super.optScorer_;
  if (!optScorer) {
    goto LABEL_11;
  }
  int v9 = [(OrgApacheLuceneSearchScorer *)optScorer docID];
  if (v9 < (int)v4)
  {
    int v9 = [(OrgApacheLuceneSearchScorer *)*p_optScorer advanceWithInt:v4];
    if (v9 == 0x7FFFFFFF)
    {
      JreStrongAssign((id *)&self->super.optScorer_, 0);
      goto LABEL_11;
    }
  }
  if (v9 != v4)
  {
LABEL_11:
    coords = self->coords_;
    if (coords)
    {
      uint64_t requiredCount = self->requiredCount_;
      uint64_t size = coords->super.size_;
      if ((requiredCount & 0x80000000) != 0) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  if (!*p_optScorer) {
    goto LABEL_15;
  }
  [(OrgApacheLuceneSearchScorer *)*p_optScorer score];
  coords = self->coords_;
  if (!coords) {
    goto LABEL_15;
  }
  float v6 = v6 + v10;
  int v12 = self->requiredCount_;
  unsigned int v13 = [(OrgApacheLuceneSearchScorer *)*p_optScorer freq];
  uint64_t size = coords->super.size_;
  uint64_t requiredCount = v13 + v12;
  if ((int)requiredCount < 0) {
LABEL_16:
  }
    IOSArray_throwOutOfBoundsWithMsg(size, requiredCount);
LABEL_13:
  if ((int)requiredCount >= (int)size) {
    goto LABEL_16;
  }
  return v6 * *((float *)&coords->super.size_ + (int)requiredCount + 1);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanTopLevelScorers_ReqMultiOptScorer;
  [(OrgApacheLuceneSearchReqOptSumScorer *)&v3 dealloc];
}

@end