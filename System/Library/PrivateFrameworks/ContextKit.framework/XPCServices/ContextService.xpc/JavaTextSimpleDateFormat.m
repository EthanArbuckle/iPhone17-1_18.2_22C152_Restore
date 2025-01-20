@interface JavaTextSimpleDateFormat
+ (const)__metadata;
+ (const)defaultPattern;
+ (id)convertPatternWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withBoolean:(BOOL)a6;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaTextSimpleDateFormat)formatWithJavaUtilDate:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5;
- (JavaTextSimpleDateFormat)init;
- (JavaTextSimpleDateFormat)initWithJavaUtilLocale:(id)a3;
- (JavaTextSimpleDateFormat)initWithNSString:(id)a3;
- (JavaTextSimpleDateFormat)initWithNSString:(id)a3 withJavaTextDateFormatSymbols:(id)a4;
- (JavaTextSimpleDateFormat)initWithNSString:(id)a3 withJavaUtilLocale:(id)a4;
- (id)clone;
- (id)errorWithJavaTextParsePosition:(id)a3 withInt:(int)a4 withJavaUtilTimeZone:(id)a5;
- (id)formatImplWithJavaUtilDate:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5 withJavaUtilList:(id)a6;
- (id)formatToCharacterIteratorImplWithJavaUtilDate:(id)a3;
- (id)formatToCharacterIteratorWithId:(id)a3;
- (id)get2DigitYearStart;
- (id)getDateFormatSymbols;
- (id)parseNumberWithInt:(int)a3 withNSString:(id)a4 withJavaTextParsePosition:(id)a5;
- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4;
- (id)toLocalizedPattern;
- (id)toPattern;
- (int)parseDayOfWeekWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (int)parseFractionalSecondsWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)parseMonthWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (int)parseNumberWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
- (int)parseTextWithNSString:(id)a3 withInt:(int)a4 withNSStringArray:(id)a5 withInt:(int)a6;
- (int)parseTimeZoneWithNSString:(id)a3 withInt:(int)a4;
- (int)parseWithNSString:(id)a3 withInt:(int)a4 withChar:(unsigned __int16)a5 withInt:(int)a6;
- (unint64_t)hash;
- (void)appendDayOfWeekWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (void)appendMillisecondsWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)appendMonthWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (void)appendNumberWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)appendNumericTimeZoneWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (void)appendTimeZoneWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (void)appendWithJavaLangStringBuffer:(id)a3 withJavaTextFieldPosition:(id)a4 withJavaUtilList:(id)a5 withChar:(unsigned __int16)a6 withInt:(int)a7;
- (void)applyLocalizedPatternWithNSString:(id)a3;
- (void)applyPatternWithNSString:(id)a3;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)set2DigitYearStartWithJavaUtilDate:(id)a3;
- (void)setDateFormatSymbolsWithJavaTextDateFormatSymbols:(id)a3;
- (void)validatePatternCharacterWithChar:(unsigned __int16)a3;
- (void)validatePatternWithNSString:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaTextSimpleDateFormat

- (JavaTextSimpleDateFormat)init
{
  return self;
}

- (JavaTextSimpleDateFormat)initWithNSString:(id)a3
{
  Default = (void *)JavaUtilLocale_getDefault();
  JavaTextSimpleDateFormat_initWithNSString_withJavaUtilLocale_((uint64_t)self, a3, Default);
  return self;
}

- (void)validatePatternWithNSString:(id)a3
{
}

- (void)validatePatternCharacterWithChar:(unsigned __int16)a3
{
}

- (JavaTextSimpleDateFormat)initWithNSString:(id)a3 withJavaTextDateFormatSymbols:(id)a4
{
  return self;
}

- (JavaTextSimpleDateFormat)initWithNSString:(id)a3 withJavaUtilLocale:(id)a4
{
  return self;
}

- (JavaTextSimpleDateFormat)initWithJavaUtilLocale:(id)a3
{
  return self;
}

