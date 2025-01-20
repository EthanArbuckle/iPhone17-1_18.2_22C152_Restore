@interface OrgApacheLuceneCodecsLucene50Lucene50CompoundReader
- (OrgApacheLuceneCodecsLucene50Lucene50CompoundReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (id)description;
- (id)listAll;
- (id)obtainLockWithNSString:(id)a3;
- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4;
- (id)readEntriesWithByteArray:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withNSString:(id)a5;
- (int64_t)fileLengthWithNSString:(id)a3;
- (void)close;
- (void)dealloc;
- (void)deleteFileWithNSString:(id)a3;
- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4;
- (void)syncWithJavaUtilCollection:(id)a3;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50CompoundReader

- (OrgApacheLuceneCodecsLucene50Lucene50CompoundReader)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  return self;
}

- (id)readEntriesWithByteArray:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withNSString:(id)a5
{
  return sub_10013E84C((uint64_t)self, (uint64_t)a3, a4, (uint64_t)a5);
}

- (void)close
{
  handle = self->handle_;
  v2 = +[IOSObjectArray arrayWithObjects:&handle count:1 type:JavaIoCloseable_class_()];
  OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v2);
}

- (id)openInputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  [(OrgApacheLuceneStoreDirectory *)self ensureOpen];
  id v6 = OrgApacheLuceneIndexIndexFileNames_stripSegmentNameWithNSString_(a3);
  entries = self->entries_;
  if (!entries) {
    goto LABEL_7;
  }
  v8 = [(JavaUtilMap *)entries getWithId:v6];
  if (!v8)
  {
    [(JavaUtilMap *)self->entries_ keySet];
    CFStringRef v20 = JreStrcat("$$$$$@C", v13, v14, v15, v16, v17, v18, v19, @"No sub-file with id ");
    v21 = new_JavaIoFileNotFoundException_initWithNSString_((uint64_t)v20);
    objc_exception_throw(v21);
  }
  if (!self->handle_) {
LABEL_7:
  }
    JreThrowNullPointerException();
  uint64_t v9 = v8[1];
  uint64_t v10 = v8[2];
  handle = self->handle_;
  return [(OrgApacheLuceneStoreIndexInput *)handle sliceWithNSString:a3 withLong:v9 withLong:v10];
}

- (id)listAll
{
  [(OrgApacheLuceneStoreDirectory *)self ensureOpen];
  entries = self->entries_;
  if (!entries
    || (id v4 = [(JavaUtilMap *)entries keySet]) == 0
    || (v5 = (int *)objc_msgSend(v4, "toArrayWithNSObjectArray:", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", (int)-[JavaUtilMap size](self->entries_, "size"), NSString_class_()))) == 0)
  {
    JreThrowNullPointerException();
  }
  uint64_t v13 = v5;
  if (v5[2] >= 1)
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = (__CFString *)JreStrcat("$$", v6, v7, v8, v9, v10, v11, v12, self->segmentName_);
      IOSObjectArray_Set((uint64_t)v13, v14++, v15);
    }
    while (v14 < v13[2]);
  }
  return v13;
}

- (void)deleteFileWithNSString:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (void)renameFileWithNSString:(id)a3 withNSString:(id)a4
{
  id v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (int64_t)fileLengthWithNSString:(id)a3
{
  [(OrgApacheLuceneStoreDirectory *)self ensureOpen];
  entries = self->entries_;
  if (!entries) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = [(JavaUtilMap *)entries getWithId:OrgApacheLuceneIndexIndexFileNames_stripSegmentNameWithNSString_(a3)];
  if (!v6)
  {
    uint64_t v8 = new_JavaIoFileNotFoundException_initWithNSString_((uint64_t)a3);
    objc_exception_throw(v8);
  }
  return v6[2];
}

- (id)createOutputWithNSString:(id)a3 withOrgApacheLuceneStoreIOContext:(id)a4
{
  id v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (void)syncWithJavaUtilCollection:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (id)obtainLockWithNSString:(id)a3
{
  v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (id)description
{
  return (id)JreStrcat("$$$@C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"CompoundFileDirectory(segment=\"");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50CompoundReader;
  [(OrgApacheLuceneCodecsLucene50Lucene50CompoundReader *)&v3 dealloc];
}

@end