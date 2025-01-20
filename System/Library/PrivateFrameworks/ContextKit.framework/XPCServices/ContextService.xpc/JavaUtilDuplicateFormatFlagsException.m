@interface JavaUtilDuplicateFormatFlagsException
+ (const)__metadata;
- (JavaUtilDuplicateFormatFlagsException)initWithNSString:(id)a3;
- (id)getFlags;
- (id)getMessage;
- (void)dealloc;
@end

@implementation JavaUtilDuplicateFormatFlagsException

- (JavaUtilDuplicateFormatFlagsException)initWithNSString:(id)a3
{
  return self;
}

- (id)getFlags
{
  return self->flags_;
}

- (id)getMessage
{
  return self->flags_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilDuplicateFormatFlagsException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004608C0;
}

@end