@interface JavaNioCharsetCharsets
+ (const)__metadata;
+ (id)toBigEndianUtf16BytesWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)initialize;
@end

@implementation JavaNioCharsetCharsets

+ (id)toBigEndianUtf16BytesWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaNioCharsetCharsets_toBigEndianUtf16BytesWithCharArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = JavaNioCharsetCharset_forNameWithNSString_(@"ISO-8859-1");
    JreStrongAssign(&JavaNioCharsetCharsets_ISO_8859_1_, v2);
    id v3 = JavaNioCharsetCharset_forNameWithNSString_(@"US-ASCII");
    JreStrongAssign(&JavaNioCharsetCharsets_US_ASCII_, v3);
    id v4 = JavaNioCharsetCharset_forNameWithNSString_(@"UTF-8");
    JreStrongAssign((id *)&JavaNioCharsetCharsets_UTF_8_, v4);
    atomic_store(1u, (unsigned __int8 *)JavaNioCharsetCharsets__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100483148;
}

@end