@interface JavaIoInputStreamReader
+ (const)__metadata;
- (BOOL)isOpen;
- (BOOL)ready;
- (JavaIoInputStreamReader)initWithJavaIoInputStream:(id)a3;
- (JavaIoInputStreamReader)initWithJavaIoInputStream:(id)a3 withJavaNioCharsetCharset:(id)a4;
- (JavaIoInputStreamReader)initWithJavaIoInputStream:(id)a3 withJavaNioCharsetCharsetDecoder:(id)a4;
- (JavaIoInputStreamReader)initWithJavaIoInputStream:(id)a3 withNSString:(id)a4;
- (id)getEncoding;
- (int)read;
- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)close;
- (void)dealloc;
@end

@implementation JavaIoInputStreamReader

- (JavaIoInputStreamReader)initWithJavaIoInputStream:(id)a3
{
  v5 = (void *)JavaNioCharsetCharset_defaultCharset();
  JavaIoInputStreamReader_initWithJavaIoInputStream_withJavaNioCharsetCharset_((uint64_t)self, a3, v5);
  return self;
}

- (JavaIoInputStreamReader)initWithJavaIoInputStream:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaIoInputStreamReader)initWithJavaIoInputStream:(id)a3 withJavaNioCharsetCharsetDecoder:(id)a4
{
  return self;
}

- (JavaIoInputStreamReader)initWithJavaIoInputStream:(id)a3 withJavaNioCharsetCharset:(id)a4
{
  return self;
}

- (void)close
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  decoder = self->decoder_;
  if (decoder) {
    [(JavaNioCharsetCharsetDecoder *)decoder reset];
  }
  JreStrongAssign((id *)&self->decoder_, 0);
  p_in = &self->in_;
  if (*p_in)
  {
    [(JavaIoInputStream *)*p_in close];
    JreStrongAssign((id *)p_in, 0);
  }
  objc_sync_exit(lock);
}

- (id)getEncoding
{
  if (!self->in_) {
    return 0;
  }
  decoder = self->decoder_;
  if (!decoder || (id v3 = [(JavaNioCharsetCharsetDecoder *)decoder charset]) == 0) {
    JreThrowNullPointerException();
  }
  return [v3 name];
}

- (int)read
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  if (!self->in_)
  {
    v8 = new_JavaIoIOException_initWithNSString_(@"InputStreamReader is closed");
    objc_exception_throw(v8);
  }
  v4 = +[IOSCharArray arrayWithLength:1];
  if ([(JavaIoInputStreamReader *)self readWithCharArray:v4 withInt:0 withInt:1] == -1)
  {
    int v6 = -1;
  }
  else
  {
    uint64_t size = v4->super.size_;
    if ((int)size <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, 0);
    }
    int v6 = *((unsigned __int16 *)&v4->super.size_ + 2);
  }
  objc_sync_exit(lock);
  return v6;
}

- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  id obj = self->super.lock_;
  objc_sync_enter(obj);
  if (!self->in_)
  {
    v26 = new_JavaIoIOException_initWithNSString_(@"InputStreamReader is closed");
    objc_exception_throw(v26);
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if (!a5)
  {
    int v23 = 0;
    goto LABEL_43;
  }
  v8 = JavaNioCharBuffer_wrapWithCharArray_withInt_withInt_((unsigned int *)a3, a4, a5);
  if ((atomic_load_explicit(JavaNioCharsetCoderResult__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  bytes = self->bytes_;
  if (!bytes) {
    goto LABEL_44;
  }
  id v10 = (id)JavaNioCharsetCoderResult_UNDERFLOW__;
  unsigned __int8 v11 = [(JavaNioBuffer *)bytes hasRemaining];
  if (!v8) {
    goto LABEL_44;
  }
  char v12 = v11 ^ 1;
  while ([(JavaNioBuffer *)v8 hasRemaining])
  {
    if (v12)
    {
      in = self->in_;
      if (!in) {
        JreThrowNullPointerException();
      }
      if (![(JavaIoInputStream *)in available] && [(JavaNioBuffer *)v8 position] > a4) {
        break;
      }
      unsigned int v14 = [(JavaNioBuffer *)self->bytes_ capacity];
      unsigned int v15 = [(JavaNioBuffer *)self->bytes_ limit];
      unsigned int v16 = [(JavaNioByteBuffer *)self->bytes_ arrayOffset];
      unsigned int v17 = [(JavaNioBuffer *)self->bytes_ limit];
      v18 = self->in_;
      if (!v18) {
        JreThrowNullPointerException();
      }
      unsigned int v19 = [(JavaIoInputStream *)v18 readWithByteArray:[(JavaNioByteBuffer *)self->bytes_ array] withInt:v17 + v16 withInt:v14 - v15];
      if (!v19) {
        break;
      }
      if (v19 == -1)
      {
        self->endOfInput_ = 1;
        break;
      }
      [(JavaNioBuffer *)self->bytes_ limitWithInt:[(JavaNioBuffer *)self->bytes_ limit] + v19];
    }
    decoder = self->decoder_;
    if (!decoder) {
      goto LABEL_44;
    }
    id v21 = [(JavaNioCharsetCharsetDecoder *)decoder decodeWithJavaNioByteBuffer:self->bytes_ withJavaNioCharBuffer:v8 withBoolean:0];
    id v10 = v21;
    if (!v21) {
      goto LABEL_44;
    }
    if (![v21 isUnderflow]) {
      break;
    }
    unsigned int v22 = [(JavaNioBuffer *)self->bytes_ limit];
    char v12 = 1;
    if (v22 == [(JavaNioBuffer *)self->bytes_ capacity])
    {
      [(JavaNioByteBuffer *)self->bytes_ compact];
      [(JavaNioBuffer *)self->bytes_ limitWithInt:[(JavaNioBuffer *)self->bytes_ position]];
      [(JavaNioBuffer *)self->bytes_ positionWithInt:0];
    }
  }
  if ((atomic_load_explicit(JavaNioCharsetCoderResult__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v10 == (id)JavaNioCharsetCoderResult_UNDERFLOW__ && self->endOfInput_)
  {
    v24 = self->decoder_;
    if (!v24) {
      goto LABEL_44;
    }
    id v10 = [(JavaNioCharsetCharsetDecoder *)v24 decodeWithJavaNioByteBuffer:self->bytes_ withJavaNioCharBuffer:v8 withBoolean:1];
    if ((atomic_load_explicit(JavaNioCharsetCoderResult__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (v10 == (id)JavaNioCharsetCoderResult_UNDERFLOW__) {
      id v10 = [(JavaNioCharsetCharsetDecoder *)self->decoder_ flushWithJavaNioCharBuffer:v8];
    }
    [(JavaNioCharsetCharsetDecoder *)self->decoder_ reset];
  }
  if (!v10) {
LABEL_44:
  }
    JreThrowNullPointerException();
  if (([v10 isMalformed] & 1) != 0 || objc_msgSend(v10, "isUnmappable")) {
    [v10 throwException];
  }
  if ([(JavaNioBuffer *)v8 position] == a4) {
    int v23 = -1;
  }
  else {
    int v23 = [(JavaNioBuffer *)v8 position] - a4;
  }
LABEL_43:
  objc_sync_exit(obj);
  return v23;
}

- (BOOL)isOpen
{
  return self->in_ != 0;
}

- (BOOL)ready
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  if (!self->in_)
  {
    v8 = new_JavaIoIOException_initWithNSString_(@"InputStreamReader is closed");
    objc_exception_throw(v8);
  }
  bytes = self->bytes_;
  if (!bytes) {
    goto LABEL_8;
  }
  if (![(JavaNioBuffer *)bytes hasRemaining])
  {
    in = self->in_;
    if (in)
    {
      BOOL v5 = [(JavaIoInputStream *)in available] > 0;
      goto LABEL_7;
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  BOOL v5 = 1;
LABEL_7:
  objc_sync_exit(lock);
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoInputStreamReader;
  [(JavaIoReader *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100484780;
}

@end