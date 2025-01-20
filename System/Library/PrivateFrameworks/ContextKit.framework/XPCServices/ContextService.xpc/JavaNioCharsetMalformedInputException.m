@interface JavaNioCharsetMalformedInputException
+ (const)__metadata;
- (JavaNioCharsetMalformedInputException)initWithInt:(int)a3;
- (id)getMessage;
- (int)getInputLength;
@end

@implementation JavaNioCharsetMalformedInputException

- (JavaNioCharsetMalformedInputException)initWithInt:(int)a3
{
  *(&self->super.super.super.super.rawFrameCount + 1) = a3;
  return self;
}

- (int)getInputLength
{
  return *(&self->super.super.super.super.rawFrameCount + 1);
}

- (id)getMessage
{
  return (id)JreStrcat("$I", (uint64_t)a2, v2, v3, v4, v5, v6, v7, @"Length: ");
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046AF10;
}

@end