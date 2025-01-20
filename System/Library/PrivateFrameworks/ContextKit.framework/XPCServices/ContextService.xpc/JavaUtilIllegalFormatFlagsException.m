@interface JavaUtilIllegalFormatFlagsException
+ (const)__metadata;
- (JavaUtilIllegalFormatFlagsException)initWithNSString:(id)a3;
- (id)getFlags;
- (id)getMessage;
- (void)dealloc;
@end

@implementation JavaUtilIllegalFormatFlagsException

- (JavaUtilIllegalFormatFlagsException)initWithNSString:(id)a3
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
  v3.super_class = (Class)JavaUtilIllegalFormatFlagsException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046ADA0;
}

@end