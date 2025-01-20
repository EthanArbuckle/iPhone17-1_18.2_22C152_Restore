@interface OrgApacheLuceneIndexMergeState_DocMap_$1
- (OrgApacheLuceneIndexMergeState_DocMap_$1)initWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneUtilPackedPackedLongValues:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)getWithInt:(int)a3;
- (int)maxDoc;
- (int)numDeletedDocs;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMergeState_DocMap_$1

- (int)getWithInt:(int)a3
{
  v4 = self->val$liveDocs_;
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)&a3;
  if (-[OrgApacheLuceneUtilBits getWithInt:](v4, "getWithInt:"))
  {
    v6 = self->val$docMap_;
    if (v6) {
      return [(OrgApacheLuceneUtilLongValues *)v6 getWithInt:v5];
    }
LABEL_6:
    JreThrowNullPointerException();
  }
  return -1;
}

- (int)maxDoc
{
  return self->val$maxDoc_;
}

- (int)numDeletedDocs
{
  return self->val$numDeletedDocs_;
}

- (OrgApacheLuceneIndexMergeState_DocMap_$1)initWithOrgApacheLuceneUtilBits:(id)a3 withOrgApacheLuceneUtilPackedPackedLongValues:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  self->val$maxDoc_ = a5;
  self->val$numDeletedDocs_ = a6;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMergeState_DocMap__1;
  [(OrgApacheLuceneIndexMergeState_DocMap_$1 *)&v3 dealloc];
}

@end