@interface OrgApacheLuceneCodecsNormsConsumer_$1
- (OrgApacheLuceneCodecsNormsConsumer_$1)initWithJavaUtilList:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsNormsConsumer_$1

- (id)iterator
{
  v3 = [OrgApacheLuceneCodecsNormsConsumer__1__1 alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->readerUpto_ = -1;
  return v3;
}

- (OrgApacheLuceneCodecsNormsConsumer_$1)initWithJavaUtilList:(id)a3 withOrgApacheLuceneIndexMergeState:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsNormsConsumer__1;
  [(OrgApacheLuceneCodecsNormsConsumer_$1 *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end