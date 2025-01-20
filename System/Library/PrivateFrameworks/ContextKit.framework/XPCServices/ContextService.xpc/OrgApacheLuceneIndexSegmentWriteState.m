@interface OrgApacheLuceneIndexSegmentWriteState
- (BOOL)assertSegmentSuffixWithNSString:(id)a3;
- (OrgApacheLuceneIndexSegmentWriteState)initWithOrgApacheLuceneIndexSegmentWriteState:(id)a3 withNSString:(id)a4;
- (OrgApacheLuceneIndexSegmentWriteState)initWithOrgApacheLuceneUtilInfoStream:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexSegmentInfo:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneIndexBufferedUpdates:(id)a7 withOrgApacheLuceneStoreIOContext:(id)a8;
- (OrgApacheLuceneIndexSegmentWriteState)initWithOrgApacheLuceneUtilInfoStream:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexSegmentInfo:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneIndexBufferedUpdates:(id)a7 withOrgApacheLuceneStoreIOContext:(id)a8 withNSString:(id)a9;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexSegmentWriteState

- (OrgApacheLuceneIndexSegmentWriteState)initWithOrgApacheLuceneUtilInfoStream:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexSegmentInfo:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneIndexBufferedUpdates:(id)a7 withOrgApacheLuceneStoreIOContext:(id)a8
{
  return self;
}

- (OrgApacheLuceneIndexSegmentWriteState)initWithOrgApacheLuceneUtilInfoStream:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexSegmentInfo:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneIndexBufferedUpdates:(id)a7 withOrgApacheLuceneStoreIOContext:(id)a8 withNSString:(id)a9
{
  return self;
}

- (OrgApacheLuceneIndexSegmentWriteState)initWithOrgApacheLuceneIndexSegmentWriteState:(id)a3 withNSString:(id)a4
{
  return self;
}

- (BOOL)assertSegmentSuffixWithNSString:(id)a3
{
  if (!a3) {
    goto LABEL_9;
  }
  if ([a3 isEmpty]) {
    return 1;
  }
  v4 = [a3 split:@"_"];
  if (!v4) {
LABEL_9:
  }
    JreThrowNullPointerException();
  int v11 = v4[2];
  if (v11 == 2) {
    return 1;
  }
  if (v11 == 1)
  {
    JavaLangLong_parseLongWithNSString_withInt_(a3, 36, v5, v6, v7, v8, v9, v10);
    return 1;
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentWriteState;
  [(OrgApacheLuceneIndexSegmentWriteState *)&v3 dealloc];
}

@end