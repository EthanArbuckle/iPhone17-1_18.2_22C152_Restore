@interface OrgApacheLuceneCodecsCompressingLZ4_HCHashTable
- (BOOL)insertAndFindBestMatchWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneCodecsCompressingLZ4_Match:(id)a6;
- (BOOL)insertAndFindWiderMatchWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withOrgApacheLuceneCodecsCompressingLZ4_Match:(id)a8;
- (OrgApacheLuceneCodecsCompressingLZ4_HCHashTable)init;
- (int)hashPointerWithByteArray:(id)a3 withInt:(int)a4;
- (int)nextWithInt:(int)a3;
- (void)addHashWithByteArray:(id)a3 withInt:(int)a4;
- (void)dealloc;
- (void)insertWithInt:(int)a3 withByteArray:(id)a4;
- (void)resetWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsCompressingLZ4_HCHashTable

- (OrgApacheLuceneCodecsCompressingLZ4_HCHashTable)init
{
  return self;
}

- (void)resetWithInt:(int)a3
{
  self->nextToUpdate_ = a3;
  self->base_ = a3;
  JavaUtilArrays_fillWithIntArray_withInt_((uint64_t)self->hashTable_, -1);
  chainTable = self->chainTable_;
  JavaUtilArrays_fillWithShortArray_withShort_((uint64_t)chainTable, 0);
}

- (int)hashPointerWithByteArray:(id)a3 withInt:(int)a4
{
  return sub_10008456C((uint64_t)self, (uint64_t)a3, *(uint64_t *)&a4);
}

- (int)nextWithInt:(int)a3
{
  return sub_1000845F4((uint64_t)self, a3);
}

- (void)addHashWithByteArray:(id)a3 withInt:(int)a4
{
}

- (void)insertWithInt:(int)a3 withByteArray:(id)a4
{
  for (uint64_t i = self->nextToUpdate_; (int)i < a3; self->nextToUpdate_ = i)
  {
    sub_100084674((uint64_t)self, (uint64_t)a4, i);
    uint64_t i = (self->nextToUpdate_ + 1);
  }
}

- (BOOL)insertAndFindBestMatchWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneCodecsCompressingLZ4_Match:(id)a6
{
  if (!a6) {
    goto LABEL_44;
  }
  v6 = a6;
  uint64_t v7 = *(void *)&a4;
  *((_DWORD *)a6 + 2) = a4;
  *((_DWORD *)a6 + 4) = 0;
  [(OrgApacheLuceneCodecsCompressingLZ4_HCHashTable *)self insertWithInt:*(void *)&a4 withByteArray:a3];
  uint64_t v10 = sub_10008456C((uint64_t)self, (uint64_t)a3, v7);
  uint64_t v11 = v10;
  if ((int)v10 < (int)v7 - 4 || (int v12 = v7 - v10, (int)v7 < (int)v10))
  {
    int v37 = 0;
    int v34 = 0;
  }
  else if ((int)v10 >= self->base_)
  {
    int v13 = sub_100083FFC((uint64_t)a3, v10);
    if (v13 == sub_100083FFC((uint64_t)a3, v7))
    {
      int v34 = sub_100084128((uint64_t)a3, (int)v11 + 4, (int)v7 + 4, a5) + 4;
      v6[3] = v11;
      v6[4] = v34;
      int v37 = v12;
    }
    else
    {
      int v37 = 0;
      int v34 = 0;
    }
    uint64_t v11 = sub_1000845F4((uint64_t)self, v11);
  }
  else
  {
    int v37 = 0;
    int v34 = 0;
  }
  int v14 = 256;
  do
  {
    int v15 = JavaLangMath_maxWithInt_withInt_(self->base_, (int)v7 - 0xFFFF);
    if ((int)v11 > (int)v7 || (int)v11 < v15) {
      break;
    }
    if (!a3) {
      goto LABEL_44;
    }
    int v16 = v6[4];
    uint64_t v17 = *((unsigned int *)a3 + 2);
    int v18 = v16 + v11;
    uint64_t v19 = v16 + (int)v11;
    if (v16 + (int)v11 < 0 || v18 >= (int)v17) {
      IOSArray_throwOutOfBoundsWithMsg(v17, v18);
    }
    int v20 = v16 + v7;
    if (v20 < 0 || v20 >= (int)v17) {
      IOSArray_throwOutOfBoundsWithMsg(v17, v20);
    }
    if (*((unsigned __int8 *)a3 + v19 + 12) == *((unsigned __int8 *)a3 + v20 + 12))
    {
      int v21 = sub_100083FFC((uint64_t)a3, v11);
      if (v21 == sub_100083FFC((uint64_t)a3, v7))
      {
        int v22 = sub_100084128((uint64_t)a3, (int)v11 + 4, (int)v7 + 4, a5) + 4;
        if (v22 > v6[4])
        {
          v6[3] = v11;
          v6[4] = v22;
        }
      }
    }
    uint64_t v11 = sub_1000845F4((uint64_t)self, v11);
    --v14;
  }
  while (v14);
  if (v34)
  {
    v36 = v6;
    int v23 = v7 + v34 - 3;
    __int16 v24 = v37;
    if (v23 - v37 > (int)v7)
    {
      int v25 = v34 - v37 - 3;
      while (1)
      {
        chainTable = self->chainTable_;
        if (!chainTable) {
          break;
        }
        uint64_t size = chainTable->super.size_;
        if ((unsigned __int16)v7 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, (unsigned __int16)v7);
        }
        *((_WORD *)&chainTable->super.size_ + (unsigned __int16)v7 + 2) = v37;
        LOWORD(v7) = v7 + 1;
        if (!--v25)
        {
          uint64_t v7 = (v23 - v37);
          goto LABEL_35;
        }
      }
LABEL_44:
      JreThrowNullPointerException();
    }
    do
    {
LABEL_35:
      v28 = self->chainTable_;
      if (!v28) {
        goto LABEL_44;
      }
      uint64_t v29 = v28->super.size_;
      if ((unsigned __int16)v7 >= (int)v29) {
        IOSArray_throwOutOfBoundsWithMsg(v29, (unsigned __int16)v7);
      }
      *((_WORD *)&v28->super.size_ + (unsigned __int16)v7 + 2) = v24;
      hashTable = self->hashTable_;
      if (!hashTable) {
        goto LABEL_44;
      }
      uint64_t v31 = (-1640531535 * sub_100083FFC((uint64_t)a3, v7)) >> 17;
      uint64_t v32 = hashTable->super.size_;
      if ((int)v31 >= (int)v32) {
        IOSArray_throwOutOfBoundsWithMsg(v32, v31);
      }
      *(&hashTable->super.size_ + v31 + 1) = v7;
      uint64_t v7 = (v7 + 1);
      __int16 v24 = v37;
    }
    while ((int)v7 < v23);
    self->nextToUpdate_ = v23;
    v6 = v36;
  }
  return v6[4] != 0;
}

- (BOOL)insertAndFindWiderMatchWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withOrgApacheLuceneCodecsCompressingLZ4_Match:(id)a8
{
  if (!a8) {
LABEL_32:
  }
    JreThrowNullPointerException();
  v8 = a8;
  uint64_t v10 = *(void *)&a4;
  int v12 = self;
  *((_DWORD *)a8 + 4) = a7;
  [(OrgApacheLuceneCodecsCompressingLZ4_HCHashTable *)self insertWithInt:*(void *)&a4 withByteArray:a3];
  int v13 = a5 - v10;
  uint64_t v14 = sub_10008456C((uint64_t)v12, (uint64_t)a3, v10);
  int v15 = 0;
  int v42 = v10 - 0xFFFF;
  int v35 = v10 + 4;
  int v36 = a5 - v10;
  uint64_t v33 = a5;
  uint64_t v34 = (int)v10;
  int v30 = v10 - 1;
  uint64_t v32 = (char *)a3 + (int)v10 - 1;
  int v39 = a5;
  v40 = v8;
  int v37 = v12;
  uint64_t v38 = v10;
  do
  {
    int v16 = JavaLangMath_maxWithInt_withInt_(v12->base_, v42);
    if ((int)v14 > (int)v10 || (int)v14 < v16) {
      break;
    }
    if (!a3) {
      goto LABEL_32;
    }
    int v17 = v8[4];
    uint64_t v18 = *((unsigned int *)a3 + 2);
    int v19 = v13 + v14 + v17;
    if (v19 < 0 || v19 >= (int)v18) {
      IOSArray_throwOutOfBoundsWithMsg(v18, v19);
    }
    int v20 = v17 + a5;
    if (v20 < 0 || v20 >= (int)v18) {
      IOSArray_throwOutOfBoundsWithMsg(v18, v20);
    }
    if (*((unsigned __int8 *)a3 + v19 + 12) == *((unsigned __int8 *)a3 + v20 + 12))
    {
      int v21 = sub_100083FFC((uint64_t)a3, v14);
      if (v21 == sub_100083FFC((uint64_t)a3, v10))
      {
        int v22 = sub_100084128((uint64_t)a3, (int)v14 + 4, v35, a6);
        int v23 = 0;
        if (a5 < (int)v10)
        {
          int base = v12->base_;
          if ((int)v14 > base)
          {
            uint64_t v25 = 0;
            int v23 = 0;
            do
            {
              uint64_t v26 = *((unsigned int *)a3 + 2);
              uint64_t v27 = (int)v14 + v25 - 1;
              if ((int)v14 + v25 < 1 || (int)v14 + v25 > (int)v26) {
                IOSArray_throwOutOfBoundsWithMsg(v26, (v14 - 1 + v25));
              }
              if (v34 + v25 < 1 || v34 + v25 > (int)v26) {
                IOSArray_throwOutOfBoundsWithMsg(v26, (v30 + v25));
              }
              if (*((char *)a3 + (int)v14 + v25 + 11) != v32[v25 + 12]) {
                break;
              }
              ++v23;
              if (v34 + v25 - 1 <= v33) {
                break;
              }
              --v25;
            }
            while (v27 > base);
          }
        }
        int v28 = v22 + 4 + v23;
        a5 = v39;
        v8 = v40;
        int v12 = v37;
        uint64_t v10 = v38;
        int v13 = v36;
        if (v28 > v40[4])
        {
          v40[4] = v28;
          v40[2] = v38 - v23;
          v40[3] = v14 - v23;
        }
      }
    }
    uint64_t v14 = sub_1000845F4((uint64_t)v12, v14);
    ++v15;
  }
  while (v15 != 256);
  return v8[4] > a7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneCodecsCompressingLZ4_HCHashTable;
  [(OrgApacheLuceneCodecsCompressingLZ4_HCHashTable *)&v3 dealloc];
}

@end