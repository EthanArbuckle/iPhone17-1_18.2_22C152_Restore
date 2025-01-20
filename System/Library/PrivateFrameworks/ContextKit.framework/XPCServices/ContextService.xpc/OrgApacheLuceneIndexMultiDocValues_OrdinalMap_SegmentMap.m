@interface OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap
+ (void)initialize;
- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap)initWithLongArray:(id)a3;
- (int)newToOldWithInt:(int)a3;
- (int)oldToNewWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap

- (OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap)initWithLongArray:(id)a3
{
  return self;
}

- (int)newToOldWithInt:(int)a3
{
  newToOld = self->newToOld_;
  if (!newToOld) {
    JreThrowNullPointerException();
  }
  uint64_t size = newToOld->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *(&newToOld->super.size_ + a3 + 1);
}

- (int)oldToNewWithInt:(int)a3
{
  oldToNew = self->oldToNew_;
  if (!oldToNew) {
    JreThrowNullPointerException();
  }
  uint64_t size = oldToNew->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *(&oldToNew->super.size_ + a3 + 1);
}

- (int64_t)ramBytesUsed
{
  uint64_t v3 = qword_100560748;
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_((uint64_t)self->newToOld_) + v3;
  return v4 + OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_((uint64_t)self->oldToNew_);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap;
  [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap_class_();
    qword_100560748 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexMultiDocValues_OrdinalMap_SegmentMap__initialized);
  }
}

@end