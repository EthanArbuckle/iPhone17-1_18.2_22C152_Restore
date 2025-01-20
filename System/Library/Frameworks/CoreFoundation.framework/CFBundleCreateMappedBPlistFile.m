@interface CFBundleCreateMappedBPlistFile
@end

@implementation CFBundleCreateMappedBPlistFile

uint64_t ___CFBundleCreateMappedBPlistFile_block_invoke(uint64_t a1, const void *a2)
{
  if (!*(unsigned char *)(a1 + 32)) {
    return -1;
  }
  os_unfair_lock_lock_with_options();
  if (a2)
  {
    CFArrayRef Mutable = (const __CFArray *)_mappedStringsFiles;
    if (!_mappedStringsFiles)
    {
      CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
      _mappedStringsFiles = (uint64_t)Mutable;
    }
    CFIndex Count = CFArrayGetCount(Mutable);
    CFArrayAppendValue((CFMutableArrayRef)_mappedStringsFiles, a2);
  }
  else
  {
    CFIndex Count = -1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_mappedStringsFilesLock);
  return Count;
}

@end