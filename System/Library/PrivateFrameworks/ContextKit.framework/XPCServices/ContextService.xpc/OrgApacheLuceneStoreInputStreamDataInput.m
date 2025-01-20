@interface OrgApacheLuceneStoreInputStreamDataInput
- (OrgApacheLuceneStoreInputStreamDataInput)initWithJavaIoInputStream:(id)a3;
- (char)readByte;
- (void)close;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneStoreInputStreamDataInput

- (OrgApacheLuceneStoreInputStreamDataInput)initWithJavaIoInputStream:(id)a3
{
  return self;
}

- (char)readByte
{
  is = self->is_;
  if (!is) {
    JreThrowNullPointerException();
  }
  unsigned int v3 = [(JavaIoInputStream *)is read];
  if (v3 == -1)
  {
    v4 = new_JavaIoEOFException_init();
    objc_exception_throw(v4);
  }
  return v3;
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a5 >= 1)
  {
    uint64_t v5 = *(void *)&a5;
    uint64_t v6 = *(void *)&a4;
    do
    {
      is = self->is_;
      if (!is) {
        JreThrowNullPointerException();
      }
      unsigned int v10 = [(JavaIoInputStream *)is readWithByteArray:a3 withInt:v6 withInt:v5];
      if ((v10 & 0x80000000) != 0)
      {
        v12 = new_JavaIoEOFException_init();
        objc_exception_throw(v12);
      }
      uint64_t v6 = v10 + v6;
      BOOL v11 = __OFSUB__(v5, v10);
      uint64_t v5 = v5 - v10;
    }
    while (!(((int)v5 < 0) ^ v11 | (v5 == 0)));
  }
}

- (void)close
{
  is = self->is_;
  if (!is) {
    JreThrowNullPointerException();
  }
  [(JavaIoInputStream *)is close];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreInputStreamDataInput;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

@end