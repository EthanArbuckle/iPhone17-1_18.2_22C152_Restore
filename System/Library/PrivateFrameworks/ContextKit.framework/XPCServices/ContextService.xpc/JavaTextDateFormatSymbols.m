@interface JavaTextDateFormatSymbols
+ (BOOL)timeZoneStringsEqualWithJavaTextDateFormatSymbols:(id)a3 withJavaTextDateFormatSymbols:(id)a4;
+ (const)__metadata;
+ (id)clone2dStringArrayWithNSStringArray2:(id)a3;
+ (id)getInstance;
+ (id)getInstanceWithJavaUtilLocale:(id)a3;
- (BOOL)isEqual:(id)a3;
- (JavaTextDateFormatSymbols)init;
- (JavaTextDateFormatSymbols)initWithJavaUtilLocale:(id)a3;
- (NSString)description;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getAmPmStrings;
- (id)getEras;
- (id)getLocalPatternChars;
- (id)getMonths;
- (id)getShortMonths;
- (id)getShortWeekdays;
- (id)getTimeZoneDisplayNameWithJavaUtilTimeZone:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5;
- (id)getWeekdays;
- (id)getZoneStrings;
- (id)internalZoneStrings;
- (unint64_t)hash;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)setAmPmStringsWithNSStringArray:(id)a3;
- (void)setErasWithNSStringArray:(id)a3;
- (void)setLocalPatternCharsWithNSString:(id)a3;
- (void)setMonthsWithNSStringArray:(id)a3;
- (void)setShortMonthsWithNSStringArray:(id)a3;
- (void)setShortWeekdaysWithNSStringArray:(id)a3;
- (void)setWeekdaysWithNSStringArray:(id)a3;
- (void)setZoneStringsWithNSStringArray2:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaTextDateFormatSymbols

- (id)internalZoneStrings
{
  objc_sync_enter(self);
  zoneStrings = self->zoneStrings_;
  if (!zoneStrings)
  {
    id ZoneStringsWithJavaUtilLocale = LibcoreIcuTimeZoneNames_getZoneStringsWithJavaUtilLocale_((uint64_t)self->locale_);
    JreStrongAssign((id *)&self->zoneStrings_, ZoneStringsWithJavaUtilLocale);
    zoneStrings = self->zoneStrings_;
  }
  objc_sync_exit(self);
  return zoneStrings;
}

- (JavaTextDateFormatSymbols)init
{
  Default = (void *)JavaUtilLocale_getDefault();
  JavaTextDateFormatSymbols_initWithJavaUtilLocale_((id *)&self->super.isa, Default);
  return self;
}

- (JavaTextDateFormatSymbols)initWithJavaUtilLocale:(id)a3
{
  return self;
}

+ (id)getInstance
{
  Default = (void *)JavaUtilLocale_getDefault();
  return JavaTextDateFormatSymbols_getInstanceWithJavaUtilLocale_(Default);
}

+ (id)getInstanceWithJavaUtilLocale:(id)a3
{
  return JavaTextDateFormatSymbols_getInstanceWithJavaUtilLocale_(a3);
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  v4 = LibcoreIcuLocaleData_getWithJavaUtilLocale_(self->locale_);
  JreStrongAssign((id *)&self->localeData_, v4);
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  [(JavaTextDateFormatSymbols *)self internalZoneStrings];
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
}

