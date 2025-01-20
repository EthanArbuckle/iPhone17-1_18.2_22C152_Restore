@interface OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter
+ (void)initialize;
- (BOOL)tooDirtyWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsReader:(id)a3;
- (BOOL)triggerFlush;
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6 withNSString:(id)a7 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a8 withInt:(int)a9 withInt:(int)a10;
- (id)addDocDataWithInt:(int)a3;
- (id)flush;
- (int)flushNumFieldsWithInt:(int)a3;
- (int)mergeWithOrgApacheLuceneIndexMergeState:(id)a3;
- (void)addPositionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilBytesRef:(id)a6;
- (void)addProxWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withOrgApacheLuceneStoreDataInput:(id)a5;
- (void)close;
- (void)dealloc;
- (void)finishDocument;
- (void)finishField;
- (void)finishWithOrgApacheLuceneIndexFieldInfos:(id)a3 withInt:(int)a4;
- (void)flushFieldsWithInt:(int)a3 withIntArray:(id)a4;
- (void)flushFlagsWithInt:(int)a3 withIntArray:(id)a4;
- (void)flushNumTermsWithInt:(int)a3;
- (void)flushOffsetsWithIntArray:(id)a3;
- (void)startDocumentWithInt:(int)a3;
- (void)startFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7;
- (void)startTermWithOrgApacheLuceneUtilBytesRef:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter

- (id)addDocDataWithInt:(int)a3
{
  return sub_100008E0C((id *)&self->super.super.isa, a3);
}

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter)initWithOrgApacheLuceneStoreDirectory:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4 withNSString:(id)a5 withOrgApacheLuceneStoreIOContext:(id)a6 withNSString:(id)a7 withOrgApacheLuceneCodecsCompressingCompressionMode:(id)a8 withInt:(int)a9 withInt:(int)a10
{
  return self;
}

- (void)close
{
  p_vectorsStream = &self->vectorsStream_;
  p_indexWriter = &self->indexWriter_;
  indexWriter = self->indexWriter_;
  v6[0] = self->vectorsStream_;
  v6[1] = indexWriter;
  v5 = +[IOSObjectArray arrayWithObjects:v6 count:2 type:JavaIoCloseable_class_()];
  OrgApacheLuceneUtilIOUtils_closeWithJavaIoCloseableArray_(v5);
  JreStrongAssign((id *)p_vectorsStream, 0);
  JreStrongAssign((id *)p_indexWriter, 0);
}

- (void)startDocumentWithInt:(int)a3
{
  p_curDoc = &self->curDoc_;
  v4 = sub_100008E0C((id *)&self->super.super.isa, a3);
  JreStrongAssign((id *)p_curDoc, v4);
}

- (void)finishDocument
{
  termSuffixes = self->termSuffixes_;
  if (!termSuffixes || (payloadBytes = self->payloadBytes_) == 0) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreDataOutput *)termSuffixes writeBytesWithByteArray:payloadBytes->bytes_ withInt:payloadBytes->length_];
  self->payloadBytes_->length_ = 0;
  ++self->numDocs_;
  if (-[OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter triggerFlush]_0((uint64_t)self)) {
    -[OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter flush]_0((uint64_t)self);
  }
  JreStrongAssign((id *)&self->curDoc_, 0);
}

