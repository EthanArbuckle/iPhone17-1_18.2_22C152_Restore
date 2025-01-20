@interface MTLComputePassSampleBufferAttachmentDescriptorArray
+ (MTLComputePassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLComputePassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex;
@end

@implementation MTLComputePassSampleBufferAttachmentDescriptorArray

+ (MTLComputePassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLComputePassSampleBufferAttachmentDescriptorArray *)+[MTLComputePassSampleBufferAttachmentDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLComputePassSampleBufferAttachmentDescriptorArray;
    return (MTLComputePassSampleBufferAttachmentDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLComputePassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

@end