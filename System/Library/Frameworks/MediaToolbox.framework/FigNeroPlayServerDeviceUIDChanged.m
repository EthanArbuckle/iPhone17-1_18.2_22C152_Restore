@interface FigNeroPlayServerDeviceUIDChanged
@end

@implementation FigNeroPlayServerDeviceUIDChanged

void ___FigNeroPlayServerDeviceUIDChanged_block_invoke(uint64_t a1)
{
  CFStringRef outData = 0;
  UInt32 ioDataSize = 8;
  OSStatus Property = AudioUnitGetProperty(*(AudioUnit *)(*(void *)(a1 + 32) + 48), 0x3586u, 0, 0, &outData, &ioDataSize);
  if (Property != 1063544182 && Property != 0)
  {
    if (Property != -10879) {
      goto LABEL_8;
    }
    CFStringRef outData = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"Unknown HDMI Audio Device UID");
  }
  _FigNeroPlayServerSetDeviceUID(*(void *)(a1 + 32), outData);
LABEL_8:
  if (outData) {
    CFRelease(outData);
  }
}

@end