@interface ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInput
- (ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInput)initWithComAppleProactiveLuceneNSDataDirectory:(id)a3 withNSString:(id)a4;
- (char)readByte;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)getFilePointer;
- (int64_t)length;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)seekWithLong:(int64_t)a3;
@end

@implementation ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInput

- (ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInput)initWithComAppleProactiveLuceneNSDataDirectory:(id)a3 withNSString:(id)a4
{
  return self;
}

- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  if (self->this$0_->useMadvise_) {
    madvise((char *)[self->nsData_ bytes] + a4, a5, 3);
  }
  v9 = [ComAppleProactiveLuceneNSDataDirectory_SlicedIndexInput alloc];
  sub_1000454A0((uint64_t)v9, (uint64_t)a3, self, a4, a5);
  return v9;
}

- (int64_t)length
{
  return self->length_;
}

- (int64_t)getFilePointer
{
  return self->pos_;
}

- (void)seekWithLong:(int64_t)a3
{
  self->pos_ = a3;
}

- (char)readByte
{
  char v4 = 0;
  objc_msgSend(self->nsData_, "getBytes:range:", &v4, self->pos_++, 1);
  return v4;
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->pos_ += a5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneNSDataDirectory_NSDataIndexInput;
  [(OrgApacheLuceneStoreIndexInput *)&v3 dealloc];
}

@end