@interface OrgApacheLuceneCodecsLucene53AAPL53Codec
- (OrgApacheLuceneCodecsLucene53AAPL53Codec)init;
- (OrgApacheLuceneCodecsLucene53AAPL53Codec)initWithOrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum:(id)a3;
- (id)compoundFormat;
- (id)docValuesFormat;
- (id)fieldInfosFormat;
- (id)getDocValuesFormatForFieldWithNSString:(id)a3;
- (id)getPostingsFormatForFieldWithNSString:(id)a3;
- (id)liveDocsFormat;
- (id)normsFormat;
- (id)postingsFormat;
- (id)segmentInfoFormat;
- (id)storedFieldsFormat;
- (id)termVectorsFormat;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene53AAPL53Codec

- (OrgApacheLuceneCodecsLucene53AAPL53Codec)init
{
  return self;
}

- (OrgApacheLuceneCodecsLucene53AAPL53Codec)initWithOrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum:(id)a3
{
  return self;
}

- (id)storedFieldsFormat
{
  return self->storedFieldsFormat_;
}

- (id)termVectorsFormat
{
  return self->vectorsFormat_;
}

- (id)postingsFormat
{
  return self->postingsFormat_;
}

- (id)fieldInfosFormat
{
  return self->fieldInfosFormat_;
}

- (id)segmentInfoFormat
{
  return self->segmentInfosFormat_;
}

- (id)liveDocsFormat
{
  return self->liveDocsFormat_;
}

- (id)compoundFormat
{
  return self->compoundFormat_;
}

- (id)getPostingsFormatForFieldWithNSString:(id)a3
{
  return self->defaultFormat_;
}

- (id)getDocValuesFormatForFieldWithNSString:(id)a3
{
  return self->defaultDVFormat_;
}

- (id)docValuesFormat
{
  return self->docValuesFormat_;
}

- (id)normsFormat
{
  return self->normsFormat_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene53AAPL53Codec;
  [(OrgApacheLuceneCodecsCodec *)&v3 dealloc];
}

@end