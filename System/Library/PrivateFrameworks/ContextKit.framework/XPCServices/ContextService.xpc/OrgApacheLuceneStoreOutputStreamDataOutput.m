@interface OrgApacheLuceneStoreOutputStreamDataOutput
- (OrgApacheLuceneStoreOutputStreamDataOutput)initWithJavaIoOutputStream:(id)a3;
- (void)close;
- (void)dealloc;
- (void)writeByteWithByte:(char)a3;
- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneStoreOutputStreamDataOutput

- (OrgApacheLuceneStoreOutputStreamDataOutput)initWithJavaIoOutputStream:(id)a3
{
  return self;
}

- (void)writeByteWithByte:(char)a3
{
  os = self->os_;
  if (!os) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)os writeWithInt:a3];
}

- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  os = self->os_;
  if (!os) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)os writeWithByteArray:a3 withInt:*(void *)&a4 withInt:*(void *)&a5];
}

- (void)close
{
  os = self->os_;
  if (!os) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)os close];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreOutputStreamDataOutput;
  [(OrgApacheLuceneStoreDataOutput *)&v3 dealloc];
}

@end