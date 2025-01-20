@interface OrgApacheLuceneUtilByteBlockPool
+ (void)initialize;
- (OrgApacheLuceneUtilByteBlockPool)initWithOrgApacheLuceneUtilByteBlockPool_Allocator:(id)a3;
- (int)allocSliceWithByteArray:(id)a3 withInt:(int)a4;
- (int)newSliceWithInt:(int)a3;
- (void)appendWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (void)dealloc;
- (void)nextBuffer;
- (void)readBytesWithLong:(int64_t)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)reset;
- (void)resetWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4;
- (void)setBytesRefWithOrgApacheLuceneUtilBytesRef:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilByteBlockPool

- (OrgApacheLuceneUtilByteBlockPool)initWithOrgApacheLuceneUtilByteBlockPool_Allocator:(id)a3
{
  return self;
}

- (void)reset
{
}

- (void)resetWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4
{
  uint64_t bufferUpto = self->bufferUpto_;
  if (bufferUpto == -1) {
    return;
  }
  BOOL v9 = a4;
  if (a3)
  {
    if ((int)bufferUpto >= 1)
    {
      uint64_t v11 = 0;
      while (1)
      {
        buffers = self->buffers_;
        if (!buffers) {
          break;
        }
        uint64_t size = buffers->super.size_;
        if (v11 >= size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v11);
        }
        JavaUtilArrays_fillWithByteArray_withByte_((uint64_t)(&buffers->elementType_)[v11++], 0);
        uint64_t bufferUpto = self->bufferUpto_;
        if (v11 >= bufferUpto) {
          goto LABEL_11;
        }
      }
LABEL_27:
      JreThrowNullPointerException();
    }
LABEL_11:
    v14 = self->buffers_;
    if (!v14) {
      goto LABEL_27;
    }
    uint64_t v15 = v14->super.size_;
    if ((bufferUpto & 0x80000000) != 0 || (int)bufferUpto >= (int)v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, bufferUpto);
    }
    JavaUtilArrays_fillWithByteArray_withInt_withInt_withByte_((uint64_t)(&v14->elementType_)[(int)bufferUpto], 0, self->byteUpto_, 0, v4, v5, v6, v7);
    LODWORD(bufferUpto) = self->bufferUpto_;
  }
  if ((int)bufferUpto <= 0 && v9)
  {
    if (v9)
    {
LABEL_18:
      self->byteUpto_ = 0;
      *(void *)&self->byteOffset_ = 0;
      v16 = self->buffers_;
      if (!v16) {
        goto LABEL_27;
      }
      uint64_t v17 = v16->super.size_;
      if ((int)v17 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v17, 0);
      }
      elementType = v16->elementType_;
      goto LABEL_24;
    }
  }
  else
  {
    allocator = self->allocator_;
    if (!allocator) {
      goto LABEL_27;
    }
    [(OrgApacheLuceneUtilByteBlockPool_Allocator *)allocator recycleByteBlocksWithByteArray2:self->buffers_ withInt:v9 withInt:(bufferUpto + 1)];
    JavaUtilArrays_fillWithNSObjectArray_withInt_withInt_withId_((uint64_t)self->buffers_, v9, (self->bufferUpto_ + 1), 0, v20, v21, v22, v23);
    if (v9) {
      goto LABEL_18;
    }
  }
  elementType = 0;
  self->byteUpto_ = 0x8000;
  *(void *)&self->byteOffset_ = -32768;
LABEL_24:
  JreStrongAssign((id *)&self->buffer_, elementType);
}

- (void)nextBuffer
{
  p_buffers = &self->buffers_;
  buffers = self->buffers_;
  if (!buffers) {
    goto LABEL_8;
  }
  int bufferUpto = self->bufferUpto_;
  if (bufferUpto + 1 == buffers->super.size_)
  {
    unsigned int v12 = bufferUpto + 2;
    if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    uint64_t v13 = (int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v12, OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_OBJECT_REF_, v2, v3, v4, v5, v6, v7);
    }
    v14 = +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", v13, IOSClass_arrayType((uint64_t)+[IOSClass byteClass], 1u));
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*p_buffers, 0, v14, 0, (*p_buffers)->super.size_);
    JreStrongAssign((id *)p_buffers, v14);
  }
  allocator = self->allocator_;
  if (!allocator) {
LABEL_8:
  }
    JreThrowNullPointerException();
  v16 = IOSObjectArray_Set((uint64_t)self->buffers_, self->bufferUpto_ + 1, [(OrgApacheLuceneUtilByteBlockPool_Allocator *)allocator getByteBlock]);
  JreStrongAssign((id *)&self->buffer_, v16);
  self->byteUpto_ = 0;
  *(int32x2_t *)&self->byteOffset_ = vadd_s32(*(int32x2_t *)&self->byteOffset_, (int32x2_t)0x100008000);
}

