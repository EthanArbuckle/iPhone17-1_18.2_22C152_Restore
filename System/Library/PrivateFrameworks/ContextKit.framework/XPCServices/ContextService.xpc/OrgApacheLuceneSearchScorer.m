@interface OrgApacheLuceneSearchScorer
- (OrgApacheLuceneSearchScorer)initWithOrgApacheLuceneSearchWeight:(id)a3;
- (id)asTwoPhaseIterator;
- (id)getWeight;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchScorer

- (OrgApacheLuceneSearchScorer)initWithOrgApacheLuceneSearchWeight:(id)a3
{
  return self;
}

- (id)getWeight
{
  return self->weight_;
}

- (id)asTwoPhaseIterator
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end