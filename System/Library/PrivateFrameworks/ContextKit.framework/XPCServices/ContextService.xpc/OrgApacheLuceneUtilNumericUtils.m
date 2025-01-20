@interface OrgApacheLuceneUtilNumericUtils
+ (double)sortableLongToDoubleWithLong:(int64_t)a3;
+ (float)sortableIntToFloatWithInt:(int)a3;
+ (id)filterPrefixCodedIntsWithOrgApacheLuceneIndexTermsEnum:(id)a3;
+ (id)filterPrefixCodedLongsWithOrgApacheLuceneIndexTermsEnum:(id)a3;
+ (id)getMaxIntWithOrgApacheLuceneIndexTerms:(id)a3;
+ (id)getMaxLongWithOrgApacheLuceneIndexTerms:(id)a3;
+ (id)getMinIntWithOrgApacheLuceneIndexTerms:(id)a3;
+ (id)getMinLongWithOrgApacheLuceneIndexTerms:(id)a3;
+ (int)floatToSortableIntWithFloat:(float)a3;
+ (int)getPrefixCodedIntShiftWithOrgApacheLuceneUtilBytesRef:(id)a3;
+ (int)getPrefixCodedLongShiftWithOrgApacheLuceneUtilBytesRef:(id)a3;
+ (int)prefixCodedToIntWithOrgApacheLuceneUtilBytesRef:(id)a3;
+ (int)sortableFloatBitsWithInt:(int)a3;
+ (int64_t)doubleToSortableLongWithDouble:(double)a3;
+ (int64_t)prefixCodedToLongWithOrgApacheLuceneUtilBytesRef:(id)a3;
+ (int64_t)sortableDoubleBitsWithLong:(int64_t)a3;
+ (void)intToPrefixCodedBytesWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefBuilder:(id)a5;
+ (void)intToPrefixCodedWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefBuilder:(id)a5;
+ (void)longToPrefixCodedBytesWithLong:(int64_t)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefBuilder:(id)a5;
+ (void)longToPrefixCodedWithLong:(int64_t)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefBuilder:(id)a5;
+ (void)splitIntRangeWithOrgApacheLuceneUtilNumericUtils_IntRangeBuilder:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)splitLongRangeWithOrgApacheLuceneUtilNumericUtils_LongRangeBuilder:(id)a3 withInt:(int)a4 withLong:(int64_t)a5 withLong:(int64_t)a6;
@end

@implementation OrgApacheLuceneUtilNumericUtils

+ (void)longToPrefixCodedWithLong:(int64_t)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefBuilder:(id)a5
{
  OrgApacheLuceneUtilNumericUtils_longToPrefixCodedBytesWithLong_withInt_withOrgApacheLuceneUtilBytesRefBuilder_(a3, *(uint64_t *)&a4, a5, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
}

+ (void)intToPrefixCodedWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefBuilder:(id)a5
{
  OrgApacheLuceneUtilNumericUtils_intToPrefixCodedBytesWithInt_withInt_withOrgApacheLuceneUtilBytesRefBuilder_(a3, *(uint64_t *)&a4, a5, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
}

+ (void)longToPrefixCodedBytesWithLong:(int64_t)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefBuilder:(id)a5
{
  OrgApacheLuceneUtilNumericUtils_longToPrefixCodedBytesWithLong_withInt_withOrgApacheLuceneUtilBytesRefBuilder_(a3, *(uint64_t *)&a4, a5, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
}

+ (void)intToPrefixCodedBytesWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneUtilBytesRefBuilder:(id)a5
{
  OrgApacheLuceneUtilNumericUtils_intToPrefixCodedBytesWithInt_withInt_withOrgApacheLuceneUtilBytesRefBuilder_(a3, *(uint64_t *)&a4, a5, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
}

+ (int)getPrefixCodedLongShiftWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_getPrefixCodedLongShiftWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (int)getPrefixCodedIntShiftWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_getPrefixCodedIntShiftWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3);
}

+ (int64_t)prefixCodedToLongWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_prefixCodedToLongWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (int)prefixCodedToIntWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_prefixCodedToIntWithOrgApacheLuceneUtilBytesRef_((uint64_t)a3);
}

+ (int64_t)doubleToSortableLongWithDouble:(double)a3
{
  uint64_t v3 = JavaLangDouble_doubleToLongBitsWithDouble_(a3);
  return (v3 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ v3;
}

+ (double)sortableLongToDoubleWithLong:(int64_t)a3
{
  return JavaLangDouble_longBitsToDoubleWithLong_((a3 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ a3);
}

+ (int)floatToSortableIntWithFloat:(float)a3
{
  int v3 = JavaLangFloat_floatToIntBitsWithFloat_(a3);
  return (v3 >> 31) & 0x7FFFFFFF ^ v3;
}

+ (float)sortableIntToFloatWithInt:(int)a3
{
  return JavaLangFloat_intBitsToFloatWithInt_((a3 >> 31) & 0x7FFFFFFF ^ a3);
}

+ (int64_t)sortableDoubleBitsWithLong:(int64_t)a3
{
  return (a3 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ a3;
}

+ (int)sortableFloatBitsWithInt:(int)a3
{
  return (a3 >> 31) & 0x7FFFFFFF ^ a3;
}

+ (void)splitLongRangeWithOrgApacheLuceneUtilNumericUtils_LongRangeBuilder:(id)a3 withInt:(int)a4 withLong:(int64_t)a5 withLong:(int64_t)a6
{
}

+ (void)splitIntRangeWithOrgApacheLuceneUtilNumericUtils_IntRangeBuilder:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (id)filterPrefixCodedLongsWithOrgApacheLuceneIndexTermsEnum:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_filterPrefixCodedLongsWithOrgApacheLuceneIndexTermsEnum_(a3);
}

+ (id)filterPrefixCodedIntsWithOrgApacheLuceneIndexTermsEnum:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_filterPrefixCodedIntsWithOrgApacheLuceneIndexTermsEnum_(a3);
}

+ (id)getMinIntWithOrgApacheLuceneIndexTerms:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_getMinIntWithOrgApacheLuceneIndexTerms_(a3);
}

+ (id)getMaxIntWithOrgApacheLuceneIndexTerms:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_getMaxIntWithOrgApacheLuceneIndexTerms_(a3);
}

+ (id)getMinLongWithOrgApacheLuceneIndexTerms:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_getMinLongWithOrgApacheLuceneIndexTerms_(a3);
}

+ (id)getMaxLongWithOrgApacheLuceneIndexTerms:(id)a3
{
  return OrgApacheLuceneUtilNumericUtils_getMaxLongWithOrgApacheLuceneIndexTerms_(a3);
}

@end