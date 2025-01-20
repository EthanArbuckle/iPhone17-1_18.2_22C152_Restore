@interface OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader
+ (void)initialize;
- (OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader)initWithOrgApacheLuceneCodecsPostingsReaderBase:(id)a3 withOrgApacheLuceneIndexSegmentReadState:(id)a4;
- (id)brToStringWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)description;
- (id)getChildResources;
- (id)iterator;
- (id)termsWithNSString:(id)a3;
- (int)size;
- (int64_t)ramBytesUsed;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)checkIntegrity;
- (void)close;
- (void)dealloc;
- (void)seekDirWithOrgApacheLuceneStoreIndexInput:(id)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader

- (OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader)initWithOrgApacheLuceneCodecsPostingsReaderBase:(id)a3 withOrgApacheLuceneIndexSegmentReadState:(id)a4
{
  return self;
}

- (void)seekDirWithOrgApacheLuceneStoreIndexInput:(id)a3 withLong:(int64_t)a4
{
}

- (void)close
{
  postingsReader = self->postingsReader_;
  v6[0] = self->termsIn_;
  v6[1] = postingsReader;
  v4 = +[IOSObjectArray arrayWithObjects:v6 count:2 type:JavaIoCloseable_class_()];
  OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v4);
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  [(JavaUtilTreeMap *)fields clear];
}

- (id)iterator
{
  fields = self->fields_;
  if (!fields
    || (v3 = JavaUtilCollections_unmodifiableSetWithJavaUtilSet_([(JavaUtilTreeMap *)fields keySet])) == 0)
  {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCollections_UnmodifiableCollection *)v3 iterator];
}

- (id)termsWithNSString:(id)a3
{
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilTreeMap *)fields getWithId:a3];
}

- (int)size
{
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilTreeMap *)fields size];
}

- (id)brToStringWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    return @"null";
  }
  id v3 = [a3 utf8ToString];
  return (id)JreStrcat("$C@", v4, v5, v6, v7, v8, v9, v10, v3);
}

- (int64_t)ramBytesUsed
{
  postingsReader = self->postingsReader_;
  if (!postingsReader
    || (uint64_t v4 = (char *)[(OrgApacheLuceneCodecsPostingsReaderBase *)postingsReader ramBytesUsed],
        long long v14 = 0u,
        long long v15 = 0u,
        long long v16 = 0u,
        long long v17 = 0u,
        (fields = self->fields_) == 0)
    || (id v6 = [(JavaUtilTreeMap *)fields values]) == 0)
  {
LABEL_13:
    JreThrowNullPointerException();
  }
  uint64_t v7 = v6;
  id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!v12) {
          goto LABEL_13;
        }
        uint64_t v4 = &v4[(void)[v12 ramBytesUsed]];
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return (int64_t)v4;
}

- (id)getChildResources
{
  id v3 = new_JavaUtilArrayList_init();
  [(JavaUtilArrayList *)v3 addAllWithJavaUtilCollection:OrgApacheLuceneUtilAccountables_namedAccountablesWithNSString_withJavaUtilMap_(@"field", self->fields_)];
  [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"delegate", self->postingsReader_, v4, v5, v6, v7, v8, v9)];
  return JavaUtilCollections_unmodifiableListWithJavaUtilList_(v3);
}

- (void)checkIntegrity
{
  OrgApacheLuceneCodecsCodecUtil_checksumEntireFileWithOrgApacheLuceneStoreIndexInput_(self->termsIn_);
  postingsReader = self->postingsReader_;
  if (!postingsReader) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneCodecsPostingsReaderBase *)postingsReader checkIntegrity];
}

- (id)description
{
  id v3 = objc_msgSend(-[OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader getClass](self, "getClass"), "getSimpleName");
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  [(JavaUtilTreeMap *)fields size];
  return (id)JreStrcat("$$I$@C", v5, v6, v7, v8, v9, v10, v11, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader;
  [(OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    Singleton = (void *)OrgApacheLuceneUtilFstByteSequenceOutputs_getSingleton();
    JreStrongAssign((id *)&OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_, Singleton);
    if (!OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_) {
      JreThrowNullPointerException();
    }
    JreStrongAssign((id *)&OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_NO_OUTPUT_, [(id)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_FST_OUTPUTS_ getNoOutput]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader__initialized);
  }
}

@end