@interface OrgApacheLuceneUtilBytesRefHash
- (BOOL)equalsWithInt:(int)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (BOOL)shrinkWithInt:(int)a3;
- (OrgApacheLuceneUtilBytesRefHash)init;
- (OrgApacheLuceneUtilBytesRefHash)initWithOrgApacheLuceneUtilByteBlockPool:(id)a3;
- (OrgApacheLuceneUtilBytesRefHash)initWithOrgApacheLuceneUtilByteBlockPool:(id)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefHash_BytesStartArray:(id)a5;
- (id)compact;
- (id)getWithInt:(int)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (id)sortWithJavaUtilComparator:(id)a3;
- (int)addByPoolOffsetWithInt:(int)a3;
- (int)addWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (int)byteStartWithInt:(int)a3;
- (int)doHashWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)findHashWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (int)findWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (int)size;
- (void)clear;
- (void)clearWithBoolean:(BOOL)a3;
- (void)close;
- (void)dealloc;
- (void)rehashWithInt:(int)a3 withBoolean:(BOOL)a4;
- (void)reinit;
@end

@implementation OrgApacheLuceneUtilBytesRefHash

- (OrgApacheLuceneUtilBytesRefHash)init
{
  return self;
}

- (OrgApacheLuceneUtilBytesRefHash)initWithOrgApacheLuceneUtilByteBlockPool:(id)a3
{
  return self;
}

- (OrgApacheLuceneUtilBytesRefHash)initWithOrgApacheLuceneUtilByteBlockPool:(id)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefHash_BytesStartArray:(id)a5
{
  return self;
}

- (int)size
{
  return self->count_;
}

- (id)getWithInt:(int)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  pool = self->pool_;
  if (!pool) {
    JreThrowNullPointerException();
  }
  bytesStart = self->bytesStart_;
  uint64_t size = bytesStart->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  [(OrgApacheLuceneUtilByteBlockPool *)pool setBytesRefWithOrgApacheLuceneUtilBytesRef:a4 withInt:*((unsigned int *)&bytesStart->super.size_ + a3 + 1)];
  return a4;
}

- (id)compact
{
  if (self->hashSize_ >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    do
    {
      ids = self->ids_;
      if (!ids) {
        JreThrowNullPointerException();
      }
      uint64_t size = ids->super.size_;
      if (v3 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v3);
      }
      if (*(&ids->super.size_ + v3 + 1) != -1)
      {
        if (v3 > (int)v4)
        {
          v7 = self->ids_;
          uint64_t v8 = v7->super.size_;
          if (v3 >= v8) {
            IOSArray_throwOutOfBoundsWithMsg(v8, v3);
          }
          int v9 = *(&v7->super.size_ + v3 + 1);
          if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)v8) {
            IOSArray_throwOutOfBoundsWithMsg(v8, v4);
          }
          *(&self->ids_->super.size_ + (int)v4 + 1) = v9;
          v10 = self->ids_;
          uint64_t v11 = v10->super.size_;
          if (v3 >= v11) {
            IOSArray_throwOutOfBoundsWithMsg(v11, v3);
          }
          *(&v10->super.size_ + v3 + 1) = -1;
        }
        uint64_t v4 = (v4 + 1);
      }
      ++v3;
    }
    while (v3 < self->hashSize_);
  }
  self->lastCount_ = self->count_;
  return self->ids_;
}

- (id)sortWithJavaUtilComparator:(id)a3
{
  id v5 = [(OrgApacheLuceneUtilBytesRefHash *)self compact];
  v6 = [OrgApacheLuceneUtilBytesRefHash__1 alloc];
  sub_100134600((id *)&v6->super.super.super.isa, self, v5, a3);
  [(OrgApacheLuceneUtilIntroSorter *)v6 sortWithInt:0 withInt:self->count_];
  return v5;
}

- (BOOL)equalsWithInt:(int)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return sub_100132D64(self, *(uint64_t *)&a3, (uint64_t)a4);
}

- (BOOL)shrinkWithInt:(int)a3
{
  return sub_100132E1C((uint64_t)self, a3);
}

- (void)clearWithBoolean:(BOOL)a3
{
  int count = self->count_;
  self->count_ = 0;
  self->lastCount_ = count;
  if (a3)
  {
    pool = self->pool_;
    if (!pool) {
      goto LABEL_10;
    }
    [(OrgApacheLuceneUtilByteBlockPool *)pool resetWithBoolean:0 withBoolean:0];
  }
  bytesStartArray = self->bytesStartArray_;
  if (!bytesStartArray) {
LABEL_10:
  }
    JreThrowNullPointerException();
  JreStrongAssign((id *)&self->bytesStart_, [(OrgApacheLuceneUtilBytesRefHash_BytesStartArray *)bytesStartArray clear]);
  signed int lastCount = self->lastCount_;
  if (lastCount == -1 || !sub_100132E1C((uint64_t)self, lastCount))
  {
    ids = self->ids_;
    JavaUtilArrays_fillWithIntArray_withInt_((uint64_t)ids, -1);
  }
}

