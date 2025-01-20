@interface OrgApacheLuceneUtilIntArrayDocIdSet
+ (void)initialize;
- (OrgApacheLuceneUtilIntArrayDocIdSet)initWithIntArray:(id)a3 withInt:(int)a4;
- (id)iterator;
- (int64_t)ramBytesUsed;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilIntArrayDocIdSet

- (OrgApacheLuceneUtilIntArrayDocIdSet)initWithIntArray:(id)a3 withInt:(int)a4
{
  return self;
}

- (int64_t)ramBytesUsed
{
  uint64_t v2 = qword_10055FC40;
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_((uint64_t)self->docs_) + v2;
}

- (id)iterator
{
  uint64_t v2 = new_OrgApacheLuceneUtilIntArrayDocIdSet_IntArrayDocIdSetIterator_initWithIntArray_withInt_(self->docs_, self->length_);
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilIntArrayDocIdSet;
  [(OrgApacheLuceneUtilIntArrayDocIdSet *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = (void *)OrgApacheLuceneUtilIntArrayDocIdSet_class_();
    qword_10055FC40 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilIntArrayDocIdSet__initialized);
  }
}

@end