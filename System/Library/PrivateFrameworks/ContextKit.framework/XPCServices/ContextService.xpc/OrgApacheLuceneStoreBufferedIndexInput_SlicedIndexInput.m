@interface OrgApacheLuceneStoreBufferedIndexInput_SlicedIndexInput
- (OrgApacheLuceneStoreBufferedIndexInput_SlicedIndexInput)initWithNSString:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6;
- (id)clone;
- (int64_t)length;
- (void)close;
- (void)dealloc;
- (void)readInternalWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneStoreBufferedIndexInput_SlicedIndexInput

- (OrgApacheLuceneStoreBufferedIndexInput_SlicedIndexInput)initWithNSString:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6
{
  return self;
}

- (id)clone
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneStoreBufferedIndexInput_SlicedIndexInput;
  v3 = [(OrgApacheLuceneStoreBufferedIndexInput *)&v6 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_6;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  base = self->base_;
  if (!base) {
LABEL_6:
  }
    JreThrowNullPointerException();
  JreStrongAssign(v3 + 7, [(OrgApacheLuceneStoreIndexInput *)base clone]);
  v3[8] = self->fileOffset_;
  v3[9] = self->length_;
  return v3;
}

- (void)readInternalWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  int64_t v9 = self->super.bufferStart_ + self->super.bufferPosition_;
  if (v9 + a5 > self->length_)
  {
    CFStringRef v15 = JreStrcat("$@", (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7, @"read past EOF: ");
    v16 = new_JavaIoEOFException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  base = self->base_;
  if (!base) {
    JreThrowNullPointerException();
  }
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  [(OrgApacheLuceneStoreIndexInput *)base seekWithLong:self->fileOffset_ + v9];
  v14 = self->base_;
  [(OrgApacheLuceneStoreDataInput *)v14 readBytesWithByteArray:a3 withInt:v12 withInt:v11 withBoolean:0];
}

- (void)close
{
  base = self->base_;
  if (!base) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)base close];
}

- (int64_t)length
{
  return self->length_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreBufferedIndexInput_SlicedIndexInput;
  [(OrgApacheLuceneStoreBufferedIndexInput *)&v3 dealloc];
}

@end