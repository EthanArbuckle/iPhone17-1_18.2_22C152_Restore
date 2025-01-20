@interface JavaUtilIllegalFormatCodePointException
+ (const)__metadata;
- (JavaUtilIllegalFormatCodePointException)initWithInt:(int)a3;
- (id)getMessage;
- (int)getCodePoint;
@end

@implementation JavaUtilIllegalFormatCodePointException

- (JavaUtilIllegalFormatCodePointException)initWithInt:(int)a3
{
  *(&self->super.super.super.super.super.rawFrameCount + 1) = a3;
  return self;
}

- (int)getCodePoint
{
  return *(&self->super.super.super.super.super.rawFrameCount + 1);
}

- (id)getMessage
{
  return JavaLangInteger_toHexStringWithInt_(*(&self->super.super.super.super.super.rawFrameCount + 1));
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10048A9E8;
}

@end