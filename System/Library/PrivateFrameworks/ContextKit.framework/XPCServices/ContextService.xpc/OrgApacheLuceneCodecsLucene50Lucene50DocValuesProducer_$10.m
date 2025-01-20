@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$10
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$10)initWithOrgApacheLuceneUtilLongValues:(id)a3 withOrgApacheLuceneUtilPackedMonotonicBlockPackedReader:(id)a4 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_LongBinaryDocValues:(id)a5 withLong:(int64_t)a6;
- (id)lookupOrdWithLong:(int64_t)a3;
- (id)termsEnum;
- (int)cardinality;
- (int64_t)getValueCount;
- (int64_t)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (int64_t)nextOrd;
- (int64_t)ordAtWithInt:(int)a3;
- (void)dealloc;
- (void)setDocumentWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$10

- (int64_t)nextOrd
{
  if (self->offset_ == self->endOffset_) {
    return -1;
  }
  v4 = self->val$ordinals_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  int64_t result = (int64_t)-[OrgApacheLuceneUtilLongValues getWithLong:](v4, "getWithLong:");
  ++self->offset_;
  return result;
}

- (void)setDocumentWithInt:(int)a3
{
  v4 = self->val$ordIndex_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  int64_t v6 = -[OrgApacheLuceneUtilLongValues getWithInt:](v4, "getWithInt:");
  self->offset_ = v6;
  self->startOffset_ = v6;
  self->endOffset_ = [(OrgApacheLuceneUtilPackedMonotonicBlockPackedReader *)self->val$ordIndex_ getWithLong:a3 + 1];
}

- (id)lookupOrdWithLong:(int64_t)a3
{
  v3 = self->val$binary_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_LongBinaryDocValues *)v3 getWithLong:a3];
}

- (int64_t)getValueCount
{
  return self->val$valueCount_;
}

- (int64_t)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = self->val$binary_;
    objc_opt_class();
    if (!v5) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    return (int64_t)[(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_LongBinaryDocValues *)v5 lookupTermWithOrgApacheLuceneUtilBytesRef:a3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__10;
    return [(OrgApacheLuceneIndexSortedSetDocValues *)&v7 lookupTermWithOrgApacheLuceneUtilBytesRef:a3];
  }
}

- (id)termsEnum
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = self->val$binary_;
    objc_opt_class();
    if (!v3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    return [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_LongBinaryDocValues *)v3 getTermsEnum];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__10;
    return [(OrgApacheLuceneIndexSortedSetDocValues *)&v5 termsEnum];
  }
}

- (int64_t)ordAtWithInt:(int)a3
{
  if (!self->val$ordinals_) {
    JreThrowNullPointerException();
  }
  int64_t v3 = self->startOffset_ + a3;
  v4 = self->val$ordinals_;
  return (int64_t)[(OrgApacheLuceneUtilLongValues *)v4 getWithLong:v3];
}

- (int)cardinality
{
  return LODWORD(self->endOffset_) - LODWORD(self->startOffset_);
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$10)initWithOrgApacheLuceneUtilLongValues:(id)a3 withOrgApacheLuceneUtilPackedMonotonicBlockPackedReader:(id)a4 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_LongBinaryDocValues:(id)a5 withLong:(int64_t)a6
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__10;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$10 *)&v3 dealloc];
}

@end