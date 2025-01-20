@interface AVCaptureDevice
@end

@implementation AVCaptureDevice

uint64_t __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke()
{
  jfx_highestQualityColorSpace_s_colorSpaceLookup = [MEMORY[0x263EFF9A0] dictionary];
  return MEMORY[0x270F9A758]();
}

void __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 supportedColorSpaces];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke_3;
  v4[3] = &unk_264C0BFD8;
  v4[4] = *(void *)(a1 + 32);
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 integerValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (result > *(void *)(v4 + 24)) {
    *(void *)(v4 + 24) = result;
  }
  return result;
}

@end