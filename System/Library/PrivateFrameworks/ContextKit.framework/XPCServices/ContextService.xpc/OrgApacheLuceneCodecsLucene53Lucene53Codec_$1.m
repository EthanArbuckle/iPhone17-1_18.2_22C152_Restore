@interface OrgApacheLuceneCodecsLucene53Lucene53Codec_$1
- (OrgApacheLuceneCodecsLucene53Lucene53Codec_$1)initWithOrgApacheLuceneCodecsLucene53Lucene53Codec:(id)a3;
- (id)getPostingsFormatForFieldWithNSString:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene53Lucene53Codec_$1

- (id)getPostingsFormatForFieldWithNSString:(id)a3
{
  return [(OrgApacheLuceneCodecsLucene53Lucene53Codec *)self->this$0_ getPostingsFormatForFieldWithNSString:a3];
}

- (OrgApacheLuceneCodecsLucene53Lucene53Codec_$1)initWithOrgApacheLuceneCodecsLucene53Lucene53Codec:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene53Lucene53Codec__1;
  [(OrgApacheLuceneCodecsPostingsFormat *)&v3 dealloc];
}

@end