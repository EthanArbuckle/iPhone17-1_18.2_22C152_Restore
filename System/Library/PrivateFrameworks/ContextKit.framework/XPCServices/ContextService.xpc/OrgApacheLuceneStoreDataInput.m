@interface OrgApacheLuceneStoreDataInput
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)readMapOfStrings;
- (id)readSetOfStrings;
- (id)readString;
- (id)readStringSet;
- (id)readStringStringMap;
- (int)readInt;
- (int)readVInt;
- (int)readZInt;
- (int64_t)readLong;
- (int64_t)readVLong;
- (int64_t)readVLongWithBoolean:(BOOL)a3;
- (int64_t)readZLong;
- (signed)readShort;
- (void)dealloc;
- (void)skipBytesWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneStoreDataInput

- (signed)readShort
{
  unsigned __int16 v3 = (unsigned __int16)[(OrgApacheLuceneStoreDataInput *)self readByte];
  return [(OrgApacheLuceneStoreDataInput *)self readByte] | (unsigned __int16)(v3 << 8);
}

- (int)readInt
{
  unsigned int v3 = [(OrgApacheLuceneStoreDataInput *)self readByte] << 24;
  unsigned int v4 = v3 & 0xFF00FFFF | ([(OrgApacheLuceneStoreDataInput *)self readByte] << 16);
  unsigned int v5 = v4 & 0xFFFF00FF | ([(OrgApacheLuceneStoreDataInput *)self readByte] << 8);
  return v5 & 0xFFFFFF00 | [(OrgApacheLuceneStoreDataInput *)self readByte];
}

- (int)readVInt
{
  unsigned int v3 = [(OrgApacheLuceneStoreDataInput *)self readByte];
  unsigned int v4 = v3;
  if ((v3 & 0x80000000) != 0)
  {
    int v5 = v3 & 0x7F;
    unsigned int v6 = [(OrgApacheLuceneStoreDataInput *)self readByte];
    unsigned int v4 = v5 & 0xFFFFC07F | ((v6 & 0x7F) << 7);
    if ((v6 & 0x80000000) != 0)
    {
      unsigned int v7 = [(OrgApacheLuceneStoreDataInput *)self readByte];
      unsigned int v4 = v4 & 0xFFE03FFF | ((v7 & 0x7F) << 14);
      if ((v7 & 0x80000000) != 0)
      {
        unsigned int v8 = [(OrgApacheLuceneStoreDataInput *)self readByte];
        unsigned int v4 = v4 & 0xF01FFFFF | ((v8 & 0x7F) << 21);
        if ((v8 & 0x80000000) != 0)
        {
          unsigned int v9 = [(OrgApacheLuceneStoreDataInput *)self readByte];
          if (v9 > 0xF)
          {
            v11 = new_JavaIoIOException_initWithNSString_(@"Invalid vInt detected (too many bits)");
            objc_exception_throw(v11);
          }
          v4 |= v9 << 28;
        }
      }
    }
  }
  return v4;
}

- (int)readZInt
{
  unsigned int v2 = [(OrgApacheLuceneStoreDataInput *)self readVInt];
  return OrgApacheLuceneUtilBitUtil_zigZagDecodeWithInt_(v2);
}

- (int64_t)readLong
{
  uint64_t v3 = [(OrgApacheLuceneStoreDataInput *)self readInt];
  return [(OrgApacheLuceneStoreDataInput *)self readInt] | (unint64_t)(v3 << 32);
}

- (int64_t)readVLong
{
  return sub_10003DE60(self, 0);
}

- (int64_t)readVLongWithBoolean:(BOOL)a3
{
  return sub_10003DE60(self, a3);
}

- (int64_t)readZLong
{
  unint64_t v2 = sub_10003DE60(self, 1);
  return OrgApacheLuceneUtilBitUtil_zigZagDecodeWithLong_(v2);
}

