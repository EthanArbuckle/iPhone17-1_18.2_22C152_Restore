@interface OrgApacheLuceneIndexStandardDirectoryReader
+ (id)openWithOrgApacheLuceneIndexIndexWriter:(id)a3 withOrgApacheLuceneIndexSegmentInfos:(id)a4 withBoolean:(BOOL)a5;
+ (id)openWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexIndexCommit:(id)a4;
- (BOOL)isCurrent;
- (OrgApacheLuceneIndexStandardDirectoryReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexLeafReaderArray:(id)a4 withOrgApacheLuceneIndexIndexWriter:(id)a5 withOrgApacheLuceneIndexSegmentInfos:(id)a6 withBoolean:(BOOL)a7;
- (id)description;
- (id)doOpenFromCommitWithOrgApacheLuceneIndexIndexCommit:(id)a3;
- (id)doOpenFromWriterWithOrgApacheLuceneIndexIndexCommit:(id)a3;
- (id)doOpenIfChanged;
- (id)doOpenIfChangedWithOrgApacheLuceneIndexIndexCommit:(id)a3;
- (id)doOpenIfChangedWithOrgApacheLuceneIndexIndexWriter:(id)a3 withBoolean:(BOOL)a4;
- (id)doOpenIfChangedWithOrgApacheLuceneIndexSegmentInfos:(id)a3;
- (id)doOpenNoWriterWithOrgApacheLuceneIndexIndexCommit:(id)a3;
- (id)getIndexCommit;
- (int64_t)getVersion;
- (void)dealloc;
- (void)doClose;
@end

@implementation OrgApacheLuceneIndexStandardDirectoryReader

- (OrgApacheLuceneIndexStandardDirectoryReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexLeafReaderArray:(id)a4 withOrgApacheLuceneIndexIndexWriter:(id)a5 withOrgApacheLuceneIndexSegmentInfos:(id)a6 withBoolean:(BOOL)a7
{
  return self;
}

+ (id)openWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexIndexCommit:(id)a4
{
  return OrgApacheLuceneIndexStandardDirectoryReader_openWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexIndexCommit_(a3, (uint64_t)a4);
}

+ (id)openWithOrgApacheLuceneIndexIndexWriter:(id)a3 withOrgApacheLuceneIndexSegmentInfos:(id)a4 withBoolean:(BOOL)a5
{
  return OrgApacheLuceneIndexStandardDirectoryReader_openWithOrgApacheLuceneIndexIndexWriter_withOrgApacheLuceneIndexSegmentInfos_withBoolean_((id *)a3, a4, a5);
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  -[JavaLangStringBuilder appendWithNSString:](v3, "appendWithNSString:", objc_msgSend(-[OrgApacheLuceneIndexStandardDirectoryReader getClass](self, "getClass"), "getSimpleName"));
  [(JavaLangStringBuilder *)v3 appendWithChar:40];
  segmentInfos = self->segmentInfos_;
  if (!segmentInfos) {
    goto LABEL_17;
  }
  id v5 = [(OrgApacheLuceneIndexSegmentInfos *)segmentInfos getSegmentsFileName];
  if (v5)
  {
    id v6 = [(JavaLangStringBuilder *)v3 appendWithNSString:v5];
    if (!v6) {
      goto LABEL_17;
    }
    id v7 = [v6 appendWithNSString:@":"];
    if (!v7) {
      goto LABEL_17;
    }
    objc_msgSend(v7, "appendWithLong:", -[OrgApacheLuceneIndexSegmentInfos getVersion](self->segmentInfos_, "getVersion"));
  }
  if (self->writer_) {
    [(JavaLangStringBuilder *)v3 appendWithNSString:@":nrt"];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(OrgApacheLuceneIndexBaseCompositeReader *)self getSequentialSubReaders];
  if (!v8) {
LABEL_17:
  }
    JreThrowNullPointerException();
  v9 = v8;
  id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v13);
        [(JavaLangStringBuilder *)v3 appendWithChar:32];
        [(JavaLangStringBuilder *)v3 appendWithId:v14];
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  [(JavaLangStringBuilder *)v3 appendWithChar:41];
  return [(JavaLangStringBuilder *)v3 description];
}

- (id)doOpenIfChanged
{
  return [(OrgApacheLuceneIndexStandardDirectoryReader *)self doOpenIfChangedWithOrgApacheLuceneIndexIndexCommit:0];
}

- (id)doOpenIfChangedWithOrgApacheLuceneIndexIndexCommit:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  if (self->writer_)
  {
    return sub_100117A50((uint64_t)self, (uint64_t)a3);
  }
  else
  {
    return sub_100117B18((uint64_t)self, a3);
  }
}

