@interface OrgApacheLuceneSearchDisjunctionScorer
- (OrgApacheLuceneSearchDisjunctionScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilList:(id)a4 withBoolean:(BOOL)a5;
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

@implementation OrgApacheLuceneSearchDisjunctionScorer

- (OrgApacheLuceneSearchDisjunctionScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withJavaUtilList:(id)a4 withBoolean:(BOOL)a5
{
  return self;
}

- (id)asTwoPhaseIterator
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  subScorers = self->subScorers_;
  if (!subScorers) {
LABEL_14:
  }
    JreThrowNullPointerException();
  id result = [(OrgApacheLuceneSearchDisiPriorityQueue *)self->subScorers_ countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(subScorers);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        if (!v8) {
          goto LABEL_14;
        }
        if (*(void *)(v8 + 48))
        {
          v9 = new_OrgApacheLuceneSearchDisjunctionDISIApproximation_initWithOrgApacheLuceneSearchDisiPriorityQueue_(self->subScorers_);
          v10 = [OrgApacheLuceneSearchDisjunctionScorer__1 alloc];
          JreStrongAssign((id *)&v10->this$0_, self);
          OrgApacheLuceneSearchTwoPhaseIterator_initWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)v10, (uint64_t)v9);
          return v10;
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id result = [(OrgApacheLuceneSearchDisiPriorityQueue *)subScorers countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v5 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (int64_t)cost
{
  return self->cost_;
}

- (int)docID
{
  subScorers = self->subScorers_;
  if (!subScorers || (v3 = [(OrgApacheLuceneSearchDisiPriorityQueue *)subScorers top]) == 0) {
    JreThrowNullPointerException();
  }
  return v3[6];
}

- (int)nextDoc
{
  JreStrongAssign((id *)&self->topScorers_, 0);
  subScorers = self->subScorers_;
  if (!subScorers || (v4 = [(OrgApacheLuceneSearchDisiPriorityQueue *)subScorers top]) == 0) {
LABEL_8:
  }
    JreThrowNullPointerException();
  id v5 = v4;
  int v6 = v4[6];
  do
  {
    v7 = (void *)*((void *)v5 + 1);
    if (!v7) {
      goto LABEL_8;
    }
    v5[6] = [v7 nextDoc];
    uint64_t v8 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self->subScorers_ updateTop];
    if (!v8) {
      goto LABEL_8;
    }
    id v5 = v8;
    int result = v8[6];
  }
  while (result == v6);
  return result;
}

- (int)advanceWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  JreStrongAssign((id *)&self->topScorers_, 0);
  subScorers = self->subScorers_;
  if (!subScorers) {
LABEL_7:
  }
    JreThrowNullPointerException();
  int v6 = [(OrgApacheLuceneSearchDisiPriorityQueue *)subScorers top];
  do
  {
    v7 = (void *)*((void *)v6 + 1);
    if (!v7) {
      goto LABEL_7;
    }
    v6[6] = [v7 advanceWithInt:v3];
    uint64_t v8 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self->subScorers_ updateTop];
    if (!v8) {
      goto LABEL_7;
    }
    int v6 = v8;
    int result = v8[6];
  }
  while (result < (int)v3);
  return result;
}

- (int)freq
{
  p_topScorers = &self->topScorers_;
  topScorers = self->topScorers_;
  if (!topScorers)
  {
    subScorers = self->subScorers_;
    if (!subScorers
      || (JreStrongAssign((id *)p_topScorers, [(OrgApacheLuceneSearchDisiPriorityQueue *)subScorers topList]),
          (topScorers = *p_topScorers) == 0))
    {
      JreThrowNullPointerException();
    }
  }
  int result = 0;
  do
  {
    topScorers = topScorers->next_;
    ++result;
  }
  while (topScorers);
  return result;
}

- (float)score
{
  p_topScorers = &self->topScorers_;
  topScorers = self->topScorers_;
  if (!topScorers)
  {
    subScorers = self->subScorers_;
    if (!subScorers) {
      JreThrowNullPointerException();
    }
    JreStrongAssign((id *)p_topScorers, [(OrgApacheLuceneSearchDisiPriorityQueue *)subScorers topList]);
    topScorers = *p_topScorers;
  }
  [(OrgApacheLuceneSearchDisjunctionScorer *)self scoreWithOrgApacheLuceneSearchDisiWrapper:topScorers];
  return result;
}

- (id)getChildren
{
  uint64_t v3 = new_JavaUtilArrayList_init();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  subScorers = self->subScorers_;
  if (!subScorers) {
LABEL_11:
  }
    JreThrowNullPointerException();
  id v5 = v3;
  id v6 = [(OrgApacheLuceneSearchDisiPriorityQueue *)subScorers countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(subScorers);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (!v10) {
          goto LABEL_11;
        }
        long long v11 = new_OrgApacheLuceneSearchScorer_ChildScorer_initWithOrgApacheLuceneSearchScorer_withNSString_(*(void **)(v10 + 8), @"SHOULD");
        -[JavaUtilArrayList addWithId:](v5, "addWithId:", v11, (void)v13);
      }
      id v7 = [(OrgApacheLuceneSearchDisiPriorityQueue *)subScorers countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchDisjunctionScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end