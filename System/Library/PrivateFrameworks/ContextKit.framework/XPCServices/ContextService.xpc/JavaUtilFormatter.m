@interface JavaUtilFormatter
+ (const)__metadata;
+ (void)initialize;
- (BOOL)appendTWithJavaLangStringBuilder:(id)a3 withChar:(unsigned __int16)a4 withJavaUtilCalendar:(id)a5;
- (JavaUtilFormatter)init;
- (JavaUtilFormatter)initWithJavaIoFile:(id)a3;
- (JavaUtilFormatter)initWithJavaIoFile:(id)a3 withNSString:(id)a4;
- (JavaUtilFormatter)initWithJavaIoFile:(id)a3 withNSString:(id)a4 withJavaUtilLocale:(id)a5;
- (JavaUtilFormatter)initWithJavaIoOutputStream:(id)a3;
- (JavaUtilFormatter)initWithJavaIoOutputStream:(id)a3 withNSString:(id)a4;
- (JavaUtilFormatter)initWithJavaIoOutputStream:(id)a3 withNSString:(id)a4 withJavaUtilLocale:(id)a5;
- (JavaUtilFormatter)initWithJavaIoPrintStream:(id)a3;
- (JavaUtilFormatter)initWithJavaLangAppendable:(id)a3;
- (JavaUtilFormatter)initWithJavaLangAppendable:(id)a3 withJavaUtilLocale:(id)a4;
- (JavaUtilFormatter)initWithJavaUtilLocale:(id)a3;
- (JavaUtilFormatter)initWithNSString:(id)a3;
- (JavaUtilFormatter)initWithNSString:(id)a3 withNSString:(id)a4;
- (JavaUtilFormatter)initWithNSString:(id)a3 withNSString:(id)a4 withJavaUtilLocale:(id)a5;
- (NSString)description;
- (id)badArgumentType;
- (id)formatWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5;
- (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4;
- (id)getArgumentWithNSObjectArray:(id)a3 withInt:(int)a4 withJavaUtilFormatter_FormatSpecifierParser:(id)a5 withId:(id)a6 withBoolean:(BOOL)a7;
- (id)getDecimalFormatWithNSString:(id)a3;
- (id)insertGroupingWithJavaLangCharSequence:(id)a3;
- (id)ioException;
- (id)locale;
- (id)localizeDigitsWithJavaLangCharSequence:(id)a3;
- (id)out;
- (id)paddingWithJavaLangCharSequence:(id)a3 withInt:(int)a4;
- (id)toStringBuilderWithJavaLangCharSequence:(id)a3;
- (id)transformFromNull;
- (id)transformFromPercent;
- (id)transformWithJavaUtilFormatter_FormatToken:(id)a3 withId:(id)a4;
- (id)wrapParenthesesWithJavaLangStringBuilder:(id)a3;
- (int)to12HourWithInt:(int)a3;
- (void)appendLocalizedWithJavaLangStringBuilder:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (void)close;
- (void)dealloc;
- (void)doFormatWithNSString:(id)a3 withNSObjectArray:(id)a4;
- (void)flush;
- (void)outputCharSequenceWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)transformAWithJavaLangStringBuilder:(id)a3;
- (void)transformEWithJavaLangStringBuilder:(id)a3;
- (void)transformFWithJavaLangStringBuilder:(id)a3;
- (void)transformGWithJavaLangStringBuilder:(id)a3;
@end

@implementation JavaUtilFormatter

- (id)getDecimalFormatWithNSString:(id)a3
{
  if (!qword_100560790 || (id v5 = [(id)qword_100560790 get]) == 0) {
    JreThrowNullPointerException();
  }
  localeData = self->localeData_;
  return [v5 updateWithLibcoreIcuLocaleData:localeData withNSString:a3];
}

- (JavaUtilFormatter)init
{
  v3 = new_JavaLangStringBuilder_init();
  Default = (void *)JavaUtilLocale_getDefault();
  JavaUtilFormatter_initWithJavaLangAppendable_withJavaUtilLocale_((uint64_t)self, v3, Default);
  return self;
}

