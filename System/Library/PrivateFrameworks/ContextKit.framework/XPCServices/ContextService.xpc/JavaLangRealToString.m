@interface JavaLangRealToString
+ (const)__metadata;
+ (id)doubleToStringWithDouble:(double)a3;
+ (id)floatToStringWithFloat:(float)a3;
+ (void)appendDoubleWithJavaLangAbstractStringBuilder:(id)a3 withDouble:(double)a4;
+ (void)appendFloatWithJavaLangAbstractStringBuilder:(id)a3 withFloat:(float)a4;
@end

@implementation JavaLangRealToString

+ (id)doubleToStringWithDouble:(double)a3
{
  return (id)RealToString_convertDouble(0, a3);
}

+ (void)appendDoubleWithJavaLangAbstractStringBuilder:(id)a3 withDouble:(double)a4
{
}

+ (id)floatToStringWithFloat:(float)a3
{
  return (id)RealToString_convertFloat(0, a3);
}

+ (void)appendFloatWithJavaLangAbstractStringBuilder:(id)a3 withFloat:(float)a4
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100461B50;
}

@end