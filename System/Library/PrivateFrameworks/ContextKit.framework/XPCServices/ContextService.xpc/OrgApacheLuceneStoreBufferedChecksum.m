@interface OrgApacheLuceneStoreBufferedChecksum
- (OrgApacheLuceneStoreBufferedChecksum)initWithJavaUtilZipChecksum:(id)a3;
- (OrgApacheLuceneStoreBufferedChecksum)initWithJavaUtilZipChecksum:(id)a3 withInt:(int)a4;
- (int64_t)getValue;
- (void)dealloc;
- (void)flush;
- (void)reset;
- (void)updateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)updateWithInt:(int)a3;
@end

@implementation OrgApacheLuceneStoreBufferedChecksum

- (OrgApacheLuceneStoreBufferedChecksum)initWithJavaUtilZipChecksum:(id)a3
{
  return self;
}

- (OrgApacheLuceneStoreBufferedChecksum)initWithJavaUtilZipChecksum:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)updateWithInt:(int)a3
{
  buffer = self->buffer_;
  if (!buffer) {
    goto LABEL_10;
  }
  char v4 = a3;
  uint64_t upto = self->upto_;
  if (upto == buffer->super.size_)
  {
    if ((int)upto < 1)
    {
      uint64_t upto = 0;
      goto LABEL_7;
    }
    in = self->in_;
    if (in)
    {
      [(JavaUtilZipChecksum *)in updateWithByteArray:buffer withInt:0 withInt:upto];
      uint64_t upto = 0;
      buffer = self->buffer_;
      goto LABEL_7;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
LABEL_7:
  self->upto_ = upto + 1;
  uint64_t size = buffer->super.size_;
  if ((upto & 0x80000000) != 0 || (int)upto >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, upto);
  }
  *((unsigned char *)&buffer->super.size_ + (int)upto + 4) = v4;
}

- (void)updateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  buffer = self->buffer_;
  if (!buffer) {
    goto LABEL_16;
  }
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  int size = buffer->super.size_;
  uint64_t upto = self->upto_;
  if (size > (int)v7)
  {
    if ((int)upto + (int)v7 <= size)
    {
LABEL_8:
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v8, buffer, upto, v7);
      self->upto_ += v7;
      return;
    }
    if ((int)upto < 1)
    {
LABEL_7:
      uint64_t upto = 0;
      self->upto_ = 0;
      goto LABEL_8;
    }
    in = self->in_;
    if (in)
    {
      -[JavaUtilZipChecksum updateWithByteArray:withInt:withInt:](in, "updateWithByteArray:withInt:withInt:");
      buffer = self->buffer_;
      goto LABEL_7;
    }
    goto LABEL_16;
  }
  if ((int)upto >= 1)
  {
    v13 = self->in_;
    if (!v13) {
      goto LABEL_16;
    }
    -[JavaUtilZipChecksum updateWithByteArray:withInt:withInt:](v13, "updateWithByteArray:withInt:withInt:");
  }
  self->upto_ = 0;
  v14 = self->in_;
  if (!v14) {
LABEL_16:
  }
    JreThrowNullPointerException();
  [(JavaUtilZipChecksum *)v14 updateWithByteArray:a3 withInt:v8 withInt:v7];
}

- (int64_t)getValue
{
  if (self->upto_ >= 1)
  {
    in = self->in_;
    if (!in) {
      goto LABEL_8;
    }
    -[JavaUtilZipChecksum updateWithByteArray:withInt:withInt:](in, "updateWithByteArray:withInt:withInt:", self->buffer_, 0);
  }
  self->upto_ = 0;
  char v4 = self->in_;
  if (!v4) {
LABEL_8:
  }
    JreThrowNullPointerException();
  return (int64_t)[(JavaUtilZipChecksum *)v4 getValue];
}

- (void)reset
{
  self->upto_ = 0;
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(JavaUtilZipChecksum *)in reset];
}

- (void)flush
{
  if (self->upto_ >= 1)
  {
    in = self->in_;
    if (!in) {
      JreThrowNullPointerException();
    }
    -[JavaUtilZipChecksum updateWithByteArray:withInt:withInt:](in, "updateWithByteArray:withInt:withInt:", self->buffer_, 0);
  }
  self->upto_ = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreBufferedChecksum;
  [(OrgApacheLuceneStoreBufferedChecksum *)&v3 dealloc];
}

@end