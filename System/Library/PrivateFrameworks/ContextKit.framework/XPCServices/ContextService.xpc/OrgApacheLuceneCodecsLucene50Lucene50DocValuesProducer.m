@interface OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer
+ (id)readBinaryEntryWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (NSString)description;
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer)initWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer:(id)a3;
- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer)initWithOrgApacheLuceneIndexSegmentReadState:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7;
- (id)getAddressInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4;
- (id)getBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getChildResources;
- (id)getCompressedBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4;
- (id)getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getFixedBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4;
- (id)getIntervalInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4;
- (id)getLiveBitsWithLong:(int64_t)a3 withInt:(int)a4;
- (id)getMergeInstance;
- (id)getNumericWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_NumericEntry:(id)a3;
- (id)getNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getOrdIndexInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_NumericEntry:(id)a4;
- (id)getReverseIndexInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4;
- (id)getSortedNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getSortedSetTableWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_SortedSetEntry:(id)a4;
- (id)getSortedSetWithAddressesWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getSortedSetWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getSortedWithOrgApacheLuceneIndexFieldInfo:(id)a3;
- (id)getVariableBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4;
- (id)readNumericEntryWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (id)readSortedSetEntryWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (int)readFieldsWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexFieldInfos:(id)a4;
- (int64_t)ramBytesUsed;
- (void)checkIntegrity;
- (void)close;
- (void)dealloc;
- (void)readSortedFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4;
- (void)readSortedSetFieldWithAddressesWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4;
- (void)readSortedSetFieldWithTableWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer)initWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer:(id)a3
{
  return self;
}

- (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer)initWithOrgApacheLuceneIndexSegmentReadState:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withNSString:(id)a6 withNSString:(id)a7
{
  return self;
}

- (void)readSortedFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4
{
}

- (void)readSortedSetFieldWithAddressesWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4
{
}

- (void)readSortedSetFieldWithTableWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneStoreIndexInput:(id)a4
{
}

- (int)readFieldsWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexFieldInfos:(id)a4
{
  return sub_1000EEFFC(self, a3, a4);
}

- (id)readNumericEntryWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  return sub_1000EF3F8((uint64_t)self, a3);
}

+ (id)readBinaryEntryWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  return OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_readBinaryEntryWithOrgApacheLuceneStoreIndexInput_(a3);
}

