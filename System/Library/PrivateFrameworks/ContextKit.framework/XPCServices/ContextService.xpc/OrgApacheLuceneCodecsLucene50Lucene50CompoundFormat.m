@interface OrgApacheLuceneCodecsLucene50Lucene50CompoundFormat
- (OrgApacheLuceneCodecsLucene50Lucene50CompoundFormat)init;
- (id)getCompoundReaderWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
- (void)writeWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50CompoundFormat

- (OrgApacheLuceneCodecsLucene50Lucene50CompoundFormat)init
{
  return self;
}

- (id)getCompoundReaderWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  v5 = new_OrgApacheLuceneCodecsLucene50Lucene50CompoundReader_initWithOrgApacheLuceneStoreDirectory_withOrgApacheLuceneIndexSegmentInfo_withOrgApacheLuceneStoreIOContext_(a3, (void **)a4, (uint64_t)a5);
  return v5;
}

- (void)writeWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  if (!a4
    || (v8 = OrgApacheLuceneIndexIndexFileNames_segmentFileNameWithNSString_withNSString_withNSString_(*((void **)a4 + 1), &stru_10048C1F8, OrgApacheLuceneCodecsLucene50Lucene50CompoundFormat_DATA_EXTENSION_), v9 = OrgApacheLuceneIndexIndexFileNames_segmentFileNameWithNSString_withNSString_withNSString_(*((void **)a4 + 1), &stru_10048C1F8, OrgApacheLuceneCodecsLucene50Lucene50CompoundFormat_ENTRIES_EXTENSION_), !a3))
  {
    JreThrowNullPointerException();
  }
  v10 = v9;
  id v11 = [a3 createOutputWithNSString:v8 withOrgApacheLuceneStoreIOContext:a5];
  id v12 = [a3 createOutputWithNSString:v10 withOrgApacheLuceneStoreIOContext:a5];
  OrgApacheLuceneCodecsCodecUtil_writeIndexHeaderWithOrgApacheLuceneStoreDataOutput_withNSString_withInt_withByteArray_withNSString_(v11, OrgApacheLuceneCodecsLucene50Lucene50CompoundFormat_DATA_CODEC_, 0, (uint64_t)[a4 getId], &stru_10048C1F8);
  OrgApacheLuceneCodecsCodecUtil_writeIndexHeaderWithOrgApacheLuceneStoreDataOutput_withNSString_withInt_withByteArray_withNSString_(v12, OrgApacheLuceneCodecsLucene50Lucene50CompoundFormat_ENTRY_CODEC_, 0, (uint64_t)[a4 getId], &stru_10048C1F8);
  if (!v12 || (id v13 = [a4 files]) == 0) {
    JreThrowNullPointerException();
  }
  objc_msgSend(v12, "writeVIntWithInt:", objc_msgSend(v13, "size"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = [a4 files];
  id v15 = v14;
  if (!v14) {
    JreThrowNullPointerException();
  }
  id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  id obj = v15;
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        if (!v11) {
          JreThrowNullPointerException();
        }
        v19 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v18);
        v20 = [v11 getFilePointer];
        if ((atomic_load_explicit(OrgApacheLuceneStoreIOContext__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        id v21 = [a3 openInputWithNSString:v19 withOrgApacheLuceneStoreIOContext:OrgApacheLuceneStoreIOContext_READONCE_];
        v22 = v21;
        if (!v21) {
          JreThrowNullPointerException();
        }
        objc_msgSend(v11, "copyBytesWithOrgApacheLuceneStoreDataInput:withLong:", v21, objc_msgSend(v21, "length"));
        [v22 close];
        v23 = [v11 getFilePointer];
        [v12 writeStringWithNSString:OrgApacheLuceneIndexIndexFileNames_stripSegmentNameWithNSString_(v19)];
        [v12 writeLongWithLong:v20];
        [v12 writeLongWithLong:v23 - v20];
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v24 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      id v16 = v24;
    }
    while (v24);
  }
  OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(v11);
  OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(v12);
  [v12 close];
  if (v11) {
    [v11 close];
  }
}

@end