@interface VNBrightnessMeasure
+ (BOOL)computeBrightnessScore:(float *)a3 onImage:(__CVBuffer *)a4 error:(id *)a5;
@end

@implementation VNBrightnessMeasure

+ (BOOL)computeBrightnessScore:(float *)a3 onImage:(__CVBuffer *)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
  v41 = a4;
  v8 = a4;
  unint64_t v9 = HeightOfPlane;
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v8, 0);
  float v10 = (float)(WidthOfPlane >> 8);
  if (WidthOfPlane < 0x100) {
    float v10 = 1.0;
  }
  float v48 = v10;
  float v11 = (float)(v9 >> 8);
  if (v9 < 0x100) {
    float v11 = 1.0;
  }
  float v46 = v11;
  if (v9)
  {
    unsigned int v12 = 0;
    unsigned int v13 = 0;
    float v44 = (float)v9;
    float v14 = 0.0;
    int v45 = v9;
    do
    {
      uint64_t v15 = (float)(v14 + 0.5);
      if (v15 >= v9) {
        break;
      }
      float v47 = v14;
      if (WidthOfPlane)
      {
        v16 = &BaseAddressOfPlane[BytesPerRowOfPlane * v15];
        float v17 = 0.0;
        do
        {
          float v18 = v17 + 0.5;
          unsigned int v19 = (float)(v17 + 0.5);
          if (v19 >= WidthOfPlane) {
            break;
          }
          v20 = &v16[4 * v19];
          LOBYTE(v18) = v20[2];
          float v21 = (float)LODWORD(v18) / 255.0;
          if (v21 <= 0.04045)
          {
            float v22 = v21 / 12.92;
          }
          else
          {
            float v21 = powf((float)(v21 + 0.055) / 1.055, 2.4);
            float v22 = v21;
          }
          LOBYTE(v21) = v20[1];
          float v23 = (float)LODWORD(v21) / 255.0;
          if (v23 <= 0.04045)
          {
            float v24 = v23 / 12.92;
          }
          else
          {
            float v23 = powf((float)(v23 + 0.055) / 1.055, 2.4);
            float v24 = v23;
          }
          LOBYTE(v23) = *v20;
          float v25 = (float)LODWORD(v23) / 255.0;
          if (v25 <= 0.04045) {
            float v26 = v25 / 12.92;
          }
          else {
            float v26 = powf((float)(v25 + 0.055) / 1.055, 2.4);
          }
          uint64_t v27 = 0;
          v28 = (float *)&dword_1A4125478;
          do
          {
            float v29 = (float)(v24 * *(v28 - 1)) + (float)(v22 * *(v28 - 2));
            float v30 = *v28;
            v28 += 3;
            *(float *)((char *)&v49 + v27) = v29 + (float)(v26 * v30);
            v27 += 4;
          }
          while (v27 != 12);
          float v31 = v51;
          float v32 = v49 / 0.95047;
          if ((float)(v49 / 0.95047) <= 0.008856) {
            float v33 = (float)(v32 * 7.787) + 0.13793;
          }
          else {
            float v33 = powf(v32, 0.33333);
          }
          if (v50 <= 0.008856) {
            float v34 = (float)(v50 * 7.787) + 0.13793;
          }
          else {
            float v34 = powf(v50, 0.33333);
          }
          float v35 = v31 / 1.0888;
          if ((float)(v31 / 1.0888) <= 0.008856) {
            float v36 = (float)(v35 * 7.787) + 0.13793;
          }
          else {
            float v36 = powf(v35, 0.33333);
          }
          float v37 = (float)(v34 * 116.0) + -16.0;
          float v38 = sqrtf((float)((float)((float)(v34 - v36) * 200.0) * (float)((float)(v34 - v36) * 200.0))+ (float)((float)((float)(v33 - v34) * 500.0) * (float)((float)(v33 - v34) * 500.0)));
          if (tanhf((float)((float)(v37 + -128.0) - v38) + 40.0) > 0.0) {
            ++v13;
          }
          if (tanhf((float)((float)((float)(255.0 - v37) + -240.0) - v38) + 10.0) > 0.0) {
            ++v12;
          }
          float v17 = v48 + v17;
        }
        while (v17 < (float)WidthOfPlane);
      }
      float v14 = v46 + v47;
      LODWORD(v9) = v45;
    }
    while ((float)(v46 + v47) < v44);
  }
  else
  {
    unsigned int v13 = 0;
    unsigned int v12 = 0;
  }
  *a3 = (float)((float)(1.0 - (float)((float)v13 / (float)(v9 * WidthOfPlane)))
              + (float)(1.0 - (float)((float)v12 / (float)(v9 * WidthOfPlane))))
      * 0.5;
  CVPixelBufferUnlockBaseAddress(v41, 1uLL);
  return 1;
}

@end