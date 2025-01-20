@interface ComAppleContextkitUtilBytesRefPool
+ (void)initialize;
- (BOOL)reclaimSpaceWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (ComAppleContextkitUtilBytesRefPool)init;
- (ComAppleContextkitUtilBytesRefPool)initWithComAppleContextkitUtilBytesRefPool_Allocator:(id)a3;
- (ComAppleContextkitUtilBytesRefPool)initWithInt:(int)a3;
- (id)tryAppendWithJavaLangCharSequence:(id)a3;
- (id)tryAppendWithJavaLangCharSequence:(id)a3 withChar:(unsigned __int16)a4 withJavaLangCharSequence:(id)a5;
- (id)tryAppendWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (int64_t)numBytesStored;
- (void)dealloc;
- (void)nextBuffer;
- (void)reset;
- (void)resetWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4;
@end

@implementation ComAppleContextkitUtilBytesRefPool

- (ComAppleContextkitUtilBytesRefPool)init
{
  return self;
}

- (ComAppleContextkitUtilBytesRefPool)initWithInt:(int)a3
{
  return self;
}

- (ComAppleContextkitUtilBytesRefPool)initWithComAppleContextkitUtilBytesRefPool_Allocator:(id)a3
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
      *(void *)&self->bufferUpto_ = 0;
      self->byteOffset_ = 0;
      v16 = self->buffers_;
      if (!v16) {
        goto LABEL_27;
      }
      p_buffer = &self->buffer_;
      uint64_t v18 = v16->super.size_;
      if ((int)v18 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v18, 0);
      }
      elementType = v16->elementType_;
      v20 = p_buffer;
      goto LABEL_24;
    }
  }
  else
  {
    allocator = self->allocator_;
    if (!allocator) {
      goto LABEL_27;
    }
    [(ComAppleContextkitUtilBytesRefPool_Allocator *)allocator recycleByteBlocksWithByteArray2:self->buffers_ withInt:v9 withInt:(bufferUpto + 1)];
    JavaUtilArrays_fillWithNSObjectArray_withInt_withInt_withId_((uint64_t)self->buffers_, v9, (self->bufferUpto_ + 1), 0, v22, v23, v24, v25);
    if (v9) {
      goto LABEL_18;
    }
  }
  int blockSize = self->blockSize_;
  self->bufferUpto_ = -1;
  self->byteUpto_ = blockSize;
  self->byteOffset_ = -blockSize;
  v20 = &self->buffer_;
  elementType = 0;
LABEL_24:
  JreStrongAssign((id *)v20, elementType);
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
  v16 = IOSObjectArray_Set((uint64_t)self->buffers_, self->bufferUpto_ + 1, [(ComAppleContextkitUtilBytesRefPool_Allocator *)allocator getByteBlock]);
  JreStrongAssign((id *)&self->buffer_, v16);
  ++self->bufferUpto_;
  self->byteUpto_ = 0;
  self->byteOffset_ += self->blockSize_;
}

- (id)tryAppendWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = *((unsigned int *)a3 + 5);
  if (!v4) {
    return (id)qword_1005600B8;
  }
  int blockSize = self->blockSize_;
  BOOL v7 = __OFSUB__(v4, blockSize);
  int v8 = v4 - blockSize;
  if ((v8 < 0) ^ v7 | (v8 == 0)
    && ((uint64_t v9 = *((unsigned int *)a3 + 4), byteUpto = self->byteUpto_, v8 + (int)byteUpto < 1)
     || ([(ComAppleContextkitUtilBytesRefPool *)self nextBuffer],
         uint64_t byteUpto = self->byteUpto_,
         (int)byteUpto + (int)v4 - self->blockSize_ < 1)))
  {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 1), v9, self->buffer_, byteUpto, v4);
    id result = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(self->buffer_, self->byteUpto_, v4);
    self->byteUpto_ += v4;
  }
  else
  {
    return OrgApacheLuceneUtilBytesRef_deepCopyOfWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3);
  }
  return result;
}

- (id)tryAppendWithJavaLangCharSequence:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = (uint64_t)a3;
  unsigned int v5 = [a3 length];
  if (!v5) {
    return (id)qword_1005600B8;
  }
  int v6 = 3 * v5;
  int blockSize = self->blockSize_;
  if ((int)(self->byteUpto_ + 3 * v5 - blockSize) < 1
    || v6 <= blockSize
    && ([(ComAppleContextkitUtilBytesRefPool *)self nextBuffer], self->byteUpto_ + v6 - self->blockSize_ < 1)
    || (id result = new_OrgApacheLuceneUtilBytesRef_initWithJavaLangCharSequence_((void *)v3)) == 0)
  {
    LODWORD(v3) = OrgApacheLuceneUtilUnicodeUtil_UTF16toUTF8WithJavaLangCharSequence_withInt_withInt_withByteArray_withInt_((void *)v3, 0, (int)[(id)v3 length], (uint64_t)self->buffer_, self->byteUpto_);
    goto LABEL_10;
  }
  uint64_t v3 = *((unsigned int *)result + 5);
  uint64_t byteUpto = self->byteUpto_;
  if ((int)byteUpto + (int)v3 - self->blockSize_ <= 0)
  {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)result + 1), 0, self->buffer_, byteUpto, v3);
