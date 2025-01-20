@interface OrgApacheLuceneUtilPackedBulkOperationPacked
- (OrgApacheLuceneUtilPackedBulkOperationPacked)initWithInt:(int)a3;
- (int)byteBlockCount;
- (int)byteValueCount;
- (int)longBlockCount;
- (int)longValueCount;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)encodeWithIntArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)encodeWithIntArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)encodeWithLongArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (void)encodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
@end

@implementation OrgApacheLuceneUtilPackedBulkOperationPacked

- (OrgApacheLuceneUtilPackedBulkOperationPacked)initWithInt:(int)a3
{
  return self;
}

- (int)longBlockCount
{
  return self->longBlockCount_;
}

- (int)longValueCount
{
  return self->longValueCount_;
}

- (int)byteBlockCount
{
  return self->byteBlockCount_;
}

- (int)byteValueCount
{
  return self->byteValueCount_;
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->longValueCount_ * a7 >= 1)
  {
    uint64_t v7 = *(void *)&a4;
    int v9 = 0;
    int v10 = 64;
    do
    {
      int v11 = a6 + v9;
      int bitsPerValue = self->bitsPerValue_;
      v10 -= bitsPerValue;
      if (v10 < 0)
      {
        if (!a3) {
          goto LABEL_26;
        }
        uint64_t v17 = *((unsigned int *)a3 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v7);
        }
        uint64_t v18 = (v7 + 1);
        uint64_t v19 = *((void *)a3 + (int)v7 + 2);
        if ((v18 & 0x80000000) != 0 || (int)v18 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v18);
        }
        if (!a5) {
LABEL_26:
        }
          JreThrowNullPointerException();
        uint64_t v14 = (*((void *)a3 + (int)v18 + 2) >> v10) | ((v19 & ~(-1 << (bitsPerValue
                                                                         + v10))) << -(char)v10);
        v10 += 64;
        uint64_t v15 = v11;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v11 < 0) {
          goto LABEL_24;
        }
        uint64_t v7 = v18;
      }
      else
      {
        if (!a3) {
          goto LABEL_26;
        }
        uint64_t v13 = *((unsigned int *)a3 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, v7);
        }
        if (!a5) {
          goto LABEL_26;
        }
        uint64_t v14 = self->mask_ & (*((void *)a3 + (int)v7 + 2) >> v10);
        uint64_t v15 = v11;
        uint64_t v16 = *((unsigned int *)a5 + 2);
        if (v11 < 0) {
          goto LABEL_24;
        }
      }
      if (v11 >= (int)v16) {
LABEL_24:
      }
        IOSArray_throwOutOfBoundsWithMsg(v16, (a6 + v9));
      *((void *)a5 + v15 + 2) = v14;
      ++v9;
    }
    while (v9 < self->longValueCount_ * a7);
  }
}

- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->byteBlockCount_ * a7 >= 1)
  {
    if (!a3) {
LABEL_25:
    }
      JreThrowNullPointerException();
    uint64_t v7 = *(void *)&a6;
    int v10 = 0;
    unint64_t v11 = 0;
    int bitsPerValue = self->bitsPerValue_;
    do
    {
      uint64_t v13 = *((unsigned int *)a3 + 2);
      if (a4 < 0 || a4 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, a4);
      }
      unint64_t v14 = *((unsigned __int8 *)a3 + a4 + 12);
      if (bitsPerValue < 9)
      {
        if (!a5) {
          goto LABEL_25;
        }
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, v7);
        }
        int v16 = 8 - bitsPerValue;
        *((void *)a5 + (int)v7 + 2) = (v14 >> (8 - bitsPerValue)) | v11;
        uint64_t v17 = (v7 + 1);
        int v18 = self->bitsPerValue_;
        if (v16 >= v18)
        {
          int v20 = v16;
          do
          {
            uint64_t v21 = *((unsigned int *)a5 + 2);
            if ((v17 & 0x80000000) != 0 || (int)v17 >= (int)v21) {
              IOSArray_throwOutOfBoundsWithMsg(v21, (int)v17);
            }
            v20 -= v18;
            *((void *)a5 + (int)v17 + 2) = self->mask_ & (v14 >> v20);
            uint64_t v17 = (v17 + 1);
          }
          while (v20 >= v18);
          char v19 = v20 & 0x3F;
          int v16 = v20;
        }
        else
        {
          char v19 = v16 & 0x3F;
        }
        int bitsPerValue = v18 - v16;
        unint64_t v11 = (unint64_t)(((1 << v19) - 1) & v14) << bitsPerValue;
        uint64_t v7 = v17;
      }
      else
      {
        bitsPerValue -= 8;
        v11 |= v14 << bitsPerValue;
      }
      ++a4;
      ++v10;
    }
    while (v10 < self->byteBlockCount_ * a7);
  }
}

