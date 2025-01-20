@interface OrgApacheLuceneUtilPackedPackedInts_MutableImpl
- (OrgApacheLuceneUtilPackedPackedInts_MutableImpl)initWithInt:(int)a3 withInt:(int)a4;
- (id)description;
- (int)getBitsPerValue;
- (int)size;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_MutableImpl

- (OrgApacheLuceneUtilPackedPackedInts_MutableImpl)initWithInt:(int)a3 withInt:(int)a4
{
  self->valueCount_ = a3;
  self->bitsPerValue_ = a4;
  return self;
}

- (int)getBitsPerValue
{
  return self->bitsPerValue_;
}

- (int)size
{
  return self->valueCount_;
}

- (id)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneUtilPackedPackedInts_MutableImpl getClass](self, "getClass"), "getSimpleName");
  return (id)JreStrcat("$$I$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

@end