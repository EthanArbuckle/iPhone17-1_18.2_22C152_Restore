@interface OrgApacheLuceneIndexSegmentDocValuesProducer
+ (void)initialize;
- (OrgApacheLuceneIndexSegmentDocValuesProducer)initWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexFieldInfos:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneIndexSegmentDocValues:(id)a7;
- (id)description;
- (id)getBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getChildResources;
- (id)getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getSortedNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getSortedSetWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getSortedWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (int64_t)ramBytesUsed;
- (void)checkIntegrity;
- (void)close;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexSegmentDocValuesProducer

- (OrgApacheLuceneIndexSegmentDocValuesProducer)initWithOrgApacheLuceneIndexSegmentCommitInfo:(id)a3 withOrgApacheLuceneStoreDirectory:(id)a4 withOrgApacheLuceneIndexFieldInfos:(id)a5 withOrgApacheLuceneIndexFieldInfos:(id)a6 withOrgApacheLuceneIndexSegmentDocValues:(id)a7
{
  return self;
}

- (id)getNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  dvProducersByField = self->dvProducersByField_;
  if (!dvProducersByField
    || !a3
    || (id v5 = [(JavaUtilMap *)dvProducersByField getWithId:*((void *)a3 + 1)]) == 0)
  {
    JreThrowNullPointerException();
  }
  return [v5 getNumericWithOrgApacheLuceneIndexFieldInfo:a3];
}

- (id)getBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  dvProducersByField = self->dvProducersByField_;
  if (!dvProducersByField
    || !a3
    || (id v5 = [(JavaUtilMap *)dvProducersByField getWithId:*((void *)a3 + 1)]) == 0)
  {
    JreThrowNullPointerException();
  }
  return [v5 getBinaryWithOrgApacheLuceneIndexFieldInfo:a3];
}

- (id)getSortedWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  dvProducersByField = self->dvProducersByField_;
  if (!dvProducersByField
    || !a3
    || (id v5 = [(JavaUtilMap *)dvProducersByField getWithId:*((void *)a3 + 1)]) == 0)
  {
    JreThrowNullPointerException();
  }
  return [v5 getSortedWithOrgApacheLuceneIndexFieldInfo:a3];
}

- (id)getSortedNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  dvProducersByField = self->dvProducersByField_;
  if (!dvProducersByField
    || !a3
    || (id v5 = [(JavaUtilMap *)dvProducersByField getWithId:*((void *)a3 + 1)]) == 0)
  {
    JreThrowNullPointerException();
  }
  return [v5 getSortedNumericWithOrgApacheLuceneIndexFieldInfo:a3];
}

- (id)getSortedSetWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  dvProducersByField = self->dvProducersByField_;
  if (!dvProducersByField
    || !a3
    || (id v5 = [(JavaUtilMap *)dvProducersByField getWithId:*((void *)a3 + 1)]) == 0)
  {
    JreThrowNullPointerException();
  }
  return [v5 getSortedSetWithOrgApacheLuceneIndexFieldInfo:a3];
}

- (id)getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  dvProducersByField = self->dvProducersByField_;
  if (!dvProducersByField
    || !a3
    || (id v5 = [(JavaUtilMap *)dvProducersByField getWithId:*((void *)a3 + 1)]) == 0)
  {
    JreThrowNullPointerException();
  }
  return [v5 getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:a3];
}

- (void)checkIntegrity
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  dvProducers = self->dvProducers_;
  if (!dvProducers) {
LABEL_11:
  }
    JreThrowNullPointerException();
  id v3 = [(JavaUtilSet *)self->dvProducers_ countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(dvProducers);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (!v7) {
          goto LABEL_11;
        }
        objc_msgSend(v7, "checkIntegrity", (void)v8);
      }
      id v4 = [(JavaUtilSet *)dvProducers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)close
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int64_t)ramBytesUsed
{
  dvGens = self->dvGens_;
  if (!dvGens) {
    goto LABEL_17;
  }
  uint64_t v4 = qword_10055FD08;
  signed int v5 = [(JavaUtilList *)dvGens size];
  dvProducers = self->dvProducers_;
  if (!dvProducers) {
    goto LABEL_17;
  }
  uint64_t v7 = qword_10055FD10;
  unsigned int v8 = [(JavaUtilSet *)dvProducers size];
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  dvProducersByField = self->dvProducersByField_;
  }
  if (!dvProducersByField) {
LABEL_17:
  }
    JreThrowNullPointerException();
  uint64_t v10 = v4 + v7 * v5 + (int)(OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ * v8);
  unsigned int v11 = 2 * [(JavaUtilMap *)dvProducersByField size];
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  int64_t v12 = v10 + (int)(v11 * OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v13 = self->dvProducers_;
  id v14 = [(JavaUtilSet *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v17);
        if (!v18) {
          goto LABEL_17;
        }
        v12 += (int64_t)[v18 ramBytesUsed];
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(JavaUtilSet *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
  return v12;
}

- (id)getChildResources
{
  id v3 = new_JavaUtilArrayList_init();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  dvProducers = self->dvProducers_;
  if (!dvProducers) {
    JreThrowNullPointerException();
  }
  signed int v5 = v3;
  id v6 = [(JavaUtilSet *)dvProducers countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v13 = v6;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(dvProducers);
        }
        uint64_t v16 = OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"delegate", *(void **)(*((void *)&v18 + 1) + 8 * i), v7, v8, v9, v10, v11, v12);
        -[JavaUtilArrayList addWithId:](v5, "addWithId:", v16, (void)v18);
      }
      id v13 = [(JavaUtilSet *)dvProducers countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
  return JavaUtilCollections_unmodifiableListWithJavaUtilList_(v5);
}

- (id)description
{
  id v3 = objc_msgSend(-[OrgApacheLuceneIndexSegmentDocValuesProducer getClass](self, "getClass"), "getSimpleName");
  dvProducers = self->dvProducers_;
  if (!dvProducers) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)dvProducers size];
  return (id)JreStrcat("$$IC", v5, v6, v7, v8, v9, v10, v11, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSegmentDocValuesProducer;
  [(OrgApacheLuceneIndexSegmentDocValuesProducer *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)JavaLangLong_class_();
    qword_10055FD10 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    objc_super v3 = (void *)OrgApacheLuceneIndexSegmentDocValuesProducer_class_();
    qword_10055FD08 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v3);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneIndexSegmentDocValuesProducer__initialized);
  }
}

@end