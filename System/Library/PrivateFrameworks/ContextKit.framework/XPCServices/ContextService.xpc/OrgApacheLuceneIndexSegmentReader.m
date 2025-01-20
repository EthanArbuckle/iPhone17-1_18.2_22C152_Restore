@interface OrgApacheLuceneIndexSegmentReader
- (OrgApacheLuceneIndexSegmentReader)initWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneIndexSegmentReader:(id)a4;
- (OrgApacheLuceneIndexSegmentReader)initWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneIndexSegmentReader:(id)a4 withOrgApacheLuceneUtilBits:(id)a5 withInt:(int)a6;
- (OrgApacheLuceneIndexSegmentReader)initWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (id)description;
- (id)directory;
- (id)getCoreCacheKey;
- (id)getDocValuesReader;
- (id)getFieldInfos;
- (id)getFieldsReader;
- (id)getLiveDocs;
- (id)getNormsReader;
- (id)getPostingsReader;
- (id)getSegmentInfo;
- (id)getSegmentName;
- (id)getTermVectorsReader;
- (int)maxDoc;
- (int)numDocs;
- (void)addCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3;
- (void)dealloc;
- (void)doClose;
- (void)removeCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3;
@end

@implementation OrgApacheLuceneIndexSegmentReader

- (OrgApacheLuceneIndexSegmentReader)initWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  return self;
}

- (OrgApacheLuceneIndexSegmentReader)initWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneIndexSegmentReader:(id)a4
{
  return self;
}

- (OrgApacheLuceneIndexSegmentReader)initWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneIndexSegmentReader:(id)a4 withOrgApacheLuceneUtilBits:(id)a5 withInt:(int)a6
{
  return self;
}

- (id)getLiveDocs
{
  return self->liveDocs_;
}

- (void)doClose
{
  core = self->core_;
  if (!core) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexSegmentCoreReaders *)core decRef];
  v8.receiver = self;
  v8.super_class = (Class)OrgApacheLuceneIndexSegmentReader;
  [(OrgApacheLuceneIndexCodecReader *)&v8 doClose];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    segDocValues = self->segDocValues_;
    if (segDocValues)
    {
      docValuesProducer = self->docValuesProducer_;
      objc_opt_class();
      if (docValuesProducer)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        isa = (JavaUtilCollections_SingletonList *)docValuesProducer[3].super.isa;
        goto LABEL_10;
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!self->docValuesProducer_) {
    return;
  }
  segDocValues = self->segDocValues_;
  if (!segDocValues) {
    goto LABEL_13;
  }
  v7 = JavaLangLong_valueOfWithLong_(-1);
  isa = JavaUtilCollections_singletonListWithId_(v7);
LABEL_10:
  [(OrgApacheLuceneIndexSegmentDocValues *)segDocValues decRefWithJavaUtilList:isa];
}

- (id)getFieldInfos
{
  return self->fieldInfos_;
}

- (int)numDocs
{
  return self->numDocs_;
}

- (int)maxDoc
{
  si = self->si_;
  if (!si || (info = si->info_) == 0) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexSegmentInfo *)info maxDoc];
}

- (id)getTermVectorsReader
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  core = self->core_;
  if (!core || (termVectorsLocal = core->termVectorsLocal_) == 0) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilCloseableThreadLocal *)termVectorsLocal get];
}

- (id)getFieldsReader
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  core = self->core_;
  if (!core || (fieldsReaderLocal = core->fieldsReaderLocal_) == 0) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilCloseableThreadLocal *)fieldsReaderLocal get];
}

- (id)getNormsReader
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  core = self->core_;
  if (!core) {
    JreThrowNullPointerException();
  }
  return core->normsProducer_;
}

- (id)getDocValuesReader
{
  return self->docValuesProducer_;
}

- (id)getPostingsReader
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  core = self->core_;
  if (!core) {
    JreThrowNullPointerException();
  }
  return core->fields_;
}

- (id)description
{
  si = self->si_;
  if (!si || (info = si->info_) == 0) {
    JreThrowNullPointerException();
  }
  unsigned int v5 = [(OrgApacheLuceneIndexSegmentInfo *)info maxDoc];
  int numDocs = self->numDocs_;
  uint64_t v7 = v5 - (numDocs + [(OrgApacheLuceneIndexSegmentCommitInfo *)self->si_ getDelCount]);
  return [(OrgApacheLuceneIndexSegmentCommitInfo *)si toStringWithInt:v7];
}

- (id)getSegmentName
{
  si = self->si_;
  if (!si || (info = si->info_) == 0) {
    JreThrowNullPointerException();
  }
  return info->name_;
}

- (id)getSegmentInfo
{
  return self->si_;
}

- (id)directory
{
  si = self->si_;
  if (!si || (info = si->info_) == 0) {
    JreThrowNullPointerException();
  }
  return info->dir_;
}

- (id)getCoreCacheKey
{
  return self->core_;
}

- (void)addCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  core = self->core_;
  if (!core) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexSegmentCoreReaders *)core addCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:a3];
}

- (void)removeCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:(id)a3
{
  [(OrgApacheLuceneIndexIndexReader *)self ensureOpen];
  core = self->core_;
  if (!core) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexSegmentCoreReaders *)core removeCoreClosedListenerWithOrgApacheLuceneIndexLeafReader_CoreClosedListener:a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentReader;
  [(OrgApacheLuceneIndexCodecReader *)&v3 dealloc];
}

@end