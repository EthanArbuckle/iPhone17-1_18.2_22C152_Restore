@interface OrgApacheLuceneUtilPackedBulkOperationPacked2
- (OrgApacheLuceneUtilPackedBulkOperationPacked2)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked2

- (OrgApacheLuceneUtilPackedBulkOperationPacked2)init
{
  return self;
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (a3)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        if (!a5) {
          break;
        }
        ++a4;
        unint64_t v12 = *((void *)a3 + v10 + 2);
        for (int i = 62; i != -2; i -= 2)
        {
          uint64_t v14 = *((unsigned int *)a5 + 2);
          if (a6 < 0 || a6 >= (int)v14) {
            IOSArray_throwOutOfBoundsWithMsg(v14, a6);
          }
          *((_DWORD *)a5 + a6++ + 3) = (v12 >> (i & 0x3E)) & 3;
        }
        if (++v9 == a7) {
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
        uint64_t v9 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v9) {
          IOSArray_throwOutOfBoundsWithMsg(v9, a4);
        }
        if (!a5) {
          break;
        }
        unsigned int v10 = *((unsigned __int8 *)a3 + a4 + 12);
        uint64_t v11 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v8);
        }
        int v12 = v8 + 1;
        *((_DWORD *)a5 + (int)v8 + 3) = v10 >> 6;
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v12 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, (v8 + 1));
        }
        int v14 = v8 + 2;
        *((_DWORD *)a5 + v12 + 3) = (v10 >> 4) & 3;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v8 + 2));
        }
        int v16 = v8 + 3;
        *((_DWORD *)a5 + v14 + 3) = (v10 >> 2) & 3;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v8 + 3));
        }
        *((_DWORD *)a5 + v16 + 3) = v10 & 3;
        ++a4;
        uint64_t v8 = (v8 + 4);
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
      int v9 = 0;
      while (1)
      {
        uint64_t v10 = a4;
        uint64_t v11 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, a4);
        }
        if (!a5) {
          break;
        }
        ++a4;
        unint64_t v12 = *((void *)a3 + v10 + 2);
        for (int i = 62; i != -2; i -= 2)
        {
          uint64_t v14 = *((unsigned int *)a5 + 2);
          if (a6 < 0 || a6 >= (int)v14) {
            IOSArray_throwOutOfBoundsWithMsg(v14, a6);
          }
          *((void *)a5 + a6++ + 2) = (v12 >> (i & 0x3E)) & 3;
        }
        if (++v9 == a7) {
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
        uint64_t v9 = *((unsigned int *)a3 + 2);
        if (a4 < 0 || a4 >= (int)v9) {
          IOSArray_throwOutOfBoundsWithMsg(v9, a4);
        }
        if (!a5) {
          break;
        }
        unint64_t v10 = *((unsigned __int8 *)a3 + a4 + 12);
        uint64_t v11 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v11) {
          IOSArray_throwOutOfBoundsWithMsg(v11, v8);
        }
        int v12 = v8 + 1;
        *((void *)a5 + (int)v8 + 2) = v10 >> 6;
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v12 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, (v8 + 1));
        }
        int v14 = v8 + 2;
        *((void *)a5 + v12 + 2) = (v10 >> 4) & 3;
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if (v8 + 2 < 0 || v14 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, (v8 + 2));
        }
        int v16 = v8 + 3;
        *((void *)a5 + v14 + 2) = (v10 >> 2) & 3;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v8 + 3 < 0 || v16 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, (v8 + 3));
        }
        *((void *)a5 + v16 + 2) = v10 & 3;
        ++a4;
        uint64_t v8 = (v8 + 4);
        if (!--v7) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

@end