- (void)decodeWithLongArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->bitsPerValue_ > 32)
  {
    CFStringRef v21 = JreStrcat("$I$", (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, *(uint64_t *)&a6, *(uint64_t *)&a7, v7, @"Cannot decode ");
    v22 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v21);
    objc_exception_throw(v22);
  }
  if (self->longValueCount_ * a7 >= 1)
  {
    uint64_t v9 = *(void *)&a4;
    int v10 = 0;
    int v11 = 64;
    do
    {
      int v12 = a6 + v10;
      int bitsPerValue = self->bitsPerValue_;
      v11 -= bitsPerValue;
      if (v11 < 0)
      {
        if (!a3) {
          goto LABEL_27;
        }
        uint64_t v18 = *((unsigned int *)a3 + 2);
        if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v9);
        }
        uint64_t v19 = (v9 + 1);
        uint64_t v20 = *((void *)a3 + (int)v9 + 2);
        if ((v19 & 0x80000000) != 0 || (int)v19 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v19);
        }
        if (!a5) {
LABEL_27:
        }
          JreThrowNullPointerException();
        int v15 = (*((void *)a3 + (int)v19 + 2) >> v11) | ((v20 & ~(-1 << (bitsPerValue
                                                                         + v11))) << -(char)v11);
        v11 += 64;
        uint64_t v16 = v12;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v12 < 0) {
          goto LABEL_25;
        }
        uint64_t v9 = v19;
      }
      else
      {
        if (!a3) {
          goto LABEL_27;
        }
        uint64_t v14 = *((unsigned int *)a3 + 2);
        if ((v9 & 0x80000000) != 0 || (int)v9 >= (int)v14) {
          IOSArray_throwOutOfBoundsWithMsg(v14, v9);
        }
        if (!a5) {
          goto LABEL_27;
        }
        int v15 = LODWORD(self->mask_) & (*((void *)a3 + (int)v9 + 2) >> v11);
        uint64_t v16 = v12;
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if (v12 < 0) {
          goto LABEL_25;
        }
      }
      if (v12 >= (int)v17) {
LABEL_25:
      }
        IOSArray_throwOutOfBoundsWithMsg(v17, (a6 + v10));
      *((_DWORD *)a5 + v16 + 3) = v15;
      ++v10;
    }
    while (v10 < self->longValueCount_ * a7);
  }
}

- (void)decodeWithByteArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->byteBlockCount_ * a7 >= 1)
  {
    if (!a3) {
LABEL_23:
    }
      JreThrowNullPointerException();
    uint64_t v7 = *(void *)&a6;
    int v10 = 0;
    int v11 = 0;
    int bitsPerValue = self->bitsPerValue_;
    do
    {
      uint64_t v13 = *((unsigned int *)a3 + 2);
      if (a4 < 0 || a4 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, a4);
      }
      unsigned int v14 = *((unsigned __int8 *)a3 + a4 + 12);
      if (bitsPerValue < 9)
      {
        if (!a5) {
          goto LABEL_23;
        }
        uint64_t v15 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v15) {
          IOSArray_throwOutOfBoundsWithMsg(v15, v7);
        }
        int v16 = 8 - bitsPerValue;
        *((_DWORD *)a5 + (int)v7 + 3) = (v14 >> v16) | v11;
        uint64_t v17 = (v7 + 1);
        for (int i = self->bitsPerValue_; v16 >= i; int i = self->bitsPerValue_)
        {
          uint64_t v20 = *((unsigned int *)a5 + 2);
          if ((v17 & 0x80000000) != 0 || (int)v17 >= (int)v20) {
            IOSArray_throwOutOfBoundsWithMsg(v20, (int)v17);
          }
          v16 -= i;
          *((_DWORD *)a5 + (int)v17 + 3) = self->intMask_ & (v14 >> v16);
          uint64_t v17 = (v17 + 1);
        }
        char v19 = v16 & 0x1F;
        int bitsPerValue = i - v16;
        int v11 = (((1 << v19) - 1) & v14) << bitsPerValue;
        uint64_t v7 = v17;
      }
      else
      {
        bitsPerValue -= 8;
        v11 |= v14 << bitsPerValue;
      }
      ++a4;
      ++v10;
    }
    while (v10 < self->byteBlockCount_ * a7);
  }
}

