@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$8
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$8)initWithOrgApacheLuceneUtilPackedMonotonicBlockPackedReader:(id)a3 withOrgApacheLuceneUtilLongValues:(id)a4;
- (int)count;
- (int64_t)valueAtWithInt:(int)a3;
- (void)dealloc;
- (void)setDocumentWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$8

- (void)setDocumentWithInt:(int)a3
{
  v4 = self->val$ordIndex_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  self->startOffset_ = -[OrgApacheLuceneUtilLongValues getWithInt:](v4, "getWithInt:");
  self->endOffset_ = [(OrgApacheLuceneUtilPackedMonotonicBlockPackedReader *)self->val$ordIndex_ getWithLong:a3 + 1];
}

- (int64_t)valueAtWithInt:(int)a3
{
  if (!self->val$values_) {
    JreThrowNullPointerException();
  }
  int64_t v3 = self->startOffset_ + a3;
  v4 = self->val$values_;
  return (int64_t)[(OrgApacheLuceneUtilLongValues *)v4 getWithLong:v3];
}

- (int)count
{
  return LODWORD(self->endOffset_) - LODWORD(self->startOffset_);
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$8)initWithOrgApacheLuceneUtilPackedMonotonicBlockPackedReader:(id)a3 withOrgApacheLuceneUtilLongValues:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__8;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$8 *)&v3 dealloc];
}

@end