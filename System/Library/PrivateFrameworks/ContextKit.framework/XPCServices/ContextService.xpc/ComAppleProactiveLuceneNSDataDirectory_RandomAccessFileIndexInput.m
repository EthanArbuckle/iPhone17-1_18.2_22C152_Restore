@interface ComAppleProactiveLuceneNSDataDirectory_RandomAccessFileIndexInput
- (ComAppleProactiveLuceneNSDataDirectory_RandomAccessFileIndexInput)initWithComAppleProactiveLuceneNSDataDirectory:(id)a3 withNSString:(id)a4;
- (id)clone;
- (int64_t)length;
- (void)__javaClone;
- (void)close;
- (void)dealloc;
- (void)readInternalWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)seekInternalWithLong:(int64_t)a3;
@end

@implementation ComAppleProactiveLuceneNSDataDirectory_RandomAccessFileIndexInput

- (ComAppleProactiveLuceneNSDataDirectory_RandomAccessFileIndexInput)initWithComAppleProactiveLuceneNSDataDirectory:(id)a3 withNSString:(id)a4
{
  return self;
}

- (void)readInternalWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  p_original = &self->original_;
  Weak = (id *)objc_loadWeak((id *)&self->original_);
  if (!Weak) {
    goto LABEL_7;
  }
  if (objc_loadWeak(Weak + 11) != self)
  {
    raf = self->raf_;
    if (!raf) {
      goto LABEL_7;
    }
    [(JavaIoRandomAccessFile *)raf seekWithLong:self->pos_];
    v12 = (id *)objc_loadWeak((id *)p_original);
    objc_storeWeak(v12 + 11, self);
  }
  v13 = self->raf_;
  if (!v13) {
LABEL_7:
  }
    JreThrowNullPointerException();
  [(JavaIoRandomAccessFile *)v13 readWithByteArray:a3 withInt:v6 withInt:v5];
  self->pos_ += (int)v5;
}

- (void)seekInternalWithLong:(int64_t)a3
{
  self->pos_ = a3;
  raf = self->raf_;
  if (!raf) {
    JreThrowNullPointerException();
  }
  -[JavaIoRandomAccessFile seekWithLong:](raf, "seekWithLong:");
}

- (void)close
{
  raf = self->raf_;
  if (!raf) {
    JreThrowNullPointerException();
  }
  [(JavaIoRandomAccessFile *)raf close];
}

- (int64_t)length
{
  return self->length_;
}

- (id)clone
{
  v6.receiver = self;
  v6.super_class = (Class)ComAppleProactiveLuceneNSDataDirectory_RandomAccessFileIndexInput;
  v3 = [(OrgApacheLuceneStoreBufferedIndexInput *)&v6 clone];
  objc_opt_class();
  if (!v3)
  {
    objc_loadWeak((id *)&self->original_);
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id Weak = objc_loadWeak((id *)&self->original_);
  objc_storeWeak(v3 + 10, Weak);
  objc_storeWeak(v3 + 11, 0);
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneNSDataDirectory_RandomAccessFileIndexInput;
  [(OrgApacheLuceneStoreBufferedIndexInput *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleProactiveLuceneNSDataDirectory_RandomAccessFileIndexInput;
  [(ComAppleProactiveLuceneNSDataDirectory_RandomAccessFileIndexInput *)&v3 __javaClone];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->lastUsed_);
  objc_destroyWeak((id *)&self->original_);
}

@end