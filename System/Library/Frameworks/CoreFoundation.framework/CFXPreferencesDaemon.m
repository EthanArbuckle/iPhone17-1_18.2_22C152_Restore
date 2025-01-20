@interface CFXPreferencesDaemon
@end

@implementation CFXPreferencesDaemon

void ____CFXPreferencesDaemon_main_block_invoke()
{
}

void ____CFXPreferencesDaemon_main_block_invoke_2()
{
}

void ____CFXPreferencesDaemon_main_block_invoke_3(uint64_t a1, void **a2, uint64_t a3)
{
  v16[7] = *(void *)off_1ECE0A5B0;
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeSetCallBacks);
  for (CFStringRef i = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0); a3; --a3)
  {
    v7 = *a2++;
    v16[0] = off_1ECE0A5A0;
    v16[1] = 3221225472;
    v16[2] = __dumpDebugInfoCallback_block_invoke;
    v16[3] = &unk_1ECE00898;
    v16[4] = v7;
    v16[5] = i;
    v16[6] = Mutable;
    [v7 lockedSync:v16];
  }
  CFRelease(Mutable);
  uint64_t v8 = getpid();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"/tmp/cfprefsddump(%d:%f).txt", v8, *(void *)&Current);
  CFURLRef v11 = CFURLCreateWithFileSystemPath((CFAllocatorRef)&__kCFAllocatorSystemDefault, v10, kCFURLPOSIXPathStyle, 0);
  CFIndex Length = CFStringGetLength(i);
  CFIndex v13 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v14 = (char *)malloc_type_calloc(v13, 1uLL, 0x100004077774924uLL);
  CFStringGetCString(i, v14, v13, 0x8000100u);
  size_t v15 = strlen(v14);
  _CFWriteBytesToFile(v11, v14, v15);
  CFRelease(i);
  CFRelease(v11);
  CFRelease(v10);
  free(v14);
}

@end