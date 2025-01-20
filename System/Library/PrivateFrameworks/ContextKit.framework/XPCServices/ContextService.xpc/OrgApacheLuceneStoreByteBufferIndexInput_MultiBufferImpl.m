@interface OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl
- (OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl)initWithNSString:(id)a3 withJavaNioByteBufferArray:(id)a4 withInt:(int)a5 withLong:(int64_t)a6 withInt:(int)a7 withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner:(id)a8 withOrgApacheLuceneUtilWeakIdentityMap:(id)a9;
- (char)readByteWithLong:(int64_t)a3;
- (id)buildSliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int)readIntWithLong:(int64_t)a3;
- (int64_t)getFilePointer;
- (int64_t)readLongWithLong:(int64_t)a3;
- (signed)readShortWithLong:(int64_t)a3;
- (void)seekWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl

- (OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl)initWithNSString:(id)a3 withJavaNioByteBufferArray:(id)a4 withInt:(int)a5 withLong:(int64_t)a6 withInt:(int)a7 withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner:(id)a8 withOrgApacheLuceneUtilWeakIdentityMap:(id)a9
{
  return self;
}

- (void)seekWithLong:(int64_t)a3
{
  int64_t v3 = self->offset_ + a3;
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl;
  [(OrgApacheLuceneStoreByteBufferIndexInput *)&v4 seekWithLong:v3];
}

- (int64_t)getFilePointer
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl;
  return [(OrgApacheLuceneStoreByteBufferIndexInput *)&v3 getFilePointer] - self->offset_;
}

- (char)readByteWithLong:(int64_t)a3
{
  int64_t v3 = self->offset_ + a3;
  v5.receiver = self;
  v5.super_class = (Class)OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl;
  return [(OrgApacheLuceneStoreByteBufferIndexInput *)&v5 readByteWithLong:v3];
}

- (signed)readShortWithLong:(int64_t)a3
{
  int64_t v3 = self->offset_ + a3;
  v5.receiver = self;
  v5.super_class = (Class)OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl;
  return [(OrgApacheLuceneStoreByteBufferIndexInput *)&v5 readShortWithLong:v3];
}

- (int)readIntWithLong:(int64_t)a3
{
  int64_t v3 = self->offset_ + a3;
  v5.receiver = self;
  v5.super_class = (Class)OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl;
  return [(OrgApacheLuceneStoreByteBufferIndexInput *)&v5 readIntWithLong:v3];
}

- (int64_t)readLongWithLong:(int64_t)a3
{
  int64_t v3 = self->offset_ + a3;
  v5.receiver = self;
  v5.super_class = (Class)OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl;
  return [(OrgApacheLuceneStoreByteBufferIndexInput *)&v5 readLongWithLong:v3];
}

- (id)buildSliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  int64_t v5 = self->offset_ + a4;
  v7.receiver = self;
  v7.super_class = (Class)OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl;
  return [(OrgApacheLuceneStoreByteBufferIndexInput *)&v7 buildSliceWithNSString:a3 withLong:v5 withLong:a5];
}

@end