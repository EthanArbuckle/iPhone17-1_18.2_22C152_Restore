@interface JavaUtilZipInflater
+ (const)__metadata;
- (BOOL)finished;
- (BOOL)needsDictionary;
- (BOOL)needsInput;
- (JavaUtilZipInflater)init;
- (JavaUtilZipInflater)initWithBoolean:(BOOL)a3;
- (int)getAdler;
- (int)getAdlerImplWithLong:(int64_t)a3;
- (int)getCurrentOffset;
- (int)getRemaining;
- (int)getTotalIn;
- (int)getTotalOut;
- (int)inflateImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (int)inflateWithByteArray:(id)a3;
- (int)inflateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)setFileInputImplWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (int)setFileInputWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (int64_t)createStreamWithBoolean:(BOOL)a3;
- (int64_t)getBytesRead;
- (int64_t)getBytesWritten;
- (int64_t)getTotalInImplWithLong:(int64_t)a3;
- (int64_t)getTotalOutImplWithLong:(int64_t)a3;
- (uint64_t)checkOpen;
- (void)dealloc;
- (void)end;
- (void)endImplWithLong:(int64_t)a3;
- (void)reset;
- (void)resetImplWithLong:(int64_t)a3;
- (void)setDictionaryImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (void)setDictionaryWithByteArray:(id)a3;
- (void)setDictionaryWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setInputImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (void)setInputWithByteArray:(id)a3;
- (void)setInputWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaUtilZipInflater

- (JavaUtilZipInflater)init
{
  return self;
}

- (JavaUtilZipInflater)initWithBoolean:(BOOL)a3
{
  return self;
}

- (int64_t)createStreamWithBoolean:(BOOL)a3
{
  return (int64_t)sub_1002784D0(a3);
}

- (void)end
{
  objc_sync_enter(self);
  guard = self->guard_;
  if (!guard) {
    JreThrowNullPointerException();
  }
  [(DalvikSystemCloseGuard *)guard close];
  streamHandle = (void *)self->streamHandle_;
  if (streamHandle != (void *)-1)
  {
    inflateEnd((z_streamp)self->streamHandle_);
    free((void *)self->inBuffer_);
    free(streamHandle);
    *(void *)&self->inLength_ = 0;
    self->streamHandle_ = -1;
  }
  objc_sync_exit(self);
}

- (void)endImplWithLong:(int64_t)a3
{
  inflateEnd((z_streamp)a3);
  free((void *)self->inBuffer_);
  free((void *)a3);
}

- (void)dealloc
{
  guard = self->guard_;
  if (guard) {
    [(DalvikSystemCloseGuard *)guard warnIfOpen];
  }
  [(JavaUtilZipInflater *)self end];

  v4.receiver = self;
  v4.super_class = (Class)JavaUtilZipInflater;
  [(JavaUtilZipInflater *)&v4 dealloc];
}

- (BOOL)finished
{
  objc_sync_enter(self);
  BOOL finished = self->finished_;
  objc_sync_exit(self);
  return finished;
}

- (int)getAdler
{
  objc_sync_enter(self);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  int v3 = *(_DWORD *)(self->streamHandle_ + 96);
  objc_sync_exit(self);
  return v3;
}

- (uint64_t)checkOpen
{
  if (*(void *)(result + 24) == -1)
  {
    v1 = new_JavaLangIllegalStateException_initWithNSString_(@"attempt to use Inflater after calling end");
    objc_exception_throw(v1);
  }
  return result;
}

- (int)getAdlerImplWithLong:(int64_t)a3
{
  return *(_DWORD *)(a3 + 96);
}

- (int64_t)getBytesRead
{
  objc_sync_enter(self);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  int64_t v3 = *(void *)(self->streamHandle_ + 16);
  objc_sync_exit(self);
  return v3;
}

- (int64_t)getBytesWritten
{
  objc_sync_enter(self);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  int64_t v3 = *(void *)(self->streamHandle_ + 40);
  objc_sync_exit(self);
  return v3;
}

- (int)getRemaining
{
  objc_sync_enter(self);
  int v3 = self->inLength_ - self->inRead_;
  objc_sync_exit(self);
  return v3;
}

