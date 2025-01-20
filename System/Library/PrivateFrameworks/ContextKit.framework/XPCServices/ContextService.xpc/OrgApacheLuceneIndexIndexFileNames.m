@interface OrgApacheLuceneIndexIndexFileNames
+ (BOOL)matchesExtensionWithNSString:(id)a3 withNSString:(id)a4;
+ (id)fileNameFromGenerationWithNSString:(id)a3 withNSString:(id)a4 withLong:(int64_t)a5;
+ (id)getExtensionWithNSString:(id)a3;
+ (id)parseSegmentNameWithNSString:(id)a3;
+ (id)segmentFileNameWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5;
+ (id)stripExtensionWithNSString:(id)a3;
+ (id)stripSegmentNameWithNSString:(id)a3;
+ (int64_t)parseGenerationWithNSString:(id)a3;
+ (void)initialize;
@end

@implementation OrgApacheLuceneIndexIndexFileNames

+ (id)fileNameFromGenerationWithNSString:(id)a3 withNSString:(id)a4 withLong:(int64_t)a5
{
  return OrgApacheLuceneIndexIndexFileNames_fileNameFromGenerationWithNSString_withNSString_withLong_(a3, a4, a5);
}

+ (id)segmentFileNameWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5
{
  return OrgApacheLuceneIndexIndexFileNames_segmentFileNameWithNSString_withNSString_withNSString_(a3, a4, a5);
}

+ (BOOL)matchesExtensionWithNSString:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexIndexFileNames_matchesExtensionWithNSString_withNSString_(a3, (uint64_t)a4, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
}

+ (id)stripSegmentNameWithNSString:(id)a3
{
  return OrgApacheLuceneIndexIndexFileNames_stripSegmentNameWithNSString_(a3);
}

+ (int64_t)parseGenerationWithNSString:(id)a3
{
  return OrgApacheLuceneIndexIndexFileNames_parseGenerationWithNSString_(a3);
}

+ (id)parseSegmentNameWithNSString:(id)a3
{
  return OrgApacheLuceneIndexIndexFileNames_parseSegmentNameWithNSString_(a3);
}

+ (id)stripExtensionWithNSString:(id)a3
{
  return OrgApacheLuceneIndexIndexFileNames_stripExtensionWithNSString_(a3);
}

+ (id)getExtensionWithNSString:(id)a3
{
  return OrgApacheLuceneIndexIndexFileNames_getExtensionWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = JavaUtilRegexPattern_compileWithNSString_(@"_[a-z0-9]+(_.*)?\\..*");
    JreStrongAssign((id *)&OrgApacheLuceneIndexIndexFileNames_CODEC_FILE_PATTERN_, v2);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexIndexFileNames__initialized);
  }
}

@end