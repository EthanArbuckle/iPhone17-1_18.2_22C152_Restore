@interface OrgApacheLuceneUtilPagedBytes_PagedBytesDataOutput
- (OrgApacheLuceneUtilPagedBytes_PagedBytesDataOutput)initWithOrgApacheLuceneUtilPagedBytes:(id)a3;
- (int64_t)getPosition;
- (void)dealloc;
- (void)writeByteWithByte:(char)a3;
- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilPagedBytes_PagedBytesDataOutput

- (void)writeByteWithByte:(char)a3
{
  v10 = self->this$0_;
  int upto = v10->upto_;
  if (upto == v10->blockSize_)
  {
    currentBlock = v10->currentBlock_;
    if (currentBlock)
    {
      sub_10013A31C((uint64_t)v10, currentBlock, a3, v3, v4, v5, v6, v7);
      v10 = self->this$0_;
      int upto = v10->blockSize_;
    }
    JreStrongAssignAndConsume((id *)&v10->currentBlock_, +[IOSByteArray newArrayWithLength:upto]);
    self->this$0_->upto_ = 0;
    v10 = self->this$0_;
  }
  v13 = v10->currentBlock_;
  if (!v13) {
    JreThrowNullPointerException();
  }
  int v14 = v10->upto_;
  v10->upto_ = v14 + 1;
  uint64_t size = v13->super.size_;
  if (v14 < 0 || v14 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v14);
  }
  *((unsigned char *)&v13->super.size_ + v14 + 4) = a3;
}

- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a5)
  {
    uint64_t v8 = *(void *)&a5;
    uint64_t v9 = *(void *)&a4;
    v12 = self->this$0_;
    uint64_t upto = v12->upto_;
    int blockSize = v12->blockSize_;
    if (upto == blockSize)
    {
      currentBlock = v12->currentBlock_;
      if (currentBlock)
      {
        sub_10013A31C((uint64_t)v12, currentBlock, (uint64_t)a3, upto, *(uint64_t *)&a5, v5, v6, v7);
        v12 = self->this$0_;
        LODWORD(upto) = v12->blockSize_;
      }
      JreStrongAssignAndConsume((id *)&v12->currentBlock_, +[IOSByteArray newArrayWithLength:(int)upto]);
      self->this$0_->upto_ = 0;
      v12 = self->this$0_;
      int blockSize = v12->blockSize_;
      uint64_t upto = v12->upto_;
    }
    uint64_t v16 = (blockSize - upto);
    if ((int)v16 < (int)v8)
    {
      int v17 = v8 + v9;
      do
      {
        JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v9, v12->currentBlock_, upto, v16);
        sub_10013A31C((uint64_t)self->this$0_, self->this$0_->currentBlock_, v18, v19, v20, v21, v22, v23);
        JreStrongAssignAndConsume((id *)&self->this$0_->currentBlock_, +[IOSByteArray newArrayWithLength:self->this$0_->blockSize_]);
        self->this$0_->upto_ = 0;
        uint64_t v9 = (v16 + v9);
        uint64_t v8 = (v17 - v9);
        v12 = self->this$0_;
        uint64_t upto = v12->upto_;
        uint64_t v16 = (v12->blockSize_ - upto);
      }
      while ((int)v16 < (int)v8);
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v9, v12->currentBlock_, upto, v8);
    self->this$0_->upto_ += v8;
  }
}

- (int64_t)getPosition
{
  return [(OrgApacheLuceneUtilPagedBytes *)self->this$0_ getPointer];
}

- (OrgApacheLuceneUtilPagedBytes_PagedBytesDataOutput)initWithOrgApacheLuceneUtilPagedBytes:(id)a3
{
  JreStrongAssign((id *)&self->this$0_, a3);
  OrgApacheLuceneStoreDataOutput_init(self, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPagedBytes_PagedBytesDataOutput;
  [(OrgApacheLuceneStoreDataOutput *)&v3 dealloc];
}

@end