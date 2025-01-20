@interface MTLRenderPipelineColorAttachmentDescriptor
+ (MTLRenderPipelineColorAttachmentDescriptor)allocWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLRenderPipelineColorAttachmentDescriptor

+ (MTLRenderPipelineColorAttachmentDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRenderPipelineColorAttachmentDescriptor *)+[MTLRenderPipelineColorAttachmentDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRenderPipelineColorAttachmentDescriptor;
    return (MTLRenderPipelineColorAttachmentDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

@end