- (id)readSortedSetEntryWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  v5 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_SortedSetEntry alloc];
  if (!a3) {
    goto LABEL_22;
  }
  v6 = v5;
  unsigned int v7 = [a3 readVInt];
  v6->format_ = v7;
  if (v7 < 2) {
    return v6;
  }
  v41 = self;
  if (v7 != 2)
  {
    v38 = @"Unknown format: ";
LABEL_24:
    v39 = (__CFString *)JreStrcat("$I", v8, v9, v10, v11, v12, v13, v14, v38);
    goto LABEL_26;
  }
  int v15 = [a3 readInt];
  int v16 = v15;
  if (v15 >= 257)
  {
    v38 = @"SORTED_SET_TABLE cannot have more than 256 values in its dictionary, got=";
    goto LABEL_24;
  }
  p_table = (uint64_t *)&v6->table_;
  JreStrongAssignAndConsume((id *)&v6->table_, +[IOSLongArray newArrayWithLength:v15]);
  if (v16 >= 1)
  {
    for (uint64_t i = 0; i != v16; *(void *)(*p_table + 16 + 8 * i++) = v19)
    {
      id v19 = [a3 readLong];
      uint64_t v20 = *(int *)(*p_table + 8);
      if (i >= v20) {
        IOSArray_throwOutOfBoundsWithMsg(v20, i);
      }
    }
  }
  ramBytesUsed = self->ramBytesUsed_;
  if (!ramBytesUsed) {
LABEL_22:
  }
    JreThrowNullPointerException();
  [(JavaUtilConcurrentAtomicAtomicLong *)ramBytesUsed addAndGetWithLong:OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_(*p_table)];
  signed int v22 = [a3 readInt];
  if (v22 > v16 + 1)
  {
    v39 = (__CFString *)JreStrcat("$I$I$", v23, v24, v25, v26, v27, v28, v29, @"SORTED_SET_TABLE cannot have more set ids than ords in its dictionary, got ");
LABEL_26:
    v40 = new_OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withOrgApacheLuceneStoreDataInput_(v39, a3);
    objc_exception_throw(v40);
  }
  p_uint64_t tableOffsets = (uint64_t *)&v6->tableOffsets_;
  JreStrongAssignAndConsume((id *)&v6->tableOffsets_, +[IOSIntArray newArrayWithLength:v22 + 1]);
  uint64_t tableOffsets = (uint64_t)v6->tableOffsets_;
  if (*(int *)(tableOffsets + 8) >= 2)
  {
    uint64_t v32 = 0;
    do
    {
      uint64_t v33 = v32 + 1;
      int v34 = *(_DWORD *)(tableOffsets + 12 + 4 * v32);
      unsigned int v35 = [a3 readInt];
      uint64_t v36 = *(int *)(*p_tableOffsets + 8);
      if (v32 + 1 >= v36) {
        IOSArray_throwOutOfBoundsWithMsg(v36, (v32 + 1));
      }
      *(_DWORD *)(*p_tableOffsets + 12 + 4 * v32 + 4) = v35 + v34;
      uint64_t tableOffsets = *p_tableOffsets;
      ++v32;
    }
    while (v33 + 1 < *(int *)(*p_tableOffsets + 8));
  }
  [(JavaUtilConcurrentAtomicAtomicLong *)v41->ramBytesUsed_ addAndGetWithLong:OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_(tableOffsets)];
  return v6;
}

- (id)getNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  numerics = self->numerics_;
  if (!numerics || !a3) {
    JreThrowNullPointerException();
  }
  id v5 = [(JavaUtilMap *)numerics getWithId:*((void *)a3 + 1)];
  return [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getNumericWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_NumericEntry:v5];
}

- (int64_t)ramBytesUsed
{
  ramBytesUsed = self->ramBytesUsed_;
  if (!ramBytesUsed) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilConcurrentAtomicAtomicLong *)ramBytesUsed get];
}

- (id)getChildResources
{
  objc_sync_enter(self);
  v3 = new_JavaUtilArrayList_init();
  [(JavaUtilArrayList *)v3 addAllWithJavaUtilCollection:OrgApacheLuceneUtilAccountables_namedAccountablesWithNSString_withJavaUtilMap_(@"addresses field", self->addressInstances_)];
  [(JavaUtilArrayList *)v3 addAllWithJavaUtilCollection:OrgApacheLuceneUtilAccountables_namedAccountablesWithNSString_withJavaUtilMap_(@"ord index field", self->ordIndexInstances_)];
  [(JavaUtilArrayList *)v3 addAllWithJavaUtilCollection:OrgApacheLuceneUtilAccountables_namedAccountablesWithNSString_withJavaUtilMap_(@"reverse index field", self->reverseIndexInstances_)];
  v4 = JavaUtilCollections_unmodifiableListWithJavaUtilList_(v3);
  objc_sync_exit(self);
  return v4;
}

- (void)checkIntegrity
{
}

