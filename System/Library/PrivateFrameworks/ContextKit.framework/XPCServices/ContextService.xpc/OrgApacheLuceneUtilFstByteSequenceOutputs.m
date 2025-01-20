@interface OrgApacheLuceneUtilFstByteSequenceOutputs
+ (id)getSingleton;
+ (void)initialize;
- (OrgApacheLuceneUtilFstByteSequenceOutputs)init;
- (id)addWithId:(id)a3 withId:(id)a4;
- (id)commonWithId:(id)a3 withId:(id)a4;
- (id)description;
- (id)getNoOutput;
- (id)outputToStringWithId:(id)a3;
- (id)readWithOrgApacheLuceneStoreDataInput:(id)a3;
- (id)subtractWithId:(id)a3 withId:(id)a4;
- (int64_t)ramBytesUsedWithId:(id)a3;
- (void)skipOutputWithOrgApacheLuceneStoreDataInput:(id)a3;
- (void)writeWithId:(id)a3 withOrgApacheLuceneStoreDataOutput:(id)a4;
@end

@implementation OrgApacheLuceneUtilFstByteSequenceOutputs

- (OrgApacheLuceneUtilFstByteSequenceOutputs)init
{
  return self;
}

+ (id)getSingleton
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilFstByteSequenceOutputs__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_1005603E8;
}

- (id)commonWithId:(id)a3 withId:(id)a4
{
  if (!a3 || (v4 = a4) == 0) {
LABEL_26:
  }
    JreThrowNullPointerException();
  LODWORD(v6) = *((_DWORD *)a3 + 4);
  uint64_t v7 = *((unsigned int *)a4 + 4);
  int v8 = JavaLangMath_minWithInt_withInt_(*((unsigned int *)a3 + 5), *((_DWORD *)a4 + 5));
  int v9 = v8 + v6;
  if ((int)v6 >= v8 + (int)v6)
  {
    int v9 = v6;
  }
  else
  {
    uint64_t v6 = (int)v6;
    while (1)
    {
      uint64_t v10 = *((void *)a3 + 1);
      if (!v10) {
        goto LABEL_26;
      }
      uint64_t v11 = *(unsigned int *)(v10 + 8);
      if (v6 < 0 || v6 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v6);
      }
      int v12 = *(unsigned __int8 *)(v10 + 12 + v6);
      uint64_t v13 = v4[1];
      uint64_t v14 = *(unsigned int *)(v13 + 8);
      if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v7);
      }
      if (v12 != *(unsigned __int8 *)(v13 + 12 + (int)v7)) {
        break;
      }
      ++v6;
      uint64_t v7 = (v7 + 1);
      if (v9 == v6) {
        goto LABEL_17;
      }
    }
    int v9 = v6;
  }
LABEL_17:
  int v15 = *((_DWORD *)a3 + 4);
  if (v9 == v15) {
    return (id)qword_1005603D8;
  }
  if (v9 == *((_DWORD *)a3 + 5) + v15) {
    return a3;
  }
  if (v7 == *((_DWORD *)v4 + 5) + *((_DWORD *)v4 + 4)) {
    return v4;
  }
  v17 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(*((void **)a3 + 1), v15, v9 - v15);
  return v17;
}

- (id)subtractWithId:(id)a3 withId:(id)a4
{
  id result = (id)qword_1005603D8;
  if ((id)qword_1005603D8 == a4) {
    return a3;
  }
  if (!a4 || !a3) {
    JreThrowNullPointerException();
  }
  int v5 = *((_DWORD *)a4 + 5);
  int v6 = *((_DWORD *)a3 + 5) - v5;
  if (v6)
  {
    uint64_t v7 = new_OrgApacheLuceneUtilBytesRef_initWithByteArray_withInt_withInt_(*((void **)a3 + 1), *((_DWORD *)a3 + 4) + v5, v6);
    return v7;
  }
  return result;
}

- (id)addWithId:(id)a3 withId:(id)a4
{
  v4 = (id *)a4;
  if ((id)qword_1005603D8 != a3)
  {
    if ((id)qword_1005603D8 == a4)
    {
      return a3;
    }
    else
    {
      int v6 = new_OrgApacheLuceneUtilBytesRef_initWithInt_(*((_DWORD *)a4 + 5) + *((_DWORD *)a3 + 5));
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(*((id *)a3 + 1), *((unsigned int *)a3 + 4), v6->bytes_, 0, *((unsigned int *)a3 + 5));
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v4[1], *((unsigned int *)v4 + 4), v6->bytes_, *((unsigned int *)a3 + 5), *((unsigned int *)v4 + 5));
      v6->length_ = *((_DWORD *)v4 + 5) + *((_DWORD *)a3 + 5);
      return v6;
    }
  }
  return v4;
}

- (void)writeWithId:(id)a3 withOrgApacheLuceneStoreDataOutput:(id)a4
{
  if (!a4 || !a3) {
    JreThrowNullPointerException();
  }
  [a4 writeVIntWithInt:*((unsigned int *)a3 + 5)];
  uint64_t v6 = *((void *)a3 + 1);
  uint64_t v7 = *((unsigned int *)a3 + 4);
  uint64_t v8 = *((unsigned int *)a3 + 5);
  [a4 writeBytesWithByteArray:v6 withInt:v7 withInt:v8];
}

- (id)readWithOrgApacheLuceneStoreDataInput:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 readVInt];
  if (!v4) {
    return (id)qword_1005603D8;
  }
  id v5 = v4;
  uint64_t v6 = new_OrgApacheLuceneUtilBytesRef_initWithInt_((int)v4);
  [a3 readBytesWithByteArray:v6->bytes_ withInt:0 withInt:v5];
  v6->length_ = (int)v5;
  return v6;
}

- (void)skipOutputWithOrgApacheLuceneStoreDataInput:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  signed int v4 = [a3 readVInt];
  if (v4)
  {
    [a3 skipBytesWithLong:v4];
  }
}

- (id)getNoOutput
{
  return (id)qword_1005603D8;
}

- (id)outputToStringWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 description];
}

- (int64_t)ramBytesUsedWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = qword_1005603E0;
  return OrgApacheLuceneUtilRamUsageEstimator_sizeOfWithByteArray_(*((void *)a3 + 1)) + v3;
}

- (id)description
{
  return @"ByteSequenceOutputs";
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_OrgApacheLuceneUtilBytesRef_init();
    JreStrongAssignAndConsume((id *)&qword_1005603D8, v2);
    uint64_t v3 = [OrgApacheLuceneUtilFstByteSequenceOutputs alloc];
    OrgApacheLuceneUtilFstOutputs_init(v3, v4);
    JreStrongAssignAndConsume((id *)&qword_1005603E8, v3);
    qword_1005603E0 = OrgApacheLuceneUtilRamUsageEstimator_shallowSizeOfWithId_((void *)qword_1005603D8);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilFstByteSequenceOutputs__initialized);
  }
}

@end