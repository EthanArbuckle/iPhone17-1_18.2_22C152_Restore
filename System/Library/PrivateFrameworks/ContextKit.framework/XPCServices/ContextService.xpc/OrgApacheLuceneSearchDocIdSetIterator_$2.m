@interface OrgApacheLuceneSearchDocIdSetIterator_$2
- (OrgApacheLuceneSearchDocIdSetIterator_$2)initWithInt:(int)a3;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)nextDoc;
- (int64_t)cost;
@end

@implementation OrgApacheLuceneSearchDocIdSetIterator_$2

- (int)docID
{
  return self->doc_;
}

- (int)nextDoc
{
  return [(OrgApacheLuceneSearchDocIdSetIterator_$2 *)self advanceWithInt:(self->doc_ + 1)];
}

- (int)advanceWithInt:(int)a3
{
  self->doc_ = a3;
  if (self->val$maxDoc_ <= a3) {
    int v3 = 0x7FFFFFFF;
  }
  else {
    int v3 = a3;
  }
  self->doc_ = v3;
  return v3;
}

- (int64_t)cost
{
  return self->val$maxDoc_;
}

- (OrgApacheLuceneSearchDocIdSetIterator_$2)initWithInt:(int)a3
{
  self->val$maxDoc_ = a3;
  self->doc_ = -1;
  return self;
}

@end