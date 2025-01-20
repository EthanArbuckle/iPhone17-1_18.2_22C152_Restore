@interface OrgApacheLuceneUtilPackedMonotonicBlockPackedReader_$1
- (OrgApacheLuceneUtilPackedMonotonicBlockPackedReader_$1)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6 withBoolean:(BOOL)a7;
- (int64_t)decodeDeltaWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneUtilPackedMonotonicBlockPackedReader_$1

- (int64_t)decodeDeltaWithLong:(int64_t)a3
{
  return OrgApacheLuceneUtilBitUtil_zigZagDecodeWithLong_(a3);
}

- (OrgApacheLuceneUtilPackedMonotonicBlockPackedReader_$1)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withLong:(int64_t)a6 withBoolean:(BOOL)a7
{
  return self;
}

@end