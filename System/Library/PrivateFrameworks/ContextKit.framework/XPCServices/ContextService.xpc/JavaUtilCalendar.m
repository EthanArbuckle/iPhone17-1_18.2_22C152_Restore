@interface JavaUtilCalendar
+ (const)__metadata;
+ (id)getInstanceWithJavaUtilLocale:(id)a3;
+ (id)getInstanceWithJavaUtilTimeZone:(id)a3;
+ (id)getInstanceWithJavaUtilTimeZone:(id)a3 withJavaUtilLocale:(id)a4;
+ (void)checkStyleWithInt:(int)a3;
+ (void)initialize;
+ (void)insertValuesInMapWithJavaUtilMap:(id)a3 withNSStringArray:(id)a4;
- (BOOL)afterWithId:(id)a3;
- (BOOL)beforeWithId:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLenient;
- (BOOL)isSetWithInt:(int)a3;
- (JavaUtilCalendar)init;
- (JavaUtilCalendar)initWithJavaUtilTimeZone:(id)a3;
- (JavaUtilCalendar)initWithJavaUtilTimeZone:(id)a3 withJavaUtilLocale:(id)a4;
- (NSString)description;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getDisplayNameArrayWithInt:(int)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5;
- (id)getDisplayNameWithInt:(int)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5;
- (id)getDisplayNamesWithInt:(int)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5;
- (id)getTime;
- (id)getTimeZone;
- (int)compareToWithId:(id)a3;
- (int)getActualMaximumWithInt:(int)a3;
- (int)getActualMinimumWithInt:(int)a3;
- (int)getFirstDayOfWeek;
- (int)getGreatestMinimumWithInt:(int)a3;
- (int)getLeastMaximumWithInt:(int)a3;
- (int)getMaximumWithInt:(int)a3;
- (int)getMinimalDaysInFirstWeek;
- (int)getMinimumWithInt:(int)a3;
- (int)getWithInt:(int)a3;
- (int)internalGetWithInt:(int)a3;
- (int64_t)getTimeInMillis;
- (unint64_t)hash;
- (void)addWithInt:(int)a3 withInt:(int)a4;
- (void)clear;
- (void)clearWithInt:(int)a3;
- (void)complete;
- (void)computeFields;
- (void)computeTime;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)rollWithInt:(int)a3 withBoolean:(BOOL)a4;
- (void)rollWithInt:(int)a3 withInt:(int)a4;
- (void)setFirstDayOfWeekWithInt:(int)a3;
- (void)setLenientWithBoolean:(BOOL)a3;
- (void)setMinimalDaysInFirstWeekWithInt:(int)a3;
- (void)setTimeInMillisWithLong:(int64_t)a3;
- (void)setTimeWithJavaUtilDate:(id)a3;
- (void)setTimeZoneWithJavaUtilTimeZone:(id)a3;
- (void)setWithInt:(int)a3 withInt:(int)a4;
- (void)setWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (void)setWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
- (void)setWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilCalendar

- (JavaUtilCalendar)init
{
  id Default = JavaUtilTimeZone_getDefault();
  v4 = (void *)JavaUtilLocale_getDefault();
  JavaUtilCalendar_initWithJavaUtilTimeZone_withJavaUtilLocale_(self, (uint64_t)Default, v4);
  return self;
}

- (JavaUtilCalendar)initWithJavaUtilTimeZone:(id)a3
{
  return self;
}

- (JavaUtilCalendar)initWithJavaUtilTimeZone:(id)a3 withJavaUtilLocale:(id)a4
{
  return self;
}

- (void)addWithInt:(int)a3 withInt:(int)a4
{
}

- (BOOL)afterWithId:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(JavaUtilCalendar *)self getTimeInMillis];
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v5 > (uint64_t)[a3 getTimeInMillis];
}

- (BOOL)beforeWithId:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(JavaUtilCalendar *)self getTimeInMillis];
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v5 < (uint64_t)[a3 getTimeInMillis];
}

