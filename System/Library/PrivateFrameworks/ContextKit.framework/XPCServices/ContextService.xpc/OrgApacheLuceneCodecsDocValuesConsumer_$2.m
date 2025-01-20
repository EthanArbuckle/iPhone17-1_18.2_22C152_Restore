@interface OrgApacheLuceneCodecsDocValuesConsumer_$2
- (OrgApacheLuceneCodecsDocValuesConsumer_$2)initWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4 withOrgApacheLuceneIndexMergeState:(id)a5;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$2

- (id)iterator
{
  v3 = [OrgApacheLuceneCodecsDocValuesConsumer__2__1 alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->readerUpto_ = -1;
  return v3;
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$2)initWithJavaUtilList:(id)a3 withJavaUtilList:(id)a4 withOrgApacheLuceneIndexMergeState:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__2;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$2 *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end