@interface OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile
- (OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile)initWithOrgApacheLuceneStoreDirectory:(id)a3;
- (id)run;
- (id)runWithOrgApacheLuceneIndexIndexCommit:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile

- (OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile)initWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return self;
}

- (id)run
{
  return [(OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile *)self runWithOrgApacheLuceneIndexIndexCommit:0];
}

- (id)runWithOrgApacheLuceneIndexIndexCommit:(id)a3
{
  directory = self->directory_;
  if (a3)
  {
    if (directory == [a3 getDirectory])
    {
      id v6 = [a3 getSegmentsFileName];
      return [(OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile *)self doBodyWithNSString:v6];
    }
    v26 = (OrgApacheLuceneIndexIndexNotFoundException *)new_JavaIoIOException_initWithNSString_(@"the specified commit does not match the specified Directory");
LABEL_24:
    objc_exception_throw(v26);
  }
  if (!directory) {
LABEL_21:
  }
    JreThrowNullPointerException();
  while (1)
  {
    id v8 = [(OrgApacheLuceneStoreDirectory *)directory listAll];
    id v9 = [(OrgApacheLuceneStoreDirectory *)self->directory_ listAll];
    JavaUtilArrays_sortWithNSObjectArray_(v8);
    JavaUtilArrays_sortWithNSObjectArray_(v9);
    if (JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)v8, (uint64_t)v9)) {
      break;
    }
    directory = self->directory_;
    if (!directory) {
      goto LABEL_21;
    }
  }
  uint64_t LastCommitGenerationWithNSStringArray = OrgApacheLuceneIndexSegmentInfos_getLastCommitGenerationWithNSStringArray_((uint64_t)v8);
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneIndexSegmentInfos__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  if (qword_10055FCC0)
  }
  {
    JreStrcat("$J", v10, v11, v12, v13, v14, v15, v16, @"directory listing gen=");
    sub_10001D11C();
  }
  if (LastCommitGenerationWithNSStringArray == -1)
  {
    JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)v8);
    CFStringRef v34 = JreStrcat("$@$$", v27, v28, v29, v30, v31, v32, v33, @"no segments* file found in ");
    v26 = new_OrgApacheLuceneIndexIndexNotFoundException_initWithNSString_((uint64_t)v34);
    goto LABEL_24;
  }
  if (LastCommitGenerationWithNSStringArray <= -1) {
    objc_exception_throw(0);
  }
  id v25 = [(OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile *)self doBodyWithNSString:OrgApacheLuceneIndexIndexFileNames_fileNameFromGenerationWithNSString_withNSString_withLong_(OrgApacheLuceneIndexIndexFileNames_SEGMENTS_, &stru_10048C1F8, LastCommitGenerationWithNSStringArray)];
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneIndexSegmentInfos__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  if (qword_10055FCC0)
  }
  {
    JreStrcat("$$", v18, v19, v20, v21, v22, v23, v24, @"success on ");
    sub_10001D11C();
  }
  return v25;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile;
  [(OrgApacheLuceneIndexSegmentInfos_FindSegmentsFile *)&v3 dealloc];
}

@end