- (void)clear
{
  for (uint64_t i = 0; i != 17; ++i)
  {
    fields = self->fields_;
    if (!fields) {
      goto LABEL_10;
    }
    uint64_t size = fields->super.size_;
    if (i >= size) {
      IOSArray_throwOutOfBoundsWithMsg(size, i);
    }
    *(&fields->super.size_ + i + 1) = 0;
    isSet = self->isSet_;
    if (!isSet) {
LABEL_10:
    }
      JreThrowNullPointerException();
    uint64_t v7 = isSet->super.size_;
    if (i >= v7) {
      IOSArray_throwOutOfBoundsWithMsg(v7, i);
    }
    *((unsigned char *)&isSet->super.size_ + i + 4) = 0;
  }
  self->isTimeSet_ = 0;
  self->areFieldsSet_ = 0;
}

- (void)clearWithInt:(int)a3
{
  fields = self->fields_;
  if (!fields) {
    goto LABEL_8;
  }
  uint64_t size = fields->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  *(&fields->super.size_ + a3 + 1) = 0;
  isSet = self->isSet_;
  if (!isSet) {
LABEL_8:
  }
    JreThrowNullPointerException();
  uint64_t v7 = isSet->super.size_;
  if (a3 < 0 || (int)v7 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v7, *(uint64_t *)&a3);
  }
  *((unsigned char *)&isSet->super.size_ + a3 + 4) = 0;
  self->isTimeSet_ = 0;
  self->areFieldsSet_ = 0;
}

- (id)clone
{
  v9.receiver = self;
  v9.super_class = (Class)JavaUtilCalendar;
  v3 = [(JavaUtilCalendar *)&v9 clone];
  objc_opt_class();
  if (!v3) {
    goto LABEL_9;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  fields = self->fields_;
  if (!fields
    || (JreStrongAssign(v3 + 2, [(IOSArray *)fields clone]), (isSet = self->isSet_) == 0)
    || (JreStrongAssign(v3 + 3, [(IOSArray *)isSet clone]), (zone = self->zone_) == 0))
  {
LABEL_9:
    JreThrowNullPointerException();
  }
  id v7 = [(JavaUtilTimeZone *)zone clone];
  objc_opt_class();
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0) {
LABEL_10:
  }
    JreThrowClassCastException();
  JreStrongAssign(v3 + 9, v7);
  return v3;
}

- (void)complete
{
  if (!self->isTimeSet_)
  {
    [(JavaUtilCalendar *)self computeTime];
    self->isTimeSet_ = 1;
  }
  if (!self->areFieldsSet_)
  {
    [(JavaUtilCalendar *)self computeFields];
    self->areFieldsSet_ = 1;
  }
}

- (void)computeFields
{
}

- (void)computeTime
{
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3)
  {
    [(JavaUtilCalendar *)self getTimeInMillis];
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v5 = [(JavaUtilCalendar *)self getTimeInMillis];
  if (v5 != [a3 getTimeInMillis]) {
    return 0;
  }
  unsigned int v6 = [(JavaUtilCalendar *)self isLenient];
  if (v6 != [a3 isLenient]) {
    return 0;
  }
  unsigned int v7 = [(JavaUtilCalendar *)self getFirstDayOfWeek];
  if (v7 != [a3 getFirstDayOfWeek]) {
    return 0;
  }
  unsigned int v8 = [(JavaUtilCalendar *)self getMinimalDaysInFirstWeek];
  if (v8 != [a3 getMinimalDaysInFirstWeek]) {
    return 0;
  }
  id v9 = [(JavaUtilCalendar *)self getTimeZone];
  if (!v9) {
    JreThrowNullPointerException();
  }
  v10 = v9;
  id v11 = [a3 getTimeZone];
  return [v10 isEqual:v11];
}

- (int)getWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(JavaUtilCalendar *)self complete];
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  uint64_t size = fields->super.size_;
  if ((v3 & 0x80000000) != 0 || (int)size <= (int)v3) {
    IOSArray_throwOutOfBoundsWithMsg(size, v3);
  }
  return *(&fields->super.size_ + (int)v3 + 1);
}

- (int)getActualMaximumWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = -[JavaUtilCalendar getMaximumWithInt:](self, "getMaximumWithInt:");
  uint64_t v6 = [(JavaUtilCalendar *)self getLeastMaximumWithInt:v3];
  if (v5 != v6)
  {
    uint64_t v7 = v6;
    [(JavaUtilCalendar *)self complete];
    int64_t time = self->time_;
    [(JavaUtilCalendar *)self setWithInt:v3 withInt:v7];
    do
    {
      int v5 = v7;
      [(JavaUtilCalendar *)self rollWithInt:v3 withBoolean:1];
      LODWORD(v7) = [(JavaUtilCalendar *)self getWithInt:v3];
    }
    while ((int)v7 > v5);
    self->time_ = time;
    self->areFieldsSet_ = 0;
  }
  return v5;
}

