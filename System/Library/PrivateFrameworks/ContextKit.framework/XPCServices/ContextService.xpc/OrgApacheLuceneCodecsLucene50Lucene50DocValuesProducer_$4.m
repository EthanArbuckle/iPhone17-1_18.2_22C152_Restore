@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$4
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$4)initWithLongArray:(id)a3 withOrgApacheLuceneUtilLongValues:(id)a4;
- (int64_t)getWithLong:(int64_t)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$4

- (int64_t)getWithLong:(int64_t)a3
{
  v3 = self->val$table_;
  if (!v3 || (v4 = self->val$ords_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = (uint64_t)[(OrgApacheLuceneUtilLongValues *)v4 getWithLong:a3];
  uint64_t size = v3->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return v3->buffer_[(int)v5];
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$4)initWithLongArray:(id)a3 withOrgApacheLuceneUtilLongValues:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__4;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$4 *)&v3 dealloc];
}

@end