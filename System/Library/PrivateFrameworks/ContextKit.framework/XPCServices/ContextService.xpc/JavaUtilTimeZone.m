@interface JavaUtilTimeZone
+ (JavaUtilSimpleTimeZone)getDefaultNativeTimeZone;
+ (const)__metadata;
+ (id)createGmtOffsetStringWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withInt:(int)a5;
+ (id)getAvailableIDsWithInt:(int)a3;
+ (id)getCustomTimeZoneWithNSString:(id)a3;
+ (id)getNativeTimeZoneWithNSString:(id)a3;
+ (id)getTimeZoneWithNSString:(id)a3;
+ (void)appendNumberWithJavaLangStringBuilder:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)initialize;
+ (void)setDefaultWithJavaUtilTimeZone:(id)a3;
- (BOOL)hasSameRulesWithJavaUtilTimeZone:(id)a3;
- (BOOL)inDaylightTimeWithJavaUtilDate:(id)a3;
- (BOOL)useDaylightTime;
- (JavaUtilTimeZone)initWithId:(id)a3;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayNameWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withJavaUtilLocale:(id)a5;
- (id)getDisplayName;
- (id)getDisplayNameWithBoolean:(BOOL)a3 withInt:(int)a4;
- (id)getDisplayNameWithBoolean:(BOOL)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5;
- (id)getDisplayNameWithJavaUtilLocale:(id)a3;
- (id)getID;
- (int)getDSTSavings;
- (int)getOffsetWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8;
- (int)getOffsetWithLong:(int64_t)a3;
- (int)getRawOffset;
- (void)dealloc;
- (void)setIDWithNSString:(id)a3;
@end

@implementation JavaUtilTimeZone

- (JavaUtilTimeZone)initWithId:(id)a3
{
  return self;
}

- (id)clone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTimeZone;
  return [(JavaUtilTimeZone *)&v3 clone];
}

+ (id)getAvailableIDsWithInt:(int)a3
{
  return JavaUtilTimeZone_getAvailableIDsWithInt_(a3);
}

- (id)getDisplayName
{
  uint64_t Default = JavaUtilLocale_getDefault();
  return [(JavaUtilTimeZone *)self getDisplayNameWithBoolean:0 withInt:1 withJavaUtilLocale:Default];
}

- (id)getDisplayNameWithJavaUtilLocale:(id)a3
{
  return [(JavaUtilTimeZone *)self getDisplayNameWithBoolean:0 withInt:1 withJavaUtilLocale:a3];
}

- (id)getDisplayNameWithBoolean:(BOOL)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t Default = JavaUtilLocale_getDefault();
  return [(JavaUtilTimeZone *)self getDisplayNameWithBoolean:v5 withInt:v4 withJavaUtilLocale:Default];
}

- (id)getDisplayNameWithBoolean:(BOOL)a3 withInt:(int)a4 withJavaUtilLocale:(id)a5
{
  if (a4 >= 2)
  {
    v14 = new_JavaLangIllegalArgumentException_init();
    objc_exception_throw(v14);
  }
  if (a3) {
    int v8 = [(JavaUtilTimeZone *)self useDaylightTime];
  }
  else {
    int v8 = 0;
  }
  id result = sub_10028F28C((uint64_t)self, v8, a4 == 0, a5);
  if (!result)
  {
    int v10 = [(JavaUtilTimeZone *)self getRawOffset];
    if (v8) {
      v10 += [(JavaUtilTimeZone *)self getDSTSavings];
    }
    int v11 = v10 / 60000;
    v12 = new_JavaLangStringBuilder_initWithInt_(9u);
    [(JavaLangStringBuilder *)v12 appendWithNSString:@"GMT"];
    if (v10 >= -59999)
    {
      uint64_t v13 = 43;
    }
    else
    {
      int v11 = v10 / -60000;
      uint64_t v13 = 45;
    }
    [(JavaLangStringBuilder *)v12 appendWithChar:v13];
    sub_10028F3A4(v12, 2, v11 / 60);
    [(JavaLangStringBuilder *)v12 appendWithChar:58];
    sub_10028F3A4(v12, 2, v11 % 60);
    return [(JavaLangStringBuilder *)v12 description];
  }
  return result;
}

