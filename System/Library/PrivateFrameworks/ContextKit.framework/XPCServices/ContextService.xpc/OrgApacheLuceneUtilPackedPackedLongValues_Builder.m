@interface OrgApacheLuceneUtilPackedPackedLongValues_Builder
+ (void)initialize;
- (OrgApacheLuceneUtilPackedPackedLongValues_Builder)initWithInt:(int)a3 withFloat:(float)a4;
- (id)addWithLong:(int64_t)a3;
- (id)build;
- (id)pack;
- (int64_t)baseRamBytesUsed;
- (int64_t)ramBytesUsed;
- (int64_t)size;
- (void)dealloc;
- (void)finish;
- (void)growWithInt:(int)a3;
- (void)packWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6;
@end

@implementation OrgApacheLuceneUtilPackedPackedLongValues_Builder

- (OrgApacheLuceneUtilPackedPackedLongValues_Builder)initWithInt:(int)a3 withFloat:(float)a4
{
  OrgApacheLuceneUtilPackedPackedLongValues_Builder_initWithInt_withFloat_((uint64_t)self, a3, a4, *(uint64_t *)&a3, v4, v5, v6, v7, v8);
  return self;
}

- (id)build
{
  [(OrgApacheLuceneUtilPackedPackedLongValues_Builder *)self finish];
  JreStrongAssign((id *)&self->pending_, 0);
  uint64_t v4 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_(self->values_, self->valuesOff_);
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilPackedPackedLongValues__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v5 = qword_100560330;
  }
  uint64_t v6 = OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithOrgApacheLuceneUtilAccountableArray_((uint64_t)v4);
  uint64_t v7 = new_OrgApacheLuceneUtilPackedPackedLongValues_initWithInt_withInt_withOrgApacheLuceneUtilPackedPackedInts_ReaderArray_withLong_withLong_(self->pageShift_, self->pageMask_, v4, self->size_, v6 + v5);
  return v7;
}

- (void)finish
{
  if (*((int *)result + 15) >= 1)
  {
    uint64_t v2 = (uint64_t)result;
    uint64_t v3 = result[5];
    if (!v3) {
      JreThrowNullPointerException();
    }
    int v4 = *(_DWORD *)(v3 + 8);
    if (v4 == *((_DWORD *)result + 14)) {
      [result growWithInt:(v4 + 1)];
    }
    return [(OrgApacheLuceneUtilPackedPackedLongValues_Builder *)v2 pack];
  }
  return result;
}

- (int64_t)baseRamBytesUsed
{
  return qword_100560348;
}

- (int64_t)ramBytesUsed
{
  return self->ramBytesUsed_;
}

- (int64_t)size
{
  return self->size_;
}

- (id)addWithLong:(int64_t)a3
{
  pending = self->pending_;
  if (!pending)
  {
    v17 = new_JavaLangIllegalStateException_initWithNSString_(@"Cannot be reused after build()");
    objc_exception_throw(v17);
  }
  uint64_t pendingOff = self->pendingOff_;
  if (pendingOff == pending->super.size_)
  {
    values = self->values_;
    if (!values) {
      JreThrowNullPointerException();
    }
    int size = values->super.size_;
    if (size == self->valuesOff_) {
      [(OrgApacheLuceneUtilPackedPackedLongValues_Builder *)self growWithInt:OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(size + 1, 8, a3, v3, v4, v5, v6, v7)];
    }
    [(OrgApacheLuceneUtilPackedPackedLongValues_Builder *)(uint64_t)self pack];
    pending = self->pending_;
    uint64_t pendingOff = self->pendingOff_;
  }
  self->pendingOff_ = pendingOff + 1;
  uint64_t v15 = pending->super.size_;
  if ((pendingOff & 0x80000000) != 0 || (int)pendingOff >= (int)v15) {
    IOSArray_throwOutOfBoundsWithMsg(v15, pendingOff);
  }
  pending->buffer_[(int)pendingOff] = a3;
  ++self->size_;
  return self;
}

