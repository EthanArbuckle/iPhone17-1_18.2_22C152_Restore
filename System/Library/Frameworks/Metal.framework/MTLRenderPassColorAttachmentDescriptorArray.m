@interface MTLRenderPassColorAttachmentDescriptorArray
+ (MTLRenderPassColorAttachmentDescriptorArray)alloc;
- (MTLRenderPassColorAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex;
- (id)_descriptorAtIndex:(unint64_t)a3;
@end

@implementation MTLRenderPassColorAttachmentDescriptorArray

+ (MTLRenderPassColorAttachmentDescriptorArray)alloc
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRenderPassColorAttachmentDescriptorArray *)[MTLRenderPassColorAttachmentDescriptorArrayInternal alloc];
  }
  else
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___MTLRenderPassColorAttachmentDescriptorArray;
    return (MTLRenderPassColorAttachmentDescriptorArray *)objc_msgSendSuper2(&v4, sel_alloc);
  }
}

- (MTLRenderPassColorAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

- (id)_descriptorAtIndex:(unint64_t)a3
{
  return 0;
}

@end