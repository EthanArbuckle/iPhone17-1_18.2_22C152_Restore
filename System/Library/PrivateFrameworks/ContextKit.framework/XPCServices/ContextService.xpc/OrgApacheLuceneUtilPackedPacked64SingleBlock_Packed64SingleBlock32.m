@interface OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock32
- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock32)initWithInt:(int)a3;
- (int64_t)getWithInt:(int)a3;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock32

- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock32)initWithInt:(int)a3
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
  if ((int)(a3 >> 1) >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 1);
  }
  return ((unint64_t)blocks->buffer_[a3 >> 1] >> (32 * (a3 & 1u)));
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  blocks = self->super.blocks_;
  uint64_t v5 = a3 >> 1;
  uint64_t size = blocks->super.size_;
  if ((int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 1);
  }
  uint64_t v7 = blocks->super.size_;
  if ((int)v5 >= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(v7, a3 >> 1);
  }
  blocks->buffer_[v5] = blocks->buffer_[v5] & ~(0xFFFFFFFFLL << (32 * (a3 & 1u))) | (a4 << (32 * (a3 & 1u)));
}

@end