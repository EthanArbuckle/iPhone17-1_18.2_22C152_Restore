@interface OrgApacheLuceneCodecsLucene50Lucene50LiveDocsFormat
- (OrgApacheLuceneCodecsLucene50Lucene50LiveDocsFormat)init;
- (id)newLiveDocsWithInt:(int)a3;
- (id)newLiveDocsWithOrgApacheLuceneUtilBits:(id)a3;
- (id)readLiveDocsWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
- (void)filesWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withJavaUtilCollection:(id)a4;
- (void)writeLiveDocsWithOrgApacheLuceneUtilMutableBits:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a5 withInt:(int)a6 withOrgApacheLuceneStoreIOContext:(id)a7;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50LiveDocsFormat

- (OrgApacheLuceneCodecsLucene50Lucene50LiveDocsFormat)init
{
  return self;
}

- (id)newLiveDocsWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = new_OrgApacheLuceneUtilFixedBitSet_initWithInt_(a3);
  [(OrgApacheLuceneUtilFixedBitSet *)v4 setWithInt:0 withInt:v3];
  return v4;
}

- (id)newLiveDocsWithOrgApacheLuceneUtilBits:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [a3 clone];
}

- (id)readLiveDocsWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  if (!a4
    || (id v8 = [a4 getDelGen], (v9 = *((void *)a4 + 1)) == 0)
    || (uint64_t v10 = (uint64_t)v8,
        v11 = OrgApacheLuceneIndexIndexFileNames_fileNameFromGenerationWithNSString_withNSString_withLong_(*(void **)(v9 + 8), @"liv", (uint64_t)v8), unsigned int v12 = [*((id *)a4 + 1) maxDoc], !a3))
  {
    JreThrowNullPointerException();
  }
  int v13 = v12;
  id v14 = [a3 openChecksumInputWithNSString:v11 withOrgApacheLuceneStoreIOContext:a5];
  id v15 = [*((id *)a4 + 1) getId];
  CFStringRef v16 = JavaLangLong_toStringWithLong_withInt_(v10, 36);
  OrgApacheLuceneCodecsCodecUtil_checkIndexHeaderWithOrgApacheLuceneStoreDataInput_withNSString_withInt_withInt_withByteArray_withNSString_(v14, @"Lucene50LiveDocs", 0, 0, (uint64_t)v15, (uint64_t)v16);
  v17 = +[IOSLongArray arrayWithLength:(int)OrgApacheLuceneUtilFixedBitSet_bits2wordsWithInt_(v13)];
  if (v17->super.size_ >= 1)
  {
    if (!v14) {
      JreThrowNullPointerException();
    }
    uint64_t v18 = 0;
    do
    {
      id v19 = [v14 readLong];
      uint64_t size = v17->super.size_;
      if (v18 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v18);
      }
      v17->buffer_[v18++] = (int64_t)v19;
    }
    while (v18 < v17->super.size_);
  }
  v21 = new_OrgApacheLuceneUtilFixedBitSet_initWithLongArray_withInt_(v17, v13);
  unsigned int v22 = [(OrgApacheLuceneUtilFixedBitSet *)v21 length];
  unsigned int v23 = [(OrgApacheLuceneUtilFixedBitSet *)v21 cardinality];
  if (v22 - v23 != [a4 getDelCount])
  {
    [(OrgApacheLuceneUtilFixedBitSet *)v21 length];
    [(OrgApacheLuceneUtilFixedBitSet *)v21 cardinality];
    [a4 getDelCount];
    v32 = (__CFString *)JreStrcat("$I$I", v25, v26, v27, v28, v29, v30, v31, @"bits.deleted=");
    v33 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v32, v14);
    objc_exception_throw(v33);
  }
  OrgApacheLuceneCodecsCodecUtil_checkFooterWithOrgApacheLuceneStoreChecksumIndexInput_withJavaLangThrowable_(v14, 0);
  if (v14) {
    [v14 close];
  }
  return v21;
}

- (void)writeLiveDocsWithOrgApacheLuceneUtilMutableBits:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a5 withInt:(int)a6 withOrgApacheLuceneStoreIOContext:(id)a7
{
  if (!a5) {
    goto LABEL_16;
  }
  id v12 = [a5 getNextDelGen];
  uint64_t v13 = *((void *)a5 + 1);
  if (!v13) {
    goto LABEL_16;
  }
  uint64_t v14 = (uint64_t)v12;
  id v15 = OrgApacheLuceneIndexIndexFileNames_fileNameFromGenerationWithNSString_withNSString_withLong_(*(void **)(v13 + 8), @"liv", (uint64_t)v12);
  objc_opt_class();
  if (!a3) {
    goto LABEL_16;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  unsigned int v16 = [a3 length];
  unsigned int v17 = v16 - [a3 cardinality];
  if (v17 != [a5 getDelCount] + a6)
  {
    [a3 length];
    [a3 cardinality];
    [a5 getDelCount];
    uint64_t v31 = (__CFString *)JreStrcat("$I$I$I", v24, v25, v26, v27, v28, v29, v30, @"bits.deleted=");
    v32 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withNSString_(v31, v15);
    objc_exception_throw(v32);
  }
  uint64_t v18 = (int *)[a3 getBits];
  if (!a4) {
LABEL_16:
  }
    JreThrowNullPointerException();
  id v19 = v18;
  id v20 = [a4 createOutputWithNSString:v15 withOrgApacheLuceneStoreIOContext:a7];
  id v21 = [*((id *)a5 + 1) getId];
  unsigned int v22 = (__CFString *)JavaLangLong_toStringWithLong_withInt_(v14, 36);
  OrgApacheLuceneCodecsCodecUtil_writeIndexHeaderWithOrgApacheLuceneStoreDataOutput_withNSString_withInt_withByteArray_withNSString_(v20, @"Lucene50LiveDocs", 0, (uint64_t)v21, v22);
  if (!v19) {
    goto LABEL_15;
  }
  if (v19[2] >= 1)
  {
    uint64_t v23 = 0;
    while (v20)
    {
      [v20 writeLongWithLong:*(void *)&v19[2 * v23++ + 4]];
      if (v23 >= v19[2]) {
        goto LABEL_12;
      }
    }
LABEL_15:
    JreThrowNullPointerException();
  }
LABEL_12:
  OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(v20);
  if (v20) {
    [v20 close];
  }
}

- (void)filesWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withJavaUtilCollection:(id)a4
{
  if (!a3) {
    goto LABEL_9;
  }
  if (![a3 hasDeletions]) {
    return;
  }
  if (!a4 || (uint64_t v6 = *((void *)a3 + 1)) == 0) {
LABEL_9:
  }
    JreThrowNullPointerException();
  v7 = OrgApacheLuceneIndexIndexFileNames_fileNameFromGenerationWithNSString_withNSString_withLong_(*(void **)(v6 + 8), @"liv", (uint64_t)[a3 getDelGen]);
  [a4 addWithId:v7];
}

@end