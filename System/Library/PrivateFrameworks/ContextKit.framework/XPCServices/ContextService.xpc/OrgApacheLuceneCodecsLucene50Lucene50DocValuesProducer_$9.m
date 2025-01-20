@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$9
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$9)initWithOrgApacheLuceneUtilLongValues:(id)a3 withIntArray:(id)a4 withLongArray:(id)a5;
- (int)count;
- (int64_t)valueAtWithInt:(int)a3;
- (void)dealloc;
- (void)setDocumentWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$9

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
  self->startOffset_ = *(&v6->super.size_ + v9 + 1);
  v11 = self->val$offsets_;
  uint64_t v12 = v11->super.size_;
  uint64_t v13 = ((uint64_t)&_mh_execute_header + v8) >> 32;
  if ((uint64_t)&_mh_execute_header + v8 < 0 || (int)v12 <= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(v12, ((uint64_t)&_mh_execute_header + v8) >> 32);
  }
  self->endOffset_ = *(&v11->super.size_ + v13 + 1);
}

- (int64_t)valueAtWithInt:(int)a3
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

- (int)count
{
  return self->endOffset_ - self->startOffset_;
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$9)initWithOrgApacheLuceneUtilLongValues:(id)a3 withIntArray:(id)a4 withLongArray:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__9;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$9 *)&v3 dealloc];
}

@end