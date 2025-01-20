@interface OrgApacheLuceneCodecsMultiLevelSkipListReader_SkipBuffer
- (OrgApacheLuceneCodecsMultiLevelSkipListReader_SkipBuffer)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4;
- (char)readByte;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)getFilePointer;
- (int64_t)length;
- (void)close;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)seekWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneCodecsMultiLevelSkipListReader_SkipBuffer

- (OrgApacheLuceneCodecsMultiLevelSkipListReader_SkipBuffer)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4
{
  sub_100062968((uint64_t)self, a3, *(uint64_t *)&a4, *(uint64_t *)&a4, v4, v5, v6, v7);
  return self;
}

- (void)close
{
}

- (int64_t)getFilePointer
{
  return self->pointer_ + self->pos_;
}

- (int64_t)length
{
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  return data->super.size_;
}

- (char)readByte
{
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  self->pos_ = pos + 1;
  uint64_t size = data->super.size_;
  if (pos < 0 || pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  return *((unsigned char *)&data->super.size_ + pos + 4);
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->pos_ += a5;
}

- (void)seekWithLong:(int64_t)a3
{
  self->pos_ = a3 - LODWORD(self->pointer_);
}

- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  uint64_t v5 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsMultiLevelSkipListReader_SkipBuffer;
  [(OrgApacheLuceneStoreIndexInput *)&v3 dealloc];
}

@end