@interface OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsWriter
- (OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsWriter)initWithOrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat:(id)a3 withOrgApacheLuceneIndexSegmentWriteState:(id)a4;
- (id)getInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (void)addBinaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4;
- (void)addNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4;
- (void)addSortedFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5;
- (void)addSortedNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5;
- (void)addSortedSetFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5 withJavaLangIterable:(id)a6;
- (void)close;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsWriter

- (OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsWriter)initWithOrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat:(id)a3 withOrgApacheLuceneIndexSegmentWriteState:(id)a4
{
  return self;
}

- (void)addNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4
{
  v6 = sub_1000942B4((uint64_t)self, a3);
  if (!v6) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneCodecsDocValuesConsumer *)v6 addNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:a4];
}

- (void)addBinaryFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4
{
  v6 = sub_1000942B4((uint64_t)self, a3);
  if (!v6) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneCodecsDocValuesConsumer *)v6 addBinaryFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:a4];
}

- (void)addSortedFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5
{
  v8 = sub_1000942B4((uint64_t)self, a3);
  if (!v8) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneCodecsDocValuesConsumer *)v8 addSortedFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:a4 withJavaLangIterable:a5];
}

- (void)addSortedNumericFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5
{
  v8 = sub_1000942B4((uint64_t)self, a3);
  if (!v8) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneCodecsDocValuesConsumer *)v8 addSortedNumericFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:a4 withJavaLangIterable:a5];
}

- (void)addSortedSetFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withJavaLangIterable:(id)a4 withJavaLangIterable:(id)a5 withJavaLangIterable:(id)a6
{
  v10 = sub_1000942B4((uint64_t)self, a3);
  if (!v10) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneCodecsDocValuesConsumer *)v10 addSortedSetFieldWithOrgApacheLuceneIndexFieldInfo:a3 withJavaLangIterable:a4 withJavaLangIterable:a5 withJavaLangIterable:a6];
}

- (id)getInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  return sub_1000942B4((uint64_t)self, a3);
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

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsWriter;
  [(OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsWriter *)&v3 dealloc];
}

@end