@interface UIDevice
@end

@implementation UIDevice

uint64_t __31__UIDevice_JFX__jfx_memorySize__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(void *)v2 = 0x1800000006;
  size_t v1 = 8;
  return sysctl(v2, 2u, &jfx_memorySize_mem, &v1, 0, 0);
}

uint64_t __32__UIDevice_JFX__jfx_numberOfCPU__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(void *)v2 = 0x1900000006;
  size_t v1 = 4;
  return sysctl(v2, 2u, &jfx_numberOfCPU_cpuCount, &v1, 0, 0);
}

uint64_t __30__UIDevice_JFX__jfx_cpuFamily__block_invoke()
{
  size_t v1 = 4;
  return sysctlbyname("hw.cpufamily", &jfx_cpuFamily_cpuFamily, &v1, 0, 0);
}

void __42__UIDevice_JFX__jfx_hasDepthCapableCamera__block_invoke(uint64_t a1)
{
  char v2 = objc_msgSend(*(id *)(a1 + 32), "jfx_hasTrueDepthFrontCamera");
  if (objc_msgSend(*(id *)(a1 + 32), "jfx_hasDualBackCamera"))
  {
    uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"allowsDepthDualBackCamera"];
  }
  else
  {
    char v4 = 0;
  }
  jfx_hasDepthCapableCamera_result = v2 | v4;
}

void __44__UIDevice_JFX__jfx_hasTrueDepthFrontCamera__block_invoke(uint64_t a1)
{
  size_t v1 = objc_msgSend(*(id *)(a1 + 32), "jfx_getCaptureDeviceForType:", *MEMORY[0x263EF9658]);
  jfx_hasTrueDepthFrontCamera_result = v1 != 0;
}

void __60__UIDevice_JFX__jfx_hasTrueDepthFrontCameraCustomZoomFormat__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "jfx_hasTrueDepthFrontCamera"))
  {
    objc_msgSend(*(id *)(a1 + 32), "jfx_getCaptureDeviceForType:", *MEMORY[0x263EF9658]);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    char v2 = [v3 formats];
    [v2 enumerateObjectsUsingBlock:&__block_literal_global_33_2];
  }
}

void __60__UIDevice_JFX__jfx_hasTrueDepthFrontCameraCustomZoomFormat__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v7 formatDescription]) == 0x90C00000C10)
  {
    v5 = [v7 supportedColorSpaces];
    int v6 = [v5 containsObject:&unk_26E801D10];

    if (v6)
    {
      jfx_hasTrueDepthFrontCameraCustomZoomFormat_result = 1;
      *a4 = 1;
    }
  }
}

void __38__UIDevice_JFX__jfx_hasDualBackCamera__block_invoke(uint64_t a1)
{
  size_t v1 = objc_msgSend(*(id *)(a1 + 32), "jfx_getCaptureDeviceForType:", *MEMORY[0x263EF9620]);
  jfx_hasDualBackCamera_result = v1 != 0;
}

void __33__UIDevice_JFX__jfx_hasHDRCamera__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "jfx_getCaptureDeviceForType:", *MEMORY[0x263EF9658]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  size_t v1 = [v2 formats];
  [v1 enumerateObjectsUsingBlock:&__block_literal_global_36];
}

void __33__UIDevice_JFX__jfx_hasHDRCamera__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = [a2 supportedColorSpaces];
  if ([v5 containsObject:&unk_26E801D28])
  {
    jfx_hasHDRCamera_hasHDRCamera = 1;
    *a4 = 1;
  }
}

uint64_t __38__UIDevice_JFX__jfx_displayColorSpace__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "jfx_supportsHDR"))
  {
    uint64_t v1 = [MEMORY[0x263F61230] rec2100HLGColorSpace];
    uint64_t v2 = jfx_displayColorSpace_s_displayColorSpace;
    jfx_displayColorSpace_s_displayColorSpace = v1;
  }
  else
  {
    id v3 = [MEMORY[0x263F1C920] mainScreen];
    id v7 = [v3 traitCollection];

    if ([v7 displayGamut] == 1) {
      [MEMORY[0x263F61230] p3d65GammaColorSpace];
    }
    else {
    uint64_t v4 = [MEMORY[0x263F61230] rec709GammaColorSpace];
    }
    id v5 = (void *)jfx_displayColorSpace_s_displayColorSpace;
    jfx_displayColorSpace_s_displayColorSpace = v4;

    uint64_t v2 = (uint64_t)v7;
  }
  return MEMORY[0x270F9A758](v1, v2);
}

void __38__UIDevice_JFX__jfx_supportsHDRExport__block_invoke()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  int v1 = objc_msgSend(v0, "jfx_cpuFamily");

  if (v1 > 214503011)
  {
    if (v1 > 747742333)
    {
      BOOL v2 = v1 == 933271106;
      int v3 = 747742334;
    }
    else
    {
      BOOL v2 = v1 == 214503012;
      int v3 = 506291073;
    }
  }
  else if (v1 > -1471079479)
  {
    BOOL v2 = v1 == -1471079478;
    int v3 = -1122301207;
  }
  else
  {
    BOOL v2 = v1 == -1829029944;
    int v3 = -1777893647;
  }
  if (v2 || v1 == v3) {
    jfx_supportsHDRExport_isA10OrLater = 1;
  }
}

void __45__UIDevice_JFX__jfx_getCaptureDeviceForType___block_invoke()
{
  v8[7] = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_opt_new();
  int v1 = (void *)jfx_getCaptureDeviceForType__captureDeviceLookup;
  jfx_getCaptureDeviceForType__captureDeviceLookup = v0;

  uint64_t v2 = *MEMORY[0x263EF9648];
  v8[0] = *MEMORY[0x263EF9658];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x263EF9620];
  v8[2] = *MEMORY[0x263EF9628];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x263EF9670];
  v8[4] = *MEMORY[0x263EF9660];
  v8[5] = v4;
  v8[6] = *MEMORY[0x263EF9638];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:7];
  int v6 = [MEMORY[0x263EFA5A8] discoverySessionWithDeviceTypes:v5 mediaType:*MEMORY[0x263EF9D48] position:0];
  id v7 = [v6 devices];
  [v7 enumerateObjectsUsingBlock:&__block_literal_global_50];
}

void __45__UIDevice_JFX__jfx_getCaptureDeviceForType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)jfx_getCaptureDeviceForType__captureDeviceLookup;
  id v3 = a2;
  id v4 = [v3 deviceType];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

@end