- (id)readString
{
  uint64_t v3 = [(OrgApacheLuceneStoreDataInput *)self readVInt];
  unsigned int v4 = +[IOSByteArray arrayWithLength:(int)v3];
  [(OrgApacheLuceneStoreDataInput *)self readBytesWithByteArray:v4 withInt:0 withInt:v3];
  if ((atomic_load_explicit((atomic_uchar *volatile)OrgLukhnosPortmobileCharsetStandardCharsets__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  uint64_t v5 = OrgLukhnosPortmobileCharsetStandardCharsets_UTF_8_;
  }
  return +[NSString stringWithBytes:v4 offset:0 length:v3 charset:v5];
}

- (id)clone
{
  v4.receiver = self;
  v4.super_class = (Class)OrgApacheLuceneStoreDataInput;
  id v2 = [(OrgApacheLuceneStoreDataInput *)&v4 clone];
  objc_opt_class();
  if (v2 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v2;
}

- (id)readStringStringMap
{
  uint64_t v3 = new_JavaUtilHashMap_init();
  int v4 = [(OrgApacheLuceneStoreDataInput *)self readInt];
  if (v4 >= 1)
  {
    int v5 = v4;
    do
    {
      [(JavaUtilHashMap *)v3 putWithId:[(OrgApacheLuceneStoreDataInput *)self readString] withId:[(OrgApacheLuceneStoreDataInput *)self readString]];
      --v5;
    }
    while (v5);
  }
  return v3;
}

- (id)readMapOfStrings
{
  int v3 = [(OrgApacheLuceneStoreDataInput *)self readVInt];
  if (v3 != 1)
  {
    int v4 = v3;
    if (!v3)
    {
      return (id)JavaUtilCollections_emptyMap();
    }
    if (v3 < 11)
    {
      unsigned int v8 = new_JavaUtilTreeMap_init();
      if (v4 < 1)
      {
LABEL_13:
        return JavaUtilCollections_unmodifiableMapWithJavaUtilMap_(v8);
      }
    }
    else
    {
      unsigned int v8 = new_JavaUtilHashMap_init();
    }
    do
    {
      [(JavaUtilTreeMap *)v8 putWithId:[(OrgApacheLuceneStoreDataInput *)self readString] withId:[(OrgApacheLuceneStoreDataInput *)self readString]];
      --v4;
    }
    while (v4);
    goto LABEL_13;
  }
  id v6 = [(OrgApacheLuceneStoreDataInput *)self readString];
  id v7 = [(OrgApacheLuceneStoreDataInput *)self readString];
  return JavaUtilCollections_singletonMapWithId_withId_(v6, v7);
}

- (id)readStringSet
{
  int v3 = new_JavaUtilHashSet_init();
  int v4 = [(OrgApacheLuceneStoreDataInput *)self readInt];
  if (v4 >= 1)
  {
    int v5 = v4;
    do
    {
      [(JavaUtilHashSet *)v3 addWithId:[(OrgApacheLuceneStoreDataInput *)self readString]];
      --v5;
    }
    while (v5);
  }
  return v3;
}

- (id)readSetOfStrings
{
  int v3 = [(OrgApacheLuceneStoreDataInput *)self readVInt];
  if (v3 != 1)
  {
    int v4 = v3;
    if (!v3)
    {
      return (id)JavaUtilCollections_emptySet();
    }
    if (v3 < 11)
    {
      id v7 = new_JavaUtilTreeSet_init();
      if (v4 < 1)
      {
LABEL_13:
        return JavaUtilCollections_unmodifiableSetWithJavaUtilSet_(v7);
      }
    }
    else
    {
      id v7 = new_JavaUtilHashSet_init();
    }
    do
    {
      [(JavaUtilTreeSet *)v7 addWithId:[(OrgApacheLuceneStoreDataInput *)self readString]];
      --v4;
    }
    while (v4);
    goto LABEL_13;
  }
  id v6 = [(OrgApacheLuceneStoreDataInput *)self readString];
  return JavaUtilCollections_singletonWithId_(v6);
}

- (void)skipBytesWithLong:(int64_t)a3
{
  if (a3 < 0)
  {
    CFStringRef v12 = JreStrcat("$J", (uint64_t)a2, a3, v3, v4, v5, v6, v7, @"numBytes must be >= 0, got ");
    v13 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v12);
    objc_exception_throw(v13);
  }
  if (!self->skipBuffer_) {
    JreStrongAssignAndConsume((id *)&self->skipBuffer_, +[IOSByteArray newArrayWithLength:1024]);
  }
  if (a3)
  {
    int64_t v10 = 0;
    do
    {
      uint64_t v11 = JavaLangMath_minWithLong_withLong_(1024, a3 - v10);
      [(OrgApacheLuceneStoreDataInput *)self readBytesWithByteArray:self->skipBuffer_ withInt:0 withInt:v11 withBoolean:0];
      v10 += (int)v11;
    }
    while (v10 < a3);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreDataInput;
  [(OrgApacheLuceneStoreDataInput *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(OrgApacheLuceneStoreDataInput *)self clone];
  return v3;
}

@end