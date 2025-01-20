@interface MTLRenderPassSampleBufferAttachmentDescriptorArray
+ (MTLRenderPassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLRenderPassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex;
@end

@implementation MTLRenderPassSampleBufferAttachmentDescriptorArray

+ (MTLRenderPassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRenderPassSampleBufferAttachmentDescriptorArray *)+[MTLRenderPassSampleBufferAttachmentDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRenderPassSampleBufferAttachmentDescriptorArray;
    return (MTLRenderPassSampleBufferAttachmentDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLRenderPassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

@end