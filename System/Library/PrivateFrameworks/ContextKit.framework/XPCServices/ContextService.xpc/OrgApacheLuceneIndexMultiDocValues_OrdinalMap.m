@interface OrgApacheLuceneIndexMultiDocValues_OrdinalMap
+ (id)buildWithId:(id)a3 withOrgApacheLuceneIndexSortedDocValuesArray:(id)a4 withFloat:(float)a5;
+ (id)buildWithId:(id)a3 withOrgApacheLuceneIndexSortedSetDocValuesArray:(id)a4 withFloat:(float)a5;
+ (id)buildWithId:(id)a3 withOrgApacheLuceneIndexTermsEnumArray:(id)a4 withLongArray:(id)a5 withFloat:(float)a6;
+ (void)initialize;
- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap)initWithId:(id)a3 withOrgApacheLuceneIndexTermsEnumArray:(id)a4 withOrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap:(id)a5 withFloat:(float)a6;
- (id)getChildResources;
- (id)getGlobalOrdsWithInt:(int)a3;
- (int)getFirstSegmentNumberWithLong:(int64_t)a3;
- (int64_t)getFirstSegmentOrdWithLong:(int64_t)a3;
- (int64_t)getValueCount;
- (int64_t)ramBytesUsed;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiDocValues_OrdinalMap

+ (id)buildWithId:(id)a3 withOrgApacheLuceneIndexSortedDocValuesArray:(id)a4 withFloat:(float)a5
{
  return OrgApacheLuceneIndexMultiDocValues_OrdinalMap_buildWithId_withOrgApacheLuceneIndexSortedDocValuesArray_withFloat_(a3, (uint64_t)a4, a5);
}

+ (id)buildWithId:(id)a3 withOrgApacheLuceneIndexSortedSetDocValuesArray:(id)a4 withFloat:(float)a5
{
  return OrgApacheLuceneIndexMultiDocValues_OrdinalMap_buildWithId_withOrgApacheLuceneIndexSortedSetDocValuesArray_withFloat_(a3, (uint64_t)a4, a5);
}

+ (id)buildWithId:(id)a3 withOrgApacheLuceneIndexTermsEnumArray:(id)a4 withLongArray:(id)a5 withFloat:(float)a6
{
  return OrgApacheLuceneIndexMultiDocValues_OrdinalMap_buildWithId_withOrgApacheLuceneIndexTermsEnumArray_withLongArray_withFloat_(a3, (uint64_t)a4, (int *)a5, a6);
}

- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap)initWithId:(id)a3 withOrgApacheLuceneIndexTermsEnumArray:(id)a4 withOrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap:(id)a5 withFloat:(float)a6
{
  return self;
}

- (id)getGlobalOrdsWithInt:(int)a3
{
  segmentToGlobalOrds = self->segmentToGlobalOrds_;
  if (!segmentToGlobalOrds || (segmentMap = self->segmentMap_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap *)segmentMap oldToNewWithInt:*(void *)&a3];
  uint64_t size = segmentToGlobalOrds->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return (&segmentToGlobalOrds->elementType_)[(int)v5];
}

- (int64_t)getFirstSegmentOrdWithLong:(int64_t)a3
{
  globalOrdDeltas = self->globalOrdDeltas_;
  if (!globalOrdDeltas) {
    JreThrowNullPointerException();
  }
  return a3 - -[OrgApacheLuceneUtilPackedPackedLongValues getWithLong:](globalOrdDeltas, "getWithLong:");
}

- (int)getFirstSegmentNumberWithLong:(int64_t)a3
{
  segmentMap = self->segmentMap_;
  if (!segmentMap || (firstSegments = self->firstSegments_) == 0) {
    JreThrowNullPointerException();
  }
  id v5 = [(OrgApacheLuceneUtilPackedPackedLongValues *)firstSegments getWithLong:a3];
  return [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap *)segmentMap newToOldWithInt:v5];
}

- (int64_t)getValueCount
{
  globalOrdDeltas = self->globalOrdDeltas_;
  if (!globalOrdDeltas) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilPackedPackedLongValues *)globalOrdDeltas size];
}

- (int64_t)ramBytesUsed
{
  return self->ramBytesUsed_;
}

- (id)getChildResources
{
  v3 = new_JavaUtilArrayList_init();
  [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"global ord deltas", self->globalOrdDeltas_, v4, v5, v6, v7, v8, v9)];
  [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"first segments", self->firstSegments_, v10, v11, v12, v13, v14, v15)];
  [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"segment map", self->segmentMap_, v16, v17, v18, v19, v20, v21)];
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiDocValues_OrdinalMap;
  [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneIndexMultiDocValues_OrdinalMap_class_();
    qword_100560730 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneIndexMultiDocValues_OrdinalMap__initialized);
  }
}

@end