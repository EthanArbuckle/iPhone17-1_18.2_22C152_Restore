@interface OrgApacheLuceneUtilLSBRadixSorter
- (OrgApacheLuceneUtilLSBRadixSorter)init;
- (void)dealloc;
- (void)sortWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilLSBRadixSorter

- (void)sortWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v51 = *(void *)&a4;
  if (a5 > 29)
  {
    v19 = self;
    uint64_t v53 = a5;
    p_buffer = &self->buffer_;
    v21 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_((unsigned int *)self->buffer_, a5, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
    JreStrongAssign((id *)p_buffer, v21);
    unsigned int v22 = 0;
    int v23 = 0;
    v24 = *p_buffer;
    v25 = (unsigned int *)a3;
    uint64_t v26 = v8;
    v52 = v19;
    do
    {
      unsigned int v55 = v23;
      uint64_t histogram = (uint64_t)v19->histogram_;
      JavaUtilArrays_fillWithIntArray_withInt_(histogram, 0);
      if (!v25) {
LABEL_65:
      }
        JreThrowNullPointerException();
      uint64_t v28 = 0;
      int v29 = v26;
      do
      {
        int v30 = v26 + v28;
        uint64_t v31 = v25[2];
        if (v26 + v28 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, v26 + v28);
        }
        if (!histogram) {
          goto LABEL_65;
        }
        uint64_t v32 = (v25[v30 + 3] >> v22);
        uint64_t v33 = *(unsigned int *)(histogram + 8);
        if ((int)v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, v32);
        }
        ++*(_DWORD *)(histogram + 12 + 4 * v32);
        ++v28;
      }
      while (v53 != v28);
      uint64_t v34 = *(unsigned int *)(histogram + 8);
      if ((int)v34 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v34, 0);
      }
      if (*(_DWORD *)(histogram + 12) == v53)
      {
        v35 = (unsigned int *)v24;
        v19 = v52;
        int v23 = v55;
      }
      else
      {
        uint64_t v36 = 0;
        int v37 = 0;
        do
        {
          uint64_t v38 = *(unsigned int *)(histogram + 8);
          if (v36 >= (int)v38) {
            IOSArray_throwOutOfBoundsWithMsg(v38, v36);
          }
          int v39 = *(_DWORD *)(histogram + 12 + 4 * v36);
          *(_DWORD *)(histogram + 12 + 4 * v36) = v37;
          v37 += v39;
          ++v36;
        }
        while (v36 != 256);
        uint64_t v40 = v53;
        do
        {
          int v41 = v26;
          uint64_t v42 = v25[2];
          if ((v26 & 0x80000000) != 0 || (int)v26 >= (int)v42) {
            IOSArray_throwOutOfBoundsWithMsg(v42, (int)v26);
          }
          if (!v24) {
            goto LABEL_65;
          }
          unsigned int v43 = v25[(int)v26 + 3];
          uint64_t v44 = (v43 >> v22);
          uint64_t v45 = *(unsigned int *)(histogram + 8);
          if ((int)v44 >= (int)v45) {
            IOSArray_throwOutOfBoundsWithMsg(v45, (v43 >> v22));
          }
          int v46 = *(_DWORD *)(histogram + 12 + 4 * v44);
          *(_DWORD *)(histogram + 12 + 4 * v44) = v46 + 1;
          uint64_t size = v24->super.size_;
          int v48 = v46 + v55;
          if ((int)(v46 + v55) < 0 || v48 >= (int)size) {
            IOSArray_throwOutOfBoundsWithMsg(size, v48);
          }
          *(&v24->super.size_ + v48 + 1) = v43;
          LODWORD(v26) = v41 + 1;
          --v40;
        }
        while (v40);
        v35 = v25;
        uint64_t v26 = v55;
        v25 = (unsigned int *)v24;
        v24 = (IOSIntArray *)v35;
        int v23 = v29;
        v19 = v52;
      }
      BOOL v49 = v22 >= 0x11;
      v22 += 8;
    }
    while (!v49);
    if (v35 == a3)
    {
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v25, v26, a3, v51, a5);
    }
  }
  else
  {
    int v9 = a4 + 1;
    if (a4 + 1 < a5 + a4)
    {
      uint64_t v10 = 0;
      int v11 = a4 + 1;
      v12 = (char *)a3 + 4 * v9;
      do
      {
        if (v11 > a4)
        {
          if (!a3) {
            goto LABEL_65;
          }
          uint64_t v13 = v10;
          do
          {
            uint64_t v14 = v9 + v13;
            uint64_t v15 = *((unsigned int *)a3 + 2);
            if (v14 < 1 || v14 > (int)v15) {
              IOSArray_throwOutOfBoundsWithMsg(v15, (a4 + v13));
            }
            if (v14 < 0 || v14 >= (int)v15) {
              IOSArray_throwOutOfBoundsWithMsg(v15, (a4 + v13 + 1));
            }
            if (*(_DWORD *)&v12[4 * v13 + 8] <= *(_DWORD *)&v12[4 * v13 + 12]) {
              break;
            }
            uint64_t v16 = *((unsigned int *)a3 + 2);
            if (v14 < 1 || v14 > (int)v16) {
              IOSArray_throwOutOfBoundsWithMsg(v16, (a4 + v13));
            }
            int v17 = *(_DWORD *)&v12[4 * v13 + 8];
            if (v14 < 0 || v14 >= (int)v16) {
              IOSArray_throwOutOfBoundsWithMsg(v16, (a4 + v13 + 1));
            }
            if (v14 > (int)v16) {
              IOSArray_throwOutOfBoundsWithMsg(v16, (a4 + v13));
            }
            *(_DWORD *)&v12[4 * v13 + 8] = *(_DWORD *)&v12[4 * v13 + 12];
            uint64_t v18 = *((unsigned int *)a3 + 2);
            if (v14 < 0 || v14 >= (int)v18) {
              IOSArray_throwOutOfBoundsWithMsg(v18, (a4 + v13 + 1));
            }
            *(_DWORD *)&v12[4 * v13-- + 12] = v17;
          }
          while (v9 + v13 > a4);
        }
        ++v11;
        ++v10;
      }
      while (a5 + a4 != v11);
    }
  }
}

- (OrgApacheLuceneUtilLSBRadixSorter)init
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilLSBRadixSorter;
  [(OrgApacheLuceneUtilLSBRadixSorter *)&v3 dealloc];
}

@end