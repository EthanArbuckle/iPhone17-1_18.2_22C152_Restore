@interface OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock9
- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock9)initWithInt:(int)a3;
- (int64_t)getWithInt:(int)a3;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock9

- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock9)initWithInt:(int)a3
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
  if (a3 < -6 || a3 / 7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 / 7));
  }
  return ((unint64_t)blocks->buffer_[a3 / 7] >> (9 * (a3 % 7))) & 0x1FF;
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  int v4 = a3 / 7;
  blocks = self->super.blocks_;
  uint64_t v6 = a3 / 7;
  uint64_t size = blocks->super.size_;
  if (a3 < -6 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  uint64_t v8 = blocks->super.size_;
  if ((int)v6 >= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v8, v6);
  }
  blocks->buffer_[a3 / 7] = blocks->buffer_[a3 / 7] & ~(511 << (9 * (a3 % 7))) | (a4 << (9 * (a3 % 7)));
}

@end