- (int)newSliceWithInt:(int)a3
{
  int byteUpto = self->byteUpto_;
  if (byteUpto > 0x8000 - a3)
  {
    [(OrgApacheLuceneUtilByteBlockPool *)self nextBuffer];
    int byteUpto = self->byteUpto_;
  }
  int v6 = byteUpto + a3;
  self->byteUpto_ = byteUpto + a3;
  buffer = self->buffer_;
  if (!buffer) {
    JreThrowNullPointerException();
  }
  uint64_t size = buffer->super.size_;
  int v9 = v6 - 1;
  if (v6 - 1 < 0 || v9 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (v6 - 1));
  }
  *((unsigned char *)&buffer->super.size_ + v9 + 4) = 16;
  return byteUpto;
}

- (int)allocSliceWithByteArray:(id)a3 withInt:(int)a4
{
  if (!a3) {
    goto LABEL_35;
  }
  uint64_t v6 = *((unsigned int *)a3 + 2);
  if (a4 < 0 || (int)v6 <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(v6, *(uint64_t *)&a4);
  }
  if (!OrgApacheLuceneUtilByteBlockPool_NEXT_LEVEL_ARRAY_) {
    goto LABEL_35;
  }
  uint64_t v7 = a4;
  uint64_t v8 = *((unsigned char *)a3 + a4 + 12) & 0xF;
  uint64_t v9 = *(unsigned int *)(OrgApacheLuceneUtilByteBlockPool_NEXT_LEVEL_ARRAY_ + 8);
  if ((int)v9 <= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v9, *((unsigned char *)a3 + a4 + 12) & 0xF);
  }
  if (!OrgApacheLuceneUtilByteBlockPool_LEVEL_SIZE_ARRAY_) {
    goto LABEL_35;
  }
  uint64_t v10 = *(int *)(OrgApacheLuceneUtilByteBlockPool_NEXT_LEVEL_ARRAY_ + 12 + 4 * v8);
  uint64_t v11 = *(unsigned int *)(OrgApacheLuceneUtilByteBlockPool_LEVEL_SIZE_ARRAY_ + 8);
  if ((v10 & 0x80000000) != 0 || (int)v10 >= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v11, *(int *)(OrgApacheLuceneUtilByteBlockPool_NEXT_LEVEL_ARRAY_ + 12 + 4 * v8));
  }
  int v12 = *(_DWORD *)(OrgApacheLuceneUtilByteBlockPool_LEVEL_SIZE_ARRAY_ + 12 + 4 * v10);
  uint64_t byteUpto = self->byteUpto_;
  if ((int)byteUpto > 0x8000 - v12)
  {
    uint64_t v14 = *(void *)&a4;
    uint64_t v15 = a4;
    int v16 = *(_DWORD *)(OrgApacheLuceneUtilByteBlockPool_NEXT_LEVEL_ARRAY_ + 12 + 4 * v8);
    [(OrgApacheLuceneUtilByteBlockPool *)self nextBuffer];
    LOBYTE(v10) = v16;
    uint64_t v7 = v15;
    *(void *)&a4 = v14;
    uint64_t byteUpto = self->byteUpto_;
  }
  int byteOffset = self->byteOffset_;
  self->byteUpto_ = byteUpto + v12;
  uint64_t v18 = *((unsigned int *)a3 + 2);
  int v19 = a4 - 3;
  uint64_t v20 = a4 - 3;
  if (a4 - 3 < 0 || v19 >= (int)v18) {
    IOSArray_throwOutOfBoundsWithMsg(v18, v19);
  }
  buffer = self->buffer_;
  if (!buffer) {
LABEL_35:
  }
    JreThrowNullPointerException();
  uint64_t size = buffer->super.size_;
  if ((byteUpto & 0x80000000) != 0 || (int)byteUpto >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, byteUpto);
  }
  *((unsigned char *)&buffer->super.size_ + (int)byteUpto + 4) = *((unsigned char *)a3 + v20 + 12);
  uint64_t v23 = *((unsigned int *)a3 + 2);
  int v24 = a4 - 2;
  uint64_t v25 = a4 - 2;
  if (a4 - 2 < 0 || v24 >= (int)v23) {
    IOSArray_throwOutOfBoundsWithMsg(v23, v24);
  }
  v26 = self->buffer_;
  uint64_t v27 = v26->super.size_;
  int v28 = byteUpto + 1;
  if ((int)byteUpto + 1 < 0 || v28 >= (int)v27) {
    IOSArray_throwOutOfBoundsWithMsg(v27, v28);
  }
  *((unsigned char *)&v26->super.size_ + v28 + 4) = *((unsigned char *)a3 + v25 + 12);
  uint64_t v29 = *((unsigned int *)a3 + 2);
  int v30 = a4 - 1;
  uint64_t v31 = a4 - 1;
  if (a4 - 1 < 0 || v30 >= (int)v29) {
    IOSArray_throwOutOfBoundsWithMsg(v29, v30);
  }
  v32 = self->buffer_;
  uint64_t v33 = v32->super.size_;
  int v34 = byteUpto + 2;
  if ((int)byteUpto + 2 < 0 || v34 >= (int)v33) {
    IOSArray_throwOutOfBoundsWithMsg(v33, v34);
  }
  int v35 = byteOffset + byteUpto;
  *((unsigned char *)&v32->super.size_ + v34 + 4) = *((unsigned char *)a3 + v31 + 12);
  uint64_t v36 = *((unsigned int *)a3 + 2);
  if ((v20 & 0x80000000) != 0 || (int)v20 >= (int)v36) {
    IOSArray_throwOutOfBoundsWithMsg(v36, v20);
  }
  *((unsigned char *)a3 + v20 + 12) = HIBYTE(v35);
  uint64_t v37 = *((unsigned int *)a3 + 2);
  if ((v25 & 0x80000000) != 0 || (int)v25 >= (int)v37) {
    IOSArray_throwOutOfBoundsWithMsg(v37, v25);
  }
  *((unsigned char *)a3 + v25 + 12) = BYTE2(v35);
  uint64_t v38 = *((unsigned int *)a3 + 2);
  if ((v31 & 0x80000000) != 0 || (int)v31 >= (int)v38) {
    IOSArray_throwOutOfBoundsWithMsg(v38, v31);
  }
  *((unsigned char *)a3 + v31 + 12) = BYTE1(v35);
  uint64_t v39 = *((unsigned int *)a3 + 2);
  if (a4 < 0 || (int)v39 <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(v39, *(uint64_t *)&a4);
  }
  *((unsigned char *)a3 + v7 + 12) = v35;
  v40 = self->buffer_;
  int v41 = self->byteUpto_;
  uint64_t v42 = v40->super.size_;
  int v43 = v41 - 1;
  if (v41 - 1 < 0 || v43 >= (int)v42) {
    IOSArray_throwOutOfBoundsWithMsg(v42, (v41 - 1));
  }
  *((unsigned char *)&v40->super.size_ + v43 + 4) = v10 | 0x10;
  return byteUpto + 3;
}

