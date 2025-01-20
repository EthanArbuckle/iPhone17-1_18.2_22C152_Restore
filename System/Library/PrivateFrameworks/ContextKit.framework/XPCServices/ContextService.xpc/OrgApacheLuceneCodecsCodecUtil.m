@interface OrgApacheLuceneCodecsCodecUtil
+ (id)checkIndexHeaderIDWithOrgApacheLuceneStoreDataInput:(id)a3 withByteArray:(id)a4;
+ (id)checkIndexHeaderSuffixWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4;
+ (int)checkHeaderNoMagicWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int)checkHeaderWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (int)checkIndexHeaderWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withByteArray:(id)a7 withNSString:(id)a8;
+ (int)footerLength;
+ (int)headerLengthWithNSString:(id)a3;
+ (int)indexHeaderLengthWithNSString:(id)a3 withNSString:(id)a4;
+ (int64_t)checkFooterWithOrgApacheLuceneStoreChecksumIndexInput:(id)a3;
+ (int64_t)checksumEntireFileWithOrgApacheLuceneStoreIndexInput:(id)a3;
+ (int64_t)readCRCWithOrgApacheLuceneStoreIndexInput:(id)a3;
+ (int64_t)retrieveChecksumWithOrgApacheLuceneStoreIndexInput:(id)a3;
+ (void)checkEOFWithOrgApacheLuceneStoreIndexInput:(id)a3;
+ (void)checkFooterWithOrgApacheLuceneStoreChecksumIndexInput:(id)a3 withJavaLangThrowable:(id)a4;
+ (void)writeCRCWithOrgApacheLuceneStoreIndexOutput:(id)a3;
+ (void)writeFooterWithOrgApacheLuceneStoreIndexOutput:(id)a3;
+ (void)writeHeaderWithOrgApacheLuceneStoreDataOutput:(id)a3 withNSString:(id)a4 withInt:(int)a5;
+ (void)writeIndexHeaderWithOrgApacheLuceneStoreDataOutput:(id)a3 withNSString:(id)a4 withInt:(int)a5 withByteArray:(id)a6 withNSString:(id)a7;
@end

@implementation OrgApacheLuceneCodecsCodecUtil

+ (void)writeHeaderWithOrgApacheLuceneStoreDataOutput:(id)a3 withNSString:(id)a4 withInt:(int)a5
{
}

+ (void)writeIndexHeaderWithOrgApacheLuceneStoreDataOutput:(id)a3 withNSString:(id)a4 withInt:(int)a5 withByteArray:(id)a6 withNSString:(id)a7
{
}

+ (int)headerLengthWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 length] + 9;
}

+ (int)indexHeaderLengthWithNSString:(id)a3 withNSString:(id)a4
{
  if (!a3 || (unsigned int v5 = [a3 length], !a4)) {
    JreThrowNullPointerException();
  }
  return v5 + [a4 length] + 26;
}

+ (int)checkHeaderWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return OrgApacheLuceneCodecsCodecUtil_checkHeaderWithOrgApacheLuceneStoreDataInput_withNSString_withInt_withInt_(a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a6);
}

+ (int)checkHeaderNoMagicWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return OrgApacheLuceneCodecsCodecUtil_checkHeaderNoMagicWithOrgApacheLuceneStoreDataInput_withNSString_withInt_withInt_(a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a6);
}

+ (int)checkIndexHeaderWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withByteArray:(id)a7 withNSString:(id)a8
{
  int v11 = OrgApacheLuceneCodecsCodecUtil_checkHeaderWithOrgApacheLuceneStoreDataInput_withNSString_withInt_withInt_(a3, (uint64_t)a4, *(uint64_t *)&a5, *(uint64_t *)&a6);
  OrgApacheLuceneCodecsCodecUtil_checkIndexHeaderIDWithOrgApacheLuceneStoreDataInput_withByteArray_(a3, (uint64_t)a7);
  OrgApacheLuceneCodecsCodecUtil_checkIndexHeaderSuffixWithOrgApacheLuceneStoreDataInput_withNSString_(a3, (uint64_t)a8);
  return v11;
}

+ (id)checkIndexHeaderIDWithOrgApacheLuceneStoreDataInput:(id)a3 withByteArray:(id)a4
{
  return (id)OrgApacheLuceneCodecsCodecUtil_checkIndexHeaderIDWithOrgApacheLuceneStoreDataInput_withByteArray_(a3, (uint64_t)a4);
}

+ (id)checkIndexHeaderSuffixWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneCodecsCodecUtil_checkIndexHeaderSuffixWithOrgApacheLuceneStoreDataInput_withNSString_(a3, (uint64_t)a4);
}

+ (void)writeFooterWithOrgApacheLuceneStoreIndexOutput:(id)a3
{
}

+ (int)footerLength
{
  return 16;
}

+ (int64_t)checkFooterWithOrgApacheLuceneStoreChecksumIndexInput:(id)a3
{
  return (int64_t)OrgApacheLuceneCodecsCodecUtil_checkFooterWithOrgApacheLuceneStoreChecksumIndexInput_(a3);
}

+ (void)checkFooterWithOrgApacheLuceneStoreChecksumIndexInput:(id)a3 withJavaLangThrowable:(id)a4
{
}

+ (int64_t)retrieveChecksumWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  return OrgApacheLuceneCodecsCodecUtil_retrieveChecksumWithOrgApacheLuceneStoreIndexInput_(a3);
}

+ (void)checkEOFWithOrgApacheLuceneStoreIndexInput:(id)a3
{
}

+ (int64_t)checksumEntireFileWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  return (int64_t)OrgApacheLuceneCodecsCodecUtil_checksumEntireFileWithOrgApacheLuceneStoreIndexInput_(a3);
}

+ (int64_t)readCRCWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  return OrgApacheLuceneCodecsCodecUtil_readCRCWithOrgApacheLuceneStoreIndexInput_(a3);
}

+ (void)writeCRCWithOrgApacheLuceneStoreIndexOutput:(id)a3
{
}

@end