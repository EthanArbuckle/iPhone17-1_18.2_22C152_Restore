@interface OrgLukhnosPortmobileCharsetStandardCharsets
+ (void)initialize;
@end

@implementation OrgLukhnosPortmobileCharsetStandardCharsets

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = JavaNioCharsetCharset_forNameWithNSString_(@"ISO-8859-1");
    JreStrongAssign(&OrgLukhnosPortmobileCharsetStandardCharsets_ISO_8859_1_, v2);
    id v3 = JavaNioCharsetCharset_forNameWithNSString_(@"UTF-8");
    JreStrongAssign((id *)&OrgLukhnosPortmobileCharsetStandardCharsets_UTF_8_, v3);
    atomic_store(1u, OrgLukhnosPortmobileCharsetStandardCharsets__initialized);
  }
}

@end