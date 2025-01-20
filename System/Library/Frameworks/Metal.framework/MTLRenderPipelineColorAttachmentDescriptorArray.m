@interface MTLRenderPipelineColorAttachmentDescriptorArray
+ (MTLRenderPipelineColorAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLRenderPipelineColorAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex;
@end

@implementation MTLRenderPipelineColorAttachmentDescriptorArray

+ (MTLRenderPipelineColorAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRenderPipelineColorAttachmentDescriptorArray *)+[MTLRenderPipelineColorAttachmentDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRenderPipelineColorAttachmentDescriptorArray;
    return (MTLRenderPipelineColorAttachmentDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLRenderPipelineColorAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

@end