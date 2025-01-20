@interface JavaUtilIllegalFormatPrecisionException
+ (const)__metadata;
- (JavaUtilIllegalFormatPrecisionException)initWithInt:(int)a3;
- (id)getMessage;
- (int)getPrecision;
@end

@implementation JavaUtilIllegalFormatPrecisionException

- (JavaUtilIllegalFormatPrecisionException)initWithInt:(int)a3
{
  *(&self->super.super.super.super.super.rawFrameCount + 1) = a3;
  return self;
}

- (int)getPrecision
{
  return *(&self->super.super.super.super.super.rawFrameCount + 1);
}

- (id)getMessage
{
  return JavaLangInteger_toStringWithInt_(*(&self->super.super.super.super.super.rawFrameCount + 1));
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045DE80;
}

@end