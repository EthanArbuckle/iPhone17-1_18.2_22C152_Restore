@interface JavaUtilIllegalFormatConversionException
+ (const)__metadata;
- (JavaUtilIllegalFormatConversionException)initWithChar:(unsigned __int16)a3 withIOSClass:(id)a4;
- (id)getArgumentClass;
- (id)getMessage;
- (unsigned)getConversion;
- (void)dealloc;
@end

@implementation JavaUtilIllegalFormatConversionException

- (JavaUtilIllegalFormatConversionException)initWithChar:(unsigned __int16)a3 withIOSClass:(id)a4
{
  return self;
}

- (id)getArgumentClass
{
  return *(id *)&self->c_;
}

- (unsigned)getConversion
{
  return *((_WORD *)&self->super.super.super.super.super.rawFrameCount + 2);
}

- (id)getMessage
{
  if (!*(void *)&self->c_) {
    JreThrowNullPointerException();
  }
  [*(id *)&self->c_ getName];
  return (id)JreStrcat("CC$$$", v2, v3, v4, v5, v6, v7, v8, (id)0x25);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilIllegalFormatConversionException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10048A3A8;
}

@end