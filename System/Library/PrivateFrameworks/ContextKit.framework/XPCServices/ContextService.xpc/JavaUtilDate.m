@interface JavaUtilDate
+ (const)__metadata;
+ (id)__annotations_UTCWithInt_withInt_withInt_withInt_withInt_withInt_;
+ (id)__annotations_getDate;
+ (id)__annotations_getDay;
+ (id)__annotations_getHours;
+ (id)__annotations_getMinutes;
+ (id)__annotations_getMonth;
+ (id)__annotations_getSeconds;
+ (id)__annotations_getTimezoneOffset;
+ (id)__annotations_getYear;
+ (id)__annotations_initWithInt_withInt_withInt_;
+ (id)__annotations_initWithInt_withInt_withInt_withInt_withInt_;
+ (id)__annotations_initWithInt_withInt_withInt_withInt_withInt_withInt_;
+ (id)__annotations_initWithNSString_;
+ (id)__annotations_parseWithNSString_;
+ (id)__annotations_setDateWithInt_;
+ (id)__annotations_setHoursWithInt_;
+ (id)__annotations_setMinutesWithInt_;
+ (id)__annotations_setMonthWithInt_;
+ (id)__annotations_setSecondsWithInt_;
+ (id)__annotations_setYearWithInt_;
+ (id)__annotations_toGMTString;
+ (id)__annotations_toLocaleString;
+ (id)parseErrorWithNSString:(id)a3;
+ (int)parseWithNSString:(id)a3 withNSStringArray:(id)a4;
+ (int)zoneWithNSString:(id)a3;
+ (int64_t)UTCWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
+ (int64_t)parseWithNSString:(id)a3;
+ (void)appendTwoDigitsWithJavaLangStringBuilder:(id)a3 withInt:(int)a4;
+ (void)initialize;
- (BOOL)afterWithJavaUtilDate:(id)a3;
- (BOOL)beforeWithJavaUtilDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (JavaUtilDate)init;
- (JavaUtilDate)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (JavaUtilDate)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
- (JavaUtilDate)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
- (JavaUtilDate)initWithLong:(int64_t)a3;
- (JavaUtilDate)initWithNSString:(id)a3;
- (NSString)description;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)toGMTString;
- (id)toLocaleString;
- (int)compareToWithId:(id)a3;
- (int)getDate;
- (int)getDay;
- (int)getHours;
- (int)getMinutes;
- (int)getMonth;
- (int)getSeconds;
- (int)getTimezoneOffset;
- (int)getYear;
- (int64_t)getTime;
- (unint64_t)hash;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)setDateWithInt:(int)a3;
- (void)setHoursWithInt:(int)a3;
- (void)setMinutesWithInt:(int)a3;
- (void)setMonthWithInt:(int)a3;
- (void)setSecondsWithInt:(int)a3;
- (void)setTimeWithLong:(int64_t)a3;
- (void)setYearWithInt:(int)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilDate

- (JavaUtilDate)init
{
  self->milliseconds_ = JavaLangSystem_currentTimeMillis();
  return self;
}

- (JavaUtilDate)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (JavaUtilDate)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return self;
}

- (JavaUtilDate)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  return self;
}

- (JavaUtilDate)initWithLong:(int64_t)a3
{
  self->milliseconds_ = a3;
  return self;
}

- (JavaUtilDate)initWithNSString:(id)a3
{
  self->milliseconds_ = JavaUtilDate_parseWithNSString_(a3);
  return self;
}

- (BOOL)afterWithJavaUtilDate:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return self->milliseconds_ > *((void *)a3 + 1);
}

- (BOOL)beforeWithJavaUtilDate:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return self->milliseconds_ < *((void *)a3 + 1);
}

- (id)clone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilDate;
  return [(JavaUtilDate *)&v3 clone];
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int64_t milliseconds = self->milliseconds_;
  int64_t v6 = *((void *)a3 + 1);
  BOOL v7 = milliseconds < v6;
  BOOL v8 = milliseconds != v6;
  if (v7) {
    return -1;
  }
  else {
    return v8;
  }
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int64_t milliseconds = self->milliseconds_;
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return milliseconds == *((void *)a3 + 1);
}

- (int)getDate
{
  v2 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  return [(JavaUtilCalendar *)v2 getWithInt:5];
}