- (BOOL)triggerFlush
{
  uint64_t v1 = *(void *)(a1 + 144);
  if (!v1) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(v1 + 24) < *(_DWORD *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 80);
    if (v2) {
      return (int)[v2 size] > 127;
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  return 1;
}

- (id)flush
{
  v2 = *(void **)(a1 + 80);
  if (!v2) {
    goto LABEL_10;
  }
  id v3 = [v2 size];
  v4 = *(void **)(a1 + 16);
  if (!v4) {
    goto LABEL_10;
  }
  id v5 = v3;
  v6 = *(void **)(a1 + 24);
  if (!v6) {
    goto LABEL_10;
  }
  objc_msgSend(v4, "writeIndexWithInt:withLong:", v5, objc_msgSend(v6, "getFilePointer"));
  [*(id *)(a1 + 24) writeVIntWithInt:(*(_DWORD *)(a1 + 72) - v5)];
  [*(id *)(a1 + 24) writeVIntWithInt:v5];
  uint64_t v7 = sub_100009B20((id *)a1, (int)v5);
  if ((int)v7 < 1) {
    goto LABEL_8;
  }
  uint64_t v8 = v7;
  v9 = sub_100009CC4(a1);
  sub_10000A0E8(a1, v8, (uint64_t)v9, v10, v11, v12, v13, v14);
  sub_10000A328(a1, v8, (uint64_t)v9);
  sub_10000A80C(a1, v8);
  sub_10000AB5C(a1);
  sub_10000AF64(a1);
  sub_10000B1B4(a1);
  sub_10000B498(a1, (uint64_t)v9);
  sub_10000C2DC(a1);
  v15 = *(void **)(a1 + 40);
  if (!v15 || (uint64_t v16 = *(void *)(a1 + 144)) == 0) {
LABEL_10:
  }
    JreThrowNullPointerException();
  [v15 compressWithByteArray:*(void *)(v16 + 16) withInt:0 withInt:*(unsigned int *)(v16 + 24) withOrgApacheLuceneStoreDataOutput:*(void *)(a1 + 24)];
LABEL_8:
  [*(id *)(a1 + 80) clear];
  JreStrongAssign((id *)(a1 + 88), 0);
  id result = JreStrongAssign((id *)(a1 + 96), 0);
  uint64_t v18 = *(void *)(a1 + 144);
  if (!v18) {
    goto LABEL_10;
  }
  *(_DWORD *)(v18 + 24) = 0;
  ++*(void *)(a1 + 56);
  return result;
}

- (void)startFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7
{
  curDoc = self->curDoc_;
  if (!curDoc
    || !a3
    || (JreStrongAssign((id *)&self->curField_, [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_DocData *)curDoc addFieldWithInt:*((unsigned int *)a3 + 4) withInt:*(void *)&a4 withBoolean:a5 withBoolean:a6 withBoolean:a7]), (lastTerm = self->lastTerm_) == 0))
  {
    JreThrowNullPointerException();
  }
  lastTerm->length_ = 0;
}

- (void)finishField
{
}

- (void)startTermWithOrgApacheLuceneUtilBytesRef:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = OrgApacheLuceneUtilStringHelper_bytesDifferenceWithOrgApacheLuceneUtilBytesRef_withOrgApacheLuceneUtilBytesRef_((uint64_t)self->lastTerm_, (uint64_t)a3);
  curField = self->curField_;
  if (!curField
    || !a3
    || ([(OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData *)curField addTermWithInt:v4 withInt:v7 withInt:(*((_DWORD *)a3 + 5) - v7)], (termSuffixes = self->termSuffixes_) == 0)|| ([(OrgApacheLuceneUtilGrowableByteArrayDataOutput *)termSuffixes writeBytesWithByteArray:*((void *)a3 + 1) withInt:(*((_DWORD *)a3 + 4) + v7) withInt:(*((_DWORD *)a3 + 5) - v7)], (lastTerm = self->lastTerm_) == 0)|| (p_bytes = (id *)&lastTerm->bytes_, !lastTerm->bytes_))
  {
    JreThrowNullPointerException();
  }
  signed int v18 = *((_DWORD *)a3 + 5);
  if (*((_DWORD *)*p_bytes + 2) < v18)
  {
    id v19 = +[IOSByteArray newArrayWithLength:(int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v18, 1, v10, v11, v12, v13, v14, v15)];
    JreStrongAssignAndConsume(p_bytes, v19);
    lastTerm = self->lastTerm_;
  }
  lastTerm->offset_ = 0;
  self->lastTerm_->length_ = *((_DWORD *)a3 + 5);
  v20 = (void *)*((void *)a3 + 1);
  uint64_t v21 = *((unsigned int *)a3 + 4);
  bytes = self->lastTerm_->bytes_;
  uint64_t v23 = *((unsigned int *)a3 + 5);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v20, v21, bytes, 0, v23);
}

