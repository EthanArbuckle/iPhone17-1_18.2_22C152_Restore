@interface JavaUtilGrego
+ (BOOL)isLeapYearWithInt:(int)a3;
+ (const)__metadata;
+ (id)dayToFieldsWithLong:(int64_t)a3 withIntArray:(id)a4;
+ (id)timeToFieldsWithLong:(int64_t)a3 withIntArray:(id)a4;
+ (int)dayOfWeekWithLong:(int64_t)a3;
+ (int)getDayOfWeekInMonthWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)monthLengthWithInt:(int)a3 withInt:(int)a4;
+ (int)previousMonthLengthWithInt:(int)a3 withInt:(int)a4;
+ (int64_t)fieldsToDayWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
+ (int64_t)floorDivideWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (int64_t)floorDivideWithLong:(int64_t)a3 withLong:(int64_t)a4 withLongArray:(id)a5;
+ (void)initialize;
@end

@implementation JavaUtilGrego

+ (BOOL)isLeapYearWithInt:(int)a3
{
  return JavaUtilGrego_isLeapYearWithInt_(a3);
}

+ (int)monthLengthWithInt:(int)a3 withInt:(int)a4
{
  return JavaUtilGrego_monthLengthWithInt_withInt_(a3, a4);
}

+ (int)previousMonthLengthWithInt:(int)a3 withInt:(int)a4
{
  return JavaUtilGrego_previousMonthLengthWithInt_withInt_(a3, a4);
}

+ (int64_t)fieldsToDayWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaUtilGrego_fieldsToDayWithInt_withInt_withInt_(a3, a4, a5);
}

+ (int)dayOfWeekWithLong:(int64_t)a3
{
  return JavaUtilGrego_dayOfWeekWithLong_(a3);
}

+ (id)dayToFieldsWithLong:(int64_t)a3 withIntArray:(id)a4
{
  return JavaUtilGrego_dayToFieldsWithLong_withIntArray_(a3, (IOSIntArray *)a4);
}

+ (id)timeToFieldsWithLong:(int64_t)a3 withIntArray:(id)a4
{
  return JavaUtilGrego_timeToFieldsWithLong_withIntArray_(a3, (IOSIntArray *)a4);
}

+ (int64_t)floorDivideWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  return JavaUtilGrego_floorDivideWithLong_withLong_(a3, a4);
}

+ (int64_t)floorDivideWithLong:(int64_t)a3 withLong:(int64_t)a4 withLongArray:(id)a5
{
  return sub_1001B73C4(a3, a4, (uint64_t)a5);
}

+ (int)getDayOfWeekInMonthWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaUtilGrego_getDayOfWeekInMonthWithInt_withInt_withInt_(a3, a4, a5);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3[2] = xmmword_10031FEF4;
    v3[3] = unk_10031FF04;
    v3[4] = xmmword_10031FF14;
    v3[5] = unk_10031FF24;
    v3[0] = xmmword_10031FED4;
    v3[1] = unk_10031FEE4;
    JreStrongAssignAndConsume((id *)&qword_100560B00, +[IOSIntArray newArrayWithInts:v3 count:24]);
    v2[2] = xmmword_10031FF54;
    v2[3] = unk_10031FF64;
    v2[4] = xmmword_10031FF74;
    v2[5] = unk_10031FF84;
    v2[0] = xmmword_10031FF34;
    v2[1] = unk_10031FF44;
    JreStrongAssignAndConsume((id *)&qword_100560B08, +[IOSIntArray newArrayWithInts:v2 count:24]);
    atomic_store(1u, (unsigned __int8 *)&JavaUtilGrego__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041C260;
}

@end