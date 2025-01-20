@interface OrgApacheLuceneSearchWeight
- (OrgApacheLuceneSearchWeight)initWithOrgApacheLuceneSearchQuery:(id)a3;
- (id)bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (id)getQuery;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchWeight

- (OrgApacheLuceneSearchWeight)initWithOrgApacheLuceneSearchQuery:(id)a3
{
  return self;
}

- (id)getQuery
{
  return self->parentQuery_;
}

- (id)bulkScorerWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  id result = [(OrgApacheLuceneSearchWeight *)self scorerWithOrgApacheLuceneIndexLeafReaderContext:a3];
  if (result)
  {
    id v4 = result;
    v5 = [OrgApacheLuceneSearchWeight_DefaultBulkScorer alloc];
    OrgApacheLuceneSearchWeight_DefaultBulkScorer_initWithOrgApacheLuceneSearchScorer_((uint64_t)v5, v4);
    return v5;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchWeight;
  [(OrgApacheLuceneSearchWeight *)&v3 dealloc];
}

@end