- (id)pack
{
  LODWORD(a2) = *(_DWORD *)(a1 + 16);
  [(id)a1 packWithLongArray:*(void *)(a1 + 24) withInt:*(unsigned int *)(a1 + 60) withInt:*(unsigned int *)(a1 + 56) withFloat:a2];
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3) {
    goto LABEL_6;
  }
  int v4 = *(_DWORD *)(a1 + 56);
  uint64_t v5 = *(unsigned int *)(v3 + 8);
  if (v4 < 0 || v4 >= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(v5, v4);
  }
  uint64_t v6 = *(void **)(v3 + 24 + 8 * v4);
  if (!v6) {
LABEL_6:
  }
    JreThrowNullPointerException();
  id result = [v6 ramBytesUsed];
  *(void *)(a1 + 48) += result;
  *(void *)(a1 + 56) = (*(_DWORD *)(a1 + 56) + 1);
  return result;
}

- (void)packWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6
{
  if (!a3) {
    goto LABEL_27;
  }
  uint64_t v11 = *(void *)&a4;
  uint64_t v14 = *((unsigned int *)a3 + 2);
  if ((int)v14 < 1) {
    IOSArray_throwOutOfBoundsWithMsg(v14, 0);
  }
  uint64_t v15 = *((void *)a3 + 2);
  uint64_t v16 = v15;
  if (a4 > 1)
  {
    uint64_t v17 = 1;
    do
    {
      uint64_t v18 = *((int *)a3 + 2);
      if (v17 >= v18) {
        IOSArray_throwOutOfBoundsWithMsg(v18, v17);
      }
      uint64_t v15 = JavaLangMath_minWithLong_withLong_(v15, *((void *)a3 + v17 + 2));
      uint64_t v19 = *((int *)a3 + 2);
      if (v17 >= v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, v17);
      }
      uint64_t v16 = JavaLangMath_maxWithLong_withLong_(v16, *((void *)a3 + v17++ + 2));
    }
    while (v11 != v17);
  }
  if (!(v15 | v16))
  {
    values = self->values_;
    if (values)
    {
      v21 = new_OrgApacheLuceneUtilPackedPackedInts_NullReader_initWithInt_(v11);
      IOSObjectArray_SetAndConsume((uint64_t)values, a5, v21);
      return;
    }
    goto LABEL_27;
  }
  if (v15 < 0) {
    uint64_t v22 = 64;
  }
  else {
    uint64_t v22 = OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_(v16, (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v6, v7, v8);
  }
  MutableWithInt_withInt_withFloat = OrgApacheLuceneUtilPackedPackedInts_getMutableWithInt_withInt_withFloat_(v11, v22, a6);
  v24 = MutableWithInt_withInt_withFloat;
  if ((int)v11 >= 1)
  {
    if (!MutableWithInt_withInt_withFloat) {
      goto LABEL_27;
    }
    uint64_t v25 = 0;
    do
      LODWORD(v25) = [(OrgApacheLuceneUtilPackedPacked64SingleBlock *)v24 setWithInt:v25 withLongArray:a3 withInt:v25 withInt:(v11 - v25)]+ v25;
    while ((int)v25 < (int)v11);
  }
  v26 = self->values_;
  if (!v26) {
LABEL_27:
  }
    JreThrowNullPointerException();
  IOSObjectArray_Set((uint64_t)v26, a5, v24);
}

- (void)growWithInt:(int)a3
{
  p_values = &self->values_;
  uint64_t v5 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)self->values_);
  uint64_t v6 = *p_values;
  p_values[1] = (IOSObjectArray *)((char *)p_values[1] - v5);
  uint64_t v7 = JavaUtilArrays_copyOfWithNSObjectArray_withInt_(v6, a3);
  JreStrongAssign((id *)p_values, v7);
  p_values[1] = (IOSObjectArray *)((char *)p_values[1]
                                 + OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)*p_values));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPackedLongValues_Builder;
  [(OrgApacheLuceneUtilPackedPackedLongValues_Builder *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = (void *)OrgApacheLuceneUtilPackedPackedLongValues_Builder_class_();
    qword_100560348 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilPackedPackedLongValues_Builder__initialized);
  }
}

@end