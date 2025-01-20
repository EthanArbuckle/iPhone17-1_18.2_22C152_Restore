@interface JavaTextDateFormat
+ (const)__metadata;
+ (id)getDateInstance;
+ (id)getDateInstanceWithInt:(int)a3;
+ (id)getDateInstanceWithInt:(int)a3 withJavaUtilLocale:(id)a4;
+ (id)getDateTimeInstance;
+ (id)getDateTimeInstanceWithInt:(int)a3 withInt:(int)a4;
+ (id)getDateTimeInstanceWithInt:(int)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5;
+ (id)getInstance;
+ (id)getTimeInstance;
+ (id)getTimeInstanceWithInt:(int)a3;
+ (id)getTimeInstanceWithInt:(int)a3 withJavaUtilLocale:(id)a4;
+ (void)checkDateStyleWithInt:(int)a3;
+ (void)checkTimeStyleWithInt:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLenient;
- (JavaTextDateFormat)formatWithId:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextDateFormat)formatWithJavaUtilDate:(id)a3;
- (JavaTextDateFormat)formatWithJavaUtilDate:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextDateFormat)init;
- (id)clone;
- (id)getCalendar;
- (id)getNumberFormat;
- (id)getTimeZone;
- (id)parseWithNSString:(id)a3;
- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)setCalendarWithJavaUtilCalendar:(id)a3;
- (void)setLenientWithBoolean:(BOOL)a3;
- (void)setNumberFormatWithJavaTextNumberFormat:(id)a3;
- (void)setTimeZoneWithJavaUtilTimeZone:(id)a3;
@end

@implementation JavaTextDateFormat

- (JavaTextDateFormat)init
{
  return self;
}

- (id)clone
{
  v9.receiver = self;
  v9.super_class = (Class)JavaTextDateFormat;
  v3 = [(JavaTextFormat *)&v9 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  calendar = self->calendar_;
  if (!calendar) {
    goto LABEL_10;
  }
  id v5 = [(JavaUtilCalendar *)calendar clone];
  objc_opt_class();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_11:
  }
    JreThrowClassCastException();
  JreStrongAssign(v3 + 1, v5);
  numberFormat = self->numberFormat_;
  if (!numberFormat) {
LABEL_10:
  }
    JreThrowNullPointerException();
  id v7 = [(JavaTextNumberFormat *)numberFormat clone];
  objc_opt_class();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  JreStrongAssign(v3 + 2, v7);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    objc_opt_class();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    numberFormat = self->numberFormat_;
    if (!numberFormat) {
      goto LABEL_16;
    }
    unsigned int v6 = [(JavaTextNumberFormat *)numberFormat isEqual:*((void *)a3 + 2)];
    if (!v6) {
      return v6;
    }
    calendar = self->calendar_;
    if (!calendar || (id v8 = [(JavaUtilCalendar *)calendar getTimeZone]) == 0) {
LABEL_16:
    }
      JreThrowNullPointerException();
    unsigned int v6 = objc_msgSend(v8, "isEqual:", objc_msgSend(*((id *)a3 + 1), "getTimeZone"));
    if (!v6) {
      return v6;
    }
    unsigned int v9 = [(JavaUtilCalendar *)self->calendar_ getFirstDayOfWeek];
    if (v9 != [*((id *)a3 + 1) getFirstDayOfWeek]
      || (unsigned int v10 = [(JavaUtilCalendar *)self->calendar_ getMinimalDaysInFirstWeek],
          v10 != [*((id *)a3 + 1) getMinimalDaysInFirstWeek]))
    {
LABEL_14:
      LOBYTE(v6) = 0;
      return v6;
    }
    unsigned __int8 v11 = [(JavaUtilCalendar *)self->calendar_ isLenient];
    LOBYTE(v6) = v11 ^ [*((id *)a3 + 1) isLenient] ^ 1;
  }
  return v6;
}

- (JavaTextDateFormat)formatWithId:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (a3)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        a3 = new_JavaUtilDate_initWithLong_((int64_t)[a3 longLongValue]);
        goto LABEL_9;
      }
    }
    else if (a3)
    {
      [a3 getClass];
      CFStringRef v17 = JreStrcat("$@", v10, v11, v12, v13, v14, v15, v16, @"Bad class: ");
      v18 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v17);
      objc_exception_throw(v18);
    }
    JreThrowNullPointerException();
  }
  objc_opt_class();
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_12:
  }
    JreThrowClassCastException();
LABEL_9:
  return [(JavaTextDateFormat *)self formatWithJavaUtilDate:a3 withJavaLangStringBuffer:a4 withJavaTextFieldPosition:a5];
}

- (JavaTextDateFormat)formatWithJavaUtilDate:(id)a3
{
  id v5 = new_JavaLangStringBuffer_init();
  unsigned int v6 = [(JavaTextDateFormat *)self formatWithJavaUtilDate:a3 withJavaLangStringBuffer:v5 withJavaTextFieldPosition:new_JavaTextFieldPosition_initWithInt_(0)];
  if (!v6) {
    JreThrowNullPointerException();
  }
  return (JavaTextDateFormat *)[(JavaTextDateFormat *)v6 description];
}

- (JavaTextDateFormat)formatWithJavaUtilDate:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  return 0;
}

- (id)getCalendar
{
  return self->calendar_;
}

