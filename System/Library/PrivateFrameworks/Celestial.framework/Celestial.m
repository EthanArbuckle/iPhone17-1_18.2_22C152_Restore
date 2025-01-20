uint64_t ProgressCallback(uint64_t result, float a2)
{
  if (a2 >= 1.0 || vabds_f32(*(float *)(result + 8), a2) >= 0.01)
  {
    *(float *)(result + 8) = fminf(a2, 1.0);
    result = *(void *)(result + 16);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t vt_Copy_yuvs_420v_avg_rotate_arm(const char *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = *a2;
  if ((a3 & 0x1F) != 0) {
    return 1;
  }
  uint64_t v8 = a6[1];
  uint64_t v9 = *a6;
  if ((a5 & 0x1F) != 0 || (v9 & 0x1F) != 0 || (v8 & 0x1F) != 0) {
    return 1;
  }
  v10 = &a1[a5];
  v11 = (int8x16_t *)(v7 + v9 * a4 - v9 + a3 - 16);
  v12 = (int8x16_t *)((char *)v11 - v9);
  v13 = (int8x16_t *)(v6 + v8 * (a4 >> 1) - v8 + a3 - 16);
  uint64_t v14 = a5 - 2 * a3;
  uint64_t v15 = a3 - v9;
  uint64_t v16 = a3 - v8;
  uint64_t v17 = a3 >> 4;
  do
  {
    do
    {
      int8x16x2_t v21 = vld2q_s8(a1);
      a1 += 32;
      int8x16x2_t v22 = vld2q_s8(v10);
      v10 += 32;
      v21.val[0] = vrev64q_s8(v21.val[0]);
      v22.val[0] = vrev64q_s8(v22.val[0]);
      *v11-- = vextq_s8(v21.val[0], v21.val[0], 8uLL);
      *v12-- = vextq_s8(v22.val[0], v22.val[0], 8uLL);
      v21.val[1] = (int8x16_t)vrev64q_s16((int16x8_t)vhaddq_u8((uint8x16_t)v21.val[1], (uint8x16_t)v22.val[1]));
      *v13-- = vextq_s8(v21.val[1], v21.val[1], 8uLL);
      --v17;
    }
    while (v17);
    int64_t v18 = v10 - a1;
    a1 = &v10[v14];
    v10 += v14 + v18;
    int64_t v19 = (char *)v11 - (char *)v12;
    v11 = (int8x16_t *)((char *)v12 + v15);
    v12 = (int8x16_t *)((char *)v12 + v15 - v19);
    v13 = (int8x16_t *)((char *)v13 + v16);
    uint64_t v17 = a3 >> 4;
    a4 -= 2;
  }
  while (a4);
  return 0;
}

uint64_t FigCascadingDownscaleCreate()
{
  return MEMORY[0x1F410D4E0]();
}

uint64_t FigCascadingDownscaleDestroy()
{
  return MEMORY[0x1F410D4E8]();
}

uint64_t FigCascadingDownscale()
{
  return MEMORY[0x1F410D4D8]();
}

uint64_t FigCreateModelSpecificPropertyList()
{
  return MEMORY[0x1F40DD068]();
}

uint64_t FigPhotoJPEGAddMPDataToJPEG()
{
  return MEMORY[0x1F40ED7B0]();
}

uint64_t FigPhotoJPEGCalculateOutputDimensions()
{
  return MEMORY[0x1F40ED7B8]();
}

uint64_t FigPhotoJPEGCopyMPDataFromJPEG()
{
  return MEMORY[0x1F40ED7C0]();
}

uint64_t FigPhotoJPEGCreateCGImageFromIOSurface()
{
  return MEMORY[0x1F40ED7C8]();
}

uint64_t FigPhotoJPEGCreateCGImageFromJPEG()
{
  return MEMORY[0x1F40ED7D0]();
}

uint64_t FigPhotoJPEGCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x1F40ED7D8]();
}

uint64_t FigPhotoJPEGCreateJPEGFromCVPixelBuffer()
{
  return MEMORY[0x1F40ED7E0]();
}

uint64_t FigPhotoJPEGCreateJPEGFromIOSurface()
{
  return MEMORY[0x1F40ED7E8]();
}

uint64_t FigPhotoJPEGCreateJPEGFromSbuf()
{
  return MEMORY[0x1F40ED7F0]();
}

uint64_t FigPhotoJPEGCreateJPEGNativePixelFormatArray()
{
  return MEMORY[0x1F40ED7F8]();
}

uint64_t FigPhotoJPEGCreateJPEGNativeSubsamplingArray()
{
  return MEMORY[0x1F40ED800]();
}

uint64_t FigPhotoJPEGCreateJPEGOutputIOSurface()
{
  return MEMORY[0x1F40ED808]();
}

uint64_t FigPhotoJPEGCreateNativeDecodePixelFormatArray()
{
  return MEMORY[0x1F40ED810]();
}

uint64_t FigPhotoJPEGDecodeJPEGIntoSurface()
{
  return MEMORY[0x1F40ED818]();
}

uint64_t FigPhotoJPEGDecodeSessionCancelRequest()
{
  return MEMORY[0x1F40ED820]();
}

uint64_t FigPhotoJPEGDecodeSessionCopyPoolDebugInfo()
{
  return MEMORY[0x1F40ED828]();
}

uint64_t FigPhotoJPEGDecodeSessionCreate()
{
  return MEMORY[0x1F40ED830]();
}

uint64_t FigPhotoJPEGDecodeSessionCreateCGImageFromData()
{
  return MEMORY[0x1F40ED838]();
}

uint64_t FigPhotoJPEGDecodeSessionCreateCVPixelBufferFromData()
{
  return MEMORY[0x1F40ED840]();
}

uint64_t FigPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously()
{
  return MEMORY[0x1F40ED848]();
}

uint64_t FigPhotoJPEGDecodeSessionDecodeDataToCVPixelBufferAsynchronously()
{
  return MEMORY[0x1F40ED850]();
}

uint64_t FigPhotoJPEGDecodeSessionDiscardCachedBuffers()
{
  return MEMORY[0x1F40ED858]();
}

uint64_t FigPhotoJPEGDecodeSessionGetTypeID()
{
  return MEMORY[0x1F40ED860]();
}

uint64_t FigPhotoJPEGDecodeSessionLogCGImageBackingConversion()
{
  return MEMORY[0x1F40ED868]();
}

uint64_t FigPhotoJPEGGetDecodeTiming()
{
  return MEMORY[0x1F40ED870]();
}

uint64_t FigPhotoJPEGGetEncodeTiming()
{
  return MEMORY[0x1F40ED878]();
}

uint64_t FigPhotoJPEGGetMPDataCountFromJPEG()
{
  return MEMORY[0x1F40ED880]();
}

uint64_t FigPhotoJPEGGetMaximumHardwareOutputDimensions()
{
  return MEMORY[0x1F40ED888]();
}

uint64_t FigPhotoJPEGPreload()
{
  return MEMORY[0x1F40ED890]();
}

uint64_t FigPhotoJPEGShouldUseHardwareDecode()
{
  return MEMORY[0x1F40ED898]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t ObtainCFDataSinfsFromMedia()
{
  return MEMORY[0x1F40EDD58]();
}

uint64_t ObtainSinfInfoFromMedia()
{
  return MEMORY[0x1F40EDD60]();
}

uint64_t PostProcessGetRentalInfo()
{
  return MEMORY[0x1F40EDDA8]();
}

uint64_t PostProcessPurchasedItem()
{
  return MEMORY[0x1F40EDDB0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}