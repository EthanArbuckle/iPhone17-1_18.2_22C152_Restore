@interface OrgApacheLuceneSearchFilterLeafCollector
- (NSString)description;
- (OrgApacheLuceneSearchFilterLeafCollector)initWithOrgApacheLuceneSearchLeafCollector:(id)a3;
- (void)collectWithInt:(int)a3;
- (void)dealloc;
- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3;
@end

@implementation OrgApacheLuceneSearchFilterLeafCollector

- (OrgApacheLuceneSearchFilterLeafCollector)initWithOrgApacheLuceneSearchLeafCollector:(id)a3
{
  return self;
}

- (void)setScorerWithOrgApacheLuceneSearchScorer:(id)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchLeafCollector *)in setScorerWithOrgApacheLuceneSearchScorer:a3];
}

- (void)collectWithInt:(int)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchLeafCollector *)in collectWithInt:*(void *)&a3];
}

- (NSString)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneSearchFilterLeafCollector getClass](self, "getClass"), "getSimpleName");
  return (NSString *)JreStrcat("$C@C", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFilterLeafCollector;
  [(OrgApacheLuceneSearchFilterLeafCollector *)&v3 dealloc];
}

@end