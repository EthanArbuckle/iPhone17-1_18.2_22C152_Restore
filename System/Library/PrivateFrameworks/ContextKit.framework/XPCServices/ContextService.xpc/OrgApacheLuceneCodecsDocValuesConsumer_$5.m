@interface OrgApacheLuceneCodecsDocValuesConsumer_$5
- (OrgApacheLuceneCodecsDocValuesConsumer_$5)initWithOrgApacheLuceneIndexMultiDocValues_OrdinalMap:(id)a3 withOrgApacheLuceneIndexSortedDocValuesArray:(id)a4;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$5

- (id)iterator
{
  v3 = [OrgApacheLuceneCodecsDocValuesConsumer__5__1 alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  return v3;
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$5)initWithOrgApacheLuceneIndexMultiDocValues_OrdinalMap:(id)a3 withOrgApacheLuceneIndexSortedDocValuesArray:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__5;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$5 *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end