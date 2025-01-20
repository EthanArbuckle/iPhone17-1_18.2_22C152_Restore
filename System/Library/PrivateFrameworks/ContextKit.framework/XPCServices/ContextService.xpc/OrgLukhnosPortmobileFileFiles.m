@interface OrgLukhnosPortmobileFileFiles
+ (BOOL)deleteIfExistsWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (BOOL)existsWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (BOOL)isDirectoryWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (BOOL)isWritableWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (BOOL)notExistsWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (id)copy__WithOrgLukhnosPortmobileFilePath:(id)a3 withOrgLukhnosPortmobileFilePath:(id)a4 withOrgLukhnosPortmobileFileStandardCopyOptionArray:(id)a5;
+ (id)createDirectoriesWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (id)createFileWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (id)createTempDirectoryWithNSString:(id)a3;
+ (id)createTempDirectoryWithOrgLukhnosPortmobileFilePath:(id)a3 withNSString:(id)a4;
+ (id)createTempFileWithOrgLukhnosPortmobileFilePath:(id)a3 withNSString:(id)a4 withNSString:(id)a5;
+ (id)moveWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgLukhnosPortmobileFilePath:(id)a4 withOrgLukhnosPortmobileFileStandardCopyOptionArray:(id)a5;
+ (id)newBufferedReaderWithOrgLukhnosPortmobileFilePath:(id)a3 withJavaNioCharsetCharset:(id)a4;
+ (id)newByteChannelWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgLukhnosPortmobileFileStandardOpenOptionEnum:(id)a4;
+ (id)newDirectoryStreamWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (id)newInputStreamWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (id)newOutputStreamWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (id)readAttributesWithOrgLukhnosPortmobileFilePath:(id)a3 withIOSClass:(id)a4;
+ (id)walkFileTreeWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgLukhnosPortmobileFileFileVisitor:(id)a4;
+ (int64_t)sizeWithOrgLukhnosPortmobileFilePath:(id)a3;
+ (void)delete__WithOrgLukhnosPortmobileFilePath:(id)a3;
@end

@implementation OrgLukhnosPortmobileFileFiles

+ (id)createDirectoriesWithOrgLukhnosPortmobileFilePath:(id)a3
{
  return OrgLukhnosPortmobileFileFiles_createDirectoriesWithOrgLukhnosPortmobileFilePath_(a3);
}

+ (id)newByteChannelWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgLukhnosPortmobileFileStandardOpenOptionEnum:(id)a4
{
  id v7 = a4;
  v5 = +[IOSObjectArray arrayWithObjects:&v7 count:1 type:OrgLukhnosPortmobileFileStandardOpenOptionEnum_class_()];
  return OrgLukhnosPortmobileChannelsUtilsFileChannelUtils_openWithOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFileStandardOpenOptionEnumArray_(a3, v5);
}

+ (id)createFileWithOrgLukhnosPortmobileFilePath:(id)a3
{
  return OrgLukhnosPortmobileFileFiles_createFileWithOrgLukhnosPortmobileFilePath_(a3);
}

+ (int64_t)sizeWithOrgLukhnosPortmobileFilePath:(id)a3
{
  if (!a3 || (id v3 = [a3 toFile]) == 0) {
    JreThrowNullPointerException();
  }
  return (int64_t)[v3 length];
}

+ (BOOL)existsWithOrgLukhnosPortmobileFilePath:(id)a3
{
  if (!a3 || (id v3 = (void *)*((void *)a3 + 1)) == 0) {
    JreThrowNullPointerException();
  }
  return [v3 exists];
}

+ (BOOL)notExistsWithOrgLukhnosPortmobileFilePath:(id)a3
{
  if (!a3 || (id v3 = (void *)*((void *)a3 + 1)) == 0) {
    JreThrowNullPointerException();
  }
  return [v3 exists] ^ 1;
}

+ (BOOL)isDirectoryWithOrgLukhnosPortmobileFilePath:(id)a3
{
  if (!a3 || (id v3 = (void *)*((void *)a3 + 1)) == 0) {
    JreThrowNullPointerException();
  }
  return [v3 isDirectory];
}

