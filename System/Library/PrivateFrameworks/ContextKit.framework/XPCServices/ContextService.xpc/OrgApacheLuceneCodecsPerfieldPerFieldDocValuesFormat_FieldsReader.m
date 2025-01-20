@interface OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader
- (OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader)initWithOrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat:(id)a3 withOrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader:(id)a4;
- (OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader)initWithOrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat:(id)a3 withOrgApacheLuceneIndexSegmentReadState:(id)a4;
- (id)description;
- (id)getBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getChildResources;
- (id)getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getMergeInstance;
- (id)getNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getSortedNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getSortedSetWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getSortedWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (int64_t)ramBytesUsed;
- (void)checkIntegrity;
- (void)close;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader

- (OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader)initWithOrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat:(id)a3 withOrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader:(id)a4
{
  return self;
}

- (OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader)initWithOrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat:(id)a3 withOrgApacheLuceneIndexSegmentReadState:(id)a4
{
  return self;
}

- (id)getNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  fields = self->fields_;
  if (!fields || !a3) {
    JreThrowNullPointerException();
  }
  id result = [(JavaUtilMap *)fields getWithId:*((void *)a3 + 1)];
  if (result)
  {
    return [result getNumericWithOrgApacheLuceneIndexFieldInfo:a3];
  }
  return result;
}

- (id)getBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  fields = self->fields_;
  if (!fields || !a3) {
    JreThrowNullPointerException();
  }
  id result = [(JavaUtilMap *)fields getWithId:*((void *)a3 + 1)];
  if (result)
  {
    return [result getBinaryWithOrgApacheLuceneIndexFieldInfo:a3];
  }
  return result;
}

- (id)getSortedWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  fields = self->fields_;
  if (!fields || !a3) {
    JreThrowNullPointerException();
  }
  id result = [(JavaUtilMap *)fields getWithId:*((void *)a3 + 1)];
  if (result)
  {
    return [result getSortedWithOrgApacheLuceneIndexFieldInfo:a3];
  }
  return result;
}

- (id)getSortedNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  fields = self->fields_;
  if (!fields || !a3) {
    JreThrowNullPointerException();
  }
  id result = [(JavaUtilMap *)fields getWithId:*((void *)a3 + 1)];
  if (result)
  {
    return [result getSortedNumericWithOrgApacheLuceneIndexFieldInfo:a3];
  }
  return result;
}

- (id)getSortedSetWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  fields = self->fields_;
  if (!fields || !a3) {
    JreThrowNullPointerException();
  }
  id result = [(JavaUtilMap *)fields getWithId:*((void *)a3 + 1)];
  if (result)
  {
    return [result getSortedSetWithOrgApacheLuceneIndexFieldInfo:a3];
  }
  return result;
}

- (id)getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  fields = self->fields_;
  if (!fields || !a3) {
    JreThrowNullPointerException();
  }
  id result = [(JavaUtilMap *)fields getWithId:*((void *)a3 + 1)];
  if (result)
  {
    return [result getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:a3];
  }
  return result;
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
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  formats = self->formats_;
  if (!formats || (id v3 = [(JavaUtilMap *)formats entrySet]) == 0) {
LABEL_14:
  }
    JreThrowNullPointerException();
  v4 = v3;
  id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  int64_t v7 = 0;
  uint64_t v8 = *(void *)v16;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if (!v10) {
        goto LABEL_14;
      }
      id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) getKey];
      if (!v11) {
        goto LABEL_14;
      }
      unsigned int v12 = [v11 length];
      id v13 = [v10 getValue];
      if (!v13) {
        goto LABEL_14;
      }
      v7 += (int64_t)[v13 ramBytesUsed] + (int)(2 * v12);
    }
    id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v6);
  return v7;
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
  v4 = v3;
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
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
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
  id v3 = self->this$0_;
  v4 = [OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader alloc];
  sub_100094864((id *)&v4->super.super.isa, v3, (uint64_t)self);
  return v4;
}

- (id)description
{
  formats = self->formats_;
  if (!formats) {
    JreThrowNullPointerException();
  }
  [(JavaUtilMap *)formats size];
  return (id)JreStrcat("$IC", v3, v4, v5, v6, v7, v8, v9, @"PerFieldDocValues(formats=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader;
  [(OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader *)&v3 dealloc];
}

@end