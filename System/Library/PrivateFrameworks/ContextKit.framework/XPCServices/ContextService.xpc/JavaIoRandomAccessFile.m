@interface JavaIoRandomAccessFile
+ (const)__metadata;
- (BOOL)readBoolean;
- (JavaIoRandomAccessFile)initWithJavaIoFile:(id)a3 withNSString:(id)a4;
- (JavaIoRandomAccessFile)initWithNSString:(id)a3 withNSString:(id)a4;
- (char)readByte;
- (double)readDouble;
- (float)readFloat;
- (id)getChannel;
- (id)getFD;
- (id)readLine;
- (id)readUTF;
- (int)read;
- (int)readUnsignedByte;
- (int)readUnsignedShort;
- (int)readWithByteArray:(id)a3;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)skipBytesWithInt:(int)a3;
- (int64_t)getFilePointer;
- (int64_t)length;
- (uint64_t)readInt;
- (uint64_t)readShort;
- (unint64_t)readLong;
- (unsigned)readChar;
- (void)close;
- (void)dealloc;
- (void)readFullyWithByteArray:(id)a3;
- (void)readFullyWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)seekWithLong:(int64_t)a3;
- (void)setLengthWithLong:(int64_t)a3;
- (void)writeByteWithInt:(int)a3;
- (void)writeBytesWithNSString:(id)a3;
- (void)writeCharWithInt:(int)a3;
- (void)writeCharsWithNSString:(id)a3;
- (void)writeDoubleWithDouble:(double)a3;
- (void)writeFloatWithFloat:(float)a3;
- (void)writeIntWithInt:(int)a3;
- (void)writeLongWithLong:(int64_t)a3;
- (void)writeShortWithInt:(int)a3;
- (void)writeUTFWithNSString:(id)a3;
- (void)writeWithByteArray:(id)a3;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaIoRandomAccessFile

- (JavaIoRandomAccessFile)initWithJavaIoFile:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaIoRandomAccessFile)initWithNSString:(id)a3 withNSString:(id)a4
{
  v6 = new_JavaIoFile_initWithNSString_(a3);
  JavaIoRandomAccessFile_initWithJavaIoFile_withNSString_((uint64_t)self, v6, a4);
  return self;
}

- (void)close
{
  guard = self->guard_;
  if (!guard) {
    JreThrowNullPointerException();
  }
  [(DalvikSystemCloseGuard *)guard close];
  objc_sync_enter(self);
  channel = self->channel_;
  if (channel && [(JavaNioChannelsSpiAbstractInterruptibleChannel *)channel isOpen])
  {
    [(JavaNioChannelsSpiAbstractInterruptibleChannel *)self->channel_ close];
    JreStrongAssign((id *)&self->channel_, 0);
  }
  LibcoreIoIoUtils_closeWithJavaIoFileDescriptor_(self->fd_);
  objc_sync_exit(self);
}

- (void)dealloc
{
  guard = self->guard_;
  if (guard) {
    [(DalvikSystemCloseGuard *)guard warnIfOpen];
  }
  [(JavaIoRandomAccessFile *)self close];

  v4.receiver = self;
  v4.super_class = (Class)JavaIoRandomAccessFile;
  [(JavaIoRandomAccessFile *)&v4 dealloc];
}

- (id)getChannel
{
  objc_sync_enter(self);
  channel = self->channel_;
  if (!channel)
  {
    objc_super v4 = JavaNioNioUtils_newFileChannelWithId_withJavaIoFileDescriptor_withInt_(self, self->fd_, self->mode_);
    JreStrongAssign((id *)&self->channel_, v4);
    channel = self->channel_;
  }
  objc_sync_exit(self);
  return channel;
}

- (id)getFD
{
  return self->fd_;
}

- (int64_t)getFilePointer
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(id)LibcoreIoLibcore_os_ lseekWithJavaIoFileDescriptor:self->fd_ withLong:0 withInt:1];
}

- (int64_t)length
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_
    || (v3 = [(id)LibcoreIoLibcore_os_ fstatWithJavaIoFileDescriptor:self->fd_]) == 0)
  {
    JreThrowNullPointerException();
  }
  return v3[7];
}

- (int)read
{
  int result = [(JavaIoRandomAccessFile *)self readWithByteArray:self->scratch_ withInt:0 withInt:1];
  if (result != -1)
  {
    scratch = self->scratch_;
    if (!scratch) {
      JreThrowNullPointerException();
    }
    uint64_t size = scratch->super.size_;
    if ((int)size <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, 0);
    }
    return *((unsigned __int8 *)&scratch->super.size_ + 4);
  }
  return result;
}

