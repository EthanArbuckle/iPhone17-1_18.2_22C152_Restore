@interface GetDefineForPropertyAndSuffix
@end

@implementation GetDefineForPropertyAndSuffix

void ____GetDefineForPropertyAndSuffix_block_invoke()
{
  uint64_t v0 = 0;
  v1 = &qword_267697160;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  do
  {
    v3 = __stringForProperty();
    *(v1 - 4) = (uint64_t)v3;
    MutableCopy = CFStringCreateMutableCopy(v2, 0, v3);
    CFStringUppercase(MutableCopy, 0);
    *(v1 - 3) = (uint64_t)CFStringCreateWithFormat(v2, 0, @"USE_%@", MutableCopy);
    *(v1 - 2) = (uint64_t)CFStringCreateWithFormat(v2, 0, @"USE_%@_COLOR", MutableCopy);
    *(v1 - 1) = (uint64_t)CFStringCreateWithFormat(v2, 0, @"USE_%@_INTENSITY", MutableCopy);
    uint64_t *v1 = (uint64_t)CFStringCreateWithFormat(v2, 0, @"USE_%@_TEXTURE_COMPONENT", MutableCopy);
    v1[1] = (uint64_t)CFStringCreateWithFormat(v2, 0, @"USE_%@TEXCOORD", MutableCopy);
    v1[2] = (uint64_t)CFStringCreateWithFormat(v2, 0, @"USE_%@_MAP", MutableCopy);
    v1[3] = (uint64_t)CFStringCreateWithFormat(v2, 0, @"USE_%@_CUBEMAP", MutableCopy);
    CFRelease(MutableCopy);
    ++v0;
    v1 += 8;
  }
  while (v0 != 16);
}

@end