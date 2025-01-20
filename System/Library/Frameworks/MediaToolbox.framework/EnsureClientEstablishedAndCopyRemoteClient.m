@interface EnsureClientEstablishedAndCopyRemoteClient
@end

@implementation EnsureClientEstablishedAndCopyRemoteClient

void __remoteFormatReaderClient_EnsureClientEstablishedAndCopyRemoteClient_block_invoke(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 32)) {
    FigRemote_ShouldConnectToMediaplaybackd();
  }
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F22080], @"FormatReader_ServerConnectionDied");
  *((void *)&gFormatReaderRemoteClients + 5 * *(unsigned int *)(a1 + 32) + 3) = FigSimpleMutexCreate();
  *((_DWORD *)&gFormatReaderRemoteClients + 10 * *(unsigned int *)(a1 + 32) + 2) = FigXPCRemoteClientCreate();
  if (Mutable) {
    CFRelease(Mutable);
  }
}

@end