- (void)addPositionWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilBytesRef:(id)a6
{
  v6 = a6;
  curField = self->curField_;
  uint64_t v9 = (a5 - a4);
  if (a6) {
    a6 = (id)*((unsigned int *)a6 + 5);
  }
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FieldData *)curField addPositionWithInt:*(void *)&a3 withInt:*(void *)&a4 withInt:v9 withInt:a6];
  if (v6 && self->curField_->hasPayloads_)
  {
    payloadBytes = self->payloadBytes_;
    if (!payloadBytes) {
      JreThrowNullPointerException();
    }
    uint64_t v11 = v6[1];
    uint64_t v12 = *((unsigned int *)v6 + 4);
    uint64_t v13 = *((unsigned int *)v6 + 5);
    [(OrgApacheLuceneUtilGrowableByteArrayDataOutput *)payloadBytes writeBytesWithByteArray:v11 withInt:v12 withInt:v13];
  }
}

- (int)flushNumFieldsWithInt:(int)a3
{
  return sub_100009B20((id *)&self->super.super.isa, a3);
}

- (void)flushFieldsWithInt:(int)a3 withIntArray:(id)a4
{
  sub_10000A0E8((uint64_t)self, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7);
}

- (void)flushFlagsWithInt:(int)a3 withIntArray:(id)a4
{
}

- (void)flushNumTermsWithInt:(int)a3
{
}

- (void)flushOffsetsWithIntArray:(id)a3
{
}

- (void)finishWithOrgApacheLuceneIndexFieldInfos:(id)a3 withInt:(int)a4
{
  pendingDocs = self->pendingDocs_;
  if (!pendingDocs) {
    goto LABEL_10;
  }
  uint64_t v6 = *(void *)&a4;
  if (([(JavaUtilDeque *)pendingDocs isEmpty] & 1) == 0)
  {
    -[OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter flush]_0((uint64_t)self);
    ++self->numDirtyChunks_;
  }
  if (self->numDocs_ != v6)
  {
    CFStringRef v17 = JreStrcat("$I$I", v7, v8, v9, v10, v11, v12, v13, @"Wrote ");
    signed int v18 = new_JavaLangRuntimeException_initWithNSString_((uint64_t)v17);
    objc_exception_throw(v18);
  }
  indexWriter = self->indexWriter_;
  if (!indexWriter || (vectorsStream = self->vectorsStream_) == 0) {
LABEL_10:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter *)indexWriter finishWithInt:v6 withLong:[(OrgApacheLuceneStoreIndexOutput *)vectorsStream getFilePointer]];
  [(OrgApacheLuceneStoreDataOutput *)self->vectorsStream_ writeVLongWithLong:self->numChunks_];
  [(OrgApacheLuceneStoreDataOutput *)self->vectorsStream_ writeVLongWithLong:self->numDirtyChunks_];
  uint64_t v16 = self->vectorsStream_;
  OrgApacheLuceneCodecsCodecUtil_writeFooterWithOrgApacheLuceneStoreIndexOutput_(v16);
}

