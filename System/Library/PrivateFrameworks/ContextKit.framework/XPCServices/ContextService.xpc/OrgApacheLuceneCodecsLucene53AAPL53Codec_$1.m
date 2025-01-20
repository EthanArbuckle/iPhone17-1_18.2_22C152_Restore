@interface OrgApacheLuceneCodecsLucene53AAPL53Codec_$1
- (OrgApacheLuceneCodecsLucene53AAPL53Codec_$1)initWithOrgApacheLuceneCodecsLucene53AAPL53Codec:(id)a3;
- (id)getPostingsFormatForFieldWithNSString:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene53AAPL53Codec_$1

- (id)getPostingsFormatForFieldWithNSString:(id)a3
{
  return [(OrgApacheLuceneCodecsLucene53AAPL53Codec *)self->this$0_ getPostingsFormatForFieldWithNSString:a3];
}

- (OrgApacheLuceneCodecsLucene53AAPL53Codec_$1)initWithOrgApacheLuceneCodecsLucene53AAPL53Codec:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene53AAPL53Codec__1;
  [(OrgApacheLuceneCodecsPostingsFormat *)&v3 dealloc];
}

@end