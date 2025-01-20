@interface AVCaptureDevice
@end

@implementation AVCaptureDevice

uint64_t __119__AVCaptureDevice_CAMCaptureEngine__cameraVideoFormat_orPreset_forVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cam_highestQualityFormatForConfiguration:colorSpace:enableProResVideo:", a2, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __107__AVCaptureDevice_CAMCaptureEngine__cam_highestQualityFormatForConfiguration_colorSpace_enableProResVideo___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v4 = objc_msgSend(v9, "cam_supportsVideoConfiguration:colorSpace:enableProResVideo:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    if (v7)
    {
      uint64_t v4 = objc_msgSend(v7, "cam_compareUsingQuality:", v9);
      id v5 = v9;
      if (v4 != -1) {
        goto LABEL_6;
      }
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    objc_storeStrong((id *)(v6 + 40), a2);
    id v5 = v9;
  }
LABEL_6:
  return MEMORY[0x270F9A758](v4, v5);
}

void __74__AVCaptureDevice_CAMCaptureEngine__cameraPanoramaFormatForConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(v7, "cam_supportsPanoramaConfiguration:", *(void *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __75__AVCaptureDevice_CAMCaptureEngine__cam_formatForPortraitFrontFacingZoomed__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend(v7, "cam_supportsPortraitFrontFacingZoomed"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end