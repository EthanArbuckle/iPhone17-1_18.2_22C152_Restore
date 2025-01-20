@interface JavaNioCharsetIllegalCharsetNameException
+ (const)__metadata;
- (JavaNioCharsetIllegalCharsetNameException)initWithNSString:(id)a3;
- (id)getCharsetName;
- (void)dealloc;
@end

@implementation JavaNioCharsetIllegalCharsetNameException

- (JavaNioCharsetIllegalCharsetNameException)initWithNSString:(id)a3
{
  if (a3) {
    CFStringRef v5 = (const __CFString *)a3;
  }
  else {
    CFStringRef v5 = @"null";
  }
  JavaLangIllegalArgumentException_initWithNSString_(self, v5);
  JreStrongAssign((id *)&self->charsetName_, a3);
  return self;
}

- (id)getCharsetName
{
  return self->charsetName_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioCharsetIllegalCharsetNameException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045D528;
}

@end