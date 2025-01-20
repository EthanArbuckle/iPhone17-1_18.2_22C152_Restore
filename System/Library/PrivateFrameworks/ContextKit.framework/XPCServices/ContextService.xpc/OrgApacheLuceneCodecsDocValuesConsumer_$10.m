@interface OrgApacheLuceneCodecsDocValuesConsumer_$10
- (OrgApacheLuceneCodecsDocValuesConsumer_$10)initWithJavaLangIterable:(id)a3 withJavaLangIterable:(id)a4 withNSNumber:(id)a5;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsDocValuesConsumer_$10

- (id)iterator
{
  v3 = self->val$docToValueCount_;
  if (!v3 || (id v4 = [(JavaLangIterable *)v3 iterator], (v5 = self->val$values_) == 0)) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaLangIterable *)v5 iterator];
  v7 = [OrgApacheLuceneCodecsDocValuesConsumer__10__1 alloc];
  JreStrongAssign((id *)&v7->this$0_, self);
  JreStrongAssign((id *)&v7->val$countIterator_, v4);
  JreStrongAssign((id *)&v7->val$valuesIterator_, v6);
  return v7;
}

- (OrgApacheLuceneCodecsDocValuesConsumer_$10)initWithJavaLangIterable:(id)a3 withJavaLangIterable:(id)a4 withNSNumber:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsDocValuesConsumer__10;
  [(OrgApacheLuceneCodecsDocValuesConsumer_$10 *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end