@interface OrgApacheLuceneCodecsLucene50ForUtil
+ (void)initialize;
- (OrgApacheLuceneCodecsLucene50ForUtil)initWithFloat:(float)a3 withOrgApacheLuceneStoreDataOutput:(id)a4;
- (OrgApacheLuceneCodecsLucene50ForUtil)initWithOrgApacheLuceneStoreDataInput:(id)a3;
- (void)dealloc;
- (void)readBlockWithOrgApacheLuceneStoreIndexInput:(id)a3 withByteArray:(id)a4 withIntArray:(id)a5;
- (void)skipBlockWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (void)writeBlockWithIntArray:(id)a3 withByteArray:(id)a4 withOrgApacheLuceneStoreIndexOutput:(id)a5;
@end

@implementation OrgApacheLuceneCodecsLucene50ForUtil

- (OrgApacheLuceneCodecsLucene50ForUtil)initWithFloat:(float)a3 withOrgApacheLuceneStoreDataOutput:(id)a4
{
  return self;
}

- (OrgApacheLuceneCodecsLucene50ForUtil)initWithOrgApacheLuceneStoreDataInput:(id)a3
{
  return self;
}

- (void)writeBlockWithIntArray:(id)a3 withByteArray:(id)a4 withOrgApacheLuceneStoreIndexOutput:(id)a5
{
  if (atomic_load_explicit(OrgApacheLuceneCodecsLucene50ForUtil__initialized, memory_order_acquire))
  {
    if (!a3) {
      goto LABEL_43;
    }
  }
  else
  {
    objc_opt_class();
    if (!a3) {
      goto LABEL_43;
    }
  }
  uint64_t v12 = *((unsigned int *)a3 + 2);
  if ((int)v12 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v12, 0);
  }
  BOOL v13 = 0;
  for (uint64_t i = 1; i != 128; ++i)
  {
    uint64_t v15 = *((int *)a3 + 2);
    if (i >= v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, i);
    }
    if (*((_DWORD *)a3 + i + 3) != *((_DWORD *)a3 + 3)) {
      break;
    }
    BOOL v13 = (unint64_t)i > 0x7E;
  }
  if (v13)
  {
    if (a5)
    {
      [a5 writeByteWithByte:0];
      uint64_t v16 = *((unsigned int *)a3 + 2);
      if ((int)v16 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v16, 0);
      }
      uint64_t v17 = *((unsigned int *)a3 + 3);
      [a5 writeVIntWithInt:v17];
      return;
    }
