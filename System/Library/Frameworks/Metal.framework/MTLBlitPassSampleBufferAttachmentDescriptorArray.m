@interface MTLBlitPassSampleBufferAttachmentDescriptorArray
+ (MTLBlitPassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLBlitPassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex;
@end

@implementation MTLBlitPassSampleBufferAttachmentDescriptorArray

+ (MTLBlitPassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLBlitPassSampleBufferAttachmentDescriptorArray *)+[MTLBlitPassSampleBufferAttachmentDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLBlitPassSampleBufferAttachmentDescriptorArray;
    return (MTLBlitPassSampleBufferAttachmentDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLBlitPassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

@end