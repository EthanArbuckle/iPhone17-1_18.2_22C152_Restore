@interface OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter
+ (void)initialize;
+ (void)writeTLongWithOrgApacheLuceneStoreDataOutput:(id)a3 withLong:(int64_t)a4;
+ (void)writeZDoubleWithOrgApacheLuceneStoreDataOutput:(id)a3 withDouble:(double)a4;
+ (void)writeZFloatWithOrgApacheLuceneStoreDataOutput:(id)a3 withFloat:(float)a4;
- (BOOL)tooDirtyWithOrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader:(id)a3;
- (BOOL)triggerFlush;
- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6 withNSString:(id)a7 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11;
- (id)flush;
- (int)mergeWithOrgApacheLuceneIndexMergeState:(id)a3;
- (void)close;
- (void)dealloc;
- (void)finishDocument;
- (void)finishWithOrgApacheLuceneIndexFieldInfos:(id)a3 withInt:(int)a4;
- (void)writeFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexIndexableField:(id)a4;
- (void)writeHeaderWithInt:(int)a3 withInt:(int)a4 withIntArray:(id)a5 withIntArray:(id)a6 withBoolean:(BOOL)a7;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter

- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6 withNSString:(id)a7 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a8 withInt:(int)a9 withInt:(int)a10 withInt:(int)a11
{
  return self;
}

- (void)close
{
  p_fieldsStream = &self->fieldsStream_;
  p_indexWriter = &self->indexWriter_;
  indexWriter = self->indexWriter_;
  v6[0] = self->fieldsStream_;
  v6[1] = indexWriter;
  v5 = +[IOSObjectArray arrayWithObjects:v6 count:2 type:JavaIoCloseable_class_()];
  OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v5);
  JreStrongAssign((id *)p_fieldsStream, 0);
  JreStrongAssign((id *)p_indexWriter, 0);
}

- (void)finishDocument
{
  p_numStoredFields = &self->numStoredFields_;
  numStoredFields = self->numStoredFields_;
  if (!numStoredFields) {
    goto LABEL_16;
  }
  int numBufferedDocs = self->numBufferedDocs_;
  if (numBufferedDocs == numStoredFields->super.size_)
  {
    unsigned int v12 = OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(numBufferedDocs + 1, 4, v2, v3, v4, v5, v6, v7);
    v13 = JavaUtilArrays_copyOfWithIntArray_withInt_(*p_numStoredFields, v12);
    JreStrongAssign((id *)p_numStoredFields, v13);
    v14 = JavaUtilArrays_copyOfWithIntArray_withInt_(self->endOffsets_, v12);
    JreStrongAssign((id *)&self->endOffsets_, v14);
    numStoredFields = *p_numStoredFields;
    if (!*p_numStoredFields) {
      goto LABEL_16;
    }
  }
  int v15 = self->numBufferedDocs_;
  uint64_t size = numStoredFields->super.size_;
  if (v15 < 0 || v15 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v15);
  }
  *(&numStoredFields->super.size_ + v15 + 1) = self->numStoredFieldsInDoc_;
  self->numStoredFieldsInDoc_ = 0;
  bufferedDocs = self->bufferedDocs_;
  if (!bufferedDocs) {
    goto LABEL_16;
  }
  endOffsets = self->endOffsets_;
  if (!endOffsets) {
    goto LABEL_16;
  }
  int length = bufferedDocs->length_;
  int v20 = self->numBufferedDocs_;
  uint64_t v21 = endOffsets->super.size_;
  if (v20 < 0 || v20 >= (int)v21) {
    IOSArray_throwOutOfBoundsWithMsg(v21, v20);
  }
  *(&endOffsets->super.size_ + v20 + 1) = length;
  int v22 = self->numBufferedDocs_ + 1;
  self->numBufferedDocs_ = v22;
  v23 = self->bufferedDocs_;
  if (!v23) {
LABEL_16:
  }
    JreThrowNullPointerException();
  if (v23->length_ >= self->chunkSize_ || v22 >= self->maxDocsPerChunk_)
  {
    -[OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter flush]_0((uint64_t)self);
  }
}

