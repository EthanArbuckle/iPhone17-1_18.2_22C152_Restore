@interface OrgApacheLuceneUtilPackedPackedInts
+ (id)fastestFormatAndBitsWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5;
+ (id)getDecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (id)getDirectReaderNoHeaderWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
+ (id)getDirectReaderWithOrgApacheLuceneStoreIndexInput:(id)a3;
+ (id)getEncoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (id)getMutableWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5;
+ (id)getMutableWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a5;
+ (id)getReaderIteratorNoHeaderWithOrgApacheLuceneStoreDataInput:(id)a3 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
+ (id)getReaderIteratorWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4;
+ (id)getReaderNoHeaderWithOrgApacheLuceneStoreDataInput:(id)a3 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
+ (id)getReaderWithOrgApacheLuceneStoreDataInput:(id)a3;
+ (id)getWriterNoHeaderWithOrgApacheLuceneStoreDataOutput:(id)a3 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
+ (id)getWriterWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6;
+ (int)bitsRequiredWithLong:(int64_t)a3;
+ (int)checkBlockSizeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)numBlocksWithLong:(int64_t)a3 withInt:(int)a4;
+ (int)unsignedBitsRequiredWithLong:(int64_t)a3;
+ (int64_t)maxValueWithInt:(int)a3;
+ (void)checkVersionWithInt:(int)a3;
+ (void)copy__WithOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_Mutable:(id)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
+ (void)copy__WithOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_Mutable:(id)a5 withInt:(int)a6 withInt:(int)a7 withLongArray:(id)a8;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts

+ (void)checkVersionWithInt:(int)a3
{
  OrgApacheLuceneUtilPackedPackedInts_checkVersionWithInt_(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (id)fastestFormatAndBitsWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5
{
  return OrgApacheLuceneUtilPackedPackedInts_fastestFormatAndBitsWithInt_withInt_withFloat_(a3, *(uint64_t *)&a4, a5);
}

+ (id)getDecoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  OrgApacheLuceneUtilPackedPackedInts_checkVersionWithInt_(*(uint64_t *)&a4, (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
  return (id)OrgApacheLuceneUtilPackedBulkOperation_ofWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_(a3, a5);
}

+ (id)getEncoderWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  OrgApacheLuceneUtilPackedPackedInts_checkVersionWithInt_(*(uint64_t *)&a4, (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
  return (id)OrgApacheLuceneUtilPackedBulkOperation_ofWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_(a3, a5);
}

+ (id)getReaderNoHeaderWithOrgApacheLuceneStoreDataInput:(id)a3 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return OrgApacheLuceneUtilPackedPackedInts_getReaderNoHeaderWithOrgApacheLuceneStoreDataInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_(a3, a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, *(uint64_t *)&a6, *(uint64_t *)&a7, v7);
}

+ (id)getReaderWithOrgApacheLuceneStoreDataInput:(id)a3
{
  return OrgApacheLuceneUtilPackedPackedInts_getReaderWithOrgApacheLuceneStoreDataInput_(a3);
}

+ (id)getReaderIteratorNoHeaderWithOrgApacheLuceneStoreDataInput:(id)a3 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  OrgApacheLuceneUtilPackedPackedInts_checkVersionWithInt_(*(uint64_t *)&a5, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, *(uint64_t *)&a8);
  v14 = new_OrgApacheLuceneUtilPackedPackedReaderIterator_initWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_withOrgApacheLuceneStoreDataInput_withInt_(a4, a5, a6, a7, a3, v8);
  return v14;
}

+ (id)getReaderIteratorWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilPackedPackedInts_getReaderIteratorWithOrgApacheLuceneStoreDataInput_withInt_(a3, *(uint64_t *)&a4);
}

+ (id)getDirectReaderNoHeaderWithOrgApacheLuceneStoreIndexInput:(id)a3 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return OrgApacheLuceneUtilPackedPackedInts_getDirectReaderNoHeaderWithOrgApacheLuceneStoreIndexInput_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withInt_withInt_withInt_(a3, a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, *(uint64_t *)&a6, *(uint64_t *)&a7, v7);
}

+ (id)getDirectReaderWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  return OrgApacheLuceneUtilPackedPackedInts_getDirectReaderWithOrgApacheLuceneStoreIndexInput_(a3);
}

+ (id)getMutableWithInt:(int)a3 withInt:(int)a4 withFloat:(float)a5
{
  return OrgApacheLuceneUtilPackedPackedInts_getMutableWithInt_withInt_withFloat_(*(uint64_t *)&a3, *(uint64_t *)&a4, a5);
}

+ (id)getMutableWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a5
{
  return OrgApacheLuceneUtilPackedPackedInts_getMutableWithInt_withInt_withOrgApacheLuceneUtilPackedPackedInts_FormatEnum_(*(uint64_t *)&a3, *(uint64_t *)&a4, a5);
}

+ (id)getWriterNoHeaderWithOrgApacheLuceneStoreDataOutput:(id)a3 withOrgApacheLuceneUtilPackedPackedInts_FormatEnum:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  uint64_t v7 = new_OrgApacheLuceneUtilPackedPackedWriter_initWithOrgApacheLuceneUtilPackedPackedInts_FormatEnum_withOrgApacheLuceneStoreDataOutput_withInt_withInt_withInt_(a4, a3, *(uint64_t *)&a5, a6, *(uint64_t *)&a7);
  return v7;
}

+ (id)getWriterWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4 withInt:(int)a5 withFloat:(float)a6
{
  return OrgApacheLuceneUtilPackedPackedInts_getWriterWithOrgApacheLuceneStoreDataOutput_withInt_withInt_withFloat_(a3, *(uint64_t *)&a4, *(uint64_t *)&a5, a6);
}

+ (int)bitsRequiredWithLong:(int64_t)a3
{
  return OrgApacheLuceneUtilPackedPackedInts_bitsRequiredWithLong_(a3, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
}

+ (int)unsignedBitsRequiredWithLong:(int64_t)a3
{
  int v3 = 64 - JavaLangLong_numberOfLeadingZerosWithLong_(a3);
  return JavaLangMath_maxWithInt_withInt_(1, v3);
}

+ (int64_t)maxValueWithInt:(int)a3
{
  if (a3 == 64) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return ~(-1 << a3);
  }
}

+ (void)copy__WithOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_Mutable:(id)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
}

+ (void)copy__WithOrgApacheLuceneUtilPackedPackedInts_Reader:(id)a3 withInt:(int)a4 withOrgApacheLuceneUtilPackedPackedInts_Mutable:(id)a5 withInt:(int)a6 withInt:(int)a7 withLongArray:(id)a8
{
}

+ (int)checkBlockSizeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilPackedPackedInts_checkBlockSizeWithInt_withInt_withInt_(a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (int)numBlocksWithLong:(int64_t)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilPackedPackedInts_numBlocksWithLong_withInt_(a3, a4);
}

@end