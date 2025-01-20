@interface OrgApacheLuceneCodecsLucene53Lucene53NormsProducer_$1
- (OrgApacheLuceneCodecsLucene53Lucene53NormsProducer_$1)initWithLong:(int64_t)a3;
- (int64_t)getWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsLucene53Lucene53NormsProducer_$1

- (int64_t)getWithInt:(int)a3
{
  return self->val$value_;
}

- (OrgApacheLuceneCodecsLucene53Lucene53NormsProducer_$1)initWithLong:(int64_t)a3
{
  self->val$value_ = a3;
  OrgApacheLuceneIndexNumericDocValues_init();
  return self;
}

@end