- (id)flush
{
  v1 = *(void **)(a1 + 24);
  if (!v1) {
    goto LABEL_25;
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_25;
  }
  objc_msgSend(v1, "writeIndexWithInt:withLong:", *(unsigned int *)(a1 + 92), objc_msgSend(v3, "getFilePointer"));
  uint64_t v4 = *(void *)(a1 + 80);
  int v5 = *(_DWORD *)(a1 + 92);
  uint64_t v6 = (v5 - 1);
  if ((int)v6 >= 1)
  {
    uint64_t v7 = (v5 - 2);
    while (1)
    {
      uint64_t v8 = *(void *)(a1 + 80);
      if (!v8) {
        break;
      }
      uint64_t v9 = *(int *)(v8 + 8);
      if (v6 >= v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v6);
      }
      int v10 = *(_DWORD *)(v8 + 12 + 4 * v6);
      if ((int)v7 >= (int)v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v7);
      }
      if (!v4) {
        break;
      }
      uint64_t v11 = *(int *)(v4 + 8);
      if (v6 >= v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v6);
      }
      *(_DWORD *)(v4 + 12 + 4 * v6--) = v10 - *(_DWORD *)(*(void *)(a1 + 80) + 12 + 4 * v7--);
      if ((int)v6 <= 0) {
        goto LABEL_15;
      }
    }
LABEL_25:
    JreThrowNullPointerException();
  }
LABEL_15:
  uint64_t v12 = *(void *)(a1 + 64);
  if (!v12) {
    goto LABEL_25;
  }
  int v13 = *(_DWORD *)(v12 + 24);
  int v14 = *(_DWORD *)(a1 + 56);
  id result = sub_10010C9D8(a1, *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), *(void *)(a1 + 72), v4, v13 >= 2 * v14);
  if (v13 < 2 * v14)
  {
    int v20 = *(void **)(a1 + 40);
    if (!v20) {
      goto LABEL_25;
    }
    id result = [v20 compressWithByteArray:*(void *)(*(void *)(a1 + 64) + 16) withInt:0 withInt:*(unsigned int *)(*(void *)(a1 + 64) + 24) withOrgApacheLuceneStoreDataOutput:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 64);
    int v17 = *(_DWORD *)(v16 + 24);
    if (v17 >= 1)
    {
      uint64_t v18 = 0;
      do
      {
        v19 = *(void **)(a1 + 40);
        if (!v19) {
          goto LABEL_25;
        }
        id result = objc_msgSend(v19, "compressWithByteArray:withInt:withInt:withOrgApacheLuceneStoreDataOutput:", *(void *)(v16 + 16), v18, JavaLangMath_minWithInt_withInt_(*(unsigned int *)(a1 + 56), v17 - (int)v18), *(void *)(a1 + 32));
        uint64_t v18 = (*(_DWORD *)(a1 + 56) + v18);
        uint64_t v16 = *(void *)(a1 + 64);
        int v17 = *(_DWORD *)(v16 + 24);
      }
      while ((int)v18 < v17);
    }
  }
  *(_DWORD *)(a1 + 88) += *(_DWORD *)(a1 + 92);
  *(_DWORD *)(a1 + 92) = 0;
  *(_DWORD *)(*(void *)(a1 + 64) + 24) = 0;
  ++*(void *)(a1 + 96);
  return result;
}

- (void)writeHeaderWithInt:(int)a3 withInt:(int)a4 withIntArray:(id)a5 withIntArray:(id)a6 withBoolean:(BOOL)a7
{
}

- (BOOL)triggerFlush
{
  bufferedDocs = self->bufferedDocs_;
  if (!bufferedDocs) {
    JreThrowNullPointerException();
  }
  return bufferedDocs->length_ >= self->chunkSize_ || self->numBufferedDocs_ >= self->maxDocsPerChunk_;
}

