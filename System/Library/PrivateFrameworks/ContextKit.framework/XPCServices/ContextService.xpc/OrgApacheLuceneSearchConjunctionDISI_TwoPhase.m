@interface OrgApacheLuceneSearchConjunctionDISI_TwoPhase
- (BOOL)matches;
- (OrgApacheLuceneSearchConjunctionDISI_TwoPhase)initWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4;
- (id)asTwoPhaseIterator;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConjunctionDISI_TwoPhase

- (OrgApacheLuceneSearchConjunctionDISI_TwoPhase)initWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4
{
  return self;
}

- (id)asTwoPhaseIterator
{
  return self->twoPhaseView_;
}

- (BOOL)matches
{
  twoPhaseView = self->twoPhaseView_;
  if (!twoPhaseView) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchConjunctionDISI_TwoPhaseConjunctionDISI *)twoPhaseView matches];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConjunctionDISI_TwoPhase;
  [(OrgApacheLuceneSearchConjunctionDISI *)&v3 dealloc];
}

@end