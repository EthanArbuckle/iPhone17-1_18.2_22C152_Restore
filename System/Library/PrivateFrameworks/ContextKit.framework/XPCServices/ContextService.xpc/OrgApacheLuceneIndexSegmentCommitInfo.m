@interface OrgApacheLuceneIndexSegmentCommitInfo
- (BOOL)hasDeletions;
- (BOOL)hasFieldUpdates;
- (OrgApacheLuceneIndexSegmentCommitInfo)initWithOrgApacheLuceneIndexSegmentInfo:(id)a3 withInt:(int)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withLong:(int64_t)a7;
- (id)clone;
- (id)description;
- (id)files;
- (id)getDocValuesUpdatesFiles;
- (id)getFieldInfosFiles;
- (id)toStringWithInt:(int)a3;
- (id)toStringWithOrgApacheLuceneStoreDirectory:(id)a3 withInt:(int)a4;
- (int)getDelCount;
- (int64_t)getBufferedDeletesGen;
- (int64_t)getDelGen;
- (int64_t)getDocValuesGen;
- (int64_t)getFieldInfosGen;
- (int64_t)getNextDelGen;
- (int64_t)getNextDocValuesGen;
- (int64_t)getNextFieldInfosGen;
- (int64_t)getNextWriteDelGen;
- (int64_t)getNextWriteDocValuesGen;
- (int64_t)getNextWriteFieldInfosGen;
- (int64_t)sizeInBytes;
- (void)advanceDelGen;
- (void)advanceDocValuesGen;
- (void)advanceFieldInfosGen;
- (void)advanceNextWriteDelGen;
- (void)advanceNextWriteDocValuesGen;
- (void)advanceNextWriteFieldInfosGen;
- (void)dealloc;
- (void)setBufferedDeletesGenWithLong:(int64_t)a3;
- (void)setDelCountWithInt:(int)a3;
- (void)setDocValuesUpdatesFilesWithJavaUtilMap:(id)a3;
- (void)setFieldInfosFilesWithJavaUtilSet:(id)a3;
- (void)setGenUpdatesFilesWithJavaUtilMap:(id)a3;
- (void)setNextWriteDelGenWithLong:(int64_t)a3;
- (void)setNextWriteDocValuesGenWithLong:(int64_t)a3;
- (void)setNextWriteFieldInfosGenWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneIndexSegmentCommitInfo

- (OrgApacheLuceneIndexSegmentCommitInfo)initWithOrgApacheLuceneIndexSegmentInfo:(id)a3 withInt:(int)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withLong:(int64_t)a7
{
  return self;
}

- (void)setGenUpdatesFilesWithJavaUtilMap:(id)a3
{
  genUpdatesFiles = self->genUpdatesFiles_;
  if (!genUpdatesFiles
    || ([(JavaUtilMap *)genUpdatesFiles clear], v28 = 0u, v29 = 0u, long long v26 = 0u, v27 = 0u, !a3)
    || (id v6 = [a3 entrySet]) == 0)
  {
LABEL_22:
    JreThrowNullPointerException();
  }
  v7 = v6;
  id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v12 = new_JavaUtilHashSet_init();
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        if (!v11) {
          goto LABEL_22;
        }
        v13 = v12;
        id v14 = [v11 getValue];
        if (!v14) {
          goto LABEL_22;
        }
        v15 = v14;
        id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v23;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v23 != v18) {
                objc_enumerationMutation(v15);
              }
              info = self->info_;
              if (!info) {
                goto LABEL_22;
              }
              [(JavaUtilHashSet *)v13 addWithId:[(OrgApacheLuceneIndexSegmentInfo *)info namedForThisSegmentWithNSString:*(void *)(*((void *)&v22 + 1) + 8 * (void)j)]];
            }
            id v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v17);
        }
        -[JavaUtilMap putWithId:withId:](self->genUpdatesFiles_, "putWithId:withId:", [v11 getKey], v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }
}

- (id)getDocValuesUpdatesFiles
{
  return JavaUtilCollections_unmodifiableMapWithJavaUtilMap_(self->dvUpdatesFiles_);
}

