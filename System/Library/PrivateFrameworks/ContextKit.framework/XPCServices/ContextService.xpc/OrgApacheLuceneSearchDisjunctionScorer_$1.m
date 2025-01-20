@interface OrgApacheLuceneSearchDisjunctionScorer_$1
- (BOOL)matches;
- (OrgApacheLuceneSearchDisjunctionScorer_$1)initWithOrgApacheLuceneSearchDisjunctionScorer:(id)a3 withOrgApacheLuceneSearchDocIdSetIterator:(id)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchDisjunctionScorer_$1

- (BOOL)matches
{
  subScorers = self->this$0_->subScorers_;
  if (!subScorers) {
LABEL_18:
  }
    JreThrowNullPointerException();
  v4 = [(OrgApacheLuceneSearchDisiPriorityQueue *)subScorers topList];
  while (1)
  {
    if (!v4) {
      goto LABEL_18;
    }
    id v5 = v4[6];
    if (!v5 || ([v5 matches] & 1) != 0) {
      break;
    }
    v4 = (id *)v4[4];
    if (!v4) {
      return 0;
    }
  }
  v7 = v4 + 4;
  if (self->this$0_->needsScores_)
  {
    id v8 = *v7;
    if (*v7)
    {
      v9 = v4;
      do
      {
        v10 = (void *)*((void *)v8 + 6);
        v11 = (id *)v8;
        if (v10)
        {
          unsigned __int8 v12 = [v10 matches];
          v11 = (id *)v8;
          if ((v12 & 1) == 0)
          {
            JreStrongAssign(v9 + 4, *((void **)v8 + 4));
            v11 = v9;
          }
        }
        id v8 = (id)*((void *)v8 + 4);
        v9 = v11;
      }
      while (v8);
    }
  }
  else
  {
    JreStrongAssign(v7, 0);
  }
  JreStrongAssign((id *)&self->this$0_->topScorers_, v4);
  return 1;
}

- (OrgApacheLuceneSearchDisjunctionScorer_$1)initWithOrgApacheLuceneSearchDisjunctionScorer:(id)a3 withOrgApacheLuceneSearchDocIdSetIterator:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchDisjunctionScorer__1;
  [(OrgApacheLuceneSearchTwoPhaseIterator *)&v3 dealloc];
}

@end