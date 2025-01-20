@interface OrgApacheLuceneStoreByteBufferIndexInput_SingleBufferImpl
- (OrgApacheLuceneStoreByteBufferIndexInput_SingleBufferImpl)initWithNSString:(id)a3 withJavaNioByteBuffer:(id)a4 withLong:(int64_t)a5 withInt:(int)a6 withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner:(id)a7 withOrgApacheLuceneUtilWeakIdentityMap:(id)a8;
- (char)readByteWithLong:(int64_t)a3;
- (int)readIntWithLong:(int64_t)a3;
- (int64_t)getFilePointer;
- (int64_t)readLongWithLong:(int64_t)a3;
- (signed)readShortWithLong:(int64_t)a3;
- (void)seekWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneStoreByteBufferIndexInput_SingleBufferImpl

- (OrgApacheLuceneStoreByteBufferIndexInput_SingleBufferImpl)initWithNSString:(id)a3 withJavaNioByteBuffer:(id)a4 withLong:(int64_t)a5 withInt:(int)a6 withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner:(id)a7 withOrgApacheLuceneUtilWeakIdentityMap:(id)a8
{
  return self;
}

- (void)seekWithLong:(int64_t)a3
{
  curBuf = self->super.curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  [(JavaNioBuffer *)curBuf positionWithInt:a3];
}

- (int64_t)getFilePointer
{
  curBuf = self->super.curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  return [(JavaNioBuffer *)curBuf position];
}

- (char)readByteWithLong:(int64_t)a3
{
  curBuf = self->super.curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)curBuf getWithInt:a3];
}

- (signed)readShortWithLong:(int64_t)a3
{
  curBuf = self->super.curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)curBuf getShortWithInt:a3];
}

- (int)readIntWithLong:(int64_t)a3
{
  curBuf = self->super.curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)curBuf getIntWithInt:a3];
}

- (int64_t)readLongWithLong:(int64_t)a3
{
  curBuf = self->super.curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)curBuf getLongWithInt:a3];
}

@end