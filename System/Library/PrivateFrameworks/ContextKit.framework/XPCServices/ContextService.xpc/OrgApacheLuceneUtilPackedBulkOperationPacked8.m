@interface OrgApacheLuceneUtilPackedBulkOperationPacked8
- (OrgApacheLuceneUtilPackedBulkOperationPacked8)init;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked8

- (OrgApacheLuceneUtilPackedBulkOperationPacked8)init
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
        for (int i = 56; i != -8; i -= 8)
        {
          uint64_t v14 = *((unsigned int *)a5 + 2);
          if (a6 < 0 || a6 >= (int)v14) {
            IOSArray_throwOutOfBoundsWithMsg(v14, a6);
          }
          *((_DWORD *)a5 + a6++ + 3) = (v12 >> (i & 0x38));
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
        uint64_t v10 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, v8);
        }
        *((_DWORD *)a5 + (int)v8 + 3) = *((unsigned __int8 *)a3 + a4++ + 12);
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
        for (int i = 56; i != -8; i -= 8)
        {
          uint64_t v14 = *((unsigned int *)a5 + 2);
          if (a6 < 0 || a6 >= (int)v14) {
            IOSArray_throwOutOfBoundsWithMsg(v14, a6);
          }
          *((void *)a5 + a6++ + 2) = (v12 >> (i & 0x38));
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
        uint64_t v10 = *((unsigned int *)a5 + 2);
        if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v10) {
          IOSArray_throwOutOfBoundsWithMsg(v10, v8);
        }
        *((void *)a5 + (int)v8 + 2) = *((unsigned __int8 *)a3 + a4++ + 12);
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