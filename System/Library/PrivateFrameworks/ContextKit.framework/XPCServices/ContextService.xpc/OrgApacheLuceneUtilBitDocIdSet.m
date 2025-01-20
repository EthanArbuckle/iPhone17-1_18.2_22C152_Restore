@interface OrgApacheLuceneUtilBitDocIdSet
+ (void)initialize;
- (BOOL)isCacheable;
- (OrgApacheLuceneUtilBitDocIdSet)initWithOrgApacheLuceneUtilBitSet:(id)a3;
- (OrgApacheLuceneUtilBitDocIdSet)initWithOrgApacheLuceneUtilBitSet:(id)a3 withLong:(int64_t)a4;
- (id)bits;
- (id)description;
- (id)iterator;
- (int64_t)ramBytesUsed;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilBitDocIdSet

- (OrgApacheLuceneUtilBitDocIdSet)initWithOrgApacheLuceneUtilBitSet:(id)a3 withLong:(int64_t)a4
{
  self->cost_ = a4;
  return self;
}

- (OrgApacheLuceneUtilBitDocIdSet)initWithOrgApacheLuceneUtilBitSet:(id)a3
{
  return self;
}

- (id)iterator
{
  v2 = new_OrgApacheLuceneUtilBitSetIterator_initWithOrgApacheLuceneUtilBitSet_withLong_(self->set_, self->cost_);
  return v2;
}

- (id)bits
{
  return self->set_;
}

- (BOOL)isCacheable
{
  return 1;
}

- (int64_t)ramBytesUsed
{
  set = self->set_;
  if (!set) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = qword_10055FEF8;
  return (int64_t)[(OrgApacheLuceneUtilBitSet *)set ramBytesUsed] + v3;
}

- (id)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneUtilBitDocIdSet getClass](self, "getClass"), "getSimpleName");
  return (id)JreStrcat("$$@$JC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilBitDocIdSet;
  [(OrgApacheLuceneUtilBitDocIdSet *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = (void *)OrgApacheLuceneUtilBitDocIdSet_class_();
    qword_10055FEF8 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilBitDocIdSet__initialized);
  }
}

@end