- (void)writeFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneIndexIndexableField:(id)a4
{
  ++self->numStoredFieldsInDoc_;
  if (!a4) {
    goto LABEL_49;
  }
  id v7 = [a4 numericValue];
  if (!v7)
  {
    uint64_t v11 = [a4 binaryValue];
    if (v11)
    {
      uint64_t v9 = v11;
      uint64_t v8 = 0;
      uint64_t v10 = 1;
      goto LABEL_17;
    }
    id v12 = [a4 stringValue];
    if (v12)
    {
      uint64_t v8 = v12;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      goto LABEL_17;
    }
    [a4 name];
    CFStringRef v45 = JreStrcat("$$$", v38, v39, v40, v41, v42, v43, v44, @"field ");
LABEL_51:
    v46 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v45);
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 4;
          goto LABEL_17;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 3;
          goto LABEL_17;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = 5;
          goto LABEL_17;
        }
        [v7 getClass];
        CFStringRef v45 = JreStrcat("$@", v47, v48, v49, v50, v51, v52, v53, @"cannot store numeric type ");
        goto LABEL_51;
      }
    }
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 2;
LABEL_17:
  if (!a3) {
    goto LABEL_49;
  }
  bufferedDocs = self->bufferedDocs_;
  if (!bufferedDocs) {
    goto LABEL_49;
  }
  [(OrgApacheLuceneStoreDataOutput *)bufferedDocs writeVLongWithLong:((uint64_t)*((int *)a3 + 4) << OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_TYPE_BITS_) | v10];
  if (v9)
  {
    [(OrgApacheLuceneStoreDataOutput *)self->bufferedDocs_ writeVIntWithInt:*((unsigned int *)v9 + 5)];
    int v14 = self->bufferedDocs_;
    uint64_t v15 = v9[1];
    uint64_t v16 = *((unsigned int *)v9 + 4);
    uint64_t v17 = *((unsigned int *)v9 + 5);
    [(OrgApacheLuceneUtilGrowableByteArrayDataOutput *)v14 writeBytesWithByteArray:v15 withInt:v16 withInt:v17];
    return;
  }
  if (v8)
  {
    scratchBytes = (unsigned int *)self->scratchBytes_;
    unsigned int v19 = [v8 length];
    v26 = OrgApacheLuceneUtilArrayUtil_growWithByteArray_withInt_(scratchBytes, 3 * v19, v20, v21, v22, v23, v24, v25);
    JreStrongAssign((id *)&self->scratchBytes_, v26);
    uint64_t v27 = OrgApacheLuceneUtilUnicodeUtil_UTF16toUTF8WithJavaLangCharSequence_withInt_withInt_withByteArray_(v8, 0, (int)[v8 length], (uint64_t)self->scratchBytes_);
    [(OrgApacheLuceneStoreDataOutput *)self->bufferedDocs_ writeVIntWithInt:v27];
    v28 = self->bufferedDocs_;
    v29 = self->scratchBytes_;
    [(OrgApacheLuceneStoreDataOutput *)v28 writeBytesWithByteArray:v29 withInt:v27];
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (v7)
    {
      v30 = self->bufferedDocs_;
      id v31 = [v7 intValue];
      [(OrgApacheLuceneStoreDataOutput *)v30 writeZIntWithInt:v31];
      return;
    }
LABEL_49:
    JreThrowNullPointerException();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v7) {
      goto LABEL_49;
    }
    v32 = self->bufferedDocs_;
    id v33 = [v7 longLongValue];
    OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_writeTLongWithOrgApacheLuceneStoreDataOutput_withLong_(v32, (uint64_t)v33);
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v7) {
      goto LABEL_49;
    }
    v34 = self->bufferedDocs_;
    [v7 floatValue];
    OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_writeZFloatWithOrgApacheLuceneStoreDataOutput_withFloat_(v34, v35);
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v46 = new_JavaLangAssertionError_initWithId_(@"Cannot get here");
LABEL_52:
    objc_exception_throw(v46);
  }
  if (!v7) {
    goto LABEL_49;
  }
  v36 = self->bufferedDocs_;
  [v7 doubleValue];
  OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_writeZDoubleWithOrgApacheLuceneStoreDataOutput_withDouble_(v36, v37);
}

+ (void)writeZFloatWithOrgApacheLuceneStoreDataOutput:(id)a3 withFloat:(float)a4
{
}

+ (void)writeZDoubleWithOrgApacheLuceneStoreDataOutput:(id)a3 withDouble:(double)a4
{
}

+ (void)writeTLongWithOrgApacheLuceneStoreDataOutput:(id)a3 withLong:(int64_t)a4
{
}

- (void)finishWithOrgApacheLuceneIndexFieldInfos:(id)a3 withInt:(int)a4
{
  uint64_t v8 = *(void *)&a4;
  if (self->numBufferedDocs_ >= 1)
  {
    -[OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter flush]_0((uint64_t)self);
    ++self->numDirtyChunks_;
  }
  if (self->docBase_ != v8)
  {
    CFStringRef v13 = JreStrcat("$I$I", (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, @"Wrote ");
    int v14 = new_JavaLangRuntimeException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v14);
  }
  indexWriter = self->indexWriter_;
  if (!indexWriter || (fieldsStream = self->fieldsStream_) == 0) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter *)indexWriter finishWithInt:v8 withLong:[(OrgApacheLuceneStoreIndexOutput *)fieldsStream getFilePointer]];
  [(OrgApacheLuceneStoreDataOutput *)self->fieldsStream_ writeVLongWithLong:self->numChunks_];
  [(OrgApacheLuceneStoreDataOutput *)self->fieldsStream_ writeVLongWithLong:self->numDirtyChunks_];
  id v12 = self->fieldsStream_;
  OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(v12);
}