- (id)displayNameWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withJavaUtilLocale:(id)a5
{
  return sub_10028F28C((uint64_t)self, a3, a4, a5);
}

+ (id)createGmtOffsetStringWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4 withInt:(int)a5
{
  return JavaUtilTimeZone_createGmtOffsetStringWithBoolean_withBoolean_withInt_(a3, a4, a5);
}

+ (void)appendNumberWithJavaLangStringBuilder:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (id)getID
{
  return self->ID_;
}

- (int)getDSTSavings
{
  if ([(JavaUtilTimeZone *)self useDaylightTime]) {
    return 3600000;
  }
  else {
    return 0;
  }
}

- (int)getOffsetWithLong:(int64_t)a3
{
  unsigned int v4 = [(JavaUtilTimeZone *)self inDaylightTimeWithJavaUtilDate:new_JavaUtilDate_initWithLong_(a3)];
  int v5 = [(JavaUtilTimeZone *)self getRawOffset];
  if (v4) {
    v5 += [(JavaUtilTimeZone *)self getDSTSavings];
  }
  return v5;
}

- (int)getOffsetWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withInt:(int)a8
{
  return 0;
}

- (int)getRawOffset
{
  return 1000 * [self->nativeTimeZone_ secondsFromGMT];
}

+ (id)getTimeZoneWithNSString:(id)a3
{
  return JavaUtilTimeZone_getTimeZoneWithNSString_(a3);
}

+ (id)getNativeTimeZoneWithNSString:(id)a3
{
  return sub_10028F8E0((uint64_t)a3);
}

+ (id)getCustomTimeZoneWithNSString:(id)a3
{
  return sub_10028FB54(a3);
}

- (BOOL)hasSameRulesWithJavaUtilTimeZone:(id)a3
{
  if (!a3) {
    return 0;
  }
  unsigned int v4 = [(JavaUtilTimeZone *)self getRawOffset];
  return v4 == [a3 getRawOffset];
}

- (BOOL)inDaylightTimeWithJavaUtilDate:(id)a3
{
  return objc_msgSend(self->nativeTimeZone_, "isDaylightSavingTime", a3);
}

+ (void)setDefaultWithJavaUtilTimeZone:(id)a3
{
}

- (void)setIDWithNSString:(id)a3
{
  if (!a3) {
    objc_exception_throw(objc_alloc_init(JavaLangNullPointerException));
  }
  JreStrongAssign((id *)&self->ID_, a3);
  int v5 = +[NSTimeZone timeZoneWithAbbreviation:a3];
  if (v5 || (int v5 = +[NSTimeZone timeZoneWithName:a3]) != 0)
  {
    JreStrongAssign(&self->nativeTimeZone_, v5);
  }
}

- (BOOL)useDaylightTime
{
  return [self->nativeTimeZone_ nextDaylightSavingTimeTransition] != 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTimeZone;
  [(JavaUtilTimeZone *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilTimeZone *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = JavaUtilRegexPattern_compileWithNSString_(@"^GMT[-+](\\d{1,2})([:.]?(\\d\\d))?$");
    JreStrongAssign((id *)&qword_100562EC0, v2);
    id v3 = new_JavaUtilSimpleTimeZone_initWithInt_withNSString_(0, @"GMT");
    JreStrongAssignAndConsume((id *)&qword_100562EC8, v3);
    unsigned int v4 = new_JavaUtilSimpleTimeZone_initWithInt_withNSString_(0, @"UTC");
    JreStrongAssignAndConsume((id *)&qword_100562ED0, v4);
    int v5 = new_AndroidUtilLruCache_initWithInt_(25);
    JreStrongAssignAndConsume((id *)&qword_100562ED8, v5);
    atomic_store(1u, (unsigned __int8 *)JavaUtilTimeZone__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100482BC8;
}

+ (JavaUtilSimpleTimeZone)getDefaultNativeTimeZone
{
  if ((atomic_load_explicit(JavaUtilTimeZone__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  v0 = +[NSTimeZone defaultTimeZone];
  v1 = [[JavaUtilSimpleTimeZone alloc] initWithInt:1000 * [(NSTimeZone *)v0 secondsFromGMT] withNSString:[(NSTimeZone *)v0 name]];
  return v1;
}

@end