- (void)applyLocalizedPatternWithNSString:(id)a3
{
  if (!self->formatData_) {
    JreThrowNullPointerException();
  }
  p_pattern = &self->pattern_;
  id v5 = [(JavaTextDateFormatSymbols *)self->formatData_ getLocalPatternChars];
  v6 = sub_10020D1BC(a3, v5, JavaTextSimpleDateFormat_PATTERN_CHARS_, 1);
  JreStrongAssign((id *)p_pattern, v6);
}

- (void)applyPatternWithNSString:(id)a3
{
  sub_10020CCC8(a3);
  JreStrongAssign((id *)&self->pattern_, a3);
}

- (id)clone
{
  v9.receiver = self;
  v9.super_class = (Class)JavaTextSimpleDateFormat;
  v3 = [(JavaTextDateFormat *)&v9 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  formatData = self->formatData_;
  if (!formatData) {
    goto LABEL_8;
  }
  id v5 = [(JavaTextDateFormatSymbols *)formatData clone];
  objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_9:
    }
      JreThrowClassCastException();
  }
  JreStrongAssign(v3 + 4, v5);
  defaultCenturyStart = self->defaultCenturyStart_;
  if (!defaultCenturyStart) {
LABEL_8:
  }
    JreThrowNullPointerException();
  v7 = new_JavaUtilDate_initWithLong_([(JavaUtilDate *)defaultCenturyStart getTime]);
  JreStrongAssignAndConsume(v3 + 6, v7);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    objc_opt_class();
    if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    v9.receiver = self;
    v9.super_class = (Class)JavaTextSimpleDateFormat;
    unsigned int v5 = [(JavaTextDateFormat *)&v9 isEqual:a3];
    if (v5)
    {
      pattern = self->pattern_;
      if (!pattern || !a3) {
        goto LABEL_14;
      }
      unsigned int v5 = [(NSString *)pattern isEqual:*((void *)a3 + 3)];
      if (!v5) {
        return v5;
      }
      formatData = self->formatData_;
      if (!formatData) {
LABEL_14:
      }
        JreThrowNullPointerException();
      LOBYTE(v5) = [(JavaTextDateFormatSymbols *)formatData isEqual:*((void *)a3 + 4)];
    }
  }
  return v5;
}

- (id)formatToCharacterIteratorWithId:(id)a3
{
  if (!a3)
  {
    v8 = new_JavaLangNullPointerException_initWithNSString_(@"object == null");
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = self;
      v6 = (JavaUtilDate *)a3;
      goto LABEL_8;
    }
LABEL_11:
    JreThrowClassCastException();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [a3 getClass];
    CFStringRef v16 = JreStrcat("$@", v9, v10, v11, v12, v13, v14, v15, @"Bad class: ");
    v8 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v16);
LABEL_14:
    objc_exception_throw(v8);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  v6 = new_JavaUtilDate_initWithLong_((int64_t)[a3 longLongValue]);
  unsigned int v5 = self;
LABEL_8:
  return sub_10020D6C8((uint64_t)v5, (uint64_t)v6);
}

- (id)formatToCharacterIteratorImplWithJavaUtilDate:(id)a3
{
  return sub_10020D6C8((uint64_t)self, (uint64_t)a3);
}

- (id)formatImplWithJavaUtilDate:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5 withJavaUtilList:(id)a6
{
  return sub_10020D864((uint64_t)self, (uint64_t)a3, a4, a5, a6);
}

- (void)appendWithJavaLangStringBuffer:(id)a3 withJavaTextFieldPosition:(id)a4 withJavaUtilList:(id)a5 withChar:(unsigned __int16)a6 withInt:(int)a7
{
}

- (void)appendDayOfWeekWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
}

- (void)appendMonthWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
}

- (void)appendTimeZoneWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
}

- (void)appendNumericTimeZoneWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
}

