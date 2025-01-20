@interface OrgApacheLuceneUtilFstBytesStore_$1
- (BOOL)reversed;
- (OrgApacheLuceneUtilFstBytesStore_$1)initWithOrgApacheLuceneUtilFstBytesStore:(id)a3;
- (char)readByte;
- (int64_t)getPosition;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setPositionWithLong:(int64_t)a3;
- (void)skipBytesWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneUtilFstBytesStore_$1

- (char)readByte
{
  uint64_t nextRead = self->nextRead_;
  v4 = self->this$0_;
  if (nextRead == v4->blockSize_)
  {
    blocks = v4->blocks_;
    if (!blocks) {
      goto LABEL_8;
    }
    ++self->nextBuffer_;
    JreStrongAssign((id *)&self->current_, -[JavaUtilList getWithInt:](blocks, "getWithInt:"));
    uint64_t nextRead = 0;
    self->nextRead_ = 0;
  }
  current = self->current_;
  if (!current) {
LABEL_8:
  }
    JreThrowNullPointerException();
  self->nextRead_ = nextRead + 1;
  uint64_t size = current->super.size_;
  if ((nextRead & 0x80000000) != 0 || (int)nextRead >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, nextRead);
  }
  return *((unsigned char *)&current->super.size_ + (int)nextRead + 4);
}

- (void)skipBytesWithLong:(int64_t)a3
{
  v4 = (char *)[(OrgApacheLuceneUtilFstBytesStore_$1 *)self getPosition] + a3;
  [(OrgApacheLuceneUtilFstBytesStore_$1 *)self setPositionWithLong:v4];
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a5 >= 1)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v6 = *(void *)&a4;
    for (uint64_t i = self->nextRead_; ; uint64_t i = 0)
    {
      v10 = self->this$0_;
      uint64_t v11 = (v10->blockSize_ - i);
      if ((int)v5 <= (int)v11) {
        break;
      }
      if ((int)v11 >= 1)
      {
        JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->current_, i, a3, v6, v11);
        uint64_t v6 = (v11 + v6);
        v10 = self->this$0_;
        uint64_t v5 = (v5 - v11);
      }
      blocks = v10->blocks_;
      if (!blocks) {
        JreThrowNullPointerException();
      }
      ++self->nextBuffer_;
      JreStrongAssign((id *)&self->current_, -[JavaUtilList getWithInt:](blocks, "getWithInt:"));
      self->nextRead_ = 0;
      if ((int)v5 <= 0) {
        return;
      }
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->current_, i, a3, v6, v5);
    self->nextRead_ += v5;
  }
}

- (int64_t)getPosition
{
  return self->nextRead_ + (self->nextBuffer_ - 1) * self->this$0_->blockSize_;
}

- (void)setPositionWithLong:(int64_t)a3
{
  int v3 = a3;
  self->nextBuffer_ = (a3 >> self->this$0_->blockBits_) + 1;
  blocks = self->this$0_->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&self->current_, -[JavaUtilList getWithInt:](blocks, "getWithInt:"));
  self->nextRead_ = self->this$0_->blockMask_ & v3;
}

- (BOOL)reversed
{
  return 0;
}

- (OrgApacheLuceneUtilFstBytesStore_$1)initWithOrgApacheLuceneUtilFstBytesStore:(id)a3
{
  JreStrongAssign((id *)&self->this$0_, a3);
  OrgApacheLuceneUtilFstFST_BytesReader_init(self, v5);
  self->nextRead_ = *((_DWORD *)a3 + 6);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstBytesStore__1;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

@end