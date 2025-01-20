@interface JavaUtilMissingFormatWidthException
+ (const)__metadata;
- (JavaUtilMissingFormatWidthException)initWithNSString:(id)a3;
- (id)getFormatSpecifier;
- (id)getMessage;
- (void)dealloc;
@end

@implementation JavaUtilMissingFormatWidthException

- (JavaUtilMissingFormatWidthException)initWithNSString:(id)a3
{
  return self;
}

- (id)getFormatSpecifier
{
  return self->s_;
}

- (id)getMessage
{
  return self->s_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilMissingFormatWidthException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047FC70;
}

@end