- (void)setDocValuesUpdatesFilesWithJavaUtilMap:(id)a3
{
  dvUpdatesFiles = self->dvUpdatesFiles_;
  if (!dvUpdatesFiles
    || ([(JavaUtilMap *)dvUpdatesFiles clear], v28 = 0u, v29 = 0u, long long v26 = 0u, v27 = 0u, !a3)
    || (id v6 = [a3 entrySet]) == 0)
  {
LABEL_22:
    JreThrowNullPointerException();
  }
  v7 = v6;
  id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v12 = new_JavaUtilHashSet_init();
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        if (!v11) {
          goto LABEL_22;
        }
        v13 = v12;
        id v14 = [v11 getValue];
        if (!v14) {
          goto LABEL_22;
        }
        v15 = v14;
        id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v23;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v23 != v18) {
                objc_enumerationMutation(v15);
              }
              info = self->info_;
              if (!info) {
                goto LABEL_22;
              }
              [(JavaUtilHashSet *)v13 addWithId:[(OrgApacheLuceneIndexSegmentInfo *)info namedForThisSegmentWithNSString:*(void *)(*((void *)&v22 + 1) + 8 * (void)j)]];
            }
            id v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v17);
        }
        -[JavaUtilMap putWithId:withId:](self->dvUpdatesFiles_, "putWithId:withId:", [v11 getKey], v13);
      }
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }
}

- (id)getFieldInfosFiles
{
  return JavaUtilCollections_unmodifiableSetWithJavaUtilSet_(self->fieldInfosFiles_);
}

- (void)setFieldInfosFilesWithJavaUtilSet:(id)a3
{
  fieldInfosFiles = self->fieldInfosFiles_;
  if (!fieldInfosFiles || ([(JavaUtilSet *)fieldInfosFiles clear], v13 = 0u, long long v14 = 0u, v11 = 0u, v12 = 0u, !a3)) {
LABEL_12:
  }
    JreThrowNullPointerException();
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        info = self->info_;
        if (!info) {
          goto LABEL_12;
        }
        -[JavaUtilSet addWithId:](self->fieldInfosFiles_, "addWithId:", -[OrgApacheLuceneIndexSegmentInfo namedForThisSegmentWithNSString:](info, "namedForThisSegmentWithNSString:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11));
      }
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)advanceDelGen
{
  int64_t nextWriteDelGen = self->nextWriteDelGen_;
  self->delGen_ = nextWriteDelGen;
  self->nextWriteDelGen_ = nextWriteDelGen + 1;
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&self->sizeInBytes_);
}

- (void)advanceNextWriteDelGen
{
}

- (int64_t)getNextWriteDelGen
{
  return self->nextWriteDelGen_;
}

- (void)setNextWriteDelGenWithLong:(int64_t)a3
{
  self->nextWriteDelGen_ = a3;
}

- (void)advanceFieldInfosGen
{
  int64_t nextWriteFieldInfosGen = self->nextWriteFieldInfosGen_;
  self->fieldInfosGen_ = nextWriteFieldInfosGen;
  self->nextWriteFieldInfosGen_ = nextWriteFieldInfosGen + 1;
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&self->sizeInBytes_);
}

- (void)advanceNextWriteFieldInfosGen
{
}

- (int64_t)getNextWriteFieldInfosGen
{
  return self->nextWriteFieldInfosGen_;
}

- (void)setNextWriteFieldInfosGenWithLong:(int64_t)a3
{
  self->nextWriteFieldInfosGen_ = a3;
}

- (void)advanceDocValuesGen
{
  int64_t nextWriteDocValuesGen = self->nextWriteDocValuesGen_;
  self->docValuesGen_ = nextWriteDocValuesGen;
  self->nextWriteDocValuesGen_ = nextWriteDocValuesGen + 1;
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&self->sizeInBytes_);
}

- (void)advanceNextWriteDocValuesGen
{
}

- (int64_t)getNextWriteDocValuesGen
{
  return self->nextWriteDocValuesGen_;
}

- (void)setNextWriteDocValuesGenWithLong:(int64_t)a3
{
  self->nextWriteDocValuesGen_ = a3;
}