+ (id)getDateInstance
{
  Default = (void *)JavaUtilLocale_getDefault();
  return JavaTextDateFormat_getDateInstanceWithInt_withJavaUtilLocale_(2, Default, v3, v4, v5, v6, v7, v8);
}

+ (id)getDateInstanceWithInt:(int)a3
{
  uint64_t v8 = *(void *)&a3;
  sub_100284540(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  Default = (void *)JavaUtilLocale_getDefault();
  return JavaTextDateFormat_getDateInstanceWithInt_withJavaUtilLocale_(v8, Default, v10, v11, v12, v13, v14, v15);
}

+ (id)getDateInstanceWithInt:(int)a3 withJavaUtilLocale:(id)a4
{
  return JavaTextDateFormat_getDateInstanceWithInt_withJavaUtilLocale_(*(uint64_t *)&a3, a4, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
}

+ (id)getDateTimeInstance
{
  return JavaTextDateFormat_getDateTimeInstanceWithInt_withInt_(2, 2, v2, v3, v4, v5, v6, v7);
}

+ (id)getDateTimeInstanceWithInt:(int)a3 withInt:(int)a4
{
  return JavaTextDateFormat_getDateTimeInstanceWithInt_withInt_(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)getDateTimeInstanceWithInt:(int)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5
{
  return JavaTextDateFormat_getDateTimeInstanceWithInt_withInt_withJavaUtilLocale_(*(uint64_t *)&a3, *(uint64_t *)&a4, a5, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
}

+ (id)getInstance
{
  return JavaTextDateFormat_getDateTimeInstanceWithInt_withInt_(3, 3, v2, v3, v4, v5, v6, v7);
}

- (id)getNumberFormat
{
  return self->numberFormat_;
}

+ (id)getTimeInstance
{
  Default = (void *)JavaUtilLocale_getDefault();
  return JavaTextDateFormat_getTimeInstanceWithInt_withJavaUtilLocale_(2, Default, v3, v4, v5, v6, v7, v8);
}

+ (id)getTimeInstanceWithInt:(int)a3
{
  uint64_t v8 = *(void *)&a3;
  sub_100284588(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  Default = (void *)JavaUtilLocale_getDefault();
  return JavaTextDateFormat_getTimeInstanceWithInt_withJavaUtilLocale_(v8, Default, v10, v11, v12, v13, v14, v15);
}

+ (id)getTimeInstanceWithInt:(int)a3 withJavaUtilLocale:(id)a4
{
  return JavaTextDateFormat_getTimeInstanceWithInt_withJavaUtilLocale_(*(uint64_t *)&a3, a4, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
}

- (id)getTimeZone
{
  calendar = self->calendar_;
  if (!calendar) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCalendar *)calendar getTimeZone];
}

- (unint64_t)hash
{
  calendar = self->calendar_;
  if (!calendar
    || (unsigned int v4 = [(JavaUtilCalendar *)calendar getFirstDayOfWeek],
        unsigned int v5 = [(JavaUtilCalendar *)self->calendar_ getMinimalDaysInFirstWeek],
        (id v6 = [(JavaUtilCalendar *)self->calendar_ getTimeZone]) == 0)
    || (unsigned int v7 = [v6 hash],
        unsigned int v8 = [(JavaUtilCalendar *)self->calendar_ isLenient],
        (numberFormat = self->numberFormat_) == 0))
  {
    JreThrowNullPointerException();
  }
  if (v8) {
    int v10 = 1231;
  }
  else {
    int v10 = 1237;
  }
  return (int)(v5 + v4 + v7 + v10 + [(JavaTextNumberFormat *)numberFormat hash]);
}

- (BOOL)isLenient
{
  calendar = self->calendar_;
  if (!calendar) {
    JreThrowNullPointerException();
  }
  return [(JavaUtilCalendar *)calendar isLenient];
}

- (id)parseWithNSString:(id)a3
{
  unsigned int v5 = new_JavaTextParsePosition_initWithInt_(0);
  id v6 = [(JavaTextDateFormat *)self parseWithNSString:a3 withJavaTextParsePosition:v5];
  if (![(JavaTextParsePosition *)v5 getIndex])
  {
    uint64_t v15 = (__CFString *)JreStrcat("$$C", v7, v8, v9, v10, v11, v12, v13, @"Unparseable date: \"");
    uint64_t v16 = new_JavaTextParseException_initWithNSString_withInt_(v15, [(JavaTextParsePosition *)v5 getErrorIndex]);
    objc_exception_throw(v16);
  }
  return v6;
}

- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4
{
  return 0;
}

- (void)setCalendarWithJavaUtilCalendar:(id)a3
{
}

- (void)setLenientWithBoolean:(BOOL)a3
{
  calendar = self->calendar_;
  if (!calendar) {
    JreThrowNullPointerException();
  }
  [(JavaUtilCalendar *)calendar setLenientWithBoolean:a3];
}

- (void)setNumberFormatWithJavaTextNumberFormat:(id)a3
{
}

- (void)setTimeZoneWithJavaUtilTimeZone:(id)a3
{
  calendar = self->calendar_;
  if (!calendar) {
    JreThrowNullPointerException();
  }
  [(JavaUtilCalendar *)calendar setTimeZoneWithJavaUtilTimeZone:a3];
}

+ (void)checkDateStyleWithInt:(int)a3
{
  sub_100284540(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (void)checkTimeStyleWithInt:(int)a3
{
  sub_100284588(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextDateFormat;
  [(JavaTextDateFormat *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047CA78;
}

@end