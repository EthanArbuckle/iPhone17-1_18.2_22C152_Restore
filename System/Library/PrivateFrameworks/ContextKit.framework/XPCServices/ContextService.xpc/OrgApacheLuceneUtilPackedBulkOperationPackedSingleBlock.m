@interface OrgApacheLuceneUtilPackedBulkOperationPackedSingleBlock
- (OrgApacheLuceneUtilPackedBulkOperationPackedSingleBlock)initWithInt:(int)a3;
- (int)byteBlockCount;
- (int)byteValueCount;
- (int)decodeWithLong:(int64_t)a3 withIntArray:(id)a4 withInt:(int)a5;
- (int)decodeWithLong:(int64_t)a3 withLongArray:(id)a4 withInt:(int)a5;
- (int)longBlockCount;
- (int)longValueCount;
- (int64_t)encodeWithIntArray:(id)a3 withInt:(int)a4;
- (int64_t)encodeWithLongArray:(id)a3 withInt:(int)a4;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)encodeWithIntArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)encodeWithIntArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)encodeWithLongArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)encodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPackedSingleBlock

- (OrgApacheLuceneUtilPackedBulkOperationPackedSingleBlock)initWithInt:(int)a3
{
  self->bitsPerValue_ = a3;
  self->valueCount_ = 64 / a3;
  self->mask_ = ~(-1 << a3);
  return self;
}

- (int)longBlockCount
{
  return 1;
}

- (int)byteBlockCount
{
  return 8;
}

- (int)longValueCount
{
  return self->valueCount_;
}

- (int)byteValueCount
{
  return self->valueCount_;
}

- (int)decodeWithLong:(int64_t)a3 withLongArray:(id)a4 withInt:(int)a5
{
  return sub_100149874((uint64_t)self, a3, (uint64_t)a4, *(uint64_t *)&a5);
}

- (int)decodeWithLong:(int64_t)a3 withIntArray:(id)a4 withInt:(int)a5
{
  return sub_1001499D0(self, a3, (uint64_t)a4, *(uint64_t *)&a5);
}

- (int64_t)encodeWithLongArray:(id)a3 withInt:(int)a4
{
  return sub_100149B30((uint64_t)self, (uint64_t)a3, *(uint64_t *)&a4);
}

- (int64_t)encodeWithIntArray:(id)a3 withInt:(int)a4
{
  return sub_100149C50((uint64_t)self, (uint64_t)a3, *(uint64_t *)&a4);
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    int v8 = a7;
    uint64_t v9 = *(void *)&a6;
    do
    {
      int v12 = a4;
      uint64_t v13 = *((unsigned int *)a3 + 2);
      if (a4 < 0 || a4 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, a4);
      }
      uint64_t v9 = sub_100149874((uint64_t)self, *((void *)a3 + a4 + 2), (uint64_t)a5, v9);
      a4 = v12 + 1;
      --v8;
    }
    while (v8);
  }
}

- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    int v7 = a7;
    uint64_t v8 = *(void *)&a6;
    uint64_t v10 = *(void *)&a4;
    do
    {
      unint64_t v13 = sub_100149EA0((uint64_t)a3, v10);
      uint64_t v10 = (v10 + 8);
      uint64_t v8 = sub_100149874((uint64_t)self, v13, (uint64_t)a5, v8);
      --v7;
    }
    while (v7);
  }
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->bitsPerValue_ > 32)
  {
    CFStringRef v15 = JreStrcat("$I$", (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, *(uint64_t *)&a6, *(uint64_t *)&a7, v7, @"Cannot decode ");
    v16 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  int v8 = a7;
  if (a7 >= 1)
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    uint64_t v10 = *(void *)&a6;
    do
    {
      int v13 = a4;
      uint64_t v14 = *((unsigned int *)a3 + 2);
      if (a4 < 0 || a4 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, a4);
      }
      uint64_t v10 = sub_1001499D0(self, *((void *)a3 + a4 + 2), (uint64_t)a5, v10);
      a4 = v13 + 1;
      --v8;
    }
    while (v8);
  }
}

- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->bitsPerValue_ > 32)
  {
    CFStringRef v15 = JreStrcat("$I$", (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, *(uint64_t *)&a6, *(uint64_t *)&a7, v7, @"Cannot decode ");
    v16 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  int v8 = a7;
  if (a7 >= 1)
  {
    uint64_t v9 = *(void *)&a6;
    uint64_t v11 = *(void *)&a4;
    do
    {
      unint64_t v14 = sub_100149EA0((uint64_t)a3, v11);
      uint64_t v11 = (v11 + 8);
      uint64_t v9 = sub_1001499D0(self, v14, (uint64_t)a5, v9);
      --v8;
    }
    while (v8);
  }
}

- (void)encodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    int v7 = a7;
    uint64_t v8 = *(void *)&a6;
    uint64_t v10 = *(void *)&a4;
    do
    {
      uint64_t v13 = sub_100149B30((uint64_t)self, (uint64_t)a3, v10);
      if (!a5) {
        JreThrowNullPointerException();
      }
      uint64_t v14 = v13;
      uint64_t v15 = *((unsigned int *)a5 + 2);
      if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v8);
      }
      *((void *)a5 + (int)v8 + 2) = v14;
      uint64_t v10 = (self->valueCount_ + v10);
      uint64_t v8 = (v8 + 1);
      --v7;
    }
    while (v7);
  }
}

- (void)encodeWithIntArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    int v7 = a7;
    uint64_t v8 = *(void *)&a6;
    uint64_t v10 = *(void *)&a4;
    do
    {
      uint64_t v13 = sub_100149C50((uint64_t)self, (uint64_t)a3, v10);
      if (!a5) {
        JreThrowNullPointerException();
      }
      uint64_t v14 = v13;
      uint64_t v15 = *((unsigned int *)a5 + 2);
      if ((v8 & 0x80000000) != 0 || (int)v8 >= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v8);
      }
      *((void *)a5 + (int)v8 + 2) = v14;
      uint64_t v10 = (self->valueCount_ + v10);
      uint64_t v8 = (v8 + 1);
      --v7;
    }
    while (v7);
  }
}

- (void)encodeWithLongArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    int v7 = a7;
    uint64_t v8 = *(void *)&a6;
    uint64_t v10 = *(void *)&a4;
    do
    {
      uint64_t v13 = sub_100149B30((uint64_t)self, (uint64_t)a3, v10);
      uint64_t v10 = (self->valueCount_ + v10);
      uint64_t v8 = [(OrgApacheLuceneUtilPackedBulkOperation *)self writeLongWithLong:v13 withByteArray:a5 withInt:v8];
      --v7;
    }
    while (v7);
  }
}

- (void)encodeWithIntArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (a7 >= 1)
  {
    int v7 = a7;
    uint64_t v8 = *(void *)&a6;
    uint64_t v10 = *(void *)&a4;
    do
    {
      uint64_t v13 = sub_100149C50((uint64_t)self, (uint64_t)a3, v10);
      uint64_t v10 = (self->valueCount_ + v10);
      uint64_t v8 = [(OrgApacheLuceneUtilPackedBulkOperation *)self writeLongWithLong:v13 withByteArray:a5 withInt:v8];
      --v7;
    }
    while (v7);
  }
}

@end