- (id)clone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextDateFormatSymbols;
  return [(JavaTextDateFormatSymbols *)&v3 clone];
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
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (!a3) {
        goto LABEL_20;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      localPatternChars = self->localPatternChars_;
      if (!localPatternChars) {
LABEL_20:
      }
        JreThrowNullPointerException();
      unsigned int v6 = [(NSString *)localPatternChars isEqual:*((void *)a3 + 11)];
      if (v6)
      {
        unsigned int v6 = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)self->ampms_, *((void *)a3 + 1));
        if (v6)
        {
          unsigned int v6 = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)self->eras_, *((void *)a3 + 2));
          if (v6)
          {
            unsigned int v6 = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)self->months_, *((void *)a3 + 3));
            if (v6)
            {
              unsigned int v6 = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)self->shortMonths_, *((void *)a3 + 4));
              if (v6)
              {
                unsigned int v6 = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)self->shortWeekdays_, *((void *)a3 + 5));
                if (v6)
                {
                  unsigned int v6 = JavaUtilArrays_equalsWithNSObjectArray_withNSObjectArray_((uint64_t)self->weekdays_, *((void *)a3 + 6));
                  if (v6)
                  {
                    LOBYTE(v6) = sub_10029EC68(self, a3);
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

+ (BOOL)timeZoneStringsEqualWithJavaTextDateFormatSymbols:(id)a3 withJavaTextDateFormatSymbols:(id)a4
{
  return sub_10029EC68(a3, a4);
}

- (NSString)description
{
  id v3 = objc_msgSend(-[JavaTextDateFormatSymbols getClass](self, "getClass"), "getName");
  JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)self->ampms_);
  JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)self->eras_);
  JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)self->months_);
  JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)self->shortMonths_);
  JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)self->shortWeekdays_);
  JavaUtilArrays_toStringWithNSObjectArray_((uint64_t)self->weekdays_);
  v4 = [(JavaTextDateFormatSymbols *)self internalZoneStrings];
  if (!v4) {
    JreThrowNullPointerException();
  }
  v5 = v4;
  uint64_t v6 = v4[2];
  if ((int)v6 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 0);
  }
  JavaUtilArrays_toStringWithNSObjectArray_(*((void *)v5 + 3));
  return (NSString *)JreStrcat("$$$$Z$$$$$$$$$$$$$$$", v7, v8, v9, v10, v11, v12, v13, v3);
}

- (id)getAmPmStrings
{
  ampms = self->ampms_;
  if (!ampms) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)ampms clone];
}

- (id)getEras
{
  eras = self->eras_;
  if (!eras) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)eras clone];
}

- (id)getLocalPatternChars
{
  return self->localPatternChars_;
}

- (id)getMonths
{
  months = self->months_;
  if (!months) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)months clone];
}

- (id)getShortMonths
{
  shortMonths = self->shortMonths_;
  if (!shortMonths) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)shortMonths clone];
}

- (id)getShortWeekdays
{
  shortWeekdays = self->shortWeekdays_;
  if (!shortWeekdays) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)shortWeekdays clone];
}

- (id)getWeekdays
{
  weekdays = self->weekdays_;
  if (!weekdays) {
    JreThrowNullPointerException();
  }
  return [(IOSArray *)weekdays clone];
}

- (id)getZoneStrings
{
  id v3 = sub_10029F1BC((uint64_t)[(JavaTextDateFormatSymbols *)self internalZoneStrings]);
  if (!v3) {
LABEL_28:
  }
    JreThrowNullPointerException();
  v4 = v3;
  p_elementType = (uint64_t *)&v3->elementType_;
  unint64_t v6 = (unint64_t)&(&v3->elementType_)[v3->super.size_];
  while ((unint64_t)p_elementType < v6)
  {
    uint64_t v8 = *p_elementType++;
    uint64_t v7 = v8;
    if (!v8) {
      goto LABEL_28;
    }
    uint64_t v9 = *(unsigned int *)(v7 + 8);
    if ((int)v9 < 1) {
      IOSArray_throwOutOfBoundsWithMsg(v9, 0);
    }
    uint64_t v10 = *(void **)(v7 + 24);
    if ((int)v9 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v9, 1);
    }
    if (!*(void *)(v7 + 32))
    {
      id TimeZoneWithNSString = JavaUtilTimeZone_getTimeZoneWithNSString_(v10);
      if (!TimeZoneWithNSString) {
        goto LABEL_28;
      }
      IOSObjectArray_Set(v7, 1, [TimeZoneWithNSString getDisplayNameWithBoolean:0 withInt:1 withJavaUtilLocale:self->locale_]);
    }
    uint64_t v12 = *(unsigned int *)(v7 + 8);
    if ((int)v12 <= 2) {
      IOSArray_throwOutOfBoundsWithMsg(v12, 2);
    }
    if (!*(void *)(v7 + 40))
    {
      id v13 = JavaUtilTimeZone_getTimeZoneWithNSString_(v10);
      if (!v13) {
        goto LABEL_28;
      }
      IOSObjectArray_Set(v7, 2, [v13 getDisplayNameWithBoolean:0 withInt:0 withJavaUtilLocale:self->locale_]);
    }
    uint64_t v14 = *(unsigned int *)(v7 + 8);
    if ((int)v14 <= 3) {
      IOSArray_throwOutOfBoundsWithMsg(v14, 3);
    }
    if (!*(void *)(v7 + 48))
    {
      id v15 = JavaUtilTimeZone_getTimeZoneWithNSString_(v10);
      if (!v15) {
        goto LABEL_28;
      }
      IOSObjectArray_Set(v7, 3, [v15 getDisplayNameWithBoolean:1 withInt:1 withJavaUtilLocale:self->locale_]);
    }
    uint64_t v16 = *(unsigned int *)(v7 + 8);
    if ((int)v16 <= 4) {
      IOSArray_throwOutOfBoundsWithMsg(v16, 4);
    }
    if (!*(void *)(v7 + 56))
    {
      id v17 = JavaUtilTimeZone_getTimeZoneWithNSString_(v10);
      if (!v17) {
        goto LABEL_28;
      }
      IOSObjectArray_Set(v7, 4, [v17 getDisplayNameWithBoolean:1 withInt:0 withJavaUtilLocale:self->locale_]);
    }
  }
  return v4;
}

