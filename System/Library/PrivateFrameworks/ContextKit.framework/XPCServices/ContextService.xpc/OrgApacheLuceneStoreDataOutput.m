@interface OrgApacheLuceneStoreDataOutput
- (void)copyBytesWithOrgApacheLuceneStoreDataInput:(id)a3 withLong:(int64_t)a4;
- (void)dealloc;
- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4;
- (void)writeIntWithInt:(int)a3;
- (void)writeLongWithLong:(int64_t)a3;
- (void)writeMapOfStringsWithJavaUtilMap:(id)a3;
- (void)writeSetOfStringsWithJavaUtilSet:(id)a3;
- (void)writeShortWithShort:(signed __int16)a3;
- (void)writeSignedVLongWithLong:(int64_t)a3;
- (void)writeStringSetWithJavaUtilSet:(id)a3;
- (void)writeStringStringMapWithJavaUtilMap:(id)a3;
- (void)writeStringWithNSString:(id)a3;
- (void)writeVIntWithInt:(int)a3;
- (void)writeVLongWithLong:(int64_t)a3;
- (void)writeZIntWithInt:(int)a3;
- (void)writeZLongWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneStoreDataOutput

- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4
{
}

- (void)writeIntWithInt:(int)a3
{
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(a3 >> 24)];
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(a3 << 8 >> 24)];
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:((__int16)a3 >> 8)];
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(char)a3];
}

- (void)writeShortWithShort:(signed __int16)a3
{
  char v3 = a3;
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(a3 >> 8)];
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:v3];
}

- (void)writeVIntWithInt:(int)a3
{
  unsigned int v3 = a3;
  if (a3 >= 0x80)
  {
    do
    {
      [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:v3 | 0xFFFFFF80];
      unsigned int v5 = v3 >> 7;
      unsigned int v6 = v3 >> 14;
      v3 >>= 7;
    }
    while (v6);
  }
  else
  {
    LOBYTE(v5) = a3;
  }
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(char)v5];
}

- (void)writeZIntWithInt:(int)a3
{
  unsigned int v4 = OrgApacheLuceneUtilBitUtil_zigZagEncodeWithInt_(a3);
  unsigned int v5 = v4;
  if (v4 >= 0x80)
  {
    do
    {
      [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:v5 | 0xFFFFFF80];
      unsigned int v6 = v5 >> 7;
      unsigned int v7 = v5 >> 14;
      v5 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v6) = v4;
  }
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(char)v6];
}

- (void)writeLongWithLong:(int64_t)a3
{
  [(OrgApacheLuceneStoreDataOutput *)self writeIntWithInt:HIDWORD(a3)];
  [(OrgApacheLuceneStoreDataOutput *)self writeIntWithInt:a3];
}

- (void)writeVLongWithLong:(int64_t)a3
{
  unint64_t v8 = a3;
  if (a3 < 0)
  {
    CFStringRef v12 = JreStrcat("$JC", (uint64_t)a2, a3, v3, v4, v5, v6, v7, @"cannot write negative vLong (got: ");
    v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v12);
    objc_exception_throw(v13);
  }
  if ((unint64_t)a3 >= 0x80)
  {
    do
    {
      [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:v8 | 0xFFFFFF80];
      unint64_t v10 = v8 >> 7;
      unint64_t v11 = v8 >> 14;
      v8 >>= 7;
    }
    while (v11);
  }
  else
  {
    LOBYTE(v10) = a3;
  }
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(char)v10];
}

- (void)writeSignedVLongWithLong:(int64_t)a3
{
  unint64_t v3 = a3;
  if ((unint64_t)a3 >= 0x80)
  {
    do
    {
      [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:v3 | 0xFFFFFF80];
      unint64_t v5 = v3 >> 7;
      unint64_t v6 = v3 >> 14;
      v3 >>= 7;
    }
    while (v6);
  }
  else
  {
    LOBYTE(v5) = a3;
  }
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(char)v5];
}

- (void)writeZLongWithLong:(int64_t)a3
{
  unint64_t v4 = OrgApacheLuceneUtilBitUtil_zigZagEncodeWithLong_(a3);
  unint64_t v5 = v4;
  if (v4 >= 0x80)
  {
    do
    {
      [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:v5 | 0xFFFFFF80];
      unint64_t v6 = v5 >> 7;
      unint64_t v7 = v5 >> 14;
      v5 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v6) = v4;
  }
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(char)v6];
}