- (void)appendMillisecondsWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)appendNumberWithJavaLangStringBuffer:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (id)errorWithJavaTextParsePosition:(id)a3 withInt:(int)a4 withJavaUtilTimeZone:(id)a5
{
  if (!a3 || ([a3 setErrorIndexWithInt:*(void *)&a4], (calendar = self->super.calendar_) == 0)) {
    JreThrowNullPointerException();
  }
  [(JavaUtilCalendar *)calendar setTimeZoneWithJavaUtilTimeZone:a5];
  return 0;
}

- (JavaTextSimpleDateFormat)formatWithJavaUtilDate:(id)a3 withJavaLangStringBuffer:(id)a4 withJavaTextFieldPosition:(id)a5
{
  return (JavaTextSimpleDateFormat *)sub_10020D864((uint64_t)self, (uint64_t)a3, a4, a5, 0);
}

- (id)get2DigitYearStart
{
  defaultCenturyStart = self->defaultCenturyStart_;
  if (!defaultCenturyStart) {
    JreThrowNullPointerException();
  }
  id v3 = [(JavaUtilDate *)defaultCenturyStart clone];
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v3;
}

- (id)getDateFormatSymbols
{
  formatData = self->formatData_;
  if (!formatData) {
    JreThrowNullPointerException();
  }
  id v3 = [(JavaTextDateFormatSymbols *)formatData clone];
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v3;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)JavaTextSimpleDateFormat;
  unsigned int v3 = [(JavaTextDateFormat *)&v7 hash];
  pattern = self->pattern_;
  if (!pattern || (unsigned int v5 = [(NSString *)pattern hash], !self->formatData_)) {
    JreThrowNullPointerException();
  }
  return (int)(v5 + v3 + [(JavaTextDateFormatSymbols *)self->formatData_ hash]
                       + self->creationYear_);
}

- (int)parseWithNSString:(id)a3 withInt:(int)a4 withChar:(unsigned __int16)a5 withInt:(int)a6
{
  return sub_10020EB04((uint64_t)self, a3, *(uint64_t *)&a4, a5, a6);
}

- (int)parseFractionalSecondsWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return sub_10020EFF0((uint64_t)self, a3, a4, a5);
}

- (int)parseDayOfWeekWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return sub_10020F110((uint64_t)self, a3, *(uint64_t *)&a4, a5);
}

- (int)parseMonthWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
  return sub_10020F228((uint64_t)self, a3, *(uint64_t *)&a4, a5, a6, a7);
}

