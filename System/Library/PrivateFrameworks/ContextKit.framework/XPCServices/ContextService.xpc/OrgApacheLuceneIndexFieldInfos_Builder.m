@interface OrgApacheLuceneIndexFieldInfos_Builder
- (OrgApacheLuceneIndexFieldInfos_Builder)init;
- (OrgApacheLuceneIndexFieldInfos_Builder)initWithOrgApacheLuceneIndexFieldInfos_FieldNumbers:(id)a3;
- (id)addOrUpdateInternalWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withOrgApacheLuceneIndexIndexOptionsEnum:(id)a8 withOrgApacheLuceneIndexDocValuesTypeEnum:(id)a9;
- (id)addWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)fieldInfoWithNSString:(id)a3;
- (id)finish;
- (id)getOrAddWithNSString:(id)a3;
- (void)addWithOrgApacheLuceneIndexFieldInfos:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexFieldInfos_Builder

- (OrgApacheLuceneIndexFieldInfos_Builder)init
{
  return self;
}

- (OrgApacheLuceneIndexFieldInfos_Builder)initWithOrgApacheLuceneIndexFieldInfos_FieldNumbers:(id)a3
{
  p_byName = &self->byName_;
  v6 = new_JavaUtilHashMap_init();
  JreStrongAssignAndConsume((id *)p_byName, v6);
  JreStrongAssign((id *)&self->globalFieldNumbers_, a3);
  return self;
}

- (void)addWithOrgApacheLuceneIndexFieldInfos:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        -[OrgApacheLuceneIndexFieldInfos_Builder addWithOrgApacheLuceneIndexFieldInfo:](self, "addWithOrgApacheLuceneIndexFieldInfo:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9);
      }
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)getOrAddWithNSString:(id)a3
{
  id v5 = -[OrgApacheLuceneIndexFieldInfos_Builder fieldInfoWithNSString:](self, "fieldInfoWithNSString:");
  if (!v5)
  {
    globalFieldNumbers = self->globalFieldNumbers_;
    if (!globalFieldNumbers) {
      JreThrowNullPointerException();
    }
    if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    int v7 = [(OrgApacheLuceneIndexFieldInfos_FieldNumbers *)globalFieldNumbers addOrGetWithNSString:a3 withInt:0xFFFFFFFFLL withOrgApacheLuceneIndexDocValuesTypeEnum:OrgApacheLuceneIndexDocValuesTypeEnum_values_];
    if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v8 = OrgApacheLuceneIndexIndexOptionsEnum_values_[0];
    if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    uint64_t v9 = OrgApacheLuceneIndexDocValuesTypeEnum_values_;
    long long v10 = new_JavaUtilHashMap_init();
    id v5 = new_OrgApacheLuceneIndexFieldInfo_initWithNSString_withInt_withBoolean_withBoolean_withBoolean_withOrgApacheLuceneIndexIndexOptionsEnum_withOrgApacheLuceneIndexDocValuesTypeEnum_withLong_withJavaUtilMap_((uint64_t)a3, v7, 0, 0, 0, v8, v9, -1, (uint64_t)v10);
    long long v11 = self->globalFieldNumbers_;
    long long v12 = JavaLangInteger_valueOfWithInt_(v5->number_);
    name = v5->name_;
    if ((atomic_load_explicit(OrgApacheLuceneIndexDocValuesTypeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [(OrgApacheLuceneIndexFieldInfos_FieldNumbers *)v11 verifyConsistentWithJavaLangInteger:v12 withNSString:name withOrgApacheLuceneIndexDocValuesTypeEnum:OrgApacheLuceneIndexDocValuesTypeEnum_values_];
    [(JavaUtilHashMap *)self->byName_ putWithId:v5->name_ withId:v5];
  }
  return v5;
}

- (id)addOrUpdateInternalWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6 withBoolean:(BOOL)a7 withOrgApacheLuceneIndexIndexOptionsEnum:(id)a8 withOrgApacheLuceneIndexDocValuesTypeEnum:(id)a9
{
  return sub_100041664((id *)&self->super.isa, (uint64_t)a3, *(uint64_t *)&a4, a5, a6, a7, (uint64_t)a8, (uint64_t)a9);
}

- (id)addWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *((void *)a3 + 1);
  uint64_t v6 = *((unsigned int *)a3 + 4);
  id v7 = [a3 hasVectors];
  id v8 = [a3 omitsNorms];
  id v9 = [a3 hasPayloads];
  id v10 = [a3 getIndexOptions];
  id v11 = [a3 getDocValuesType];
  return sub_100041664((id *)&self->super.isa, v5, v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11);
}

- (id)fieldInfoWithNSString:(id)a3
{
  byName = self->byName_;
  if (!byName) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilHashMap *)byName getWithId:a3];
}

- (id)finish
{
  byName = self->byName_;
  if (!byName || (id v4 = [(JavaUtilHashMap *)byName values]) == 0) {
    JreThrowNullPointerException();
  }
  id v5 = objc_msgSend(v4, "toArrayWithNSObjectArray:", +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", -[JavaUtilHashMap size](self->byName_, "size"), OrgApacheLuceneIndexFieldInfo_class_()));
  uint64_t v6 = [OrgApacheLuceneIndexFieldInfos alloc];
  OrgApacheLuceneIndexFieldInfos_initWithOrgApacheLuceneIndexFieldInfoArray_((uint64_t)v6, (uint64_t)v5);
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexFieldInfos_Builder;
  [(OrgApacheLuceneIndexFieldInfos_Builder *)&v3 dealloc];
}

@end