- (int64_t)sizeInBytes
{
  p_sizeInBytes = &self->sizeInBytes_;
  unint64_t v3 = atomic_load((unint64_t *)&self->sizeInBytes_);
  if (v3 == -1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(OrgApacheLuceneIndexSegmentCommitInfo *)self files];
    if (!v5) {
LABEL_16:
    }
      JreThrowNullPointerException();
    id v6 = v5;
    id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          info = self->info_;
          if (!info) {
            goto LABEL_16;
          }
          dir = info->dir_;
          if (!dir) {
            goto LABEL_16;
          }
          v9 += (unint64_t)[(OrgApacheLuceneStoreDirectory *)dir fileLengthWithNSString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
    }
    atomic_store(v9, (unint64_t *)&self->sizeInBytes_);
  }
  return atomic_load((unint64_t *)p_sizeInBytes);
}

- (id)files
{
  info = self->info_;
  if (!info) {
    goto LABEL_23;
  }
  v4 = new_JavaUtilHashSet_initWithJavaUtilCollection_([(OrgApacheLuceneIndexSegmentInfo *)info files]);
  id v5 = [(OrgApacheLuceneIndexSegmentInfo *)self->info_ getCodec];
  if (!v5) {
    goto LABEL_23;
  }
  id v6 = [v5 liveDocsFormat];
  if (!v6) {
    goto LABEL_23;
  }
  [v6 filesWithOrgApacheLuceneIndexSegmentCommitInfo:self withJavaUtilCollection:v4];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  genUpdatesFiles = self->genUpdatesFiles_;
  if (!genUpdatesFiles) {
    goto LABEL_23;
  }
  id v8 = [(JavaUtilMap *)genUpdatesFiles values];
  if (!v8) {
    goto LABEL_23;
  }
  unint64_t v9 = v8;
  id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        [(JavaUtilAbstractCollection *)v4 addAllWithJavaUtilCollection:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  dvUpdatesFiles = self->dvUpdatesFiles_;
  if (!dvUpdatesFiles || (id v15 = [(JavaUtilMap *)dvUpdatesFiles values]) == 0) {
LABEL_23:
  }
    JreThrowNullPointerException();
  long long v16 = v15;
  id v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        [(JavaUtilAbstractCollection *)v4 addAllWithJavaUtilCollection:*(void *)(*((void *)&v22 + 1) + 8 * (void)j)];
      }
      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
  [(JavaUtilAbstractCollection *)v4 addAllWithJavaUtilCollection:self->fieldInfosFiles_];
  return v4;
}

- (int64_t)getBufferedDeletesGen
{
  return self->bufferedDeletesGen_;
}

- (void)setBufferedDeletesGenWithLong:(int64_t)a3
{
  self->bufferedDeletesGen_ = a3;
  atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&self->sizeInBytes_);
}

- (BOOL)hasDeletions
{
  return self->delGen_ != -1;
}

- (BOOL)hasFieldUpdates
{
  return self->fieldInfosGen_ != -1;
}

- (int64_t)getNextFieldInfosGen
{
  return self->nextWriteFieldInfosGen_;
}

- (int64_t)getFieldInfosGen
{
  return self->fieldInfosGen_;
}

- (int64_t)getNextDocValuesGen
{
  return self->nextWriteDocValuesGen_;
}

- (int64_t)getDocValuesGen
{
  return self->docValuesGen_;
}

- (int64_t)getNextDelGen
{
  return self->nextWriteDelGen_;
}

- (int64_t)getDelGen
{
  return self->delGen_;
}

- (int)getDelCount
{
  return self->delCount_;
}

