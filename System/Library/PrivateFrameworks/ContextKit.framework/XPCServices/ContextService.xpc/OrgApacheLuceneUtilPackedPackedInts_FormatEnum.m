@interface OrgApacheLuceneUtilPackedPackedInts_FormatEnum
+ (id)byIdWithInt:(int)a3;
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (BOOL)isSupportedWithInt:(int)a3;
- (OrgApacheLuceneUtilPackedPackedInts_FormatEnum)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5;
- (float)overheadPerValueWithInt:(int)a3;
- (float)overheadRatioWithInt:(int)a3;
- (int)getId;
- (int)longCountWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)byteCountWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_FormatEnum

+ (id)byIdWithInt:(int)a3
{
  return OrgApacheLuceneUtilPackedPackedInts_FormatEnum_byIdWithInt_(a3);
}

- (OrgApacheLuceneUtilPackedPackedInts_FormatEnum)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5
{
  *(&self->super.ordinal_ + 1) = a3;
  return self;
}

- (int)getId
{
  return *(&self->super.ordinal_ + 1);
}

- (int64_t)byteCountWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return 8
       * [(OrgApacheLuceneUtilPackedPackedInts_FormatEnum *)self longCountWithInt:*(void *)&a3 withInt:*(void *)&a4 withInt:*(void *)&a5];
}

- (int)longCountWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  int64_t v5 = [(OrgApacheLuceneUtilPackedPackedInts_FormatEnum *)self byteCountWithInt:*(void *)&a3 withInt:*(void *)&a4 withInt:*(void *)&a5];
  if ((v5 & 7) != 0) {
    return v5 / 8 + 1;
  }
  else {
    return v5 / 8;
  }
}

- (BOOL)isSupportedWithInt:(int)a3
{
  return (a3 - 1) < 0x40;
}

- (float)overheadPerValueWithInt:(int)a3
{
  return 0.0;
}

- (float)overheadRatioWithInt:(int)a3
{
  -[OrgApacheLuceneUtilPackedPackedInts_FormatEnum overheadPerValueWithInt:](self, "overheadPerValueWithInt:");
  return v4 / (float)a3;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneUtilPackedPackedInts_FormatEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneUtilPackedPackedInts_Format__1Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"PACKED", 0);
    *(&v2->super.super.ordinal_ + 1) = 0;
    OrgApacheLuceneUtilPackedPackedInts_FormatEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneUtilPackedPackedInts_Format__2Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"PACKED_SINGLE_BLOCK", 1);
    *(&v3->super.super.ordinal_ + 1) = 1;
    qword_100563798 = (uint64_t)v3;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilPackedPackedInts_FormatEnum__initialized);
  }
}

@end