@interface OrgApacheLuceneCodecsBlocktreeFieldReader
+ (void)initialize;
- (BOOL)hasFreqs;
- (BOOL)hasOffsets;
- (BOOL)hasPayloads;
- (BOOL)hasPositions;
- (NSString)description;
- (OrgApacheLuceneCodecsBlocktreeFieldReader)initWithOrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4 withLong:(int64_t)a5 withOrgApacheLuceneUtilBytesRef:(id)a6 withLong:(int64_t)a7 withLong:(int64_t)a8 withInt:(int)a9 withLong:(int64_t)a10 withInt:(int)a11 withOrgApacheLuceneStoreIndexInput:(id)a12 withOrgApacheLuceneUtilBytesRef:(id)a13 withOrgApacheLuceneUtilBytesRef:(id)a14;
- (id)getChildResources;
- (id)getMax;
- (id)getMin;
- (id)getStats;
- (id)intersectWithOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
- (id)iterator;
- (int)getDocCount;
- (int64_t)getSumDocFreq;
- (int64_t)getSumTotalTermFreq;
- (int64_t)ramBytesUsed;
- (int64_t)size;
- (void)__javaClone;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsBlocktreeFieldReader

- (OrgApacheLuceneCodecsBlocktreeFieldReader)initWithOrgApacheLuceneCodecsBlocktreeBlockTreeTermsReader:(id)a3 withOrgApacheLuceneIndexFieldInfo:(id)a4 withLong:(int64_t)a5 withOrgApacheLuceneUtilBytesRef:(id)a6 withLong:(int64_t)a7 withLong:(int64_t)a8 withInt:(int)a9 withLong:(int64_t)a10 withInt:(int)a11 withOrgApacheLuceneStoreIndexInput:(id)a12 withOrgApacheLuceneUtilBytesRef:(id)a13 withOrgApacheLuceneUtilBytesRef:(id)a14
{
  return self;
}

- (id)getMin
{
  id result = self->minTerm_;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)OrgApacheLuceneCodecsBlocktreeFieldReader;
    return [(OrgApacheLuceneIndexTerms *)&v4 getMin];
  }
  return result;
}

- (id)getMax
{
  id result = self->maxTerm_;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)OrgApacheLuceneCodecsBlocktreeFieldReader;
    return [(OrgApacheLuceneIndexTerms *)&v4 getMax];
  }
  return result;
}

- (id)getStats
{
  v2 = new_OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum_initWithOrgApacheLuceneCodecsBlocktreeFieldReader_(self);
  return [(OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum *)v2 computeBlockStats];
}

- (BOOL)hasFreqs
{
  fieldInfo = self->fieldInfo_;
  if (!fieldInfo || (id v3 = [(OrgApacheLuceneIndexFieldInfo *)fieldInfo getIndexOptions]) == 0) {
    JreThrowNullPointerException();
  }
  objc_super v4 = v3;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (int)[v4 compareToWithId:qword_100563200] >= 0;
}

- (BOOL)hasOffsets
{
  fieldInfo = self->fieldInfo_;
  if (!fieldInfo || (id v3 = [(OrgApacheLuceneIndexFieldInfo *)fieldInfo getIndexOptions]) == 0) {
    JreThrowNullPointerException();
  }
  objc_super v4 = v3;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (int)[v4 compareToWithId:qword_100563210] >= 0;
}

- (BOOL)hasPositions
{
  fieldInfo = self->fieldInfo_;
  if (!fieldInfo || (id v3 = [(OrgApacheLuceneIndexFieldInfo *)fieldInfo getIndexOptions]) == 0) {
    JreThrowNullPointerException();
  }
  objc_super v4 = v3;
  if ((atomic_load_explicit(OrgApacheLuceneIndexIndexOptionsEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (int)[v4 compareToWithId:qword_100563208] >= 0;
}

- (BOOL)hasPayloads
{
  fieldInfo = self->fieldInfo_;
  if (!fieldInfo) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexFieldInfo *)fieldInfo hasPayloads];
}

- (id)iterator
{
  v2 = new_OrgApacheLuceneCodecsBlocktreeSegmentTermsEnum_initWithOrgApacheLuceneCodecsBlocktreeFieldReader_(self);
  return v2;
}

- (int64_t)size
{
  return self->numTerms_;
}

- (int64_t)getSumTotalTermFreq
{
  return self->sumTotalTermFreq_;
}

- (int64_t)getSumDocFreq
{
  return self->sumDocFreq_;
}

- (int)getDocCount
{
  return self->docCount_;
}

- (id)intersectWithOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  objc_super v4 = new_OrgApacheLuceneCodecsBlocktreeIntersectTermsEnum_initWithOrgApacheLuceneCodecsBlocktreeFieldReader_withOrgApacheLuceneUtilAutomatonAutomaton_withOrgApacheLuceneUtilAutomatonRunAutomaton_withOrgApacheLuceneUtilBytesRef_withOrgApacheLuceneUtilBytesRef_withInt_((uint64_t)self, *((void **)a3 + 4), *((void **)a3 + 3), *((void **)a3 + 5), (uint64_t)a4, *((_DWORD *)a3 + 14));
  return v4;
}

- (int64_t)ramBytesUsed
{
  uint64_t v2 = qword_10055FD30;
  index = self->index_;
  if (index) {
    index = [(OrgApacheLuceneUtilFstFST *)index ramBytesUsed];
  }
  return (int64_t)index + v2;
}

- (id)getChildResources
{
  index = self->index_;
  if (index)
  {
    v9 = OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"term index", index, v2, v3, v4, v5, v6, v7);
    return JavaUtilCollections_singletonWithId_(v9);
  }
  else
  {
    return (id)JavaUtilCollections_emptyList();
  }
}

- (NSString)description
{
  return (NSString *)JreStrcat("$J$J$J$IC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"BlockTreeTerms(terms=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeFieldReader;
  [(OrgApacheLuceneCodecsBlocktreeFieldReader *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsBlocktreeFieldReader;
  [(OrgApacheLuceneCodecsBlocktreeFieldReader *)&v3 __javaClone];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = (void *)OrgApacheLuceneCodecsBlocktreeFieldReader_class_();
    uint64_t v3 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    uint64_t v4 = (void *)OrgApacheLuceneUtilBytesRef_class_();
    qword_10055FD30 = 3 * OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v4) + v3;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsBlocktreeFieldReader__initialized);
  }
}

- (void).cxx_destruct
{
}

@end