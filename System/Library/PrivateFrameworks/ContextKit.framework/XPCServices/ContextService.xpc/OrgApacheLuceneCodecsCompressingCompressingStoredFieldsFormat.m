@interface OrgApacheLuceneCodecsCompressingCompressingStoredFieldsFormat
- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsFormat)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsFormat)initWithNSString:(id)a3 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
- (id)description;
- (id)fieldsReaderWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneIndexFieldInfos:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6;
- (id)fieldsWriterWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingStoredFieldsFormat

- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsFormat)initWithNSString:(id)a3 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return self;
}

- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsFormat)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  return self;
}

- (id)fieldsReaderWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneIndexFieldInfos:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6
{
  v6 = new_OrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader_initWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexSegmentInfo_withNSString_withOrgApacheLuceneIndexFieldInfos_withOrgApacheLuceneStoreIOContext_withNSString_withOrgApacheLuceneCodecsCompressingCompressionMode_(a3, a4, self->segmentSuffix_, a5, (uint64_t)a6, self->formatName_, self->compressionMode_);
  return v6;
}

- (id)fieldsWriterWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  v5 = new_OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_initWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexSegmentInfo_withNSString_withOrgApacheLuceneStoreIOContext_withNSString_withOrgApacheLuceneCodecsCompressingCompressionMode_withInt_withInt_withInt_(a3, (void **)a4, self->segmentSuffix_, (uint64_t)a5, self->formatName_, self->compressionMode_, self->chunkSize_, self->maxDocsPerChunk_, self->blockSize_);
  return v5;
}

- (id)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneCodecsCompressingCompressingStoredFieldsFormat getClass](self, "getClass"), "getSimpleName");
  return (id)JreStrcat("$$@$I$I$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsFormat;
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsFormat *)&v3 dealloc];
}

@end