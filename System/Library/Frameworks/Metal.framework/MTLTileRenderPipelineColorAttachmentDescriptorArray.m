@interface MTLTileRenderPipelineColorAttachmentDescriptorArray
+ (MTLTileRenderPipelineColorAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLTileRenderPipelineColorAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex;
@end

@implementation MTLTileRenderPipelineColorAttachmentDescriptorArray

+ (MTLTileRenderPipelineColorAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLTileRenderPipelineColorAttachmentDescriptorArray *)+[MTLTileRenderPipelineColorAttachmentDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLTileRenderPipelineColorAttachmentDescriptorArray;
    return (MTLTileRenderPipelineColorAttachmentDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLTileRenderPipelineColorAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

@end