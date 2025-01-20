@interface OrgApacheLuceneIndexMergeState_NoDelDocMap
- (OrgApacheLuceneIndexMergeState_NoDelDocMap)initWithInt:(int)a3;
- (int)getWithInt:(int)a3;
- (int)maxDoc;
- (int)numDeletedDocs;
@end

@implementation OrgApacheLuceneIndexMergeState_NoDelDocMap

- (OrgApacheLuceneIndexMergeState_NoDelDocMap)initWithInt:(int)a3
{
  self->maxDoc_ = a3;
  return self;
}

- (int)getWithInt:(int)a3
{
  return a3;
}

- (int)maxDoc
{
  return self->maxDoc_;
}

- (int)numDeletedDocs
{
  return 0;
}

@end