@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$11
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$11)initWithOrgApacheLuceneUtilLongValues:(id)a3 withIntArray:(id)a4 withLongArray:(id)a5 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_LongBinaryDocValues:(id)a6 withLong:(int64_t)a7;
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

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$11

- (void)setDocumentWithInt:(int)a3
{
  v4 = self->val$ordinals_;
  if (!v4
    || (int64_t v5 = [(OrgApacheLuceneUtilLongValues *)v4 getWithInt:*(void *)&a3],
        (v6 = self->val$offsets_) == 0))
  {
    JreThrowNullPointerException();
  }
  uint64_t v7 = v5;
  int64_t v8 = v5 << 32;
  uint64_t v9 = (int)v5;
  uint64_t size = v6->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)size <= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  int v11 = *(&v6->super.size_ + v9 + 1);
  self->startOffset_ = v11;
  self->offset_ = v11;
  v12 = self->val$offsets_;
  uint64_t v13 = v12->super.size_;
  uint64_t v14 = ((uint64_t)&_mh_execute_header + v8) >> 32;
  if ((uint64_t)&_mh_execute_header + v8 < 0 || (int)v13 <= (int)v14) {
    IOSArray_throwOutOfBoundsWithMsg(v13, ((uint64_t)&_mh_execute_header + v8) >> 32);
  }
  self->endOffset_ = *(&v12->super.size_ + v14 + 1);
}

- (int64_t)ordAtWithInt:(int)a3
{
  v3 = self->val$table_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  int startOffset = self->startOffset_;
  uint64_t size = v3->super.size_;
  int v6 = startOffset + a3;
  if (startOffset + a3 < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (startOffset + a3));
  }
  return v3->buffer_[v6];
}

- (int64_t)nextOrd
{
  uint64_t offset = self->offset_;
  if (offset == self->endOffset_) {
    return -1;
  }
  v4 = self->val$table_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  self->offset_ = offset + 1;
  uint64_t size = v4->super.size_;
  if ((offset & 0x80000000) != 0 || (int)offset >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, offset);
  }
  return v4->buffer_[offset];
}

- (int)cardinality
{
  return self->endOffset_ - self->startOffset_;
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
    int64_t v5 = self->val$binary_;
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
    v7.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__11;
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
    v5.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__11;
    return [(OrgApacheLuceneIndexSortedSetDocValues *)&v5 termsEnum];
  }
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$11)initWithOrgApacheLuceneUtilLongValues:(id)a3 withIntArray:(id)a4 withLongArray:(id)a5 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_LongBinaryDocValues:(id)a6 withLong:(int64_t)a7
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__11;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$11 *)&v3 dealloc];
}

@end