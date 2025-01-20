@interface JavaUtilRegexSplitter
+ (const)__metadata;
+ (id)fastSplitWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5;
+ (id)finishSplitWithJavaUtilList:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
+ (id)splitWithJavaUtilRegexPattern:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6;
@end

@implementation JavaUtilRegexSplitter

+ (id)fastSplitWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5
{
  return JavaUtilRegexSplitter_fastSplitWithNSString_withNSString_withInt_(a3, a4, a5);
}

+ (id)splitWithJavaUtilRegexPattern:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6
{
  return JavaUtilRegexSplitter_splitWithJavaUtilRegexPattern_withNSString_withNSString_withInt_((uint64_t)a3, a4, a5, a6);
}

+ (id)finishSplitWithJavaUtilList:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return sub_1001AF0F4(a3, a4, *(uint64_t *)&a5, a7);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004184A0;
}

@end