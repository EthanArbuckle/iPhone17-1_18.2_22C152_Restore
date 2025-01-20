@interface JavaUtilZipDeflater
+ (const)__metadata;
- (BOOL)finished;
- (BOOL)needsInput;
- (JavaUtilZipDeflater)init;
- (JavaUtilZipDeflater)initWithInt:(int)a3;
- (JavaUtilZipDeflater)initWithInt:(int)a3 withBoolean:(BOOL)a4;
- (id)endImpl;
- (int)deflateImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (int)deflateImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6 withInt:(int)a7;
- (int)deflateWithByteArray:(id)a3;
- (int)deflateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)deflateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (int)getAdler;
- (int)getAdlerImplWithLong:(int64_t)a3;
- (int)getTotalIn;
- (int)getTotalOut;
- (int64_t)createStreamWithInt:(int)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (int64_t)getBytesRead;
- (int64_t)getBytesWritten;
- (int64_t)getTotalInImplWithLong:(int64_t)a3;
- (int64_t)getTotalOutImplWithLong:(int64_t)a3;
- (uint64_t)checkOpen;
- (void)dealloc;
- (void)end;
- (void)endImplWithLong:(int64_t)a3;
- (void)finish;
- (void)reset;
- (void)resetImplWithLong:(int64_t)a3;
- (void)setDictionaryImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (void)setDictionaryWithByteArray:(id)a3;
- (void)setDictionaryWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setInputImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (void)setInputWithByteArray:(id)a3;
- (void)setInputWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setLevelWithInt:(int)a3;
- (void)setLevelsImplWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5;
- (void)setStrategyWithInt:(int)a3;
@end

@implementation JavaUtilZipDeflater

- (JavaUtilZipDeflater)init
{
  return self;
}

- (JavaUtilZipDeflater)initWithInt:(int)a3
{
  return self;
}

- (JavaUtilZipDeflater)initWithInt:(int)a3 withBoolean:(BOOL)a4
{
  return self;
}

- (int)deflateWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaUtilZipDeflater *)self deflateWithByteArray:a3 withInt:0 withInt:v3];
}

- (int)deflateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  objc_sync_enter(self);
  int v9 = sub_10015AF24((uint64_t)self, (uint64_t)a3, a4, a5, self->flushParm_);
  objc_sync_exit(self);
  return v9;
}

- (int)deflateWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  objc_sync_enter(self);
  if ((a6 - 2) >= 2 && a6)
  {
    CFStringRef v20 = JreStrcat("$I", v11, v12, v13, v14, v15, v16, v17, @"Bad flush value: ");
    v21 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v20);
    objc_exception_throw(v21);
  }
  int v18 = sub_10015AF24((uint64_t)self, (uint64_t)a3, a4, a5, a6);
  objc_sync_exit(self);
  return v18;
}

- (int)deflateImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  return sub_10015AF24((uint64_t)self, (uint64_t)a3, a4, a5, a6);
}

- (int)deflateImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6 withInt:(int)a7
{
  return sub_10015B100((uint64_t)self, (int *)a3, a4, a5, (z_stream *)a6, a7);
}

- (void)end
{
  objc_sync_enter(self);
  guard = self->guard_;
  if (!guard) {
    JreThrowNullPointerException();
  }
  [(DalvikSystemCloseGuard *)guard close];
  -[JavaUtilZipDeflater endImpl]_0(self);
  objc_sync_exit(self);
}

- (id)endImpl
{
  v1 = (void *)*((void *)result + 3);
  if (v1 != (void *)-1)
  {
    v2 = (void **)result;
    deflateEnd(*((z_streamp *)result + 3));
    free(v2[4]);
    free(v1);
    result = JreStrongAssign(v2 + 5, 0);
    v2[3] = (void *)-1;
  }
  return result;
}

- (void)endImplWithLong:(int64_t)a3
{
  deflateEnd((z_streamp)a3);
  free((void *)self->inBuffer_);
  free((void *)a3);
}

- (void)dealloc
{
  guard = self->guard_;
  if (guard) {
    [(DalvikSystemCloseGuard *)guard warnIfOpen];
  }
  objc_sync_enter(self);
  [(JavaUtilZipDeflater *)self end];
  -[JavaUtilZipDeflater endImpl]_0(self);
  objc_sync_exit(self);

  v4.receiver = self;
  v4.super_class = (Class)JavaUtilZipDeflater;
  [(JavaUtilZipDeflater *)&v4 dealloc];
}

- (void)finish
{
  objc_sync_enter(self);
  self->flushParm_ = 4;
  objc_sync_exit(self);
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
  -[JavaUtilZipDeflater checkOpen]_0((uint64_t)self);
  int v3 = *(_DWORD *)(self->streamHandle_ + 96);
  objc_sync_exit(self);
  return v3;
}

