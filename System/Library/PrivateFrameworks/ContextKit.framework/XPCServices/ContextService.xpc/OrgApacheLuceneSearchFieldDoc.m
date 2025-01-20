@interface OrgApacheLuceneSearchFieldDoc
- (OrgApacheLuceneSearchFieldDoc)initWithInt:(int)a3 withFloat:(float)a4;
- (OrgApacheLuceneSearchFieldDoc)initWithInt:(int)a3 withFloat:(float)a4 withNSObjectArray:(id)a5;
- (OrgApacheLuceneSearchFieldDoc)initWithInt:(int)a3 withFloat:(float)a4 withNSObjectArray:(id)a5 withInt:(int)a6;
- (id)description;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchFieldDoc

- (OrgApacheLuceneSearchFieldDoc)initWithInt:(int)a3 withFloat:(float)a4
{
  return self;
}

- (OrgApacheLuceneSearchFieldDoc)initWithInt:(int)a3 withFloat:(float)a4 withNSObjectArray:(id)a5
{
  return self;
}

- (OrgApacheLuceneSearchFieldDoc)initWithInt:(int)a3 withFloat:(float)a4 withNSObjectArray:(id)a5 withInt:(int)a6
{
  return self;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneSearchFieldDoc;
  id v3 = [(OrgApacheLuceneSearchScoreDoc *)&v6 description];
  v4 = new_JavaLangStringBuilder_initWithNSString_(v3);
  [(JavaLangStringBuilder *)v4 appendWithNSString:@" fields="];
  [(JavaLangStringBuilder *)v4 appendWithNSString:JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)self->fields_)];
  return [(JavaLangStringBuilder *)v4 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldDoc;
  [(OrgApacheLuceneSearchFieldDoc *)&v3 dealloc];
}

@end