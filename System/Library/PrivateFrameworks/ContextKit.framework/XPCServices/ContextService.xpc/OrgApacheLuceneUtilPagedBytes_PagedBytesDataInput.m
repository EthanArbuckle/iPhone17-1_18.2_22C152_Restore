@interface OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput
- (OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput)initWithOrgApacheLuceneUtilPagedBytes:(id)a3;
- (char)readByte;
- (id)clone;
- (id)nextBlock;
- (int64_t)getPosition;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setPositionWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput

- (OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput)initWithOrgApacheLuceneUtilPagedBytes:(id)a3
{
  return self;
}

- (id)clone
{
  id v3 = [(OrgApacheLuceneUtilPagedBytes *)self->this$0_ getDataInput];
  if (!v3) {
    JreThrowNullPointerException();
  }
  v4 = v3;
  objc_msgSend(v3, "setPositionWithLong:", -[OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput getPosition](self, "getPosition"));
  return v4;
}

- (int64_t)getPosition
{
  return self->currentBlockUpto_ + self->this$0_->blockSize_ * (uint64_t)self->currentBlockIndex_;
}

- (void)setPositionWithLong:(int64_t)a3
{
  int64_t v3 = a3 >> self->this$0_->blockBits_;
  self->currentBlockIndex_ = v3;
  blocks = self->this$0_->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  int v5 = a3;
  uint64_t size = blocks->super.size_;
  if ((v3 & 0x80000000) != 0 || (int)size <= (int)v3) {
    IOSArray_throwOutOfBoundsWithMsg(size, v3);
  }
  JreStrongAssign((id *)&self->currentBlock_, (&blocks->elementType_)[(int)v3]);
  self->currentBlockUpto_ = self->this$0_->blockMask_ & v5;
}

- (char)readByte
{
  if (self->currentBlockUpto_ == self->this$0_->blockSize_) {
    -[OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput nextBlock]_0((uint64_t)self);
  }
  currentBlock = self->currentBlock_;
  if (!currentBlock) {
    JreThrowNullPointerException();
  }
  int currentBlockUpto = self->currentBlockUpto_;
  self->currentBlockUpto_ = currentBlockUpto + 1;
  uint64_t size = currentBlock->super.size_;
  if (currentBlockUpto < 0 || currentBlockUpto >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, currentBlockUpto);
  }
  return *((unsigned char *)&currentBlock->super.size_ + currentBlockUpto + 4);
}

- (id)nextBlock
{
  *(void *)(a1 + 24) = (*(_DWORD *)(a1 + 24) + 1);
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  if (!v1) {
    JreThrowNullPointerException();
  }
  int v3 = *(_DWORD *)(a1 + 24);
  uint64_t v4 = *(unsigned int *)(v1 + 8);
  if (v3 < 0 || v3 >= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(v4, v3);
  }
  int v5 = *(void **)(v1 + 24 + 8 * v3);
  return JreStrongAssign((id *)(a1 + 32), v5);
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t currentBlockUpto = self->currentBlockUpto_;
  uint64_t v10 = (self->this$0_->blockSize_ - currentBlockUpto);
  if ((int)v10 < a5)
  {
    int v11 = a5 + a4;
    do
    {
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->currentBlock_, currentBlockUpto, a3, v6, v10);
      -[OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput nextBlock]_0((uint64_t)self);
      uint64_t v6 = (v10 + v6);
      uint64_t currentBlockUpto = self->currentBlockUpto_;
      uint64_t v10 = (self->this$0_->blockSize_ - currentBlockUpto);
      uint64_t v5 = (v11 - v6);
    }
    while ((int)v10 < (int)v5);
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->currentBlock_, currentBlockUpto, a3, v6, v5);
  self->currentBlockUpto_ += v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPagedBytes_PagedBytesDataInput;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

@end