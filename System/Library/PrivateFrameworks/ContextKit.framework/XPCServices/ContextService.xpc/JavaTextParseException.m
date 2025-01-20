@interface JavaTextParseException
+ (const)__metadata;
- (JavaTextParseException)initWithNSString:(id)a3 withInt:(int)a4;
- (int)getErrorOffset;
@end

@implementation JavaTextParseException

- (JavaTextParseException)initWithNSString:(id)a3 withInt:(int)a4
{
  JavaTextParseException_initWithNSString_withInt_((uint64_t)self, a3, *(uint64_t *)&a4, *(uint64_t *)&a4, v4, v5, v6, v7);
  return self;
}

- (int)getErrorOffset
{
  return *(&self->super.super.rawFrameCount + 1);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F7D48;
}

@end