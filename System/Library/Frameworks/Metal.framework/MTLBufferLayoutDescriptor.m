@interface MTLBufferLayoutDescriptor
+ (MTLBufferLayoutDescriptor)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStrideDynamic;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation MTLBufferLayoutDescriptor

+ (MTLBufferLayoutDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLBufferLayoutDescriptor *)+[MTLBufferLayoutDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLBufferLayoutDescriptor;
    return (MTLBufferLayoutDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    return 0;
  }
  NSUInteger v6 = [(MTLBufferLayoutDescriptor *)self stride];
  if (v6 != [a3 stride]) {
    return 0;
  }
  MTLStepFunction v7 = [(MTLBufferLayoutDescriptor *)self stepFunction];
  if (v7 != [a3 stepFunction]) {
    return 0;
  }
  NSUInteger v8 = [(MTLBufferLayoutDescriptor *)self stepRate];
  return v8 == [a3 stepRate];
}

- (unint64_t)hash
{
  bzero(v4, 0x18uLL);
  v4[0] = [(MTLBufferLayoutDescriptor *)self stride];
  v4[1] = [(MTLBufferLayoutDescriptor *)self stepFunction];
  v4[2] = [(MTLBufferLayoutDescriptor *)self stepRate];
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (BOOL)isStrideDynamic
{
  return [(MTLBufferLayoutDescriptor *)self stride] == -1;
}

@end