- (void)setBytesRefWithOrgApacheLuceneUtilBytesRef:(id)a3 withInt:(int)a4
{
  if (!a3 || (buffers = self->buffers_) == 0) {
    JreThrowNullPointerException();
  }
  __int16 v5 = a4;
  uint64_t size = buffers->super.size_;
  if (a4 < 0 || a4 >> 15 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (uint64_t)a4 >> 15);
  }
  uint64_t v8 = (unsigned int *)JreStrongAssign((id *)a3 + 1, (&buffers->elementType_)[(uint64_t)a4 >> 15]);
  uint64_t v9 = v5 & 0x7FFF;
  uint64_t v10 = v8[2];
  if ((int)v9 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v9);
  }
  int v11 = *((char *)v8 + v9 + 12);
  uint64_t v12 = v8[2];
  if (v11 < 0)
  {
    if ((int)v9 >= (int)v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v9);
    }
    if ((int)v9 + 1 >= (int)v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v9 + 1);
    }
    int v13 = v11 & 0x7F | (*((unsigned __int8 *)v8 + v9 + 13) << 7);
    int v14 = 2;
  }
  else
  {
    if ((int)v9 >= (int)v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v9);
    }
    int v13 = (char)v11;
    int v14 = 1;
  }
  *((_DWORD *)a3 + 5) = v13;
  *((_DWORD *)a3 + 4) = v9 + v14;
}

