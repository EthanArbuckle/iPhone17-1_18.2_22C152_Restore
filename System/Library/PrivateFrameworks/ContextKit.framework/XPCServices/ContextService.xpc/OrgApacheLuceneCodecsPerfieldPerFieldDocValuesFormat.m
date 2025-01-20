@interface OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat
+ (id)getFullSegmentSuffixWithNSString:(id)a3 withNSString:(id)a4;
+ (id)getSuffixWithNSString:(id)a3 withNSString:(id)a4;
- (OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat)init;
- (id)fieldsConsumerWithOrgApacheLuceneIndexSegmentWriteState:(id)a3;
- (id)fieldsProducerWithOrgApacheLuceneIndexSegmentReadState:(id)a3;
@end

@implementation OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat

- (OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat)init
{
  return self;
}

- (id)fieldsConsumerWithOrgApacheLuceneIndexSegmentWriteState:(id)a3
{
  v5 = [OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsWriter alloc];
  sub_1000941CC((id *)&v5->super.super.isa, self, a3);
  return v5;
}

+ (id)getSuffixWithNSString:(id)a3 withNSString:(id)a4
{
  return (id)JreStrcat("$C$", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, a3);
}

+ (id)getFullSegmentSuffixWithNSString:(id)a3 withNSString:(id)a4
{
  return (id)OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_getFullSegmentSuffixWithNSString_withNSString_(a3, (uint64_t)a4);
}

- (id)fieldsProducerWithOrgApacheLuceneIndexSegmentReadState:(id)a3
{
  uint64_t v5 = [OrgApacheLuceneCodecsPerfieldPerFieldDocValuesFormat_FieldsReader alloc];
  sub_100094B20((id *)&v5->super.super.isa, self, (uint64_t)a3);
  return v5;
}

@end