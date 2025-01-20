@interface OrgApacheLuceneUtilPagedBytes
+ (void)initialize;
- (OrgApacheLuceneUtilPagedBytes)initWithInt:(int)a3;
- (id)freezeWithBoolean:(BOOL)a3;
- (id)getDataInput;
- (id)getDataOutput;
- (int64_t)copyUsingLengthPrefixWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (int64_t)getPointer;
- (int64_t)ramBytesUsed;
- (void)addBlockWithByteArray:(id)a3;
- (void)copy__WithOrgApacheLuceneStoreIndexInput:(id)a3 withLong:(int64_t)a4;
- (void)copy__WithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPagedBytes

- (OrgApacheLuceneUtilPagedBytes)initWithInt:(int)a3
{
  return self;
}

- (void)addBlockWithByteArray:(id)a3
{
  sub_10013A31C((uint64_t)self, a3, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)copy__WithOrgApacheLuceneStoreIndexInput:(id)a3 withLong:(int64_t)a4
{
  if (a4 >= 1)
  {
    int64_t v8 = a4;
    p_currentBlock = (void **)&self->currentBlock_;
    int blockSize = self->blockSize_;
    uint64_t upto = self->upto_;
    while (1)
    {
      int v14 = blockSize - upto;
      if (blockSize == upto)
      {
        if (*p_currentBlock)
        {
          sub_10013A31C((uint64_t)self, *p_currentBlock, (uint64_t)a3, upto, v4, v5, v6, v7);
          int blockSize = self->blockSize_;
        }
        JreStrongAssignAndConsume(p_currentBlock, +[IOSByteArray newArrayWithLength:blockSize]);
        uint64_t upto = 0;
        self->upto_ = 0;
        int v14 = self->blockSize_;
      }
      if (v8 <= v14) {
        break;
      }
      if (!a3) {
        goto LABEL_14;
      }
      uint64_t v15 = v14;
      [a3 readBytesWithByteArray:self->currentBlock_ withInt:upto withInt:v14 withBoolean:0];
      uint64_t upto = self->blockSize_;
      self->upto_ = upto;
      v8 -= v15;
      int blockSize = upto;
      if (v8 <= 0) {
        return;
      }
    }
    if (!a3) {
LABEL_14:
    }
      JreThrowNullPointerException();
    [a3 readBytesWithByteArray:self->currentBlock_ withInt:upto withInt:v8 withBoolean:0];
    self->upto_ += v8;
  }
}

- (void)copy__WithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  if (!a3) {
LABEL_9:
  }
    JreThrowNullPointerException();
  p_currentBlock = &self->currentBlock_;
  currentBlock = self->currentBlock_;
  int blockSize = self->blockSize_;
  if (*((_DWORD *)a3 + 5) <= blockSize - self->upto_)
  {
    if (currentBlock) {
      goto LABEL_7;
    }
  }
  else if (currentBlock)
  {
    sub_10013A31C((uint64_t)self, currentBlock, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
    self->didSkipBytes_ = 1;
    int blockSize = self->blockSize_;
  }
  JreStrongAssignAndConsume((id *)p_currentBlock, +[IOSByteArray newArrayWithLength:blockSize]);
  self->upto_ = 0;
LABEL_7:
  if (!a4) {
    goto LABEL_9;
  }
  JreStrongAssign((id *)a4 + 1, self->currentBlock_);
  *((_DWORD *)a4 + 4) = self->upto_;
  *((_DWORD *)a4 + 5) = *((_DWORD *)a3 + 5);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 1), *((unsigned int *)a3 + 4), self->currentBlock_, self->upto_, *((unsigned int *)a3 + 5));
  self->upto_ += *((_DWORD *)a3 + 5);
}

- (id)freezeWithBoolean:(BOOL)a3
{
  if (self->frozen_)
  {
    CFStringRef v13 = @"already frozen";
    goto LABEL_13;
  }
  if (self->didSkipBytes_)
  {
    CFStringRef v13 = @"cannot freeze when copy(BytesRef, BytesRef) was used";
LABEL_13:
    int v14 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v14);
  }
  if (a3)
  {
    *(void *)&a3 = self->upto_;
    if (a3 < self->blockSize_)
    {
      v9 = +[IOSByteArray arrayWithLength:](IOSByteArray, "arrayWithLength:");
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->currentBlock_, 0, v9, 0, self->upto_);
      JreStrongAssign((id *)&self->currentBlock_, v9);
    }
  }
  currentBlock = self->currentBlock_;
  if (!currentBlock)
  {
    JreStrongAssign((id *)&self->currentBlock_, (void *)qword_100560680);
    currentBlock = self->currentBlock_;
  }
  sub_10013A31C((uint64_t)self, currentBlock, a3, v3, v4, v5, v6, v7);
  self->frozen_ = 1;
  JreStrongAssign((id *)&self->currentBlock_, 0);
  v11 = [OrgApacheLuceneUtilPagedBytes_Reader alloc];
  sub_10013ACF8((uint64_t)v11, (uint64_t)self);
  return v11;
}

