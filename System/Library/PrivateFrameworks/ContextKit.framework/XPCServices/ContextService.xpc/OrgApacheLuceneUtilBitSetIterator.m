@interface OrgApacheLuceneUtilBitSetIterator
+ (id)getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
+ (id)getSparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3;
- (OrgApacheLuceneUtilBitSetIterator)initWithOrgApacheLuceneUtilBitSet:(id)a3 withLong:(int64_t)a4;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilBitSetIterator

+ (id)getFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  v4 = (void *)OrgApacheLuceneUtilFixedBitSet_class_();
  return sub_100025AE0((uint64_t)a3, v4);
}

+ (id)getSparseFixedBitSetOrNullWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3
{
  v4 = (void *)OrgApacheLuceneUtilSparseFixedBitSet_class_();
  return sub_100025AE0((uint64_t)a3, v4);
}

- (OrgApacheLuceneUtilBitSetIterator)initWithOrgApacheLuceneUtilBitSet:(id)a3 withLong:(int64_t)a4
{
  return self;
}

- (int)docID
{
  return self->doc_;
}

- (int)nextDoc
{
  return [(OrgApacheLuceneUtilBitSetIterator *)self advanceWithInt:(self->doc_ + 1)];
}

- (int)advanceWithInt:(int)a3
{
  if (self->length_ <= a3)
  {
    int result = 0x7FFFFFFF;
  }
  else
  {
    bits = self->bits_;
    if (!bits) {
      JreThrowNullPointerException();
    }
    int result = -[OrgApacheLuceneUtilBitSet nextSetBitWithInt:](bits, "nextSetBitWithInt:");
  }
  self->doc_ = result;
  return result;
}

- (int64_t)cost
{
  return self->cost_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilBitSetIterator;
  [(OrgApacheLuceneUtilBitSetIterator *)&v3 dealloc];
}

@end