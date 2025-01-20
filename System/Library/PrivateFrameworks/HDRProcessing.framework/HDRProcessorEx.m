@interface HDRProcessorEx
- (int)processWithMSRColorConfigs:(id *)a3 MSRScaler:(__IOSurfaceAccelerator *)a4 InputSurfaces:(__IOSurface *)a5 OutputSurfaces:(__IOSurface *)a6 CropRects:(id *)a7 NumOfCropRectsInAGroup:(int *)a8 NumOfGroup:(int)a9;
- (int64_t)generateMSRColorConfigExWithOperation:(unsigned int)a3 InputSurfaces:(__IOSurface *)a4 OutputSurfaces:(__IOSurface *)a5 Metadatas:(id *)a6 Histograms:(RgbHistogram_t *)a7 Configs:(id *)a8 NumOfGroup:(int)a9 MVImageLayout:(unsigned int)a10;
@end

@implementation HDRProcessorEx

- (int64_t)generateMSRColorConfigExWithOperation:(unsigned int)a3 InputSurfaces:(__IOSurface *)a4 OutputSurfaces:(__IOSurface *)a5 Metadatas:(id *)a6 Histograms:(RgbHistogram_t *)a7 Configs:(id *)a8 NumOfGroup:(int)a9 MVImageLayout:(unsigned int)a10
{
  uint64_t v10 = a9;
  int64_t v11 = -17000;
  if (a9 >= 1)
  {
    uint64_t v17 = *(void *)&a3;
    while (1)
    {
      v19 = *a4;
      v20 = *a5;
      id v21 = *a6;
      v22 = *a7;
      v25.receiver = self;
      v25.super_class = (Class)HDRProcessorEx;
      id v23 = [(HDRProcessor *)&v25 generateMSRColorConfigWithOperation:v17 inputSurface:v19 outputSurface:v20 metadata:v21 histogram:v22 config:a8];
      if (v23 != (id)-17000) {
        break;
      }
      ++a8;
      ++a7;
      ++a6;
      ++a5;
      ++a4;
      if (!--v10) {
        return -17000;
      }
    }
    return (int64_t)v23;
  }
  return v11;
}

- (int)processWithMSRColorConfigs:(id *)a3 MSRScaler:(__IOSurfaceAccelerator *)a4 InputSurfaces:(__IOSurface *)a5 OutputSurfaces:(__IOSurface *)a6 CropRects:(id *)a7 NumOfCropRectsInAGroup:(int *)a8 NumOfGroup:(int)a9
{
  v27[3] = *MEMORY[0x263EF8340];
  if (a9 < 1) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v23 = *MEMORY[0x263F4B200];
  uint64_t v22 = *MEMORY[0x263F4B228];
  uint64_t v21 = *MEMORY[0x263F4B268];
  while (1)
  {
    v12 = malloc_type_malloc(0x28uLL, 0x10000407607B2BCuLL);
    *(_DWORD *)v12 = 3;
    v13 = &a3[v11];
    v12[1] = [*v13 bytes];
    *((_DWORD *)v12 + 4) = [*v13 length];
    *(void *)((char *)v12 + 28) = 0;
    *(void *)((char *)v12 + 20) = 0;
    v14 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v12 length:40 freeWhenDone:1];
    objc_super v25 = v14;
    v26[0] = v23;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    v27[0] = v15;
    v27[1] = MEMORY[0x263EFFA88];
    v26[1] = v22;
    v26[2] = v21;
    v27[2] = MEMORY[0x263EFFA80];
    v16 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

    if (a7)
    {
      if (a8 && a7[v11]) {
        break;
      }
    }
    int v19 = IOSurfaceAcceleratorTransformSurface();
    if (v19) {
      goto LABEL_14;
    }
LABEL_12:

    if (++v11 == a9) {
      return 0;
    }
  }
  if (a8[v11] < 1) {
    goto LABEL_12;
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  while (1)
  {
    int v19 = IOSurfaceAcceleratorTransformSurface();
    if (v19) {
      break;
    }
    ++v18;
    v17 += 48;
    if (v18 >= a8[v11]) {
      goto LABEL_12;
    }
  }
LABEL_14:

  return v19;
}

@end