- (int64_t)getPointer
{
  if (self->currentBlock_) {
    return self->upto_ + self->blockSize_ * (uint64_t)self->numBlocks_;
  }
  else {
    return 0;
  }
}

- (int64_t)ramBytesUsed
{
  uint64_t v3 = qword_100560688;
  int64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)self->blocks_) + v3;
  int numBlocks = self->numBlocks_;
  uint64_t v6 = (numBlocks - 1);
  if (numBlocks >= 1)
  {
    blocks = self->blocks_;
    if (!blocks) {
      JreThrowNullPointerException();
    }
    int64_t v8 = v4 + self->bytesUsedPerBlock_ * v6;
    uint64_t size = blocks->super.size_;
    if (numBlocks > (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, (numBlocks - 1));
    }
    int64_t v4 = v8 + OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithByteArray_((uint64_t)(&blocks->elementType_)[v6]);
  }
  currentBlock = self->currentBlock_;
  if (currentBlock) {
    v4 += OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithByteArray_((uint64_t)currentBlock);
  }
  return v4;
}

- (int64_t)copyUsingLengthPrefixWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    goto LABEL_18;
  }
  int v9 = *((_DWORD *)a3 + 5);
  if (v9 >= 0x8000)
  {
    CFStringRef v23 = JreStrcat("$IC", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, @"max length is 32767 (got ");
    goto LABEL_23;
  }
  int blockSize = self->blockSize_;
  if (v9 + 2 + self->upto_ <= blockSize) {
    goto LABEL_8;
  }
  if (v9 + 2 > blockSize)
  {
    CFStringRef v23 = JreStrcat("$I$I$", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, @"block size ");
LABEL_23:
    v24 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v23);
    objc_exception_throw(v24);
  }
  currentBlock = self->currentBlock_;
  if (currentBlock)
  {
    sub_10013A31C((uint64_t)self, currentBlock, (uint64_t)a3, v3, v4, v5, v6, v7);
    int blockSize = self->blockSize_;
  }
  JreStrongAssignAndConsume((id *)&self->currentBlock_, +[IOSByteArray newArrayWithLength:blockSize]);
  self->upto_ = 0;
LABEL_8:
  int64_t v13 = [(OrgApacheLuceneUtilPagedBytes *)self getPointer];
  int v14 = *((_DWORD *)a3 + 5);
  if (v14 <= 127)
  {
    uint64_t v15 = self->currentBlock_;
    if (v15)
    {
      uint64_t upto = self->upto_;
      self->upto_ = upto + 1;
      goto LABEL_15;
    }
LABEL_18:
    JreThrowNullPointerException();
  }
  v17 = self->currentBlock_;
  if (!v17) {
    goto LABEL_18;
  }
  unsigned int v18 = (v14 >> 8) | 0xFFFFFF80;
  int v19 = self->upto_;
  self->upto_ = v19 + 1;
  uint64_t size = v17->super.size_;
  if (v19 < 0 || v19 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v19);
  }
  *((unsigned char *)&v17->super.size_ + v19 + 4) = v18;
  int v14 = *((_DWORD *)a3 + 5);
  uint64_t v15 = self->currentBlock_;
  uint64_t upto = self->upto_;
  self->upto_ = upto + 1;
LABEL_15:
  uint64_t v21 = v15->super.size_;
  if ((upto & 0x80000000) != 0 || (int)upto >= (int)v21) {
    IOSArray_throwOutOfBoundsWithMsg(v21, upto);
  }
  *((unsigned char *)&v15->super.size_ + (int)upto + 4) = v14;
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 1), *((unsigned int *)a3 + 4), self->currentBlock_, self->upto_, *((unsigned int *)a3 + 5));
  self->upto_ += *((_DWORD *)a3 + 5);
  return v13;
}

- (id)getDataInput
{
  if (!self->frozen_)
  {
    uint64_t v5 = new_JavaLangIllegalStateException_initWithNSString_(@"must call freeze() before getDataInput");
    objc_exception_throw(v5);
  }
  uint64_t v3 = [OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput alloc];
  OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput_initWithOrgApacheLuceneUtilPagedBytes_((uint64_t)v3, self);
  return v3;
}

- (id)getDataOutput
{
  if (self->frozen_)
  {
    uint64_t v4 = new_JavaLangIllegalStateException_initWithNSString_(@"cannot get DataOutput after freeze()");
    objc_exception_throw(v4);
  }
  v2 = new_OrgApacheLuceneUtilPagedBytes_PagedBytesDataOutput_initWithOrgApacheLuceneUtilPagedBytes_(self);
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPagedBytes;
  [(OrgApacheLuceneUtilPagedBytes *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneUtilPagedBytes_class_();
    qword_100560688 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    JreStrongAssignAndConsume((id *)&qword_100560680, +[IOSByteArray newArrayWithLength:0]);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilPagedBytes__initialized);
  }
}

@end