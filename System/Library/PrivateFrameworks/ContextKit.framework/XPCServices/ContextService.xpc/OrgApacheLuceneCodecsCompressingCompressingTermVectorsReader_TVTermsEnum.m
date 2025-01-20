@interface OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum)init;
- (id)next;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)term;
- (int)docFreq;
- (int64_t)ord;
- (int64_t)totalTermFreq;
- (void)dealloc;
- (void)reset;
- (void)resetWithInt:(int)a3 withInt:(int)a4 withIntArray:(id)a5 withIntArray:(id)a6 withIntArray:(id)a7 withIntArray:(id)a8 withIntArray:(id)a9 withIntArray:(id)a10 withIntArray:(id)a11 withIntArray:(id)a12 withOrgApacheLuceneUtilBytesRef:(id)a13 withOrgApacheLuceneStoreByteArrayDataInput:(id)a14;
- (void)seekExactWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum)init
{
  return self;
}

- (void)resetWithInt:(int)a3 withInt:(int)a4 withIntArray:(id)a5 withIntArray:(id)a6 withIntArray:(id)a7 withIntArray:(id)a8 withIntArray:(id)a9 withIntArray:(id)a10 withIntArray:(id)a11 withIntArray:(id)a12 withOrgApacheLuceneUtilBytesRef:(id)a13 withOrgApacheLuceneStoreByteArrayDataInput:(id)a14
{
  self->numTerms_ = a3;
  JreStrongAssign((id *)&self->prefixLengths_, a5);
  JreStrongAssign((id *)&self->suffixLengths_, a6);
  JreStrongAssign((id *)&self->termFreqs_, a7);
  JreStrongAssign((id *)&self->positionIndex_, a8);
  JreStrongAssign((id *)&self->positions_, a9);
  JreStrongAssign((id *)&self->startOffsets_, a10);
  JreStrongAssign((id *)&self->lengths_, a11);
  JreStrongAssign((id *)&self->payloadIndex_, a12);
  JreStrongAssign((id *)&self->payloads_, a13);
  JreStrongAssign((id *)&self->in_, a14);
  if (!a14) {
    JreThrowNullPointerException();
  }
  self->startPos_ = [a14 getPosition];
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum *)self reset];
}

- (void)reset
{
  term = self->term_;
  if (!term || (term->length_ = 0, (in = self->in_) == 0)) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreByteArrayDataInput *)in setPositionWithInt:self->startPos_];
  self->ord_ = -1;
}

- (id)next
{
  int ord = self->ord_;
  if (ord == self->numTerms_ - 1) {
    return 0;
  }
  self->ord_ = ord + 1;
  term = self->term_;
  if (!term) {
    goto LABEL_19;
  }
  term->offset_ = 0;
  prefixLengths = self->prefixLengths_;
  if (!prefixLengths) {
    goto LABEL_19;
  }
  int v13 = self->ord_;
  uint64_t size = prefixLengths->super.size_;
  if (v13 < 0 || v13 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v13);
  }
  suffixLengths = self->suffixLengths_;
  if (!suffixLengths) {
    goto LABEL_19;
  }
  int v16 = *(&prefixLengths->super.size_ + v13 + 1);
  int v17 = self->ord_;
  uint64_t v18 = suffixLengths->super.size_;
  if (v17 < 0 || v17 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v17);
  }
  self->term_->length_ = *(&suffixLengths->super.size_ + v17 + 1) + v16;
  v19 = self->term_;
  p_bytes = (id *)&v19->bytes_;
  bytes = (unsigned int *)v19->bytes_;
  if (!bytes) {
    goto LABEL_19;
  }
  signed int length = v19->length_;
  if (length > (int)bytes[2])
  {
    v23 = OrgApacheLuceneUtilArrayUtil_growWithByteArray_withInt_(bytes, length, v2, v3, v4, v5, v6, v7);
    JreStrongAssign(p_bytes, v23);
  }
  if (!self->in_) {
LABEL_19:
  }
    JreThrowNullPointerException();
  v24 = self->prefixLengths_;
  uint64_t v25 = self->ord_;
  uint64_t v26 = v24->super.size_;
  if ((v25 & 0x80000000) != 0 || (int)v25 >= (int)v26) {
    IOSArray_throwOutOfBoundsWithMsg(v26, v25);
  }
  v27 = self->suffixLengths_;
  uint64_t v28 = v27->super.size_;
  if ((v25 & 0x80000000) != 0 || (int)v25 >= (int)v28) {
    IOSArray_throwOutOfBoundsWithMsg(v28, v25);
  }
  [(OrgApacheLuceneStoreByteArrayDataInput *)self->in_ readBytesWithByteArray:self->term_->bytes_ withInt:*((unsigned int *)&v24->super.size_ + (int)v25 + 1) withInt:*((unsigned int *)&v27->super.size_ + (int)v25 + 1)];
  return self->term_;
}

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  int ord = self->ord_;
  if (ord < 0 || ord >= self->numTerms_) {
    goto LABEL_7;
  }
  id v6 = [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum *)self term];
  if (!v6) {
    JreThrowNullPointerException();
  }
  int v7 = [v6 compareToWithId:a3];
  if (v7)
  {
    if (v7 >= 1) {
      [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum *)self reset];
    }
    while (1)
    {
LABEL_7:
      id v8 = [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum *)self next];
      if (!v8)
      {
        v10 = &OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_;
        if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
          return (id)*v10;
        }
        goto LABEL_15;
      }
      int v9 = [v8 compareToWithId:a3];
      if (v9 >= 1) {
        break;
      }
      if (!v9) {
        goto LABEL_10;
      }
    }
    v10 = &qword_1005638D0;
    if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
      return (id)*v10;
    }
    goto LABEL_15;
  }
