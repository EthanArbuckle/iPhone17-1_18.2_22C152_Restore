@interface OrgApacheLuceneUtilPackedBulkOperationPacked4
- (OrgApacheLuceneUtilPackedBulkOperationPacked4)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked4

- (OrgApacheLuceneUtilPackedBulkOperationPacked4)init
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
        for (int i = 60; i != -4; i -= 4)
        {
          uint64_t v14 = *((unsigned int *)a5 + 2);
          if (a6 < 0 || a6 >= (int)v14) {
            IOSArray_throwOutOfBoundsWithMsg(v14, a6);
          }
          *((_DWORD *)a5 + a6++ + 3) = (v12 >> (i & 0x3C)) & 0xF;
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
        *((_DWORD *)a5 + (int)v8 + 3) = v10 >> 4;
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v12 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, (v8 + 1));
        }
        *((_DWORD *)a5 + v12 + 3) = v10 & 0xF;
        ++a4;
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
        for (int i = 60; i != -4; i -= 4)
        {
          uint64_t v14 = *((unsigned int *)a5 + 2);
          if (a6 < 0 || a6 >= (int)v14) {
            IOSArray_throwOutOfBoundsWithMsg(v14, a6);
          }
          *((void *)a5 + a6++ + 2) = (v12 >> (i & 0x3C)) & 0xF;
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
        *((void *)a5 + (int)v8 + 2) = v10 >> 4;
        uint64_t v13 = *((unsigned int *)a5 + 2);
        if (v8 + 1 < 0 || v12 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, (v8 + 1));
        }
        *((void *)a5 + v12 + 2) = v10 & 0xF;
        ++a4;
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