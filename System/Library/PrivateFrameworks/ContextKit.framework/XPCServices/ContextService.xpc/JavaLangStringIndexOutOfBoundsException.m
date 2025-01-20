@interface JavaLangStringIndexOutOfBoundsException
+ (const)__metadata;
- (JavaLangStringIndexOutOfBoundsException)init;
- (JavaLangStringIndexOutOfBoundsException)initWithInt:(int)a3;
- (JavaLangStringIndexOutOfBoundsException)initWithInt:(int)a3 withInt:(int)a4;
- (JavaLangStringIndexOutOfBoundsException)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (JavaLangStringIndexOutOfBoundsException)initWithNSString:(id)a3;
- (JavaLangStringIndexOutOfBoundsException)initWithNSString:(id)a3 withInt:(int)a4;
- (JavaLangStringIndexOutOfBoundsException)initWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaLangStringIndexOutOfBoundsException

- (JavaLangStringIndexOutOfBoundsException)init
{
  return self;
}

- (JavaLangStringIndexOutOfBoundsException)initWithInt:(int)a3
{
  CFStringRef v9 = JreStrcat("$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"String index out of range: ");
  JavaLangIndexOutOfBoundsException_initWithNSString_(self, v9);
  return self;
}

- (JavaLangStringIndexOutOfBoundsException)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangStringIndexOutOfBoundsException)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

- (JavaLangStringIndexOutOfBoundsException)initWithInt:(int)a3 withInt:(int)a4
{
  CFStringRef v9 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7, @"length=");
  JavaLangIndexOutOfBoundsException_initWithNSString_(self, v9);
  return self;
}

- (JavaLangStringIndexOutOfBoundsException)initWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (JavaLangStringIndexOutOfBoundsException)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  CFStringRef v9 = JreStrcat("$I$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7, @"length=");
  JavaLangIndexOutOfBoundsException_initWithNSString_(self, v9);
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042EB40;
}

@end