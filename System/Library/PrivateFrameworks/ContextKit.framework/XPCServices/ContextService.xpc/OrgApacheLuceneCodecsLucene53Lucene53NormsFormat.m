@interface OrgApacheLuceneCodecsLucene53Lucene53NormsFormat
- (OrgApacheLuceneCodecsLucene53Lucene53NormsFormat)init;
- (id)normsConsumerWithOrgApacheLuceneIndexSegmentWriteState:(id)a3;
- (id)normsProducerWithOrgApacheLuceneIndexSegmentReadState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsLucene53Lucene53NormsFormat

- (OrgApacheLuceneCodecsLucene53Lucene53NormsFormat)init
{
  return self;
}

- (id)normsConsumerWithOrgApacheLuceneIndexSegmentWriteState:(id)a3
{
  v3 = new_OrgApacheLuceneCodecsLucene53Lucene53NormsConsumer_initWithOrgApacheLuceneIndexSegmentWriteState_withNSString_withNSString_withNSString_withNSString_((uint64_t)a3, @"Lucene53NormsData", @"nvd", @"Lucene53NormsMetadata", @"nvm");
  return v3;
}

- (id)normsProducerWithOrgApacheLuceneIndexSegmentReadState:(id)a3
{
  State_withNSString_withNSString_withNSString_withNSString = new_OrgApacheLuceneCodecsLucene53Lucene53NormsProducer_initWithOrgApacheLuceneIndexSegmentReadState_withNSString_withNSString_withNSString_withNSString_((uint64_t)a3, @"Lucene53NormsData", @"nvd", @"Lucene53NormsMetadata", @"nvm");
  return State_withNSString_withNSString_withNSString_withNSString;
}

@end