- (int)readWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaIoRandomAccessFile *)self readWithByteArray:a3 withInt:0 withInt:v3];
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return LibcoreIoIoBridge_readWithJavaIoFileDescriptor_withByteArray_withInt_withInt_((uint64_t)self->fd_, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

- (BOOL)readBoolean
{
  unsigned int v2 = [(JavaIoRandomAccessFile *)self read];
  if ((v2 & 0x80000000) != 0)
  {
    objc_super v4 = new_JavaIoEOFException_init();
    objc_exception_throw(v4);
  }
  return v2 != 0;
}

- (char)readByte
{
  unsigned int v2 = [(JavaIoRandomAccessFile *)self read];
  if ((v2 & 0x80000000) != 0)
  {
    uint64_t v3 = new_JavaIoEOFException_init();
    objc_exception_throw(v3);
  }
  return v2;
}

- (unsigned)readChar
{
  return -[JavaIoRandomAccessFile readShort]_0((uint64_t *)self);
}

- (uint64_t)readShort
{
  sub_1001C3A94(a1, a1[6], 0, 2);
  uint64_t v2 = a1[6];
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = JavaNioByteOrder_BIG_ENDIAN__;
  return LibcoreIoMemory_peekShortWithByteArray_withInt_withJavaNioByteOrder_(v2, 0, v3);
}

- (double)readDouble
{
  unint64_t v2 = -[JavaIoRandomAccessFile readLong]_0((uint64_t *)self);
  return JavaLangDouble_longBitsToDoubleWithLong_(v2);
}

- (unint64_t)readLong
{
  sub_1001C3A94(a1, a1[6], 0, 8);
  uint64_t v2 = a1[6];
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = JavaNioByteOrder_BIG_ENDIAN__;
  return LibcoreIoMemory_peekLongWithByteArray_withInt_withJavaNioByteOrder_(v2, 0, v3);
}

- (float)readFloat
{
  int v2 = -[JavaIoRandomAccessFile readInt]_0((uint64_t *)self);
  return JavaLangFloat_intBitsToFloatWithInt_(v2);
}

- (uint64_t)readInt
{
  sub_1001C3A94(a1, a1[6], 0, 4);
  uint64_t v2 = a1[6];
  if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = JavaNioByteOrder_BIG_ENDIAN__;
  return LibcoreIoMemory_peekIntWithByteArray_withInt_withJavaNioByteOrder_(v2, 0, v3);
}

- (void)readFullyWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  sub_1001C3A94(self, (uint64_t)a3, 0, v3);
}

- (void)readFullyWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (id)readLine
{
  uint64_t v3 = new_JavaLangStringBuilder_initWithInt_(0x50u);
  char v4 = 0;
  int64_t v5 = 0;
  while (1)
  {
    while (1)
    {
      unsigned int v6 = [(JavaIoRandomAccessFile *)self read];
      if (v6 != 13) {
        break;
      }
      if (v4)
      {
LABEL_11:
        [(JavaIoRandomAccessFile *)self seekWithLong:v5];
        goto LABEL_12;
      }
      int64_t v5 = [(JavaIoRandomAccessFile *)self getFilePointer];
      char v4 = 1;
    }
    if (v6 == 10) {
      goto LABEL_12;
    }
    if (v6 == -1) {
      break;
    }
    if (v4) {
      goto LABEL_11;
    }
    [(JavaLangStringBuilder *)v3 appendWithChar:(unsigned __int16)v6];
    char v4 = 0;
  }
  if (![(JavaLangStringBuilder *)v3 length]) {
    return 0;
  }
LABEL_12:
  return [(JavaLangStringBuilder *)v3 description];
}

- (int)readUnsignedByte
{
  int result = [(JavaIoRandomAccessFile *)self read];
  if (result < 0)
  {
    uint64_t v3 = new_JavaIoEOFException_init();
    objc_exception_throw(v3);
  }
  return result;
}

- (int)readUnsignedShort
{
  return (unsigned __int16)-[JavaIoRandomAccessFile readShort]_0((uint64_t *)self);
}

- (id)readUTF
{
  int v3 = -[JavaIoRandomAccessFile readShort]_0((uint64_t *)self);
  if (!v3) {
    return &stru_10048C1F8;
  }
  uint64_t v4 = (unsigned __int16)v3;
  int64_t v5 = +[IOSByteArray arrayWithLength:(unsigned __int16)v3];
  if ([(JavaIoRandomAccessFile *)self readWithByteArray:v5 withInt:0 withInt:v5->super.size_] != v5->super.size_)
  {
    v12 = new_JavaIoEOFException_init();
    objc_exception_throw(v12);
  }
  unsigned int v6 = +[IOSCharArray arrayWithLength:v4];
  return JavaNioCharsetModifiedUtf8_decodeWithByteArray_withCharArray_withInt_withInt_((uint64_t)v5, (uint64_t)v6, 0, v4, v7, v8, v9, v10);
}