- (void)setDelCountWithInt:(int)a3
{
  if (a3 < 0) {
    goto LABEL_5;
  }
  info = self->info_;
  if (!info) {
    goto LABEL_7;
  }
  if ([(OrgApacheLuceneIndexSegmentInfo *)info maxDoc] < a3)
  {
LABEL_5:
    id v6 = self->info_;
    if (v6)
    {
      [(OrgApacheLuceneIndexSegmentInfo *)v6 maxDoc];
      CFStringRef v14 = JreStrcat("$I$IC", v7, v8, v9, v10, v11, v12, v13, @"invalid delCount=");
      id v15 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v14);
      objc_exception_throw(v15);
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  self->delCount_ = a3;
}

- (id)toStringWithOrgApacheLuceneStoreDirectory:(id)a3 withInt:(int)a4
{
  return [(OrgApacheLuceneIndexSegmentCommitInfo *)self toStringWithInt:*(void *)&a4];
}

- (id)toStringWithInt:(int)a3
{
  info = self->info_;
  if (!info) {
    JreThrowNullPointerException();
  }
  uint64_t v12 = [(OrgApacheLuceneIndexSegmentInfo *)info toStringWithInt:(self->delCount_ + a3)];
  if (self->delGen_ != -1) {
    JreStrAppend(&v12, "$J", v5, v6, v7, v8, v9, v10, @":delGen=");
  }
  if (self->fieldInfosGen_ != -1) {
    JreStrAppend(&v12, "$J", v5, v6, v7, v8, v9, v10, @":fieldInfosGen=");
  }
  if (self->docValuesGen_ != -1) {
    JreStrAppend(&v12, "$J", v5, v6, v7, v8, v9, v10, @":dvGen=");
  }
  return v12;
}

- (id)description
{
  return [(OrgApacheLuceneIndexSegmentCommitInfo *)self toStringWithInt:0];
}

- (id)clone
{
  info = self->info_;
  int delCount = self->delCount_;
  int64_t delGen = self->delGen_;
  int64_t fieldInfosGen = self->fieldInfosGen_;
  int64_t docValuesGen = self->docValuesGen_;
  uint64_t v8 = [OrgApacheLuceneIndexSegmentCommitInfo alloc];
  OrgApacheLuceneIndexSegmentCommitInfo_initWithOrgApacheLuceneIndexSegmentInfo_withInt_withLong_withLong_withLong_((uint64_t)v8, info, delCount, delGen, fieldInfosGen, docValuesGen);
  uint64_t v9 = v8;
  v9->nextWriteDelGen_ = self->nextWriteDelGen_;
  v9->nextWriteFieldInfosGen_ = self->nextWriteFieldInfosGen_;
  v9->nextWriteDocValuesGen_ = self->nextWriteDocValuesGen_;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  genUpdatesFiles = self->genUpdatesFiles_;
  if (!genUpdatesFiles) {
    goto LABEL_23;
  }
  id v11 = [(JavaUtilMap *)genUpdatesFiles entrySet];
  if (!v11) {
    goto LABEL_23;
  }
  uint64_t v12 = v11;
  id v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (!v17) {
          goto LABEL_23;
        }
        -[JavaUtilMap putWithId:withId:](v9->genUpdatesFiles_, "putWithId:withId:", [*(id *)(*((void *)&v32 + 1) + 8 * i) getKey], new_JavaUtilHashSet_initWithJavaUtilCollection_(objc_msgSend(v17, "getValue")));
      }
      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v14);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  dvUpdatesFiles = self->dvUpdatesFiles_;
  if (!dvUpdatesFiles) {
    goto LABEL_23;
  }
  id v19 = [(JavaUtilMap *)dvUpdatesFiles entrySet];
  if (!v19) {
    goto LABEL_23;
  }
  v20 = v19;
  id v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        if (!v25) {
          goto LABEL_23;
        }
        -[JavaUtilMap putWithId:withId:](v9->dvUpdatesFiles_, "putWithId:withId:", [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) getKey], new_JavaUtilHashSet_initWithJavaUtilCollection_(objc_msgSend(v25, "getValue")));
      }
      id v22 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v22);
  }
  fieldInfosFiles = v9->fieldInfosFiles_;
  if (!fieldInfosFiles) {
LABEL_23:
  }
    JreThrowNullPointerException();
  [(JavaUtilSet *)fieldInfosFiles addAllWithJavaUtilCollection:self->fieldInfosFiles_];
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentCommitInfo;
  [(OrgApacheLuceneIndexSegmentCommitInfo *)&v3 dealloc];
}

@end