+ (BOOL)isWritableWithOrgLukhnosPortmobileFilePath:(id)a3
{
  if (!a3 || (id v3 = (void *)*((void *)a3 + 1)) == 0) {
    JreThrowNullPointerException();
  }
  return [v3 canWrite];
}

+ (id)newOutputStreamWithOrgLukhnosPortmobileFilePath:(id)a3
{
  return OrgLukhnosPortmobileFileFiles_newOutputStreamWithOrgLukhnosPortmobileFilePath_(a3);
}

+ (id)newInputStreamWithOrgLukhnosPortmobileFilePath:(id)a3
{
  return OrgLukhnosPortmobileFileFiles_newInputStreamWithOrgLukhnosPortmobileFilePath_(a3);
}

+ (id)newBufferedReaderWithOrgLukhnosPortmobileFilePath:(id)a3 withJavaNioCharsetCharset:(id)a4
{
  return OrgLukhnosPortmobileFileFiles_newBufferedReaderWithOrgLukhnosPortmobileFilePath_withJavaNioCharsetCharset_(a3, a4);
}

+ (id)newDirectoryStreamWithOrgLukhnosPortmobileFilePath:(id)a3
{
  return OrgLukhnosPortmobileFileFiles_newDirectoryStreamWithOrgLukhnosPortmobileFilePath_(a3);
}

+ (BOOL)deleteIfExistsWithOrgLukhnosPortmobileFilePath:(id)a3
{
  return OrgLukhnosPortmobileFileFiles_deleteIfExistsWithOrgLukhnosPortmobileFilePath_(a3);
}

+ (id)createTempFileWithOrgLukhnosPortmobileFilePath:(id)a3 withNSString:(id)a4 withNSString:(id)a5
{
  return OrgLukhnosPortmobileFileFiles_createTempFileWithOrgLukhnosPortmobileFilePath_withNSString_withNSString_(a3, a4, (uint64_t)a5);
}

+ (id)copy__WithOrgLukhnosPortmobileFilePath:(id)a3 withOrgLukhnosPortmobileFilePath:(id)a4 withOrgLukhnosPortmobileFileStandardCopyOptionArray:(id)a5
{
  return OrgLukhnosPortmobileFileFiles_copy__WithOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFileStandardCopyOptionArray_(a3, a4);
}

+ (void)delete__WithOrgLukhnosPortmobileFilePath:(id)a3
{
  if (!a3 || (id v3 = [a3 toFile]) == 0) {
    JreThrowNullPointerException();
  }
  [v3 delete];
}

+ (id)moveWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgLukhnosPortmobileFilePath:(id)a4 withOrgLukhnosPortmobileFileStandardCopyOptionArray:(id)a5
{
  return OrgLukhnosPortmobileFileFiles_moveWithOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFileStandardCopyOptionArray_(a3, a4);
}

+ (id)walkFileTreeWithOrgLukhnosPortmobileFilePath:(id)a3 withOrgLukhnosPortmobileFileFileVisitor:(id)a4
{
  return OrgLukhnosPortmobileFileFiles_walkFileTreeWithOrgLukhnosPortmobileFilePath_withOrgLukhnosPortmobileFileFileVisitor_(a3, a4);
}

+ (id)createTempDirectoryWithNSString:(id)a3
{
  return OrgLukhnosPortmobileFileFiles_createTempDirectoryWithNSString_(a3);
}

+ (id)createTempDirectoryWithOrgLukhnosPortmobileFilePath:(id)a3 withNSString:(id)a4
{
  return OrgLukhnosPortmobileFileFiles_createTempDirectoryWithOrgLukhnosPortmobileFilePath_withNSString_(a3, a4);
}

+ (id)readAttributesWithOrgLukhnosPortmobileFilePath:(id)a3 withIOSClass:(id)a4
{
  return OrgLukhnosPortmobileFileFiles_readAttributesWithOrgLukhnosPortmobileFilePath_withIOSClass_(a3);
}

@end