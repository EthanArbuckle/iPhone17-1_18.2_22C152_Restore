@interface OrgApacheLuceneUtilPackedAbstractPagedMutable
- (NSString)description;
- (OrgApacheLuceneUtilPackedAbstractPagedMutable)initWithInt:(int)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (id)grow;
- (id)growWithLong:(int64_t)a3;
- (id)resizeWithLong:(int64_t)a3;
- (int)indexInPageWithLong:(int64_t)a3;
- (int)lastPageSizeWithLong:(int64_t)a3;
- (int)pageIndexWithLong:(int64_t)a3;
- (int)pageSize;
- (int64_t)baseRamBytesUsed;
- (int64_t)getWithLong:(int64_t)a3;
- (int64_t)ramBytesUsed;
- (int64_t)size;
- (void)dealloc;
- (void)fillPages;
- (void)setWithLong:(int64_t)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPackedAbstractPagedMutable

- (OrgApacheLuceneUtilPackedAbstractPagedMutable)initWithInt:(int)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  return self;
}

- (void)fillPages
{
  int v3 = OrgApacheLuceneUtilPackedPackedInts_numBlocksWithLong_withInt_(self->size_, self->pageMask_ + 1);
  uint64_t v4 = (v3 - 1);
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v3;
    do
    {
      if (v4 == v5)
      {
        int pageMask = self->pageMask_;
        if ((pageMask & self->size_) != 0) {
          uint64_t v8 = pageMask & self->size_;
        }
        else {
          uint64_t v8 = (pageMask + 1);
        }
      }
      else
      {
        uint64_t v8 = (self->pageMask_ + 1);
      }
      subMutables = self->subMutables_;
      if (!subMutables) {
        JreThrowNullPointerException();
      }
      IOSObjectArray_Set((uint64_t)subMutables, v5++, [(OrgApacheLuceneUtilPackedAbstractPagedMutable *)self newMutableWithInt:v8 withInt:self->bitsPerValue_]);
    }
    while (v6 != v5);
  }
}

- (int)lastPageSizeWithLong:(int64_t)a3
{
  int pageMask = self->pageMask_;
  if ((pageMask & a3) != 0) {
    return pageMask & a3;
  }
  else {
    return pageMask + 1;
  }
}

- (int)pageSize
{
  return self->pageMask_ + 1;
}

- (int64_t)size
{
  return self->size_;
}

- (int)pageIndexWithLong:(int64_t)a3
{
  return (unint64_t)a3 >> self->pageShift_;
}

- (int)indexInPageWithLong:(int64_t)a3
{
  return self->pageMask_ & a3;
}

- (int64_t)getWithLong:(int64_t)a3
{
  subMutables = self->subMutables_;
  if (!subMutables) {
    goto LABEL_8;
  }
  unint64_t v4 = (unint64_t)a3 >> self->pageShift_;
  int pageMask = self->pageMask_;
  uint64_t size = subMutables->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  v7 = (&subMutables->elementType_)[(int)v4];
  if (!v7) {
LABEL_8:
  }
    JreThrowNullPointerException();
  uint64_t v8 = pageMask & a3;
  return (int64_t)[(IOSClass *)v7 getWithInt:v8];
}

- (void)setWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  subMutables = self->subMutables_;
  if (!subMutables) {
    goto LABEL_8;
  }
  unint64_t v5 = (unint64_t)a3 >> self->pageShift_;
  int pageMask = self->pageMask_;
  uint64_t size = subMutables->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  uint64_t v8 = (&subMutables->elementType_)[(int)v5];
  if (!v8) {
LABEL_8:
  }
    JreThrowNullPointerException();
  uint64_t v9 = pageMask & a3;
  [(IOSClass *)v8 setWithInt:v9 withLong:a4];
}

- (int64_t)baseRamBytesUsed
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  int v2 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  return v2 + OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ + 20;
  }
}

- (int64_t)ramBytesUsed
{
  uint64_t v3 = OrgApacheLuceneUtilRamUsageEstimator_alignObjectSizeWithLong_([(OrgApacheLuceneUtilPackedAbstractPagedMutable *)self baseRamBytesUsed]);
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)self->subMutables_);
  uint64_t v5 = OrgApacheLuceneUtilRamUsageEstimator_alignObjectSizeWithLong_(v4);
  subMutables = self->subMutables_;
  if (!subMutables) {
LABEL_7:
  }
    JreThrowNullPointerException();
  int64_t v7 = v5 + v3;
  p_elementType = (void **)&subMutables->elementType_;
  unint64_t v9 = (unint64_t)&(&subMutables->elementType_)[subMutables->super.size_];
  while ((unint64_t)p_elementType < v9)
  {
    v10 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_7;
    }
    ++p_elementType;
    v7 += (int64_t)[v10 ramBytesUsed];
  }
  return v7;
}

- (id)resizeWithLong:(int64_t)a3
{
  return sub_10004F83C((uint64_t)self, a3);
}

- (id)growWithLong:(int64_t)a3
{
  return sub_10004FAAC((uint64_t)self, a3);
}

- (id)grow
{
  return sub_10004FAAC((uint64_t)self, self->size_ + 1);
}

- (NSString)description
{
  id v2 = objc_msgSend(-[OrgApacheLuceneUtilPackedAbstractPagedMutable getClass](self, "getClass"), "getSimpleName");
  return (NSString *)JreStrcat("$$J$IC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedAbstractPagedMutable;
  [(OrgApacheLuceneUtilPackedAbstractPagedMutable *)&v3 dealloc];
}

@end