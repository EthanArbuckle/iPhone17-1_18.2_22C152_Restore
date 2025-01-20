@interface MTLRenderPassColorAttachmentDescriptor
+ (MTLRenderPassColorAttachmentDescriptor)allocWithZone:(_NSZone *)a3;
@end

@implementation MTLRenderPassColorAttachmentDescriptor

+ (MTLRenderPassColorAttachmentDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRenderPassColorAttachmentDescriptor *)+[MTLRenderPassColorAttachmentDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRenderPassColorAttachmentDescriptor;
    return (MTLRenderPassColorAttachmentDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

@end