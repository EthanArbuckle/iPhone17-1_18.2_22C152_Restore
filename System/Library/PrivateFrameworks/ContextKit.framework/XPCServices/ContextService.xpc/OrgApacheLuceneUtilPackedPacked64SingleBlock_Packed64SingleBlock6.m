@interface OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock6
- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock6)initWithInt:(int)a3;
- (int64_t)getWithInt:(int)a3;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock6

- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock6)initWithInt:(int)a3
{
  return self;
}

- (int64_t)getWithInt:(int)a3
{
  blocks = self->super.blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  uint64_t size = blocks->super.size_;
  if (a3 < -9 || a3 / 10 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 / 10));
  }
  return ((unint64_t)blocks->buffer_[a3 / 10] >> (2 * ((3 * (a3 % 10)) & 0x1Fu))) & 0x3F;
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  int v4 = a3 / 10;
  blocks = self->super.blocks_;
  uint64_t v6 = a3 / 10;
  uint64_t size = blocks->super.size_;
  if (a3 < -9 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  uint64_t v8 = blocks->super.size_;
  if ((int)v6 >= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v8, v6);
  }
  char v9 = 2 * ((3 * (a3 % 10)) & 0x1F);
  blocks->buffer_[v6] = blocks->buffer_[v6] & ~(63 << v9) | (a4 << v9);
}

@end