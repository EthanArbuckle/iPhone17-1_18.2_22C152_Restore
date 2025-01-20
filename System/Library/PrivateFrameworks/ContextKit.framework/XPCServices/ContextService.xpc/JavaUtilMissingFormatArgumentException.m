@interface JavaUtilMissingFormatArgumentException
+ (const)__metadata;
- (JavaUtilMissingFormatArgumentException)initWithNSString:(id)a3;
- (id)getFormatSpecifier;
- (id)getMessage;
- (void)dealloc;
@end

@implementation JavaUtilMissingFormatArgumentException

- (JavaUtilMissingFormatArgumentException)initWithNSString:(id)a3
{
  return self;
}

- (id)getFormatSpecifier
{
  return self->s_;
}

- (id)getMessage
{
  return (id)JreStrcat("$$", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"Format specifier: ");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilMissingFormatArgumentException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004048B8;
}

@end