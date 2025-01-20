@interface OrgApacheLuceneSearchIndexSearcher_$5
- (OrgApacheLuceneSearchIndexSearcher_$5)initWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withOrgApacheLuceneIndexLeafReaderContextArray:(id)a4 withOrgApacheLuceneSearchWeight:(id)a5 withOrgApacheLuceneSearchCollector:(id)a6;
- (id)call;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchIndexSearcher_$5

- (id)call
{
  return self->val$collector_;
}

- (OrgApacheLuceneSearchIndexSearcher_$5)initWithOrgApacheLuceneSearchIndexSearcher:(id)a3 withOrgApacheLuceneIndexLeafReaderContextArray:(id)a4 withOrgApacheLuceneSearchWeight:(id)a5 withOrgApacheLuceneSearchCollector:(id)a6
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchIndexSearcher__5;
  [(OrgApacheLuceneSearchIndexSearcher_$5 *)&v3 dealloc];
}

@end