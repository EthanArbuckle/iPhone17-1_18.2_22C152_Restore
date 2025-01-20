@interface JavaUtilFormatFlagsConversionMismatchException
+ (const)__metadata;
- (JavaUtilFormatFlagsConversionMismatchException)initWithNSString:(id)a3 withChar:(unsigned __int16)a4;
- (id)getFlags;
- (id)getMessage;
- (unsigned)getConversion;
- (void)dealloc;
@end

@implementation JavaUtilFormatFlagsConversionMismatchException

- (JavaUtilFormatFlagsConversionMismatchException)initWithNSString:(id)a3 withChar:(unsigned __int16)a4
{
  return self;
}

- (id)getFlags
{
  return self->f_;
}

- (unsigned)getConversion
{
  return self->c_;
}

- (id)getMessage
{
  return (id)JreStrcat("CC$$C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (id)0x25);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilFormatFlagsConversionMismatchException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100407788;
}

@end