@interface OrgApacheLuceneUtilPackedBulkOperationPacked20
- (OrgApacheLuceneUtilPackedBulkOperationPacked20)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked20

- (OrgApacheLuceneUtilPackedBulkOperationPacked20)init
{
  return self;
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
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
        *((_DWORD *)a5 + (int)v7 + 3) = v11 >> 44;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((_DWORD *)a5 + v13 + 3) = (v11 >> 24) & 0xFFFFF;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        uint64_t v17 = (a4 + 1);
        *((_DWORD *)a5 + v15 + 3) = (v11 >> 4) & 0xFFFFF;
        uint64_t v18 = *((unsigned int *)a3 + 2);
        if ((v17 & 0x80000000) != 0 || (int)v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v17);
        }
        int v19 = v7 + 3;
        unint64_t v20 = *((void *)a3 + (int)v17 + 2);
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v19 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 3));
        }
        int v22 = v7 + 4;
        *((_DWORD *)a5 + v19 + 3) = HIWORD(v20) | ((v11 & 0xF) << 16);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 4));
        }
        int v24 = v7 + 5;
        *((_DWORD *)a5 + v22 + 3) = (v20 >> 28) & 0xFFFFF;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 5));
        }
        int v26 = v9 + 2;
        *((_DWORD *)a5 + v24 + 3) = (v20 >> 8) & 0xFFFFF;
        uint64_t v27 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v9 + 2));
        }
        int v28 = v7 + 6;
        unint64_t v29 = *((void *)a3 + v26 + 2);
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v28 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 6));
        }
        int v31 = v7 + 7;
        *((_DWORD *)a5 + v28 + 3) = (v29 >> 52) & 0xFFF | (v20 << 12);
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 7));
        }
        int v33 = v7 + 8;
        *((_DWORD *)a5 + v31 + 3) = HIDWORD(v29) & 0xFFFFF;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 8));
        }
        int v35 = v9 + 3;
        *((_DWORD *)a5 + v33 + 3) = v29 >> 12;
        uint64_t v36 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v9 + 3));
        }
        int v37 = v7 + 9;
        unint64_t v38 = *((void *)a3 + v35 + 2);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v37 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 9));
        }
        int v40 = v7 + 10;
        *((_DWORD *)a5 + v37 + 3) = HIBYTE(v38) | ((v29 & 0xFFF) << 8);
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 10));
        }
        int v42 = v7 + 11;
        *((_DWORD *)a5 + v40 + 3) = (v38 >> 36) & 0xFFFFF;
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 11));
        }
        int v44 = v9 + 4;
        *((_DWORD *)a5 + v42 + 3) = (v38 >> 16) & 0xFFFFF;
        uint64_t v45 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v9 + 4));
        }
        int v46 = v7 + 12;
        unint64_t v47 = *((void *)a3 + v44 + 2);
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v46 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 12));
        }
        int v49 = v7 + 13;
        *((_DWORD *)a5 + v46 + 3) = (v47 >> 60) & 0xF | (16 * (unsigned __int16)v38);
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 13));
        }
        int v51 = v7 + 14;
        *((_DWORD *)a5 + v49 + 3) = (v47 >> 40) & 0xFFFFF;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 14));
        }
        int v53 = v7 + 15;
        *((_DWORD *)a5 + v51 + 3) = (v47 >> 20) & 0xFFFFF;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 15));
        }
        *((_DWORD *)a5 + v53 + 3) = v47 & 0xFFFFF;
        a4 = v9 + 5;
        uint64_t v7 = (v7 + 16);
        if (!--a7) {
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
        int v13 = v10 + 2;
        int v14 = *((unsigned __int8 *)a3 + (int)v12 + 12);
        if (v10 + 2 < 0 || v13 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, (v10 + 2));
        }
        if (!a5) {
          break;
        }
        unsigned int v15 = *((unsigned __int8 *)a3 + v13 + 12);
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, v8);
        }
        int v17 = v10 + 3;
        *((_DWORD *)a5 + (int)v8 + 3) = (*((unsigned __int8 *)a3 + v10 + 12) << 12) | (16 * v14) | (v15 >> 4);
        uint64_t v18 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v10 + 3));
        }
        int v19 = v10 + 4;
        int v20 = *((unsigned __int8 *)a3 + v17 + 12);
        if (v10 + 4 < 0 || v19 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v10 + 4));
        }
        int v21 = v8 + 1;
        int v22 = *((unsigned __int8 *)a3 + v19 + 12);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v21 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v8 + 1));
        }
        *((_DWORD *)a5 + v21 + 3) = ((v15 & 0xF) << 16) | (v20 << 8) | v22;
        a4 = v10 + 5;
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
        *((void *)a5 + (int)v7 + 2) = v11 >> 44;
        uint64_t v14 = *((unsigned int *)a5 + 2);
        if (v7 + 1 < 0 || v13 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, (v7 + 1));
        }
        int v15 = v7 + 2;
        *((void *)a5 + v13 + 2) = (v11 >> 24) & 0xFFFFF;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v7 + 2 < 0 || v15 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, (v7 + 2));
        }
        int v17 = a4 + 1;
        *((void *)a5 + v15 + 2) = (v11 >> 4) & 0xFFFFF;
        uint64_t v18 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (a4 + 1));
        }
        int v19 = v7 + 3;
        unint64_t v20 = *((void *)a3 + v17 + 2);
        uint64_t v21 = *((unsigned int *)a5 + 2);
        if (v7 + 3 < 0 || v19 >= (int)v21) {
          IOSArray_throwOutOfBoundsWithMsg(v21, (v7 + 3));
        }
        int v22 = v7 + 4;
        *((void *)a5 + v19 + 2) = HIWORD(v20) & 0xFFFFFFFFFFF0FFFFLL | ((v11 & 0xF) << 16);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v7 + 4 < 0 || v22 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v7 + 4));
        }
        int v24 = v7 + 5;
        *((void *)a5 + v22 + 2) = (v20 >> 28) & 0xFFFFF;
        uint64_t v25 = *((unsigned int *)a5 + 2);
        if (v7 + 5 < 0 || v24 >= (int)v25) {
          IOSArray_throwOutOfBoundsWithMsg(v25, (v7 + 5));
        }
        int v26 = v9 + 2;
        *((void *)a5 + v24 + 2) = (v20 >> 8) & 0xFFFFF;
        uint64_t v27 = *((unsigned int *)a3 + 2);
        if (v9 + 2 < 0 || v26 >= (int)v27) {
          IOSArray_throwOutOfBoundsWithMsg(v27, (v9 + 2));
        }
        int v28 = v7 + 6;
        unint64_t v29 = *((void *)a3 + v26 + 2);
        uint64_t v30 = *((unsigned int *)a5 + 2);
        if (v7 + 6 < 0 || v28 >= (int)v30) {
          IOSArray_throwOutOfBoundsWithMsg(v30, (v7 + 6));
        }
        int v31 = v7 + 7;
        *((void *)a5 + v28 + 2) = (v29 >> 52) & 0xFFFFFFFFFFF00FFFLL | ((unint64_t)v20 << 12);
        uint64_t v32 = *((unsigned int *)a5 + 2);
        if (v7 + 7 < 0 || v31 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, (v7 + 7));
        }
        int v33 = v7 + 8;
        *((void *)a5 + v31 + 2) = HIDWORD(v29) & 0xFFFFF;
        uint64_t v34 = *((unsigned int *)a5 + 2);
        if (v7 + 8 < 0 || v33 >= (int)v34) {
          IOSArray_throwOutOfBoundsWithMsg(v34, (v7 + 8));
        }
        int v35 = v9 + 3;
        *((void *)a5 + v33 + 2) = v29 >> 12;
        uint64_t v36 = *((unsigned int *)a3 + 2);
        if (v9 + 3 < 0 || v35 >= (int)v36) {
          IOSArray_throwOutOfBoundsWithMsg(v36, (v9 + 3));
        }
        int v37 = v7 + 9;
        unint64_t v38 = *((void *)a3 + v35 + 2);
        uint64_t v39 = *((unsigned int *)a5 + 2);
        if (v7 + 9 < 0 || v37 >= (int)v39) {
          IOSArray_throwOutOfBoundsWithMsg(v39, (v7 + 9));
        }
        int v40 = v7 + 10;
        *((void *)a5 + v37 + 2) = HIBYTE(v38) & 0xFFFFFFFFFFF000FFLL | ((v29 & 0xFFF) << 8);
        uint64_t v41 = *((unsigned int *)a5 + 2);
        if (v7 + 10 < 0 || v40 >= (int)v41) {
          IOSArray_throwOutOfBoundsWithMsg(v41, (v7 + 10));
        }
        int v42 = v7 + 11;
        *((void *)a5 + v40 + 2) = (v38 >> 36) & 0xFFFFF;
        uint64_t v43 = *((unsigned int *)a5 + 2);
        if (v7 + 11 < 0 || v42 >= (int)v43) {
          IOSArray_throwOutOfBoundsWithMsg(v43, (v7 + 11));
        }
        int v44 = v9 + 4;
        *((void *)a5 + v42 + 2) = (v38 >> 16) & 0xFFFFF;
        uint64_t v45 = *((unsigned int *)a3 + 2);
        if (v9 + 4 < 0 || v44 >= (int)v45) {
          IOSArray_throwOutOfBoundsWithMsg(v45, (v9 + 4));
        }
        int v46 = v7 + 12;
        unint64_t v47 = *((void *)a3 + v44 + 2);
        uint64_t v48 = *((unsigned int *)a5 + 2);
        if (v7 + 12 < 0 || v46 >= (int)v48) {
          IOSArray_throwOutOfBoundsWithMsg(v48, (v7 + 12));
        }
        int v49 = v7 + 13;
        *((void *)a5 + v46 + 2) = (v47 >> 60) & 0xFFFFFFFFFFF0000FLL | (16 * (unsigned __int16)v38);
        uint64_t v50 = *((unsigned int *)a5 + 2);
        if (v7 + 13 < 0 || v49 >= (int)v50) {
          IOSArray_throwOutOfBoundsWithMsg(v50, (v7 + 13));
        }
        int v51 = v7 + 14;
        *((void *)a5 + v49 + 2) = (v47 >> 40) & 0xFFFFF;
        uint64_t v52 = *((unsigned int *)a5 + 2);
        if (v7 + 14 < 0 || v51 >= (int)v52) {
          IOSArray_throwOutOfBoundsWithMsg(v52, (v7 + 14));
        }
        int v53 = v7 + 15;
        *((void *)a5 + v51 + 2) = (v47 >> 20) & 0xFFFFF;
        uint64_t v54 = *((unsigned int *)a5 + 2);
        if (v7 + 15 < 0 || v53 >= (int)v54) {
          IOSArray_throwOutOfBoundsWithMsg(v54, (v7 + 15));
        }
        *((void *)a5 + v53 + 2) = v47 & 0xFFFFF;
        a4 = v9 + 5;
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
        int v13 = v10 + 2;
        uint64_t v14 = *((unsigned __int8 *)a3 + (int)v12 + 12);
        if (v10 + 2 < 0 || v13 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, (v10 + 2));
        }
        if (!a5) {
          break;
        }
        unint64_t v15 = *((unsigned __int8 *)a3 + v13 + 12);
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, v8);
        }
        int v17 = v10 + 3;
        *((void *)a5 + (int)v8 + 2) = ((unint64_t)*((unsigned __int8 *)a3 + v10 + 12) << 12) | (16 * v14) | (v15 >> 4);
        uint64_t v18 = *((unsigned int *)a3 + 2);
        if (v10 + 3 < 0 || v17 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v10 + 3));
        }
        int v19 = v10 + 4;
        uint64_t v20 = *((unsigned __int8 *)a3 + v17 + 12);
        if (v10 + 4 < 0 || v19 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, (v10 + 4));
        }
        int v21 = v8 + 1;
        uint64_t v22 = *((unsigned __int8 *)a3 + v19 + 12);
        uint64_t v23 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v21 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v8 + 1));
        }
        *((void *)a5 + v21 + 2) = ((v15 & 0xF) << 16) | (v20 << 8) | v22;
        a4 = v10 + 5;
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