- (id)parseWithNSString:(id)a3 withJavaTextParsePosition:(id)a4
{
  if (!a4) {
    goto LABEL_47;
  }
  id v4 = a4;
  id v7 = [a4 getIndex];
  if (!a3) {
    goto LABEL_47;
  }
  unint64_t v8 = (unint64_t)v7;
  int v29 = [a3 length];
  calendar = self->super.calendar_;
  if (!calendar) {
    goto LABEL_47;
  }
  [(JavaUtilCalendar *)calendar clear];
  id v10 = [(JavaUtilCalendar *)self->super.calendar_ getTimeZone];
  pattern = self->pattern_;
  if (!pattern) {
    goto LABEL_47;
  }
  int v12 = [(NSString *)pattern length];
  if (v12 < 1) {
    goto LABEL_41;
  }
  v28 = v4;
  id v27 = v10;
  uint64_t v13 = 0;
  int v14 = 0;
  char v15 = 0;
  int v16 = -1;
  while (1)
  {
    unsigned int v17 = -[NSString charAtWithInt:](self->pattern_, "charAtWithInt:", v13, v27);
    if (v17 == 39)
    {
      if (v14 >= 1)
      {
        unint64_t v8 = sub_10020EB04((uint64_t)self, a3, v8, (unsigned __int16)v16, v14);
        if ((v8 & 0x80000000) != 0) {
          goto LABEL_42;
        }
        int v14 = 0;
      }
      if (v16 == 39)
      {
        if ((int)v8 >= v29 || [a3 charAtWithInt:v8] != 39) {
          goto LABEL_35;
        }
        unint64_t v8 = (v8 + 1);
        int v16 = -1;
      }
      else
      {
        int v16 = 39;
      }
      v15 ^= 1u;
      goto LABEL_30;
    }
    unsigned int v18 = v17;
    if ((v15 & 1) != 0 || (v16 != v17 ? (BOOL v19 = (v17 & 0xFFFFFFDF) - 65 > 0x19) : (BOOL v19 = 0), v19))
    {
      if (v14 >= 1)
      {
        unint64_t v8 = sub_10020EB04((uint64_t)self, a3, v8, (unsigned __int16)v16, v14);
        if ((v8 & 0x80000000) != 0) {
          goto LABEL_42;
        }
        int v14 = 0;
      }
      if ((int)v8 >= v29 || [a3 charAtWithInt:v8] != v18)
      {
LABEL_35:
        v20 = v28;
        unint64_t v21 = v8;
        goto LABEL_43;
      }
      unint64_t v8 = (v8 + 1);
      int v16 = -1;
      goto LABEL_30;
    }
    if (v16 != v17) {
      break;
    }
    char v15 = 0;
    ++v14;
LABEL_30:
    uint64_t v13 = (v13 + 1);
    if (v12 == v13)
    {
      if (v14 < 1)
      {
        id v10 = v27;
        id v4 = v28;
      }
      else
      {
        unint64_t v22 = sub_10020EB04((uint64_t)self, a3, v8, (unsigned __int16)v16, v14);
        unint64_t v8 = v22;
        id v10 = v27;
        id v4 = v28;
        if ((v22 & 0x80000000) != 0)
        {
          [v28 setErrorIndexWithInt:~v22];
          v23 = self->super.calendar_;
          if (v23)
          {
            id v24 = v27;
            goto LABEL_45;
          }
LABEL_47:
          JreThrowNullPointerException();
        }
      }
LABEL_41:
      id v25 = [(JavaUtilCalendar *)self->super.calendar_ getTime];
      [v4 setIndexWithInt:v8];
      [(JavaUtilCalendar *)self->super.calendar_ setTimeZoneWithJavaUtilTimeZone:v10];
      return v25;
    }
  }
  if (v14 < 1 || (unint64_t v8 = sub_10020EB04((uint64_t)self, a3, v8, (unsigned __int16)v16, -v14), (v8 & 0x80000000) == 0))
  {
    char v15 = 0;
    int v14 = 1;
    int v16 = v18;
    goto LABEL_30;
  }
LABEL_42:
  unint64_t v21 = ~v8;
  v20 = v28;
LABEL_43:
  [v20 setErrorIndexWithInt:v21];
  v23 = self->super.calendar_;
  if (!v23) {
    goto LABEL_47;
  }
  id v24 = v27;
LABEL_45:
  [(JavaUtilCalendar *)v23 setTimeZoneWithJavaUtilTimeZone:v24];
  return 0;
}

- (id)parseNumberWithInt:(int)a3 withNSString:(id)a4 withJavaTextParsePosition:(id)a5
{
  return sub_10020F694((uint64_t)self, a3, a4, a5);
}

- (int)parseNumberWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return sub_10020F84C((uint64_t)self, a3, a4, a5, *(uint64_t *)&a6, a7);
}

- (int)parseTextWithNSString:(id)a3 withInt:(int)a4 withNSStringArray:(id)a5 withInt:(int)a6
{
  return sub_10020F928((uint64_t)self, a3, *(uint64_t *)&a4, (uint64_t)a5, a6);
}

- (int)parseTimeZoneWithNSString:(id)a3 withInt:(int)a4
{
  return sub_10020FAD0((uint64_t)self, a3, *(uint64_t *)&a4);
}

- (void)set2DigitYearStartWithJavaUtilDate:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 clone];
  objc_opt_class();
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign((id *)&self->defaultCenturyStart_, v4);
  unsigned int v5 = new_JavaUtilGregorianCalendar_init();
  [(JavaUtilCalendar *)v5 setTimeWithJavaUtilDate:self->defaultCenturyStart_];
  self->creationYear_ = [(JavaUtilCalendar *)v5 getWithInt:1];
}

