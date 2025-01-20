@interface OrgApacheLuceneUtilFstForwardBytesReader
- (BOOL)reversed;
- (OrgApacheLuceneUtilFstForwardBytesReader)initWithByteArray:(id)a3;
- (char)readByte;
- (int64_t)getPosition;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setPositionWithLong:(int64_t)a3;
- (void)skipBytesWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneUtilFstForwardBytesReader

- (OrgApacheLuceneUtilFstForwardBytesReader)initWithByteArray:(id)a3
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
  self->pos_ = pos + 1;
  uint64_t size = bytes->super.size_;
  if (pos < 0 || pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  return *((unsigned char *)&bytes->super.size_ + pos + 4);
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->pos_ += a5;
}

- (void)skipBytesWithLong:(int64_t)a3
{
  self->pos_ += a3;
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
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstForwardBytesReader;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

@end