- (int)getCurrentOffset
{
  objc_sync_enter(self);
  int inRead = self->inRead_;
  objc_sync_exit(self);
  return inRead;
}

- (int)getTotalIn
{
  objc_sync_enter(self);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  int v3 = JavaLangMath_minWithLong_withLong_(*(void *)(self->streamHandle_ + 16), 0x7FFFFFFFLL);
  objc_sync_exit(self);
  return v3;
}

- (int64_t)getTotalInImplWithLong:(int64_t)a3
{
  return *(void *)(a3 + 16);
}

- (int)getTotalOut
{
  objc_sync_enter(self);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  int v3 = JavaLangMath_minWithLong_withLong_(*(void *)(self->streamHandle_ + 40), 0x7FFFFFFFLL);
  objc_sync_exit(self);
  return v3;
}

- (int64_t)getTotalOutImplWithLong:(int64_t)a3
{
  return *(void *)(a3 + 40);
}

- (int)inflateWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaUtilZipInflater *)self inflateWithByteArray:a3 withInt:0 withInt:v3];
}

- (int)inflateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  if ([(JavaUtilZipInflater *)self needsInput])
  {
    int v9 = 0;
  }
  else
  {
    BOOL needsDictionary = self->needsDictionary_;
    self->needsDictionary_ = 0;
    int v9 = sub_100278AD0((uint64_t)self, (int *)a3, a4, a5, (z_stream *)self->streamHandle_);
    if (needsDictionary && self->needsDictionary_)
    {
      v12 = new_JavaUtilZipDataFormatException_initWithNSString_(@"Needs dictionary");
      objc_exception_throw(v12);
    }
  }
  objc_sync_exit(self);
  return v9;
}

- (int)inflateImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6
{
  return sub_100278AD0((uint64_t)self, (int *)a3, a4, a5, (z_stream *)a6);
}

- (BOOL)needsDictionary
{
  objc_sync_enter(self);
  BOOL needsDictionary = self->needsDictionary_;
  objc_sync_exit(self);
  return needsDictionary;
}

- (BOOL)needsInput
{
  objc_sync_enter(self);
  BOOL v3 = self->inRead_ == self->inLength_;
  objc_sync_exit(self);
  return v3;
}

- (void)reset
{
  objc_sync_enter(self);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  *(_WORD *)&self->finished_ = 0;
  *(void *)&self->inLength_ = 0;
  sub_100278CC0((z_stream *)self->streamHandle_);
  objc_sync_exit(self);
}

- (void)resetImplWithLong:(int64_t)a3
{
}

- (void)setDictionaryWithByteArray:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  [(JavaUtilZipInflater *)self setDictionaryWithByteArray:a3 withInt:0 withInt:*((unsigned int *)a3 + 2)];
  objc_sync_exit(self);
}

- (void)setDictionaryWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  objc_sync_enter(self);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  sub_100278E18(a3, a4, a5, (z_stream *)self->streamHandle_);
  objc_sync_exit(self);
}

- (void)setDictionaryImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6
{
}

- (void)setInputWithByteArray:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  [(JavaUtilZipInflater *)self setInputWithByteArray:a3 withInt:0 withInt:*((unsigned int *)a3 + 2)];
  objc_sync_exit(self);
}

- (void)setInputWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  objc_sync_enter(self);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  self->inLength_ = a5;
  self->inRead_ = 0;
  sub_100278FA8((uint64_t)self, a3, a4, a5, self->streamHandle_);
  objc_sync_exit(self);
}

- (void)setInputImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6
{
}

- (int)setFileInputWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  objc_sync_enter(self);
  -[JavaUtilZipInflater checkOpen]_0((uint64_t)self);
  self->inRead_ = 0;
  sub_100279114(self, a3, a4, v5, self->streamHandle_);
  self->inLength_ = v5;
  objc_sync_exit(self);
  return v5;
}

- (int)setFileInputImplWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4 withInt:(int)a5 withLong:(int64_t)a6
{
  return sub_100279114(self, a3, a4, *(uint64_t *)&a5, a6);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004784F8;
}

@end