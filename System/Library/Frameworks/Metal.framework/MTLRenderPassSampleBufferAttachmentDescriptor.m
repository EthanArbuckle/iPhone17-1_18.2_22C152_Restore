@interface MTLRenderPassSampleBufferAttachmentDescriptor
+ (MTLRenderPassSampleBufferAttachmentDescriptor)allocWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLRenderPassSampleBufferAttachmentDescriptor

+ (MTLRenderPassSampleBufferAttachmentDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRenderPassSampleBufferAttachmentDescriptor *)+[MTLRenderPassSampleBufferAttachmentDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRenderPassSampleBufferAttachmentDescriptor;
    return (MTLRenderPassSampleBufferAttachmentDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

@end