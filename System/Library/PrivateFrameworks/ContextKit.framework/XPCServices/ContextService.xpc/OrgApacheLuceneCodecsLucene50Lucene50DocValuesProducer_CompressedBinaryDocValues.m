@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues)initWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a3 withOrgApacheLuceneUtilPackedMonotonicBlockPackedReader:(id)a4 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_ReverseTermsIndex:(id)a5 withOrgApacheLuceneStoreIndexInput:(id)a6;
- (id)getTermsEnum;
- (id)getTermsEnumWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (id)getWithLong:(int64_t)a3;
- (int64_t)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues)initWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a3 withOrgApacheLuceneUtilPackedMonotonicBlockPackedReader:(id)a4 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_ReverseTermsIndex:(id)a5 withOrgApacheLuceneStoreIndexInput:(id)a6
{
  return self;
}

- (id)getWithLong:(int64_t)a3
{
  termsEnum = self->termsEnum_;
  if (!termsEnum) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum *)termsEnum seekExactWithLong:a3];
  return [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum *)self->termsEnum_ term];
}

- (int64_t)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  termsEnum = self->termsEnum_;
  if (!termsEnum) {
    JreThrowNullPointerException();
  }
  unsigned int v5 = objc_msgSend(-[OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum seekCeilWithOrgApacheLuceneUtilBytesRef:](termsEnum, "seekCeilWithOrgApacheLuceneUtilBytesRef:", a3), "ordinal");
  if (v5 == 1) {
    return [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum *)self->termsEnum_ ord];
  }
  if (v5 == 2) {
    return ~(unint64_t)[(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum *)self->termsEnum_ ord];
  }
  return ~self->numValues_;
}

- (id)getTermsEnum
{
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  return sub_1000F1634((int *)self, [(OrgApacheLuceneStoreIndexInput *)data clone]);
}

- (id)getTermsEnumWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  return sub_1000F1634((int *)self, a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues *)&v3 dealloc];
}

@end