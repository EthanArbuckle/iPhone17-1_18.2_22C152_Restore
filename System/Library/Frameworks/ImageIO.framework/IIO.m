@interface IIO
@end

@implementation IIO

uint64_t __IIO_OSAppleInternalBuild_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  IIO_OSAppleInternalBuild::is_internal = result;
  return result;
}

void __IIO_HardwareDecoderDefaultValue_block_invoke()
{
  v0 = getenv("IIO_use_hw_decoder");
  if (v0)
  {
    IIO_HardwareDecoderDefaultValue::hwDecoderDefaultValue = strcmp(v0, "0") != 0;
  }
  else
  {
    CFNumberRef v1 = (const __CFNumber *)CFPreferencesCopyValue(@"IIO_use_hw_decoder", @"com.apple.ImageIO", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v1)
    {
      memset(v2, 0, sizeof(v2));
      IIONumber::IIONumber((IIONumber *)v2, v1);
      IIO_HardwareDecoderDefaultValue::hwDecoderDefaultValue = IIONumber::uint8Num(v2) != 0;
      IIONumber::~IIONumber((IIONumber *)v2);
    }
  }
}

uint64_t (*__IIO_LoadHEIFSymbols_block_invoke_4())(void)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  strcpy(__path, "/System/Library/Frameworks/VideoToolbox.framework/VideoToolbox");
  v0 = dlopen(__path, 257);
  if (v0)
  {
    uint64_t result = (uint64_t (*)(void))dlsym(v0, "VTAreVideoDecodersRunningInProcess");
    gFunc_VTAreVideoDecodersRunningInProcess = result;
    if (!result)
    {
      v2 = dlerror();
      return (uint64_t (*)(void))printf("❌  failed to load 'VTAreVideoDecodersRunningInProcess' [%s]\n", v2);
    }
  }
  else
  {
    v3 = dlerror();
    return (uint64_t (*)(void))LogError("IIOLoadVideoToolboxSymbols", 248, "❌  Failed to load %s  [%s]\n", __path, v3);
  }
  return result;
}

void __IIO_HardwareEncoderDefaultValue_block_invoke()
{
  v0 = getenv("IIO_use_hw_encoder");
  if (v0)
  {
    IIO_HardwareEncoderDefaultValue::hwEncoderDefaultValue = strcmp(v0, "0") != 0;
  }
  else
  {
    CFNumberRef v1 = (const __CFNumber *)CFPreferencesCopyValue(@"IIO_use_hw_encoder", @"com.apple.ImageIO", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    if (v1)
    {
      memset(v2, 0, sizeof(v2));
      IIONumber::IIONumber((IIONumber *)v2, v1);
      IIO_HardwareEncoderDefaultValue::hwEncoderDefaultValue = IIONumber::uint8Num(v2) != 0;
      IIONumber::~IIONumber((IIONumber *)v2);
    }
  }
}

@end