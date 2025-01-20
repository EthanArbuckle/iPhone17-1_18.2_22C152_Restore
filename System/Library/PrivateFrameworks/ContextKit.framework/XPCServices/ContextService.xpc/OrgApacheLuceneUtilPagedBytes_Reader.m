@interface OrgApacheLuceneUtilPagedBytes_Reader
+ (void)initialize;
- (NSString)description;
- (OrgApacheLuceneUtilPagedBytes_Reader)initWithOrgApacheLuceneUtilPagedBytes:(id)a3;
- (int64_t)ramBytesUsed;
- (void)dealloc;
- (void)fillSliceWithOrgApacheLuceneUtilBytesRef:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (void)fillWithOrgApacheLuceneUtilBytesRef:(id)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilPagedBytes_Reader

- (OrgApacheLuceneUtilPagedBytes_Reader)initWithOrgApacheLuceneUtilPagedBytes:(id)a3
{
  return self;
}

- (void)fillSliceWithOrgApacheLuceneUtilBytesRef:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  if (!a3) {
    goto LABEL_17;
  }
  *((_DWORD *)a3 + 5) = a5;
  if (!a5) {
    return;
  }
  int64_t v8 = a4 >> self->blockBits_;
  uint64_t v9 = self->blockMask_ & a4;
  if (self->blockSize_ - (int)v9 < a5)
  {
    JreStrongAssignAndConsume((id *)a3 + 1, +[IOSByteArray newArrayWithLength:a5]);
    *((_DWORD *)a3 + 4) = 0;
    blocks = self->blocks_;
    if (blocks)
    {
      int64_t v11 = v8 << 32;
      uint64_t size = blocks->super.size_;
      if ((v8 & 0x80000000) != 0 || (int)size <= (int)v8) {
        IOSArray_throwOutOfBoundsWithMsg(size, v8);
      }
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_((&blocks->elementType_)[(int)v8], v9, *((void **)a3 + 1), 0, (self->blockSize_ - v9));
      v13 = self->blocks_;
      uint64_t v14 = v13->super.size_;
      uint64_t v15 = ((uint64_t)&_mh_execute_header + v11) >> 32;
      if ((uint64_t)&_mh_execute_header + v11 < 0 || (int)v14 <= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v14, ((uint64_t)&_mh_execute_header + v11) >> 32);
      }
      v16 = (&v13->elementType_)[v15];
      v17 = (void *)*((void *)a3 + 1);
      uint64_t v18 = (self->blockSize_ - v9);
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v16, 0, v17, v18, (a5 - v18));
      return;
    }
LABEL_17:
    JreThrowNullPointerException();
  }
  v19 = self->blocks_;
  if (!v19) {
    goto LABEL_17;
  }
  uint64_t v20 = v19->super.size_;
  if ((v8 & 0x80000000) != 0 || (int)v20 <= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v20, v8);
  }
  JreStrongAssign((id *)a3 + 1, (&v19->elementType_)[(int)v8]);
  *((_DWORD *)a3 + 4) = v9;
}

- (void)fillWithOrgApacheLuceneUtilBytesRef:(id)a3 withLong:(int64_t)a4
{
  if (!a3 || (blocks = self->blocks_) == 0) {
    JreThrowNullPointerException();
  }
  int64_t v6 = a4 >> self->blockBits_;
  uint64_t v7 = self->blockMask_ & a4;
  uint64_t size = blocks->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)size <= (int)v6) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  uint64_t v9 = (unsigned int *)JreStrongAssign((id *)a3 + 1, (&blocks->elementType_)[(int)v6]);
  uint64_t v10 = v9[2];
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v10) {
    IOSArray_throwOutOfBoundsWithMsg(v10, v7);
  }
  int v11 = *((char *)v9 + (int)v7 + 12);
  uint64_t v12 = v9[2];
  BOOL v14 = (int)v7 < 0 || (int)v7 >= (int)v12;
  if (v11 < 0)
  {
    if (v14) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v7);
    }
    int v17 = (v11 & 0x7F) << 8;
    int v18 = v7 + 1;
    if ((int)v7 + 1 < 0 || v18 >= (int)v12) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v18);
    }
    int v15 = v17 | *((unsigned __int8 *)v9 + v18 + 12);
    int v16 = 2;
  }
  else
  {
    if (v14) {
      IOSArray_throwOutOfBoundsWithMsg(v12, v7);
    }
    int v15 = (char)v11;
    int v16 = 1;
  }
  *((_DWORD *)a3 + 5) = v15;
  *((_DWORD *)a3 + 4) = v7 + v16;
}

- (int64_t)ramBytesUsed
{
  uint64_t v3 = qword_1005606A0;
  uint64_t v4 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithNSObjectArray_((uint64_t)self->blocks_);
  blocks = self->blocks_;
  if (!blocks) {
    JreThrowNullPointerException();
  }
  int64_t result = v4 + v3;
  int size = blocks->super.size_;
  BOOL v8 = __OFSUB__(size, 1);
  uint64_t v9 = (size - 1);
  if ((int)v9 < 0 == v8)
  {
    int64_t v10 = result + self->bytesUsedPerBlock_ * v9;
    return v10
         + OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithByteArray_((uint64_t)(&blocks->elementType_)[v9]);
  }
  return result;
}

- (NSString)description
{
  return (NSString *)JreStrcat("$IC", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"PagedBytes(blocksize=");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPagedBytes_Reader;
  [(OrgApacheLuceneUtilPagedBytes_Reader *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = (void *)OrgApacheLuceneUtilPagedBytes_Reader_class_();
    qword_1005606A0 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfInstanceWithIOSClass_(v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilPagedBytes_Reader__initialized);
  }
}

@end