- (NSString)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer getClass](self, "getClass"), "getSimpleName");
  return (NSString *)JreStrcat("$$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (id)getNumericWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_NumericEntry:(id)a3
{
  if (!a3) {
LABEL_15:
  }
    JreThrowNullPointerException();
  switch(*((_DWORD *)a3 + 9))
  {
    case 0:
      data = self->data_;
      if (!data) {
        goto LABEL_15;
      }
      id v5 = [(OrgApacheLuceneStoreIndexInput *)data randomAccessSliceWithLong:*((void *)a3 + 2) withLong:*((void *)a3 + 3) - *((void *)a3 + 2)];
      int64_t v6 = *((void *)a3 + 8);
      id InstanceWithOrgApacheLuceneStoreRandomAccessInput_withInt = OrgApacheLuceneUtilPackedDirectReader_getInstanceWithOrgApacheLuceneStoreRandomAccessInput_withInt_(v5, *((unsigned int *)a3 + 8), v7, v8, v9, v10, v11, v12);
      uint64_t v14 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__2 alloc];
      int v15 = (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$4 *)v14;
      v14->val$delta_ = v6;
      uint64_t v16 = 16;
      goto LABEL_10;
    case 1:
      uint64_t v29 = self->data_;
      if (!v29) {
        goto LABEL_15;
      }
      id v30 = [(OrgApacheLuceneStoreIndexInput *)v29 randomAccessSliceWithLong:*((void *)a3 + 2) withLong:*((void *)a3 + 3) - *((void *)a3 + 2)];
      int64_t v31 = *((void *)a3 + 8);
      uint64_t v32 = (OrgApacheLuceneUtilLongValues *)*((void *)a3 + 9);
      id InstanceWithOrgApacheLuceneStoreRandomAccessInput_withInt = OrgApacheLuceneUtilPackedDirectReader_getInstanceWithOrgApacheLuceneStoreRandomAccessInput_withInt_(v30, *((unsigned int *)a3 + 8), v33, v34, v35, v36, v37, v38);
      uint64_t v14 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__3 alloc];
      int v15 = (OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_$4 *)v14;
      v14->val$delta_ = v31;
      v14->val$values_ = v32;
      uint64_t v16 = 24;
LABEL_10:
      JreStrongAssign((id *)((char *)&v14->super.super.super.isa + v16), InstanceWithOrgApacheLuceneStoreRandomAccessInput_withInt);
LABEL_11:
      OrgApacheLuceneUtilLongValues_init(v15);
      break;
    case 2:
      v17 = self->data_;
      if (!v17) {
        goto LABEL_15;
      }
      id v18 = [(OrgApacheLuceneStoreIndexInput *)v17 randomAccessSliceWithLong:*((void *)a3 + 2) withLong:*((void *)a3 + 3) - *((void *)a3 + 2)];
      id v19 = (void *)*((void *)a3 + 10);
      id v26 = OrgApacheLuceneUtilPackedDirectReader_getInstanceWithOrgApacheLuceneStoreRandomAccessInput_withInt_(v18, *((unsigned int *)a3 + 8), v20, v21, v22, v23, v24, v25);
      int v15 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__4 alloc];
      sub_1000F2904((uint64_t)v15, v19, v26);
      break;
    case 4:
      uint64_t v27 = (OrgApacheLuceneUtilLongValues *)*((void *)a3 + 8);
      uint64_t v28 = sub_1000EFDF8((uint64_t)self, *((void *)a3 + 1), *((_DWORD *)a3 + 12));
      int v15 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__1 alloc];
      JreStrongAssign((id *)&v15->val$table_, v28);
      v15->val$ords_ = v27;
      goto LABEL_11;
    default:
      v40 = new_JavaLangAssertionError_init();
      objc_exception_throw(v40);
  }
  return v15;
}

- (id)getBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  binaries = self->binaries_;
  if (!binaries || !a3 || (int64_t v6 = [(JavaUtilMap *)binaries getWithId:*((void *)a3 + 1)]) == 0) {
    JreThrowNullPointerException();
  }
  int v7 = v6[6];
  if (v7 == 2)
  {
    return sub_1000F0130((uint64_t)self, (uint64_t)a3, (uint64_t)v6);
  }
  else if (v7 == 1)
  {
    return sub_1000F0060((uint64_t)self, (uint64_t)a3, (uint64_t)v6);
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = new_JavaLangAssertionError_init();
      objc_exception_throw(v9);
    }
    return sub_1000EFF8C((uint64_t)self, (uint64_t)v6);
  }
}

- (id)getFixedBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4
{
  return sub_1000EFF8C((uint64_t)self, (uint64_t)a4);
}

