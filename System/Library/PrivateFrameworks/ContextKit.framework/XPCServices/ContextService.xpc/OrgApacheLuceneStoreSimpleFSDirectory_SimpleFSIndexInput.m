@interface OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput
- (OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput)initWithNSString:(id)a3 withJavaNioChannelsSeekableByteChannel:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withInt:(int)a7;
- (OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput)initWithNSString:(id)a3 withJavaNioChannelsSeekableByteChannel:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5;
- (id)clone;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)length;
- (void)close;
- (void)dealloc;
- (void)newBufferWithByteArray:(id)a3;
- (void)readInternalWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput

- (OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput)initWithNSString:(id)a3 withJavaNioChannelsSeekableByteChannel:(id)a4 withOrgApacheLuceneStoreIOContext:(id)a5
{
  return self;
}

- (OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput)initWithNSString:(id)a3 withJavaNioChannelsSeekableByteChannel:(id)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withInt:(int)a7
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
    [(JavaNioChannelsSeekableByteChannel *)channel close];
  }
}

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput;
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
  v15 = [OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput alloc];
  OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput_initWithNSString_withJavaNioChannelsSeekableByteChannel_withLong_withLong_withInt_((uint64_t)v15, v11, channel, v13, a5, v14);
  return v15;
}

- (int64_t)length
{
  return self->end_ - self->off_;
}

- (void)newBufferWithByteArray:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput;
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
  channel = self->channel_;
  objc_sync_enter(channel);
  v18 = (char *)[(OrgApacheLuceneStoreBufferedIndexInput *)self getFilePointer] + self->off_;
  if ((uint64_t)&v18[a5] > self->end_)
  {
    CFStringRef v33 = JreStrcat("$@", v11, v12, v13, v14, v15, v16, v17, @"read past EOF: ");
    v34 = new_JavaIoEOFException_initWithNSString_((uint64_t)v33);
    objc_exception_throw(v34);
  }
  v19 = self->channel_;
  if (!v19) {
    JreThrowNullPointerException();
  }
  [(JavaNioChannelsSeekableByteChannel *)v19 positionWithLong:v18];
  if (a5 >= 1)
  {
    int v20 = a5;
    do
    {
      int v21 = JavaLangMath_minWithInt_withInt_(0x4000, v20);
      if (!byteBuf) {
        JreThrowNullPointerException();
      }
      [(JavaNioBuffer *)byteBuf limitWithInt:[(JavaNioBuffer *)byteBuf position] + v21];
      unsigned int v22 = [(JavaNioChannelsSeekableByteChannel *)self->channel_ readWithJavaNioByteBuffer:byteBuf];
      if ((v22 & 0x80000000) != 0)
      {
        CFStringRef v31 = JreStrcat("$@$I$I$J$I$J", v23, v24, v25, v26, v27, v28, v29, @"read past EOF: ");
        v32 = new_JavaIoEOFException_initWithNSString_((uint64_t)v31);
        objc_exception_throw(v32);
      }
      v18 += v22;
      BOOL v30 = __OFSUB__(v20, v22);
      v20 -= v22;
    }
    while (!((v20 < 0) ^ v30 | (v20 == 0)));
  }
  objc_sync_exit(channel);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreSimpleFSDirectory_SimpleFSIndexInput;
  [(OrgApacheLuceneStoreBufferedIndexInput *)&v3 dealloc];
}

@end