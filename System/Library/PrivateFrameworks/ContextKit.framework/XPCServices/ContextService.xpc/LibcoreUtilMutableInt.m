@interface LibcoreUtilMutableInt
+ (const)__metadata;
- (LibcoreUtilMutableInt)initWithInt:(int)a3;
@end

@implementation LibcoreUtilMutableInt

- (LibcoreUtilMutableInt)initWithInt:(int)a3
{
  self->value_ = a3;
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040FE98;
}

@end