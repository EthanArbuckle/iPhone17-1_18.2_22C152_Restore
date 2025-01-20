@interface AVCaptureDevice(CAMCaptureEngine)
- (id)cam_formatForPortraitFrontFacingZoomed;
- (id)cam_highestQualityFormatForConfiguration:()CAMCaptureEngine colorSpace:enableProResVideo:;
- (id)cameraPanoramaFormatForConfiguration:()CAMCaptureEngine;
- (void)cameraVideoFormat:()CAMCaptureEngine orPreset:forVideoConfiguration:videoEncodingBehavior:colorSpace:;
@end

@implementation AVCaptureDevice(CAMCaptureEngine)

- (void)cameraVideoFormat:()CAMCaptureEngine orPreset:forVideoConfiguration:videoEncodingBehavior:colorSpace:
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__AVCaptureDevice_CAMCaptureEngine__cameraVideoFormat_orPreset_forVideoConfiguration_videoEncodingBehavior_colorSpace___block_invoke;
  aBlock[3] = &unk_263FA3528;
  aBlock[4] = a1;
  aBlock[5] = a7;
  BOOL v19 = a6 == 2;
  if (a6 == 2) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = (a7 < 4) & (0xDu >> (a7 & 0xF));
  }
  v11 = _Block_copy(aBlock);
  v12 = (void (**)(void, void))v11;
  switch(a5)
  {
    case 0:
      if (!v10)
      {
LABEL_17:
        v17 = (id *)MEMORY[0x263EF9758];
        goto LABEL_35;
      }
      uint64_t v14 = (*((void (**)(void *, uint64_t))v11 + 2))(v11, 7);
      if (!v14)
      {
        uint64_t v14 = v12[2](v12, 6);
      }
      goto LABEL_7;
    case 1:
      if (v10)
      {
        v13 = (void (*)(void))*((void *)v11 + 2);
        goto LABEL_6;
      }
      v17 = (id *)MEMORY[0x263EF9760];
      goto LABEL_35;
    case 2:
    case 3:
    case 4:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      v13 = (void (*)(void))*((void *)v11 + 2);
      goto LABEL_6;
    case 5:
      if (v10)
      {
        v13 = (void (*)(void))*((void *)v11 + 2);
        goto LABEL_6;
      }
      v17 = (id *)MEMORY[0x263EF9748];
      goto LABEL_35;
    case 6:
      if (v10)
      {
        v13 = (void (*)(void))*((void *)v11 + 2);
        goto LABEL_6;
      }
      v17 = (id *)MEMORY[0x263EF9730];
      goto LABEL_35;
    case 7:
      if (v10)
      {
        v13 = (void (*)(void))*((void *)v11 + 2);
LABEL_6:
        uint64_t v14 = v13();
LABEL_7:
        v15 = (void *)v14;
        id v16 = 0;
        if (a3) {
LABEL_8:
        }
          *a3 = v15;
      }
      else
      {
        v17 = (id *)MEMORY[0x263EF9738];
LABEL_35:
        id v16 = *v17;
LABEL_36:
        v15 = 0;
        if (a3) {
          goto LABEL_8;
        }
      }
      if (a4) {
        *a4 = v16;
      }

      return;
    default:
      switch(a5)
      {
        case 10000:
          goto LABEL_17;
        case 10001:
          v17 = (id *)MEMORY[0x263EF9778];
          goto LABEL_35;
        case 10002:
          v17 = (id *)MEMORY[0x263EF9770];
          goto LABEL_35;
        case 10003:
          v17 = (id *)MEMORY[0x263EF9750];
          goto LABEL_35;
        case 10004:
          v17 = (id *)MEMORY[0x263EF9788];
          goto LABEL_35;
        case 10005:
          v17 = (id *)MEMORY[0x263EF9790];
          goto LABEL_35;
        default:
          id v16 = 0;
          break;
      }
      goto LABEL_36;
  }
}

- (id)cam_highestQualityFormatForConfiguration:()CAMCaptureEngine colorSpace:enableProResVideo:
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  id v18 = 0;
  v8 = [a1 formats];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __107__AVCaptureDevice_CAMCaptureEngine__cam_highestQualityFormatForConfiguration_colorSpace_enableProResVideo___block_invoke;
  v11[3] = &unk_263FA3550;
  v11[5] = a3;
  v11[6] = a4;
  char v12 = a5;
  v11[4] = &v13;
  [v8 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v9;
}

- (id)cameraPanoramaFormatForConfiguration:()CAMCaptureEngine
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__8;
  id v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  v5 = [a1 formats];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__AVCaptureDevice_CAMCaptureEngine__cameraPanoramaFormatForConfiguration___block_invoke;
  v9[3] = &unk_263FA3578;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)cam_formatForPortraitFrontFacingZoomed
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__8;
  id v9 = __Block_byref_object_dispose__8;
  id v10 = 0;
  v1 = [a1 formats];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__AVCaptureDevice_CAMCaptureEngine__cam_formatForPortraitFrontFacingZoomed__block_invoke;
  v4[3] = &unk_263FA35A0;
  v4[4] = &v5;
  [v1 enumerateObjectsUsingBlock:v4];
  id v2 = (id)v6[5];

  _Block_object_dispose(&v5, 8);
  return v2;
}

@end