- (int)getDay
{
  return [(JavaUtilCalendar *)new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_) getWithInt:7]- 1;
}

- (int)getHours
{
  v2 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  return [(JavaUtilCalendar *)v2 getWithInt:11];
}

- (int)getMinutes
{
  v2 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  return [(JavaUtilCalendar *)v2 getWithInt:12];
}

- (int)getMonth
{
  v2 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  return [(JavaUtilCalendar *)v2 getWithInt:2];
}

- (int)getSeconds
{
  v2 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  return [(JavaUtilCalendar *)v2 getWithInt:13];
}

- (int64_t)getTime
{
  return self->milliseconds_;
}

- (int)getTimezoneOffset
{
  v2 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  unsigned int v3 = [(JavaUtilCalendar *)v2 getWithInt:15];
  return (signed int)-(v3 + [(JavaUtilCalendar *)v2 getWithInt:16]) / 60000;
}

- (int)getYear
{
  return [(JavaUtilCalendar *)new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_) getWithInt:1]- 1900;
}

- (unint64_t)hash
{
  return (uint64_t)(self->milliseconds_ & 0xFFFFFFFF00000000 ^ (self->milliseconds_ << 32)) >> 32;
}

+ (int)parseWithNSString:(id)a3 withNSStringArray:(id)a4
{
  return sub_100213B90(a3, (uint64_t)a4);
}

+ (id)parseErrorWithNSString:(id)a3
{
  sub_100213C98((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (int64_t)parseWithNSString:(id)a3
{
  return JavaUtilDate_parseWithNSString_(a3);
}

- (void)setDateWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  [(JavaUtilCalendar *)v5 setWithInt:5 withInt:v3];
  self->milliseconds_ = [(JavaUtilCalendar *)v5 getTimeInMillis];
}

- (void)setHoursWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  [(JavaUtilCalendar *)v5 setWithInt:11 withInt:v3];
  self->milliseconds_ = [(JavaUtilCalendar *)v5 getTimeInMillis];
}

- (void)setMinutesWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  [(JavaUtilCalendar *)v5 setWithInt:12 withInt:v3];
  self->milliseconds_ = [(JavaUtilCalendar *)v5 getTimeInMillis];
}

- (void)setMonthWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  [(JavaUtilCalendar *)v5 setWithInt:2 withInt:v3];
  self->milliseconds_ = [(JavaUtilCalendar *)v5 getTimeInMillis];
}

- (void)setSecondsWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  [(JavaUtilCalendar *)v5 setWithInt:13 withInt:v3];
  self->milliseconds_ = [(JavaUtilCalendar *)v5 getTimeInMillis];
}

- (void)setTimeWithLong:(int64_t)a3
{
  self->milliseconds_ = a3;
}

- (void)setYearWithInt:(int)a3
{
  uint64_t v5 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  [(JavaUtilCalendar *)v5 setWithInt:1 withInt:(a3 + 1900)];
  self->milliseconds_ = [(JavaUtilCalendar *)v5 getTimeInMillis];
}

- (id)toGMTString
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = new_JavaTextSimpleDateFormat_initWithNSString_withJavaUtilLocale_(@"d MMM y HH:mm:ss 'GMT'", (void *)JavaUtilLocale_US_);
  id TimeZoneWithNSString = JavaUtilTimeZone_getTimeZoneWithNSString_(@"GMT");
  [(JavaTextDateFormat *)v3 setTimeZoneWithJavaUtilTimeZone:TimeZoneWithNSString];
  [(JavaUtilCalendar *)new_JavaUtilGregorianCalendar_initWithJavaUtilTimeZone_((uint64_t)TimeZoneWithNSString) setTimeInMillisWithLong:self->milliseconds_];
  return [(JavaTextDateFormat *)v3 formatWithJavaUtilDate:self];
}