- (int)getActualMinimumWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = -[JavaUtilCalendar getMinimumWithInt:](self, "getMinimumWithInt:");
  uint64_t v6 = [(JavaUtilCalendar *)self getGreatestMinimumWithInt:v3];
  if (v5 != v6)
  {
    uint64_t v7 = v6;
    [(JavaUtilCalendar *)self complete];
    int64_t time = self->time_;
    [(JavaUtilCalendar *)self setWithInt:v3 withInt:v7];
    do
    {
      int v5 = v7;
      [(JavaUtilCalendar *)self rollWithInt:v3 withBoolean:0];
      LODWORD(v7) = [(JavaUtilCalendar *)self getWithInt:v3];
    }
    while ((int)v7 < v5);
    self->time_ = time;
    self->areFieldsSet_ = 0;
  }
  return v5;
}

- (int)getFirstDayOfWeek
{
  return self->firstDayOfWeek_;
}

- (int)getGreatestMinimumWithInt:(int)a3
{
  return 0;
}

+ (id)getInstanceWithJavaUtilLocale:(id)a3
{
  return JavaUtilCalendar_getInstanceWithJavaUtilLocale_(a3);
}

+ (id)getInstanceWithJavaUtilTimeZone:(id)a3
{
  return JavaUtilCalendar_getInstanceWithJavaUtilTimeZone_((uint64_t)a3);
}

+ (id)getInstanceWithJavaUtilTimeZone:(id)a3 withJavaUtilLocale:(id)a4
{
  return JavaUtilCalendar_getInstanceWithJavaUtilTimeZone_withJavaUtilLocale_((uint64_t)a3, a4);
}

- (int)getLeastMaximumWithInt:(int)a3
{
  return 0;
}

- (int)getMaximumWithInt:(int)a3
{
  return 0;
}

- (int)getMinimalDaysInFirstWeek
{
  return self->minimalDaysInFirstWeek_;
}

- (int)getMinimumWithInt:(int)a3
{
  return 0;
}

- (id)getTime
{
  v2 = new_JavaUtilDate_initWithLong_([(JavaUtilCalendar *)self getTimeInMillis]);
  return v2;
}

- (int64_t)getTimeInMillis
{
  if (!self->isTimeSet_)
  {
    [(JavaUtilCalendar *)self computeTime];
    self->isTimeSet_ = 1;
  }
  return self->time_;
}

- (id)getTimeZone
{
  return self->zone_;
}

- (unint64_t)hash
{
  unsigned int v3 = [(JavaUtilCalendar *)self isLenient];
  unsigned int v4 = [(JavaUtilCalendar *)self getFirstDayOfWeek];
  unsigned int v5 = [(JavaUtilCalendar *)self getMinimalDaysInFirstWeek];
  id v6 = [(JavaUtilCalendar *)self getTimeZone];
  if (!v6) {
    JreThrowNullPointerException();
  }
  if (v3) {
    int v7 = 1237;
  }
  else {
    int v7 = 1231;
  }
  return (int)(v7 + v4 + v5 + [v6 hash]);
}

- (int)internalGetWithInt:(int)a3
{
  fields = self->fields_;
  if (!fields) {
    JreThrowNullPointerException();
  }
  uint64_t size = fields->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *(&fields->super.size_ + a3 + 1);
}

- (BOOL)isLenient
{
  return self->lenient_;
}

- (BOOL)isSetWithInt:(int)a3
{
  isSet = self->isSet_;
  if (!isSet) {
    JreThrowNullPointerException();
  }
  uint64_t size = isSet->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  return *((unsigned char *)&isSet->super.size_ + a3 + 4);
}

- (void)rollWithInt:(int)a3 withInt:(int)a4
{
  if (a4 >= 0) {
    int v4 = a4;
  }
  else {
    int v4 = -a4;
  }
  if (v4 >= 1)
  {
    uint64_t v6 = *(void *)&a3;
    do
    {
      [(JavaUtilCalendar *)self rollWithInt:v6 withBoolean:a4 >= 0];
      --v4;
    }
    while (v4);
  }
}

