@interface OrgApacheLuceneCodecsFieldsProducer
- (OrgApacheLuceneCodecsFieldsProducer)init;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation OrgApacheLuceneCodecsFieldsProducer

- (OrgApacheLuceneCodecsFieldsProducer)init
{
  return self;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end