@interface OrgApacheLuceneSearchBooleanTopLevelScorers_ReqSingleOptScorer
- (OrgApacheLuceneSearchBooleanTopLevelScorers_ReqSingleOptScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4 withFloat:(float)a5 withFloat:(float)a6;
- (float)score;
@end

@implementation OrgApacheLuceneSearchBooleanTopLevelScorers_ReqSingleOptScorer

- (OrgApacheLuceneSearchBooleanTopLevelScorers_ReqSingleOptScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4 withFloat:(float)a5 withFloat:(float)a6
{
  self->coordReq_ = a5;
  self->coordBoth_ = a6;
  return self;
}

- (float)score
{
  reqScorer = self->super.reqScorer_;
  if (!reqScorer) {
    goto LABEL_11;
  }
  id v4 = [(OrgApacheLuceneSearchScorer *)reqScorer docID];
  [(OrgApacheLuceneSearchScorer *)self->super.reqScorer_ score];
  float v6 = v5;
  p_optScorer = &self->super.optScorer_;
  optScorer = self->super.optScorer_;
  if (!optScorer)
  {
LABEL_9:
    v11 = &OBJC_IVAR___OrgApacheLuceneSearchBooleanTopLevelScorers_ReqSingleOptScorer_coordReq_;
    return v6 * *(float *)((char *)&self->super.super.super.super.isa + *v11);
  }
  int v9 = [(OrgApacheLuceneSearchScorer *)optScorer docID];
  if (v9 < (int)v4)
  {
    int v9 = [(OrgApacheLuceneSearchScorer *)*p_optScorer advanceWithInt:v4];
    if (v9 == 0x7FFFFFFF)
    {
      JreStrongAssign((id *)&self->super.optScorer_, 0);
      goto LABEL_9;
    }
  }
  if (v9 != v4) {
    goto LABEL_9;
  }
  if (!*p_optScorer) {
LABEL_11:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneSearchScorer *)*p_optScorer score];
  float v6 = v6 + v10;
  v11 = &OBJC_IVAR___OrgApacheLuceneSearchBooleanTopLevelScorers_ReqSingleOptScorer_coordBoth_;
  return v6 * *(float *)((char *)&self->super.super.super.super.isa + *v11);
}

@end