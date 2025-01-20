@interface OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector
- (OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector)initWithOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a3 withIntArray:(id)a4;
- (int)compareBottomWithInt:(int)a3;
- (int)compareTopWithInt:(int)a3;
- (void)copy__WithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setBottomWithInt:(int)a3;
- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector

- (OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector)initWithOrgApacheLuceneSearchLeafFieldComparatorArray:(id)a3 withIntArray:(id)a4
{
  return self;
}

- (int)compareBottomWithInt:(int)a3
{
  return sub_10009AD1C((uint64_t)self, *(uint64_t *)&a3);
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
}

- (void)setBottomWithInt:(int)a3
{
}

- (int)compareTopWithInt:(int)a3
{
  return sub_10009AF4C((uint64_t)self, *(uint64_t *)&a3);
}

- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3
{
  JreStrongAssign((id *)&self->scorer_, a3);
  comparators = self->comparators_;
  if (!comparators) {
LABEL_7:
  }
    JreThrowNullPointerException();
  p_elementType = (void **)&comparators->elementType_;
  unint64_t v7 = (unint64_t)&(&comparators->elementType_)[comparators->super.size_];
  while ((unint64_t)p_elementType < v7)
  {
    v8 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_7;
    }
    ++p_elementType;
    [v8 setScorerWithOrgApacheLuceneSearchScorer:a3];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector;
  [(OrgApacheLuceneSearchTopFieldCollector_MultiComparatorLeafCollector *)&v3 dealloc];
}

@end