- (void)setDateFormatSymbolsWithJavaTextDateFormatSymbols:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 clone];
  objc_opt_class();
  if (v4 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  JreStrongAssign((id *)&self->formatData_, v4);
}

- (id)toLocalizedPattern
{
  if (!self->formatData_) {
    JreThrowNullPointerException();
  }
  v2 = JavaTextSimpleDateFormat_PATTERN_CHARS_;
  pattern = self->pattern_;
  id v4 = [(JavaTextDateFormatSymbols *)self->formatData_ getLocalPatternChars];
  return sub_10020D1BC(pattern, v2, v4, 0);
}

+ (id)convertPatternWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withBoolean:(BOOL)a6
{
  return sub_10020D1BC(a3, a4, a5, a6);
}

- (id)toPattern
{
  return self->pattern_;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3 || (id v5 = [a3 putFields]) == 0) {
    JreThrowNullPointerException();
  }
  v6 = v5;
  [v5 putWithNSString:@"defaultCenturyStart" withId:self->defaultCenturyStart_];
  [v6 putWithNSString:@"formatData" withId:self->formatData_];
  [v6 putWithNSString:@"pattern" withId:self->pattern_];
  [v6 putWithNSString:@"serialVersionOnStream" withInt:1];
  [a3 writeFields];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3 || (id v4 = [a3 readFields]) == 0) {
    JreThrowNullPointerException();
  }
  id v5 = v4;
  int v6 = [v4 getWithNSString:@"serialVersionOnStream" withInt:0];
  id v7 = new_JavaUtilDate_init();
  if (v6 >= 1)
  {
    id v7 = (JavaUtilDate *)[v5 getWithNSString:@"defaultCenturyStart" withId:v7];
    objc_opt_class();
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
    }
  }
  if (([(JavaTextSimpleDateFormat *)self set2DigitYearStartWithJavaUtilDate:v7],
        id v8 = [v5 getWithNSString:@"formatData" withId:0],
        objc_opt_class(),
        v8)
    && (objc_opt_isKindOfClass() & 1) == 0
    || (JreStrongAssign((id *)&self->formatData_, v8),
        id v9 = [v5 getWithNSString:@"pattern" withId:&stru_10048C1F8],
        objc_opt_class(),
        v9)
    && (objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:
    JreThrowClassCastException();
  }
  JreStrongAssign((id *)&self->pattern_, v9);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextSimpleDateFormat;
  [(JavaTextDateFormat *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (JavaLangRefWeakReference *)JavaUtilDate_class_();
    v6[0] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"defaultCenturyStart", v2);
    objc_super v3 = (JavaLangRefWeakReference *)JavaTextDateFormatSymbols_class_();
    v6[1] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"formatData", v3);
    id v4 = (JavaLangRefWeakReference *)NSString_class_();
    v6[2] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"pattern", v4);
    v6[3] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"serialVersionOnStream", (JavaLangRefWeakReference *)+[IOSClass intClass]);
    id v5 = +[IOSObjectArray newArrayWithObjects:v6 count:4 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&qword_100560EA0, v5);
    atomic_store(1u, (unsigned __int8 *)JavaTextSimpleDateFormat__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100446568;
}

+ (const)defaultPattern
{
  if ((atomic_load_explicit(JavaTextSimpleDateFormat__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  Default = (void *)JavaUtilLocale_getDefault();
  v1 = LibcoreIcuLocaleData_getWithJavaUtilLocale_(Default);
  if (!v1) {
    JreThrowNullPointerException();
  }
  v2 = v1;
  id v3 = [(LibcoreIcuLocaleData *)v1 getDateFormatWithInt:3];
  [(LibcoreIcuLocaleData *)v2 getTimeFormatWithInt:3];
  return JreStrcat("$C$", v4, v5, v6, v7, v8, v9, v10, v3);
}

@end