- (id)doOpenIfChangedWithOrgApacheLuceneIndexIndexWriter:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  if (self->writer_ == a3 && self->applyAllDeletes_ == v4)
  {
    return sub_100117A50((uint64_t)self, 0);
  }
  else
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    return [a3 getReaderWithBoolean:v4];
  }
}

- (id)doOpenFromWriterWithOrgApacheLuceneIndexIndexCommit:(id)a3
{
  return sub_100117A50((uint64_t)self, (uint64_t)a3);
}

- (id)doOpenNoWriterWithOrgApacheLuceneIndexIndexCommit:(id)a3
{
  return sub_100117B18((uint64_t)self, a3);
}

- (id)doOpenFromCommitWithOrgApacheLuceneIndexIndexCommit:(id)a3
{
  return sub_100117CB0(self, (uint64_t)a3);
}

- (id)doOpenIfChangedWithOrgApacheLuceneIndexSegmentInfos:(id)a3
{
  directory = self->super.directory_;
  id v5 = [(OrgApacheLuceneIndexBaseCompositeReader *)self getSequentialSubReaders];
  id v6 = new_JavaUtilHashMap_init();
  if (v5)
  {
    int v7 = [v5 size];
    if (v7 >= 1)
    {
      int v8 = v7;
      uint64_t v9 = 0;
      while (1)
      {
        id v10 = [v5 getWithInt:v9];
        objc_opt_class();
        if (!v10) {
          break;
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_50:
        }
          JreThrowClassCastException();
        -[JavaUtilHashMap putWithId:withId:](v6, "putWithId:withId:", [v10 getSegmentName], JavaLangInteger_valueOfWithInt_(v9));
        uint64_t v9 = (v9 + 1);
        if (v8 == v9) {
          goto LABEL_7;
        }
      }
LABEL_49:
      JreThrowNullPointerException();
    }
  }
LABEL_7:
  if (!a3) {
    goto LABEL_49;
  }
  v47 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", (int)[a3 size], OrgApacheLuceneIndexSegmentReader_class_());
  unsigned int v11 = [a3 size];
  uint64_t v12 = v11 - 1;
  if ((int)(v11 - 1) >= 0)
  {
    do
    {
      v13 = (id *)[a3 infoWithInt:v12];
      if (!v13) {
        goto LABEL_49;
      }
      uint64_t v14 = v13;
      v15 = v13[1];
      if (!v15) {
        goto LABEL_49;
      }
      id v16 = [(JavaUtilHashMap *)v6 getWithId:v15[1]];
      if (!v16) {
        goto LABEL_17;
      }
      if (!v5) {
        goto LABEL_49;
      }
      id v17 = objc_msgSend(v5, "getWithInt:", objc_msgSend(v16, "intValue"));
      objc_opt_class();
      if (!v17) {
        goto LABEL_17;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_50;
      }
      unsigned int v18 = [v14[1] getUseCompoundFile];
      long long v19 = (id *)[v17 getSegmentInfo];
      if (!v19) {
LABEL_51:
      }
        JreThrowNullPointerException();
      if (v18 == [v19[1] getUseCompoundFile])
      {
        id v22 = [v17 getSegmentInfo];
        if (!v22) {
          goto LABEL_51;
        }
        id v23 = [v22 getDelGen];
        if (v23 != [v14 getDelGen]) {
          goto LABEL_28;
        }
        id v24 = [v17 getSegmentInfo];
        if (!v24) {
          goto LABEL_51;
        }
        id v25 = [v24 getFieldInfosGen];
        if (v25 == [v14 getFieldInfosGen])
        {
          [v17 incRef];
          IOSObjectArray_Set((uint64_t)v47, v12, v17);
        }
        else
        {
LABEL_28:
          unsigned int v26 = [v14[1] maxDoc];
          v27 = (id *)[v17 getSegmentInfo];
          if (!v27) {
            JreThrowNullPointerException();
          }
          unsigned int v28 = [v27[1] maxDoc];
          if ([v14 hasDeletions]) {
            LOBYTE(v29) = 0;
          }
          else {
            unsigned int v29 = [v14 hasFieldUpdates] ^ 1;
          }
          if ([v14 getDelGen] == (id)-1)
          {
            id v38 = [v17 getSegmentInfo];
            if (!v38) {
              goto LABEL_52;
            }
            BOOL v37 = [v38 getDelGen] != (id)-1;
          }
          else
          {
            BOOL v37 = 0;
          }
          if (v26 == v28) {
            char v39 = v29;
          }
          else {
            char v39 = 1;
          }
          if ((v39 & 1) != 0 || v37)
          {
            CFStringRef v45 = JreStrcat("$$$", v30, v31, v32, v33, v34, v35, v36, @"same segment ");
            v46 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v45);
            objc_exception_throw(v46);
          }
          id v40 = [v17 getSegmentInfo];
          if (!v40) {
LABEL_52:
          }
            JreThrowNullPointerException();
          id v41 = [v40 getDelGen];
          if (v41 == [v14 getDelGen]) {
            v42 = new_OrgApacheLuceneIndexSegmentReader_initWithOrgApacheLuceneIndexSegmentCommitInfo_withOrgApacheLuceneIndexSegmentReader_withOrgApacheLuceneUtilBits_withInt_(v14, (uint64_t)v17, [v17 getLiveDocs], (int)objc_msgSend(v17, "numDocs"));
          }
          else {
            v42 = new_OrgApacheLuceneIndexSegmentReader_initWithOrgApacheLuceneIndexSegmentCommitInfo_withOrgApacheLuceneIndexSegmentReader_(v14, (uint64_t)v17);
          }
          IOSObjectArray_SetAndConsume((uint64_t)v47, v12, v42);
        }
      }
      else
      {
LABEL_17:
        if ((atomic_load_explicit(OrgApacheLuceneStoreIOContext__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        v20 = new_OrgApacheLuceneIndexSegmentReader_initWithOrgApacheLuceneIndexSegmentCommitInfo_withOrgApacheLuceneStoreIOContext_(v14, (void *)OrgApacheLuceneStoreIOContext_READ_);
        IOSObjectArray_Set((uint64_t)v47, v12, v20);
      }
    }
    while (v12-- > 0);
  }
  v43 = [OrgApacheLuceneIndexStandardDirectoryReader alloc];
  OrgApacheLuceneIndexStandardDirectoryReader_initWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexLeafReaderArray_withOrgApacheLuceneIndexIndexWriter_withOrgApacheLuceneIndexSegmentInfos_withBoolean_((uint64_t)v43, directory, v47, 0, a3, 0);
  return v43;
}

- (int64_t)getVersion
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  segmentInfos = self->segmentInfos_;
  if (!segmentInfos) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexSegmentInfos *)segmentInfos getVersion];
}

