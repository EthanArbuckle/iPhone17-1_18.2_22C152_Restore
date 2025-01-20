@interface OrgApacheLuceneIndexMergePolicy_OneMerge
- (OrgApacheLuceneIndexMergePolicy_OneMerge)initWithJavaUtilList:(id)a3;
- (id)getDocMapWithOrgApacheLuceneIndexMergeState:(id)a3;
- (id)getException;
- (id)getMergeInfo;
- (id)getMergeReaders;
- (id)getStoreMergeInfo;
- (id)segString;
- (int)totalNumDocs;
- (int64_t)totalBytesSize;
- (void)dealloc;
- (void)setExceptionWithJavaLangThrowable:(id)a3;
- (void)setMergeInfoWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3;
@end

@implementation OrgApacheLuceneIndexMergePolicy_OneMerge

- (OrgApacheLuceneIndexMergePolicy_OneMerge)initWithJavaUtilList:(id)a3
{
  return self;
}

- (id)getMergeReaders
{
  readers = self->readers_;
  if (!readers)
  {
    v12 = new_JavaLangIllegalStateException_initWithNSString_(@"IndexWriter has not initialized readers from the segment infos yet");
    objc_exception_throw(v12);
  }
  v4 = new_JavaUtilArrayList_initWithInt_((uint64_t)[(JavaUtilList *)readers size]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->readers_;
  id v6 = [(JavaUtilList *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (!v10) {
          JreThrowNullPointerException();
        }
        if ((int)[*(id *)(*((void *)&v13 + 1) + 8 * i) numDocs] >= 1) {
          [(JavaUtilArrayList *)v4 addWithId:v10];
        }
      }
      id v7 = [(JavaUtilList *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return JavaUtilCollections_unmodifiableListWithJavaUtilList_(v4);
}

- (void)setMergeInfoWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3
{
}

- (id)getMergeInfo
{
  return self->info_;
}

- (id)getDocMapWithOrgApacheLuceneIndexMergeState:(id)a3
{
  v3 = [OrgApacheLuceneIndexMergePolicy_OneMerge__1 alloc];
  return v3;
}

- (void)setExceptionWithJavaLangThrowable:(id)a3
{
  objc_sync_enter(self);
  JreStrongAssign((id *)&self->error_, a3);
  objc_sync_exit(self);
}

- (id)getException
{
  objc_sync_enter(self);
  error = self->error_;
  objc_sync_exit(self);
  return error;
}

- (id)segString
{
  v3 = new_JavaLangStringBuilder_init();
  segments = self->segments_;
  if (!segments) {
    goto LABEL_20;
  }
  int v5 = [(JavaUtilList *)segments size];
  if (v5 >= 1)
  {
    int v13 = v5;
    uint64_t v14 = 0;
    do
    {
      if (v14) {
        [(JavaLangStringBuilder *)v3 appendWithChar:32];
      }
      id v15 = [(JavaUtilList *)self->segments_ getWithInt:v14];
      if (!v15) {
        goto LABEL_20;
      }
      -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", [v15 description]);
      uint64_t v14 = (v14 + 1);
    }
    while (v13 != v14);
  }
  if (self->info_)
  {
    id v16 = [(JavaLangStringBuilder *)v3 appendWithNSString:@" into "];
    if (!v16) {
      goto LABEL_20;
    }
    info = self->info_->info_;
    if (!info) {
      goto LABEL_20;
    }
    [v16 appendWithNSString:info->name_];
  }
  if (self->maxNumSegments_ != -1) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:JreStrcat("$IC", v6, v7, v8, v9, v10, v11, v12, @" [maxNumSegments=")];
  }
  rateLimiter = self->rateLimiter_;
  if (!rateLimiter) {
LABEL_20:
  }
    JreThrowNullPointerException();
  if ([(OrgApacheLuceneIndexMergeRateLimiter *)rateLimiter getAbort]) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@" [ABORTED]"];
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (int64_t)totalBytesSize
{
  return atomic_load((unint64_t *)&self->totalMergeBytes_);
}

- (int)totalNumDocs
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  segments = self->segments_;
  if (!segments) {
LABEL_14:
  }
    JreThrowNullPointerException();
  id v3 = [(JavaUtilList *)self->segments_ countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  int v5 = 0;
  uint64_t v6 = *(void *)v12;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(segments);
      }
      uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
      if (!v8) {
        goto LABEL_14;
      }
      uint64_t v9 = *(void **)(v8 + 8);
      if (!v9) {
        goto LABEL_14;
      }
      v5 += objc_msgSend(v9, "maxDoc", (void)v11);
    }
    id v4 = [(JavaUtilList *)segments countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v4);
  return v5;
}

- (id)getStoreMergeInfo
{
  int totalMaxDoc = self->totalMaxDoc_;
  int64_t v3 = atomic_load((unint64_t *)&self->estimatedMergeBytes_);
  id v4 = new_OrgApacheLuceneStoreMergeInfo_initWithInt_withLong_withBoolean_withInt_(totalMaxDoc, v3, self->isExternal_, self->maxNumSegments_);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMergePolicy_OneMerge;
  [(OrgApacheLuceneIndexMergePolicy_OneMerge *)&v3 dealloc];
}

@end