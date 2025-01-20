@interface JavaNioCharsetStandardCharsets
+ (const)__metadata;
+ (void)initialize;
@end

@implementation JavaNioCharsetStandardCharsets

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = JavaNioCharsetCharset_forNameWithNSString_(@"ISO-8859-1");
    JreStrongAssign((id *)&JavaNioCharsetStandardCharsets_ISO_8859_1_, v2);
    id v3 = JavaNioCharsetCharset_forNameWithNSString_(@"US-ASCII");
    JreStrongAssign(&JavaNioCharsetStandardCharsets_US_ASCII_, v3);
    id v4 = JavaNioCharsetCharset_forNameWithNSString_(@"UTF-16");
    JreStrongAssign(&JavaNioCharsetStandardCharsets_UTF_16_, v4);
    id v5 = JavaNioCharsetCharset_forNameWithNSString_(@"UTF-16BE");
    JreStrongAssign(&JavaNioCharsetStandardCharsets_UTF_16BE_, v5);
    id v6 = JavaNioCharsetCharset_forNameWithNSString_(@"UTF-16LE");
    JreStrongAssign(&JavaNioCharsetStandardCharsets_UTF_16LE_, v6);
    id v7 = JavaNioCharsetCharset_forNameWithNSString_(@"UTF-8");
    JreStrongAssign((id *)&JavaNioCharsetStandardCharsets_UTF_8_, v7);
    atomic_store(1u, (unsigned __int8 *)JavaNioCharsetStandardCharsets__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100472A40;
}

@end