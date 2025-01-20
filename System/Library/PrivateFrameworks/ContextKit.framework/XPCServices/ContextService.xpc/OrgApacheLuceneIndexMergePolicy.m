@interface OrgApacheLuceneIndexMergePolicy
- (BOOL)isMergedWithOrgApacheLuceneIndexSegmentInfos:(id)a3 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a4 withOrgApacheLuceneIndexIndexWriter:(id)a5;
- (BOOL)useCompoundFileWithOrgApacheLuceneIndexSegmentInfos:(id)a3 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a4 withOrgApacheLuceneIndexIndexWriter:(id)a5;
- (OrgApacheLuceneIndexMergePolicy)init;
- (OrgApacheLuceneIndexMergePolicy)initWithDouble:(double)a3 withLong:(int64_t)a4;
- (double)getMaxCFSSegmentSizeMB;
- (double)getNoCFSRatio;
- (int64_t)sizeWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneIndexIndexWriter:(id)a4;
- (void)setMaxCFSSegmentSizeMBWithDouble:(double)a3;
- (void)setNoCFSRatioWithDouble:(double)a3;
@end

@implementation OrgApacheLuceneIndexMergePolicy

- (OrgApacheLuceneIndexMergePolicy)init
{
  self->noCFSRatio_ = 1.0;
  self->maxCFSSegmentSize_ = 0x7FFFFFFFFFFFFFFFLL;
  return self;
}

- (OrgApacheLuceneIndexMergePolicy)initWithDouble:(double)a3 withLong:(int64_t)a4
{
  self->noCFSRatio_ = a3;
  self->maxCFSSegmentSize_ = a4;
  return self;
}

- (BOOL)useCompoundFileWithOrgApacheLuceneIndexSegmentInfos:(id)a3 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a4 withOrgApacheLuceneIndexIndexWriter:(id)a5
{
  if (self->noCFSRatio_ == 0.0) {
    return 0;
  }
  int64_t v8 = [(OrgApacheLuceneIndexMergePolicy *)self sizeWithOrgApacheLuceneIndexSegmentCommitInfo:a4 withOrgApacheLuceneIndexIndexWriter:a5];
  if (v8 > self->maxCFSSegmentSize_) {
    return 0;
  }
  if (self->noCFSRatio_ >= 1.0) {
    return 1;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v10 = v8;
  id v11 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(a3);
        }
        v13 += -[OrgApacheLuceneIndexMergePolicy sizeWithOrgApacheLuceneIndexSegmentCommitInfo:withOrgApacheLuceneIndexIndexWriter:](self, "sizeWithOrgApacheLuceneIndexSegmentCommitInfo:withOrgApacheLuceneIndexIndexWriter:", *(void *)(*((void *)&v17 + 1) + 8 * i), a5, (void)v17);
      }
      id v12 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
    double v16 = (double)v13;
  }
  else
  {
    double v16 = 0.0;
  }
  return self->noCFSRatio_ * v16 >= (double)v10;
}

- (int64_t)sizeWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneIndexIndexWriter:(id)a4
{
  if (!a3
    || (id v6 = [a3 sizeInBytes], !a4)
    || (int64_t v7 = (int64_t)v6,
        int v8 = [a4 numDeletedDocsWithOrgApacheLuceneIndexSegmentCommitInfo:a3],
        (v9 = (void *)*((void *)a3 + 1)) == 0))
  {
    JreThrowNullPointerException();
  }
  if ((int)[v9 maxDoc] < 1) {
    double v10 = 0.0;
  }
  else {
    double v10 = (float)((float)v8 / (float)(int)[*((id *)a3 + 1) maxDoc]);
  }
  if ((int)[*((id *)a3 + 1) maxDoc] >= 1)
  {
    double v11 = (1.0 - v10) * (double)v7;
    int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 < 0.0) {
      int64_t v12 = 0x8000000000000000;
    }
    if ((uint64_t)v11 == 0x8000000000000000) {
      return v12;
    }
    else {
      return (uint64_t)v11;
    }
  }
  return v7;
}

- (BOOL)isMergedWithOrgApacheLuceneIndexSegmentInfos:(id)a3 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a4 withOrgApacheLuceneIndexIndexWriter:(id)a5
{
  if (!a5) {
    goto LABEL_8;
  }
  if ((int)[a5 numDeletedDocsWithOrgApacheLuceneIndexSegmentCommitInfo:a4] > 0) {
    return 0;
  }
  if (!a4 || (uint64_t v9 = *((void *)a4 + 1)) == 0) {
LABEL_8:
  }
    JreThrowNullPointerException();
  id v10 = *(id *)(v9 + 16);
  if (v10 != [a5 getDirectory]) {
    return 0;
  }
  unsigned __int8 v12 = [(OrgApacheLuceneIndexMergePolicy *)self useCompoundFileWithOrgApacheLuceneIndexSegmentInfos:a3 withOrgApacheLuceneIndexSegmentCommitInfo:a4 withOrgApacheLuceneIndexIndexWriter:a5];
  return v12 ^ [*((id *)a4 + 1) getUseCompoundFile] ^ 1;
}

- (double)getNoCFSRatio
{
  return self->noCFSRatio_;
}

- (void)setNoCFSRatioWithDouble:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
  {
    CFStringRef v10 = JreStrcat("$D", (uint64_t)a2, v3, v4, v5, v6, v7, v8, @"noCFSRatio must be 0.0 to 1.0 inclusive; got ");
    double v11 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  self->noCFSRatio_ = a3;
}

- (double)getMaxCFSSegmentSizeMB
{
  return (double)(self->maxCFSSegmentSize_ / 1024) * 0.0009765625;
}

- (void)setMaxCFSSegmentSizeMBWithDouble:(double)a3
{
  if (a3 < 0.0)
  {
    CFStringRef v11 = JreStrcat("$DC", (uint64_t)a2, v3, v4, v5, v6, v7, v8, @"maxCFSSegmentSizeMB must be >=0 (got ");
    unsigned __int8 v12 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v11);
    objc_exception_throw(v12);
  }
  double v9 = a3 * 1048576.0;
  int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 <= 9.22337204e18)
  {
    if (v9 < 0.0) {
      int64_t v10 = 0x8000000000000000;
    }
    if ((uint64_t)v9 != 0x8000000000000000) {
      int64_t v10 = (uint64_t)v9;
    }
  }
  self->maxCFSSegmentSize_ = v10;
}

@end