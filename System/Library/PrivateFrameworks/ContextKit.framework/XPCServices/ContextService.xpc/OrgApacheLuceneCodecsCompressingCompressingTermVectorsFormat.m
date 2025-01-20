@interface OrgApacheLuceneCodecsCompressingCompressingTermVectorsFormat
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsFormat)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (id)description;
- (id)vectorsReaderWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneIndexFieldInfos:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6;
- (id)vectorsWriterWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingTermVectorsFormat

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsFormat)initWithNSString:(id)a3 withNSString:(id)a4 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  return self;
}

- (id)vectorsReaderWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneIndexFieldInfos:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6
{
  v6 = new_OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_initWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexSegmentInfo_withNSString_withOrgApacheLuceneIndexFieldInfos_withOrgApacheLuceneStoreIOContext_withNSString_withOrgApacheLuceneCodecsCompressingCompressionMode_(a3, a4, self->segmentSuffix_, a5, (uint64_t)a6, self->formatName_, self->compressionMode_);
  return v6;
}

- (id)vectorsWriterWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  v5 = new_OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_initWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexSegmentInfo_withNSString_withOrgApacheLuceneStoreIOContext_withNSString_withOrgApacheLuceneCodecsCompressingCompressionMode_withInt_withInt_(a3, (void **)a4, self->segmentSuffix_, (uint64_t)a5, self->formatName_, self->compressionMode_, self->chunkSize_, self->blockSize_);
  return v5;
}

- (id)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneCodecsCompressingCompressingTermVectorsFormat getClass](self, "getClass"), "getSimpleName");
  return (id)JreStrcat("$$@$I$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingTermVectorsFormat;
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsFormat *)&v3 dealloc];
}

@end