- (void)clear
{
}

- (void)close
{
  [(OrgApacheLuceneUtilBytesRefHash *)self clearWithBoolean:1];
  JreStrongAssign((id *)&self->ids_, 0);
  bytesUsed = self->bytesUsed_;
  if (!bytesUsed) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = -4 * self->hashSize_;
  [(OrgApacheLuceneUtilCounter *)bytesUsed addAndGetWithLong:v4];
}

- (int)addWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    goto LABEL_35;
  }
  uint64_t v5 = *((unsigned int *)a3 + 5);
  uint64_t v6 = sub_1001333A0((uint64_t)self, (uint64_t)a3);
  ids = self->ids_;
  if (!ids) {
    goto LABEL_35;
  }
  uint64_t v15 = v6;
  uint64_t v16 = (int)v6;
  uint64_t size = ids->super.size_;
  if ((v15 & 0x80000000) != 0 || (int)v15 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v15);
  }
  int v18 = *(&ids->super.size_ + v16 + 1);
  if (v18 != -1)
  {
    LODWORD(count) = ~v18;
    return count;
  }
  pool = self->pool_;
  if (!pool) {
    goto LABEL_35;
  }
  int v21 = *((_DWORD *)a3 + 5);
  uint64_t byteUpto = pool->byteUpto_;
  if ((int)byteUpto + v21 + 2 > 0x8000)
  {
    if (v21 + 2 > 0x8000)
    {
      CFStringRef v38 = JreStrcat("$I$I", v7, v8, v9, v10, v11, v12, v13, @"bytes can be at most ");
      v39 = new_OrgApacheLuceneUtilBytesRefHash_MaxBytesLengthExceededException_initWithNSString_((uint64_t)v38);
      objc_exception_throw(v39);
    }
    [(OrgApacheLuceneUtilByteBlockPool *)pool nextBuffer];
    pool = self->pool_;
    uint64_t byteUpto = pool->byteUpto_;
  }
  bytesStart = self->bytesStart_;
  if (!bytesStart) {
    goto LABEL_35;
  }
  buffer = (unsigned int *)pool->buffer_;
  uint64_t count = self->count_;
  if ((int)count >= bytesStart->super.size_)
  {
    bytesStartArray = self->bytesStartArray_;
    if (!bytesStartArray) {
      goto LABEL_35;
    }
    JreStrongAssign((id *)&self->bytesStart_, [(OrgApacheLuceneUtilBytesRefHash_BytesStartArray *)bytesStartArray grow]);
    uint64_t count = self->count_;
    v27 = self->pool_;
    bytesStart = self->bytesStart_;
    self->count_ = count + 1;
    if (!bytesStart) {
      goto LABEL_35;
    }
    p_byteOffset = &v27->byteOffset_;
  }
  else
  {
    self->count_ = count + 1;
    p_byteOffset = &pool->byteOffset_;
  }
  uint64_t v28 = bytesStart->super.size_;
  if ((count & 0x80000000) != 0 || (int)count >= (int)v28) {
    IOSArray_throwOutOfBoundsWithMsg(v28, count);
  }
  *(&bytesStart->super.size_ + (int)count + 1) = *p_byteOffset + byteUpto;
  if ((int)v5 > 127)
  {
    if (buffer)
    {
      uint64_t v33 = buffer[2];
      if ((byteUpto & 0x80000000) != 0 || (int)byteUpto >= (int)v33) {
        IOSArray_throwOutOfBoundsWithMsg(v33, byteUpto);
      }
      *((unsigned char *)buffer + (int)byteUpto + 12) = v5 | 0x80;
      unsigned int v32 = v5 >> 7;
      uint64_t v34 = buffer[2];
      int v31 = byteUpto + 1;
      if ((int)byteUpto + 1 < 0 || v31 >= (int)v34) {
        IOSArray_throwOutOfBoundsWithMsg(v34, v31);
      }
      int v30 = 2;
      goto LABEL_30;
    }
LABEL_35:
    JreThrowNullPointerException();
  }
  if (!buffer) {
    goto LABEL_35;
  }
  uint64_t v29 = buffer[2];
  if ((byteUpto & 0x80000000) != 0 || (int)byteUpto >= (int)v29) {
    IOSArray_throwOutOfBoundsWithMsg(v29, byteUpto);
  }
  int v30 = 1;
  int v31 = byteUpto;
  LOBYTE(v32) = v5;
LABEL_30:
  *((unsigned char *)buffer + v31 + 12) = v32;
  self->pool_->byteUpto_ += v5 + v30;
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 1), *((unsigned int *)a3 + 4), buffer, (byteUpto + v30), v5);
  v35 = self->ids_;
  uint64_t v36 = v35->super.size_;
  if ((v15 & 0x80000000) != 0 || (int)v15 >= (int)v36) {
    IOSArray_throwOutOfBoundsWithMsg(v36, v15);
  }
  *(&v35->super.size_ + v16 + 1) = count;
  if (self->count_ == self->hashHalfSize_) {
    sub_100133520((uint64_t)self, 2 * self->hashSize_, 1);
  }
  return count;
}

