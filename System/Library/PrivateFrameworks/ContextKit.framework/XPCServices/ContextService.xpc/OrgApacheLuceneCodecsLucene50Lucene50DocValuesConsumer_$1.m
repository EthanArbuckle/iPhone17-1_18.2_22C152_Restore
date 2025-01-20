@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1)initWithJavaLangIterable:(id)a3 withJavaLangIterable:(id)a4 withJavaUtilMap:(id)a5;
- (id)iterator;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1

- (id)iterator
{
  v3 = self->val$docToValueCount_;
  if (!v3 || (id v4 = [(JavaLangIterable *)v3 iterator], (v5 = self->val$values_) == 0)) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaLangIterable *)v5 iterator];
  v7 = new_OrgApacheLuceneUtilLongsRef_initWithInt_(256);
  v8 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer__1__1 alloc];
  sub_1000B71F0((id *)&v8->super.isa, self, v4, v7, v6);
  return v8;
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1)initWithJavaLangIterable:(id)a3 withJavaLangIterable:(id)a4 withJavaUtilMap:(id)a5
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer__1;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesConsumer_$1 *)&v3 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return JreDefaultFastEnumeration(self, a3, (uint64_t)a4, a5);
}

@end