- (void)encodeWithLongArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->longValueCount_ * a7 >= 1)
  {
    uint64_t v7 = *(void *)&a6;
    int v9 = 0;
    uint64_t v10 = 0;
    int v11 = 64;
    do
    {
      int v12 = a4 + v9;
      v11 -= self->bitsPerValue_;
      if (v11 < 1)
      {
        if (v11)
        {
          if (!a3) {
            goto LABEL_34;
          }
          uint64_t v14 = *((unsigned int *)a3 + 2);
          if (v12 < 0 || v12 >= (int)v14) {
            IOSArray_throwOutOfBoundsWithMsg(v14, (a4 + v9));
          }
          if (!a5) {
            goto LABEL_34;
          }
          uint64_t v15 = *((unsigned int *)a5 + 2);
          if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v15) {
            IOSArray_throwOutOfBoundsWithMsg(v15, v7);
          }
          *((void *)a5 + (int)v7 + 2) = (*((void *)a3 + v12 + 2) >> -(char)v11) | v10;
          uint64_t v16 = *((unsigned int *)a3 + 2);
          if (v12 < 0 || v12 >= (int)v16) {
            IOSArray_throwOutOfBoundsWithMsg(v16, (a4 + v9));
          }
          uint64_t v7 = (v7 + 1);
          uint64_t v10 = (*((void *)a3 + v12 + 2) & ~(-1 << (-(char)v11 & 0x3F))) << v11;
          v11 += 64;
        }
        else
        {
          if (!a3) {
            goto LABEL_34;
          }
          uint64_t v17 = *((unsigned int *)a3 + 2);
          if (v12 < 0 || v12 >= (int)v17) {
            IOSArray_throwOutOfBoundsWithMsg(v17, (a4 + v9));
          }
          if (!a5) {
LABEL_34:
          }
            JreThrowNullPointerException();
          uint64_t v18 = *((unsigned int *)a5 + 2);
          if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v18) {
            IOSArray_throwOutOfBoundsWithMsg(v18, v7);
          }
          *((void *)a5 + (int)v7 + 2) = *((void *)a3 + v12 + 2) | v10;
          int v11 = 64;
          uint64_t v7 = (v7 + 1);
          uint64_t v10 = 0;
        }
      }
      else
      {
        if (!a3) {
          goto LABEL_34;
        }
        uint64_t v13 = *((unsigned int *)a3 + 2);
        if (v12 < 0 || v12 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, (a4 + v9));
        }
        v10 |= *((void *)a3 + v12 + 2) << v11;
      }
      ++v9;
    }
    while (v9 < self->longValueCount_ * a7);
  }
}

- (void)encodeWithIntArray:(id)a3 withInt:(int)a4 withLongArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->longValueCount_ * a7 >= 1)
  {
    uint64_t v7 = *(void *)&a6;
    int v9 = 0;
    unint64_t v10 = 0;
    int v11 = 64;
    do
    {
      int v12 = a4 + v9;
      v11 -= self->bitsPerValue_;
      if (v11 < 1)
      {
        if (v11)
        {
          if (!a3) {
            goto LABEL_34;
          }
          uint64_t v14 = *((unsigned int *)a3 + 2);
          if (v12 < 0 || v12 >= (int)v14) {
            IOSArray_throwOutOfBoundsWithMsg(v14, (a4 + v9));
          }
          if (!a5) {
            goto LABEL_34;
          }
          uint64_t v15 = *((unsigned int *)a5 + 2);
          if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v15) {
            IOSArray_throwOutOfBoundsWithMsg(v15, v7);
          }
          *((void *)a5 + (int)v7 + 2) = ((unint64_t)*((unsigned int *)a3 + v12 + 3) >> -(char)v11) | v10;
          uint64_t v16 = *((unsigned int *)a3 + 2);
          if (v12 < 0 || v12 >= (int)v16) {
            IOSArray_throwOutOfBoundsWithMsg(v16, (a4 + v9));
          }
          uint64_t v7 = (v7 + 1);
          unint64_t v10 = (*((int *)a3 + v12 + 3) & (unint64_t)~(-1 << (-(char)v11 & 0x3F))) << v11;
          v11 += 64;
        }
        else
        {
          if (!a3) {
            goto LABEL_34;
          }
          uint64_t v17 = *((unsigned int *)a3 + 2);
          if (v12 < 0 || v12 >= (int)v17) {
            IOSArray_throwOutOfBoundsWithMsg(v17, (a4 + v9));
          }
          if (!a5) {
LABEL_34:
          }
            JreThrowNullPointerException();
          uint64_t v18 = *((unsigned int *)a5 + 2);
          if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v18) {
            IOSArray_throwOutOfBoundsWithMsg(v18, v7);
          }
          *((void *)a5 + (int)v7 + 2) = v10 | *((unsigned int *)a3 + v12 + 3);
          int v11 = 64;
          uint64_t v7 = (v7 + 1);
          unint64_t v10 = 0;
        }
      }
      else
      {
        if (!a3) {
          goto LABEL_34;
        }
        uint64_t v13 = *((unsigned int *)a3 + 2);
        if (v12 < 0 || v12 >= (int)v13) {
          IOSArray_throwOutOfBoundsWithMsg(v13, (a4 + v9));
        }
        v10 |= (unint64_t)*((unsigned int *)a3 + v12 + 3) << v11;
      }
      ++v9;
    }
    while (v9 < self->longValueCount_ * a7);
  }
}