LABEL_10:
  v10 = &qword_1005638C8;
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
LABEL_15:
  }
    objc_opt_class();
  return (id)*v10;
}

- (void)seekExactWithLong:(int64_t)a3
{
  uint64_t v3 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v3);
}

- (id)term
{
  return self->term_;
}

- (int64_t)ord
{
  uint64_t v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int)docFreq
{
  return 1;
}

- (int64_t)totalTermFreq
{
  termFreqs = self->termFreqs_;
  if (!termFreqs) {
    JreThrowNullPointerException();
  }
  int ord = self->ord_;
  uint64_t size = termFreqs->super.size_;
  if (ord < 0 || ord >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, ord);
  }
  return *(&termFreqs->super.size_ + ord + 1);
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  if (OrgApacheLuceneIndexPostingsEnum_featureRequestedWithInt_withShort_(a4, 0x4000)
    && !self->positions_
    && !self->startOffsets_)
  {
    return 0;
  }
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
  }
  else
  {
    id v6 = [OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVPostingsEnum alloc];
    OrgApacheLuceneIndexPostingsEnum_init((uint64_t)v6, v7);
    v6->doc_ = -1;
    id v8 = new_OrgApacheLuceneUtilBytesRef_init();
    JreStrongAssignAndConsume((id *)&v6->payload_, v8);
    a3 = v6;
    if (!a3) {
      goto LABEL_18;
    }
  }
  termFreqs = self->termFreqs_;
  if (!termFreqs) {
    goto LABEL_18;
  }
  int ord = self->ord_;
  uint64_t size = termFreqs->super.size_;
  if (ord < 0 || ord >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, ord);
  }
  positionIndex = self->positionIndex_;
  if (!positionIndex) {
LABEL_18:
  }
    JreThrowNullPointerException();
  int v13 = self->ord_;
  uint64_t v14 = positionIndex->super.size_;
  if (v13 < 0 || v13 >= (int)v14) {
    IOSArray_throwOutOfBoundsWithMsg(v14, v13);
  }
  [a3 resetWithInt:*((unsigned int *)&termFreqs->super.size_ + ord + 1) withInt:*((unsigned int *)&positionIndex->super.size_ + v13 + 1) withIntArray:self->positions_ withIntArray:self->startOffsets_ withIntArray:self->lengths_ withOrgApacheLuceneUtilBytesRef:self->payloads_ withIntArray:self->payloadIndex_];
  return a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum;
  [(OrgApacheLuceneIndexTermsEnum *)&v3 dealloc];
}

@end