- (int)mergeWithOrgApacheLuceneIndexMergeState:(id)a3
{
  if (!a3 || (uint64_t v3 = a3, (v4 = *((void *)a3 + 12)) == 0)) {
LABEL_71:
  }
    JreThrowNullPointerException();
  uint64_t v66 = *(unsigned int *)(v4 + 8);
  v67 = new_OrgApacheLuceneCodecsCompressingMatchingReaders_initWithOrgApacheLuceneIndexMergeState_((uint64_t)a3);
  if ((int)v66 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = new_OrgApacheLuceneCodecsStoredFieldsWriter_MergeVisitor_initWithOrgApacheLuceneCodecsStoredFieldsWriter_withOrgApacheLuceneIndexMergeState_withInt_(self, (uint64_t)v3, v6);
      matchingReaders = v67->matchingReaders_;
      if (!matchingReaders) {
        goto LABEL_71;
      }
      uint64_t v10 = v8;
      uint64_t size = matchingReaders->super.size_;
      if (v6 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      if (!*((unsigned char *)&matchingReaders->super.size_ + v6 + 4)) {
        break;
      }
      uint64_t v12 = v3[3];
      if (!v12) {
        goto LABEL_71;
      }
      uint64_t v13 = *(int *)(v12 + 8);
      if (v6 >= v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v6);
      }
      int v14 = *(void **)(v12 + 24 + 8 * v6);
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
      }
LABEL_15:
      uint64_t v15 = v3[12];
      uint64_t v16 = *(int *)(v15 + 8);
      if (v6 >= v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v6);
      }
      uint64_t v17 = v3[8];
      if (!v17) {
        goto LABEL_71;
      }
      int v18 = *(_DWORD *)(v15 + 12 + 4 * v6);
      uint64_t v19 = *(int *)(v17 + 8);
      if (v6 >= v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v6);
      }
      uint64_t v20 = *(void **)(v17 + 24 + 8 * v6);
      if (v14
        && [v14 getVersion] == 1
        && OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_BULK_MERGE_ENABLED_)
      {
        if ([v14 getCompressionMode] == self->compressionMode_
          && [v14 getChunkSize] == self->chunkSize_
          && [v14 getPackedIntsVersion] == 2
          && !v20
          && ![(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter *)self tooDirtyWithOrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader:v14])
        {
          [v14 checkIntegrity];
          if (self->numBufferedDocs_ >= 1)
          {
            -[OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter flush]_0((uint64_t)self);
            ++self->numDirtyChunks_;
          }
          id v28 = [v14 getFieldsStream];
          id v29 = [v14 getIndexReader];
          if (!v28) {
            goto LABEL_71;
          }
          id v30 = v29;
          if (!v29) {
            goto LABEL_71;
          }
          objc_msgSend(v28, "seekWithLong:", objc_msgSend(v29, "getStartPointerWithInt:", 0));
          if (v18 >= 1)
          {
            v63 = v30;
            v64 = v3;
            int v31 = 0;
            v65 = v28;
            while ([v28 readVInt] == v31)
            {
              id v39 = [v28 readVInt];
              indexWriter = self->indexWriter_;
              if (!indexWriter) {
                goto LABEL_71;
              }
              id v41 = v39;
              fieldsStream = self->fieldsStream_;
              if (!fieldsStream) {
                goto LABEL_71;
              }
              [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter *)indexWriter writeIndexWithInt:v41 >> 1 withLong:[(OrgApacheLuceneStoreIndexOutput *)fieldsStream getFilePointer]];
              [(OrgApacheLuceneStoreDataOutput *)self->fieldsStream_ writeVIntWithInt:self->docBase_];
              [(OrgApacheLuceneStoreDataOutput *)self->fieldsStream_ writeVIntWithInt:v41];
              v31 += v41 >> 1;
              self->docBase_ += v41 >> 1;
              if (v31 > v18)
              {
                uint64_t v53 = (__CFString *)JreStrcat("$I$I$I", v43, v44, v45, v46, v47, v48, v49, @"invalid state: base=");
                v54 = v65;
LABEL_75:
                v55 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v53, v54);
                objc_exception_throw(v55);
              }
              if (v31 == v18) {
                uint64_t v50 = [v14 getMaxPointer];
              }
              else {
                uint64_t v50 = objc_msgSend(v63, "getStartPointerWithInt:");
              }
              uint64_t v7 = (v41 >> 1) + v7;
              id v28 = v65;
              -[OrgApacheLuceneStoreDataOutput copyBytesWithOrgApacheLuceneStoreDataInput:withLong:](self->fieldsStream_, "copyBytesWithOrgApacheLuceneStoreDataInput:withLong:", v65, v50 - (unsigned char *)[v65 getFilePointer]);
              uint64_t v3 = v64;
              if (v31 >= v18) {
                goto LABEL_62;
              }
            }
            uint64_t v53 = (__CFString *)JreStrcat("$I$I", v32, v33, v34, v35, v36, v37, v38, @"invalid state: base=");
LABEL_73:
            v54 = v28;
            goto LABEL_75;
          }
