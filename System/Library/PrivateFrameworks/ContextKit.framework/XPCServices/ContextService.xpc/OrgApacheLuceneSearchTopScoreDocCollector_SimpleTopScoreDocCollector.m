@interface OrgApacheLuceneSearchTopScoreDocCollector_SimpleTopScoreDocCollector
- (OrgApacheLuceneSearchTopScoreDocCollector_SimpleTopScoreDocCollector)initWithInt:(int)a3;
- (id)getLeafCollectorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
@end

@implementation OrgApacheLuceneSearchTopScoreDocCollector_SimpleTopScoreDocCollector

- (OrgApacheLuceneSearchTopScoreDocCollector_SimpleTopScoreDocCollector)initWithInt:(int)a3
{
  return self;
}

- (id)getLeafCollectorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v4 = *((_DWORD *)a3 + 8);
  v5 = [OrgApacheLuceneSearchTopScoreDocCollector_SimpleTopScoreDocCollector__1 alloc];
  JreStrongAssign((id *)&v5->this$0_, self);
  v5->val$docBase_ = v4;
  return v5;
}

@end