@interface JavaLangAssertionError
+ (const)__metadata;
- (JavaLangAssertionError)init;
- (JavaLangAssertionError)initWithBoolean:(BOOL)a3;
- (JavaLangAssertionError)initWithChar:(unsigned __int16)a3;
- (JavaLangAssertionError)initWithDouble:(double)a3;
- (JavaLangAssertionError)initWithFloat:(float)a3;
- (JavaLangAssertionError)initWithId:(id)a3;
- (JavaLangAssertionError)initWithInt:(int)a3;
- (JavaLangAssertionError)initWithLong:(int64_t)a3;
- (JavaLangAssertionError)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4;
@end

@implementation JavaLangAssertionError

- (JavaLangAssertionError)init
{
  return self;
}

- (JavaLangAssertionError)initWithNSString:(id)a3 withJavaLangThrowable:(id)a4
{
  return self;
}

- (JavaLangAssertionError)initWithId:(id)a3
{
  return self;
}

- (JavaLangAssertionError)initWithBoolean:(BOOL)a3
{
  v4 = (__CFString *)NSString_valueOfBool_(a3);
  JavaLangAssertionError_initWithId_(self, v4);
  return self;
}

- (JavaLangAssertionError)initWithChar:(unsigned __int16)a3
{
  v4 = NSString_valueOfChar_(a3);
  JavaLangAssertionError_initWithId_(self, v4);
  return self;
}

- (JavaLangAssertionError)initWithInt:(int)a3
{
  v4 = JavaLangInteger_toStringWithInt_(a3);
  JavaLangAssertionError_initWithId_(self, v4);
  return self;
}

- (JavaLangAssertionError)initWithLong:(int64_t)a3
{
  v4 = (__CFString *)JavaLangLong_toStringWithLong_(a3);
  JavaLangAssertionError_initWithId_(self, v4);
  return self;
}

- (JavaLangAssertionError)initWithFloat:(float)a3
{
  v4 = (__CFString *)JavaLangFloat_toStringWithFloat_(a3);
  JavaLangAssertionError_initWithId_(self, v4);
  return self;
}

- (JavaLangAssertionError)initWithDouble:(double)a3
{
  v4 = (__CFString *)JavaLangDouble_toStringWithDouble_(a3);
  JavaLangAssertionError_initWithId_(self, v4);
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100477348;
}

@end