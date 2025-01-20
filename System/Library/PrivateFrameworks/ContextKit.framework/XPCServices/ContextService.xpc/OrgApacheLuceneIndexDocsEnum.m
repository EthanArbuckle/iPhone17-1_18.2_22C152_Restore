@interface OrgApacheLuceneIndexDocsEnum
- (OrgApacheLuceneIndexDocsEnum)init;
- (id)getPayload;
- (int)endOffset;
- (int)nextPosition;
- (int)startOffset;
@end

@implementation OrgApacheLuceneIndexDocsEnum

- (OrgApacheLuceneIndexDocsEnum)init
{
  return self;
}

- (int)nextPosition
{
  return -1;
}

- (int)startOffset
{
  return -1;
}

- (int)endOffset
{
  return -1;
}

- (id)getPayload
{
  return 0;
}

@end