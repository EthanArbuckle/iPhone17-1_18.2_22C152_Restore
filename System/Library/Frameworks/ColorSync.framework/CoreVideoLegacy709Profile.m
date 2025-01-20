@interface CoreVideoLegacy709Profile
@end

@implementation CoreVideoLegacy709Profile

void __create_CoreVideoLegacy709Profile_block_invoke()
{
  CFDataRef v0 = CFDataCreateWithBytesNoCopy(0, CoreVideoLegacy709_data, 660, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  uint64_t v1 = create(v0, 2, 0);
  if (v1) {
    *(_OWORD *)(v1 + 128) = xmmword_18BE63880;
  }
  create_CoreVideoLegacy709Profile_profile = v1;

  CFRelease(v0);
}

@end