- (void)seekWithLong:(int64_t)a3
{
  if (a3 < 0)
  {
    CFStringRef v10 = JreStrcat("$J", (uint64_t)a2, a3, v3, v4, v5, v6, v7, @"offset < 0: ");
    v11 = new_JavaIoIOException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ lseekWithJavaIoFileDescriptor:self->fd_ withLong:a3 withInt:0];
}

- (void)setLengthWithLong:(int64_t)a3
{
  if (a3 < 0)
  {
    uint64_t v6 = new_JavaLangIllegalArgumentException_initWithNSString_(@"newLength < 0");
    objc_exception_throw(v6);
  }
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ ftruncateWithJavaIoFileDescriptor:self->fd_ withLong:a3];
  if ([(JavaIoRandomAccessFile *)self getFilePointer] > a3) {
    [(JavaIoRandomAccessFile *)self seekWithLong:a3];
  }
  if (self->syncMetadata_)
  {
    fd = self->fd_;
    if (!fd) {
      JreThrowNullPointerException();
    }
    [(JavaIoFileDescriptor *)fd sync];
  }
}

- (int)skipBytesWithInt:(int)a3
{
  if (a3 < 1) {
    return 0;
  }
  int v3 = a3;
  int64_t v5 = [(JavaIoRandomAccessFile *)self getFilePointer];
  int64_t v6 = [(JavaIoRandomAccessFile *)self length];
  if (v5 + v3 > v6) {
    int v3 = v6 - v5;
  }
  [(JavaIoRandomAccessFile *)self seekWithLong:v5 + v3];
  return v3;
}

- (void)writeWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  [(JavaIoRandomAccessFile *)self writeWithByteArray:a3 withInt:0 withInt:v3];
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  LibcoreIoIoBridge_writeWithJavaIoFileDescriptor_withByteArray_withInt_withInt_((uint64_t)self->fd_, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
  if (self->syncMetadata_)
  {
    fd = self->fd_;
    if (!fd) {
      JreThrowNullPointerException();
    }
    [(JavaIoFileDescriptor *)fd sync];
  }
}

- (void)writeWithInt:(int)a3
{
  scratch = self->scratch_;
  if (!scratch) {
    JreThrowNullPointerException();
  }
  uint64_t size = scratch->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  *((unsigned char *)&scratch->super.size_ + 4) = a3;
  int64_t v6 = self->scratch_;
  [(JavaIoRandomAccessFile *)self writeWithByteArray:v6 withInt:0 withInt:1];
}

- (void)writeByteWithInt:(int)a3
{
}

- (void)writeBytesWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int64_t v5 = +[IOSByteArray arrayWithLength:](IOSByteArray, "arrayWithLength:", (int)[a3 length]);
  if ((int)[a3 length] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      unsigned __int8 v7 = [a3 charAtWithInt:v6];
      uint64_t size = v5->super.size_;
      if (v6 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      *((unsigned char *)&v5->super.size_ + v6++ + 4) = v7;
    }
    while (v6 < (int)[a3 length]);
  }
  [(JavaIoRandomAccessFile *)self writeWithByteArray:v5];
}

- (void)writeCharWithInt:(int)a3
{
}

- (void)writeCharsWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 getBytesWithCharsetName:@"UTF-16BE"];
  [(JavaIoRandomAccessFile *)self writeWithByteArray:v4];
}

- (void)writeDoubleWithDouble:(double)a3
{
  unint64_t v4 = JavaLangDouble_doubleToLongBitsWithDouble_(a3);
  sub_1001C42C0(self, v4);
}

- (void)writeFloatWithFloat:(float)a3
{
  unsigned int v4 = JavaLangFloat_floatToIntBitsWithFloat_(a3);
  sub_1001C4388(self, v4);
}

- (void)writeIntWithInt:(int)a3
{
}

- (void)writeLongWithLong:(int64_t)a3
{
}

- (void)writeShortWithInt:(int)a3
{
}

- (void)writeUTFWithNSString:(id)a3
{
  unsigned int v4 = JavaNioCharsetModifiedUtf8_encodeWithNSString_(a3);
  [(JavaIoRandomAccessFile *)self writeWithByteArray:v4];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004225D0;
}

@end