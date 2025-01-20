@interface OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput
- (OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput)initWithNSString:(id)a3 withJavaNioChannelsFileChannel:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withInt:(int)a7;
- (OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput)initWithNSString:(id)a3 withJavaNioChannelsFileChannel:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
- (id)clone;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)length;
- (void)close;
- (void)dealloc;
- (void)newBufferWithByteArray:(id)a3;
- (void)readInternalWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput

- (OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput)initWithNSString:(id)a3 withJavaNioChannelsFileChannel:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  return self;
}

- (OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput)initWithNSString:(id)a3 withJavaNioChannelsFileChannel:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withInt:(int)a7
{
  return self;
}

- (void)close
{
  if (!self->isClone_)
  {
    channel = self->channel_;
    if (!channel) {
      JreThrowNullPointerException();
    }
    [(JavaNioChannelsSpiAbstractInterruptibleChannel *)channel close];
  }
}

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput;
  v2 = [(OrgApacheLuceneStoreBufferedIndexInput *)&v4 clone];
  objc_opt_class();
  if (!v2) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v2[64] = 1;
  return v2;
}

- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  if ((a5 | a4) < 0 || a5 + a4 > self->end_ - self->off_)
  {
    CFStringRef v17 = JreStrcat("$$$@", (uint64_t)a2, (uint64_t)a3, a4, a5, v5, v6, v7, @"slice() ");
    v18 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v17);
    objc_exception_throw(v18);
  }
  id v11 = [(OrgApacheLuceneStoreIndexInput *)self getFullSliceDescriptionWithNSString:a3];
  channel = self->channel_;
  uint64_t v13 = self->off_ + a4;
  uint64_t v14 = [(OrgApacheLuceneStoreBufferedIndexInput *)self getBufferSize];
  v15 = [OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput alloc];
  OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput_initWithNSString_withJavaNioChannelsFileChannel_withLong_withLong_withInt_((uint64_t)v15, v11, channel, v13, a5, v14);
  return v15;
}

- (int64_t)length
{
  return self->end_ - self->off_;
}

- (void)newBufferWithByteArray:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput;
  -[OrgApacheLuceneStoreBufferedIndexInput newBufferWithByteArray:](&v6, "newBufferWithByteArray:");
  uint64_t v5 = JavaNioByteBuffer_wrapWithByteArray_(a3);
  JreStrongAssign((id *)&self->byteBuf_, v5);
}

- (void)readInternalWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  if (self->super.buffer_ == a3)
  {
    byteBuf = (JavaNioByteArrayBuffer *)self->byteBuf_;
    if (!byteBuf || (id v9 = [(JavaNioBuffer *)self->byteBuf_ clear]) == 0) {
      JreThrowNullPointerException();
    }
    [v9 positionWithInt:v6];
  }
  else
  {
    byteBuf = JavaNioByteBuffer_wrapWithByteArray_withInt_withInt_(a3, a4, a5);
  }
  CFStringRef v17 = (char *)[(OrgApacheLuceneStoreBufferedIndexInput *)self getFilePointer] + self->off_;
  if ((uint64_t)&v17[a5] > self->end_)
  {
    CFStringRef v32 = JreStrcat("$@", v10, v11, v12, v13, v14, v15, v16, @"read past EOF: ");
    v33 = new_JavaIoEOFException_initWithNSString_((uint64_t)v32);
    objc_exception_throw(v33);
  }
  if (a5 >= 1)
  {
    int v18 = a5;
    do
    {
      int v19 = JavaLangMath_minWithInt_withInt_(0x4000, v18);
      if (!byteBuf) {
        JreThrowNullPointerException();
      }
      [(JavaNioBuffer *)byteBuf limitWithInt:[(JavaNioBuffer *)byteBuf position] + v19];
      channel = self->channel_;
      if (!channel) {
        JreThrowNullPointerException();
      }
      unsigned int v21 = [(JavaNioChannelsFileChannel *)channel readWithJavaNioByteBuffer:byteBuf withLong:v17];
      if ((v21 & 0x80000000) != 0)
      {
        CFStringRef v30 = JreStrcat("$@$I$I$J$I$J", v22, v23, v24, v25, v26, v27, v28, @"read past EOF: ");
        v31 = new_JavaIoEOFException_initWithNSString_((uint64_t)v30);
        objc_exception_throw(v31);
      }
      v17 += v21;
      BOOL v29 = __OFSUB__(v18, v21);
      v18 -= v21;
    }
    while (!((v18 < 0) ^ v29 | (v18 == 0)));
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreNIOFSDirectory_NIOFSIndexInput;
  [(OrgApacheLuceneStoreBufferedIndexInput *)&v3 dealloc];
}

@end