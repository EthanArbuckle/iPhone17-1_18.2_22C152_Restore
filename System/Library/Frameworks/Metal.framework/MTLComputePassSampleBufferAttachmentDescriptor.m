@interface MTLComputePassSampleBufferAttachmentDescriptor
+ (MTLComputePassSampleBufferAttachmentDescriptor)allocWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLComputePassSampleBufferAttachmentDescriptor

+ (MTLComputePassSampleBufferAttachmentDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLComputePassSampleBufferAttachmentDescriptor *)+[MTLComputePassSampleBufferAttachmentDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLComputePassSampleBufferAttachmentDescriptor;
    return (MTLComputePassSampleBufferAttachmentDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

@end