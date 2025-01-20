@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum)initWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4;
- (id)next;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)term;
- (int)docFreq;
- (int64_t)binarySearchBlockWithOrgApacheLuceneUtilBytesRef:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)binarySearchIndexWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (int64_t)ord;
- (int64_t)totalTermFreq;
- (void)dealloc;
- (void)readTermWithInt:(int)a3;
- (void)seekExactWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum)initWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4
{
  return self;
}

- (void)readTermWithInt:(int)a3
{
}

- (id)next
{
  int64_t v2 = self->currentOrd_ + 1;
  self->currentOrd_ = v2;
  if (v2 >= self->this$0_->numValues_) {
    return 0;
  }
  if ((v2 & 0xF) != 0)
  {
    sub_1000F1D68((uint64_t)self, v2 & 0xF);
  }
  else
  {
    sub_1000F18AC((uint64_t)self);
    sub_1000F1CC0((uint64_t)self);
  }
  return self->term_;
}

- (int64_t)binarySearchIndexWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  int64_t numReverseIndexValues = self->this$0_->numReverseIndexValues_;
  int64_t v4 = numReverseIndexValues - 1;
  if (numReverseIndexValues - 1 < 0) {
    return numReverseIndexValues - 1;
  }
  int64_t v7 = 0;
  do
  {
    v8 = self->this$0_;
    reverseTerms = v8->reverseTerms_;
    if (!reverseTerms
      || (reverseAddresses = v8->reverseAddresses_) == 0
      || (int64_t v11 = (unint64_t)(v4 + v7) >> 1,
          [(OrgApacheLuceneUtilPagedBytes_Reader *)reverseTerms fillWithOrgApacheLuceneUtilBytesRef:self->scratch_ withLong:[(OrgApacheLuceneUtilPackedMonotonicBlockPackedReader *)reverseAddresses getWithLong:v11]], (scratch = self->scratch_) == 0))
    {
      JreThrowNullPointerException();
    }
    unsigned int v13 = [(OrgApacheLuceneUtilBytesRef *)scratch compareToWithId:a3];
    if ((v13 & 0x80000000) != 0)
    {
      int64_t v7 = v11 + 1;
    }
    else
    {
      if (!v13) {
        return v11;
      }
      int64_t v4 = v11 - 1;
    }
    int64_t v11 = v4;
  }
  while (v7 <= v4);
  return v11;
}

- (int64_t)binarySearchBlockWithOrgApacheLuceneUtilBytesRef:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  int64_t v5 = a5;
  if (a4 > a5) {
    return a5;
  }
  int64_t v7 = a4;
  do
  {
    input = self->input_;
    if (!input
      || (addresses = self->this$0_->addresses_) == 0
      || (int64_t v6 = (unint64_t)(v5 + v7) >> 1,
          [(OrgApacheLuceneStoreIndexInput *)input seekWithLong:[(OrgApacheLuceneUtilPackedMonotonicBlockPackedReader *)addresses getWithLong:v6]], unsigned int v12 = [(OrgApacheLuceneStoreDataInput *)self->input_ readVInt], (term = self->term_) == 0))
    {
      JreThrowNullPointerException();
    }
    term->length_ = v12;
    [(OrgApacheLuceneStoreIndexInput *)self->input_ readBytesWithByteArray:self->term_->bytes_ withInt:0 withInt:self->term_->length_];
    unsigned int v14 = [(OrgApacheLuceneUtilBytesRef *)self->term_ compareToWithId:a3];
    if ((v14 & 0x80000000) != 0)
    {
      int64_t v7 = v6 + 1;
    }
    else
    {
      if (!v14) {
        return v6;
      }
      int64_t v5 = v6 - 1;
    }
    int64_t v6 = v5;
  }
  while (v7 <= v5);
  return v6;
}

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  int64_t v5 = -[OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum binarySearchIndexWithOrgApacheLuceneUtilBytesRef:](self, "binarySearchIndexWithOrgApacheLuceneUtilBytesRef:");
  if (v5 < 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = v5 << 6;
    uint64_t v7 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum *)self binarySearchBlockWithOrgApacheLuceneUtilBytesRef:a3 withLong:v5 << 6 withLong:JavaLangMath_minWithLong_withLong_(self->this$0_->numIndexValues_ - 1, (v5 << 6) | 0x3F)];
    uint64_t v8 = JavaLangMath_maxWithLong_withLong_(v6, v7);
  }
  input = self->input_;
  if (!input || (addresses = self->this$0_->addresses_) == 0) {
LABEL_17:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneStoreIndexInput *)input seekWithLong:[(OrgApacheLuceneUtilPackedMonotonicBlockPackedReader *)addresses getWithLong:v8]];
  self->currentOrd_ = 16 * v8 - 1;
  while ([(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum *)self next])
  {
    term = self->term_;
    if (!term) {
      goto LABEL_17;
    }
    int v12 = [(OrgApacheLuceneUtilBytesRef *)term compareToWithId:a3];
    if (!v12)
    {
      unsigned int v13 = &qword_1005638C8;
      if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
        goto LABEL_12;
      }
      return (id)*v13;
    }
    if (v12 >= 1)
    {
      unsigned int v13 = &qword_1005638D0;
      if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
        return (id)*v13;
      }
      goto LABEL_12;
    }
  }
  unsigned int v13 = &OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_;
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
LABEL_12:
  }
    objc_opt_class();
  return (id)*v13;
}

- (void)seekExactWithLong:(int64_t)a3
{
  if ((unint64_t)a3 >> 4 != (unint64_t)self->currentOrd_ >> 4)
  {
    input = self->input_;
    if (!input) {
      goto LABEL_15;
    }
    addresses = self->this$0_->addresses_;
    if (!addresses) {
      goto LABEL_15;
    }
    -[OrgApacheLuceneStoreIndexInput seekWithLong:](input, "seekWithLong:", -[OrgApacheLuceneUtilPackedMonotonicBlockPackedReader getWithLong:](addresses, "getWithLong:"));
    sub_1000F18AC((uint64_t)self);
  }
  self->currentOrd_ = a3;
  int64_t v7 = a3 & 0xF;
  if (v7)
  {
    uint64_t v8 = self->input_;
    if (v8)
    {
      offsets = self->offsets_;
      if (offsets)
      {
        uint64_t size = offsets->super.size_;
        if ((int)v7 > (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, (v7 - 1));
        }
        [(OrgApacheLuceneStoreIndexInput *)v8 seekWithLong:self->currentBlockStart_ + *(&offsets->super.size_ + (v7 - 1) + 1)];
        sub_1000F1D68((uint64_t)self, v7);
        return;
      }
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  sub_1000F1CC0((uint64_t)self);
}

- (id)term
{
  return self->term_;
}

- (int64_t)ord
{
  return self->currentOrd_;
}

- (int)docFreq
{
  int64_t v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int64_t)totalTermFreq
{
  return -1;
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  int64_t v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_CompressedBinaryDocValues_CompressedBinaryTermsEnum;
  [(OrgApacheLuceneIndexTermsEnum *)&v3 dealloc];
}

@end