- (void)addProxWithInt:(int)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withOrgApacheLuceneStoreDataInput:(id)a5
{
  id v8 = a5;
  curField = self->curField_;
  if (curField->hasPositions_)
  {
    p_positionsBuf = &self->positionsBuf_;
    positionsBuf = (unsigned int *)self->positionsBuf_;
    if (!positionsBuf) {
      goto LABEL_57;
    }
    id v12 = a4;
    int posStart = curField->posStart_;
    int totalPositions = curField->totalPositions_;
    signed int v15 = totalPositions + posStart + a3;
    if (v15 > (int)positionsBuf[2])
    {
      uint64_t v16 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_(positionsBuf, v15, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
      JreStrongAssign((id *)p_positionsBuf, v16);
      curField = self->curField_;
    }
    if (curField->hasPayloads_)
    {
      p_payloadLengthsBuf = &self->payloadLengthsBuf_;
      payloadLengthsBuf = (unsigned int *)self->payloadLengthsBuf_;
      if (!payloadLengthsBuf) {
        goto LABEL_57;
      }
      int payStart = curField->payStart_;
      int v19 = curField->totalPositions_;
      signed int v20 = v19 + payStart + a3;
      if (v20 > (int)payloadLengthsBuf[2])
      {
        uint64_t v21 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_(payloadLengthsBuf, v20, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
        JreStrongAssign((id *)p_payloadLengthsBuf, v21);
      }
      if (a3 >= 1)
      {
        if (!v12) {
          goto LABEL_57;
        }
        int v22 = 0;
        uint64_t v23 = (v19 + payStart);
        uint64_t v24 = (totalPositions + posStart);
        uint64_t v25 = a3;
        id v68 = v12;
        do
        {
          unsigned int v26 = [v12 readVInt];
          if (v26)
          {
            v29 = v12;
            id v30 = v8;
            v31 = p_positionsBuf;
            unsigned int v32 = [v29 readVInt];
            v33 = *p_payloadLengthsBuf;
            if (!*p_payloadLengthsBuf) {
              goto LABEL_57;
            }
            signed int v34 = v32;
            uint64_t size = v33->super.size_;
            if ((v23 & 0x80000000) != 0 || (int)v23 >= (int)size) {
              IOSArray_throwOutOfBoundsWithMsg(size, v23);
            }
            *(&v33->super.size_ + (int)v23 + 1) = v34;
            payloadBytes = self->payloadBytes_;
            if (!payloadBytes) {
              goto LABEL_57;
            }
            [(OrgApacheLuceneStoreDataOutput *)payloadBytes copyBytesWithOrgApacheLuceneStoreDataInput:v68 withLong:v34];
            p_positionsBuf = v31;
            id v8 = v30;
          }
          else
          {
            v27 = *p_payloadLengthsBuf;
            if (!*p_payloadLengthsBuf) {
              goto LABEL_57;
            }
            uint64_t v28 = v27->super.size_;
            if ((v23 & 0x80000000) != 0 || (int)v23 >= (int)v28) {
              IOSArray_throwOutOfBoundsWithMsg(v28, v23);
            }
            *(&v27->super.size_ + (int)v23 + 1) = 0;
          }
          v37 = *p_positionsBuf;
          if (!*p_positionsBuf) {
            goto LABEL_57;
          }
          uint64_t v38 = v37->super.size_;
          if ((v24 & 0x80000000) != 0 || (int)v24 >= (int)v38) {
            IOSArray_throwOutOfBoundsWithMsg(v38, v24);
          }
          v22 += v26 >> 1;
          *(&v37->super.size_ + (int)v24 + 1) = v22;
          uint64_t v23 = (v23 + 1);
          uint64_t v24 = (v24 + 1);
          --v25;
          id v12 = v68;
        }
        while (v25);
      }
    }
    else if (a3 >= 1)
    {
      if (v12)
      {
        int v39 = 0;
        uint64_t v40 = (totalPositions + posStart);
        uint64_t v41 = a3;
        while (1)
        {
          unsigned int v42 = [v12 readVInt];
          v43 = *p_positionsBuf;
          if (!*p_positionsBuf) {
            break;
          }
          unsigned int v44 = v42;
          uint64_t v45 = v43->super.size_;
          if ((v40 & 0x80000000) != 0 || (int)v40 >= (int)v45) {
            IOSArray_throwOutOfBoundsWithMsg(v45, v40);
          }
          v39 += v44 >> 1;
          *(&v43->super.size_ + (int)v40 + 1) = v39;
          uint64_t v40 = (v40 + 1);
          if (!--v41) {
            goto LABEL_39;
          }
        }
      }
LABEL_57:
      JreThrowNullPointerException();
    }
  }
LABEL_39:
  v46 = self->curField_;
  if (v46->hasOffsets_)
  {
    p_startOffsetsBuf = &self->startOffsetsBuf_;
    startOffsetsBuf = self->startOffsetsBuf_;
    if (!startOffsetsBuf) {
      goto LABEL_57;
    }
    int offStart = v46->offStart_;
    int v50 = v46->totalPositions_;
    signed int v51 = v50 + offStart + a3;
    if (v51 > startOffsetsBuf->super.size_)
    {
      unsigned int v52 = OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v51, 4, *(uint64_t *)&a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
      v53 = JavaUtilArrays_copyOfWithIntArray_withInt_(*p_startOffsetsBuf, v52);
      JreStrongAssign((id *)p_startOffsetsBuf, v53);
      v54 = JavaUtilArrays_copyOfWithIntArray_withInt_(self->lengthsBuf_, v52);
      JreStrongAssign((id *)&self->lengthsBuf_, v54);
    }
    if (a3 >= 1)
    {
      if (v8)
      {
        unsigned int v55 = 0;
        uint64_t v56 = (v50 + offStart);
        uint64_t v57 = a3;
        while (1)
        {
          unsigned int v58 = [v8 readVInt];
          unsigned int v59 = [v8 readVInt];
          v60 = *p_startOffsetsBuf;
          if (!*p_startOffsetsBuf) {
            break;
          }
          unsigned int v61 = v59;
          uint64_t v62 = v60->super.size_;
          if ((v56 & 0x80000000) != 0 || (int)v56 >= (int)v62) {
            IOSArray_throwOutOfBoundsWithMsg(v62, v56);
          }
          int v63 = v58 + v55;
          *(&v60->super.size_ + (int)v56 + 1) = v63;
          lengthsBuf = self->lengthsBuf_;
          if (!lengthsBuf) {
            break;
          }
          uint64_t v65 = lengthsBuf->super.size_;
          if ((v56 & 0x80000000) != 0 || (int)v56 >= (int)v65) {
            IOSArray_throwOutOfBoundsWithMsg(v65, v56);
          }
          unsigned int v55 = v63 + v61;
          *(&lengthsBuf->super.size_ + (int)v56 + 1) = v61;
          uint64_t v56 = (v56 + 1);
          if (!--v57) {
            goto LABEL_56;
          }
        }
      }
      goto LABEL_57;
    }
  }
LABEL_56:
  self->curField_->totalPositions_ += a3;
}

- (int)mergeWithOrgApacheLuceneIndexMergeState:(id)a3
{
  if (!a3 || (uint64_t v4 = *((void *)a3 + 12)) == 0) {
LABEL_64:
  }
    JreThrowNullPointerException();
  uint64_t v61 = *(unsigned int *)(v4 + 8);
  uint64_t v62 = new_OrgApacheLuceneCodecsCompressingMatchingReaders_initWithOrgApacheLuceneIndexMergeState_((uint64_t)a3);
  if ((int)v61 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = *((void *)a3 + 4);
      if (!v8) {
        goto LABEL_64;
      }
      uint64_t v9 = *(int *)(v8 + 8);
      if (v6 >= v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v6);
      }
      matchingReaders = v62->matchingReaders_;
      if (!matchingReaders) {
        goto LABEL_64;
      }
      uint64_t v11 = *(void **)(v8 + 24 + 8 * v6);
      uint64_t size = matchingReaders->super.size_;
      if (v6 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      BOOL v13 = !*((unsigned char *)&matchingReaders->super.size_ + v6 + 4) || v11 == 0;
      if (v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        uint64_t v14 = 0;
      }
      else
      {
        objc_opt_class();
        uint64_t v14 = v11;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
      }
      uint64_t v15 = *((void *)a3 + 12);
      uint64_t v16 = *(int *)(v15 + 8);
      if (v6 >= v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v6);
      }
      uint64_t v17 = *((void *)a3 + 8);
      if (!v17) {
        goto LABEL_64;
      }
      int v18 = *(_DWORD *)(v15 + 12 + 4 * v6);
      uint64_t v19 = *(int *)(v17 + 8);
      if (v6 >= v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v6);
      }
      signed int v20 = *(void **)(v17 + 24 + 8 * v6);
      if (v14
        && [v14 getCompressionMode] == self->compressionMode_
        && [v14 getChunkSize] == self->chunkSize_
        && [v14 getVersion] == 1
        && [v14 getPackedIntsVersion] == 2
        && OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_BULK_MERGE_ENABLED_
        && !v20
        && ![(OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter *)self tooDirtyWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsReader:v14])
      {
        [v14 checkIntegrity];
        pendingDocs = self->pendingDocs_;
        if (!pendingDocs) {
          goto LABEL_64;
        }
        if (([(JavaUtilDeque *)pendingDocs isEmpty] & 1) == 0)
        {
          -[OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter flush]_0((uint64_t)self);
          ++self->numDirtyChunks_;
        }
        id v24 = [v14 getVectorsStream];
        id v25 = [v14 getIndexReader];
        if (!v24) {
          goto LABEL_64;
        }
        id v26 = v25;
        if (!v25) {
          goto LABEL_64;
        }
        objc_msgSend(v24, "seekWithLong:", objc_msgSend(v25, "getStartPointerWithInt:", 0));
        if (v18 >= 1)
        {
          unsigned int v59 = v26;
          v60 = v24;
          int v27 = 0;
          while ([v24 readVInt] == v27)
          {
            id v35 = [v24 readVInt];
            indexWriter = self->indexWriter_;
            if (!indexWriter) {
              goto LABEL_64;
            }
            id v37 = v35;
            vectorsStream = self->vectorsStream_;
            if (!vectorsStream) {
              goto LABEL_64;
            }
            [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexWriter *)indexWriter writeIndexWithInt:v37 withLong:[(OrgApacheLuceneStoreIndexOutput *)vectorsStream getFilePointer]];
            [(OrgApacheLuceneStoreDataOutput *)self->vectorsStream_ writeVIntWithInt:v7];
            [(OrgApacheLuceneStoreDataOutput *)self->vectorsStream_ writeVIntWithInt:v37];
            v27 += (int)v37;
            self->numDocs_ += (int)v37;
            if (v27 > v18)
            {
              v49 = (__CFString *)JreStrcat("$I$I$I", v39, v40, v41, v42, v43, v44, v45, @"invalid state: base=");
              int v50 = v60;
LABEL_68:
              signed int v51 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v49, v50);
              objc_exception_throw(v51);
            }
            if (v27 == v18) {
              v46 = [v14 getMaxPointer];
            }
            else {
              v46 = objc_msgSend(v59, "getStartPointerWithInt:");
            }
            uint64_t v7 = (v37 + v7);
            id v24 = v60;
            -[OrgApacheLuceneStoreDataOutput copyBytesWithOrgApacheLuceneStoreDataInput:withLong:](self->vectorsStream_, "copyBytesWithOrgApacheLuceneStoreDataInput:withLong:", v60, v46 - (unsigned char *)[v60 getFilePointer]);
            if (v27 >= v18) {
              goto LABEL_56;
            }
          }
          v49 = (__CFString *)JreStrcat("$I$I", v28, v29, v30, v31, v32, v33, v34, @"invalid state: base=");
LABEL_66:
          int v50 = v24;
          goto LABEL_68;
        }
LABEL_56:
        id v47 = [v24 getFilePointer];
        if (v47 != [v14 getMaxPointer])
        {
          [v24 getFilePointer];
          [v14 getMaxPointer];
          v49 = (__CFString *)JreStrcat("$J$J", v52, v53, v54, v55, v56, v57, v58, @"invalid state: pos=");
          goto LABEL_66;
        }
        self->numChunks_ += (int64_t)[v14 getNumChunks];
        self->numDirtyChunks_ += (int64_t)[v14 getNumDirtyChunks];
      }
      else
      {
        if (v11) {
          [v11 checkIntegrity];
        }
        if (v18 >= 1)
        {
          uint64_t v21 = 0;
          do
          {
            if (!v20 || [v20 getWithInt:v21])
            {
              if (v11) {
                id v22 = [v11 getWithInt:v21];
              }
              else {
                id v22 = 0;
              }
              [(OrgApacheLuceneCodecsTermVectorsWriter *)self addAllDocVectorsWithOrgApacheLuceneIndexFields:v22 withOrgApacheLuceneIndexMergeState:a3];
              uint64_t v7 = (v7 + 1);
            }
            uint64_t v21 = (v21 + 1);
          }
          while (v18 != v21);
        }
      }
      if (++v6 == v61) {
        goto LABEL_63;
      }
    }
  }
  uint64_t v7 = 0;
LABEL_63:
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter *)self finishWithOrgApacheLuceneIndexFieldInfos:*((void *)a3 + 2) withInt:v7];
  return v7;
}

- (BOOL)tooDirtyWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsReader:(id)a3
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
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter;
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_FLAGS_BITS_ = OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_(7uLL, v2, v3, v4, v5, v6, v7, v8);
    id v9 = [(id)OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_class_() getName];
    uint64_t v17 = (__CFString *)JreStrcat("$$", v10, v11, v12, v13, v14, v15, v16, v9);
    JreStrongAssign((id *)&OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_BULK_MERGE_ENABLED_SYSPROP_, v17);
    id PropertyWithNSString_withNSString = JavaLangSystem_getPropertyWithNSString_withNSString_(OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_BULK_MERGE_ENABLED_SYSPROP_, @"true");
    OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter_BULK_MERGE_ENABLED_ = JavaLangBoolean_parseBooleanWithNSString_((uint64_t)PropertyWithNSString_withNSString);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneCodecsCompressingCompressingTermVectorsWriter__initialized);
  }
}

@end