@interface MTLResourceStatePassDescriptor
+ (MTLResourceStatePassDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLResourceStatePassDescriptor)resourceStatePassDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLResourceStatePassDescriptor

+ (MTLResourceStatePassDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLResourceStatePassDescriptor *)+[MTLResourceStatePassDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLResourceStatePassDescriptor;
    return (MTLResourceStatePassDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLResourceStatePassDescriptor)resourceStatePassDescriptor
{
  v2 = objc_alloc_init(MTLResourceStatePassDescriptorInternal);

  return (MTLResourceStatePassDescriptor *)v2;
}

@end