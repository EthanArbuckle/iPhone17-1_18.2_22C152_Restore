@interface OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock21
- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock21)initWithInt:(int)a3;
- (int64_t)getWithInt:(int)a3;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock21

- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock21)initWithInt:(int)a3
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
  if (a3 < -2 || a3 / 3 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 / 3));
  }
  return ((unint64_t)blocks->buffer_[a3 / 3] >> (21 * (a3 % 3))) & 0x1FFFFF;
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  int v4 = a3 / 3;
  blocks = self->super.blocks_;
  uint64_t v6 = a3 / 3;
  uint64_t size = blocks->super.size_;
  if (a3 < -2 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  uint64_t v8 = blocks->super.size_;
  if ((int)v6 >= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v8, v6);
  }
  blocks->buffer_[a3 / 3] = blocks->buffer_[a3 / 3] & ~(0x1FFFFFLL << (21 * (a3 % 3))) | (a4 << (21 * (a3 % 3)));
}

@end