- (JavaUtilFormatter)initWithJavaLangAppendable:(id)a3
{
  Default = (void *)JavaUtilLocale_getDefault();
  JavaUtilFormatter_initWithJavaLangAppendable_withJavaUtilLocale_((uint64_t)self, a3, Default);
  return self;
}

- (JavaUtilFormatter)initWithJavaUtilLocale:(id)a3
{
  id v5 = new_JavaLangStringBuilder_init();
  JavaUtilFormatter_initWithJavaLangAppendable_withJavaUtilLocale_((uint64_t)self, v5, a3);
  return self;
}

- (JavaUtilFormatter)initWithJavaLangAppendable:(id)a3 withJavaUtilLocale:(id)a4
{
  return self;
}

- (JavaUtilFormatter)initWithNSString:(id)a3
{
  return self;
}

- (JavaUtilFormatter)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaUtilFormatter)initWithNSString:(id)a3 withNSString:(id)a4 withJavaUtilLocale:(id)a5
{
  v8 = new_JavaIoFile_initWithNSString_(a3);
  JavaUtilFormatter_initWithJavaIoFile_withNSString_withJavaUtilLocale_((uint64_t)self, v8, (__CFString *)a4, a5);
  return self;
}

- (JavaUtilFormatter)initWithJavaIoFile:(id)a3
{
  v4 = new_JavaIoFileOutputStream_initWithJavaIoFile_(a3);
  JavaUtilFormatter_initWithJavaIoOutputStream_((uint64_t)self, v4);
  return self;
}

- (JavaUtilFormatter)initWithJavaIoFile:(id)a3 withNSString:(id)a4
{
  Default = (void *)JavaUtilLocale_getDefault();
  JavaUtilFormatter_initWithJavaIoFile_withNSString_withJavaUtilLocale_((uint64_t)self, a3, (__CFString *)a4, Default);
  return self;
}

- (JavaUtilFormatter)initWithJavaIoFile:(id)a3 withNSString:(id)a4 withJavaUtilLocale:(id)a5
{
  return self;
}

- (JavaUtilFormatter)initWithJavaIoOutputStream:(id)a3
{
  return self;
}

- (JavaUtilFormatter)initWithJavaIoOutputStream:(id)a3 withNSString:(id)a4
{
  Default = (void *)JavaUtilLocale_getDefault();
  JavaUtilFormatter_initWithJavaIoOutputStream_withNSString_withJavaUtilLocale_((uint64_t)self, a3, (__CFString *)a4, Default);
  return self;
}

- (JavaUtilFormatter)initWithJavaIoOutputStream:(id)a3 withNSString:(id)a4 withJavaUtilLocale:(id)a5
{
  return self;
}

- (JavaUtilFormatter)initWithJavaIoPrintStream:(id)a3
{
  return self;
}

- (id)locale
{
  return self->locale_;
}

- (id)out
{
  return self->out_;
}

- (NSString)description
{
  sub_10014B91C((uint64_t)self);
  out = self->out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  return (NSString *)[(JavaLangAppendable *)out description];
}

- (void)flush
{
  sub_10014B91C((uint64_t)self);
  if ([(id)JavaIoFlushable_class_() isInstance:self->out_])
  {
    out = self->out_;
    v4 = (void *)JavaIoFlushable_class_();
    if (!out) {
      JreThrowNullPointerException();
    }
    if (([v4 isInstance:out] & 1) == 0) {
      JreThrowClassCastException();
    }
    [(JavaLangAppendable *)out flush];
  }
}

- (void)close
{
  if (!self->closed_)
  {
    self->closed_ = 1;
    if ([(id)JavaIoCloseable_class_() isInstance:self->out_])
    {
      out = self->out_;
      v4 = (void *)JavaIoCloseable_class_();
      if (!out) {
        JreThrowNullPointerException();
      }
      if (([v4 isInstance:out] & 1) == 0) {
        JreThrowClassCastException();
      }
      [(JavaLangAppendable *)out close];
    }
  }
}

- (id)ioException
{
  return self->lastIOException_;
}