- (void)rollWithInt:(int)a3 withBoolean:(BOOL)a4
{
}

- (void)setWithInt:(int)a3 withInt:(int)a4
{
  fields = self->fields_;
  if (!fields) {
    goto LABEL_14;
  }
  int v5 = a3;
  uint64_t size = fields->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  *(&fields->super.size_ + a3 + 1) = a4;
  isSet = self->isSet_;
  if (!isSet) {
LABEL_14:
  }
    JreThrowNullPointerException();
  uint64_t v9 = isSet->super.size_;
  if (a3 < 0 || (int)v9 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v9, *(uint64_t *)&a3);
  }
  *((unsigned char *)&isSet->super.size_ + a3 + 4) = 1;
  self->isTimeSet_ = 0;
  self->areFieldsSet_ = 0;
  if ((a3 - 3) <= 5) {
    self->lastDateFieldSet_ = a3;
  }
  if ((a3 & 0xFFFFFFFE) != 0xA)
  {
    if (a3 != 9) {
      return;
    }
    int v5 = 10;
  }
  self->lastTimeFieldSet_ = v5;
}

- (void)setWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  [(JavaUtilCalendar *)self setWithInt:1 withInt:*(void *)&a3];
  [(JavaUtilCalendar *)self setWithInt:2 withInt:v6];
  [(JavaUtilCalendar *)self setWithInt:5 withInt:v5];
}

- (void)setWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  [(JavaUtilCalendar *)self setWithInt:1 withInt:*(void *)&a3];
  [(JavaUtilCalendar *)self setWithInt:2 withInt:v10];
  [(JavaUtilCalendar *)self setWithInt:5 withInt:v9];
  [(JavaUtilCalendar *)self setWithInt:11 withInt:v8];
  [(JavaUtilCalendar *)self setWithInt:12 withInt:v7];
}

- (void)setWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  [(JavaUtilCalendar *)self setWithInt:1 withInt:*(void *)&a3];
  [(JavaUtilCalendar *)self setWithInt:2 withInt:v12];
  [(JavaUtilCalendar *)self setWithInt:5 withInt:v11];
  [(JavaUtilCalendar *)self setWithInt:11 withInt:v10];
  [(JavaUtilCalendar *)self setWithInt:12 withInt:v9];
  [(JavaUtilCalendar *)self setWithInt:13 withInt:v8];
}

- (void)setFirstDayOfWeekWithInt:(int)a3
{
  self->firstDayOfWeek_ = a3;
}

- (void)setLenientWithBoolean:(BOOL)a3
{
  self->lenient_ = a3;
}

- (void)setMinimalDaysInFirstWeekWithInt:(int)a3
{
  self->minimalDaysInFirstWeek_ = a3;
}

- (void)setTimeWithJavaUtilDate:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 getTime];
  [(JavaUtilCalendar *)self setTimeInMillisWithLong:v4];
}

- (void)setTimeInMillisWithLong:(int64_t)a3
{
  if (!self->isTimeSet_ || !self->areFieldsSet_ || self->time_ != a3)
  {
    self->time_ = a3;
    self->isTimeSet_ = 1;
    self->areFieldsSet_ = 0;
    [(JavaUtilCalendar *)self complete];
  }
}

- (void)setTimeZoneWithJavaUtilTimeZone:(id)a3
{
  self->areFieldsSet_ = 0;
}