- (void)encodeWithLongArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->byteValueCount_ * a7 >= 1)
  {
    if (!a3) {
LABEL_24:
    }
      JreThrowNullPointerException();
    uint64_t v7 = *(void *)&a6;
    int v10 = 0;
    uint64_t v11 = 0;
    int v12 = 8;
    do
    {
      uint64_t v13 = *((unsigned int *)a3 + 2);
      if (a4 < 0 || a4 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, a4);
      }
      unint64_t v14 = *((void *)a3 + a4 + 2);
      int bitsPerValue = self->bitsPerValue_;
      int v16 = bitsPerValue - v12;
      if (bitsPerValue >= v12)
      {
        if (!a5) {
          goto LABEL_24;
        }
        uint64_t v18 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v7);
        }
        *((unsigned char *)a5 + (int)v7 + 12) = (v14 >> v16) | v11;
        uint64_t v19 = (v7 + 1);
        if (v16 < 8)
        {
          char v21 = v16 & 0x3F;
        }
        else
        {
          do
          {
            uint64_t v20 = *((unsigned int *)a5 + 2);
            if ((v19 & 0x80000000) != 0 || (int)v19 >= (int)v20) {
              IOSArray_throwOutOfBoundsWithMsg(v20, (int)v19);
            }
            v16 -= 8;
            *((unsigned char *)a5 + (int)v19 + 12) = v14 >> v16;
            uint64_t v19 = (v19 + 1);
          }
          while ((v16 + 8) > 0xF);
          char v21 = v16 & 0x3F;
        }
        int v12 = 8 - v16;
        uint64_t v17 = (v14 & ~(-1 << v21)) << (8 - v16);
        uint64_t v7 = v19;
      }
      else
      {
        v12 -= bitsPerValue;
        uint64_t v17 = (v14 << v12) | v11;
      }
      ++a4;
      uint64_t v11 = v17;
      ++v10;
    }
    while (v10 < self->byteValueCount_ * a7);
  }
}

- (void)encodeWithIntArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  if (self->byteValueCount_ * a7 >= 1)
  {
    if (!a3) {
LABEL_23:
    }
      JreThrowNullPointerException();
    uint64_t v7 = *(void *)&a6;
    int v10 = 0;
    int v11 = 0;
    int v12 = 8;
    do
    {
      uint64_t v13 = *((unsigned int *)a3 + 2);
      if (a4 < 0 || a4 >= (int)v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, a4);
      }
      unsigned int v14 = *((_DWORD *)a3 + a4 + 3);
      int bitsPerValue = self->bitsPerValue_;
      int v16 = bitsPerValue - v12;
      if (bitsPerValue >= v12)
      {
        if (!a5) {
          goto LABEL_23;
        }
        uint64_t v17 = *((unsigned int *)a5 + 2);
        if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v17) {
          IOSArray_throwOutOfBoundsWithMsg(v17, v7);
        }
        *((unsigned char *)a5 + (int)v7 + 12) = (v14 >> v16) | v11;
        uint64_t v18 = (v7 + 1);
        if (v16 >= 8)
        {
          do
          {
            uint64_t v19 = *((unsigned int *)a5 + 2);
            if ((v18 & 0x80000000) != 0 || (int)v18 >= (int)v19) {
              IOSArray_throwOutOfBoundsWithMsg(v19, (int)v18);
            }
            v16 -= 8;
            *((unsigned char *)a5 + (int)v18 + 12) = v14 >> v16;
            uint64_t v18 = (v18 + 1);
          }
          while ((v16 + 8) > 0xF);
        }
        int v12 = 8 - v16;
        int v11 = (v14 & ~(-1 << (v16 & 0x1F))) << (8 - v16);
        uint64_t v7 = v18;
      }
      else
      {
        v12 -= bitsPerValue;
        v11 |= v14 << v12;
      }
      ++a4;
      ++v10;
    }
    while (v10 < self->byteValueCount_ * a7);
  }
}

@end