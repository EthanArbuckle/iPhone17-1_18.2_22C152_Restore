@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$12
- (BOOL)getWithInt:(int)a3;
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$12)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3 withInt:(int)a4;
- (int)length;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$12

- (BOOL)getWithInt:(int)a3
{
  v3 = self->val$in_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  return ([(OrgApacheLuceneStoreRandomAccessInput *)v3 readByteWithLong:(uint64_t)a3 >> 3] >> (a3 & 7)) & 1;
}

- (int)length
{
  return self->val$count_;
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$12)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3 withInt:(int)a4
{
  self->val$count_ = a4;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__12;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$12 *)&v3 dealloc];
}

@end