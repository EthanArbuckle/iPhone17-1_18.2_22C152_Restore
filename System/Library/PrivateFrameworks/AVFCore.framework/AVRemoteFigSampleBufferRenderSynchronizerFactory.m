@interface AVRemoteFigSampleBufferRenderSynchronizerFactory
- (OpaqueFigSampleBufferRenderSynchronizer)createRenderSynchronizerWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 error:(id *)a5;
@end

@implementation AVRemoteFigSampleBufferRenderSynchronizerFactory

- (OpaqueFigSampleBufferRenderSynchronizer)createRenderSynchronizerWithAllocator:(__CFAllocator *)a3 options:(__CFDictionary *)a4 error:(id *)a5
{
  signed int RemoteWithOptions = FigSampleBufferRenderSynchronizerCreateRemoteWithOptions();
  if (a5 && RemoteWithOptions) {
    *a5 = (id)AVLocalizedErrorWithUnderlyingOSStatus(RemoteWithOptions, 0);
  }
  return 0;
}

@end