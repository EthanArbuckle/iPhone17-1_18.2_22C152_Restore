@interface OrgApacheLuceneCodecsDocValuesConsumer_$9
- (OrgApacheLuceneCodecsDocValuesConsumer_$9)initWithInt:(int)a3 withOrgApacheLuceneIndexMultiDocValues_OrdinalMap:(id)a4 withOrgApacheLuceneIndexMergeState:(id)a5 withOrgApacheLuceneIndexSortedSetDocValuesArray:(id)a6;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$9

- (id)iterator
{
  v3 = [OrgApacheLuceneCodecsDocValuesConsumer__9__1 alloc];
  JreStrongAssign((id *)&v3->this$0_, self);
  v3->readerUpto_ = -1;
  JreStrongAssignAndConsume((id *)&v3->ords_, +[IOSLongArray newArrayWithLength:8]);
  return v3;
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$9)initWithInt:(int)a3 withOrgApacheLuceneIndexMultiDocValues_OrdinalMap:(id)a4 withOrgApacheLuceneIndexMergeState:(id)a5 withOrgApacheLuceneIndexSortedSetDocValuesArray:(id)a6
{
  self->val$numReaders_ = a3;
  JreStrongAssign((id *)&self->val$map_, a4);
  JreStrongAssign((id *)&self->val$mergeState_, a5);
  JreStrongAssign((id *)&self->val$dvs_, a6);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__9;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$9 *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end