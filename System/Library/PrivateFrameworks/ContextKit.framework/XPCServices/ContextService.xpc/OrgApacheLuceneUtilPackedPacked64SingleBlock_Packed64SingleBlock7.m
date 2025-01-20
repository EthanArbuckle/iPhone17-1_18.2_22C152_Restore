@interface OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock7
- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock7)initWithInt:(int)a3;
- (int64_t)getWithInt:(int)a3;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock7

- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock7)initWithInt:(int)a3
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
  if (a3 < -8 || a3 / 9 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 / 9));
  }
  return ((unint64_t)blocks->buffer_[a3 / 9] >> (7 * (a3 % 9))) & 0x7F;
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  int v4 = a3 / 9;
  blocks = self->super.blocks_;
  uint64_t v6 = a3 / 9;
  uint64_t size = blocks->super.size_;
  if (a3 < -8 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  uint64_t v8 = blocks->super.size_;
  if ((int)v6 >= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v8, v6);
  }
  blocks->buffer_[a3 / 9] = blocks->buffer_[a3 / 9] & ~(127 << (7 * (a3 % 9))) | (a4 << (7 * (a3 % 9)));
}

@end