@interface OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTerms
- (BOOL)hasFreqs;
- (BOOL)hasOffsets;
- (BOOL)hasPayloads;
- (BOOL)hasPositions;
- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTerms)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsReader:(id)a3 withInt:(int)a4 withInt:(int)a5 withIntArray:(id)a6 withIntArray:(id)a7 withIntArray:(id)a8 withIntArray:(id)a9 withIntArray:(id)a10 withIntArray:(id)a11 withIntArray:(id)a12 withIntArray:(id)a13 withOrgApacheLuceneUtilBytesRef:(id)a14 withOrgApacheLuceneUtilBytesRef:(id)a15;
- (id)iterator;
- (int)getDocCount;
- (int64_t)getSumDocFreq;
- (int64_t)getSumTotalTermFreq;
- (int64_t)size;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTerms

- (OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTerms)initWithOrgApacheLuceneCodecsCompressingCompressingTermVectorsReader:(id)a3 withInt:(int)a4 withInt:(int)a5 withIntArray:(id)a6 withIntArray:(id)a7 withIntArray:(id)a8 withIntArray:(id)a9 withIntArray:(id)a10 withIntArray:(id)a11 withIntArray:(id)a12 withIntArray:(id)a13 withOrgApacheLuceneUtilBytesRef:(id)a14 withOrgApacheLuceneUtilBytesRef:(id)a15
{
  return self;
}

- (id)iterator
{
  v3 = [OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum alloc];
  sub_100089BFC((uint64_t)v3);
  v4 = v3;
  termBytes = self->termBytes_;
  if (!termBytes) {
    JreThrowNullPointerException();
  }
  v6 = v4;
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTermsEnum *)v4 resetWithInt:self->numTerms_ withInt:self->flags_ withIntArray:self->prefixLengths_ withIntArray:self->suffixLengths_ withIntArray:self->termFreqs_ withIntArray:self->positionIndex_ withIntArray:self->positions_ withIntArray:self->startOffsets_ withIntArray:self->lengths_ withIntArray:self->payloadIndex_ withOrgApacheLuceneUtilBytesRef:self->payloadBytes_ withOrgApacheLuceneStoreByteArrayDataInput:new_OrgApacheLuceneStoreByteArrayDataInput_initWithByteArray_withInt_withInt_((uint64_t)termBytes->bytes_, termBytes->offset_, termBytes->length_)];
  return v6;
}

- (int64_t)size
{
  return self->numTerms_;
}

- (int64_t)getSumTotalTermFreq
{
  return -1;
}

- (int64_t)getSumDocFreq
{
  return self->numTerms_;
}

- (int)getDocCount
{
  return 1;
}

- (BOOL)hasFreqs
{
  return 1;
}

- (BOOL)hasOffsets
{
  return (LOBYTE(self->flags_) >> 1) & 1;
}

- (BOOL)hasPositions
{
  return self->flags_ & 1;
}

- (BOOL)hasPayloads
{
  return (LOBYTE(self->flags_) >> 2) & 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTerms;
  [(OrgApacheLuceneCodecsCompressingCompressingTermVectorsReader_TVTerms *)&v3 dealloc];
}

@end