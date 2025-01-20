@interface OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly
- (OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly)init;
- (OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly)initWithInt:(int)a3 withInt:(int)a4;
- (id)description;
- (id)fieldsConsumerWithOrgApacheLuceneIndexSegmentWriteState:(id)a3;
- (id)fieldsProducerWithOrgApacheLuceneIndexSegmentReadState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly

- (OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly)init
{
  self->minTermBlockSize_ = 25;
  self->maxTermBlockSize_ = 48;
  return self;
}

- (OrgApacheLuceneCodecsLucene50AAPL50PostingsFormatReadOnly)initWithInt:(int)a3 withInt:(int)a4
{
  self->minTermBlockSize_ = a3;
  self->maxTermBlockSize_ = a4;
  return self;
}

- (id)description
{
  id v2 = [(OrgApacheLuceneCodecsPostingsFormat *)self getName];
  return (id)JreStrcat("$$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (id)fieldsConsumerWithOrgApacheLuceneIndexSegmentWriteState:(id)a3
{
  uint64_t v3 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"Read-only");
  objc_exception_throw(v3);
}

- (id)fieldsProducerWithOrgApacheLuceneIndexSegmentReadState:(id)a3
{
  uint64_t v4 = new_OrgApacheLuceneCodecsLucene50AAPL50PostingsReader_initWithOrgApacheLuceneIndexSegmentReadState_((uint64_t)a3);
  return new_OrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader_initWithOrgApacheLuceneCodecsPostingsReaderBase_withOrgApacheLuceneIndexSegmentReadState_(v4, (uint64_t)a3);
}

@end