@interface OrgApacheLuceneUtilFstBytesStore_$2
- (BOOL)reversed;
- (OrgApacheLuceneUtilFstBytesStore_$2)initWithOrgApacheLuceneUtilFstBytesStore:(id)a3;
- (char)readByte;
- (int64_t)getPosition;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setPositionWithLong:(int64_t)a3;
- (void)skipBytesWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneUtilFstBytesStore_$2

- (char)readByte
{
  uint64_t nextRead = self->nextRead_;
  if (nextRead == -1)
  {
    blocks = self->this$0_->blocks_;
    if (!blocks) {
      goto LABEL_8;
    }
    --self->nextBuffer_;
    JreStrongAssign((id *)&self->current_, -[JavaUtilList getWithInt:](blocks, "getWithInt:"));
    uint64_t nextRead = (self->this$0_->blockSize_ - 1);
    self->nextRead_ = nextRead;
  }
  current = self->current_;
  if (!current) {
LABEL_8:
  }
    JreThrowNullPointerException();
  self->nextRead_ = nextRead - 1;
  uint64_t size = current->super.size_;
  if ((nextRead & 0x80000000) != 0 || (int)nextRead >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, nextRead);
  }
  return *((unsigned char *)&current->super.size_ + (int)nextRead + 4);
}

- (void)skipBytesWithLong:(int64_t)a3
{
  v4 = (char *)[(OrgApacheLuceneUtilFstBytesStore_$2 *)self getPosition] - a3;
  [(OrgApacheLuceneUtilFstBytesStore_$2 *)self setPositionWithLong:v4];
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a5 >= 1)
  {
    uint64_t v5 = *(void *)&a4;
    uint64_t v8 = a5;
    do
    {
      unsigned __int8 v9 = [(OrgApacheLuceneUtilFstBytesStore_$2 *)self readByte];
      if (!a3) {
        JreThrowNullPointerException();
      }
      unsigned __int8 v10 = v9;
      uint64_t v11 = *((unsigned int *)a3 + 2);
      if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v5);
      }
      *((unsigned char *)a3 + (int)v5 + 12) = v10;
      uint64_t v5 = (v5 + 1);
      --v8;
    }
    while (v8);
  }
}

- (int64_t)getPosition
{
  uint64_t blockSize = self->this$0_->blockSize_;
  return blockSize + (int)blockSize * (uint64_t)self->nextBuffer_ + self->nextRead_;
}

- (void)setPositionWithLong:(int64_t)a3
{
  int v3 = a3;
  self->nextBuffer_ = (a3 >> self->this$0_->blockBits_) - 1;
  blocks = self->this$0_->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  JreStrongAssign((id *)&self->current_, -[JavaUtilList getWithInt:](blocks, "getWithInt:"));
  self->nextRead_ = self->this$0_->blockMask_ & v3;
}

- (BOOL)reversed
{
  return 1;
}

- (OrgApacheLuceneUtilFstBytesStore_$2)initWithOrgApacheLuceneUtilFstBytesStore:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstBytesStore__2;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

@end