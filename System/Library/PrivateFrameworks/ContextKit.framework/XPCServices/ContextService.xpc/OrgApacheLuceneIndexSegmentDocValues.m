@interface OrgApacheLuceneIndexSegmentDocValues
- (OrgApacheLuceneIndexSegmentDocValues)init;
- (id)getDocValuesProducerWithLong:(int64_t)a3 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a4 withOrgApacheLuceneStoreDirectory:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6;
- (id)newDocValuesProducerWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withJavaLangLong:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6;
- (void)dealloc;
- (void)decRefWithJavaUtilList:(id)a3;
@end

@implementation OrgApacheLuceneIndexSegmentDocValues

- (id)newDocValuesProducerWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withJavaLangLong:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6
{
  return sub_100020C48(self, (uint64_t)a3, a4, a5, a6);
}

- (id)getDocValuesProducerWithLong:(int64_t)a3 withOrgApacheLuceneIndexSegmentCommitInfo:(id)a4 withOrgApacheLuceneStoreDirectory:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6
{
  objc_sync_enter(self);
  genDVProducers = self->genDVProducers_;
  if (!genDVProducers) {
    goto LABEL_6;
  }
  v12 = (OrgApacheLuceneIndexSegmentDocValues_$1 *)[(JavaUtilMap *)genDVProducers getWithId:JavaLangLong_valueOfWithLong_(a3)];
  v13 = v12;
  if (!v12)
  {
    v14 = JavaLangLong_valueOfWithLong_(a3);
    v13 = sub_100020C48(self, (uint64_t)a4, a5, v14, a6);
    [(JavaUtilMap *)self->genDVProducers_ putWithId:JavaLangLong_valueOfWithLong_(a3) withId:v13];
    if (v13) {
      goto LABEL_5;
    }
LABEL_6:
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneUtilRefCount *)v12 incRef];
LABEL_5:
  id v15 = [(OrgApacheLuceneUtilRefCount *)v13 get];
  objc_sync_exit(self);
  return v15;
}

- (void)decRefWithJavaUtilList:(id)a3
{
  objc_sync_enter(self);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a3);
        }
        genDVProducers = self->genDVProducers_;
        if (!genDVProducers) {
          JreThrowNullPointerException();
        }
        id v9 = -[JavaUtilMap getWithId:](genDVProducers, "getWithId:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v7), (void)v11);
        if (!v9) {
          JreThrowNullPointerException();
        }
        [v9 decRef];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v10 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v5 = v10;
    }
    while (v10);
  }
  objc_sync_exit(self);
}

- (OrgApacheLuceneIndexSegmentDocValues)init
{
  p_genDVProducers = &self->genDVProducers_;
  v4 = new_JavaUtilHashMap_init();
  JreStrongAssignAndConsume((id *)p_genDVProducers, v4);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentDocValues;
  [(OrgApacheLuceneIndexSegmentDocValues *)&v3 dealloc];
}

@end