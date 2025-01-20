@interface JavaLangArrayIndexOutOfBoundsException
+ (const)__metadata;
- (JavaLangArrayIndexOutOfBoundsException)init;
- (JavaLangArrayIndexOutOfBoundsException)initWithInt:(int)a3;
- (JavaLangArrayIndexOutOfBoundsException)initWithInt:(int)a3 withInt:(int)a4;
- (JavaLangArrayIndexOutOfBoundsException)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (JavaLangArrayIndexOutOfBoundsException)initWithNSString:(id)a3;
@end

@implementation JavaLangArrayIndexOutOfBoundsException

- (JavaLangArrayIndexOutOfBoundsException)init
{
  return self;
}

- (JavaLangArrayIndexOutOfBoundsException)initWithInt:(int)a3
{
  CFStringRef v9 = JreStrcat("$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"index=");
  JavaLangIndexOutOfBoundsException_initWithNSString_(self, v9);
  return self;
}

- (JavaLangArrayIndexOutOfBoundsException)initWithNSString:(id)a3
{
  return self;
}

- (JavaLangArrayIndexOutOfBoundsException)initWithInt:(int)a3 withInt:(int)a4
{
  CFStringRef v9 = JreStrcat("$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7, @"length=");
  JavaLangIndexOutOfBoundsException_initWithNSString_(self, v9);
  return self;
}

- (JavaLangArrayIndexOutOfBoundsException)initWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  CFStringRef v9 = JreStrcat("$I$I$I", (uint64_t)a2, *(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7, @"length=");
  JavaLangIndexOutOfBoundsException_initWithNSString_(self, v9);
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046B7D8;
}

@end