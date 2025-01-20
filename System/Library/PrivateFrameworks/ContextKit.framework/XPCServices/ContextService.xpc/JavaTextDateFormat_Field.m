@interface JavaTextDateFormat_Field
+ (const)__metadata;
+ (id)ofCalendarFieldWithInt:(int)a3;
+ (void)initialize;
- (JavaTextDateFormat_Field)initWithNSString:(id)a3 withInt:(int)a4;
- (int)getCalendarField;
@end

@implementation JavaTextDateFormat_Field

- (JavaTextDateFormat_Field)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

- (int)getCalendarField
{
  return self->calendarField_;
}

+ (id)ofCalendarFieldWithInt:(int)a3
{
  return JavaTextDateFormat_Field_ofCalendarFieldWithInt_(a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilHashtable_init();
    JreStrongAssignAndConsume((id *)&qword_100562DD8, v2);
    uint64_t v3 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v3, @"era", 0);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_ERA_, v3);
    uint64_t v4 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v4, @"year", 1);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_YEAR_, v4);
    uint64_t v5 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v5, @"month", 2);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_MONTH_, v5);
    uint64_t v6 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v6, @"hour of day", 11);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_HOUR_OF_DAY0_, v6);
    uint64_t v7 = [JavaTextDateFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v7, @"hour of day 1");
    v7->calendarField_ = -1;
    v7->calendarField_ = -1;
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_HOUR_OF_DAY1_, v7);
    v8 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v8, @"minute", 12);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_MINUTE_, v8);
    v9 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v9, @"second", 13);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_SECOND_, v9);
    v10 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v10, @"millisecond", 14);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_MILLISECOND_, v10);
    v11 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v11, @"day of week", 7);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_DAY_OF_WEEK_, v11);
    v12 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v12, @"day of month", 5);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_DAY_OF_MONTH_, v12);
    v13 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v13, @"day of year", 6);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_DAY_OF_YEAR_, v13);
    v14 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v14, @"day of week in month", 8);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_DAY_OF_WEEK_IN_MONTH_, v14);
    v15 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v15, @"week of year", 3);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_WEEK_OF_YEAR_, v15);
    v16 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v16, @"week of month", 4);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_WEEK_OF_MONTH_, v16);
    v17 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v17, @"am pm", 9);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_AM_PM_, v17);
    v18 = [JavaTextDateFormat_Field alloc];
    JavaTextDateFormat_Field_initWithNSString_withInt_((uint64_t)v18, @"hour", 10);
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_HOUR0_, v18);
    v19 = [JavaTextDateFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v19, @"hour 1");
    v19->calendarField_ = -1;
    v19->calendarField_ = -1;
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_HOUR1_, v19);
    v20 = [JavaTextDateFormat_Field alloc];
    JavaTextFormat_Field_initWithNSString_(v20, @"time zone");
    v20->calendarField_ = -1;
    v20->calendarField_ = -1;
    JreStrongAssignAndConsume((id *)&JavaTextDateFormat_Field_TIME_ZONE_, v20);
    atomic_store(1u, (unsigned __int8 *)JavaTextDateFormat_Field__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047D010;
}

@end