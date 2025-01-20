@interface OrgApacheLuceneUtilFstUtil_TopResults
- (OrgApacheLuceneUtilFstUtil_TopResults)initWithBoolean:(BOOL)a3 withJavaUtilList:(id)a4;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilFstUtil_TopResults

- (OrgApacheLuceneUtilFstUtil_TopResults)initWithBoolean:(BOOL)a3 withJavaUtilList:(id)a4
{
  self->isComplete_ = a3;
  return self;
}

- (id)iterator
{
  topN = self->topN_;
  if (!topN) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilList *)topN iterator];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilFstUtil_TopResults;
  [(OrgApacheLuceneUtilFstUtil_TopResults *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end