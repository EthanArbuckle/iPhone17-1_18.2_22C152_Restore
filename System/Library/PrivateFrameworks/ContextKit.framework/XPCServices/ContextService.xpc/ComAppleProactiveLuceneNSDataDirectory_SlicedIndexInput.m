@interface ComAppleProactiveLuceneNSDataDirectory_SlicedIndexInput
- (ComAppleProactiveLuceneNSDataDirectory_SlicedIndexInput)initWithNSString:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6;
- (id)clone;
- (int64_t)length;
- (void)close;
- (void)dealloc;
- (void)readInternalWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation ComAppleProactiveLuceneNSDataDirectory_SlicedIndexInput

- (ComAppleProactiveLuceneNSDataDirectory_SlicedIndexInput)initWithNSString:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6
{
  return self;
}

- (id)clone
{
  v6.receiver = self;
  v6.super_class = (Class)ComAppleProactiveLuceneNSDataDirectory_SlicedIndexInput;
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
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  int64_t v9 = [(OrgApacheLuceneStoreBufferedIndexInput *)self getFilePointer];
  if (v9 + (int)v5 > self->length_)
  {
    CFStringRef v18 = JreStrcat("$@", v10, v11, v12, v13, v14, v15, v16, @"read past EOF: ");
    v19 = new_JavaIoEOFException_initWithNSString_((uint64_t)v18);
    objc_exception_throw(v19);
  }
  if (!self->base_) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)self->base_ seekWithLong:self->fileOffset_ + v9];
  base = self->base_;
  [(OrgApacheLuceneStoreDataInput *)base readBytesWithByteArray:a3 withInt:v6 withInt:v5 withBoolean:0];
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
  v3.super_class = (Class)ComAppleProactiveLuceneNSDataDirectory_SlicedIndexInput;
  [(OrgApacheLuceneStoreBufferedIndexInput *)&v3 dealloc];
}

@end