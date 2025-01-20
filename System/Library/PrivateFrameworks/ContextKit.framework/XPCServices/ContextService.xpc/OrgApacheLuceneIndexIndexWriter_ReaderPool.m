@interface OrgApacheLuceneIndexIndexWriter_ReaderPool
- (BOOL)anyPendingDeletes;
- (BOOL)infoIsLiveWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3;
- (BOOL)noDups;
- (OrgApacheLuceneIndexIndexWriter_ReaderPool)initWithOrgApacheLuceneIndexIndexWriter:(id)a3;
- (id)getWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withBoolean:(BOOL)a4;
- (void)close;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexIndexWriter_ReaderPool

- (BOOL)infoIsLiveWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3
{
  return 1;
}

- (BOOL)anyPendingDeletes
{
  return 0;
}

- (void)close
{
}

- (id)getWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withBoolean:(BOOL)a4
{
  return 0;
}

- (BOOL)noDups
{
  return 1;
}

- (OrgApacheLuceneIndexIndexWriter_ReaderPool)initWithOrgApacheLuceneIndexIndexWriter:(id)a3
{
  p_readerMap = &self->readerMap_;
  v5 = new_JavaUtilHashMap_init();
  JreStrongAssignAndConsume((id *)p_readerMap, v5);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexIndexWriter_ReaderPool;
  [(OrgApacheLuceneIndexIndexWriter_ReaderPool *)&v3 dealloc];
}

@end