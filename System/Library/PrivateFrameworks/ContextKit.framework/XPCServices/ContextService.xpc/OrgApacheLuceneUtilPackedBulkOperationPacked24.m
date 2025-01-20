@interface OrgApacheLuceneUtilPackedBulkOperationPacked24
- (OrgApacheLuceneUtilPackedBulkOperationPacked24)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked24

- (OrgApacheLuceneUtilPackedBulkOperationPacked24)init
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
        *((_DWORD *)a5 + (int)v8 + 3) = v12 >> 40;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v8 + 1));
        }
        uint64_t v16 = (a4 + 1);
        *((_DWORD *)a5 + v14 + 3) = (v12 >> 16) & 0xFFFFFF;
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if ((v16 & 0x80000000) != 0 || (int)v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v16);
        }
        int v18 = v8 + 2;
        uint64_t v19 = *((void *)a3 + (int)v16 + 2);
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v18 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v8 + 2));
        }
        int v21 = v8 + 3;
        *((_DWORD *)a5 + v18 + 3) = HIBYTE(v19) | ((unsigned __int16)v12 << 8);
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v8 + 3));
        }
        int v23 = v8 + 4;
        *((_DWORD *)a5 + v21 + 3) = HIDWORD(v19) & 0xFFFFFF;
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v8 + 4));
        }
        int v25 = v10 + 2;
        *((_DWORD *)a5 + v23 + 3) = v19 >> 8;
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 2));
        }
        int v27 = v8 + 5;
        unint64_t v28 = *((void *)a3 + v25 + 2);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v8 + 5));
        }
        int v30 = v8 + 6;
        *((_DWORD *)a5 + v27 + 3) = HIWORD(v28) | (v19 << 16);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v8 + 6));
        }
        int v32 = v8 + 7;
        *((_DWORD *)a5 + v30 + 3) = (v28 >> 24) & 0xFFFFFF;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v8 + 7));
        }
        *((_DWORD *)a5 + v32 + 3) = v28 & 0xFFFFFF;
        a4 = v10 + 3;
        uint64_t v8 = (v8 + 8);
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
        int v13 = v10 + 2;
        int v14 = *((unsigned __int8 *)a3 + (int)v12 + 12);
        if (v10 + 2 < 0 || v13 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, (v10 + 2));
        }
        if (!a5) {
          break;
        }
        int v15 = *((unsigned __int8 *)a3 + v13 + 12);
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, v8);
        }
        *((_DWORD *)a5 + (int)v8 + 3) = (*((unsigned __int8 *)a3 + v10 + 12) << 16) | (v14 << 8) | v15;
        a4 = v10 + 3;
        uint64_t v8 = (v8 + 1);
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
        *((void *)a5 + (int)v8 + 2) = v12 >> 40;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v8 + 1));
        }
        int v16 = a4 + 1;
        *((void *)a5 + v14 + 2) = (v12 >> 16) & 0xFFFFFF;
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if (a4 + 1 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (a4 + 1));
        }
        int v18 = v8 + 2;
        unint64_t v19 = *((void *)a3 + v16 + 2);
        uint64_t v20 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v18 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v8 + 2));
        }
        int v21 = v8 + 3;
        *((void *)a5 + v18 + 2) = HIBYTE(v19) & 0xFFFFFFFFFF0000FFLL | ((unint64_t)(unsigned __int16)v12 << 8);
        uint64_t v22 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v21 >= (int)v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, (v8 + 3));
        }
        int v23 = v8 + 4;
        *((void *)a5 + v21 + 2) = HIDWORD(v19) & 0xFFFFFF;
        uint64_t v24 = *((unsigned int *)a5 + 2);
        if (v8 + 4 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, (v8 + 4));
        }
        int v25 = v10 + 2;
        *((void *)a5 + v23 + 2) = v19 >> 8;
        uint64_t v26 = *((unsigned int *)a3 + 2);
        if (v10 + 2 < 0 || v25 >= (int)v26) {
          IOSArray_throwOutOfBoundsWithMsg(v26, (v10 + 2));
        }
        int v27 = v8 + 5;
        unint64_t v28 = *((void *)a3 + v25 + 2);
        uint64_t v29 = *((unsigned int *)a5 + 2);
        if (v8 + 5 < 0 || v27 >= (int)v29) {
          IOSArray_throwOutOfBoundsWithMsg(v29, (v8 + 5));
        }
        int v30 = v8 + 6;
        *((void *)a5 + v27 + 2) = HIWORD(v28) & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)v19 << 16);
        uint64_t v31 = *((unsigned int *)a5 + 2);
        if (v8 + 6 < 0 || v30 >= (int)v31) {
          IOSArray_throwOutOfBoundsWithMsg(v31, (v8 + 6));
        }
        int v32 = v8 + 7;
        *((void *)a5 + v30 + 2) = (v28 >> 24) & 0xFFFFFF;
        uint64_t v33 = *((unsigned int *)a5 + 2);
        if (v8 + 7 < 0 || v32 >= (int)v33) {
          IOSArray_throwOutOfBoundsWithMsg(v33, (v8 + 7));
        }
        *((void *)a5 + v32 + 2) = v28 & 0xFFFFFF;
        a4 = v10 + 3;
        uint64_t v8 = (v8 + 8);
        if (!--v7) {
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
        uint64_t v15 = *((unsigned __int8 *)a3 + v13 + 12);
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, v8);
        }
        *((void *)a5 + (int)v8 + 2) = ((unint64_t)*((unsigned __int8 *)a3 + v10 + 12) << 16) | (v14 << 8) | v15;
        a4 = v10 + 3;
        uint64_t v8 = (v8 + 1);
        if (!--v7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

@end