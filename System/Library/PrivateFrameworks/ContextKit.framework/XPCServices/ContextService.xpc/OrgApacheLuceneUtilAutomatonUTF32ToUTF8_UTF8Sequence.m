@interface OrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence
- (OrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence)init;
- (id)description;
- (int)byteAtWithInt:(int)a3;
- (int)numBitsWithInt:(int)a3;
- (void)dealloc;
- (void)setRestWithInt:(int)a3 withInt:(int)a4;
- (void)setWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence

- (OrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence)init
{
  return self;
}

- (int)byteAtWithInt:(int)a3
{
  bytes = self->bytes_;
  if (!bytes) {
    goto LABEL_6;
  }
  uint64_t size = bytes->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v5 = (&bytes->elementType_)[a3];
  if (!v5) {
LABEL_6:
  }
    JreThrowNullPointerException();
  return (int)v5[1].super.isa;
}

- (int)numBitsWithInt:(int)a3
{
  bytes = self->bytes_;
  if (!bytes) {
    goto LABEL_6;
  }
  uint64_t size = bytes->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v5 = (&bytes->elementType_)[a3];
  if (!v5) {
LABEL_6:
  }
    JreThrowNullPointerException();
  return SBYTE4(v5[1].super.isa);
}

- (void)setWithInt:(int)a3
{
}

- (void)setRestWithInt:(int)a3 withInt:(int)a4
{
}

- (id)description
{
  v3 = new_JavaLangStringBuilder_init();
  if (self->len_ >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      if (v4) {
        [(JavaLangStringBuilder *)v3 appendWithChar:32];
      }
      bytes = self->bytes_;
      if (!bytes) {
        goto LABEL_14;
      }
      uint64_t size = bytes->super.size_;
      if (v4 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v4);
      }
      v7 = (&bytes->elementType_)[v4];
      if (!v7) {
LABEL_14:
      }
        JreThrowNullPointerException();
      [(JavaLangStringBuilder *)v3 appendWithNSString:JavaLangInteger_toBinaryStringWithInt_(v7[1].super.isa)];
      ++v4;
    }
    while (v4 < self->len_);
  }
  return [(JavaLangStringBuilder *)v3 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence;
  [(OrgApacheLuceneUtilAutomatonUTF32ToUTF8_UTF8Sequence *)&v3 dealloc];
}

@end