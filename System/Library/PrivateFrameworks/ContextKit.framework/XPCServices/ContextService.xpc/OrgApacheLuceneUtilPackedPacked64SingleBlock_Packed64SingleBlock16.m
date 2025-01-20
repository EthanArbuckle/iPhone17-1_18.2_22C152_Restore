@interface OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock16
- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock16)initWithInt:(int)a3;
- (int64_t)getWithInt:(int)a3;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock16

- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock16)initWithInt:(int)a3
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
  if ((int)(a3 >> 2) >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 2);
  }
  return (unsigned __int16)((unint64_t)blocks->buffer_[a3 >> 2] >> (16 * (a3 & 3u)));
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  blocks = self->super.blocks_;
  uint64_t v5 = a3 >> 2;
  uint64_t size = blocks->super.size_;
  if ((int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 2);
  }
  uint64_t v7 = blocks->super.size_;
  if ((int)v5 >= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(v7, a3 >> 2);
  }
  blocks->buffer_[v5] = blocks->buffer_[v5] & ~(0xFFFFLL << (16 * (a3 & 3u))) | (a4 << (16 * (a3 & 3u)));
}

@end