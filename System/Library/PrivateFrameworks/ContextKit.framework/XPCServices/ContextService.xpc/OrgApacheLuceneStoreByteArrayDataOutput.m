@interface OrgApacheLuceneStoreByteArrayDataOutput
- (OrgApacheLuceneStoreByteArrayDataOutput)init;
- (OrgApacheLuceneStoreByteArrayDataOutput)initWithByteArray:(id)a3;
- (OrgApacheLuceneStoreByteArrayDataOutput)initWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)getPosition;
- (void)dealloc;
- (void)resetWithByteArray:(id)a3;
- (void)resetWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeByteWithByte:(char)a3;
- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneStoreByteArrayDataOutput

- (OrgApacheLuceneStoreByteArrayDataOutput)initWithByteArray:(id)a3
{
  return self;
}

- (OrgApacheLuceneStoreByteArrayDataOutput)initWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  OrgApacheLuceneStoreDataOutput_init(self, a2);
  [(OrgApacheLuceneStoreByteArrayDataOutput *)self resetWithByteArray:a3 withInt:v6 withInt:v5];
  return self;
}

- (OrgApacheLuceneStoreByteArrayDataOutput)init
{
  return self;
}

- (void)resetWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  [(OrgApacheLuceneStoreByteArrayDataOutput *)self resetWithByteArray:a3 withInt:0 withInt:v3];
}

- (void)resetWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->pos_ = a4;
  self->limit_ = a5 + a4;
}

- (int)getPosition
{
  return self->pos_;
}

- (void)writeByteWithByte:(char)a3
{
  bytes = self->bytes_;
  if (!bytes) {
    JreThrowNullPointerException();
  }
  int pos = self->pos_;
  self->pos_ = pos + 1;
  uint64_t size = bytes->super.size_;
  if (pos < 0 || pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  *((unsigned char *)&bytes->super.size_ + pos + 4) = a3;
}

- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->pos_ += a5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreByteArrayDataOutput;
  [(OrgApacheLuceneStoreDataOutput *)&v3 dealloc];
}

@end