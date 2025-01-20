@interface OrgApacheLuceneSearchDocIdSetIterator_$1
- (OrgApacheLuceneSearchDocIdSetIterator_$1)init;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)nextDoc;
- (int64_t)cost;
@end

@implementation OrgApacheLuceneSearchDocIdSetIterator_$1

- (int)advanceWithInt:(int)a3
{
  self->exhausted_ = 1;
  return 0x7FFFFFFF;
}

- (int)docID
{
  if (self->exhausted_) {
    return 0x7FFFFFFF;
  }
  else {
    return -1;
  }
}

- (int)nextDoc
{
  self->exhausted_ = 1;
  return 0x7FFFFFFF;
}

- (int64_t)cost
{
  return 0;
}

- (OrgApacheLuceneSearchDocIdSetIterator_$1)init
{
  self->exhausted_ = 0;
  return self;
}

@end