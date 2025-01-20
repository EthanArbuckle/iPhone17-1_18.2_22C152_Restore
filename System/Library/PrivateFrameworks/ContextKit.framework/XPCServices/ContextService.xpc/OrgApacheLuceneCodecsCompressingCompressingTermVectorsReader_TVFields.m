@interface OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVFields
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVFields)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsReader:(id)a3 withIntArray:(id)a4 withIntArray:(id)a5 withIntArray:(id)a6 withIntArray:(id)a7 withIntArray:(id)a8 withIntArray2:(id)a9 withIntArray2:(id)a10 withIntArray2:(id)a11 withIntArray2:(id)a12 withIntArray2:(id)a13 withIntArray2:(id)a14 withIntArray2:(id)a15 withOrgApacheLuceneUtilBytesRef:(id)a16 withIntArray2:(id)a17 withOrgApacheLuceneUtilBytesRef:(id)a18;
- (id)iterator;
- (id)termsWithNSString:(id)a3;
- (int)size;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVFields

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVFields)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsReader:(id)a3 withIntArray:(id)a4 withIntArray:(id)a5 withIntArray:(id)a6 withIntArray:(id)a7 withIntArray:(id)a8 withIntArray2:(id)a9 withIntArray2:(id)a10 withIntArray2:(id)a11 withIntArray2:(id)a12 withIntArray2:(id)a13 withIntArray2:(id)a14 withIntArray2:(id)a15 withOrgApacheLuceneUtilBytesRef:(id)a16 withIntArray2:(id)a17 withOrgApacheLuceneUtilBytesRef:(id)a18
{
  return self;
}