- (int)findWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  ids = self->ids_;
  if (!ids) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = sub_1001333A0((uint64_t)self, (uint64_t)a3);
  uint64_t size = ids->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  return *(&ids->super.size_ + (int)v4 + 1);
}

- (int)findHashWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  return sub_1001333A0((uint64_t)self, (uint64_t)a3);
}

- (int)addByPoolOffsetWithInt:(int)a3
{
  ids = self->ids_;
  if (!ids) {
    goto LABEL_34;
  }
  uint64_t v6 = self->hashMask_ & a3;
  uint64_t size = ids->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  uint64_t count = *((unsigned int *)&ids->super.size_ + (int)v6 + 1);
  if (count != -1)
  {
    bytesStart = self->bytesStart_;
    if (!bytesStart) {
      goto LABEL_34;
    }
    uint64_t v10 = bytesStart->super.size_;
    if ((count & 0x80000000) != 0 || (int)count >= (int)v10) {
      IOSArray_throwOutOfBoundsWithMsg(v10, count);
    }
    int v11 = *(&bytesStart->super.size_ + (int)count + 1);
    BOOL v12 = __OFSUB__(v11, a3);
    if (v11 == a3)
    {
LABEL_9:
      LODWORD(count) = ~count;
      return count;
    }
    int v13 = a3 + 1;
    while (1)
    {
      int hashMask = self->hashMask_;
      uint64_t v6 = v13 & hashMask;
      uint64_t v15 = self->ids_;
      uint64_t v16 = v15->super.size_;
      if ((v13 & hashMask) < 0 != v12 || (int)v6 >= (int)v16) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v13 & hashMask);
      }
      uint64_t count = *((unsigned int *)&v15->super.size_ + (int)v6 + 1);
      if (count == -1) {
        break;
      }
      int v18 = self->bytesStart_;
      uint64_t v19 = v18->super.size_;
      if ((count & 0x80000000) != 0 || (int)count >= (int)v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, count);
      }
      int v20 = *(&v18->super.size_ + (int)count + 1);
      ++v13;
      BOOL v12 = __OFSUB__(v20, a3);
      if (v20 == a3) {
        goto LABEL_9;
      }
    }
  }
  int v21 = self->bytesStart_;
  if (!v21) {
LABEL_34:
  }
    JreThrowNullPointerException();
  uint64_t count = self->count_;
  if ((int)count >= v21->super.size_)
  {
    bytesStartArray = self->bytesStartArray_;
    if (bytesStartArray)
    {
      JreStrongAssign((id *)&self->bytesStart_, [(OrgApacheLuceneUtilBytesRefHash_BytesStartArray *)bytesStartArray grow]);
      uint64_t count = self->count_;
      int v21 = self->bytesStart_;
      self->count_ = count + 1;
      if (v21) {
        goto LABEL_27;
      }
    }
    goto LABEL_34;
  }
  self->count_ = count + 1;
LABEL_27:
  uint64_t v23 = v21->super.size_;
  if ((count & 0x80000000) != 0 || (int)count >= (int)v23) {
    IOSArray_throwOutOfBoundsWithMsg(v23, count);
  }
  *(&v21->super.size_ + (int)count + 1) = a3;
  v24 = self->ids_;
  uint64_t v25 = v24->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v25) {
    IOSArray_throwOutOfBoundsWithMsg(v25, v6);
  }
  *(&v24->super.size_ + (int)v6 + 1) = count;
  if (self->count_ == self->hashHalfSize_) {
    sub_100133520((uint64_t)self, 2 * self->hashSize_, 0);
  }
  return count;
}

- (void)rehashWithInt:(int)a3 withBoolean:(BOOL)a4
{
}

- (int)doHashWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return sub_100133C28((uint64_t)a3, a4, a5);
}

- (void)reinit
{
  p_bytesStart = &self->bytesStart_;
  if (!self->bytesStart_)
  {
    bytesStartArray = self->bytesStartArray_;
    if (!bytesStartArray) {
      goto LABEL_9;
    }
    JreStrongAssign((id *)p_bytesStart, [(OrgApacheLuceneUtilBytesRefHash_BytesStartArray *)bytesStartArray init]);
  }
  if (self->ids_) {
    return;
  }
  JreStrongAssignAndConsume((id *)&self->ids_, +[IOSIntArray newArrayWithLength:self->hashSize_]);
  bytesUsed = self->bytesUsed_;
  if (!bytesUsed) {
LABEL_9:
  }
    JreThrowNullPointerException();
  uint64_t v6 = 4 * self->hashSize_;
  [(OrgApacheLuceneUtilCounter *)bytesUsed addAndGetWithLong:v6];
}

- (int)byteStartWithInt:(int)a3
{
  bytesStart = self->bytesStart_;
  if (!bytesStart) {
    JreThrowNullPointerException();
  }
  uint64_t size = bytesStart->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *(&bytesStart->super.size_ + a3 + 1);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilBytesRefHash;
  [(OrgApacheLuceneUtilBytesRefHash *)&v3 dealloc];
}

@end