LABEL_10:
    id result = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(self->buffer_, self->byteUpto_, v3);
    self->byteUpto_ += v3;
  }
  return result;
}

- (id)tryAppendWithJavaLangCharSequence:(id)a3 withChar:(unsigned __int16)a4 withJavaLangCharSequence:(id)a5
{
  if (!a3) {
    goto LABEL_24;
  }
  unsigned int v9 = [a3 length];
  if (!a5) {
    goto LABEL_24;
  }
  int v10 = 3 * ([a5 length] + v9) + 3;
  uint64_t byteUpto = self->byteUpto_;
  int blockSize = self->blockSize_;
  int v13 = self->byteUpto_;
  if ((int)byteUpto - blockSize + v10 >= 1)
  {
    if (v10 > blockSize
      || ([(ComAppleContextkitUtilBytesRefPool *)self nextBuffer],
          int v13 = self->byteUpto_,
          v13 + v10 - self->blockSize_ >= 1))
    {
      v14 = new_OrgApacheLuceneUtilBytesRef_initWithInt_(v10);
      if (v14)
      {
        uint64_t v15 = v14;
        char v16 = 0;
        int v13 = 0;
        p_bytes = (uint64_t *)&v14->bytes_;
        goto LABEL_10;
      }
      int v13 = self->byteUpto_;
    }
  }
  uint64_t v15 = 0;
  p_bytes = (uint64_t *)&self->buffer_;
  char v16 = 1;
LABEL_10:
  uint64_t v18 = *p_bytes;
  int v19 = OrgApacheLuceneUtilUnicodeUtil_UTF16toUTF8WithJavaLangCharSequence_withInt_withInt_withByteArray_withInt_(a3, 0, (int)[a3 length], *p_bytes, v13);
  if ((unsigned __int16)(a4 - 127) <= 0xFF81u)
  {
    v20 = JavaLangCharacter_toStringWithChar_(a4);
    if (v20)
    {
      int v21 = OrgApacheLuceneUtilUnicodeUtil_UTF16toUTF8WithJavaLangCharSequence_withInt_withInt_withByteArray_withInt_(v20, 0, (int)[(NSString *)v20 length], v18, v19 + v13);
      goto LABEL_17;
    }
LABEL_24:
    JreThrowNullPointerException();
  }
  if (!v18) {
    goto LABEL_24;
  }
  uint64_t v22 = *(unsigned int *)(v18 + 8);
  int v23 = v19 + v13;
  if (v19 + v13 < 0 || v23 >= (int)v22) {
    IOSArray_throwOutOfBoundsWithMsg(v22, v23);
  }
  *(unsigned char *)(v18 + 12 + v19 + v13) = a4;
  int v21 = 1;
LABEL_17:
  uint64_t v24 = OrgApacheLuceneUtilUnicodeUtil_UTF16toUTF8WithJavaLangCharSequence_withInt_withInt_withByteArray_withInt_(a5, 0, (int)[a5 length], v18, v21 + v19 + v13)+ v21+ v19;
  if ((v16 & 1) == 0)
  {
    v15->length_ = v24;
    if (self->byteUpto_ + (int)v24 - self->blockSize_ > 0) {
      return v15;
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v15->bytes_, 0, self->buffer_, byteUpto, v24);
  }
  self->byteUpto_ += v24;
  v26 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(self->buffer_, byteUpto, v24);
  return v26;
}

- (BOOL)reclaimSpaceWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((IOSByteArray *)*((void *)a3 + 1) == self->buffer_
    && (int v4 = *((_DWORD *)a3 + 5), byteUpto = self->byteUpto_, byteUpto == *((_DWORD *)a3 + 4) + v4))
  {
    int v6 = byteUpto - v4;
    BOOL v7 = v6 >= 0;
    if (v6 >= 0) {
      int byteUpto = v6;
    }
    self->byteUpto_ = byteUpto;
  }
  else
  {
    BOOL v7 = 0;
  }
  JreStrongAssign((id *)a3 + 1, 0);
  *((_DWORD *)a3 + 5) = 0;
  *((_DWORD *)a3 + 4) = 0;
  return v7;
}

- (int64_t)numBytesStored
{
  return self->byteUpto_ + self->byteOffset_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ComAppleContextkitUtilBytesRefPool;
  [(ComAppleContextkitUtilBytesRefPool *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = new_OrgApacheLuceneUtilBytesRef_initWithInt_(0);
    JreStrongAssignAndConsume((id *)&qword_1005600B8, v2);
    atomic_store(1u, (unsigned __int8 *)&ComAppleContextkitUtilBytesRefPool__initialized);
  }
}

@end