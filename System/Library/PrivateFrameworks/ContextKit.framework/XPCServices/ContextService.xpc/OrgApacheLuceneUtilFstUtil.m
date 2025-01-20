@interface OrgApacheLuceneUtilFstUtil
+ (id)getByOutputWithOrgApacheLuceneUtilFstFST:(id)a3 withLong:(int64_t)a4;
+ (id)getByOutputWithOrgApacheLuceneUtilFstFST:(id)a3 withLong:(int64_t)a4 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a5 withOrgApacheLuceneUtilFstFST_Arc:(id)a6 withOrgApacheLuceneUtilFstFST_Arc:(id)a7 withOrgApacheLuceneUtilIntsRefBuilder:(id)a8;
+ (id)getWithOrgApacheLuceneUtilFstFST:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
+ (id)getWithOrgApacheLuceneUtilFstFST:(id)a3 withOrgApacheLuceneUtilIntsRef:(id)a4;
+ (id)readCeilArcWithInt:(int)a3 withOrgApacheLuceneUtilFstFST:(id)a4 withOrgApacheLuceneUtilFstFST_Arc:(id)a5 withOrgApacheLuceneUtilFstFST_Arc:(id)a6 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a7;
+ (id)shortestPathsWithOrgApacheLuceneUtilFstFST:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withId:(id)a5 withJavaUtilComparator:(id)a6 withInt:(int)a7 withBoolean:(BOOL)a8;
+ (id)toBytesRefWithOrgApacheLuceneUtilIntsRef:(id)a3 withOrgApacheLuceneUtilBytesRefBuilder:(id)a4;
+ (id)toIntsRefWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilIntsRefBuilder:(id)a4;
+ (id)toUTF16WithJavaLangCharSequence:(id)a3 withOrgApacheLuceneUtilIntsRefBuilder:(id)a4;
+ (id)toUTF32WithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilIntsRefBuilder:(id)a6;
+ (id)toUTF32WithJavaLangCharSequence:(id)a3 withOrgApacheLuceneUtilIntsRefBuilder:(id)a4;
+ (void)toDotWithOrgApacheLuceneUtilFstFST:(id)a3 withJavaIoWriter:(id)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6;
@end

@implementation OrgApacheLuceneUtilFstUtil

+ (id)getWithOrgApacheLuceneUtilFstFST:(id)a3 withOrgApacheLuceneUtilIntsRef:(id)a4
{
  return OrgApacheLuceneUtilFstUtil_getWithOrgApacheLuceneUtilFstFST_withOrgApacheLuceneUtilIntsRef_((id *)a3, (uint64_t)a4);
}

+ (id)getWithOrgApacheLuceneUtilFstFST:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  return OrgApacheLuceneUtilFstUtil_getWithOrgApacheLuceneUtilFstFST_withOrgApacheLuceneUtilBytesRef_((id *)a3, (uint64_t)a4);
}

+ (id)getByOutputWithOrgApacheLuceneUtilFstFST:(id)a3 withLong:(int64_t)a4
{
  return OrgApacheLuceneUtilFstUtil_getByOutputWithOrgApacheLuceneUtilFstFST_withLong_(a3, (char *)a4);
}

+ (id)getByOutputWithOrgApacheLuceneUtilFstFST:(id)a3 withLong:(int64_t)a4 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a5 withOrgApacheLuceneUtilFstFST_Arc:(id)a6 withOrgApacheLuceneUtilFstFST_Arc:(id)a7 withOrgApacheLuceneUtilIntsRefBuilder:(id)a8
{
  return OrgApacheLuceneUtilFstUtil_getByOutputWithOrgApacheLuceneUtilFstFST_withLong_withOrgApacheLuceneUtilFstFST_BytesReader_withOrgApacheLuceneUtilFstFST_Arc_withOrgApacheLuceneUtilFstFST_Arc_withOrgApacheLuceneUtilIntsRefBuilder_(a3, (char *)a4, a5, (uint64_t)a6, a7, a8);
}

+ (id)shortestPathsWithOrgApacheLuceneUtilFstFST:(id)a3 withOrgApacheLuceneUtilFstFST_Arc:(id)a4 withId:(id)a5 withJavaUtilComparator:(id)a6 withInt:(int)a7 withBoolean:(BOOL)a8
{
  return OrgApacheLuceneUtilFstUtil_shortestPathsWithOrgApacheLuceneUtilFstFST_withOrgApacheLuceneUtilFstFST_Arc_withId_withJavaUtilComparator_withInt_withBoolean_(a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
}

+ (void)toDotWithOrgApacheLuceneUtilFstFST:(id)a3 withJavaIoWriter:(id)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6
{
}

+ (id)toUTF16WithJavaLangCharSequence:(id)a3 withOrgApacheLuceneUtilIntsRefBuilder:(id)a4
{
  return OrgApacheLuceneUtilFstUtil_toUTF16WithJavaLangCharSequence_withOrgApacheLuceneUtilIntsRefBuilder_(a3, a4);
}

+ (id)toUTF32WithJavaLangCharSequence:(id)a3 withOrgApacheLuceneUtilIntsRefBuilder:(id)a4
{
  return OrgApacheLuceneUtilFstUtil_toUTF32WithJavaLangCharSequence_withOrgApacheLuceneUtilIntsRefBuilder_(a3, a4);
}

+ (id)toUTF32WithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilIntsRefBuilder:(id)a6
{
  return OrgApacheLuceneUtilFstUtil_toUTF32WithCharArray_withInt_withInt_withOrgApacheLuceneUtilIntsRefBuilder_((uint64_t)a3, a4, a5, a6);
}

+ (id)toIntsRefWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneUtilIntsRefBuilder:(id)a4
{
  return OrgApacheLuceneUtilFstUtil_toIntsRefWithOrgApacheLuceneUtilBytesRef_withOrgApacheLuceneUtilIntsRefBuilder_((uint64_t)a3, a4);
}

+ (id)toBytesRefWithOrgApacheLuceneUtilIntsRef:(id)a3 withOrgApacheLuceneUtilBytesRefBuilder:(id)a4
{
  return OrgApacheLuceneUtilFstUtil_toBytesRefWithOrgApacheLuceneUtilIntsRef_withOrgApacheLuceneUtilBytesRefBuilder_((uint64_t)a3, a4);
}

+ (id)readCeilArcWithInt:(int)a3 withOrgApacheLuceneUtilFstFST:(id)a4 withOrgApacheLuceneUtilFstFST_Arc:(id)a5 withOrgApacheLuceneUtilFstFST_Arc:(id)a6 withOrgApacheLuceneUtilFstFST_BytesReader:(id)a7
{
  return OrgApacheLuceneUtilFstUtil_readCeilArcWithInt_withOrgApacheLuceneUtilFstFST_withOrgApacheLuceneUtilFstFST_Arc_withOrgApacheLuceneUtilFstFST_Arc_withOrgApacheLuceneUtilFstFST_BytesReader_(a3, a4, (uint64_t)a5, (uint64_t)a6, a7);
}

@end