- (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4
{
  return [(JavaUtilFormatter *)self formatWithJavaUtilLocale:self->locale_ withNSString:a3 withNSObjectArray:a4];
}

- (id)formatWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5
{
  id v7 = a3;
  p_locale = &self->locale_;
  locale = self->locale_;
  if (!a3)
  {
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    id v7 = (id)JavaUtilLocale_US_;
  }
  JreStrongAssign((id *)p_locale, v7);
  v11 = LibcoreIcuLocaleData_getWithJavaUtilLocale_(*p_locale);
  JreStrongAssign((id *)&self->localeData_, v11);
  sub_10014BC44((uint64_t)self, a4, (uint64_t)a5);
  JreStrongAssign((id *)p_locale, locale);
  return self;
}

- (void)doFormatWithNSString:(id)a3 withNSObjectArray:(id)a4
{
}

- (void)outputCharSequenceWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (id)getArgumentWithNSObjectArray:(id)a3 withInt:(int)a4 withJavaUtilFormatter_FormatSpecifierParser:(id)a5 withId:(id)a6 withBoolean:(BOOL)a7
{
  return (id)sub_10014BE9C((uint64_t)a3, *(uint64_t *)&a4, a5, (uint64_t)a6, a7);
}

- (id)transformWithJavaUtilFormatter_FormatToken:(id)a3 withId:(id)a4
{
  return sub_10014BF50((uint64_t)self, a3, a4);
}

- (id)badArgumentType
{
}

- (id)localizeDigitsWithJavaLangCharSequence:(id)a3
{
  return sub_10014C500((uint64_t)self, a3);
}

- (id)insertGroupingWithJavaLangCharSequence:(id)a3
{
  return sub_10014C5BC((uint64_t)self, a3);
}

- (id)transformFromPercent
{
  return sub_10014CA60((uint64_t)self, (JavaLangStringBuilder *)@"%", 0);
}

- (id)paddingWithJavaLangCharSequence:(id)a3 withInt:(int)a4
{
  return sub_10014CA60((uint64_t)self, (JavaLangStringBuilder *)a3, *(uint64_t *)&a4);
}

- (id)toStringBuilderWithJavaLangCharSequence:(id)a3
{
  return sub_10014CC0C(a3);
}

- (id)wrapParenthesesWithJavaLangStringBuilder:(id)a3
{
  return sub_10014CC98((uint64_t)self, (JavaLangStringBuilder *)a3);
}

- (id)transformFromNull
{
  formatToken = self->formatToken_;
  if (!formatToken) {
    JreThrowNullPointerException();
  }
  formatToken->flagZero_ = 0;
  return sub_10014CA60((uint64_t)self, (JavaLangStringBuilder *)@"null", 0);
}

- (BOOL)appendTWithJavaLangStringBuilder:(id)a3 withChar:(unsigned __int16)a4 withJavaUtilCalendar:(id)a5
{
  return sub_10014D4E8((uint64_t)self, a3, a4, a5);
}

- (int)to12HourWithInt:(int)a3
{
  if (a3) {
    return a3;
  }
  else {
    return 12;
  }
}

- (void)appendLocalizedWithJavaLangStringBuilder:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
}

- (void)transformEWithJavaLangStringBuilder:(id)a3
{
}

- (void)transformGWithJavaLangStringBuilder:(id)a3
{
}

- (void)transformFWithJavaLangStringBuilder:(id)a3
{
}

- (void)transformAWithJavaLangStringBuilder:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilFormatter;
  [(JavaUtilFormatter *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __int16 v4 = 48;
    long long v3 = *(_OWORD *)L"000000000";
    JreStrongAssignAndConsume((id *)&qword_100560788, +[IOSCharArray newArrayWithChars:&v3 count:9]);
    v2 = [JavaUtilFormatter__1 alloc];
    JavaLangThreadLocal_init((unint64_t)v2);
    JreStrongAssignAndConsume((id *)&qword_100560790, v2);
    atomic_store(1u, (unsigned __int8 *)&JavaUtilFormatter__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F32B0;
}

@end