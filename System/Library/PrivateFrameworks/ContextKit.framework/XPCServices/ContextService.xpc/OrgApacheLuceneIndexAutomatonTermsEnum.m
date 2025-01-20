@interface OrgApacheLuceneIndexAutomatonTermsEnum
- (BOOL)nextStringWithInt:(int)a3 withInt:(int)a4;
- (OrgApacheLuceneIndexAutomatonTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a4;
- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)nextSeekTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (int)backtrackWithInt:(int)a3;
- (uint64_t)nextString;
- (void)dealloc;
- (void)setLinearWithInt:(int)a3;
@end

@implementation OrgApacheLuceneIndexAutomatonTermsEnum

- (OrgApacheLuceneIndexAutomatonTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3 withOrgApacheLuceneUtilAutomatonCompiledAutomaton:(id)a4
{
  return self;
}

- (id)acceptWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  uint64_t v5 = *(uint64_t *)((char *)&self->runAutomaton_ + 1);
  if (v5
    && !OrgApacheLuceneUtilStringHelper_endsWithWithOrgApacheLuceneUtilBytesRef_withOrgApacheLuceneUtilBytesRef_((uint64_t)a3, v5))
  {
    if (!BYTE1(self->seekBytesRef_)) {
      goto LABEL_16;
    }
    if (a3)
    {
LABEL_15:
      if (([a3 compareToWithId:*(void *)(&self->linear_ + 1)] & 0x80000000) != 0)
      {
        v10 = &qword_100563760;
        if (atomic_load_explicit(OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum__initialized, memory_order_acquire))return (id)*v10; {
        goto LABEL_10;
        }
      }
LABEL_16:
      v10 = &qword_100563768;
      if (atomic_load_explicit(OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum__initialized, memory_order_acquire))return (id)*v10; {
      goto LABEL_10;
      }
    }
LABEL_20:
    JreThrowNullPointerException();
  }
  v6 = *(void **)(&self->super.doSeek_ + 1);
  if (!v6 || !a3) {
    goto LABEL_20;
  }
  unsigned int v7 = [v6 runWithByteArray:*((void *)a3 + 1) withInt:*((unsigned int *)a3 + 4) withInt:*((unsigned int *)a3 + 5)];
  int v8 = BYTE1(self->seekBytesRef_);
  if (!v7)
  {
    if (!BYTE1(self->seekBytesRef_)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  unsigned __int8 explicit = atomic_load_explicit(OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum__initialized, memory_order_acquire);
  if (v8) {
    v10 = OrgApacheLuceneIndexFilteredTermsEnum_AcceptStatusEnum_values_;
  }
  else {
    v10 = &qword_100563758;
  }
  if ((explicit & 1) == 0) {
LABEL_10:
  }
    objc_opt_class();
  return (id)*v10;
}

- (id)nextSeekTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  if (a3)
  {
    v4 = *(void **)((char *)&self->curGen_ + 1);
    if (!v4) {
      goto LABEL_13;
    }
    objc_msgSend(v4, "copyBytesWithOrgApacheLuceneUtilBytesRef:");
  }
  else
  {
    uint64_t v5 = *(void **)(&self->super.doSeek_ + 1);
    if (!v5) {
      goto LABEL_13;
    }
    if (objc_msgSend(v5, "isAcceptWithInt:", objc_msgSend(*(id *)(&self->super.doSeek_ + 1), "getInitialState")))
    {
      v6 = *(void **)((char *)&self->curGen_ + 1);
      goto LABEL_9;
    }
  }
  if (!-[OrgApacheLuceneIndexAutomatonTermsEnum nextString]_0((uint64_t)self)) {
    return 0;
  }
  v6 = *(void **)((char *)&self->curGen_ + 1);
  if (!v6) {
LABEL_13:
  }
    JreThrowNullPointerException();
LABEL_9:
  return [v6 get];
}

- (uint64_t)nextString
{
  v1 = &OBJC_IVAR___OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry_format_;
  v2 = *(void **)(a1 + 121);
  if (!v2) {
    goto LABEL_30;
  }
  v4 = *(void **)(a1 + 89);
  if (!v4) {
    goto LABEL_30;
  }
  objc_msgSend(v2, "growWithInt:", objc_msgSend(v4, "length") + 1);
  uint64_t v5 = &OBJC_IVAR___OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry_format_;
  v6 = *(void **)(a1 + 41);
  if (!v6) {
    goto LABEL_30;
  }
  objc_msgSend(*(id *)(a1 + 121), "setIntAtWithInt:withInt:", 0, objc_msgSend(v6, "getInitialState"));
  uint64_t v7 = 0;
  int v8 = &OBJC_IVAR___OrgApacheLuceneCodecsLucene50Lucene50DocValuesProducer_BinaryEntry_format_;
  while (1)
  {
    ++*(void *)(a1 + 81);
    *(unsigned char *)(a1 + v8[191]) = 0;
    uint64_t v9 = (uint64_t)[*(id *)(a1 + v1[197]) intAtWithInt:v7];
    if ((int)v7 < (int)[*(id *)(a1 + 89) length])
    {
      while (1)
      {
        uint64_t v10 = *(void *)(a1 + 73);
        if (!v10) {
          break;
        }
        uint64_t v11 = *(unsigned int *)(v10 + 8);
        if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v9);
        }
        *(void *)(v10 + 16 + 8 * (int)v9) = *(void *)(a1 + 81);
        id v12 = objc_msgSend(*(id *)(a1 + v5[190]), "stepWithInt:withInt:", v9, objc_msgSend(*(id *)(a1 + 89), "byteAtWithInt:", v7));
        if (v12 == -1) {
          goto LABEL_20;
        }
        int v13 = (int)v12;
        uint64_t v9 = (uint64_t)v12;
        uint64_t v14 = (v7 + 1);
        [*(id *)(a1 + v1[197]) setIntAtWithInt:v14 withInt:v12];
        if (!*(unsigned char *)(a1 + 57) && !*(unsigned char *)(a1 + v8[191]))
        {
          v15 = v8;
          v16 = v5;
          v17 = v1;
          uint64_t v18 = *(void *)(a1 + 73);
          uint64_t v19 = *(unsigned int *)(v18 + 8);
          if ((v9 & 0x80000000) != 0 || v13 >= (int)v19) {
            IOSArray_throwOutOfBoundsWithMsg(v19, v9);
          }
          uint64_t v20 = *(void *)(v18 + 16 + 8 * v13);
          v1 = v17;
          uint64_t v5 = v16;
          int v8 = v15;
          if (v20 == *(void *)(a1 + 81)) {
            sub_10010AA88(a1, v7);
          }
        }
        uint64_t v7 = (v7 + 1);
        if ((int)v14 >= (int)[*(id *)(a1 + 89) length]) {
          goto LABEL_21;
        }
      }
LABEL_30:
      JreThrowNullPointerException();
    }
LABEL_20:
    uint64_t v14 = v7;
LABEL_21:
    if (sub_10010AD1C(a1, v9, v14)) {
      return 1;
    }
    uint64_t v21 = sub_10010B0C4(a1, v14);
    if ((v21 & 0x80000000) != 0) {
      return 0;
    }
    LODWORD(v7) = v21;
    id v22 = objc_msgSend(*(id *)(a1 + v5[190]), "stepWithInt:withInt:", objc_msgSend(*(id *)(a1 + v1[197]), "intAtWithInt:", v21), objc_msgSend(*(id *)(a1 + 89), "byteAtWithInt:", v21));
    if ((v22 & 0x80000000) == 0
      && ([*(id *)(a1 + v5[190]) isAcceptWithInt:v22] & 1) != 0)
    {
      return 1;
    }
    if (*(unsigned char *)(a1 + 57)) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = 0;
    }
  }
}

- (void)setLinearWithInt:(int)a3
{
}

- (BOOL)nextStringWithInt:(int)a3 withInt:(int)a4
{
  return sub_10010AD1C((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a4);
}

- (int)backtrackWithInt:(int)a3
{
  return sub_10010B0C4((uint64_t)self, a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexAutomatonTermsEnum;
  [(OrgApacheLuceneIndexFilteredTermsEnum *)&v3 dealloc];
}

@end