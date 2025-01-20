@interface OrgApacheLuceneIndexMergeState_DocMap
+ (id)buildWithInt:(int)a3 withOrgApacheLuceneUtilBits:(id)a4;
+ (id)buildWithOrgApacheLuceneIndexCodecReader:(id)a3;
- (BOOL)hasDeletions;
- (int)numDocs;
@end

@implementation OrgApacheLuceneIndexMergeState_DocMap

- (int)numDocs
{
  unsigned int v3 = [(OrgApacheLuceneIndexMergeState_DocMap *)self maxDoc];
  return v3 - [(OrgApacheLuceneIndexMergeState_DocMap *)self numDeletedDocs];
}

- (BOOL)hasDeletions
{
  return (int)[(OrgApacheLuceneIndexMergeState_DocMap *)self numDeletedDocs] > 0;
}

+ (id)buildWithOrgApacheLuceneIndexCodecReader:(id)a3
{
  return OrgApacheLuceneIndexMergeState_DocMap_buildWithOrgApacheLuceneIndexCodecReader_(a3);
}

+ (id)buildWithInt:(int)a3 withOrgApacheLuceneUtilBits:(id)a4
{
  return OrgApacheLuceneIndexMergeState_DocMap_buildWithInt_withOrgApacheLuceneUtilBits_(a3, a4);
}

@end