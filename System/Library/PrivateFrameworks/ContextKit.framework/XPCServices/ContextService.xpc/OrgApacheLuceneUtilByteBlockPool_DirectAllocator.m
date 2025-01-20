@interface OrgApacheLuceneUtilByteBlockPool_DirectAllocator
- (OrgApacheLuceneUtilByteBlockPool_DirectAllocator)init;
- (OrgApacheLuceneUtilByteBlockPool_DirectAllocator)initWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilByteBlockPool_DirectAllocator

- (OrgApacheLuceneUtilByteBlockPool_DirectAllocator)init
{
  self->super.blockSize_ = 0x8000;
  return self;
}

- (OrgApacheLuceneUtilByteBlockPool_DirectAllocator)initWithInt:(int)a3
{
  self->super.blockSize_ = a3;
  return self;
}

@end