@interface LibcoreUtilMutableLong
+ (const)__metadata;
- (LibcoreUtilMutableLong)initWithLong:(int64_t)a3;
@end

@implementation LibcoreUtilMutableLong

- (LibcoreUtilMutableLong)initWithLong:(int64_t)a3
{
  self->value_ = a3;
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041D178;
}

@end