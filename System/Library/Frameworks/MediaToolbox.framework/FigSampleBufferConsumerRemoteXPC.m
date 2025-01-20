@interface FigSampleBufferConsumerRemoteXPC
@end

@implementation FigSampleBufferConsumerRemoteXPC

void __FigSampleBufferConsumerRemoteXPC_ensureClientEstablished_block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"FigSampleBufferConsumer_ServerConnectionDied");
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22098], (const void *)*MEMORY[0x1E4F1CFD0]);
  FigCFDictionarySetInt32();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = FigXPCRemoteClientCreate();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

@end