- (NSString)description
{
  id v3 = objc_msgSend(-[JavaUtilCalendar getClass](self, "getClass"), "getName");
  if (self->isTimeSet_) {
    NSString_valueOfLong_(self->time_);
  }
  zone = self->zone_;
  if (!zone) {
LABEL_22:
  }
    JreThrowNullPointerException();
  [(JavaUtilTimeZone *)zone getID];
  uint64_t v12 = (__CFString *)JreStrcat("$$$$Z$Z$$$I$I", v5, v6, v7, v8, v9, v10, v11, v3);
  v13 = new_JavaLangStringBuilder_initWithNSString_(v12);
  for (uint64_t i = 0; i != 17; ++i)
  {
    [(JavaLangStringBuilder *)v13 appendWithChar:44];
    if (!qword_1005611A0) {
      goto LABEL_22;
    }
    uint64_t v15 = *(int *)(qword_1005611A0 + 8);
    if (i >= v15) {
      IOSArray_throwOutOfBoundsWithMsg(v15, i);
    }
    [(JavaLangStringBuilder *)v13 appendWithNSString:*(void *)(qword_1005611A0 + 24 + 8 * i)];
    [(JavaLangStringBuilder *)v13 appendWithChar:61];
    isSet = self->isSet_;
    if (!isSet) {
      goto LABEL_22;
    }
    uint64_t size = isSet->super.size_;
    if (i >= size) {
      IOSArray_throwOutOfBoundsWithMsg(size, i);
    }
    if (*((unsigned char *)&isSet->super.size_ + i + 4))
    {
      fields = self->fields_;
      if (!fields) {
        goto LABEL_22;
      }
      uint64_t v19 = fields->super.size_;
      if (i >= v19) {
        IOSArray_throwOutOfBoundsWithMsg(v19, i);
      }
      [(JavaLangStringBuilder *)v13 appendWithInt:*((unsigned int *)&fields->super.size_ + i + 1)];
    }
    else
    {
      [(JavaLangStringBuilder *)v13 appendWithChar:63];
    }
  }
  [(JavaLangStringBuilder *)v13 appendWithChar:93];
  return [(JavaLangStringBuilder *)v13 description];
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3)
  {
    uint64_t v9 = new_JavaLangNullPointerException_initWithNSString_(@"anotherCalendar == null");
    objc_exception_throw(v9);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int64_t v5 = [(JavaUtilCalendar *)self getTimeInMillis];
  id v6 = [a3 getTimeInMillis];
  if ((id)v5 == v6) {
    int v7 = 0;
  }
  else {
    int v7 = -1;
  }
  if (v5 > (uint64_t)v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (id)getDisplayNameWithInt:(int)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5
{
  uint64_t v8 = *(void *)&a3;
  if (a4 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = a4;
  }
  uint64_t v11 = sub_1002455C4(a3, v10, a5, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
  uint64_t v12 = [(JavaUtilCalendar *)self getWithInt:v8];
  if (!v11) {
    return 0;
  }
  uint64_t v13 = v12;
  uint64_t v14 = (int)v12;
  uint64_t v15 = *((unsigned int *)v11 + 2);
  if ((v13 & 0x80000000) != 0 || (int)v13 >= (int)v15) {
    IOSArray_throwOutOfBoundsWithMsg(v15, v13);
  }
  return (id)v11[v14 + 3];
}

- (id)getDisplayNameArrayWithInt:(int)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5
{
  return sub_1002455C4(a3, *(uint64_t *)&a4, a5, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
}

+ (void)checkStyleWithInt:(int)a3
{
  sub_1002457AC(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

- (id)getDisplayNamesWithInt:(int)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5
{
  sub_1002457AC(*(uint64_t *)&a4, (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
  [(JavaUtilCalendar *)self complete];
  v17 = new_JavaUtilHashMap_init();
  if (a4 <= 1)
  {
    id v18 = sub_1002455C4(a3, 1, a5, v12, v13, v14, v15, v16);
    sub_1002458C8((uint64_t)v17, (uint64_t)v18);
  }
  if ((a4 & 0xFFFFFFFD) == 0)
  {
    id v19 = sub_1002455C4(a3, 2, a5, v12, v13, v14, v15, v16);
    sub_1002458C8((uint64_t)v17, (uint64_t)v19);
  }
  if ([(JavaUtilHashMap *)v17 isEmpty]) {
    return 0;
  }
  else {
    return v17;
  }
}

+ (void)insertValuesInMapWithJavaUtilMap:(id)a3 withNSStringArray:(id)a4
{
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  [(JavaUtilCalendar *)self complete];
  if (!a3 || (id v5 = [a3 putFields]) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = v5;
  [v5 putWithNSString:@"areFieldsSet" withBoolean:self->areFieldsSet_];
  [v6 putWithNSString:@"fields" withId:self->fields_];
  [v6 putWithNSString:@"firstDayOfWeek" withInt:self->firstDayOfWeek_];
  [v6 putWithNSString:@"isSet" withId:self->isSet_];
  [v6 putWithNSString:@"isTimeSet" withBoolean:self->isTimeSet_];
  [v6 putWithNSString:@"lenient" withBoolean:self->lenient_];
  [v6 putWithNSString:@"minimalDaysInFirstWeek" withInt:self->minimalDaysInFirstWeek_];
  [v6 putWithNSString:@"nextStamp" withInt:2];
  [v6 putWithNSString:@"serialVersionOnStream" withInt:1];
  [v6 putWithNSString:@"time" withLong:self->time_];
  [v6 putWithNSString:@"zone" withId:self->zone_];
  [a3 writeFields];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3 || (id v4 = [a3 readFields]) == 0) {
    JreThrowNullPointerException();
  }
  id v5 = v4;
  self->areFieldsSet_ = [v4 getWithNSString:@"areFieldsSet" withBoolean:0];
  id v6 = [v5 getWithNSString:@"fields" withId:0];
  objc_opt_class();
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  JreStrongAssign((id *)&self->fields_, v6);
  self->firstDayOfWeek_ = [v5 getWithNSString:@"firstDayOfWeek" withInt:1];
  id v7 = [v5 getWithNSString:@"isSet" withId:0];
  objc_opt_class();
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
  }
  JreStrongAssign((id *)&self->isSet_, v7);
  self->isTimeSet_ = [v5 getWithNSString:@"isTimeSet" withBoolean:0];
  self->lenient_ = [v5 getWithNSString:@"lenient" withBoolean:1];
  self->minimalDaysInFirstWeek_ = [v5 getWithNSString:@"minimalDaysInFirstWeek" withInt:1];
  self->time_ = (int64_t)[v5 getWithNSString:@"time" withLong:0];
  id v8 = [v5 getWithNSString:@"zone" withId:0];
  objc_opt_class();
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
LABEL_13:
    }
      JreThrowClassCastException();
  }
  JreStrongAssign((id *)&self->zone_, v8);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCalendar;
  [(JavaUtilCalendar *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilCalendar *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v8[5] = off_10045EE90;
    v8[6] = off_10045EEA0;
    v8[7] = off_10045EEB0;
    CFStringRef v9 = @"DST_OFFSET";
    v8[3] = off_10045EE70;
    v8[4] = off_10045EE80;
    v8[1] = off_10045EE50;
    v8[2] = off_10045EE60;
    v8[0] = off_10045EE40;
    id v2 = +[IOSObjectArray newArrayWithObjects:v8 count:17 type:NSString_class_()];
    JreStrongAssignAndConsume((id *)&qword_1005611A0, v2);
    v7[0] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"areFieldsSet", (JavaLangRefWeakReference *)+[IOSClass BOOLeanClass]);
    id v3 = (JavaLangRefWeakReference *)IOSClass_arrayType((uint64_t)+[IOSClass intClass], 1u);
    v7[1] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"fields", v3);
    v7[2] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"firstDayOfWeek", (JavaLangRefWeakReference *)+[IOSClass intClass]);
    id v4 = (JavaLangRefWeakReference *)IOSClass_arrayType((uint64_t)+[IOSClass BOOLeanClass], 1u);
    v7[3] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"isSet", v4);
    v7[4] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"isTimeSet", (JavaLangRefWeakReference *)+[IOSClass BOOLeanClass]);
    v7[5] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"lenient", (JavaLangRefWeakReference *)+[IOSClass BOOLeanClass]);
    v7[6] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"minimalDaysInFirstWeek", (JavaLangRefWeakReference *)+[IOSClass intClass]);
    v7[7] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"nextStamp", (JavaLangRefWeakReference *)+[IOSClass intClass]);
    v7[8] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"serialVersionOnStream", (JavaLangRefWeakReference *)+[IOSClass intClass]);
    v7[9] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"time", (JavaLangRefWeakReference *)+[IOSClass longClass]);
    id v5 = (JavaLangRefWeakReference *)JavaUtilTimeZone_class_();
    v7[10] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"zone", v5);
    id v6 = +[IOSObjectArray newArrayWithObjects:v7 count:11 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&qword_1005611A8, v6);
    atomic_store(1u, (unsigned __int8 *)&JavaUtilCalendar__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004605C8;
}

@end