@interface MTLResourceStatePassSampleBufferAttachmentDescriptorArray
+ (MTLResourceStatePassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLResourceStatePassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex;
@end

@implementation MTLResourceStatePassSampleBufferAttachmentDescriptorArray

+ (MTLResourceStatePassSampleBufferAttachmentDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLResourceStatePassSampleBufferAttachmentDescriptorArray *)+[MTLResourceStatePassSampleBufferAttachmentDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLResourceStatePassSampleBufferAttachmentDescriptorArray;
    return (MTLResourceStatePassSampleBufferAttachmentDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLResourceStatePassSampleBufferAttachmentDescriptor)objectAtIndexedSubscript:(NSUInteger)attachmentIndex
{
  return 0;
}

@end