@interface OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader
+ (void)initialize;
- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader)initWithOrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader:(id)a3;
- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader)initWithOrgApacheLuceneIndexSegmentReadState:(id)a3;
- (id)description;
- (id)getChildResources;
- (id)getMergeInstance;
- (id)iterator;
- (id)termsWithNSString:(id)a3;
- (int)size;
- (int64_t)ramBytesUsed;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)checkIntegrity;
- (void)close;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader

- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader)initWithOrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader:(id)a3
{
  return self;
}

- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader)initWithOrgApacheLuceneIndexSegmentReadState:(id)a3
{
  return self;
}

- (id)iterator
{
  fields = self->fields_;
  if (!fields
    || (v3 = JavaUtilCollections_unmodifiableSetWithJavaUtilSet_([(JavaUtilMap *)fields keySet])) == 0)
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
  id result = -[JavaUtilMap getWithId:](fields, "getWithId:");
  if (result)
  {
    return [result termsWithNSString:a3];
  }
  return result;
}

- (int)size
{
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilMap *)fields size];
}

- (void)close
{
  formats = self->formats_;
  if (!formats) {
    JreThrowNullPointerException();
  }
  id v3 = [(JavaUtilMap *)formats values];
  OrgApacheLuceneUtilIOUtils_closeWithJavaLangIterable_(v3);
}

- (int64_t)ramBytesUsed
{
  fields = self->fields_;
  if (!fields) {
    goto LABEL_18;
  }
  uint64_t v4 = qword_100560318;
  signed int v5 = [(JavaUtilMap *)fields size];
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  formats = self->formats_;
  }
  if (!formats) {
    goto LABEL_18;
  }
  int v7 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_;
  signed int v8 = [(JavaUtilMap *)formats size];
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  int v9 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [(JavaUtilMap *)self->formats_ entrySet];
  if (!v10) {
LABEL_18:
  }
    JreThrowNullPointerException();
  v11 = v10;
  int64_t v12 = v4 + 2 * (v7 * (uint64_t)v5 + v9 * (uint64_t)v8);
  id v13 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v16);
        if (!v17) {
          goto LABEL_18;
        }
        id v18 = [v17 getValue];
        if (!v18) {
          goto LABEL_18;
        }
        v12 += (int64_t)[v18 ramBytesUsed];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
  return v12;
}

- (id)getChildResources
{
  return OrgApacheLuceneUtilAccountables_namedAccountablesWithNSString_withJavaUtilMap_(@"format", self->formats_);
}

- (void)checkIntegrity
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  formats = self->formats_;
  if (!formats || (id v3 = [(JavaUtilMap *)formats values]) == 0) {
LABEL_12:
  }
    JreThrowNullPointerException();
  uint64_t v4 = v3;
  id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (!v9) {
          goto LABEL_12;
        }
        [v9 checkIntegrity];
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)getMergeInstance
{
  id v3 = [OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader alloc];
  sub_1000D0020((id *)&v3->super.super.super.isa, (uint64_t)self);
  return v3;
}

- (id)description
{
  if (!self->formats_) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)self->formats_ size];
  return (id)JreStrcat("$$$IC", v2, v3, v4, v5, v6, v7, v8, @"PerFieldPostings(segment=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader;
  [(OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = (void *)OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader_class_();
    qword_100560318 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader__initialized);
  }
}

@end