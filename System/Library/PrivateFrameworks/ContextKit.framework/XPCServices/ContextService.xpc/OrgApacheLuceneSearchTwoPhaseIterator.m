@interface OrgApacheLuceneSearchTwoPhaseIterator
+ (id)asDocIdSetIteratorWithOrgApacheLuceneSearchTwoPhaseIterator:(id)a3;
+ (id)asTwoPhaseIteratorWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (OrgApacheLuceneSearchTwoPhaseIterator)initWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (id)approximation;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTwoPhaseIterator

- (OrgApacheLuceneSearchTwoPhaseIterator)initWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  p_approximation = &self->approximation_;
  v5 = (void *)OrgLukhnosPortmobileUtilObjects_requireNonNullWithId_((uint64_t)a3);
  JreStrongAssign((id *)p_approximation, v5);
  return self;
}

+ (id)asDocIdSetIteratorWithOrgApacheLuceneSearchTwoPhaseIterator:(id)a3
{
  return OrgApacheLuceneSearchTwoPhaseIterator_asDocIdSetIteratorWithOrgApacheLuceneSearchTwoPhaseIterator_(a3);
}

- (id)approximation
{
  return self->approximation_;
}

+ (id)asTwoPhaseIteratorWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  return OrgApacheLuceneSearchTwoPhaseIterator_asTwoPhaseIteratorWithOrgApacheLuceneSearchDocIdSetIterator_(a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTwoPhaseIterator;
  [(OrgApacheLuceneSearchTwoPhaseIterator *)&v3 dealloc];
}

@end