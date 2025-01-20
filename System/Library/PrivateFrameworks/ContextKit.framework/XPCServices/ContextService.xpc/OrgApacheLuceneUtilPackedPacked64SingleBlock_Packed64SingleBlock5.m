@interface OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock5
- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock5)initWithInt:(int)a3;
- (int64_t)getWithInt:(int)a3;
- (void)setWithInt:(int)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock5

- (OrgApacheLuceneUtilPackedPacked64SingleBlock_Packed64SingleBlock5)initWithInt:(int)a3
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
  if (a3 < -11 || a3 / 12 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (a3 / 12));
  }
  return ((unint64_t)blocks->buffer_[a3 / 12] >> (5 * (a3 % 12))) & 0x1F;
}

- (void)setWithInt:(int)a3 withLong:(int64_t)a4
{
  int v4 = a3 / 12;
  blocks = self->super.blocks_;
  uint64_t v6 = a3 / 12;
  uint64_t size = blocks->super.size_;
  if (a3 < -11 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  uint64_t v8 = blocks->super.size_;
  if ((int)v6 >= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v8, v6);
  }
  blocks->buffer_[a3 / 12] = blocks->buffer_[a3 / 12] & ~(31 << (5 * (a3 % 12))) | (a4 << (5 * (a3 % 12)));
}

@end