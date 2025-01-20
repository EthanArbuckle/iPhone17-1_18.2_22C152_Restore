@interface OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock8
- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock8)initWithInt:(int)a3;
- (int64_t)getWithInt:(int)a3;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock8

- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock8)initWithInt:(int)a3
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
  if ((int)(a3 >> 3) >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 3);
  }
  return ((unint64_t)blocks->buffer_[a3 >> 3] >> (8 * (a3 & 7u)));
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  blocks = self->super.blocks_;
  uint64_t v5 = a3 >> 3;
  uint64_t size = blocks->super.size_;
  if ((int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 3);
  }
  uint64_t v7 = blocks->super.size_;
  if ((int)v5 >= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(v7, a3 >> 3);
  }
  blocks->buffer_[v5] = blocks->buffer_[v5] & ~(255 << (8 * (a3 & 7u))) | (a4 << (8 * (a3 & 7u)));
}

@end