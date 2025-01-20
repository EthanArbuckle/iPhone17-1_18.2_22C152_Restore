@interface OrgApacheLuceneUtilFstReverseBytesReader
- (BOOL)reversed;
- (OrgApacheLuceneUtilFstReverseBytesReader)initWithByteArray:(id)a3;
- (char)readByte;
- (int64_t)getPosition;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setPositionWithLong:(int64_t)a3;
- (void)skipBytesWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneUtilFstReverseBytesReader

- (OrgApacheLuceneUtilFstReverseBytesReader)initWithByteArray:(id)a3
{
  return self;
}

- (char)readByte
{
  bytes = self->bytes_;
  if (!bytes) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  self->pos_ = pos - 1;
  uint64_t size = bytes->super.size_;
  if (pos < 0 || pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  return *((unsigned char *)&bytes->super.size_ + pos + 4);
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a5 >= 1)
  {
    uint64_t v5 = *(void *)&a4;
    uint64_t v7 = a5;
    do
    {
      bytes = self->bytes_;
      if (!bytes) {
        goto LABEL_14;
      }
      int pos = self->pos_;
      self->pos_ = pos - 1;
      uint64_t size = bytes->super.size_;
      if (pos < 0 || pos >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, pos);
      }
      if (!a3) {
LABEL_14:
      }
        JreThrowNullPointerException();
      uint64_t v11 = *((unsigned int *)a3 + 2);
      if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v5);
      }
      *((unsigned char *)a3 + (int)v5 + 12) = *((unsigned char *)&bytes->super.size_ + pos + 4);
      uint64_t v5 = (v5 + 1);
      --v7;
    }
    while (v7);
  }
}

- (void)skipBytesWithLong:(int64_t)a3
{
  self->pos_ -= a3;
}

- (int64_t)getPosition
{
  return self->pos_;
}

- (void)setPositionWithLong:(int64_t)a3
{
  self->pos_ = a3;
}

- (BOOL)reversed
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstReverseBytesReader;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

@end