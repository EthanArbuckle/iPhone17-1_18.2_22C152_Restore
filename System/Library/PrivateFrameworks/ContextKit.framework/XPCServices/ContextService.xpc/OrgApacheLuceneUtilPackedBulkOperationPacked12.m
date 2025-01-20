@interface OrgApacheLuceneUtilPackedBulkOperationPacked12
- (OrgApacheLuceneUtilPackedBulkOperationPacked12)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked12

- (OrgApacheLuceneUtilPackedBulkOperationPacked12)init
{
  return self;
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (a3)
    {
      int v7 = a7;
      uint64_t v8 = *(void *)&a6;
      while (1)
      {
        int v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        if (!a5) {
          break;
        }
        unint64_t v12 = *((void *)a3 + a4 + 2);
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v8);
        }
        int v14 = v8 + 1;
        *((_DWORD *)a5 + (int)v8 + 3) = v12 >> 52;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v8 + 1));
        }
        int v16 = v8 + 2;
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 40) & 0xFFF;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v8 + 2));
        }
        int v18 = v8 + 3;
        *((_DWORD *)a5 + v16 + 3) = (v12 >> 28) & 0xFFF;
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v18 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v8 + 3));
        }
        int v20 = v8 + 4;
        *((_DWORD *)a5 + v18 + 3) = WORD1(v12) & 0xFFF;
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v20 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v8 + 4));
        }
        uint64_t v22 = (a4 + 1);
        *((_DWORD *)a5 + v20 + 3) = (unsigned __int16)v12 >> 4;
        uint64_t v23 = *((unsigned int *)a3 + 2);
        if ((v22 & 0x80000000) != 0 || (int)v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, v22);
        }
        int v24 = v8 + 5;
        unint64_t v25 = *((void *)a3 + (int)v22 + 2);
        uint64_t v26 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v24 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v8 + 5));
        }
        int v27 = v8 + 6;
        *((_DWORD *)a5 + v24 + 3) = HIBYTE(v25) | ((v12 & 0xF) << 8);
        uint64_t v28 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, (v8 + 6));
        }
        int v29 = v8 + 7;
        *((_DWORD *)a5 + v27 + 3) = (v25 >> 44) & 0xFFF;
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v29 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v8 + 7));
        }
        int v31 = v8 + 8;
        *((_DWORD *)a5 + v29 + 3) = WORD2(v25) & 0xFFF;
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v8 + 8 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v8 + 8));
        }
        int v33 = v8 + 9;
        *((_DWORD *)a5 + v31 + 3) = v25 >> 20;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v8 + 9 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v8 + 9));
        }
        int v35 = v10 + 2;
        *((_DWORD *)a5 + v33 + 3) = (v25 >> 8) & 0xFFF;
        uint64_t v36 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v10 + 2));
        }
        int v37 = v8 + 10;
        unint64_t v38 = *((void *)a3 + v35 + 2);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v8 + 10 < 0 || v37 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v8 + 10));
        }
        int v40 = v8 + 11;
        *((_DWORD *)a5 + v37 + 3) = (v38 >> 60) & 0xF | (16 * v25);
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v8 + 11 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v8 + 11));
        }
        int v42 = v8 + 12;
        *((_DWORD *)a5 + v40 + 3) = HIWORD(v38) & 0xFFF;
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v8 + 12 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v8 + 12));
        }
        int v44 = v8 + 13;
        *((_DWORD *)a5 + v42 + 3) = (v38 >> 36) & 0xFFF;
        uint64_t v45 = *((unsigned int *)a5 + 2);
        if (v8 + 13 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v8 + 13));
        }
        int v46 = v8 + 14;
        *((_DWORD *)a5 + v44 + 3) = (v38 >> 24) & 0xFFF;
        uint64_t v47 = *((unsigned int *)a5 + 2);
        if (v8 + 14 < 0 || v46 >= (int)v47) {
          IOSArray_throwOutOfBoundsWithMsg(v47, (v8 + 14));
        }
        int v48 = v8 + 15;
        *((_DWORD *)a5 + v46 + 3) = (v38 >> 12) & 0xFFF;
        uint64_t v49 = *((unsigned int *)a5 + 2);
        if (v8 + 15 < 0 || v48 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, (v8 + 15));
        }
        *((_DWORD *)a5 + v48 + 3) = v38 & 0xFFF;
        a4 = v10 + 3;
        uint64_t v8 = (v8 + 16);
        if (!--v7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (a3)
    {
      int v7 = a7;
      uint64_t v8 = *(void *)&a6;
      while (1)
      {
        uint64_t v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        uint64_t v12 = (a4 + 1);
        if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v12);
        }
        if (!a5) {
          break;
        }
        unsigned int v13 = *((unsigned __int8 *)a3 + (int)v12 + 12);
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v8);
        }
        int v15 = v10 + 2;
        *((_DWORD *)a5 + (int)v8 + 3) = (v13 >> 4) | (16 * *((unsigned __int8 *)a3 + v10 + 12));
        uint64_t v16 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v10 + 2));
        }
        int v17 = v8 + 1;
        int v18 = *((unsigned __int8 *)a3 + v15 + 12);
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v17 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v8 + 1));
        }
        *((_DWORD *)a5 + v17 + 3) = v18 & 0xFFFFF0FF | ((v13 & 0xF) << 8);
        a4 = v10 + 3;
        uint64_t v8 = (v8 + 2);
        if (!--v7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (a3)
    {
      uint64_t v7 = *(void *)&a6;
      while (1)
      {
        int v9 = a4;
        uint64_t v10 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, a4);
        }
        if (!a5) {
          break;
        }
        unint64_t v11 = *((void *)a3 + a4 + 2);
        uint64_t v12 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v7);
        }
        int v13 = v7 + 1;
        *((void *)a5 + (int)v7 + 2) = v11 >> 52;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((void *)a5 + v13 + 2) = (v11 >> 40) & 0xFFF;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        int v17 = v7 + 3;
        *((void *)a5 + v15 + 2) = (v11 >> 28) & 0xFFF;
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v7 + 3));
        }
        int v19 = v7 + 4;
        *((void *)a5 + v17 + 2) = (v11 >> 16) & 0xFFF;
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v19 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v7 + 4));
        }
        int v21 = a4 + 1;
        *((void *)a5 + v19 + 2) = (unsigned __int16)v11 >> 4;
        uint64_t v22 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (a4 + 1));
        }
        int v23 = v7 + 5;
        unint64_t v24 = *((void *)a3 + v21 + 2);
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v23 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 5));
        }
        int v26 = v7 + 6;
        *((void *)a5 + v23 + 2) = HIBYTE(v24) & 0xFFFFFFFFFFFFF0FFLL | ((v11 & 0xF) << 8);
        uint64_t v27 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v7 + 6));
        }
        int v28 = v7 + 7;
        *((void *)a5 + v26 + 2) = (v24 >> 44) & 0xFFF;
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v28 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v7 + 7));
        }
        int v30 = v7 + 8;
        *((void *)a5 + v28 + 2) = HIDWORD(v24) & 0xFFF;
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v7 + 8));
        }
        int v32 = v7 + 9;
        *((void *)a5 + v30 + 2) = v24 >> 20;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v7 + 9));
        }
        int v34 = v9 + 2;
        *((void *)a5 + v32 + 2) = (v24 >> 8) & 0xFFF;
        uint64_t v35 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, (v9 + 2));
        }
        int v36 = v7 + 10;
        unint64_t v37 = *((void *)a3 + v34 + 2);
        uint64_t v38 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v36 >= (int)v38) {
          IOSArray_throwOutOfBoundsWithMsg(v38, (v7 + 10));
        }
        int v39 = v7 + 11;
        *((void *)a5 + v36 + 2) = (v37 >> 60) & 0xFFFFFFFFFFFFF00FLL | (16 * v24);
        uint64_t v40 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, (v7 + 11));
        }
        int v41 = v7 + 12;
        *((void *)a5 + v39 + 2) = HIWORD(v37) & 0xFFF;
        uint64_t v42 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v41 >= (int)v42) {
          IOSArray_throwOutOfBoundsWithMsg(v42, (v7 + 12));
        }
        int v43 = v7 + 13;
        *((void *)a5 + v41 + 2) = (v37 >> 36) & 0xFFF;
        uint64_t v44 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, (v7 + 13));
        }
        int v45 = v7 + 14;
        *((void *)a5 + v43 + 2) = (v37 >> 24) & 0xFFF;
        uint64_t v46 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v45 >= (int)v46) {
          IOSArray_throwOutOfBoundsWithMsg(v46, (v7 + 14));
        }
        int v47 = v7 + 15;
        *((void *)a5 + v45 + 2) = (v37 >> 12) & 0xFFF;
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v47 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 15));
        }
        *((void *)a5 + v47 + 2) = v37 & 0xFFF;
        a4 = v9 + 3;
        uint64_t v7 = (v7 + 16);
        if (!--a7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (a3)
    {
      int v7 = a7;
      uint64_t v8 = *(void *)&a6;
      while (1)
      {
        uint64_t v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        uint64_t v12 = (a4 + 1);
        if ((v12 & 0x80000000) != 0 || (int)v12 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v12);
        }
        if (!a5) {
          break;
        }
        unint64_t v13 = *((unsigned __int8 *)a3 + (int)v12 + 12);
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v8);
        }
        int v15 = v10 + 2;
        *((void *)a5 + (int)v8 + 2) = (v13 >> 4) | (16 * *((unsigned __int8 *)a3 + v10 + 12));
        uint64_t v16 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v10 + 2));
        }
        int v17 = v8 + 1;
        uint64_t v18 = *((unsigned __int8 *)a3 + v15 + 12);
        uint64_t v19 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v17 >= (int)v19) {
          IOSArray_throwOutOfBoundsWithMsg(v19, (v8 + 1));
        }
        *((void *)a5 + v17 + 2) = v18 & 0xFFFFFFFFFFFFF0FFLL | ((v13 & 0xF) << 8);
        a4 = v10 + 3;
        uint64_t v8 = (v8 + 2);
        if (!--v7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

@end