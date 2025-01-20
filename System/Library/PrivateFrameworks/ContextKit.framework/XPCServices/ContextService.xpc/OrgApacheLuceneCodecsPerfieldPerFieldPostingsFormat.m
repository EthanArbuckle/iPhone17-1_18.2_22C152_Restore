@interface OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat
+ (id)getFullSegmentSuffixWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5;
+ (id)getSuffixWithNSString:(id)a3 withNSString:(id)a4;
- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat)init;
- (id)fieldsConsumerWithOrgApacheLuceneIndexSegmentWriteState:(id)a3;
- (id)fieldsProducerWithOrgApacheLuceneIndexSegmentReadState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat

- (OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat)init
{
  return self;
}

+ (id)getSuffixWithNSString:(id)a3 withNSString:(id)a4
{
  return (id)JreStrcat("$C$", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, a3);
}

+ (id)getFullSegmentSuffixWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5
{
  return (id)OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_getFullSegmentSuffixWithNSString_withNSString_withNSString_((uint64_t)a3, a4, (uint64_t)a5);
}

- (id)fieldsConsumerWithOrgApacheLuceneIndexSegmentWriteState:(id)a3
{
  uint64_t v5 = [OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsWriter alloc];
  sub_1000CF824((id *)&v5->super.super.isa, self, a3);
  return v5;
}

- (id)fieldsProducerWithOrgApacheLuceneIndexSegmentReadState:(id)a3
{
  uint64_t v4 = [OrgApacheLuceneCodecsPerfieldPerFieldPostingsFormat_FieldsReader alloc];
  sub_1000D02DC((id *)&v4->super.super.super.isa, (uint64_t)a3);
  return v4;
}

@end