- (id)getAddressInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4
{
  return sub_1000F0204((uint64_t)self, (uint64_t)a3, (uint64_t)a4);
}

- (id)getVariableBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4
{
  return sub_1000F0060((uint64_t)self, (uint64_t)a3, (uint64_t)a4);
}

- (id)getIntervalInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4
{
  return sub_1000F0344((uint64_t)self, (uint64_t)a3, (uint64_t)a4);
}

- (id)getReverseIndexInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4
{
  return sub_1000F0488((uint64_t)self, (uint64_t)a3, (uint64_t)a4);
}

- (id)getCompressedBinaryWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry:(id)a4
{
  return sub_1000F0130((uint64_t)self, (uint64_t)a3, (uint64_t)a4);
}

- (id)getSortedWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  binaries = self->binaries_;
  if (!binaries
    || !a3
    || (int64_t v6 = [(JavaUtilMap *)binaries getWithId:*((void *)a3 + 1)]) == 0
    || (uint64_t v7 = v6[4],
        id v8 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getBinaryWithOrgApacheLuceneIndexFieldInfo:a3], (ords = self->ords_) == 0))
  {
    JreThrowNullPointerException();
  }
  id v10 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getNumericWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_NumericEntry:[(JavaUtilMap *)ords getWithId:*((void *)a3 + 1)]];
  uint64_t v11 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__7 alloc];
  sub_1000F301C((uint64_t)v11, v10, v8, v7);
  return v11;
}

- (id)getOrdIndexInstanceWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_NumericEntry:(id)a4
{
  return sub_1000F0720((uint64_t)self, (uint64_t)a3, (uint64_t)a4);
}

- (id)getSortedNumericWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  sortedNumerics = self->sortedNumerics_;
  if (!sortedNumerics) {
    goto LABEL_20;
  }
  if (!a3) {
    goto LABEL_20;
  }
  int64_t v6 = [(JavaUtilMap *)sortedNumerics getWithId:*((void *)a3 + 1)];
  if (!v6) {
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  int v8 = v6[2];
  if (v8)
  {
    if (v8 != 2)
    {
      if (v8 != 1)
      {
        id v26 = new_JavaLangAssertionError_init();
        objc_exception_throw(v26);
      }
      numerics = self->numerics_;
      if (numerics)
      {
        id v10 = [(JavaUtilMap *)numerics getWithId:*((void *)a3 + 1)];
        id v11 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getNumericWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_NumericEntry:v10];
        if (v10)
        {
          uint64_t v12 = v11;
          uint64_t v13 = sub_1000EFDF8((uint64_t)self, v10[1], self->maxDoc_);
          return OrgApacheLuceneIndexDocValues_singletonWithOrgApacheLuceneIndexNumericDocValues_withOrgApacheLuceneUtilBits_(v12, v13);
        }
      }
LABEL_20:
      JreThrowNullPointerException();
    }
    ords = self->ords_;
    if (!ords) {
      goto LABEL_20;
    }
    id v22 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getNumericWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_NumericEntry:[(JavaUtilMap *)ords getWithId:*((void *)a3 + 1)]];
    uint64_t v23 = (void *)*((void *)v7 + 2);
    uint64_t v24 = (void *)*((void *)v7 + 3);
    uint64_t v25 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__9 alloc];
    sub_1000F3484((id *)&v25->super.super.isa, v22, v24, v23);
    uint64_t v20 = v25;
  }
  else
  {
    int v15 = self->numerics_;
    if (!v15) {
      goto LABEL_20;
    }
    id v16 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getNumericWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_NumericEntry:[(JavaUtilMap *)v15 getWithId:*((void *)a3 + 1)]];
    ordIndexes = self->ordIndexes_;
    if (!ordIndexes) {
      goto LABEL_20;
    }
    id v18 = sub_1000F0720((uint64_t)self, (uint64_t)a3, (uint64_t)[(JavaUtilMap *)ordIndexes getWithId:*((void *)a3 + 1)]);
    id v19 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer__8 alloc];
    sub_1000F31FC((uint64_t)v19, v18, v16);
    uint64_t v20 = v19;
  }
  return v20;
}

