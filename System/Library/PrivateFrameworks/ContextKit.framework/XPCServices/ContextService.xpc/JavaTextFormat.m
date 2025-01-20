@interface JavaTextFormat
+ (BOOL)upToWithNSString:(id)a3 withJavaTextParsePosition:(id)a4 withJavaLangStringBuffer:(id)a5 withChar:(unsigned __int16)a6;
+ (BOOL)upToWithQuotesWithNSString:(id)a3 withJavaTextParsePosition:(id)a4 withJavaLangStringBuffer:(id)a5 withChar:(unsigned __int16)a6 withChar:(unsigned __int16)a7;
+ (const)__metadata;
- (JavaTextFormat)formatWithId:(id)a3;
- (JavaTextFormat)formatWithId:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formatToCharacterIteratorWithId:(id)a3;
- (id)parseObjectWithNSString:(id)a3;
- (id)parseObjectWithNSString:(id)a3 withJavaTextParsePosition:(id)a4;
@end

@implementation JavaTextFormat

- (id)clone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextFormat;
  return [(JavaTextFormat *)&v3 clone];
}

- (JavaTextFormat)formatWithId:(id)a3
{
  return (JavaTextFormat *)sub_100201230(self, (uint64_t)a3);
}

- (JavaTextFormat)formatWithId:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  return 0;
}

- (id)formatToCharacterIteratorWithId:(id)a3
{
  id v3 = sub_100201230(self, (uint64_t)a3);
  v4 = new_JavaTextAttributedString_initWithNSString_(v3);
  return [(JavaTextAttributedString *)v4 getIterator];
}

- (id)parseObjectWithNSString:(id)a3
{
  v5 = new_JavaTextParsePosition_initWithInt_(0);
  id v6 = [(JavaTextFormat *)self parseObjectWithNSString:a3 withJavaTextParsePosition:v5];
  if (![(JavaTextParsePosition *)v5 getIndex])
  {
    v8 = new_JavaTextParseException_initWithNSString_withInt_(@"Parse failure", [(JavaTextParsePosition *)v5 getErrorIndex]);
    objc_exception_throw(v8);
  }
  return v6;
}

- (id)parseObjectWithNSString:(id)a3 withJavaTextParsePosition:(id)a4
{
  return 0;
}

+ (BOOL)upToWithNSString:(id)a3 withJavaTextParsePosition:(id)a4 withJavaLangStringBuffer:(id)a5 withChar:(unsigned __int16)a6
{
  return JavaTextFormat_upToWithNSString_withJavaTextParsePosition_withJavaLangStringBuffer_withChar_(a3, a4, a5, a6);
}

+ (BOOL)upToWithQuotesWithNSString:(id)a3 withJavaTextParsePosition:(id)a4 withJavaLangStringBuffer:(id)a5 withChar:(unsigned __int16)a6 withChar:(unsigned __int16)a7
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaTextFormat *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100440CE8;
}

@end