- (uint64_t)checkOpen
{
  if (*(void *)(result + 24) == -1)
  {
    v1 = new_JavaLangIllegalStateException_initWithNSString_(@"attempt to use Deflater after calling end");
    objc_exception_throw(v1);
  }
  return result;
}

- (int)getAdlerImplWithLong:(int64_t)a3
{
  return *(_DWORD *)(a3 + 96);
}

- (int)getTotalIn
{
  objc_sync_enter(self);
  -[JavaUtilZipDeflater checkOpen]_0((uint64_t)self);
  int v3 = *(_DWORD *)(self->streamHandle_ + 16);
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
  -[JavaUtilZipDeflater checkOpen]_0((uint64_t)self);
  int v3 = *(_DWORD *)(self->streamHandle_ + 40);
  objc_sync_exit(self);
  return v3;
}

- (int64_t)getTotalOutImplWithLong:(int64_t)a3
{
  return *(void *)(a3 + 40);
}

- (BOOL)needsInput
{
  objc_sync_enter(self);
  if (self->inputBuffer_) {
    BOOL v3 = self->inRead_ == self->inLength_;
  }
  else {
    BOOL v3 = 1;
  }
  objc_sync_exit(self);
  return v3;
}

- (void)reset
{
  objc_sync_enter(self);
  -[JavaUtilZipDeflater checkOpen]_0((uint64_t)self);
  self->flushParm_ = 0;
  self->finished_ = 0;
  sub_10015B65C((z_stream *)self->streamHandle_);
  JreStrongAssign((id *)&self->inputBuffer_, 0);
  objc_sync_exit(self);
}

- (void)resetImplWithLong:(int64_t)a3
{
}

- (void)setDictionaryWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  [(JavaUtilZipDeflater *)self setDictionaryWithByteArray:a3 withInt:0 withInt:v3];
}

- (void)setDictionaryWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  objc_sync_enter(self);
  -[JavaUtilZipDeflater checkOpen]_0((uint64_t)self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  sub_10015B778(a3, a4, a5, (z_stream *)self->streamHandle_);
  objc_sync_exit(self);
}

- (void)setDictionaryImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6
{
}

- (void)setInputWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  [(JavaUtilZipDeflater *)self setInputWithByteArray:a3 withInt:0 withInt:v3];
}

- (void)setInputWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  objc_sync_enter(self);
  -[JavaUtilZipDeflater checkOpen]_0((uint64_t)self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  inputBuffer = self->inputBuffer_;
  self->inRead_ = 0;
  self->inLength_ = a5;
  if (!inputBuffer) {
    sub_10015B8F8(self->compressLevel_, self->strategy_, (z_streamp)self->streamHandle_);
  }
  JreStrongAssign((id *)&self->inputBuffer_, a3);
  sub_10015B940((uint64_t)self, a3, a4, a5, self->streamHandle_);
  objc_sync_exit(self);
}

- (void)setLevelsImplWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
}

- (void)setInputImplWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6
{
}

- (void)setLevelWithInt:(int)a3
{
  objc_sync_enter(self);
  if ((a3 - 10) <= 0xFFFFFFF4)
  {
    CFStringRef v12 = JreStrcat("$I", v5, v6, v7, v8, v9, v10, v11, @"Bad level: ");
    uint64_t v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v12);
    goto LABEL_8;
  }
  if (self->inputBuffer_)
  {
    uint64_t v13 = new_JavaLangIllegalStateException_initWithNSString_(@"setLevel cannot be called after setInput");
LABEL_8:
    objc_exception_throw(v13);
  }
  self->compressLevel_ = a3;
  objc_sync_exit(self);
}

- (void)setStrategyWithInt:(int)a3
{
  objc_sync_enter(self);
  if (a3 >= 3)
  {
    CFStringRef v12 = JreStrcat("$I", v5, v6, v7, v8, v9, v10, v11, @"Bad strategy: ");
    uint64_t v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v12);
    goto LABEL_8;
  }
  if (self->inputBuffer_)
  {
    uint64_t v13 = new_JavaLangIllegalStateException_initWithNSString_(@"setStrategy cannot be called after setInput");
LABEL_8:
    objc_exception_throw(v13);
  }
  self->strategy_ = a3;
  objc_sync_exit(self);
}

- (int64_t)getBytesRead
{
  objc_sync_enter(self);
  -[JavaUtilZipDeflater checkOpen]_0((uint64_t)self);
  int64_t v3 = *(void *)(self->streamHandle_ + 16);
  objc_sync_exit(self);
  return v3;
}

- (int64_t)getBytesWritten
{
  objc_sync_enter(self);
  -[JavaUtilZipDeflater checkOpen]_0((uint64_t)self);
  int64_t v3 = *(void *)(self->streamHandle_ + 40);
  objc_sync_exit(self);
  return v3;
}

- (int64_t)createStreamWithInt:(int)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return (int64_t)sub_10015BC40(a3, a4, a5);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F9D78;
}

@end