- (void)writeStringWithNSString:(id)a3
{
  unint64_t v4 = new_OrgApacheLuceneUtilBytesRef_initWithJavaLangCharSequence_(a3);
  unint64_t v5 = v4;
  unsigned int length = v4->length_;
  if (length >= 0x80)
  {
    do
    {
      [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:length | 0xFFFFFF80];
      unsigned int v7 = length >> 7;
      unsigned int v8 = length >> 14;
      length >>= 7;
    }
    while (v8);
  }
  else
  {
    unsigned int v7 = v4->length_;
  }
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(char)v7];
  bytes = v5->bytes_;
  uint64_t offset = v5->offset_;
  uint64_t v11 = v5->length_;
  [(OrgApacheLuceneStoreDataOutput *)self writeBytesWithByteArray:bytes withInt:offset withInt:v11];
}

- (void)copyBytesWithOrgApacheLuceneStoreDataInput:(id)a3 withLong:(int64_t)a4
{
  if (!self->copyBuffer_) {
    JreStrongAssignAndConsume((id *)&self->copyBuffer_, +[IOSByteArray newArrayWithLength:0x4000]);
  }
  if (a4 >= 1)
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    do
    {
      if ((unint64_t)a4 >= 0x4000) {
        int64_t v7 = 0x4000;
      }
      else {
        int64_t v7 = a4;
      }
      [a3 readBytesWithByteArray:self->copyBuffer_ withInt:0 withInt:v7];
      [(OrgApacheLuceneStoreDataOutput *)self writeBytesWithByteArray:self->copyBuffer_ withInt:0 withInt:v7];
      BOOL v8 = a4 <= v7;
      a4 -= v7;
    }
    while (!v8);
  }
}

- (void)writeStringStringMapWithJavaUtilMap:(id)a3
{
  if (a3)
  {
    -[OrgApacheLuceneStoreDataOutput writeIntWithInt:](self, "writeIntWithInt:", [a3 size]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(a3, "entrySet", 0);
    if (!v5) {
LABEL_15:
    }
      JreThrowNullPointerException();
    unint64_t v6 = v5;
    id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (!v11) {
            goto LABEL_15;
          }
          -[OrgApacheLuceneStoreDataOutput writeStringWithNSString:](self, "writeStringWithNSString:", [*(id *)(*((void *)&v12 + 1) + 8 * i) getKey]);
          -[OrgApacheLuceneStoreDataOutput writeStringWithNSString:](self, "writeStringWithNSString:", [v11 getValue]);
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [(OrgApacheLuceneStoreDataOutput *)self writeIntWithInt:0];
  }
}

- (void)writeMapOfStringsWithJavaUtilMap:(id)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  unsigned int v5 = [a3 size];
  unsigned int v6 = v5;
  if (v5 >= 0x80)
  {
    do
    {
      [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:v6 | 0xFFFFFF80];
      unsigned int v7 = v6 >> 7;
      unsigned int v8 = v6 >> 14;
      v6 >>= 7;
    }
    while (v8);
  }
  else
  {
    LOBYTE(v7) = v5;
  }
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(char)v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = objc_msgSend(a3, "entrySet", 0);
  if (!v9) {
LABEL_15:
  }
    JreThrowNullPointerException();
  unint64_t v10 = v9;
  id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!v15) {
          goto LABEL_15;
        }
        -[OrgApacheLuceneStoreDataOutput writeStringWithNSString:](self, "writeStringWithNSString:", [*(id *)(*((void *)&v16 + 1) + 8 * i) getKey]);
        -[OrgApacheLuceneStoreDataOutput writeStringWithNSString:](self, "writeStringWithNSString:", [v15 getValue]);
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)writeStringSetWithJavaUtilSet:(id)a3
{
  if (a3)
  {
    -[OrgApacheLuceneStoreDataOutput writeIntWithInt:](self, "writeIntWithInt:", [a3 size]);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(a3);
          }
          [(OrgApacheLuceneStoreDataOutput *)self writeStringWithNSString:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [(OrgApacheLuceneStoreDataOutput *)self writeIntWithInt:0];
  }
}

- (void)writeSetOfStringsWithJavaUtilSet:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  unsigned int v5 = [a3 size];
  unsigned int v6 = v5;
  if (v5 >= 0x80)
  {
    do
    {
      [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:v6 | 0xFFFFFF80];
      unsigned int v7 = v6 >> 7;
      unsigned int v8 = v6 >> 14;
      v6 >>= 7;
    }
    while (v8);
  }
  else
  {
    LOBYTE(v7) = v5;
  }
  [(OrgApacheLuceneStoreDataOutput *)self writeByteWithByte:(char)v7];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(a3);
        }
        [(OrgApacheLuceneStoreDataOutput *)self writeStringWithNSString:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      id v10 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreDataOutput;
  [(OrgApacheLuceneStoreDataOutput *)&v3 dealloc];
}

@end