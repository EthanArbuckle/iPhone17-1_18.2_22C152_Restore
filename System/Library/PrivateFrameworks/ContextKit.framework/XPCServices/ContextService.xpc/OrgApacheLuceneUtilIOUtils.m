@interface OrgApacheLuceneUtilIOUtils
+ (BOOL)spinsLinuxWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (BOOL)spinsWithOrgApacheLuceneStoreDirectory:(id)a3;
+ (BOOL)spinsWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (id)getDecodingReaderWithIOSClass:(id)a3 withNSString:(id)a4 withJavaNioCharsetCharset:(id)a5;
+ (id)getDecodingReaderWithJavaIoInputStream:(id)a3 withJavaNioCharsetCharset:(id)a4;
+ (void)closeWhileHandlingExceptionWithJavaIoCloseableArray:(id)a3;
+ (void)closeWhileHandlingExceptionWithJavaLangIterable:(id)a3;
+ (void)closeWithJavaIoCloseableArray:(id)a3;
+ (void)closeWithJavaLangIterable:(id)a3;
+ (void)deleteFilesIfExistWithJavaUtilCollection:(id)a3;
+ (void)deleteFilesIfExistWithOrgLukhnosPortmobileFilePathArray:(id)a3;
+ (void)deleteFilesIgnoringExceptionsWithJavaUtilCollection:(id)a3;
+ (void)deleteFilesIgnoringExceptionsWithOrgApacheLuceneStoreDirectory:(id)a3 withNSStringArray:(id)a4;
+ (void)deleteFilesIgnoringExceptionsWithOrgLukhnosPortmobileFilePathArray:(id)a3;
+ (void)fsyncWithOrgLukhnosPortmobileFilePath:(id)a3 withBoolean:(BOOL)a4;
+ (void)initialize;
+ (void)reThrowUncheckedWithJavaLangThrowable:(id)a3;
+ (void)reThrowWithJavaLangThrowable:(id)a3;
+ (void)rmWithOrgLukhnosPortmobileFilePathArray:(id)a3;
@end

@implementation OrgApacheLuceneUtilIOUtils

+ (void)closeWithJavaIoCloseableArray:(id)a3
{
}

+ (void)closeWithJavaLangIterable:(id)a3
{
}

+ (void)closeWhileHandlingExceptionWithJavaIoCloseableArray:(id)a3
{
}

+ (void)closeWhileHandlingExceptionWithJavaLangIterable:(id)a3
{
}

+ (id)getDecodingReaderWithJavaIoInputStream:(id)a3 withJavaNioCharsetCharset:(id)a4
{
  return OrgApacheLuceneUtilIOUtils_getDecodingReaderWithJavaIoInputStream_withJavaNioCharsetCharset_(a3, a4);
}

+ (id)getDecodingReaderWithIOSClass:(id)a3 withNSString:(id)a4 withJavaNioCharsetCharset:(id)a5
{
  return OrgApacheLuceneUtilIOUtils_getDecodingReaderWithIOSClass_withNSString_withJavaNioCharsetCharset_(a3, (uint64_t)a4, a5);
}

+ (void)deleteFilesIgnoringExceptionsWithOrgApacheLuceneStoreDirectory:(id)a3 withNSStringArray:(id)a4
{
}

+ (void)deleteFilesIgnoringExceptionsWithOrgLukhnosPortmobileFilePathArray:(id)a3
{
}

+ (void)deleteFilesIgnoringExceptionsWithJavaUtilCollection:(id)a3
{
}

+ (void)deleteFilesIfExistWithOrgLukhnosPortmobileFilePathArray:(id)a3
{
}

+ (void)deleteFilesIfExistWithJavaUtilCollection:(id)a3
{
}

+ (void)rmWithOrgLukhnosPortmobileFilePathArray:(id)a3
{
}

+ (void)reThrowWithJavaLangThrowable:(id)a3
{
}

+ (void)reThrowUncheckedWithJavaLangThrowable:(id)a3
{
}

+ (void)fsyncWithOrgLukhnosPortmobileFilePath:(id)a3 withBoolean:(BOOL)a4
{
}

+ (BOOL)spinsWithOrgApacheLuceneStoreDirectory:(id)a3
{
  return OrgApacheLuceneUtilIOUtils_spinsWithOrgApacheLuceneStoreDirectory_(a3);
}

+ (BOOL)spinsWithOrgLukhnosPortmobileFilePath:(id)a3
{
  return OrgApacheLuceneUtilIOUtils_spinsWithOrgLukhnosPortmobileFilePath_(a3);
}

+ (BOOL)spinsLinuxWithOrgLukhnosPortmobileFilePath:(id)a3
{
  if ((atomic_load_explicit(OrgApacheLuceneUtilIOUtils__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)OrgLukhnosPortmobileCharsetStandardCharsets__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    JreStrongAssign(&OrgApacheLuceneUtilIOUtils_CHARSET_UTF_8_, (void *)OrgLukhnosPortmobileCharsetStandardCharsets_UTF_8_);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)OrgLukhnosPortmobileCharsetStandardCharsets__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    if (!OrgLukhnosPortmobileCharsetStandardCharsets_UTF_8_)
    }
      JreThrowNullPointerException();
    JreStrongAssign((id *)&OrgApacheLuceneUtilIOUtils_UTF_8_, [(id)OrgLukhnosPortmobileCharsetStandardCharsets_UTF_8_ name]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilIOUtils__initialized);
  }
}

@end