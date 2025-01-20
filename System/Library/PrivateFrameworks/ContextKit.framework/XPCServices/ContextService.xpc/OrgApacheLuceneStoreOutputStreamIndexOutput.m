@interface OrgApacheLuceneStoreOutputStreamIndexOutput
- (OrgApacheLuceneStoreOutputStreamIndexOutput)initWithNSString:(id)a3 withJavaIoOutputStream:(id)a4 withInt:(int)a5;
- (int64_t)getChecksum;
- (int64_t)getFilePointer;
- (void)close;
- (void)dealloc;
- (void)writeByteWithByte:(char)a3;
- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneStoreOutputStreamIndexOutput

- (OrgApacheLuceneStoreOutputStreamIndexOutput)initWithNSString:(id)a3 withJavaIoOutputStream:(id)a4 withInt:(int)a5
{
  return self;
}

- (void)writeByteWithByte:(char)a3
{
  os = self->os_;
  if (!os) {
    JreThrowNullPointerException();
  }
  [(JavaIoBufferedOutputStream *)os writeWithInt:a3];
  ++self->bytesWritten_;
}

- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  os = self->os_;
  if (!os) {
    JreThrowNullPointerException();
  }
  -[JavaIoBufferedOutputStream writeWithByteArray:withInt:withInt:](os, "writeWithByteArray:withInt:withInt:", a3, *(void *)&a4);
  self->bytesWritten_ += a5;
}

- (void)close
{
  os = self->os_;
  if (!self->flushedOnClose_)
  {
    self->flushedOnClose_ = 1;
    if (!os) {
      JreThrowNullPointerException();
    }
    [(JavaIoBufferedOutputStream *)os flush];
    goto LABEL_6;
  }
  if (os) {
LABEL_6:
  }
    [(JavaIoBufferedOutputStream *)os close];
}

- (int64_t)getFilePointer
{
  return self->bytesWritten_;
}

- (int64_t)getChecksum
{
  os = self->os_;
  if (!os || ([(JavaIoBufferedOutputStream *)os flush], (crc = self->crc_) == 0)) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilZipCRC32 *)crc getValue];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreOutputStreamIndexOutput;
  [(OrgApacheLuceneStoreIndexOutput *)&v3 dealloc];
}

@end