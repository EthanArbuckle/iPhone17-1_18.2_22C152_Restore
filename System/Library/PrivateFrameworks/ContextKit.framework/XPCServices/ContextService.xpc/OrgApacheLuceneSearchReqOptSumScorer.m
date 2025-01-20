@interface OrgApacheLuceneSearchReqOptSumScorer
- (OrgApacheLuceneSearchReqOptSumScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4;
- (float)score;
- (id)asTwoPhaseIterator;
- (id)getChildren;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchReqOptSumScorer

- (OrgApacheLuceneSearchReqOptSumScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4
{
  return self;
}

- (id)asTwoPhaseIterator
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)reqScorer asTwoPhaseIterator];
}

- (int)nextDoc
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)reqScorer nextDoc];
}

- (int)advanceWithInt:(int)a3
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)reqScorer advanceWithInt:*(void *)&a3];
}

- (int)docID
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)reqScorer docID];
}

- (float)score
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    goto LABEL_10;
  }
  id v4 = [(OrgApacheLuceneSearchScorer *)reqScorer docID];
  [(OrgApacheLuceneSearchScorer *)self->reqScorer_ score];
  float v6 = v5;
  p_optScorer = &self->optScorer_;
  if (*p_optScorer)
  {
    int v8 = [(OrgApacheLuceneSearchScorer *)*p_optScorer docID];
    if (v8 < (int)v4)
    {
      int v8 = [(OrgApacheLuceneSearchScorer *)*p_optScorer advanceWithInt:v4];
      if (v8 == 0x7FFFFFFF)
      {
        JreStrongAssign((id *)p_optScorer, 0);
        return v6;
      }
    }
    if (v8 != v4) {
      return v6;
    }
    if (*p_optScorer)
    {
      [(OrgApacheLuceneSearchScorer *)*p_optScorer score];
      return v6 + v9;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
  return v6;
}

- (int)freq
{
  [(OrgApacheLuceneSearchReqOptSumScorer *)self score];
  optScorer = self->optScorer_;
  if (!optScorer) {
    return 1;
  }
  unsigned int v4 = [(OrgApacheLuceneSearchScorer *)optScorer docID];
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  if (v4 == [(OrgApacheLuceneSearchScorer *)reqScorer docID]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)getChildren
{
  v3 = new_JavaUtilArrayList_initWithInt_(2);
  [(JavaUtilArrayList *)v3 addWithId:new_OrgApacheLuceneSearchScorer_ChildScorer_initWithOrgApacheLuceneSearchScorer_withNSString_(self->reqScorer_, @"MUST")];
  [(JavaUtilArrayList *)v3 addWithId:new_OrgApacheLuceneSearchScorer_ChildScorer_initWithOrgApacheLuceneSearchScorer_withNSString_(self->optScorer_, @"SHOULD")];
  return v3;
}

- (int64_t)cost
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneSearchScorer *)reqScorer cost];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchReqOptSumScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end