- (id)getSortedSetWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  sortedSets = self->sortedSets_;
  if (!sortedSets || !a3 || (int64_t v6 = [(JavaUtilMap *)sortedSets getWithId:*((void *)a3 + 1)]) == 0) {
    JreThrowNullPointerException();
  }
  int v7 = v6[2];
  if (v7)
  {
    if (v7 == 2)
    {
      return sub_1000F0C38(self, (uint64_t)a3, (uint64_t)v6);
    }
    else
    {
      if (v7 != 1)
      {
        id v10 = new_JavaLangAssertionError_init();
        objc_exception_throw(v10);
      }
      id v8 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getSortedWithOrgApacheLuceneIndexFieldInfo:a3];
      return OrgApacheLuceneIndexDocValues_singletonWithOrgApacheLuceneIndexSortedDocValues_(v8);
    }
  }
  else
  {
    return sub_1000F0B08(self, (uint64_t)a3);
  }
}

- (id)getSortedSetWithAddressesWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  return sub_1000F0B08(self, (uint64_t)a3);
}

- (id)getSortedSetTableWithOrgApacheLuceneIndexFieldInfo:(id)a3 withOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_SortedSetEntry:(id)a4
{
  return sub_1000F0C38(self, (uint64_t)a3, (uint64_t)a4);
}

- (id)getLiveBitsWithLong:(int64_t)a3 withInt:(int)a4
{
  return sub_1000EFDF8((uint64_t)self, a3, a4);
}

- (id)getDocsWithFieldWithOrgApacheLuceneIndexFieldInfo:(id)a3
{
  if (!a3) {
LABEL_19:
  }
    JreThrowNullPointerException();
  switch(objc_msgSend(objc_msgSend(a3, "getDocValuesType"), "ordinal"))
  {
    case 1u:
      uint64_t v5 = 8;
      goto LABEL_5;
    case 2u:
      uint64_t v5 = 16;
LABEL_5:
      int64_t v6 = *(Class *)((char *)&self->super.super.isa + v5);
      if (!v6) {
        goto LABEL_19;
      }
      int v7 = [v6 getWithId:*((void *)a3 + 1)];
      if (!v7) {
        goto LABEL_19;
      }
      uint64_t v8 = v7[1];
      int maxDoc = self->maxDoc_;
      return sub_1000EFDF8((uint64_t)self, v8, maxDoc);
    case 3u:
      id v11 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getSortedWithOrgApacheLuceneIndexFieldInfo:a3];
      int v12 = self->maxDoc_;
      return OrgApacheLuceneIndexDocValues_docsWithValueWithOrgApacheLuceneIndexSortedDocValues_withInt_(v11, v12);
    case 4u:
      id v13 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getSortedNumericWithOrgApacheLuceneIndexFieldInfo:a3];
      int v14 = self->maxDoc_;
      return OrgApacheLuceneIndexDocValues_docsWithValueWithOrgApacheLuceneIndexSortedNumericDocValues_withInt_(v13, v14);
    case 5u:
      id v15 = [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)self getSortedSetWithOrgApacheLuceneIndexFieldInfo:a3];
      int v16 = self->maxDoc_;
      return OrgApacheLuceneIndexDocValues_docsWithValueWithOrgApacheLuceneIndexSortedSetDocValues_withInt_(v15, v16);
    default:
      v17 = new_JavaLangAssertionError_init();
      objc_exception_throw(v17);
  }
}

- (id)getMergeInstance
{
  objc_sync_enter(self);
  uint64_t v3 = [OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer alloc];
  OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_initWithOrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_((uint64_t)v3, (uint64_t)self);
  uint64_t v4 = v3;
  objc_sync_exit(self);
  return v4;
}

- (void)close
{
  data = self->data_;
  if (!data) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)data close];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer;
  [(OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer *)&v3 dealloc];
}

@end