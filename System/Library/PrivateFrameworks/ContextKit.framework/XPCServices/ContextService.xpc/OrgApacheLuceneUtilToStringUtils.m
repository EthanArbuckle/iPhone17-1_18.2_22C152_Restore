@interface OrgApacheLuceneUtilToStringUtils
+ (id)longHexWithLong:(int64_t)a3;
+ (void)byteArrayWithJavaLangStringBuilder:(id)a3 withByteArray:(id)a4;
+ (void)initialize;
@end

@implementation OrgApacheLuceneUtilToStringUtils

+ (void)byteArrayWithJavaLangStringBuilder:(id)a3 withByteArray:(id)a4
{
}

+ (id)longHexWithLong:(int64_t)a3
{
  return (id)OrgApacheLuceneUtilToStringUtils_longHexWithLong_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssign((id *)&qword_100560310, [@"0123456789abcdef" toCharArray]);
    atomic_store(1u, (unsigned __int8 *)&OrgApacheLuceneUtilToStringUtils__initialized);
  }
}

@end