@interface JavaUtilUnknownFormatConversionException
+ (const)__metadata;
- (JavaUtilUnknownFormatConversionException)initWithNSString:(id)a3;
- (id)getConversion;
- (id)getMessage;
- (void)dealloc;
@end

@implementation JavaUtilUnknownFormatConversionException

- (JavaUtilUnknownFormatConversionException)initWithNSString:(id)a3
{
  return self;
}

- (id)getConversion
{
  return self->s_;
}

- (id)getMessage
{
  return (id)JreStrcat("$$", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"Conversion: ");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilUnknownFormatConversionException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045CA78;
}

@end