LABEL_43:
    JreThrowNullPointerException();
  }
  if ((atomic_load_explicit(OrgApacheLuceneCodecsLucene50ForUtil__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v18 = 0;
  unint64_t v19 = 0;
  do
  {
    uint64_t v20 = *((int *)a3 + 2);
    if (v18 >= v20) {
      IOSArray_throwOutOfBoundsWithMsg(v20, v18);
    }
    v19 |= *((int *)a3 + v18++ + 3);
  }
  while (v18 != 128);
  uint64_t v21 = OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_(v19, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7);
  encoders = self->encoders_;
  if (!encoders) {
    goto LABEL_43;
  }
  uint64_t v23 = v21;
  uint64_t size = encoders->super.size_;
  if ((v23 & 0x80000000) != 0 || (int)v23 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v23);
  }
  iterations = self->iterations_;
  if (!iterations) {
    goto LABEL_43;
  }
  id v26 = a4;
  v27 = (&encoders->elementType_)[(int)v23];
  uint64_t v28 = iterations->super.size_;
  if ((v23 & 0x80000000) != 0 || (int)v23 >= (int)v28) {
    IOSArray_throwOutOfBoundsWithMsg(v28, v23);
  }
  encodedSizes = self->encodedSizes_;
  if (!encodedSizes) {
    goto LABEL_43;
  }
  uint64_t v30 = *((unsigned int *)&iterations->super.size_ + (int)v23 + 1);
  uint64_t v31 = encodedSizes->super.size_;
  if ((v23 & 0x80000000) != 0 || (int)v23 >= (int)v31) {
    IOSArray_throwOutOfBoundsWithMsg(v31, v23);
  }
  if (!a5) {
    goto LABEL_43;
  }
  uint64_t v32 = *((unsigned int *)&encodedSizes->super.size_ + (int)v23 + 1);
  [a5 writeByteWithByte:(char)v23];
  [(IOSClass *)v27 encodeWithIntArray:a3 withInt:0 withByteArray:v26 withInt:0 withInt:v30];
  [a5 writeBytesWithByteArray:v26 withInt:v32];
}

- (void)readBlockWithOrgApacheLuceneStoreIndexInput:(id)a3 withByteArray:(id)a4 withIntArray:(id)a5
{
  if (!a3) {
    goto LABEL_18;
  }
  id v9 = [a3 readByte];
  if (v9)
  {
    encodedSizes = self->encodedSizes_;
    if (encodedSizes)
    {
      uint64_t v11 = (uint64_t)v9;
      uint64_t v12 = (int)v9;
      uint64_t size = encodedSizes->super.size_;
      if ((v11 & 0x80000000) != 0 || (int)size <= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(size, v11);
      }
      [a3 readBytesWithByteArray:a4 withInt:0 withInt:*((unsigned int *)&encodedSizes->super.size_ + v12 + 1)];
      decoders = self->decoders_;
      if (decoders)
      {
        uint64_t v15 = decoders->super.size_;
        if ((v11 & 0x80000000) != 0 || (int)v15 <= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v15, v11);
        }
        iterations = self->iterations_;
        if (iterations)
        {
          uint64_t v17 = iterations->super.size_;
          if ((v11 & 0x80000000) != 0 || (int)v17 <= (int)v11) {
            IOSArray_throwOutOfBoundsWithMsg(v17, v11);
          }
          uint64_t v18 = *((unsigned int *)&iterations->super.size_ + v12 + 1);
          unint64_t v19 = (&decoders->elementType_)[v12];
          [(IOSClass *)v19 decodeWithByteArray:a4 withInt:0 withIntArray:a5 withInt:0 withInt:v18];
          return;
        }
      }
    }
LABEL_18:
    JreThrowNullPointerException();
  }
  id v20 = [a3 readVInt];
  JavaUtilArrays_fillWithIntArray_withInt_withInt_withInt_((uint64_t)a5, 0, 128, (uint64_t)v20, v21, v22, v23, v24);
}

- (void)skipBlockWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  if (!a3) {
    goto LABEL_12;
  }
  id v5 = [a3 readByte];
  if (v5)
  {
    encodedSizes = self->encodedSizes_;
    if (encodedSizes)
    {
      uint64_t v7 = (uint64_t)v5;
      uint64_t v8 = (int)v5;
      uint64_t size = encodedSizes->super.size_;
      if ((v7 & 0x80000000) != 0 || (int)size <= (int)v7) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      uint64_t v10 = *(&encodedSizes->super.size_ + v8 + 1);
      uint64_t v11 = (char *)[a3 getFilePointer] + v10;
      [a3 seekWithLong:v11];
      return;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  [a3 readVInt];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsLucene50ForUtil;
  [(OrgApacheLuceneCodecsLucene50ForUtil *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    do
    {
      v4 = OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values();
      if (!v4) {
LABEL_15:
      }
        JreThrowNullPointerException();
      p_elementType = &v4->elementType_;
      unint64_t v6 = (unint64_t)&(&v4->elementType_)[v4->super.size_];
      while ((unint64_t)p_elementType < v6)
      {
        uint64_t v8 = *p_elementType++;
        uint64_t v7 = v8;
        if (!v8) {
          goto LABEL_15;
        }
        uint64_t v9 = 1;
        do
        {
          if ([v7 isSupportedWithInt:v9])
          {
            DecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt = (void *)OrgApacheLuceneUtilPackedPackedInts_getDecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_(v7, v3, v9, v10, v11, v12, v13, v14);
            int v16 = sub_100044D78(DecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt);
            if (!DecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt) {
              goto LABEL_15;
            }
            uint64_t v2 = JavaLangMath_maxWithInt_withInt_(v2, [DecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt byteValueCount]* v16);
          }
          uint64_t v9 = (v9 + 1);
        }
        while (v9 != 33);
      }
      uint64_t v3 = (v3 + 1);
    }
    while (v3 != 3);
    OrgApacheLuceneCodecsLucene50ForUtil_MAX_DATA_SIZE_ = v2;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsLucene50ForUtil__initialized);
  }
}

@end