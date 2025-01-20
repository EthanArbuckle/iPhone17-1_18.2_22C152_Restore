@interface OrgApacheLuceneSearchConjunctionDISI_TwoPhaseConjunctionDISI
- (BOOL)matches;
- (OrgApacheLuceneSearchConjunctionDISI_TwoPhaseConjunctionDISI)initWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConjunctionDISI_TwoPhaseConjunctionDISI

- (OrgApacheLuceneSearchConjunctionDISI_TwoPhaseConjunctionDISI)initWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4
{
  return self;
}

- (BOOL)matches
{
  twoPhaseIterators = self->twoPhaseIterators_;
  if (!twoPhaseIterators) {
LABEL_7:
  }
    JreThrowNullPointerException();
  p_elementType = (void **)&twoPhaseIterators->elementType_;
  unint64_t v4 = (unint64_t)&(&twoPhaseIterators->elementType_)[twoPhaseIterators->super.size_];
  do
  {
    v5 = p_elementType;
    if ((unint64_t)p_elementType >= v4) {
      break;
    }
    v6 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_7;
    }
    ++p_elementType;
  }
  while (([v6 matches] & 1) != 0);
  return (unint64_t)v5 >= v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConjunctionDISI_TwoPhaseConjunctionDISI;
  [(OrgApacheLuceneSearchTwoPhaseIterator *)&v3 dealloc];
}

@end