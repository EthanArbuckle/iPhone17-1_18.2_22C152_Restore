@interface OrgApacheLuceneUtilPackedPackedInts_ReaderImpl
- (OrgApacheLuceneUtilPackedPackedInts_ReaderImpl)initWithInt:(int)a3;
- (int)size;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_ReaderImpl

- (OrgApacheLuceneUtilPackedPackedInts_ReaderImpl)initWithInt:(int)a3
{
  self->valueCount_ = a3;
  return self;
}

- (int)size
{
  return self->valueCount_;
}

@end