LABEL_62:
          id v51 = [v28 getFilePointer];
          if (v51 != [v14 getMaxPointer])
          {
            [v28 getFilePointer];
            [v14 getMaxPointer];
            uint64_t v53 = (__CFString *)JreStrcat("$J$J", v56, v57, v58, v59, v60, v61, v62, @"invalid state: pos=");
            goto LABEL_73;
          }
          self->numChunks_ += (int64_t)[v14 getNumChunks];
          self->numDirtyChunks_ += (int64_t)[v14 getNumDirtyChunks];
        }
        else
        {
          [v14 checkIntegrity];
          if (v18 >= 1)
          {
            uint64_t v21 = 0;
            do
            {
              if (!v20 || [v20 getWithInt:v21])
              {
                uint64_t v22 = (int *)[v14 documentWithInt:v21];
                [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter *)self startDocument];
                bufferedDocs = self->bufferedDocs_;
                if (!bufferedDocs || !v22) {
                  goto LABEL_71;
                }
                [(OrgApacheLuceneStoreDataOutput *)bufferedDocs copyBytesWithOrgApacheLuceneStoreDataInput:*((void *)v22 + 1) withLong:v22[4]];
                self->numStoredFieldsInDoc_ = v22[5];
                [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter *)self finishDocument];
                uint64_t v7 = (v7 + 1);
              }
              uint64_t v21 = (v21 + 1);
            }
            while (v18 != v21);
          }
        }
      }
      else
      {
        uint64_t v24 = v3[3];
        if (!v24) {
          goto LABEL_71;
        }
        uint64_t v25 = *(int *)(v24 + 8);
        if (v6 >= v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, v6);
        }
        v26 = *(void **)(v24 + 24 + 8 * v6);
        if (v26) {
          [*(id *)(v24 + 24 + 8 * v6) checkIntegrity];
        }
        if (v18 >= 1)
        {
          uint64_t v27 = 0;
          do
          {
            if (!v20 || [v20 getWithInt:v27])
            {
              [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter *)self startDocument];
              if (!v26) {
                goto LABEL_71;
              }
              [v26 visitDocumentWithInt:v27 withOrgApacheLuceneIndexStoredFieldVisitor:v10];
              [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter *)self finishDocument];
              uint64_t v7 = (v7 + 1);
            }
            uint64_t v27 = (v27 + 1);
          }
          while (v18 != v27);
        }
      }
      if (++v6 == v66) {
        goto LABEL_70;
      }
    }
    int v14 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = 0;
LABEL_70:
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter *)self finishWithOrgApacheLuceneIndexFieldInfos:v3[2] withInt:v7];
  return v7;
}

- (BOOL)tooDirtyWithOrgApacheLuceneCodecsCompressingCompressingStoredFieldsReader:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((uint64_t)[a3 getNumDirtyChunks] > 1024) {
    return 1;
  }
  uint64_t v5 = 100 * (void)[a3 getNumDirtyChunks];
  return v5 > (uint64_t)[a3 getNumChunks];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter;
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_TYPE_BITS_ = OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_(5uLL, v2, v3, v4, v5, v6, v7, v8);
    OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_TYPE_MASK_ = OrgApacheLuceneUtilPackedPackedInts_maxValueWithInt_(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_TYPE_BITS_);
    OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_NEGATIVE_ZERO_FLOAT_ = JavaLangFloat_floatToIntBitsWithFloat_(-0.0);
    OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_NEGATIVE_ZERO_DOUBLE_ = JavaLangDouble_doubleToLongBitsWithDouble_(-0.0);
    id v9 = [(id)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_class_() getName];
    uint64_t v17 = (__CFString *)JreStrcat("$$", v10, v11, v12, v13, v14, v15, v16, v9);
    JreStrongAssign((id *)&OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_BULK_MERGE_ENABLED_SYSPROP_, v17);
    id PropertyWithNSString_withNSString = JavaLangSystem_getPropertyWithNSString_withNSString_(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_BULK_MERGE_ENABLED_SYSPROP_, @"true");
    OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter_BULK_MERGE_ENABLED_ = JavaLangBoolean_parseBooleanWithNSString_((uint64_t)PropertyWithNSString_withNSString);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsWriter__initialized);
  }
}

@end