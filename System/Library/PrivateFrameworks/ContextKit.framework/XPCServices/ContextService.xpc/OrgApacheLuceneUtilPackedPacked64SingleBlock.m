@interface OrgApacheLuceneUtilPackedPacked64SingleBlock
+ (BOOL)isSupportedWithInt:(int)a3;
+ (id)createWithInt:(int)a3 withInt:(int)a4;
+ (id)createWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)initialize;
- (OrgApacheLuceneUtilPackedPacked64SingleBlock)initWithInt:(int)a3 withInt:(int)a4;
- (id)description;
- (id)getFormat;
- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int64_t)ramBytesUsed;
- (void)clear;
- (void)dealloc;
- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5;
@end

@implementation OrgApacheLuceneUtilPackedPacked64SingleBlock

+ (BOOL)isSupportedWithInt:(int)a3
{
  return OrgApacheLuceneUtilPackedPacked64SingleBlock_isSupportedWithInt_(a3);
}

- (OrgApacheLuceneUtilPackedPacked64SingleBlock)initWithInt:(int)a3 withInt:(int)a4
{
  return self;
}

- (void)clear
{
}

- (int64_t)ramBytesUsed
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  int v3 = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_HEADER_;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_alignObjectSizeWithLong_(v3
  }
                                                                   + OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_ + 8);
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithLongArray_((uint64_t)self->blocks_) + v4;
}

- (int)getWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v8 = *(void *)&a3;
  int v10 = JavaLangMath_minWithInt_withInt_(*(uint64_t *)&a6, self->super.valueCount_ - a3);
  unsigned int v11 = v10;
  uint64_t v12 = 12;
  int v13 = 64 / self->super.bitsPerValue_;
  if ((int)v8 % v13)
  {
    int v23 = v8;
    uint64_t v22 = 12;
    if (v13 < 0 || v10 < 1)
    {
      unsigned int v18 = v10;
      LODWORD(v15) = v8;
    }
    else
    {
      int v14 = (int)v8 % v13 + 1;
      uint64_t v15 = v8;
      do
      {
        id v16 = -[OrgApacheLuceneUtilPackedPacked64SingleBlock getWithInt:](self, "getWithInt:", v15, v22);
        uint64_t v17 = *((unsigned int *)a4 + 2);
        if (a5 < 0 || a5 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, a5);
        }
        *((void *)a4 + a5 + 2) = v16;
        unsigned int v18 = v11 - 1;
        uint64_t v15 = (v15 + 1);
        ++a5;
        if (v14 >= v13) {
          break;
        }
        ++v14;
      }
      while (v11-- > 1);
    }
    if (!v18) {
      return v15 - v23;
    }
    unsigned int v11 = v18;
    LODWORD(v8) = v23;
    uint64_t v12 = v22;
  }
  else
  {
    LODWORD(v15) = v8;
  }
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  objc_msgSend((id)OrgApacheLuceneUtilPackedBulkOperation_ofWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_((void *)qword_100563798, *(_DWORD *)((char *)&self->super.super.super.super.super.isa + v12)), "decodeWithLongArray:withInt:withLongArray:withInt:withInt:", self->blocks_);
  int v20 = ((int)(v15 + v11) / v13 - (int)v15 / v13) * v13 + v15;
  int result = v20 - v8;
  if (v20 <= (int)v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)OrgApacheLuceneUtilPackedPacked64SingleBlock;
    return -[OrgApacheLuceneUtilPackedPackedInts_Reader getWithInt:withLongArray:withInt:withInt:](&v24, "getWithInt:withLongArray:withInt:withInt:");
  }
  return result;
}

- (int)setWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  int v10 = JavaLangMath_minWithInt_withInt_(*(uint64_t *)&a6, self->super.valueCount_ - a3);
  unsigned int v11 = v10;
  int v12 = 64 / self->super.bitsPerValue_;
  if ((int)v8 % v12)
  {
    if (v12 < 0 || v10 < 1)
    {
      unsigned int v16 = v10;
      LODWORD(v14) = v8;
    }
    else
    {
      int v13 = (int)v8 % v12 + 1;
      uint64_t v14 = v8;
      do
      {
        uint64_t v15 = *((unsigned int *)a4 + 2);
        if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (int)v6);
        }
        [(OrgApacheLuceneUtilPackedPacked64SingleBlock *)self setWithInt:v14 withLong:*((void *)a4 + (int)v6 + 2)];
        unsigned int v16 = v11 - 1;
        uint64_t v14 = (v14 + 1);
        uint64_t v6 = (v6 + 1);
        if (v13 >= v12) {
          break;
        }
        ++v13;
      }
      while (v11-- > 1);
    }
    if (!v16) {
      return v14 - v8;
    }
    unsigned int v11 = v16;
  }
  else
  {
    LODWORD(v14) = v8;
  }
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  objc_msgSend((id)OrgApacheLuceneUtilPackedBulkOperation_ofWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_((void *)qword_100563798, self->super.bitsPerValue_), "encodeWithLongArray:withInt:withLongArray:withInt:withInt:", a4, v6, self->blocks_);
  int v18 = ((int)(v14 + v11) / v12 - (int)v14 / v12) * v12 + v14;
  int result = v18 - v8;
  if (v18 <= (int)v8)
  {
    v20.receiver = self;
    v20.super_class = (Class)OrgApacheLuceneUtilPackedPacked64SingleBlock;
    return -[OrgApacheLuceneUtilPackedPackedInts_Mutable setWithInt:withLongArray:withInt:withInt:](&v20, "setWithInt:withLongArray:withInt:withInt:");
  }
  return result;
}