- (id)toLocaleString
{
  DateTimeInstance = JavaTextDateFormat_getDateTimeInstance((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (!DateTimeInstance) {
    JreThrowNullPointerException();
  }
  return [(JavaTextDateFormat *)DateTimeInstance formatWithJavaUtilDate:self];
}

- (NSString)description
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = LibcoreIcuLocaleData_getWithJavaUtilLocale_((void *)JavaUtilLocale_US_);
  uint64_t v4 = new_JavaUtilGregorianCalendar_initWithLong_(self->milliseconds_);
  id v5 = [(JavaUtilCalendar *)v4 getTimeZone];
  uint64_t v6 = new_JavaLangStringBuilder_init();
  if (!v3) {
    goto LABEL_14;
  }
  shortWeekdayNames = v3->shortWeekdayNames_;
  if (!shortWeekdayNames) {
    goto LABEL_14;
  }
  BOOL v8 = v6;
  int v9 = [(JavaUtilCalendar *)v4 getWithInt:7];
  uint64_t size = shortWeekdayNames->super.size_;
  if (v9 < 0 || v9 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v9);
  }
  [(JavaLangStringBuilder *)v8 appendWithNSString:(&shortWeekdayNames->elementType_)[v9]];
  [(JavaLangStringBuilder *)v8 appendWithChar:32];
  shortMonthNames = v3->shortMonthNames_;
  if (!shortMonthNames) {
    goto LABEL_14;
  }
  int v12 = [(JavaUtilCalendar *)v4 getWithInt:2];
  uint64_t v13 = shortMonthNames->super.size_;
  if (v12 < 0 || v12 >= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(v13, v12);
  }
  [(JavaLangStringBuilder *)v8 appendWithNSString:(&shortMonthNames->elementType_)[v12]];
  [(JavaLangStringBuilder *)v8 appendWithChar:32];
  sub_100214A2C(v8, [(JavaUtilCalendar *)v4 getWithInt:5]);
  [(JavaLangStringBuilder *)v8 appendWithChar:32];
  sub_100214A2C(v8, [(JavaUtilCalendar *)v4 getWithInt:11]);
  [(JavaLangStringBuilder *)v8 appendWithChar:58];
  sub_100214A2C(v8, [(JavaUtilCalendar *)v4 getWithInt:12]);
  [(JavaLangStringBuilder *)v8 appendWithChar:58];
  sub_100214A2C(v8, [(JavaUtilCalendar *)v4 getWithInt:13]);
  [(JavaLangStringBuilder *)v8 appendWithChar:32];
  if (!v5) {
LABEL_14:
  }
    JreThrowNullPointerException();
  -[JavaLangStringBuilder appendWithNSString:](v8, "appendWithNSString:", objc_msgSend(v5, "getDisplayNameWithBoolean:withInt:", objc_msgSend(v5, "inDaylightTimeWithJavaUtilDate:", self), 0));
  [(JavaLangStringBuilder *)v8 appendWithChar:32];
  [(JavaLangStringBuilder *)v8 appendWithInt:[(JavaUtilCalendar *)v4 getWithInt:1]];
  return [(JavaLangStringBuilder *)v8 description];
}

+ (void)appendTwoDigitsWithJavaLangStringBuilder:(id)a3 withInt:(int)a4
{
}

+ (int64_t)UTCWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  return JavaUtilDate_UTCWithInt_withInt_withInt_withInt_withInt_withInt_(a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, *(uint64_t *)&a8);
}

+ (int)zoneWithNSString:(id)a3
{
  return sub_100214BA4(a3);
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
  int64_t v5 = [(JavaUtilDate *)self getTime];
  [a3 writeLongWithLong:v5];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  id v5 = [a3 readLong];
  [(JavaUtilDate *)self setTimeWithLong:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilDate *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [JavaUtilDate alloc];
    v2->milliseconds_ = JavaLangSystem_currentTimeMillis();
    dword_100560ED8 = [(JavaUtilDate *)v2 getYear];
    atomic_store(1u, (unsigned __int8 *)&JavaUtilDate__initialized);
  }
}

+ (id)__annotations_initWithInt_withInt_withInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_initWithInt_withInt_withInt_withInt_withInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_initWithInt_withInt_withInt_withInt_withInt_withInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_initWithNSString_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getDate
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getDay
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getHours
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getMinutes
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getMonth
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getSeconds
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getTimezoneOffset
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_getYear
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_parseWithNSString_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_setDateWithInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_setHoursWithInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_setMinutesWithInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_setMonthWithInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_setSecondsWithInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_setYearWithInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_toGMTString
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_toLocaleString
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_UTCWithInt_withInt_withInt_withInt_withInt_withInt_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100447B28;
}

@end