- (BOOL)isCurrent
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  writer = self->writer_;
  if (writer && ![(OrgApacheLuceneIndexIndexWriter *)writer isClosed])
  {
    int v8 = self->writer_;
    segmentInfos = self->segmentInfos_;
    return [(OrgApacheLuceneIndexIndexWriter *)v8 nrtIsCurrentWithOrgApacheLuceneIndexSegmentInfos:segmentInfos];
  }
  else
  {
    id LatestCommitWithOrgApacheLuceneStoreDirectory = OrgApacheLuceneIndexSegmentInfos_readLatestCommitWithOrgApacheLuceneStoreDirectory_(self->super.directory_);
    if (!LatestCommitWithOrgApacheLuceneStoreDirectory
      || (id v5 = [LatestCommitWithOrgApacheLuceneStoreDirectory getVersion],
          (id v6 = self->segmentInfos_) == 0))
    {
      JreThrowNullPointerException();
    }
    return v5 == (id)[(OrgApacheLuceneIndexSegmentInfos *)v6 getVersion];
  }
}

- (void)doClose
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(OrgApacheLuceneIndexBaseCompositeReader *)self getSequentialSubReaders];
  if (!v3) {
    JreThrowNullPointerException();
  }
  BOOL v4 = v3;
  id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      int v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        if (!v8) {
          JreThrowNullPointerException();
        }
        [v8 decRef];
        int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v9 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v5 = v9;
    }
    while (v9);
  }
  writer = self->writer_;
  if (writer) {
    [(OrgApacheLuceneIndexIndexWriter *)writer decRefDeleterWithOrgApacheLuceneIndexSegmentInfos:self->segmentInfos_];
  }
  OrgApacheLuceneUtilIOUtils_reThrowWithJavaLangThrowable_(0);
}

- (id)getIndexCommit
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  segmentInfos = self->segmentInfos_;
  directory = self->super.directory_;
  id v5 = [OrgApacheLuceneIndexStandardDirectoryReader_ReaderCommit alloc];
  OrgApacheLuceneIndexStandardDirectoryReader_ReaderCommit_initWithOrgApacheLuceneIndexStandardDirectoryReader_withOrgApacheLuceneIndexSegmentInfos_withOrgApacheLuceneStoreDirectory_((uint64_t)v5, self, segmentInfos, directory);
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexStandardDirectoryReader;
  [(OrgApacheLuceneIndexDirectoryReader *)&v3 dealloc];
}

@end