- (void)fillWithInt:(int)a3 withInt:(int)a4 withLong:(int64_t)a5
{
  int v11 = 64 / self->super.bitsPerValue_;
  if (a4 - a3 <= 2 * v11)
  {
    v30.receiver = self;
    v30.super_class = (Class)OrgApacheLuceneUtilPackedPacked64SingleBlock;
    -[OrgApacheLuceneUtilPackedPackedInts_Mutable fillWithInt:withInt:withLong:](&v30, "fillWithInt:withInt:withLong:");
  }
  else
  {
    int v12 = a3 % v11;
    if (!(a3 % v11) || v11 < 0)
    {
      int v13 = a3;
    }
    else
    {
      do
      {
        int v13 = a3 + 1;
        -[OrgApacheLuceneUtilPackedPacked64SingleBlock setWithInt:withLong:](self, "setWithInt:withLong:");
        ++v12;
        a3 = v13;
      }
      while (v12 < v11);
    }
    if (v11 < 1)
    {
      uint64_t v28 = 0;
    }
    else
    {
      p_bitsPerValue = &self->super.bitsPerValue_;
      unsigned int v15 = (v11 + 1) & 0xFFFFFFFE;
      uint32x2_t v16 = (uint32x2_t)vdup_n_s32(v11 - 1);
      int32x2_t v17 = (int32x2_t)vld1_dup_f32((const float *)p_bitsPerValue);
      int v18 = &_mh_execute_header;
      uint64x2_t v19 = (uint64x2_t)vdupq_n_s64(a5);
      int8x16_t v20 = 0uLL;
      do
      {
        int8x16_t v21 = v20;
        uint32x2_t v22 = (uint32x2_t)v18;
        int8x8_t v23 = vand_s8((int8x8_t)vmul_s32(v17, (int32x2_t)v18), (int8x8_t)0x3F0000003FLL);
        v24.i64[0] = v23.u32[0];
        v24.i64[1] = v23.u32[1];
        int8x16_t v20 = vorrq_s8((int8x16_t)vshlq_u64(v19, v24), v21);
        int v18 = (const mach_header_64 *)vadd_s32((int32x2_t)v18, (int32x2_t)0x200000002);
        v15 -= 2;
      }
      while (v15);
      uint32x2_t v25 = vcgt_u32(v22, v16);
      v26.i64[0] = v25.i32[0];
      v26.i64[1] = v25.i32[1];
      int8x16_t v27 = vbslq_s8(v26, v21, v20);
      uint64_t v28 = (uint64_t)vorr_s8(*(int8x8_t *)v27.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v27, v27, 8uLL));
    }
    JavaUtilArrays_fillWithLongArray_withInt_withInt_withLong_((uint64_t)self->blocks_, (v13 / v11), (a4 / v11), v28, a5, v5, v6, v7);
    uint64_t v29 = (a4 / v11 * v11);
    if ((int)v29 < a4)
    {
      do
      {
        [(OrgApacheLuceneUtilPackedPacked64SingleBlock *)self setWithInt:v29 withLong:a5];
        uint64_t v29 = (v29 + 1);
      }
      while (a4 != v29);
    }
  }
}

- (id)getFormat
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_100563798;
}

- (id)description
{
  id v3 = objc_msgSend(-[OrgApacheLuceneUtilPackedPacked64SingleBlock getClass](self, "getClass"), "getSimpleName");
  [(OrgApacheLuceneUtilPackedPackedInts_MutableImpl *)self size];
  if (!self->blocks_) {
    JreThrowNullPointerException();
  }
  return (id)JreStrcat("$$I$I$IC", v4, v5, v6, v7, v8, v9, v10, v3);
}

+ (id)createWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilPackedPacked64SingleBlock_createWithOrgApacheLuceneStoreDataInput_withInt_withInt_(a3, *(uint64_t *)&a4, a5);
}

+ (id)createWithInt:(int)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilPackedPacked64SingleBlock_createWithInt_withInt_(*(uint64_t *)&a3, a4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPacked64SingleBlock;
  [(OrgApacheLuceneUtilPackedPacked64SingleBlock *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = 0x2000000015;
    v2[0] = xmmword_10031F368;
    v2[1] = unk_10031F378;
    v2[2] = xmmword_10031F388;
    JreStrongAssignAndConsume((id *)&qword_10055FD28, +[IOSIntArray newArrayWithInts:v2 count:14]);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilPackedPacked64SingleBlock__initialized);
  }
}

@end