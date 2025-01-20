@interface DownloadAccelerationStructure
@end

@implementation DownloadAccelerationStructure

void __DownloadAccelerationStructure_block_invoke(id a1)
{
  id v1 = objc_alloc_init((Class)MTLCommandBufferDescriptor);
  v2 = (void *)DownloadAccelerationStructure_commandBufferDescriptor;
  DownloadAccelerationStructure_commandBufferDescriptor = (uint64_t)v1;

  if ((qword_2501C8 & 0x100000) != 0)
  {
    v3 = (void *)DownloadAccelerationStructure_commandBufferDescriptor;
    unint64_t v4 = (unint64_t)[(id)DownloadAccelerationStructure_commandBufferDescriptor errorOptions] | 1;
    [v3 setErrorOptions:v4];
  }
}

@end