@interface JavaUtilIllegalFormatWidthException
+ (const)__metadata;
- (JavaUtilIllegalFormatWidthException)initWithInt:(int)a3;
- (id)getMessage;
- (int)getWidth;
@end

@implementation JavaUtilIllegalFormatWidthException

- (JavaUtilIllegalFormatWidthException)initWithInt:(int)a3
{
  *(&self->super.super.super.super.super.rawFrameCount + 1) = a3;
  return self;
}

- (int)getWidth
{
  return *(&self->super.super.super.super.super.rawFrameCount + 1);
}

- (id)getMessage
{
  return JavaLangInteger_toStringWithInt_(*(&self->super.super.super.super.super.rawFrameCount + 1));
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045A048;
}

@end