- (void)appendWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = *((unsigned int *)a3 + 5);
  if (v4)
  {
    uint64_t v6 = *((unsigned int *)a3 + 4);
    uint64_t byteUpto = self->byteUpto_;
    int v8 = byteUpto + v4;
    if ((int)byteUpto + (int)v4 - 0x8000 >= 1)
    {
      int v9 = 0x8000 - v8;
      int v10 = -v8;
      do
      {
        int v11 = v4;
        uint64_t v4 = (v4 + v9);
        if ((int)v4 >= 1)
        {
          JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 1), v6, self->buffer_, self->byteUpto_, v4);
          uint64_t v6 = (v9 + v11 + v6);
        }
        v8 -= 0x8000;
        LODWORD(v4) = v8 + (v4 & ((int)v4 >> 31));
        [(OrgApacheLuceneUtilByteBlockPool *)self nextBuffer];
        v9 += 0x8000;
        v10 += 0x8000;
      }
      while (v8 > 0x8000);
      uint64_t byteUpto = self->byteUpto_;
      uint64_t v4 = ((v11 + v10) & ((v11 + v10) >> 31)) + v8;
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 1), v6, self->buffer_, byteUpto, v4);
    self->byteUpto_ += v4;
  }
}

- (void)readBytesWithLong:(int64_t)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  if (a6)
  {
    buffers = self->buffers_;
    if (!buffers) {
      JreThrowNullPointerException();
    }
    uint64_t v8 = *(void *)&a6;
    uint64_t v9 = *(void *)&a5;
    int64_t v11 = a3 >> 15;
    uint64_t size = buffers->super.size_;
    if (((a3 >> 15) & 0x80000000) != 0 || (int)size <= (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 15);
    }
    int64_t v13 = a3 & 0x7FFF;
    int v14 = (&buffers->elementType_)[(int)(a3 >> 15)];
    if ((int)v13 + a6 - 0x8000 < 1)
    {
      int64_t v20 = a3 & 0x7FFF;
    }
    else
    {
      int v15 = a6 + v13;
      uint64_t v16 = (0x8000 - v13);
      int v17 = v11 + 1;
      do
      {
        JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v14, v13, a4, v9, v16);
        uint64_t v18 = self->buffers_;
        uint64_t v19 = v18->super.size_;
        if (v17 < 0 || v17 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, v17);
        }
        int64_t v20 = 0;
        int64_t v13 = 0;
        uint64_t v8 = (v8 - v16);
        uint64_t v9 = (v16 + v9);
        int v14 = (&v18->elementType_)[v17];
        v15 -= 0x8000;
        uint64_t v16 = (v16 + 0x8000);
        ++v17;
      }
      while (v15 > 0x8000);
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v14, v20, a4, v9, v8);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilByteBlockPool;
  [(OrgApacheLuceneUtilByteBlockPool *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v6 = 0x900000009;
    v5[0] = xmmword_10031F3B0;
    v5[1] = unk_10031F3C0;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilByteBlockPool_NEXT_LEVEL_ARRAY_, +[IOSIntArray newArrayWithInts:v5 count:10]);
    uint64_t v4 = 0xC800000078;
    v3[0] = xmmword_10031F3D8;
    v3[1] = unk_10031F3E8;
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneUtilByteBlockPool_LEVEL_SIZE_ARRAY_, +[IOSIntArray newArrayWithInts:v3 count:10]);
    uint64_t v2 = *(unsigned int *)(OrgApacheLuceneUtilByteBlockPool_LEVEL_SIZE_ARRAY_ + 8);
    if ((int)v2 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v2, 0);
    }
    OrgApacheLuceneUtilByteBlockPool_FIRST_LEVEL_SIZE_ = *(_DWORD *)(OrgApacheLuceneUtilByteBlockPool_LEVEL_SIZE_ARRAY_
                                                                   + 12);
    atomic_store(1u, OrgApacheLuceneUtilByteBlockPool__initialized);
  }
}

@end