@interface CFURLCopyFileReferenceURLPath
@end

@implementation CFURLCopyFileReferenceURLPath

CFArrayRef ___CFURLCopyFileReferenceURLPath_block_invoke(uint64_t a1)
{
  values[6] = *(void **)off_1ECE0A5B0;
  values[0] = @"NSURLIsDirectoryKey";
  values[1] = @"_NSURLVolumeIsHFSStandardKey";
  values[2] = @"_NSURLVolumeIDKey";
  values[3] = @"_NSURLFileIDKey";
  values[4] = @"_NSURLParentDirectoryIDKey";
  values[5] = @"NSURLNameKey";
  CFArrayRef result = CFArrayCreate(*(CFAllocatorRef *)(a1 + 32), (const void **)values, 6, &kCFTypeArrayCallBacks);
  _CFURLCopyFileReferenceURLPath_sPropertyKeys = (uint64_t)result;
  return result;
}

@end