+ (id)clone2dStringArrayWithNSStringArray2:(id)a3
{
  return sub_10029F1BC((uint64_t)a3);
}

- (unint64_t)hash
{
  id v3 = [(JavaTextDateFormatSymbols *)self internalZoneStrings];
  localPatternChars = self->localPatternChars_;
  if (!localPatternChars) {
    goto LABEL_43;
  }
  unsigned int v5 = [(NSString *)localPatternChars hash];
  ampms = self->ampms_;
  if (!ampms) {
    goto LABEL_43;
  }
  signed int v7 = v5;
  p_elementType = (void **)&ampms->elementType_;
  unint64_t v9 = (unint64_t)&(&ampms->elementType_)[ampms->super.size_];
  while ((unint64_t)p_elementType < v9)
  {
    uint64_t v10 = *p_elementType;
    if (!*p_elementType) {
      goto LABEL_43;
    }
    ++p_elementType;
    v7 += [v10 hash];
  }
  eras = self->eras_;
  if (!eras) {
    goto LABEL_43;
  }
  uint64_t v12 = (void **)&eras->elementType_;
  unint64_t v13 = (unint64_t)&(&eras->elementType_)[eras->super.size_];
  while ((unint64_t)v12 < v13)
  {
    uint64_t v14 = *v12;
    if (!*v12) {
      goto LABEL_43;
    }
    ++v12;
    v7 += [v14 hash];
  }
  months = self->months_;
  if (!months) {
    goto LABEL_43;
  }
  uint64_t v16 = (void **)&months->elementType_;
  unint64_t v17 = (unint64_t)&(&months->elementType_)[months->super.size_];
  while ((unint64_t)v16 < v17)
  {
    v18 = *v16;
    if (!*v16) {
      goto LABEL_43;
    }
    ++v16;
    v7 += [v18 hash];
  }
  shortMonths = self->shortMonths_;
  if (!shortMonths) {
    goto LABEL_43;
  }
  v20 = (void **)&shortMonths->elementType_;
  unint64_t v21 = (unint64_t)&(&shortMonths->elementType_)[shortMonths->super.size_];
  while ((unint64_t)v20 < v21)
  {
    v22 = *v20;
    if (!*v20) {
      goto LABEL_43;
    }
    ++v20;
    v7 += [v22 hash];
  }
  shortWeekdays = self->shortWeekdays_;
  if (!shortWeekdays) {
    goto LABEL_43;
  }
  v24 = (void **)&shortWeekdays->elementType_;
  unint64_t v25 = (unint64_t)&(&shortWeekdays->elementType_)[shortWeekdays->super.size_];
  while ((unint64_t)v24 < v25)
  {
    v26 = *v24;
    if (!*v24) {
      goto LABEL_43;
    }
    ++v24;
    v7 += [v26 hash];
  }
  weekdays = self->weekdays_;
  if (!weekdays) {
    goto LABEL_43;
  }
  v28 = (void **)&weekdays->elementType_;
  unint64_t v29 = (unint64_t)&(&weekdays->elementType_)[weekdays->super.size_];
  while ((unint64_t)v28 < v29)
  {
    v30 = *v28;
    if (!*v28) {
      goto LABEL_43;
    }
    ++v28;
    v7 += [v30 hash];
  }
  if (!v3) {
LABEL_43:
  }
    JreThrowNullPointerException();
  v31 = (uint64_t *)(v3 + 6);
  unint64_t v32 = (unint64_t)&v3[2 * v3[2] + 6];
  while ((unint64_t)v31 < v32)
  {
    uint64_t v34 = *v31++;
    uint64_t v33 = v34;
    if (!v34) {
      goto LABEL_43;
    }
    if (*(int *)(v33 + 8) >= 1)
    {
      uint64_t v35 = 0;
      do
      {
        v36 = *(void **)(v33 + 24 + 8 * v35);
        if (v36) {
          v7 += [v36 hash];
        }
        ++v35;
      }
      while (v35 < *(int *)(v33 + 8));
    }
  }
  return v7;
}

- (void)setAmPmStringsWithNSStringArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  p_ampms = &self->ampms_;
  id v4 = [a3 clone];
  JreStrongAssign((id *)p_ampms, v4);
}

- (void)setErasWithNSStringArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  p_eras = &self->eras_;
  id v4 = [a3 clone];
  JreStrongAssign((id *)p_eras, v4);
}

- (void)setLocalPatternCharsWithNSString:(id)a3
{
  if (!a3)
  {
    unsigned int v5 = new_JavaLangNullPointerException_initWithNSString_(@"data == null");
    objc_exception_throw(v5);
  }
  p_localPatternChars = &self->localPatternChars_;
  JreStrongAssign((id *)p_localPatternChars, a3);
}

- (void)setMonthsWithNSStringArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  p_months = &self->months_;
  id v4 = [a3 clone];
  JreStrongAssign((id *)p_months, v4);
}

- (void)setShortMonthsWithNSStringArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  p_shortMonths = &self->shortMonths_;
  id v4 = [a3 clone];
  JreStrongAssign((id *)p_shortMonths, v4);
}

- (void)setShortWeekdaysWithNSStringArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  p_shortWeekdays = &self->shortWeekdays_;
  id v4 = [a3 clone];
  JreStrongAssign((id *)p_shortWeekdays, v4);
}

- (void)setWeekdaysWithNSStringArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  p_weekdays = &self->weekdays_;
  id v4 = [a3 clone];
  JreStrongAssign((id *)p_weekdays, v4);
}

- (void)setZoneStringsWithNSStringArray2:(id)a3
{
  if (!a3)
  {
    uint64_t v16 = new_JavaLangNullPointerException_initWithNSString_(@"zoneStrings == null");
LABEL_10:
    objc_exception_throw(v16);
  }
  for (i = (uint64_t *)((char *)a3 + 24); i < (uint64_t *)((char *)a3 + 8 * *((int *)a3 + 2) + 24); ++i)
  {
    uint64_t v5 = *i;
    if (!*i) {
      JreThrowNullPointerException();
    }
    if (*(int *)(v5 + 8) <= 4)
    {
      signed int v7 = (__CFString *)JavaUtilArrays_toStringWithNSObjectArray_(v5);
      CFStringRef v15 = JreStrcat("$$", v8, v9, v10, v11, v12, v13, v14, v7);
      uint64_t v16 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v15);
      goto LABEL_10;
    }
  }
  unint64_t v6 = sub_10029F1BC((uint64_t)a3);
  JreStrongAssign((id *)&self->zoneStrings_, v6);
  self->customZoneStrings_ = 1;
}

- (id)getTimeZoneDisplayNameWithJavaUtilTimeZone:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5
{
  if (a5 >= 2)
  {
    CFStringRef v15 = JreStrcat("$I", (uint64_t)a2, (uint64_t)a3, a4, *(uint64_t *)&a5, v5, v6, v7, @"Bad style: ");
    uint64_t v16 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  BOOL v9 = a4;
  id v11 = [(JavaTextDateFormatSymbols *)self internalZoneStrings];
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v12 = (uint64_t)v11;
  id v13 = [a3 getID];
  return (id)LibcoreIcuTimeZoneNames_getDisplayNameWithNSStringArray2_withNSString_withBoolean_withInt_(v12, (uint64_t)v13, v9, a5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaTextDateFormatSymbols;
  [(JavaTextDateFormatSymbols *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaTextDateFormatSymbols *)self clone];
  return v3;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10048B2C8;
}

@end