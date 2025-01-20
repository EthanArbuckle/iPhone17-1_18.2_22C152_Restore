@interface OrgApacheLuceneUtilPackedPackedInts_ReaderIteratorImpl
- (OrgApacheLuceneUtilPackedPackedInts_ReaderIteratorImpl)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneStoreDataInput:(id)a5;
- (int)getBitsPerValue;
- (int)size;
- (int64_t)next;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_ReaderIteratorImpl

- (OrgApacheLuceneUtilPackedPackedInts_ReaderIteratorImpl)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneStoreDataInput:(id)a5
{
  self->bitsPerValue_ = a4;
  self->valueCount_ = a3;
  return self;
}

- (int64_t)next
{
  v2 = [(OrgApacheLuceneUtilPackedPackedInts_ReaderIteratorImpl *)self nextWithInt:1];
  uint64_t v3 = v2[1];
  if (!v3) {
    JreThrowNullPointerException();
  }
  v4 = v2;
  uint64_t v5 = *((unsigned int *)v2 + 4);
  uint64_t v6 = *(unsigned int *)(v3 + 8);
  if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(v6, v5);
  }
  int64_t result = *(void *)(v3 + 16 + 8 * (int)v5);
  *((_DWORD *)v4 + 4) = v5 + 1;
  --*((_DWORD *)v4 + 5);
  return result;
}

- (int)getBitsPerValue
{
  return self->bitsPerValue_;
}

- (int)size
{
  return self->valueCount_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPackedInts_ReaderIteratorImpl;
  [(OrgApacheLuceneUtilPackedPackedInts_ReaderIteratorImpl *)&v3 dealloc];
}

@end