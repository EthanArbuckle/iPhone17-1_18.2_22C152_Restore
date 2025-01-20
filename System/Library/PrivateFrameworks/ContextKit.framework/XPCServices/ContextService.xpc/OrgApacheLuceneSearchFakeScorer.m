@interface OrgApacheLuceneSearchFakeScorer
- (OrgApacheLuceneSearchFakeScorer)init;
- (float)score;
- (id)getChildren;
- (id)getWeight;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int64_t)cost;
@end

@implementation OrgApacheLuceneSearchFakeScorer

- (OrgApacheLuceneSearchFakeScorer)init
{
  self->doc_ = -1;
  self->freq_ = 1;
  return self;
}

- (int)advanceWithInt:(int)a3
{
  v3 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"FakeScorer doesn't support advance(int)");
  objc_exception_throw(v3);
}

- (int)docID
{
  return self->doc_;
}

- (int)freq
{
  return self->freq_;
}

- (int)nextDoc
{
  v2 = new_JavaLangUnsupportedOperationException_initWithNSString_(@"FakeScorer doesn't support nextDoc()");
  objc_exception_throw(v2);
}

- (float)score
{
  return self->score_;
}

- (int64_t)cost
{
  return 1;
}

- (id)getWeight
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)getChildren
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

@end