- (id)iterator
{
  v3 = [OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVFields__1 alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->i_ = 0;
  return v3;
}

- (id)termsWithNSString:(id)a3
{
  fieldInfos = self->this$0_->fieldInfos_;
  if (!fieldInfos) {
    goto LABEL_55;
  }
  v5 = [(OrgApacheLuceneIndexFieldInfos *)fieldInfos fieldInfoWithNSString:a3];
  if (!v5) {
    return 0;
  }
  fieldNumOffs = self->fieldNumOffs_;
  if (!fieldNumOffs) {
    goto LABEL_55;
  }
  v7 = v5;
  uint64_t v8 = 0;
  while (1)
  {
    if ((int)v8 >= fieldNumOffs->super.size_) {
      return 0;
    }
    fieldNums = self->fieldNums_;
    if (!fieldNums) {
      goto LABEL_55;
    }
    int v10 = *(&fieldNumOffs->super.size_ + (int)v8 + 1);
    uint64_t size = fieldNums->super.size_;
    if (v10 < 0 || v10 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v10);
    }
    if (*(&fieldNums->super.size_ + v10 + 1) == v7[4]) {
      break;
    }
    fieldNumOffs = self->fieldNumOffs_;
    ++v8;
    if (!fieldNumOffs) {
      goto LABEL_55;
    }
  }
  if (v8 == -1) {
    return 0;
  }
  numTerms = self->numTerms_;
  if (!numTerms) {
    goto LABEL_55;
  }
  uint64_t v13 = numTerms->super.size_;
  if ((int)v8 >= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(v13, v8);
  }
  if (!*(&numTerms->super.size_ + (int)v8 + 1)) {
    return 0;
  }
  v14 = self->fieldNumOffs_;
  if (v14->super.size_ < 1)
  {
    int v16 = 0;
LABEL_27:
    int v21 = -1;
  }
  else
  {
    uint64_t v15 = 0;
    int v16 = 0;
    uint64_t v17 = v8;
    while (1)
    {
      fieldLengths = self->fieldLengths_;
      if (!v17) {
        break;
      }
      if (!fieldLengths) {
        goto LABEL_55;
      }
      uint64_t v19 = fieldLengths->super.size_;
      if (v15 >= v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v15);
      }
      v16 += *(&fieldLengths->super.size_ + ++v15);
      --v17;
      if (v15 >= v14->super.size_) {
        goto LABEL_27;
      }
    }
    if (!fieldLengths) {
LABEL_55:
    }
      JreThrowNullPointerException();
    uint64_t v22 = fieldLengths->super.size_;
    if ((int)v8 >= (int)v22) {
      IOSArray_throwOutOfBoundsWithMsg(v22, v8);
    }
    int v21 = *(&fieldLengths->super.size_ + v8 + 1);
  }
  v23 = self->numTerms_;
  if (!v23) {
    goto LABEL_55;
  }
  uint64_t v24 = v23->super.size_;
  if ((int)v8 >= (int)v24) {
    IOSArray_throwOutOfBoundsWithMsg(v24, v8);
  }
  fieldFlags = self->fieldFlags_;
  if (!fieldFlags) {
    goto LABEL_55;
  }
  int v26 = *(&v23->super.size_ + (int)v8 + 1);
  uint64_t v27 = fieldFlags->super.size_;
  if ((int)v8 >= (int)v27) {
    IOSArray_throwOutOfBoundsWithMsg(v27, v8);
  }
  prefixLengths = self->prefixLengths_;
  if (!prefixLengths) {
    goto LABEL_55;
  }
  int v29 = *(&fieldFlags->super.size_ + (int)v8 + 1);
  uint64_t v30 = prefixLengths->super.size_;
  if ((int)v8 >= (int)v30) {
    IOSArray_throwOutOfBoundsWithMsg(v30, v8);
  }
  suffixLengths = self->suffixLengths_;
  if (!suffixLengths) {
    goto LABEL_55;
  }
  v32 = (&prefixLengths->elementType_)[(int)v8];
  uint64_t v33 = suffixLengths->super.size_;
  if ((int)v8 >= (int)v33) {
    IOSArray_throwOutOfBoundsWithMsg(v33, v8);
  }
  termFreqs = self->termFreqs_;
  if (!termFreqs) {
    goto LABEL_55;
  }
  v59 = (&suffixLengths->elementType_)[(int)v8];
  uint64_t v35 = termFreqs->super.size_;
  if ((int)v8 >= (int)v35) {
    IOSArray_throwOutOfBoundsWithMsg(v35, v8);
  }
  positionIndex = self->positionIndex_;
  if (!positionIndex) {
    goto LABEL_55;
  }
  v58 = (&termFreqs->elementType_)[(int)v8];
  uint64_t v37 = positionIndex->super.size_;
  if ((int)v8 >= (int)v37) {
    IOSArray_throwOutOfBoundsWithMsg(v37, v8);
  }
  positions = self->positions_;
  if (!positions) {
    goto LABEL_55;
  }
  v55 = (&positionIndex->elementType_)[(int)v8];
  uint64_t v39 = positions->super.size_;
  if ((int)v8 >= (int)v39) {
    IOSArray_throwOutOfBoundsWithMsg(v39, v8);
  }
  v56 = v32;
  int v57 = v26;
  startOffsets = self->startOffsets_;
  if (!startOffsets) {
    goto LABEL_55;
  }
  v41 = (&positions->elementType_)[(int)v8];
  uint64_t v42 = startOffsets->super.size_;
  if ((int)v8 >= (int)v42) {
    IOSArray_throwOutOfBoundsWithMsg(v42, v8);
  }
  lengths = self->lengths_;
  if (!lengths) {
    goto LABEL_55;
  }
  v44 = (&startOffsets->elementType_)[(int)v8];
  uint64_t v45 = lengths->super.size_;
  if ((int)v8 >= (int)v45) {
    IOSArray_throwOutOfBoundsWithMsg(v45, v8);
  }
  payloadIndex = self->payloadIndex_;
  if (!payloadIndex) {
    goto LABEL_55;
  }
  v47 = (&lengths->elementType_)[(int)v8];
  uint64_t v48 = payloadIndex->super.size_;
  if ((int)v8 >= (int)v48) {
    IOSArray_throwOutOfBoundsWithMsg(v48, v8);
  }
  suffixBytes = self->suffixBytes_;
  if (!suffixBytes) {
    goto LABEL_55;
  }
  int v50 = v29;
  payloadBytes = self->payloadBytes_;
  v52 = (&payloadIndex->elementType_)[(int)v8];
  v53 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(suffixBytes->bytes_, suffixBytes->offset_ + v16, v21);
  v54 = [OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTerms alloc];
  sub_100089798((uint64_t)v54, v57, v50, v56, v59, v58, v55, v41, v44, v47, v52, payloadBytes, v53);
  return v54;
}

- (int)size
{
  fieldNumOffs = self->fieldNumOffs_;
  if (!fieldNumOffs) {
    JreThrowNullPointerException();
  }
  return fieldNumOffs->super.size_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVFields;
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVFields *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end