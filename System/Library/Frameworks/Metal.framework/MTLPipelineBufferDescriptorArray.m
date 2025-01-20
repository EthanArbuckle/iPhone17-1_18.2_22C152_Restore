@interface MTLPipelineBufferDescriptorArray
+ (MTLPipelineBufferDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLPipelineBufferDescriptor)objectAtIndexedSubscript:(NSUInteger)bufferIndex;
@end

@implementation MTLPipelineBufferDescriptorArray

+ (MTLPipelineBufferDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLPipelineBufferDescriptorArray *)+[MTLPipelineBufferDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLPipelineBufferDescriptorArray;
    return (MTLPipelineBufferDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLPipelineBufferDescriptor)objectAtIndexedSubscript:(NSUInteger)bufferIndex
{
  return 0;
}

@end