@interface MTLRenderPassDepthAttachmentDescriptor
+ (MTLRenderPassDepthAttachmentDescriptor)allocWithZone:(_NSZone *)a3;
@end

@implementation MTLRenderPassDepthAttachmentDescriptor

+ (MTLRenderPassDepthAttachmentDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRenderPassDepthAttachmentDescriptor *)+[MTLRenderPassDepthAttachmentDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRenderPassDepthAttachmentDescriptor;
    return (MTLRenderPassDepthAttachmentDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

@end