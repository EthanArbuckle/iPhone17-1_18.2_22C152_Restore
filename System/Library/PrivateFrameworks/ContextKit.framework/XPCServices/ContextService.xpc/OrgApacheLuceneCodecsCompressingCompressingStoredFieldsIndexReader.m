@interface OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader
+ (void)initialize;
- (NSString)description;
- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getChildResources;
- (int)blockWithInt:(int)a3;
- (int)relativeChunkWithInt:(int)a3 withInt:(int)a4;
- (int)relativeDocBaseWithInt:(int)a3 withInt:(int)a4;
- (int64_t)getStartPointerWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (int64_t)relativeStartPointerWithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader

- (OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader)initWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneIndexSegmentInfo:(id)a4
{
  return self;
}

- (int)blockWithInt:(int)a3
{
  return sub_100137554((uint64_t)self, a3);
}

- (int)relativeDocBaseWithInt:(int)a3 withInt:(int)a4
{
  return sub_100137630((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a4);
}

- (int64_t)relativeStartPointerWithInt:(int)a3 withInt:(int)a4
{
  return sub_100137718((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a4);
}

- (int)relativeChunkWithInt:(int)a3 withInt:(int)a4
{
  return sub_100137804((uint64_t)self, *(uint64_t *)&a3, a4);
}

- (int64_t)getStartPointerWithInt:(int)a3
{
  if (a3 < 0 || self->maxDoc_ <= a3)
  {
    CFStringRef v21 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"docID out of range [0-");
    v22 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v21);
    objc_exception_throw(v22);
  }
  uint64_t v10 = sub_100137554((uint64_t)self, a3);
  docBases = self->docBases_;
  if (!docBases) {
    goto LABEL_10;
  }
  uint64_t v12 = v10;
  uint64_t v13 = (int)v10;
  uint64_t size = docBases->super.size_;
  if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v12);
  }
  uint64_t v15 = sub_100137804((uint64_t)self, v12, a3 - *(&docBases->super.size_ + v13 + 1));
  startPointers = self->startPointers_;
  if (!startPointers) {
LABEL_10:
  }
    JreThrowNullPointerException();
  uint64_t v17 = v15;
  uint64_t v18 = startPointers->super.size_;
  if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v12);
  }
  int64_t v19 = startPointers->buffer_[v13];
  return sub_100137718((uint64_t)self, v12, v17) + v19;
}

- (int64_t)ramBytesUsed
{
  uint64_t v3 = qword_100560658;
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)self->docBasesDeltas_);
  docBasesDeltas = self->docBasesDeltas_;
  if (!docBasesDeltas) {
    goto LABEL_12;
  }
  uint64_t v6 = v4 + v3;
  p_elementType = (void **)&docBasesDeltas->elementType_;
  unint64_t v8 = (unint64_t)&(&docBasesDeltas->elementType_)[docBasesDeltas->super.size_];
  while ((unint64_t)p_elementType < v8)
  {
    v9 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_12;
    }
    ++p_elementType;
    v6 += (uint64_t)[v9 ramBytesUsed];
  }
  uint64_t v10 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)self->startPointersDeltas_);
  startPointersDeltas = self->startPointersDeltas_;
  if (!startPointersDeltas) {
LABEL_12:
  }
    JreThrowNullPointerException();
  uint64_t v12 = v10 + v6;
  uint64_t v13 = (void **)&startPointersDeltas->elementType_;
  unint64_t v14 = (unint64_t)&(&startPointersDeltas->elementType_)[startPointersDeltas->super.size_];
  while ((unint64_t)v13 < v14)
  {
    uint64_t v15 = *v13;
    if (!*v13) {
      goto LABEL_12;
    }
    ++v13;
    v12 += (uint64_t)[v15 ramBytesUsed];
  }
  uint64_t v16 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_((uint64_t)self->docBases_);
  uint64_t v17 = v12 + OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->startPointers_);
  uint64_t v18 = v16 + OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithIntArray_((uint64_t)self->avgChunkDocs_);
  return v18 + OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->avgChunkSizes_) + v17;
}

- (id)getChildResources
{
  uint64_t v3 = new_JavaUtilArrayList_init();
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)self->docBasesDeltas_);
  docBasesDeltas = self->docBasesDeltas_;
  if (!docBasesDeltas) {
    goto LABEL_14;
  }
  int64_t v6 = v4;
  p_elementType = (void **)&docBasesDeltas->elementType_;
  unint64_t v8 = (unint64_t)&(&docBasesDeltas->elementType_)[docBasesDeltas->super.size_];
  while ((unint64_t)p_elementType < v8)
  {
    v9 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_14;
    }
    ++p_elementType;
    v6 += (int64_t)[v9 ramBytesUsed];
  }
  [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withLong_(@"doc base deltas", v6)];
  uint64_t v10 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)self->startPointersDeltas_);
  startPointersDeltas = self->startPointersDeltas_;
  if (!startPointersDeltas) {
LABEL_14:
  }
    JreThrowNullPointerException();
  int64_t v12 = v10;
  uint64_t v13 = (void **)&startPointersDeltas->elementType_;
  unint64_t v14 = (unint64_t)&(&startPointersDeltas->elementType_)[startPointersDeltas->super.size_];
  while ((unint64_t)v13 < v14)
  {
    uint64_t v15 = *v13;
    if (!*v13) {
      goto LABEL_14;
    }
    ++v13;
    v12 += (int64_t)[v15 ramBytesUsed];
  }
  [(JavaUtilArrayList *)v3 addWithId:OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withLong_(@"start pointer deltas", v12)];
  return JavaUtilCollections_unmodifiableListWithJavaUtilList_(v3);
}

- (NSString)description
{
  id v3 = objc_msgSend(-[OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader getClass](self, "getClass"), "getSimpleName");
  if (!self->docBases_) {
    JreThrowNullPointerException();
  }
  return (NSString *)JreStrcat("$$IC", v4, v5, v6, v7, v8, v9, v10, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader;
  [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader_class_();
    qword_100560658 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsCompressingCompressingStoredFieldsIndexReader__initialized);
  }
}

@end