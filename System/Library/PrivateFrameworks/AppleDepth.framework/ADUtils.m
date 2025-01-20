@interface ADUtils
+ (BOOL)updatePixelBufferAllocationWithNewSize:(CGSize)a3 pixelFormat:(unsigned int)a4 pixelBuffer:(__CVBuffer *)a5;
+ (double)addAnglesToRotation:(double)a3 angles:(double)a4;
+ (double)calcRotationAngle:(float *)a3;
+ (float32x2_t)calcRotationMatrix:(float32x4_t)a1;
+ (id)getStandardNameForBufferOfType:(id)a3 moduleName:(id)a4;
+ (id)prioritizationAsString:(int64_t)a3;
+ (id)undistortedCalibrationWithSameFOV:(id)a3;
+ (int64_t)ADReturnFromOSStatus:(int)a3;
+ (int64_t)convertToLevelsConfidence:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 confidenceLevelRanges:(id)a5;
+ (int64_t)copyModifyNormalsPixelBuffer:(__CVBuffer *)a3 output:(__CVBuffer *)a4 normalsRotation:(int64_t)a5;
+ (int64_t)filterInvalidsFromFloatImage:(__CVBuffer *)a3 minValue:(float)a4 maxValue:(float)a5;
+ (int64_t)filterInvalidsFromFloatImage:(__CVBuffer *)a3 minValue:(float)a4 maxValue:(float)a5 clampToMinMax:(BOOL)a6;
+ (int64_t)fuseCurrentDepth:(__CVBuffer *)a3 previousDepth:(__CVBuffer *)a4 intoOutputDepth:(__CVBuffer *)a5 currentConfidence:(__CVBuffer *)a6 previousConfidence:(__CVBuffer *)a7 intoOutputConfidence:(__CVBuffer *)a8 currentNormals:(__CVBuffer *)a9 previousNormals:(__CVBuffer *)a10 intoOutputNormals:(__CVBuffer *)a11 usingAlpha:(__CVBuffer *)a12 defaultAlpha:(float)a13 confidenceUnits:(unint64_t)a14;
+ (int64_t)fuseCurrentDepthAndConfidenceMaps:(__CVBuffer *)a3 previousDepth:(__CVBuffer *)a4 currentConfidence:(__CVBuffer *)a5 previousConfidence:(__CVBuffer *)a6 outputDepth:(__CVBuffer *)a7 outputConfidence:(__CVBuffer *)a8 defaultAlpha:(float)a9 depthMaxDiff:(float)a10;
+ (int64_t)fuseCurrentMap:(__CVBuffer *)a3 previousMap:(__CVBuffer *)a4 intoOutputMap:(__CVBuffer *)a5 usingAlpha:(__CVBuffer *)a6 defaultAlpha:(float)a7 diffThreshold:(float)a8;
+ (int64_t)postProcessConfidence:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 rawConfidenceUnits:(unint64_t)a5 outConfidenceUnits:(unint64_t)a6 confidenceLevelRanges:(id)a7;
+ (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4;
+ (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4 inputRoi:(CGRect)a5;
+ (int64_t)postProcessNormals:(__CVBuffer *)a3 normalsOutput:(__CVBuffer *)a4 normalsRotation:(int64_t)a5;
+ (int64_t)postProcessWithDepth:(__CVBuffer *)a3 confidence:(__CVBuffer *)a4 normals:(__CVBuffer *)a5 depthOutput:(__CVBuffer *)a6 confidenceOutput:(__CVBuffer *)a7 normalsOutput:(__CVBuffer *)a8 normalsRotation:(int64_t)a9 rawConfidenceUnits:(unint64_t)a10 outConfidenceUnits:(unint64_t)a11 confidenceLevelRanges:(id)a12;
+ (int64_t)scaleConvertRotateImage:(__CVBuffer *)a3 rotateBy:(unsigned __int8)a4 cropBy:(CGRect)a5 scaleInto:(__CVBuffer *)a6 intermediateScalingBuffer:(__CVBuffer *)a7 intermediateRotatingBuffer:(__CVBuffer *)a8;
+ (int64_t)scaleConvertRotateImage:(__CVBuffer *)a3 rotateBy:(unsigned __int8)a4 cropBy:(CGRect)a5 scaleInto:(__CVBuffer *)a6 intermediateScalingBuffer:(__CVBuffer *)a7 intermediateRotatingBuffer:(__CVBuffer *)a8 useVT:(BOOL)a9;
+ (int64_t)warpAndFuseWithCurrDepth:(__CVBuffer *)a3 prevDepth:(__CVBuffer *)a4 currNormals:(__CVBuffer *)a5 prevNormals:(__CVBuffer *)a6 opticalFlow:(__CVBuffer *)a7 alphaMap:(__CVBuffer *)a8 defaultAlpha:(float)a9 depthOutput:(__CVBuffer *)pixelBuffer normalsOutput:(__CVBuffer *)a11;
+ (int64_t)warpMap:(__CVBuffer *)a3 toOutput:(__CVBuffer *)a4 usingOpticalFlow:(__CVBuffer *)a5;
+ (int64_t)warpPreviousDepth:(__CVBuffer *)a3 intoCurrentDepth:(__CVBuffer *)a4 previousConfidence:(__CVBuffer *)a5 intoCurrentConfidence:(__CVBuffer *)a6 previousNormals:(__CVBuffer *)a7 intoCurrentNormals:(__CVBuffer *)a8 usingOpticalFlow:(__CVBuffer *)a9;
+ (void)convertRGBAFloat:(__CVBuffer *)a3 toPlanar:(__CVBuffer *)a4;
+ (void)updatePixelBufferIOSurfaceLabel:(id)a3 pixelBuffer:(__CVBuffer *)a4;
@end

@implementation ADUtils

+ (void)updatePixelBufferIOSurfaceLabel:(id)a3 pixelBuffer:(__CVBuffer *)a4
{
  id value = a3;
  IOSurface = CVPixelBufferGetIOSurface(a4);
  IOSurfaceSetValue(IOSurface, (CFStringRef)*MEMORY[0x263F0EE28], value);
}

+ (id)getStandardNameForBufferOfType:(id)a3 moduleName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = 0x263F08000uLL;
  {
    unint64_t v7 = 0x263F08000uLL;
    if (v10)
    {
      +[ADUtils getStandardNameForBufferOfType:moduleName:]::progname = [NSString stringWithUTF8String:getprogname()];
      unint64_t v7 = 0x263F08000;
    }
  }
  objc_msgSend(*(id *)(v7 + 2880), "stringWithFormat:", @"%@/AppleDepth ; %@/%@ ; 1/1",
    +[ADUtils getStandardNameForBufferOfType:moduleName:]::progname,
    v5,
  v8 = v6);

  return v8;
}

+ (id)prioritizationAsString:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 >= 5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v7 = a3;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown prioritization numbered: %lu", buf, 0xCu);
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_26425B9B8[a3];
  }
  return v4;
}

+ (id)undistortedCalibrationWithSameFOV:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 distortionModel];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_2;
  }
  int64_t v7 = [v3 distortionModel];
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v31 = [v3 distortionModel];
      *(_DWORD *)buf = 138543362;
      v37 = v31;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot calculate undistorted fov for distortion %{public}@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v9 = [v3 distortionModel];
  uint64_t v10 = [v9 XThetaType];

  if (v10 == 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot calculate undistorted fov for fsintheta image", buf, 2u);
    }
LABEL_11:
    id v6 = 0;
    goto LABEL_12;
  }
  if (v10)
  {
LABEL_2:
    id v6 = v3;
    goto LABEL_12;
  }
  id v6 = (id)[v3 mutableCopy];
  v11 = objc_opt_new();
  [v6 setDistortionModel:v11];

  [v6 intrinsicMatrix];
  unsigned int v33 = v13;
  uint64_t v34 = v12;
  double v35 = v14;
  [v6 referenceDimensions];
  double v16 = v15;
  [v6 referenceDimensions];
  double v18 = v17;
  [v6 referenceDimensions];
  double v20 = v19;
  [v6 referenceDimensions];
  double v22 = v21;
  float v23 = *(float *)&v34 / v18;
  float v24 = 0.5 / tan(0.5 / v23);
  double v25 = v24;
  float v26 = *(float *)&v34 / v16;
  float v27 = 0.5 / tan(0.5 / v26);
  *(float *)&unsigned int v28 = v20 * v27;
  double v29 = COERCE_DOUBLE(__PAIR64__(HIDWORD(v34), v28));
  *(float *)&unsigned int v30 = v22 * v25;
  objc_msgSend(v6, "setIntrinsicMatrix:", v29, COERCE_DOUBLE(__PAIR64__(v30, v33)), v35);
LABEL_12:

  return v6;
}

+ (void)convertRGBAFloat:(__CVBuffer *)a3 toPlanar:(__CVBuffer *)a4
{
  srcChannels[4] = *(void **)MEMORY[0x263EF8340];
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  memset(&v69, 0, sizeof(v69));
  id v6 = (CGRect *)MEMORY[0x263F001A8];
  PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &v69);
  memset(&v68, 0, sizeof(v68));
  PixelBufferUtils::asVImageBuffer(a4, *v6, &v68);
  v67.vImagePixelCount height = 0;
  v67.width = 0;
  PixelBufferUtils::asVImageBuffer(a4, *v6, &v67);
  v66.vImagePixelCount height = 0;
  v66.width = 0;
  PixelBufferUtils::asVImageBuffer(a4, *v6, &v66);
  v65.vImagePixelCount height = 0;
  v65.width = 0;
  CVPixelBufferRef v60 = a4;
  PixelBufferUtils::asVImageBuffer(a4, *v6, &v65);
  data = (char *)v68.data;
  vImagePixelCount v8 = (v68.height * v68.rowBytes) >> 2;
  v9 = (char *)v68.data + v8;
  uint64_t v10 = (char *)v68.data + v8 + v8;
  size_t v11 = v68.rowBytes >> 2;
  v62 = &v10[v8];
  v65.data = &v10[v8];
  v65.rowBytes = v68.rowBytes >> 2;
  v66.data = v10;
  v66.rowBytes = v68.rowBytes >> 2;
  v67.data = (char *)v68.data + v8;
  v67.rowBytes = v68.rowBytes >> 2;
  v68.rowBytes >>= 2;
  PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
  CVPixelBufferRef pixelBuffer = a3;
  if (PixelBufferUtils::pixelSizeForPixelFormat(PixelFormatType, 0) == 8)
  {
    vImagePixelCount height = v69.height;
    if (v69.height)
    {
      uint64_t v13 = 0;
      unsigned int v14 = 0;
      long long v15 = *(_OWORD *)&v69.width;
      if (LODWORD(v69.width)) {
        BOOL v16 = (v69.width - 1) >> 32 == 0;
      }
      else {
        BOOL v16 = 0;
      }
      char v18 = !v16 || v69.width < 0x18;
      char v61 = v18;
      do
      {
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if ((void)v15)
        {
          uint64_t v20 = *((void *)&v15 + 1) * v13;
          double v21 = &BaseAddress[*((void *)&v15 + 1) * v13];
          double v22 = &data[v11 * v13];
          float v23 = &v9[v11 * v13];
          float v24 = &v10[v11 * v13];
          double v25 = &v62[v11 * v13];
          if (v61)
          {
            unint64_t v26 = 0;
            int v27 = 0;
          }
          else
          {
            int v27 = 0;
            unint64_t v26 = 0;
            uint64_t v28 = v11 * v13 + 2 * v15;
            double v29 = &data[v28];
            unsigned int v30 = &v9[v28];
            v31 = &v10[v28];
            v32 = &v62[v28];
            unsigned int v33 = &BaseAddress[8 * v15 + v20];
            BOOL v35 = v22 < &v10[v28] && v24 < v29;
            BOOL v37 = v22 < v32 && v25 < v29;
            BOOL v39 = v22 < v33 && v21 < v29;
            BOOL v41 = v23 < v31 && v24 < v30;
            BOOL v43 = v23 < v32 && v25 < v30;
            BOOL v45 = v23 < v33 && v21 < v30;
            BOOL v47 = v24 < v32 && v25 < v31;
            BOOL v49 = v24 < v33 && v21 < v31;
            BOOL v51 = v25 < v33 && v21 < v32;
            if ((v23 >= v29 || v22 >= v30) && !v35 && !v37 && !v39 && !v41 && !v43 && !v45 && !v47 && !v49 && !v51)
            {
              uint64_t v53 = 0;
              v54 = (int16x8_t *)&data[v11 * v14];
              unint64_t v55 = v15 & 0xFFFFFFFFFFFFFFF8;
              do
              {
                v56 = (const __int16 *)&v21[2 * (v53 & 0xFFFFFFE0)];
                int16x8x4_t v72 = vld4q_s16(v56);
                int16x8_t *v54 = v72.val[0];
                *(int16x8_t *)((char *)v54 + v8) = v72.val[1];
                *(int16x8_t *)((char *)v54 + 2 * v8) = v72.val[2];
                *(int16x8_t *)((char *)v54++ + 3 * v8) = v72.val[3];
                v53 += 32;
                v55 -= 8;
              }
              while (v55);
              unint64_t v26 = v15 & 0xFFFFFFFFFFFFFFF8;
              int v27 = v15 & 0xFFFFFFF8;
              if ((void)v15 == (v15 & 0xFFFFFFFFFFFFFFF8)) {
                goto LABEL_13;
              }
            }
          }
          unsigned int v57 = v27 + 1;
          unsigned int v58 = 4 * v27;
          do
          {
            uint64_t v59 = 2 * v26;
            *(_WORD *)&v22[v59] = *(_WORD *)&v21[2 * v58];
            *(_WORD *)&v23[v59] = *(_WORD *)&v21[2 * v58 + 2];
            *(_WORD *)&v24[v59] = *(_WORD *)&v21[2 * v58 + 4];
            *(_WORD *)&v25[v59] = *(_WORD *)&v21[2 * v58 + 6];
            unint64_t v26 = v57++;
            v58 += 4;
          }
          while ((unint64_t)v15 > v26);
        }
LABEL_13:
        uint64_t v13 = ++v14;
      }
      while (height > v14);
    }
  }
  else
  {
    srcChannels[0] = CVPixelBufferGetBaseAddress(a3);
    srcChannels[1] = (char *)srcChannels[0] + 4;
    srcChannels[2] = (char *)srcChannels[0] + 8;
    srcChannels[3] = (char *)srcChannels[0] + 12;
    destPlanarBuffers[0] = &v68;
    destPlanarBuffers[1] = &v67;
    destPlanarBuffers[2] = &v66;
    destPlanarBuffers[3] = &v65;
    vImageConvert_ChunkyToPlanarF((const void **)srcChannels, (const vImage_Buffer **)destPlanarBuffers, 4u, 0x10uLL, v69.width, v69.height, v69.rowBytes, 0);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  CVPixelBufferUnlockBaseAddress(v60, 0);
}

+ (int64_t)ADReturnFromOSStatus:(int)a3
{
  if (a3) {
    return -22950;
  }
  else {
    return 0;
  }
}

+ (int64_t)fuseCurrentDepth:(__CVBuffer *)a3 previousDepth:(__CVBuffer *)a4 intoOutputDepth:(__CVBuffer *)a5 currentConfidence:(__CVBuffer *)a6 previousConfidence:(__CVBuffer *)a7 intoOutputConfidence:(__CVBuffer *)a8 currentNormals:(__CVBuffer *)a9 previousNormals:(__CVBuffer *)a10 intoOutputNormals:(__CVBuffer *)a11 usingAlpha:(__CVBuffer *)a12 defaultAlpha:(float)a13 confidenceUnits:(unint64_t)a14
{
  int64_t result = -22953;
  if (a3)
  {
    if (a5)
    {
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      int64_t result = -22953;
      if (PixelFormatType != 1717856627 && PixelFormatType != 1751411059)
      {
        if (a8 && a7 && a6 && !a12)
        {
          LODWORD(v25) = 0.5;
          *(float *)&double v24 = a13;
          int64_t result = [a1 fuseCurrentDepthAndConfidenceMaps:a3 previousDepth:a4 currentConfidence:a6 previousConfidence:a7 outputDepth:a5 outputConfidence:a8 defaultAlpha:v24 depthMaxDiff:v25];
        }
        else
        {
          LODWORD(v25) = 0.5;
          *(float *)&double v24 = a13;
          int64_t result = [a1 fuseCurrentMap:a3 previousMap:a4 intoOutputMap:a5 usingAlpha:a12 defaultAlpha:v24 diffThreshold:v25];
          if (a6 && a7 && a8 && !result)
          {
            LODWORD(v27) = 1.0;
            *(float *)&double v26 = a13;
            int64_t result = [a1 fuseCurrentMap:a6 previousMap:a7 intoOutputMap:a8 usingAlpha:a12 defaultAlpha:v26 diffThreshold:v27];
          }
        }
        if (result) {
          BOOL v28 = 1;
        }
        else {
          BOOL v28 = a11 == 0;
        }
        if (!v28 && a10 != 0 && a9 != 0) {
          return -22952;
        }
      }
    }
  }
  return result;
}

+ (int64_t)fuseCurrentDepthAndConfidenceMaps:(__CVBuffer *)a3 previousDepth:(__CVBuffer *)a4 currentConfidence:(__CVBuffer *)a5 previousConfidence:(__CVBuffer *)a6 outputDepth:(__CVBuffer *)a7 outputConfidence:(__CVBuffer *)a8 defaultAlpha:(float)a9 depthMaxDiff:(float)a10
{
  uint64_t v178 = *MEMORY[0x263EF8340];
  unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  unint64_t v18 = CVPixelBufferGetPixelFormatType(a5);
  unint64_t v19 = v18;
  if ((int)PixelFormatType <= 1717856626)
  {
    if (PixelFormatType == 1278226536) {
      goto LABEL_16;
    }
    if (PixelFormatType != 1717855600)
    {
LABEL_48:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        return -22956;
      }
      PixelBufferUtils::pixelFormatAsString(PixelFormatType, (char *)__p);
      if (v175 >= 0) {
        v155 = __p;
      }
      else {
        v155 = (void **)__p[0];
      }
      *(_DWORD *)buf = 136446210;
      v177 = v155;
      double v21 = &_os_log_internal;
      double v22 = "unsupported depth map format (%{public}s)";
LABEL_77:
      _os_log_error_impl(&dword_215F16000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
      if (v175 < 0) {
        operator delete(__p[0]);
      }
      return -22956;
    }
LABEL_8:
    if ((int)v18 > 1717855599)
    {
      if (v18 != 1717855600)
      {
        if (v18 != 1751410032)
        {
LABEL_11:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            PixelBufferUtils::pixelFormatAsString(v19, (char *)__p);
            if (v175 >= 0) {
              uint64_t v20 = __p;
            }
            else {
              uint64_t v20 = (void **)__p[0];
            }
            *(_DWORD *)buf = 136446210;
            v177 = v20;
            double v21 = &_os_log_internal;
            double v22 = "unsupported conf map format (%{public}s)";
            goto LABEL_77;
          }
          return -22956;
        }
LABEL_52:
        CVPixelBufferLockBaseAddress(a3, 1uLL);
        CVPixelBufferLockBaseAddress(a4, 1uLL);
        CVPixelBufferLockBaseAddress(a7, 0);
        CVPixelBufferLockBaseAddress(a5, 1uLL);
        CVPixelBufferLockBaseAddress(a6, 1uLL);
        CVPixelBufferLockBaseAddress(a8, 0);
        size_t Width = CVPixelBufferGetWidth(a3);
        size_t Height = CVPixelBufferGetHeight(a3);
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
        v158 = (char *)CVPixelBufferGetBaseAddress(a4);
        v97 = (char *)CVPixelBufferGetBaseAddress(a7);
        v98 = (char *)CVPixelBufferGetBaseAddress(a5);
        v99 = (char *)CVPixelBufferGetBaseAddress(a6);
        v100 = a8;
        CVPixelBufferRef pixelBuffer = a8;
        v101 = a3;
        v102 = v99;
        v103 = a6;
        v104 = (char *)CVPixelBufferGetBaseAddress(v100);
        v168 = v101;
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v101);
        CVPixelBufferRef v169 = a4;
        size_t v106 = CVPixelBufferGetBytesPerRow(a4);
        CVPixelBufferRef v170 = a7;
        size_t v107 = CVPixelBufferGetBytesPerRow(a7);
        CVPixelBufferRef v171 = a5;
        size_t v108 = CVPixelBufferGetBytesPerRow(a5);
        v172 = v103;
        size_t v109 = CVPixelBufferGetBytesPerRow(v103);
        size_t v110 = CVPixelBufferGetBytesPerRow(pixelBuffer);
        if (Height && Width)
        {
          for (uint64_t i = 0; i != Height; ++i)
          {
            v112 = (float *)&BaseAddress[i * BytesPerRow];
            v113 = (float *)&v158[i * v106];
            v114 = (float *)&v97[i * v107];
            v115 = &v98[i * v108];
            v116 = &v102[i * v109];
            size_t v117 = Width;
            v118 = &v104[i * v110];
            do
            {
              float v119 = *v112;
              _H2 = *(_WORD *)v115;
              if (*v113 > 0.0)
              {
                __asm { FCVT            S2, H2 }
                _H4 = *(_WORD *)v116;
                __asm { FCVT            S5, H4 }
                float v124 = _S2 * _S5;
                if (v124 <= a9) {
                  float v124 = a9;
                }
                double v125 = 1.0 - v124;
                float v119 = (float)(v119 * v124) + *v113 * v125;
                __asm { FCVT            D3, H4 }
                _D2 = (float)(v124 * _S2) + _D3 * v125;
                __asm { FCVT            H2, D2 }
              }
              *v114++ = v119;
              *(_WORD *)v118 = _H2;
              v118 += 2;
              ++v112;
              ++v113;
              v115 += 2;
              v116 += 2;
              --v117;
            }
            while (v117);
          }
        }
        goto LABEL_72;
      }
    }
    else if (v18 != 1278226534)
    {
      if (v18 != 1278226536) {
        goto LABEL_11;
      }
      goto LABEL_52;
    }
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    CVPixelBufferLockBaseAddress(a7, 0);
    CVPixelBufferLockBaseAddress(a5, 1uLL);
    CVPixelBufferLockBaseAddress(a6, 1uLL);
    CVPixelBufferLockBaseAddress(a8, 0);
    size_t v167 = CVPixelBufferGetWidth(a3);
    size_t v128 = CVPixelBufferGetHeight(a3);
    v163 = (char *)CVPixelBufferGetBaseAddress(a3);
    v159 = (char *)CVPixelBufferGetBaseAddress(a4);
    v129 = (char *)CVPixelBufferGetBaseAddress(a7);
    v130 = (char *)CVPixelBufferGetBaseAddress(a5);
    v131 = (char *)CVPixelBufferGetBaseAddress(a6);
    v132 = a8;
    CVPixelBufferRef pixelBuffer = a8;
    v133 = a3;
    v134 = v131;
    v135 = a6;
    v136 = (char *)CVPixelBufferGetBaseAddress(v132);
    v168 = v133;
    size_t v137 = CVPixelBufferGetBytesPerRow(v133);
    CVPixelBufferRef v169 = a4;
    size_t v138 = CVPixelBufferGetBytesPerRow(a4);
    CVPixelBufferRef v170 = a7;
    size_t v139 = CVPixelBufferGetBytesPerRow(a7);
    CVPixelBufferRef v171 = a5;
    size_t v140 = CVPixelBufferGetBytesPerRow(a5);
    v172 = v135;
    size_t v141 = CVPixelBufferGetBytesPerRow(v135);
    size_t v142 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (v128 && v167)
    {
      for (uint64_t j = 0; j != v128; ++j)
      {
        v144 = (float *)&v163[j * v137];
        v145 = (float *)&v159[j * v138];
        v146 = (float *)&v129[j * v139];
        v147 = (float *)&v130[j * v140];
        v148 = (float *)&v134[j * v141];
        size_t v149 = v167;
        v150 = (float *)&v136[j * v142];
        do
        {
          float v151 = *v144;
          float v152 = *v147;
          if (*v145 > 0.0)
          {
            float v153 = v152 * *v148;
            if (v153 <= a9) {
              float v153 = a9;
            }
            double v154 = 1.0 - v153;
            float v151 = (float)(v151 * v153) + *v145 * v154;
            float v152 = (float)(v152 * v153) + *v148 * v154;
          }
          *v146++ = v151;
          *v150++ = v152;
          ++v144;
          ++v145;
          ++v147;
          ++v148;
          --v149;
        }
        while (v149);
      }
    }
    goto LABEL_72;
  }
  if (PixelFormatType == 1717856627) {
    goto LABEL_8;
  }
  if (PixelFormatType != 1751411059 && PixelFormatType != 1751410032) {
    goto LABEL_48;
  }
LABEL_16:
  if ((int)v18 > 1717855599)
  {
    if (v18 != 1717855600)
    {
      if (v18 != 1751410032)
      {
LABEL_19:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          PixelBufferUtils::pixelFormatAsString(v19, (char *)__p);
          if (v175 >= 0) {
            float v23 = __p;
          }
          else {
            float v23 = (void **)__p[0];
          }
          *(_DWORD *)buf = 136446210;
          v177 = v23;
          double v21 = &_os_log_internal;
          double v22 = "unsupported conf map format (%{public}s)";
          goto LABEL_77;
        }
        return -22956;
      }
      goto LABEL_26;
    }
LABEL_37:
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    CVPixelBufferLockBaseAddress(a7, 0);
    CVPixelBufferLockBaseAddress(a5, 1uLL);
    CVPixelBufferLockBaseAddress(a6, 1uLL);
    CVPixelBufferLockBaseAddress(a8, 0);
    size_t v165 = CVPixelBufferGetWidth(a3);
    size_t v64 = CVPixelBufferGetHeight(a3);
    v161 = (char *)CVPixelBufferGetBaseAddress(a3);
    v157 = (char *)CVPixelBufferGetBaseAddress(a4);
    vImage_Buffer v65 = (char *)CVPixelBufferGetBaseAddress(a7);
    vImage_Buffer v66 = (char *)CVPixelBufferGetBaseAddress(a5);
    vImage_Buffer v67 = (char *)CVPixelBufferGetBaseAddress(a6);
    vImage_Buffer v68 = a8;
    CVPixelBufferRef pixelBuffer = a8;
    vImage_Buffer v69 = a3;
    v70 = v67;
    v71 = a6;
    int16x8x4_t v72 = (char *)CVPixelBufferGetBaseAddress(v68);
    v168 = v69;
    size_t v73 = CVPixelBufferGetBytesPerRow(v69);
    CVPixelBufferRef v169 = a4;
    size_t v74 = CVPixelBufferGetBytesPerRow(a4);
    CVPixelBufferRef v170 = a7;
    size_t v75 = CVPixelBufferGetBytesPerRow(a7);
    CVPixelBufferRef v171 = a5;
    size_t v76 = CVPixelBufferGetBytesPerRow(a5);
    v172 = v71;
    size_t v77 = CVPixelBufferGetBytesPerRow(v71);
    size_t v78 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (v64 && v165)
    {
      for (uint64_t k = 0; k != v64; ++k)
      {
        v80 = &v161[k * v73];
        v81 = &v157[k * v74];
        v82 = &v65[k * v75];
        v83 = (float *)&v66[k * v76];
        v84 = (float *)&v70[k * v77];
        size_t v85 = v165;
        v86 = (float *)&v72[k * v78];
        do
        {
          _H2 = *(_WORD *)v80;
          float v88 = *v83;
          __asm { FCMP            H3, #0 }
          if (!_ZF & _CF)
          {
            float v90 = v88 * *v84;
            if (v90 <= a9) {
              float v90 = a9;
            }
            __asm
            {
              FCVT            S2, H2
              FCVT            D3, H3
            }
            double v93 = 1.0 - v90;
            _D2 = (float)(v90 * _S2) + _D3 * v93;
            __asm { FCVT            H2, D2 }
            float v88 = (float)(v88 * v90) + *v84 * v93;
          }
          *(_WORD *)v82 = _H2;
          v82 += 2;
          *v86++ = v88;
          v80 += 2;
          v81 += 2;
          ++v83;
          ++v84;
          --v85;
        }
        while (v85);
      }
    }
    goto LABEL_72;
  }
  if (v18 == 1278226534) {
    goto LABEL_37;
  }
  if (v18 != 1278226536) {
    goto LABEL_19;
  }
LABEL_26:
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  CVPixelBufferLockBaseAddress(a7, 0);
  CVPixelBufferLockBaseAddress(a5, 1uLL);
  CVPixelBufferLockBaseAddress(a6, 1uLL);
  CVPixelBufferLockBaseAddress(a8, 0);
  size_t v164 = CVPixelBufferGetWidth(a3);
  size_t v24 = CVPixelBufferGetHeight(a3);
  v160 = (char *)CVPixelBufferGetBaseAddress(a3);
  v156 = (char *)CVPixelBufferGetBaseAddress(a4);
  double v25 = (char *)CVPixelBufferGetBaseAddress(a7);
  double v26 = (char *)CVPixelBufferGetBaseAddress(a5);
  double v27 = (char *)CVPixelBufferGetBaseAddress(a6);
  BOOL v28 = a8;
  CVPixelBufferRef pixelBuffer = a8;
  double v29 = a3;
  unsigned int v30 = v27;
  v31 = a6;
  v32 = (char *)CVPixelBufferGetBaseAddress(v28);
  v168 = v29;
  size_t v33 = CVPixelBufferGetBytesPerRow(v29);
  CVPixelBufferRef v169 = a4;
  size_t v34 = CVPixelBufferGetBytesPerRow(a4);
  CVPixelBufferRef v170 = a7;
  size_t v35 = CVPixelBufferGetBytesPerRow(a7);
  CVPixelBufferRef v171 = a5;
  size_t v36 = CVPixelBufferGetBytesPerRow(a5);
  v172 = v31;
  size_t v37 = CVPixelBufferGetBytesPerRow(v31);
  size_t v38 = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (v24 && v164)
  {
    for (uint64_t m = 0; m != v24; ++m)
    {
      v40 = &v160[m * v33];
      BOOL v41 = &v156[m * v34];
      v42 = &v25[m * v35];
      BOOL v43 = &v26[m * v36];
      v44 = &v30[m * v37];
      size_t v45 = v164;
      v46 = &v32[m * v38];
      do
      {
        _H1 = *(_WORD *)v40;
        _H2 = *(_WORD *)v43;
        __asm { FCMP            H3, #0 }
        if (!_ZF & _CF)
        {
          __asm { FCVT            S2, H2 }
          _H4 = *(_WORD *)v44;
          __asm { FCVT            S5, H4 }
          float v57 = _S2 * _S5;
          if (v57 <= a9) {
            float v57 = a9;
          }
          __asm
          {
            FCVT            S1, H1
            FCVT            D3, H3
          }
          double v60 = 1.0 - v57;
          _D1 = (float)(v57 * _S1) + _D3 * v60;
          __asm
          {
            FCVT            H1, D1
            FCVT            D3, H4
          }
          _D2 = (float)(v57 * _S2) + _D3 * v60;
          __asm { FCVT            H2, D2 }
        }
        *(_WORD *)v42 = _H1;
        v42 += 2;
        *(_WORD *)v46 = _H2;
        v46 += 2;
        v40 += 2;
        v41 += 2;
        v43 += 2;
        v44 += 2;
        --v45;
      }
      while (v45);
    }
  }
LABEL_72:
  CVPixelBufferUnlockBaseAddress(v168, 1uLL);
  CVPixelBufferUnlockBaseAddress(v169, 1uLL);
  CVPixelBufferUnlockBaseAddress(v170, 0);
  CVPixelBufferUnlockBaseAddress(v171, 1uLL);
  CVPixelBufferUnlockBaseAddress(v172, 1uLL);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return 0;
}

+ (int64_t)fuseCurrentMap:(__CVBuffer *)a3 previousMap:(__CVBuffer *)a4 intoOutputMap:(__CVBuffer *)a5 usingAlpha:(__CVBuffer *)a6 defaultAlpha:(float)a7 diffThreshold:(float)a8
{
  uint64_t v348 = *MEMORY[0x263EF8340];
  int64_t result = -22953;
  if (!a3 || !a4 || !a5) {
    return result;
  }
  int32x2_t v341 = *(int32x2_t *)&a8;
  int32x2_t v342 = *(int32x2_t *)&a7;
  unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  unint64_t v15 = PixelFormatType;
  if ((int)PixelFormatType <= 1717856626)
  {
    if (PixelFormatType == 1278226536) {
      goto LABEL_13;
    }
    if (PixelFormatType != 1717855600)
    {
LABEL_91:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        PixelBufferUtils::pixelFormatAsString(v15, (char *)&__p);
        if ((__p.width & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (vImage_Buffer *)__p.data;
        }
        LODWORD(buf.data) = 136446210;
        *(void **)((char *)&buf.data + 4) = p_p;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unsupported map format (%{public}s)", (uint8_t *)&buf, 0xCu);
        if (SHIBYTE(__p.width) < 0) {
          operator delete(__p.data);
        }
      }
      return -22956;
    }
    goto LABEL_11;
  }
  if (PixelFormatType == 1717856627)
  {
LABEL_11:
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    CVPixelBufferLockBaseAddress(a5, 0);
    memset(&__p, 0, sizeof(__p));
    size_t rowBytes = MEMORY[0x263F001A8];
    PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &__p);
    memset(&buf, 0, sizeof(buf));
    PixelBufferUtils::asVImageBuffer(a4, *(CGRect *)rowBytes, &buf);
    memset(&v345, 0, sizeof(v345));
    PixelBufferUtils::asVImageBuffer(a5, *(CGRect *)rowBytes, &v345);
    CVPixelBufferRef pixelBuffer = a6;
    if (a6)
    {
      CVPixelBufferLockBaseAddress(a6, 1uLL);
      PixelBufferUtils::asVImageBuffer(a6, *(CGRect *)rowBytes, &v344);
      data = (char *)v344.data;
      size_t rowBytes = v344.rowBytes;
    }
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    if (!Height || !Width) {
      goto LABEL_262;
    }
    size_t v106 = v345.rowBytes;
    size_t v107 = (char *)__p.data;
    size_t v108 = __p.rowBytes;
    size_t v109 = (char *)buf.data;
    size_t v110 = buf.rowBytes;
    v111 = (char *)v345.data;
    if (a6)
    {
      if (Width < 4)
      {
        v112 = (float *)(data + 8);
        v113 = (float *)((char *)v345.data + 8);
        v114 = (float *)((char *)__p.data + 8);
        v115 = (float *)((char *)buf.data + 4);
        do
        {
          float v116 = *(v114 - 2);
          float v117 = *(v115 - 1);
          float v118 = *(v112 - 2);
          if (v118 >= 0.0) {
            float v119 = *(v112 - 2);
          }
          else {
            float v119 = 0.0;
          }
          if (v118 <= 1.0) {
            float v120 = v119;
          }
          else {
            float v120 = 1.0;
          }
          if (vabds_f32(v116, v117) >= *(float *)v341.i32) {
            float v120 = *(float *)v342.i32;
          }
          float v121 = (float)(v117 * (float)(1.0 - v120)) + (float)(v116 * v120);
          if (v117 > 0.0) {
            float v116 = v121;
          }
          *(v113 - 2) = v116;
          if (Width != 1)
          {
            float v122 = *(v114 - 1);
            float v123 = *v115;
            float v124 = *(v112 - 1);
            if (v124 >= 0.0) {
              float v125 = *(v112 - 1);
            }
            else {
              float v125 = 0.0;
            }
            if (v124 <= 1.0) {
              float v126 = v125;
            }
            else {
              float v126 = 1.0;
            }
            if (vabds_f32(v122, v123) >= *(float *)v341.i32) {
              float v126 = *(float *)v342.i32;
            }
            float v127 = (float)(v123 * (float)(1.0 - v126)) + (float)(v122 * v126);
            if (v123 > 0.0) {
              float v122 = v127;
            }
            *(v113 - 1) = v122;
            if (Width != 2)
            {
              float v128 = *v114;
              float v129 = v115[1];
              if (*v112 >= 0.0) {
                float v130 = *v112;
              }
              else {
                float v130 = 0.0;
              }
              if (*v112 <= 1.0) {
                float v131 = v130;
              }
              else {
                float v131 = 1.0;
              }
              if (vabds_f32(v128, v129) >= *(float *)v341.i32) {
                float v131 = *(float *)v342.i32;
              }
              float v132 = (float)(v129 * (float)(1.0 - v131)) + (float)(v128 * v131);
              if (v129 > 0.0) {
                float v128 = v132;
              }
              float *v113 = v128;
            }
          }
          v112 = (float *)((char *)v112 + rowBytes);
          v113 = (float *)((char *)v113 + v106);
          v114 = (float *)((char *)v114 + v108);
          v115 = (float *)((char *)v115 + v110);
          --Height;
        }
        while (Height);
        goto LABEL_262;
      }
      uint64_t v253 = 0;
      unint64_t v254 = 4 * (Width & 0xFFFFFFFFFFFFFFFCLL);
      float32x4_t v255 = (float32x4_t)vdupq_lane_s32(v341, 0);
      int8x16_t v256 = (int8x16_t)vdupq_lane_s32(v342, 0);
      __asm { FMOV            V4.4S, #1.0 }
      v258 = (float32x4_t *)data;
      v259 = (int8x16_t *)v345.data;
      v260 = (float32x4_t *)buf.data;
      v261 = (float32x4_t *)__p.data;
      while (1)
      {
        v262 = &v107[v108 * v253];
        v263 = &v109[v110 * v253];
        v264 = (float *)&v111[v106 * v253];
        v265 = (float *)&data[v253 * rowBytes];
        BOOL v266 = (unint64_t)((char *)v264 - v262) >= 0x10 && (unint64_t)((char *)v264 - v263) >= 0x10;
        if (!v266 || (unint64_t)((char *)v264 - (char *)v265) < 0x10) {
          break;
        }
        v265 = (float *)((char *)v265 + v254);
        v263 += v254;
        v269 = v258;
        v270 = v259;
        v271 = v260;
        v272 = v261;
        unint64_t v273 = Width & 0xFFFFFFFFFFFFFFFCLL;
        do
        {
          float32x4_t v274 = *v272++;
          float32x4_t v275 = v274;
          float32x4_t v276 = *v271++;
          float32x4_t v277 = v276;
          float32x4_t v278 = *v269++;
          float32x4_t v279 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v255, vabdq_f32(v275, v277)), vbslq_s8((int8x16_t)vcgtq_f32(v278, _Q4), (int8x16_t)_Q4, vbicq_s8((int8x16_t)v278, (int8x16_t)vcltzq_f32(v278))), v256);
          *v270++ = vbslq_s8((int8x16_t)vclezq_f32(v277), (int8x16_t)v275, (int8x16_t)vmlaq_f32(vmulq_f32(v277, vsubq_f32(_Q4, v279)), v279, v275));
          v273 -= 4;
        }
        while (v273);
        if (Width != (Width & 0xFFFFFFFFFFFFFFFCLL))
        {
          v264 = (float *)((char *)v264 + v254);
          v262 += v254;
          unint64_t v268 = Width & 0xFFFFFFFFFFFFFFFCLL;
LABEL_220:
          size_t v280 = Width - v268;
          do
          {
            float v281 = *(float *)v262;
            v262 += 4;
            float v282 = v281;
            float v283 = *(float *)v263;
            v263 += 4;
            float v284 = v283;
            float v285 = *v265++;
            float v286 = v285;
            if (v285 >= 0.0) {
              float v287 = v286;
            }
            else {
              float v287 = 0.0;
            }
            if (v286 <= 1.0) {
              float v288 = v287;
            }
            else {
              float v288 = 1.0;
            }
            if (vabds_f32(v282, v284) >= *(float *)v341.i32) {
              float v288 = *(float *)v342.i32;
            }
            float v289 = (float)(v284 * (float)(1.0 - v288)) + (float)(v282 * v288);
            if (v284 > 0.0) {
              float v282 = v289;
            }
            *v264++ = v282;
            --v280;
          }
          while (v280);
        }
        ++v253;
        v261 = (float32x4_t *)((char *)v261 + v108);
        v260 = (float32x4_t *)((char *)v260 + v110);
        v259 = (int8x16_t *)((char *)v259 + v106);
        v258 = (float32x4_t *)((char *)v258 + rowBytes);
        if (v253 == Height) {
          goto LABEL_262;
        }
      }
      unint64_t v268 = 0;
      goto LABEL_220;
    }
    float v236 = 1.0 - *(float *)v342.i32;
    if (Width < 8)
    {
      v237 = (float *)((char *)v345.data + 12);
      v238 = (float *)((char *)buf.data + 12);
      v239 = (float *)((char *)__p.data + 12);
      do
      {
        float v240 = *(v239 - 3);
        float v241 = *(v238 - 3);
        if (v241 > 0.0) {
          float v240 = (float)(v241 * v236) + (float)(v240 * *(float *)v342.i32);
        }
        *(v237 - 3) = v240;
        if (Width != 1)
        {
          float v242 = *(v239 - 2);
          float v243 = *(v238 - 2);
          if (v243 > 0.0) {
            float v242 = (float)(v243 * v236) + (float)(v242 * *(float *)v342.i32);
          }
          *(v237 - 2) = v242;
          if (Width != 2)
          {
            float v244 = *(v239 - 1);
            float v245 = *(v238 - 1);
            if (v245 > 0.0) {
              float v244 = (float)(v245 * v236) + (float)(v244 * *(float *)v342.i32);
            }
            *(v237 - 1) = v244;
            if (Width != 3)
            {
              float v246 = *v239;
              if (*v238 > 0.0) {
                float v246 = (float)(*v238 * v236) + (float)(*v239 * *(float *)v342.i32);
              }
              float *v237 = v246;
              if (Width != 4)
              {
                float v247 = v239[1];
                float v248 = v238[1];
                if (v248 > 0.0) {
                  float v247 = (float)(v248 * v236) + (float)(v247 * *(float *)v342.i32);
                }
                v237[1] = v247;
                if (Width != 5)
                {
                  float v249 = v239[2];
                  float v250 = v238[2];
                  if (v250 > 0.0) {
                    float v249 = (float)(v250 * v236) + (float)(v249 * *(float *)v342.i32);
                  }
                  v237[2] = v249;
                  if (Width != 6)
                  {
                    float v251 = v239[3];
                    float v252 = v238[3];
                    if (v252 > 0.0) {
                      float v251 = (float)(v252 * v236) + (float)(v251 * *(float *)v342.i32);
                    }
                    v237[3] = v251;
                  }
                }
              }
            }
          }
        }
        v237 = (float *)((char *)v237 + v106);
        v238 = (float *)((char *)v238 + v110);
        v239 = (float *)((char *)v239 + v108);
        --Height;
      }
      while (Height);
      goto LABEL_262;
    }
    uint64_t v320 = 0;
    unint64_t v321 = 4 * (Width & 0xFFFFFFFFFFFFFFF8);
    float32x4_t v322 = (float32x4_t)vdupq_lane_s32(v342, 0);
    v323 = (int8x16_t *)((char *)v345.data + 16);
    v324 = (int8x16_t *)((char *)__p.data + 16);
    v325 = (float32x4_t *)((char *)buf.data + 16);
    while (1)
    {
      unint64_t v326 = 0;
      v327 = &v107[v108 * v320];
      v328 = (float *)&v109[v110 * v320];
      v329 = (float *)&v111[v106 * v320];
      if ((unint64_t)((char *)v329 - v327) < 0x20 || (unint64_t)((char *)v329 - (char *)v328) < 0x20) {
        goto LABEL_257;
      }
      v328 = (float *)((char *)v328 + v321);
      v330 = v325;
      v331 = v324;
      v332 = v323;
      unint64_t v333 = Width & 0xFFFFFFFFFFFFFFF8;
      do
      {
        int8x16_t v334 = vbslq_s8((int8x16_t)vclezq_f32(*v330), *v331, (int8x16_t)vmlaq_f32(vmulq_n_f32(*v330, v236), v322, *(float32x4_t *)v331));
        v332[-1] = vbslq_s8((int8x16_t)vclezq_f32(v330[-1]), v331[-1], (int8x16_t)vmlaq_f32(vmulq_n_f32(v330[-1], v236), v322, (float32x4_t)v331[-1]));
        int8x16_t *v332 = v334;
        v332 += 2;
        v331 += 2;
        v330 += 2;
        v333 -= 8;
      }
      while (v333);
      if (Width != (Width & 0xFFFFFFFFFFFFFFF8)) {
        break;
      }
LABEL_250:
      ++v320;
      v323 = (int8x16_t *)((char *)v323 + v106);
      v324 = (int8x16_t *)((char *)v324 + v108);
      v325 = (float32x4_t *)((char *)v325 + v110);
      if (v320 == Height) {
        goto LABEL_262;
      }
    }
    v329 = (float *)((char *)v329 + v321);
    v327 += v321;
    unint64_t v326 = Width & 0xFFFFFFFFFFFFFFF8;
LABEL_257:
    size_t v335 = Width - v326;
    do
    {
      float v336 = *(float *)v327;
      v327 += 4;
      float v337 = v336;
      float v338 = *v328++;
      float v339 = (float)(v338 * v236) + (float)(v337 * *(float *)v342.i32);
      if (v338 > 0.0) {
        float v337 = v339;
      }
      *v329++ = v337;
      --v335;
    }
    while (v335);
    goto LABEL_250;
  }
  if (PixelFormatType != 1751411059 && PixelFormatType != 1751410032) {
    goto LABEL_91;
  }
LABEL_13:
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  CVPixelBufferLockBaseAddress(a5, 0);
  memset(&__p, 0, sizeof(__p));
  size_t v17 = MEMORY[0x263F001A8];
  PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &__p);
  memset(&buf, 0, sizeof(buf));
  PixelBufferUtils::asVImageBuffer(a4, *(CGRect *)v17, &buf);
  memset(&v345, 0, sizeof(v345));
  PixelBufferUtils::asVImageBuffer(a5, *(CGRect *)v17, &v345);
  CVPixelBufferRef pixelBuffer = a6;
  if (a6)
  {
    CVPixelBufferLockBaseAddress(a6, 1uLL);
    PixelBufferUtils::asVImageBuffer(a6, *(CGRect *)v17, &v344);
    data = (char *)v344.data;
    size_t v17 = v344.rowBytes;
  }
  size_t v18 = CVPixelBufferGetWidth(a3);
  size_t v19 = CVPixelBufferGetHeight(a3);
  if (!v19 || !v18) {
    goto LABEL_262;
  }
  size_t v20 = v345.rowBytes;
  double v21 = (char *)__p.data;
  size_t v22 = __p.rowBytes;
  float v23 = (char *)buf.data;
  size_t v24 = buf.rowBytes;
  double v25 = (char *)v345.data;
  if (!a6)
  {
    float v133 = 1.0 - *(float *)v342.i32;
    if (v18 < 8)
    {
      v134 = (short float *)((char *)v345.data + 6);
      v135 = (__int16 *)((char *)buf.data + 6);
      v136 = (short float *)((char *)__p.data + 6);
      do
      {
        _H1 = *(v136 - 3);
        __asm { FCVT            S2, H1 }
        _H3 = *(v135 - 3);
        __asm { FCVT            S4, H3 }
        _S2 = (float)(v133 * _S4) + (float)(_S2 * *(float *)v342.i32);
        __asm
        {
          FCVT            H2, S2
          FCMP            H3, #0
        }
        if (!_ZF && _CF) {
          _H1 = _H2;
        }
        *(v134 - 3) = _H1;
        if (v18 != 1)
        {
          _H1 = *(v136 - 2);
          __asm { FCVT            S2, H1 }
          _H3 = *(v135 - 2);
          __asm { FCVT            S4, H3 }
          _S2 = (float)(v133 * _S4) + (float)(_S2 * *(float *)v342.i32);
          __asm
          {
            FCVT            H2, S2
            FCMP            H3, #0
          }
          if (!_ZF && _CF) {
            _H1 = _H2;
          }
          *(v134 - 2) = _H1;
          if (v18 != 2)
          {
            _H1 = *(v136 - 1);
            __asm { FCVT            S2, H1 }
            _H3 = *(v135 - 1);
            __asm { FCVT            S4, H3 }
            _S2 = (float)(v133 * _S4) + (float)(_S2 * *(float *)v342.i32);
            __asm
            {
              FCVT            H2, S2
              FCMP            H3, #0
            }
            if (!_ZF && _CF) {
              _H1 = _H2;
            }
            *(v134 - 1) = _H1;
            if (v18 != 3)
            {
              _H1 = *v136;
              __asm { FCVT            S2, H1 }
              _H3 = *v135;
              __asm { FCVT            S4, H3 }
              _S2 = (float)(v133 * _S4) + (float)(_S2 * *(float *)v342.i32);
              __asm
              {
                FCVT            H2, S2
                FCMP            H3, #0
              }
              if (!_ZF && _CF) {
                _H1 = _H2;
              }
              short float *v134 = _H1;
              if (v18 != 4)
              {
                _H1 = v136[1];
                __asm { FCVT            S2, H1 }
                _H3 = v135[1];
                __asm { FCVT            S4, H3 }
                _S2 = (float)(v133 * _S4) + (float)(_S2 * *(float *)v342.i32);
                __asm
                {
                  FCVT            H2, S2
                  FCMP            H3, #0
                }
                if (!_ZF && _CF) {
                  _H1 = _H2;
                }
                v134[1] = _H1;
                if (v18 != 5)
                {
                  _H1 = v136[2];
                  __asm { FCVT            S2, H1 }
                  _H3 = v135[2];
                  __asm { FCVT            S4, H3 }
                  _S2 = (float)(v133 * _S4) + (float)(_S2 * *(float *)v342.i32);
                  __asm
                  {
                    FCVT            H2, S2
                    FCMP            H3, #0
                  }
                  if (!_ZF && _CF) {
                    _H1 = _H2;
                  }
                  v134[2] = _H1;
                  if (v18 != 6)
                  {
                    _H1 = v136[3];
                    __asm { FCVT            S2, H1 }
                    _H3 = v135[3];
                    __asm { FCVT            S4, H3 }
                    _S2 = (float)(v133 * _S4) + (float)(_S2 * *(float *)v342.i32);
                    __asm
                    {
                      FCVT            H2, S2
                      FCMP            H3, #0
                    }
                    if (!_ZF && _CF) {
                      _H1 = _H2;
                    }
                    v134[3] = _H1;
                  }
                }
              }
            }
          }
        }
        v134 = (short float *)((char *)v134 + v20);
        v135 = (__int16 *)((char *)v135 + v24);
        v136 = (short float *)((char *)v136 + v22);
        --v19;
      }
      while (v19);
      goto LABEL_262;
    }
    uint64_t v290 = 0;
    unint64_t v291 = 2 * (v18 & 0xFFFFFFFFFFFFFFF8);
    float32x4_t v292 = (float32x4_t)vdupq_lane_s32(v342, 0);
    v293 = (int8x16_t *)v345.data;
    v294 = (float16x8_t *)buf.data;
    v295 = (float16x8_t *)__p.data;
    while (1)
    {
      v296 = &v21[v22 * v290];
      v297 = &v23[v24 * v290];
      v298 = (short float *)&v25[v20 * v290];
      if ((unint64_t)((char *)v298 - v296) < 0x10 || (unint64_t)((char *)v298 - v297) < 0x10) {
        break;
      }
      v297 += v291;
      v301 = v293;
      v302 = v294;
      v303 = v295;
      unint64_t v304 = v18 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        float16x8_t v305 = *v303++;
        int8x16_t v306 = (int8x16_t)v305;
        float32x4_t v307 = vcvtq_f32_f16(*(float16x4_t *)v305.i8);
        float32x4_t v308 = vcvt_hight_f32_f16(v305);
        float16x8_t v309 = *v302++;
        *v301++ = vbslq_s8((int8x16_t)vclezq_f16(v309), v306, (int8x16_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(vmlaq_f32(vmulq_n_f32(vcvtq_f32_f16(*(float16x4_t *)v309.i8), v133), v292, v307)), vmlaq_f32(vmulq_n_f32(vcvt_hight_f32_f16(v309), v133), v292, v308)));
        v304 -= 8;
      }
      while (v304);
      if (v18 != (v18 & 0xFFFFFFFFFFFFFFF8))
      {
        v298 = (short float *)((char *)v298 + v291);
        v296 += v291;
        unint64_t v300 = v18 & 0xFFFFFFFFFFFFFFF8;
LABEL_244:
        size_t v310 = v18 - v300;
        do
        {
          short float v311 = *(short float *)v296;
          v296 += 2;
          _H2 = v311;
          __asm { FCVT            S3, H2 }
          __int16 v314 = *(_WORD *)v297;
          v297 += 2;
          _H4 = v314;
          __asm { FCVT            S5, H4 }
          _S3 = (float)(v133 * _S5) + (float)(_S3 * *(float *)v342.i32);
          __asm
          {
            FCVT            H3, S3
            FCMP            H4, #0
          }
          if (!_ZF && _CF) {
            _H2 = _H3;
          }
          *v298++ = _H2;
          --v310;
        }
        while (v310);
      }
      ++v290;
      v295 = (float16x8_t *)((char *)v295 + v22);
      v294 = (float16x8_t *)((char *)v294 + v24);
      v293 = (int8x16_t *)((char *)v293 + v20);
      if (v290 == v19) {
        goto LABEL_262;
      }
    }
    unint64_t v300 = 0;
    goto LABEL_244;
  }
  if (v18 >= 8)
  {
    uint64_t v186 = 0;
    float32x4_t v187 = (float32x4_t)vdupq_lane_s32(v341, 0);
    unint64_t v188 = 2 * (v18 & 0xFFFFFFFFFFFFFFF8);
    int8x16_t v189 = (int8x16_t)vdupq_lane_s32(v342, 0);
    v190.i64[0] = 0x3C003C003C003C00;
    v190.i64[1] = 0x3C003C003C003C00;
    v191 = (float16x8_t *)data;
    __asm { FMOV            V6.4S, #1.0 }
    v193 = (int8x16_t *)v345.data;
    v194 = (float16x8_t *)buf.data;
    v195 = (float16x8_t *)__p.data;
    while (1)
    {
      v196 = &v21[v22 * v186];
      v197 = &v23[v24 * v186];
      v198 = (short float *)&v25[v20 * v186];
      v199 = &data[v186 * v17];
      _CF = (unint64_t)((char *)v198 - v196) >= 0x10 && (unint64_t)((char *)v198 - v197) >= 0x10;
      if (!_CF || (unint64_t)((char *)v198 - v199) < 0x10) {
        break;
      }
      v199 += v188;
      v197 += v188;
      v203 = v191;
      v204 = v193;
      v205 = v194;
      v206 = v195;
      unint64_t v207 = v18 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        float16x8_t v208 = *v206++;
        int8x16_t v209 = (int8x16_t)v208;
        float32x4_t v210 = vcvt_hight_f32_f16(v208);
        float32x4_t v211 = vcvtq_f32_f16(*(float16x4_t *)v208.i8);
        float16x8_t v212 = *v205++;
        float16x8_t v213 = v212;
        float32x4_t v214 = vcvt_hight_f32_f16(v212);
        float16x8_t v215 = *v203++;
        float32x4_t v216 = vcvtq_f32_f16(*(float16x4_t *)v213.i8);
        float32x4_t v217 = vcvtq_f32_f16(*(float16x4_t *)v215.i8);
        float32x4_t v218 = vcvt_hight_f32_f16(v215);
        int16x8_t v219 = vcgtq_f16(v215, v190);
        float32x4_t v220 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v187, vabdq_f32(v211, v216)), vbslq_s8((int8x16_t)vmovl_s16(*(int16x4_t *)v219.i8), (int8x16_t)_Q6, vbicq_s8((int8x16_t)v217, (int8x16_t)vcltzq_f32(v217))), v189);
        float32x4_t v221 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v187, vabdq_f32(v210, v214)), vbslq_s8((int8x16_t)vmovl_high_s16(v219), (int8x16_t)_Q6, vbicq_s8((int8x16_t)v218, (int8x16_t)vcltzq_f32(v218))), v189);
        *v204++ = vbslq_s8((int8x16_t)vclezq_f16(v213), v209, (int8x16_t)vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(vmlaq_f32(vmulq_f32(vsubq_f32(_Q6, v220), v216), v220, v211)), vmlaq_f32(vmulq_f32(vsubq_f32(_Q6, v221), v214), v221, v210)));
        v207 -= 8;
      }
      while (v207);
      if (v18 != (v18 & 0xFFFFFFFFFFFFFFF8))
      {
        v198 = (short float *)((char *)v198 + v188);
        v196 += v188;
        unint64_t v202 = v18 & 0xFFFFFFFFFFFFFFF8;
LABEL_170:
        size_t v222 = v18 - v202;
        do
        {
          short float v223 = *(short float *)v196;
          v196 += 2;
          _H7 = v223;
          __int16 v225 = *(_WORD *)v197;
          v197 += 2;
          _H16 = v225;
          short float v227 = *(short float *)v199;
          v199 += 2;
          _H17 = v227;
          __asm
          {
            FCVT            S18, H7
            FCVT            S19, H16
            FCVT            S20, H17
          }
          if (_S20 < 0.0) {
            _S20 = 0.0;
          }
          if (_H17 <= COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0))) {
            float v232 = _S20;
          }
          else {
            float v232 = 1.0;
          }
          if (vabds_f32(_S18, _S19) >= *(float *)v341.i32) {
            float v232 = *(float *)v342.i32;
          }
          _S17 = (float)((float)(1.0 - v232) * _S19) + (float)(_S18 * v232);
          __asm
          {
            FCVT            H17, S17
            FCMP            H16, #0
          }
          if (!_ZF && _CF) {
            _H7 = _H17;
          }
          *v198++ = _H7;
          --v222;
        }
        while (v222);
      }
      ++v186;
      v195 = (float16x8_t *)((char *)v195 + v22);
      v194 = (float16x8_t *)((char *)v194 + v24);
      v193 = (int8x16_t *)((char *)v193 + v20);
      v191 = (float16x8_t *)((char *)v191 + v17);
      if (v186 == v19) {
        goto LABEL_262;
      }
    }
    unint64_t v202 = 0;
    goto LABEL_170;
  }
  double v26 = (short float *)(data + 6);
  double v27 = (short float *)((char *)v345.data + 6);
  BOOL v28 = (__int16 *)((char *)buf.data + 6);
  double v29 = (short float *)((char *)__p.data + 6);
  LOWORD(v30) = COERCE_UNSIGNED_INT(1.0);
  do
  {
    _H3 = *(v29 - 3);
    __asm { FCVT            S4, H3 }
    _H5 = *(v28 - 3);
    __asm { FCVT            S6, H5 }
    _H7 = *(v26 - 3);
    __asm { FCVT            S16, H7 }
    if (_S16 < 0.0) {
      _S16 = 0.0;
    }
    if (_H7 <= v30) {
      float v40 = _S16;
    }
    else {
      float v40 = 1.0;
    }
    if (vabds_f32(_S4, _S6) >= *(float *)v341.i32) {
      float v40 = *(float *)v342.i32;
    }
    _S4 = (float)((float)(1.0 - v40) * _S6) + (float)(_S4 * v40);
    __asm
    {
      FCVT            H4, S4
      FCMP            H5, #0
    }
    if (!_ZF && _CF) {
      _H3 = _H4;
    }
    *(v27 - 3) = _H3;
    if (v18 != 1)
    {
      _H3 = *(v29 - 2);
      __asm { FCVT            S4, H3 }
      _H5 = *(v28 - 2);
      __asm { FCVT            S6, H5 }
      _H7 = *(v26 - 2);
      __asm { FCVT            S16, H7 }
      if (_S16 < 0.0) {
        _S16 = 0.0;
      }
      if (_H7 <= v30) {
        float v50 = _S16;
      }
      else {
        float v50 = 1.0;
      }
      if (vabds_f32(_S4, _S6) >= *(float *)v341.i32) {
        float v50 = *(float *)v342.i32;
      }
      _S4 = (float)((float)(1.0 - v50) * _S6) + (float)(_S4 * v50);
      __asm
      {
        FCVT            H4, S4
        FCMP            H5, #0
      }
      if (!_ZF && _CF) {
        _H3 = _H4;
      }
      *(v27 - 2) = _H3;
      if (v18 != 2)
      {
        _H3 = *(v29 - 1);
        __asm { FCVT            S4, H3 }
        _H5 = *(v28 - 1);
        __asm { FCVT            S6, H5 }
        _H7 = *(v26 - 1);
        __asm { FCVT            S16, H7 }
        if (_S16 < 0.0) {
          _S16 = 0.0;
        }
        if (_H7 <= v30) {
          float v60 = _S16;
        }
        else {
          float v60 = 1.0;
        }
        if (vabds_f32(_S4, _S6) >= *(float *)v341.i32) {
          float v60 = *(float *)v342.i32;
        }
        _S4 = (float)((float)(1.0 - v60) * _S6) + (float)(_S4 * v60);
        __asm
        {
          FCVT            H4, S4
          FCMP            H5, #0
        }
        if (!_ZF && _CF) {
          _H3 = _H4;
        }
        *(v27 - 1) = _H3;
        if (v18 != 3)
        {
          _H3 = *v29;
          __asm { FCVT            S4, H3 }
          _H5 = *v28;
          __asm { FCVT            S6, H5 }
          _H7 = *v26;
          __asm { FCVT            S16, H7 }
          if (_S16 < 0.0) {
            _S16 = 0.0;
          }
          if (_H7 <= v30) {
            float v70 = _S16;
          }
          else {
            float v70 = 1.0;
          }
          if (vabds_f32(_S4, _S6) >= *(float *)v341.i32) {
            float v70 = *(float *)v342.i32;
          }
          _S4 = (float)((float)(1.0 - v70) * _S6) + (float)(_S4 * v70);
          __asm
          {
            FCVT            H4, S4
            FCMP            H5, #0
          }
          if (!_ZF && _CF) {
            _H3 = _H4;
          }
          *double v27 = _H3;
          if (v18 != 4)
          {
            _H3 = v29[1];
            __asm { FCVT            S4, H3 }
            _H5 = v28[1];
            __asm { FCVT            S6, H5 }
            _H7 = v26[1];
            __asm { FCVT            S16, H7 }
            if (_S16 < 0.0) {
              _S16 = 0.0;
            }
            if (_H7 <= v30) {
              float v80 = _S16;
            }
            else {
              float v80 = 1.0;
            }
            if (vabds_f32(_S4, _S6) >= *(float *)v341.i32) {
              float v80 = *(float *)v342.i32;
            }
            _S4 = (float)((float)(1.0 - v80) * _S6) + (float)(_S4 * v80);
            __asm
            {
              FCVT            H4, S4
              FCMP            H5, #0
            }
            if (!_ZF && _CF) {
              _H3 = _H4;
            }
            v27[1] = _H3;
            if (v18 != 5)
            {
              _H3 = v29[2];
              __asm { FCVT            S4, H3 }
              _H5 = v28[2];
              __asm { FCVT            S6, H5 }
              _H7 = v26[2];
              __asm { FCVT            S16, H7 }
              if (_S16 < 0.0) {
                _S16 = 0.0;
              }
              if (_H7 <= v30) {
                float v90 = _S16;
              }
              else {
                float v90 = 1.0;
              }
              if (vabds_f32(_S4, _S6) >= *(float *)v341.i32) {
                float v90 = *(float *)v342.i32;
              }
              _S4 = (float)((float)(1.0 - v90) * _S6) + (float)(_S4 * v90);
              __asm
              {
                FCVT            H4, S4
                FCMP            H5, #0
              }
              if (!_ZF && _CF) {
                _H3 = _H4;
              }
              v27[2] = _H3;
              if (v18 != 6)
              {
                _H3 = v29[3];
                __asm { FCVT            S4, H3 }
                _H5 = v28[3];
                __asm { FCVT            S6, H5 }
                _H7 = v26[3];
                __asm { FCVT            S16, H7 }
                if (_S16 < 0.0) {
                  _S16 = 0.0;
                }
                if (_H7 <= v30) {
                  float v100 = _S16;
                }
                else {
                  float v100 = 1.0;
                }
                if (vabds_f32(_S4, _S6) >= *(float *)v341.i32) {
                  float v100 = *(float *)v342.i32;
                }
                _S4 = (float)((float)(1.0 - v100) * _S6) + (float)(_S4 * v100);
                __asm
                {
                  FCVT            H4, S4
                  FCMP            H5, #0
                }
                if (!_ZF && _CF) {
                  _H3 = _H4;
                }
                v27[3] = _H3;
              }
            }
          }
        }
      }
    }
    double v26 = (short float *)((char *)v26 + v17);
    double v27 = (short float *)((char *)v27 + v20);
    BOOL v28 = (__int16 *)((char *)v28 + v24);
    double v29 = (short float *)((char *)v29 + v22);
    --v19;
  }
  while (v19);
LABEL_262:
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  CVPixelBufferUnlockBaseAddress(a5, 0);
  if (pixelBuffer) {
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  }
  return 0;
}

+ (int64_t)warpPreviousDepth:(__CVBuffer *)a3 intoCurrentDepth:(__CVBuffer *)a4 previousConfidence:(__CVBuffer *)a5 intoCurrentConfidence:(__CVBuffer *)a6 previousNormals:(__CVBuffer *)a7 intoCurrentNormals:(__CVBuffer *)a8 usingOpticalFlow:(__CVBuffer *)a9
{
  int64_t result = -22953;
  if (a3)
  {
    if (a4)
    {
      int64_t result = objc_msgSend(a1, "warpMap:toOutput:usingOpticalFlow:");
      if (!result)
      {
        if (a5 && a6) {
          int64_t result = [a1 warpMap:a5 toOutput:a6 usingOpticalFlow:a9];
        }
        if (result) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = a8 == 0;
        }
        if (!v15 && a7 != 0) {
          return -22952;
        }
      }
    }
  }
  return result;
}

+ (int64_t)warpMap:(__CVBuffer *)a3 toOutput:(__CVBuffer *)a4 usingOpticalFlow:(__CVBuffer *)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  int64_t result = -22953;
  if (!a3 || !a4 || !a5) {
    return result;
  }
  unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  unint64_t v10 = PixelFormatType;
  if ((int)PixelFormatType > 1717856626)
  {
    if (PixelFormatType == 1717856627) {
      goto LABEL_33;
    }
    if (PixelFormatType != 1751411059 && PixelFormatType != 1751410032) {
      goto LABEL_56;
    }
    goto LABEL_12;
  }
  switch(PixelFormatType)
  {
    case 0x4C303066:
LABEL_33:
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a5, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      memset(&__p, 0, sizeof(__p));
      size_t v38 = (CGRect *)MEMORY[0x263F001A8];
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &__p);
      memset(&buf, 0, sizeof(buf));
      PixelBufferUtils::asVImageBuffer(a5, *v38, &buf);
      memset(&v63, 0, sizeof(v63));
      PixelBufferUtils::asVImageBuffer(a4, *v38, &v63);
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      if (Height && Width)
      {
        unint64_t v41 = 0;
        size_t rowBytes = __p.rowBytes;
        data = (char *)buf.data;
        size_t v44 = buf.rowBytes;
        size_t v45 = (char *)v63.data;
        size_t v46 = v63.rowBytes;
        BOOL v47 = (char *)__p.data;
        do
        {
          unint64_t v48 = 0;
          BOOL v49 = &data[v44 * v41];
          do
          {
            *(_DWORD *)&v45[4 * v48] = 0;
            _H4 = *(_WORD *)v49;
            __asm { FCVT            S4, H4 }
            _H5 = *((_WORD *)v49 + 1);
            __asm { FCVT            S5, H5 }
            _NF = (float)(fabsf(_S4) + fabsf(_S5)) < 600.0;
            float v54 = roundf(_S4);
            float v55 = v54 + (float)v48;
            BOOL v57 = _NF && v55 < (float)(Width - 1) && v55 > 1.0;
            float v58 = roundf(_S5);
            float v59 = v58 + (float)v41;
            if (v57 && v59 < (float)(Height - 1) && v59 > 1.0) {
              *(_DWORD *)&v45[4 * v48] = *(_DWORD *)&v47[4 * (int)v54 + 4 * v48 + rowBytes * (v41 + (int)v58)];
            }
            ++v48;
            v49 += 4;
          }
          while (Width != v48);
          ++v41;
          v45 += v46;
        }
        while (v41 != Height);
      }
LABEL_54:
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      CVPixelBufferUnlockBaseAddress(a5, 1uLL);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      return 0;
    case 0x4C303068:
LABEL_12:
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a5, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      memset(&__p, 0, sizeof(__p));
      size_t v11 = (CGRect *)MEMORY[0x263F001A8];
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &__p);
      memset(&buf, 0, sizeof(buf));
      PixelBufferUtils::asVImageBuffer(a5, *v11, &buf);
      memset(&v63, 0, sizeof(v63));
      PixelBufferUtils::asVImageBuffer(a4, *v11, &v63);
      size_t v12 = CVPixelBufferGetWidth(a3);
      size_t v13 = CVPixelBufferGetHeight(a3);
      if (v13 && v12)
      {
        unint64_t v14 = 0;
        size_t v16 = __p.rowBytes;
        BOOL v15 = (char *)buf.data;
        size_t v17 = buf.rowBytes;
        size_t v18 = (char *)v63.data;
        size_t v19 = v63.rowBytes;
        size_t v20 = (char *)__p.data;
        do
        {
          unint64_t v21 = 0;
          size_t v22 = &v15[v17 * v14];
          do
          {
            *(_WORD *)&v18[2 * v21] = 0;
            _H5 = *(_WORD *)v22;
            __asm { FCVT            S5, H5 }
            _H6 = *((_WORD *)v22 + 1);
            __asm { FCVT            S6, H6 }
            _NF = (float)(fabsf(_S5) + fabsf(_S6)) < 600.0;
            float v30 = roundf(_S5);
            float v31 = v30 + (float)v21;
            _NF = _NF && v31 < (float)(v12 - 1);
            BOOL v33 = _NF && v31 > 1.0;
            float v34 = roundf(_S6);
            float v35 = v34 + (float)v14;
            if (v33 && v35 < (float)(v13 - 1) && v35 > 1.0) {
              *(_WORD *)&v18[2 * v21] = *(_WORD *)&v20[2 * (int)v30 + 2 * v21 + v16 * (v14 + (int)v34)];
            }
            ++v21;
            v22 += 4;
          }
          while (v12 != v21);
          ++v14;
          v18 += v19;
        }
        while (v14 != v13);
      }
      goto LABEL_54;
    case 0x66646570:
      goto LABEL_33;
  }
LABEL_56:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    PixelBufferUtils::pixelFormatAsString(v10, (char *)&__p);
    if ((__p.width & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (vImage_Buffer *)__p.data;
    }
    LODWORD(buf.data) = 136446210;
    *(void **)((char *)&buf.data + 4) = p_p;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unsupported depth map format (%{public}s)", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__p.width) < 0) {
      operator delete(__p.data);
    }
  }
  return -22956;
}

+ (double)addAnglesToRotation:(double)a3 angles:(double)a4
{
  [a1 calcRotationMatrix:a5];
  *(void *)&double result = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v5, a2.f32[0]), v6, *(float32x2_t *)a2.f32, 1), v7, a2, 2).u64[0];
  return result;
}

+ (double)calcRotationAngle:(float *)a3
{
  float v4 = a3[6];
  float v5 = a3[10];
  *(float *)&uint64_t v6 = atan2f(v4, v5);
  v11.i64[0] = v6;
  float v10 = atan2f(-a3[2], sqrtf((float)(v5 * v5) + (float)(v4 * v4)));
  float v7 = atan2f(a3[1], *a3);
  float32x4_t v8 = v11;
  v8.f32[1] = v10;
  v8.f32[2] = v7;
  *(void *)&double result = vmulq_f32(v8, (float32x4_t)vdupq_n_s32(0x447A0000u)).u64[0];
  return result;
}

+ (float32x2_t)calcRotationMatrix:(float32x4_t)a1
{
  float32x4_t v1 = vmulq_f32(a1, (float32x4_t)vdupq_n_s32(0x3A83126Fu));
  float v2 = v1.f32[1];
  float v3 = v1.f32[2];
  __sincosf_stret(v1.f32[0]);
  float cosval = __sincosf_stret(v2).__cosval;
  __float2 v4 = __sincosf_stret(v3);
  return vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v4.__sinval), LODWORD(v4.__cosval)), cosval);
}

+ (int64_t)filterInvalidsFromFloatImage:(__CVBuffer *)a3 minValue:(float)a4 maxValue:(float)a5 clampToMinMax:(BOOL)a6
{
  int32x2_t v206 = *(int32x2_t *)&a5;
  int32x2_t v205 = *(int32x2_t *)&a4;
  uint64_t v210 = *MEMORY[0x263EF8340];
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType <= 1717856626)
  {
    if (PixelFormatType == 1278226534) {
      goto LABEL_8;
    }
    unsigned __int16 v9 = 25968;
  }
  else
  {
    if (PixelFormatType == 1751411059 || PixelFormatType == 1751410032)
    {
      if (a3)
      {
        CVPixelBufferLockBaseAddress(a3, 0);
        memset(&buf, 0, sizeof(buf));
        PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &buf);
        vImagePixelCount height = buf.height;
        if (buf.height)
        {
          vImagePixelCount width = buf.width;
          if (buf.width)
          {
            data = (float16x4_t *)buf.data;
            size_t rowBytes = buf.rowBytes;
            if (a6)
            {
              if (buf.width >= 4)
              {
                uint64_t v97 = 0;
                vImagePixelCount v98 = buf.width & 0xFFFFFFFFFFFFFFFCLL;
                float32x4_t v99 = (float32x4_t)vdupq_lane_s32(v205, 0);
                float32x4_t v100 = (float32x4_t)vdupq_lane_s32(v206, 0);
                v101.i64[0] = 0x80000000800000;
                v101.i64[1] = 0x80000000800000;
                v102.i64[0] = 0x7F0000007F000000;
                v102.i64[1] = 0x7F0000007F000000;
                int32x4_t v103 = vdupq_n_s32(0x7F800000u);
                v104.i64[0] = 0x3400000034000000;
                v104.i64[1] = 0x3400000034000000;
                do
                {
                  v105 = data;
                  unint64_t v106 = width & 0xFFFFFFFFFFFFFFFCLL;
                  do
                  {
                    float32x4_t v107 = vcvtq_f32_f16(*v105);
                    int8x8_t v108 = vorr_s8((int8x8_t)vcltz_f16(*v105), (int8x8_t)vcgez_f16(*v105));
                    *v105++ = (float16x4_t)vand_s8(vand_s8((int8x8_t)vcvt_f16_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v99, v107), (int8x16_t)v99, vbslq_s8((int8x16_t)vcgtq_f32(v107, v100), (int8x16_t)v100, (int8x16_t)v107))), v108), vorn_s8((int8x8_t)vmovn_s32((int32x4_t)vbicq_s8(vorrq_s8(vorrq_s8((int8x16_t)vceqzq_s32((int32x4_t)(*(_OWORD *)&v107 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))), (int8x16_t)vcgtq_s32((int32x4_t)(*(_OWORD *)&v107 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v103)), (int8x16_t)vcgtq_u32(v102,
                                                                                               (uint32x4_t)vsubq_s32((int32x4_t)(*(_OWORD *)&v107 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v101))),
                                                                                (int8x16_t)vcgeq_f32(v104, vabsq_f32(v107)))), v108));
                    v106 -= 4;
                  }
                  while (v106);
                  if (width != v98)
                  {
                    unint64_t v109 = width & 0xFFFFFFFFFFFFFFFCLL;
                    do
                    {
                      _H16 = data->i16[v109];
                      _S7 = 0.0;
                      __asm { FCVT            S16, H16 }
                      BOOL v115 = ((LODWORD(_S16) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                          || (LODWORD(_S16) & 0x7FFFFFFFu) >= 0x7F800001
                          || (LODWORD(_S16) & 0x7FFFFFFF) == 0;
                      float v116 = fabsf(_S16);
                      if (v115 && v116 > 0.00000011921)
                      {
                        _S7 = _S16 <= *(float *)v206.i32 ? _S16 : *(float *)v206.i32;
                        if (_S16 < *(float *)v205.i32) {
                          _S7 = *(float *)v205.i32;
                        }
                      }
                      __asm { FCVT            H7, S7 }
                      data->i16[v109++] = _H7;
                    }
                    while (width != v109);
                  }
                  ++v97;
                  data = (float16x4_t *)((char *)data + rowBytes);
                }
                while (v97 != height);
              }
              else
              {
                size_t v22 = (__int16 *)((char *)buf.data + 4);
                do
                {
                  _H2 = *(v22 - 2);
                  _S1 = 0.0;
                  __asm { FCVT            S2, H2 }
                  _ZF = ((LODWORD(_S2) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                     || (LODWORD(_S2) & 0x7FFFFFFFu) >= 0x7F800001
                     || (LODWORD(_S2) & 0x7FFFFFFF) == 0;
                  float v44 = fabsf(_S2);
                  if (_ZF && v44 > 0.00000011921)
                  {
                    _S1 = _S2 <= *(float *)v206.i32 ? _S2 : *(float *)v206.i32;
                    if (_S2 < *(float *)v205.i32) {
                      _S1 = *(float *)v205.i32;
                    }
                  }
                  __asm { FCVT            H1, S1 }
                  *(v22 - 2) = _H1;
                  if (width != 1)
                  {
                    _H2 = *(v22 - 1);
                    _S1 = 0.0;
                    __asm { FCVT            S2, H2 }
                    BOOL v51 = ((LODWORD(_S2) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                       || (LODWORD(_S2) & 0x7FFFFFFFu) >= 0x7F800001
                       || (LODWORD(_S2) & 0x7FFFFFFF) == 0;
                    float v52 = fabsf(_S2);
                    if (v51 && v52 > 0.00000011921)
                    {
                      _S1 = _S2 <= *(float *)v206.i32 ? _S2 : *(float *)v206.i32;
                      if (_S2 < *(float *)v205.i32) {
                        _S1 = *(float *)v205.i32;
                      }
                    }
                    __asm { FCVT            H1, S1 }
                    *(v22 - 1) = _H1;
                    if (width != 2)
                    {
                      _H2 = *v22;
                      _S1 = 0.0;
                      __asm { FCVT            S2, H2 }
                      BOOL v59 = ((LODWORD(_S2) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                         || (LODWORD(_S2) & 0x7FFFFFFFu) >= 0x7F800001
                         || (LODWORD(_S2) & 0x7FFFFFFF) == 0;
                      float v60 = fabsf(_S2);
                      if (v59 && v60 > 0.00000011921)
                      {
                        _S1 = _S2 <= *(float *)v206.i32 ? _S2 : *(float *)v206.i32;
                        if (_S2 < *(float *)v205.i32) {
                          _S1 = *(float *)v205.i32;
                        }
                      }
                      __asm { FCVT            H1, S1 }
                      *size_t v22 = _H1;
                    }
                  }
                  size_t v22 = (__int16 *)((char *)v22 + rowBytes);
                  --height;
                }
                while (height);
              }
            }
            else if (buf.width >= 8)
            {
              uint64_t v118 = 0;
              float32x4_t v119 = (float32x4_t)vdupq_lane_s32(v205, 0);
              vImagePixelCount v120 = buf.width & 0xFFFFFFFFFFFFFFF8;
              float32x4_t v121 = (float32x4_t)vdupq_lane_s32(v206, 0);
              v122.i64[0] = 0x80000000800000;
              v122.i64[1] = 0x80000000800000;
              v123.i64[0] = 0x7F0000007F000000;
              v123.i64[1] = 0x7F0000007F000000;
              int32x4_t v124 = vdupq_n_s32(0x7F800000u);
              v125.i64[0] = 0x3400000034000000;
              v125.i64[1] = 0x3400000034000000;
              do
              {
                float v126 = data;
                unint64_t v127 = width & 0xFFFFFFFFFFFFFFF8;
                do
                {
                  float32x4_t v128 = vcvtq_f32_f16(*v126);
                  float32x4_t v129 = vcvt_hight_f32_f16(*(float16x8_t *)v126->i8);
                  *(int8x16_t *)v126->i8 = vandq_s8(vbicq_s8(*(int8x16_t *)v126->i8, (int8x16_t)vuzp1q_s16((int16x8_t)vorrq_s8((int8x16_t)vcgtq_f32(v119, v128), (int8x16_t)vcgtq_f32(v128, v121)), (int16x8_t)vorrq_s8((int8x16_t)vcgtq_f32(v119, v129), (int8x16_t)vcgtq_f32(v129, v121)))), (int8x16_t)vcltzq_s16(vshlq_n_s16((int16x8_t)vandq_s8(vorrq_s8((int8x16_t)vcltzq_f16(*(float16x8_t *)v126->i8), (int8x16_t)vcgezq_f16(*(float16x8_t *)v126->i8)), vbicq_s8(vorrq_s8(vorrq_s8((int8x16_t)vuzp1q_s16(
                                                                                            (int16x8_t)vceqzq_s32((int32x4_t)(*(_OWORD *)&v128 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))),
                                                                                            (int16x8_t)vceqzq_s32((int32x4_t)(*(_OWORD *)&v129 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))),
                                                                               (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_s32((int32x4_t)(*(_OWORD *)&v128 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v124), (int16x8_t)vcgtq_s32((int32x4_t)(*(_OWORD *)&v129 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v124))), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_u32(v123, (uint32x4_t)vsubq_s32((int32x4_t)(*(_OWORD *)&v128 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v122)), (int16x8_t)vcgtq_u32(v123, (uint32x4_t)vsubq_s32((int32x4_t)(*(_OWORD *)&v129 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)), v122)))), (int8x16_t)vuzp1q_s16((int16x8_t)vcgeq_f32(v125, vabsq_f32(v128)), (int16x8_t)vcgeq_f32(v125, vabsq_f32(v129))))), 0xFuLL)));
                  v126 += 2;
                  v127 -= 8;
                }
                while (v127);
                if (width != v120)
                {
                  unint64_t v130 = width & 0xFFFFFFFFFFFFFFF8;
                  do
                  {
                    _H17 = data->i16[v130];
                    LOWORD(v132) = 0;
                    __asm { FCVT            S18, H17 }
                    BOOL v135 = ((LODWORD(_S18) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                        || (LODWORD(_S18) & 0x7FFFFFFFu) >= 0x7F800001
                        || (LODWORD(_S18) & 0x7FFFFFFF) == 0;
                    float v136 = fabsf(_S18);
                    if (v135 && v136 > 0.00000011921)
                    {
                      if (_S18 > *(float *)v206.i32 || _S18 < *(float *)v205.i32) {
                        short float v132 = COERCE_SHORT_FLOAT(0);
                      }
                      else {
                        short float v132 = *(short float *)&data->i16[v130];
                      }
                    }
                    *(short float *)&data->i16[v130++] = v132;
                  }
                  while (width != v130);
                }
                ++v118;
                data = (float16x4_t *)((char *)data + rowBytes);
              }
              while (v118 != height);
            }
            else
            {
              size_t v78 = (short float *)((char *)buf.data + 6);
              do
              {
                _H2 = *((_WORD *)v78 - 3);
                __asm { FCVT            S3, H2 }
                BOOL v154 = ((LODWORD(_S3) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                    || (LODWORD(_S3) & 0x7FFFFFFFu) >= 0x7F800001
                    || (LODWORD(_S3) & 0x7FFFFFFF) == 0;
                float v155 = fabsf(_S3);
                BOOL v156 = v154 && v155 > 0.00000011921;
                LOWORD(v157) = 0;
                if (v156)
                {
                  if (_S3 > *(float *)v206.i32 || _S3 < *(float *)v205.i32) {
                    short float v157 = COERCE_SHORT_FLOAT(0);
                  }
                  else {
                    short float v157 = *(v78 - 3);
                  }
                }
                *(v78 - 3) = v157;
                if (width != 1)
                {
                  _H3 = *((_WORD *)v78 - 2);
                  LOWORD(v160) = 0;
                  __asm { FCVT            S4, H3 }
                  BOOL v163 = ((LODWORD(_S4) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                      || (LODWORD(_S4) & 0x7FFFFFFFu) >= 0x7F800001
                      || (LODWORD(_S4) & 0x7FFFFFFF) == 0;
                  float v164 = fabsf(_S4);
                  if (v163 && v164 > 0.00000011921)
                  {
                    if (_S4 > *(float *)v206.i32 || _S4 < *(float *)v205.i32) {
                      short float v160 = COERCE_SHORT_FLOAT(0);
                    }
                    else {
                      short float v160 = *(v78 - 2);
                    }
                  }
                  *(v78 - 2) = v160;
                  if (width != 2)
                  {
                    _H3 = *((_WORD *)v78 - 1);
                    LOWORD(v168) = 0;
                    __asm { FCVT            S4, H3 }
                    BOOL v171 = ((LODWORD(_S4) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                        || (LODWORD(_S4) & 0x7FFFFFFFu) >= 0x7F800001
                        || (LODWORD(_S4) & 0x7FFFFFFF) == 0;
                    float v172 = fabsf(_S4);
                    if (v171 && v172 > 0.00000011921)
                    {
                      if (_S4 > *(float *)v206.i32 || _S4 < *(float *)v205.i32) {
                        short float v168 = COERCE_SHORT_FLOAT(0);
                      }
                      else {
                        short float v168 = *(v78 - 1);
                      }
                    }
                    *(v78 - 1) = v168;
                    if (width != 3)
                    {
                      _H3 = *v78;
                      LOWORD(v176) = 0;
                      __asm { FCVT            S4, H3 }
                      BOOL v179 = ((LODWORD(_S4) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                          || (LODWORD(_S4) & 0x7FFFFFFFu) >= 0x7F800001
                          || (LODWORD(_S4) & 0x7FFFFFFF) == 0;
                      float v180 = fabsf(_S4);
                      if (v179 && v180 > 0.00000011921)
                      {
                        if (_S4 > *(float *)v206.i32 || _S4 < *(float *)v205.i32) {
                          short float v176 = COERCE_SHORT_FLOAT(0);
                        }
                        else {
                          short float v176 = *v78;
                        }
                      }
                      *size_t v78 = v176;
                      if (width != 4)
                      {
                        _H3 = *((_WORD *)v78 + 1);
                        LOWORD(v184) = 0;
                        __asm { FCVT            S4, H3 }
                        BOOL v187 = ((LODWORD(_S4) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                            || (LODWORD(_S4) & 0x7FFFFFFFu) >= 0x7F800001
                            || (LODWORD(_S4) & 0x7FFFFFFF) == 0;
                        float v188 = fabsf(_S4);
                        if (v187 && v188 > 0.00000011921)
                        {
                          if (_S4 > *(float *)v206.i32 || _S4 < *(float *)v205.i32) {
                            short float v184 = COERCE_SHORT_FLOAT(0);
                          }
                          else {
                            short float v184 = v78[1];
                          }
                        }
                        v78[1] = v184;
                        if (width != 5)
                        {
                          _H3 = *((_WORD *)v78 + 2);
                          LOWORD(v192) = 0;
                          __asm { FCVT            S4, H3 }
                          BOOL v195 = ((LODWORD(_S4) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                              || (LODWORD(_S4) & 0x7FFFFFFFu) >= 0x7F800001
                              || (LODWORD(_S4) & 0x7FFFFFFF) == 0;
                          if (v195 && fabsf(_S4) > 0.00000011921)
                          {
                            if (_S4 > *(float *)v206.i32 || _S4 < *(float *)v205.i32) {
                              short float v192 = COERCE_SHORT_FLOAT(0);
                            }
                            else {
                              short float v192 = v78[2];
                            }
                          }
                          v78[2] = v192;
                          if (width != 6)
                          {
                            _H3 = *((_WORD *)v78 + 3);
                            LOWORD(v198) = 0;
                            __asm { FCVT            S4, H3 }
                            BOOL v201 = ((LODWORD(_S4) & 0x7FFFFFFFu) - 0x800000) >> 24 <= 0x7E
                                || (LODWORD(_S4) & 0x7FFFFFFFu) >= 0x7F800001
                                || (LODWORD(_S4) & 0x7FFFFFFF) == 0;
                            if (v201 && fabsf(_S4) > 0.00000011921)
                            {
                              if (_S4 > *(float *)v206.i32 || _S4 < *(float *)v205.i32) {
                                short float v198 = COERCE_SHORT_FLOAT(0);
                              }
                              else {
                                short float v198 = v78[3];
                              }
                            }
                            v78[3] = v198;
                          }
                        }
                      }
                    }
                  }
                }
                size_t v78 = (short float *)((char *)v78 + rowBytes);
                --height;
              }
              while (height);
            }
          }
        }
        goto LABEL_177;
      }
      goto LABEL_20;
    }
    unsigned __int16 v9 = 26995;
  }
  if (PixelFormatType == (v9 | 0x66640000))
  {
LABEL_8:
    if (a3)
    {
      CVPixelBufferLockBaseAddress(a3, 0);
      memset(&buf, 0, sizeof(buf));
      PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &buf);
      vImagePixelCount v10 = buf.height;
      if (buf.height)
      {
        vImagePixelCount v11 = buf.width;
        if (buf.width)
        {
          size_t v12 = (float32x4_t *)buf.data;
          size_t v13 = buf.rowBytes;
          vImagePixelCount v14 = buf.width & 0xFFFFFFFFFFFFFFFCLL;
          float32x4_t v15 = (float32x4_t)vdupq_lane_s32(v205, 0);
          float32x4_t v16 = (float32x4_t)vdupq_lane_s32(v206, 0);
          if (a6)
          {
            if (buf.width >= 4)
            {
              uint64_t v79 = 0;
              float32x4_t v80 = (float32x4_t)vdupq_n_s32(0x7F800000u);
              v81.i64[0] = 0x3400000034000000;
              v81.i64[1] = 0x3400000034000000;
              do
              {
                v82 = v12;
                unint64_t v83 = v11 & 0xFFFFFFFFFFFFFFFCLL;
                do
                {
                  int8x16_t v84 = vorrq_s8((int8x16_t)vcltzq_f32(*v82), (int8x16_t)vcgezq_f32(*v82));
                  float32x4_t v85 = vabsq_f32(*v82);
                  *(int8x16_t *)v82 = vandq_s8(vandq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v15, *v82), (int8x16_t)v15, vbslq_s8((int8x16_t)vcgtq_f32(*v82, v16), (int8x16_t)v16, *(int8x16_t *)v82)), v84), vornq_s8(vbicq_s8(vmvnq_s8((int8x16_t)vceqq_f32(v85, v80)), (int8x16_t)vcgeq_f32(v81, v85)), v84));
                  ++v82;
                  v83 -= 4;
                }
                while (v83);
                if (v11 != v14)
                {
                  unint64_t v86 = v11 & 0xFFFFFFFFFFFFFFFCLL;
                  do
                  {
                    float v87 = v12->f32[v86];
                    float v88 = 0.0;
                    float v89 = fabsf(v87);
                    if (v89 != INFINITY && v89 > 0.00000011921)
                    {
                      float v88 = v87 <= *(float *)v206.i32 ? v12->f32[v86] : *(float *)v206.i32;
                      if (v87 < *(float *)v205.i32) {
                        float v88 = *(float *)v205.i32;
                      }
                    }
                    v12->f32[v86++] = v88;
                  }
                  while (v11 != v86);
                }
                ++v79;
                size_t v12 = (float32x4_t *)((char *)v12 + v13);
              }
              while (v79 != v10);
            }
            else
            {
              size_t v17 = (float *)((char *)buf.data + 8);
              do
              {
                float v24 = *(v17 - 2);
                float v25 = 0.0;
                float v26 = fabsf(v24);
                if (v26 != INFINITY && v26 > 0.00000011921)
                {
                  float v25 = v24 <= *(float *)v206.i32 ? *(v17 - 2) : *(float *)v206.i32;
                  if (v24 < *(float *)v205.i32) {
                    float v25 = *(float *)v205.i32;
                  }
                }
                *(v17 - 2) = v25;
                if (v11 != 1)
                {
                  float v28 = *(v17 - 1);
                  float v29 = 0.0;
                  float v30 = fabsf(v28);
                  if (v30 != INFINITY && v30 > 0.00000011921)
                  {
                    float v29 = v28 <= *(float *)v206.i32 ? *(v17 - 1) : *(float *)v206.i32;
                    if (v28 < *(float *)v205.i32) {
                      float v29 = *(float *)v205.i32;
                    }
                  }
                  *(v17 - 1) = v29;
                  if (v11 != 2)
                  {
                    float v32 = *v17;
                    float v33 = 0.0;
                    float v34 = fabsf(*v17);
                    if (v34 != INFINITY && v34 > 0.00000011921)
                    {
                      if (v32 <= *(float *)v206.i32) {
                        float v33 = *v17;
                      }
                      else {
                        float v33 = *(float *)v206.i32;
                      }
                      if (v32 < *(float *)v205.i32) {
                        float v33 = *(float *)v205.i32;
                      }
                    }
                    *size_t v17 = v33;
                  }
                }
                size_t v17 = (float *)((char *)v17 + v13);
                --v10;
              }
              while (v10);
            }
          }
          else if (buf.width > 3)
          {
            if (buf.width == v14)
            {
              uint64_t v91 = 0;
              float32x4_t v92 = (float32x4_t)vdupq_n_s32(0x7F800000u);
              v93.i64[0] = 0x3400000034000000;
              v93.i64[1] = 0x3400000034000000;
              do
              {
                v94 = v12;
                vImagePixelCount v95 = v11;
                do
                {
                  float32x4_t v96 = vabsq_f32(*v94);
                  *(int8x16_t *)v94 = vandq_s8(vandq_s8(vbicq_s8(*(int8x16_t *)v94, vorrq_s8((int8x16_t)vcgtq_f32(v15, *v94), (int8x16_t)vcgtq_f32(*v94, v16))), vorrq_s8((int8x16_t)vcltzq_f32(*v94), (int8x16_t)vcgezq_f32(*v94))), vbicq_s8(vmvnq_s8((int8x16_t)vceqq_f32(v96, v92)), (int8x16_t)vcgeq_f32(v93, v96)));
                  ++v94;
                  v95 -= 4;
                }
                while (v95);
                ++v91;
                size_t v12 = (float32x4_t *)((char *)v12 + v13);
              }
              while (v91 != v10);
            }
            else
            {
              uint64_t v139 = 0;
              float32x4_t v140 = (float32x4_t)vdupq_n_s32(0x7F800000u);
              v141.i64[0] = 0x3400000034000000;
              v141.i64[1] = 0x3400000034000000;
              do
              {
                size_t v142 = v12;
                unint64_t v143 = v11 & 0xFFFFFFFFFFFFFFFCLL;
                do
                {
                  float32x4_t v144 = vabsq_f32(*v142);
                  *(int8x16_t *)size_t v142 = vandq_s8(vandq_s8(vbicq_s8(*(int8x16_t *)v142, vorrq_s8((int8x16_t)vcgtq_f32(v15, *v142), (int8x16_t)vcgtq_f32(*v142, v16))), vorrq_s8((int8x16_t)vcltzq_f32(*v142), (int8x16_t)vcgezq_f32(*v142))), vbicq_s8(vmvnq_s8((int8x16_t)vceqq_f32(v144, v140)), (int8x16_t)vcgeq_f32(v141, v144)));
                  ++v142;
                  v143 -= 4;
                }
                while (v143);
                unint64_t v145 = v11 & 0xFFFFFFFFFFFFFFFCLL;
                do
                {
                  float v146 = v12->f32[v145];
                  float v147 = 0.0;
                  float v148 = fabsf(v146);
                  if (v148 != INFINITY && v148 > 0.00000011921)
                  {
                    if (v146 > *(float *)v206.i32 || v146 < *(float *)v205.i32) {
                      float v147 = 0.0;
                    }
                    else {
                      float v147 = v12->f32[v145];
                    }
                  }
                  v12->f32[v145++] = v147;
                }
                while (v11 != v145);
                ++v139;
                size_t v12 = (float32x4_t *)((char *)v12 + v13);
              }
              while (v139 != v10);
            }
          }
          else
          {
            v62 = (float *)((char *)buf.data + 8);
            do
            {
              float v63 = *(v62 - 2);
              float v64 = fabsf(v63);
              BOOL v65 = v64 != INFINITY && v64 > 0.00000011921;
              float v66 = 0.0;
              if (v65)
              {
                if (v63 > *(float *)v206.i32 || v63 < *(float *)v205.i32) {
                  float v66 = 0.0;
                }
                else {
                  float v66 = *(v62 - 2);
                }
              }
              *(v62 - 2) = v66;
              if (v11 != 1)
              {
                float v68 = *(v62 - 1);
                float v69 = 0.0;
                float v70 = fabsf(v68);
                if (v70 != INFINITY && v70 > 0.00000011921)
                {
                  if (v68 > *(float *)v206.i32 || v68 < *(float *)v205.i32) {
                    float v69 = 0.0;
                  }
                  else {
                    float v69 = *(v62 - 1);
                  }
                }
                *(v62 - 1) = v69;
                if (v11 != 2)
                {
                  float v73 = *v62;
                  float v74 = 0.0;
                  float v75 = fabsf(*v62);
                  if (v75 != INFINITY && v75 > 0.00000011921)
                  {
                    if (v73 > *(float *)v206.i32 || v73 < *(float *)v205.i32) {
                      float v74 = 0.0;
                    }
                    else {
                      float v74 = *v62;
                    }
                  }
                  float *v62 = v74;
                }
              }
              v62 = (float *)((char *)v62 + v13);
              --v10;
            }
            while (v10);
          }
        }
      }
LABEL_177:
      CVPixelBufferUnlockBaseAddress(a3, 0);
      return 0;
    }
LABEL_20:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Pixel buffer cannot be null", (uint8_t *)&buf, 2u);
    }
    return -22964;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    unint64_t v203 = CVPixelBufferGetPixelFormatType(a3);
    PixelBufferUtils::pixelFormatAsString(v203, (char *)&buf);
    v204 = (buf.width & 0x8000000000000000) == 0 ? &buf : (vImage_Buffer *)buf.data;
    *(_DWORD *)float16x8_t v208 = 136446210;
    int8x16_t v209 = v204;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unsupported pixel format (%{public}s)", v208, 0xCu);
    if (SHIBYTE(buf.width) < 0) {
      operator delete(buf.data);
    }
  }
  return -22956;
}

+ (int64_t)filterInvalidsFromFloatImage:(__CVBuffer *)a3 minValue:(float)a4 maxValue:(float)a5
{
  return objc_msgSend(a1, "filterInvalidsFromFloatImage:minValue:maxValue:clampToMinMax:", a3, 1);
}

+ (int64_t)warpAndFuseWithCurrDepth:(__CVBuffer *)a3 prevDepth:(__CVBuffer *)a4 currNormals:(__CVBuffer *)a5 prevNormals:(__CVBuffer *)a6 opticalFlow:(__CVBuffer *)a7 alphaMap:(__CVBuffer *)a8 defaultAlpha:(float)a9 depthOutput:(__CVBuffer *)pixelBuffer normalsOutput:(__CVBuffer *)a11
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  int64_t result = -22953;
  if (a7 && a4 && a3 && pixelBuffer)
  {
    if (a5) {
      _ZF = a11 == 0;
    }
    else {
      _ZF = 1;
    }
    int v20 = !_ZF && a6 != 0;
    unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    unint64_t v22 = PixelFormatType;
    if ((int)PixelFormatType <= 1717856626)
    {
      if (PixelFormatType == 1278226536) {
        goto LABEL_29;
      }
      if (PixelFormatType != 1717855600) {
        goto LABEL_79;
      }
    }
    else if (PixelFormatType != 1717856627)
    {
      if (PixelFormatType != 1751411059 && PixelFormatType != 1751410032)
      {
LABEL_79:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          PixelBufferUtils::pixelFormatAsString(v22, (char *)&__p);
          if ((__p.width & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (vImage_Buffer *)__p.data;
          }
          LODWORD(buf.data) = 136446210;
          *(void **)((char *)&buf.data + 4) = p_p;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unsupported depth map format (%{public}s)", (uint8_t *)&buf, 0xCu);
          if (SHIBYTE(__p.width) < 0) {
            operator delete(__p.data);
          }
        }
        return -22956;
      }
LABEL_29:
      if (v20)
      {
        unint64_t v26 = CVPixelBufferGetPixelFormatType(a5);
        if (v26 != 1717855600)
        {
          unint64_t v27 = v26;
          if (v26 != 1717856627)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              size_t v11 = (size_t)&__p;
              PixelBufferUtils::pixelFormatAsString(v27, (char *)&__p);
              float v131 = (__p.width & 0x8000000000000000) == 0 ? &__p : (vImage_Buffer *)__p.data;
              LODWORD(buf.data) = 136446210;
              *(void **)((char *)&buf.data + 4) = v131;
              _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "for normals only float 32 format are supported (provided: %{public}s)", (uint8_t *)&buf, 0xCu);
              if (SHIBYTE(__p.width) < 0) {
                operator delete(__p.data);
              }
            }
            if (v27 != 1717856627) {
              return -22956;
            }
          }
        }
      }
      CVPixelBufferLockBaseAddress(a7, 1uLL);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 1uLL);
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      memset(&__p, 0, sizeof(__p));
      size_t v28 = MEMORY[0x263F001A8];
      PixelBufferUtils::asVImageBuffer(a7, *MEMORY[0x263F001A8], &__p);
      memset(&buf, 0, sizeof(buf));
      PixelBufferUtils::asVImageBuffer(a3, *(CGRect *)v28, &buf);
      memset(&v143, 0, sizeof(v143));
      PixelBufferUtils::asVImageBuffer(a4, *(CGRect *)v28, &v143);
      memset(&v142, 0, sizeof(v142));
      PixelBufferUtils::asVImageBuffer(pixelBuffer, *(CGRect *)v28, &v142);
      if (v20)
      {
        CVPixelBufferLockBaseAddress(a5, 1uLL);
        CVPixelBufferLockBaseAddress(a6, 1uLL);
        CVPixelBufferLockBaseAddress(a11, 0);
        PixelBufferUtils::asVImageBuffer(a5, *(CGRect *)v28, &v141);
        data = (char *)v141.data;
        size_t rowBytes = v141.rowBytes;
        PixelBufferUtils::asVImageBuffer(a6, *(CGRect *)v28, &v141);
        size_t v137 = (char *)v141.data;
        size_t v11 = v141.rowBytes;
        PixelBufferUtils::asVImageBuffer(a11, *(CGRect *)v28, &v141);
        size_t v12 = (char *)v141.data;
        size_t v14 = v141.rowBytes;
        if (!a8) {
          goto LABEL_39;
        }
      }
      else if (!a8)
      {
        goto LABEL_39;
      }
      CVPixelBufferLockBaseAddress(a8, 1uLL);
      PixelBufferUtils::asVImageBuffer(a8, *(CGRect *)v28, &v141);
      size_t v13 = (char *)v141.data;
      size_t v28 = v141.rowBytes;
LABEL_39:
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      if (Height && Width)
      {
        uint64_t v31 = 0;
        uint64_t v32 = 0;
        unint64_t v33 = 0;
        size_t v34 = buf.rowBytes;
        size_t v35 = __p.rowBytes;
        size_t v36 = v142.rowBytes;
        size_t v37 = v143.rowBytes;
        float v38 = a9;
        do
        {
          unint64_t v39 = 0;
          float v40 = (__int16 *)((char *)__p.data + v35 * v33);
          unint64_t v41 = &v13[v33 * v28];
          if (!a8) {
            unint64_t v41 = 0;
          }
          v42 = &data[v33 * rowBytes];
          BOOL v43 = &v12[v33 * v14];
          if (!v20)
          {
            v42 = 0;
            BOOL v43 = 0;
          }
          float v44 = (char *)v142.data + v32;
          size_t v45 = (char *)buf.data + v31;
          size_t v46 = v137;
          do
          {
            _H18 = *(_WORD *)&v45[2 * v39];
            *(_WORD *)&v44[2 * v39] = _H18;
            float32x4_t v62 = 0uLL;
            if (v20)
            {
              float32x4_t v62 = *(float32x4_t *)&v42[16 * v39];
              *(float32x4_t *)&v43[16 * v39] = v62;
            }
            _H19 = *v40;
            __asm { FCVT            S19, H19 }
            _H20 = v40[1];
            __asm { FCVT            S20, H20 }
            _NF = (float)(fabsf(_S19) + fabsf(_S20)) < 600.0;
            float v53 = roundf(_S19);
            float v54 = v53 + (float)v39;
            _NF = _NF && v54 < (float)(Width - 1);
            BOOL v56 = _NF && v54 > 1.0;
            float v57 = roundf(_S20);
            float v58 = v57 + (float)v33;
            if (v56 && v58 < (float)(Height - 1) && v58 > 1.0)
            {
              __asm { FCVT            S18, H18 }
              uint64_t v64 = (int)v57;
              int v65 = (int)v53;
              _H19 = *(_WORD *)((char *)v143.data + 2 * (int)v53 + 2 * v39 + v37 * (v33 + v64));
              if (a8)
              {
                __asm { FCVT            S7, H19 }
                _H20 = *(short float *)&v41[2 * v39];
                __asm { FCVT            D21, H20 }
                if (_D21 < 0.0) {
                  _D21 = 0.0;
                }
                float v70 = _D21;
                if (_H20 <= COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0))) {
                  float v71 = v70;
                }
                else {
                  float v71 = 1.0;
                }
                if (vabds_f32(_S7, _S18) >= 0.5) {
                  float v38 = a9;
                }
                else {
                  float v38 = v71;
                }
              }
              double v72 = (float)(v38 * _S18);
              __asm { FCVT            D19, H19 }
              double v74 = 1.0 - v38;
              _D19 = v72 + _D19 * v74;
              __asm { FCVT            H19, D19 }
              *(_WORD *)&v44[2 * v39] = LOWORD(_D19);
              if (v20)
              {
                size_t v76 = (float32x2_t *)&v46[16 * v65 + v11 * (v33 + v64)];
                float64x2_t v77 = vmlaq_n_f64(vcvtq_f64_f32(vmul_n_f32(*(float32x2_t *)v62.f32, v38)), vcvtq_f64_f32(*v76), v74);
                *(float32x2_t *)&v77.f64[0] = vcvt_f32_f64(v77);
                float v78 = vmuls_lane_f32(v38, v62, 2) + v76[1].f32[0] * v74;
                *(float *)&v77.f64[1] = v78;
                int32x4_t v79 = (int32x4_t)vmulq_f32((float32x4_t)v77, (float32x4_t)v77);
                v79.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v79, 2), vadd_f32(*(float32x2_t *)v79.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v79.i8, 1))).u32[0];
                float32x2_t v80 = vrsqrte_f32((float32x2_t)v79.u32[0]);
                float32x2_t v81 = vmul_f32(v80, vrsqrts_f32((float32x2_t)v79.u32[0], vmul_f32(v80, v80)));
                float32x4_t v82 = vmulq_n_f32((float32x4_t)v77, vmul_f32(v81, vrsqrts_f32((float32x2_t)v79.u32[0], vmul_f32(v81, v81))).f32[0]);
                v82.i32[3] = 1.0;
                *(float32x4_t *)&v43[16 * v39] = v82;
              }
            }
            ++v39;
            v46 += 16;
            v40 += 2;
          }
          while (Width != v39);
          ++v33;
          v32 += v36;
          v31 += v34;
        }
        while (v33 != Height);
      }
      CVPixelBufferUnlockBaseAddress(a7, 1uLL);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      CVPixelBufferUnlockBaseAddress(a4, 1uLL);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      if (v20)
      {
        CVPixelBufferUnlockBaseAddress(a11, 0);
        CVPixelBufferUnlockBaseAddress(a5, 1uLL);
        CVPixelBufferUnlockBaseAddress(a6, 1uLL);
      }
      if (!a8) {
        return 0;
      }
      goto LABEL_122;
    }
    if (v20)
    {
      unint64_t v23 = CVPixelBufferGetPixelFormatType(a5);
      if (v23 != 1717855600)
      {
        unint64_t v24 = v23;
        if (v23 != 1717856627)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            size_t v11 = (size_t)&__p;
            PixelBufferUtils::pixelFormatAsString(v24, (char *)&__p);
            short float v132 = (__p.width & 0x8000000000000000) == 0 ? &__p : (vImage_Buffer *)__p.data;
            LODWORD(buf.data) = 136446210;
            *(void **)((char *)&buf.data + 4) = v132;
            _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "for normals only float 32 format are supported (provided: %{public}s)", (uint8_t *)&buf, 0xCu);
            if (SHIBYTE(__p.width) < 0) {
              operator delete(__p.data);
            }
          }
          if (v24 != 1717856627) {
            return -22956;
          }
        }
      }
    }
    CVPixelBufferLockBaseAddress(a7, 1uLL);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    memset(&__p, 0, sizeof(__p));
    size_t v25 = MEMORY[0x263F001A8];
    PixelBufferUtils::asVImageBuffer(a7, *MEMORY[0x263F001A8], &__p);
    memset(&buf, 0, sizeof(buf));
    PixelBufferUtils::asVImageBuffer(a3, *(CGRect *)v25, &buf);
    memset(&v143, 0, sizeof(v143));
    PixelBufferUtils::asVImageBuffer(a4, *(CGRect *)v25, &v143);
    memset(&v142, 0, sizeof(v142));
    PixelBufferUtils::asVImageBuffer(pixelBuffer, *(CGRect *)v25, &v142);
    if (v20)
    {
      CVPixelBufferLockBaseAddress(a5, 1uLL);
      CVPixelBufferLockBaseAddress(a6, 1uLL);
      CVPixelBufferLockBaseAddress(a11, 0);
      PixelBufferUtils::asVImageBuffer(a5, *(CGRect *)v25, &v141);
      data = (char *)v141.data;
      size_t rowBytes = v141.rowBytes;
      PixelBufferUtils::asVImageBuffer(a6, *(CGRect *)v25, &v141);
      size_t v137 = (char *)v141.data;
      size_t v11 = v141.rowBytes;
      PixelBufferUtils::asVImageBuffer(a11, *(CGRect *)v25, &v141);
      size_t v12 = (char *)v141.data;
      size_t v14 = v141.rowBytes;
      if (!a8) {
        goto LABEL_83;
      }
    }
    else if (!a8)
    {
      goto LABEL_83;
    }
    CVPixelBufferLockBaseAddress(a8, 1uLL);
    PixelBufferUtils::asVImageBuffer(a8, *(CGRect *)v25, &v141);
    size_t v13 = (char *)v141.data;
    size_t v25 = v141.rowBytes;
LABEL_83:
    size_t v83 = CVPixelBufferGetWidth(a3);
    size_t v84 = CVPixelBufferGetHeight(a3);
    if (v84 && v83)
    {
      uint64_t v85 = 0;
      uint64_t v86 = 0;
      unint64_t v87 = 0;
      size_t v88 = buf.rowBytes;
      size_t v89 = __p.rowBytes;
      size_t v90 = v142.rowBytes;
      size_t v91 = v143.rowBytes;
      float v92 = a9;
      do
      {
        unint64_t v93 = 0;
        v94 = (__int16 *)((char *)__p.data + v89 * v87);
        vImagePixelCount v95 = &v13[v87 * v25];
        if (!a8) {
          vImagePixelCount v95 = 0;
        }
        float32x4_t v96 = &data[v87 * rowBytes];
        uint64_t v97 = &v12[v87 * v14];
        if (!v20)
        {
          float32x4_t v96 = 0;
          uint64_t v97 = 0;
        }
        vImagePixelCount v98 = (char *)v142.data + v86;
        float32x4_t v99 = (char *)buf.data + v85;
        float32x4_t v100 = v137;
        do
        {
          float v113 = *(float *)&v99[4 * v93];
          *(float *)&v98[4 * v93] = v113;
          float32x4_t v114 = 0uLL;
          if (v20)
          {
            float32x4_t v114 = *(float32x4_t *)&v96[16 * v93];
            *(float32x4_t *)&v97[16 * v93] = v114;
          }
          _H18 = *v94;
          __asm { FCVT            S18, H18 }
          _H19 = v94[1];
          __asm { FCVT            S19, H19 }
          _NF = (float)(fabsf(_S18) + fabsf(_S19)) < 600.0;
          float v105 = roundf(_S18);
          float v106 = v105 + (float)v93;
          BOOL v108 = _NF && v106 < (float)(v83 - 1) && v106 > 1.0;
          float v109 = roundf(_S19);
          float v110 = v109 + (float)v87;
          if (v108 && v110 < (float)(v84 - 1) && v110 > 1.0)
          {
            uint64_t v115 = (int)v109;
            int v116 = (int)v105;
            float v117 = *(float *)((char *)v143.data + 4 * (int)v105 + 4 * v93 + v91 * (v87 + v115));
            if (a8)
            {
              float v118 = *(float *)&v95[4 * v93];
              float v119 = v118 >= 0.0 ? *(float *)&v95[4 * v93] : 0.0;
              float v92 = v118 <= 1.0 ? v119 : 1.0;
              if (vabds_f32(v117, v113) >= 0.5) {
                float v92 = a9;
              }
            }
            double v120 = (float)(v113 * v92);
            double v121 = 1.0 - v92;
            float v122 = v120 + v117 * v121;
            *(float *)&v98[4 * v93] = v122;
            if (v20)
            {
              uint32x4_t v123 = (float32x2_t *)&v100[16 * v116 + v11 * (v87 + v115)];
              float64x2_t v124 = vmlaq_n_f64(vcvtq_f64_f32(vmul_n_f32(*(float32x2_t *)v114.f32, v92)), vcvtq_f64_f32(*v123), v121);
              *(float32x2_t *)&v124.f64[0] = vcvt_f32_f64(v124);
              float v125 = vmuls_lane_f32(v92, v114, 2) + v123[1].f32[0] * v121;
              *(float *)&v124.f64[1] = v125;
              int32x4_t v126 = (int32x4_t)vmulq_f32((float32x4_t)v124, (float32x4_t)v124);
              v126.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v126, 2), vadd_f32(*(float32x2_t *)v126.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v126.i8, 1))).u32[0];
              float32x2_t v127 = vrsqrte_f32((float32x2_t)v126.u32[0]);
              float32x2_t v128 = vmul_f32(v127, vrsqrts_f32((float32x2_t)v126.u32[0], vmul_f32(v127, v127)));
              float32x4_t v129 = vmulq_n_f32((float32x4_t)v124, vmul_f32(v128, vrsqrts_f32((float32x2_t)v126.u32[0], vmul_f32(v128, v128))).f32[0]);
              v129.i32[3] = 1.0;
              *(float32x4_t *)&v97[16 * v93] = v129;
            }
          }
          ++v93;
          v100 += 16;
          v94 += 2;
        }
        while (v83 != v93);
        ++v87;
        v86 += v90;
        v85 += v88;
      }
      while (v87 != v84);
    }
    CVPixelBufferUnlockBaseAddress(a7, 1uLL);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CVPixelBufferUnlockBaseAddress(a4, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    if (v20)
    {
      CVPixelBufferUnlockBaseAddress(a11, 0);
      CVPixelBufferUnlockBaseAddress(a5, 1uLL);
      CVPixelBufferUnlockBaseAddress(a6, 1uLL);
    }
    if (!a8) {
      return 0;
    }
LABEL_122:
    CVPixelBufferUnlockBaseAddress(a8, 1uLL);
    return 0;
  }
  return result;
}

+ (int64_t)postProcessWithDepth:(__CVBuffer *)a3 confidence:(__CVBuffer *)a4 normals:(__CVBuffer *)a5 depthOutput:(__CVBuffer *)a6 confidenceOutput:(__CVBuffer *)a7 normalsOutput:(__CVBuffer *)a8 normalsRotation:(int64_t)a9 rawConfidenceUnits:(unint64_t)a10 outConfidenceUnits:(unint64_t)a11 confidenceLevelRanges:(id)a12
{
  id v18 = a12;
  int64_t v19 = +[ADUtils postProcessDepth:a3 depthOutput:a6];
  if (!v19
    && (!a4
     || !a7
     || (int64_t v19 = +[ADUtils postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:](ADUtils, "postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:", a4, a7, a10, a11, v18)) == 0)&& (!a5|| !a8|| (int64_t v19 = +[ADUtils postProcessNormals:a5 normalsOutput:a8 normalsRotation:a9]) == 0))
  {
    int64_t v19 = 0;
  }

  return v19;
}

+ (int64_t)postProcessNormals:(__CVBuffer *)a3 normalsOutput:(__CVBuffer *)a4 normalsRotation:(int64_t)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t result = -22953;
  if (a3 && a4)
  {
    unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    unint64_t v10 = PixelFormatType;
    if ((PixelFormatType == 1717856627 || PixelFormatType == 1717855600)
      && PixelFormatType == CVPixelBufferGetPixelFormatType(a4))
    {
      return +[ADUtils copyModifyNormalsPixelBuffer:a3 output:a4 normalsRotation:a5];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        PixelBufferUtils::pixelFormatAsString(v10, (char *)__p);
        size_t v11 = v13 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)vImage_Buffer buf = 136446210;
        float32x4_t v15 = v11;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "only 32bit float supported for normals (provided: %{public}s)", buf, 0xCu);
        if (v13 < 0) {
          operator delete(__p[0]);
        }
      }
      return -22956;
    }
  }
  return result;
}

+ (int64_t)postProcessConfidence:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 rawConfidenceUnits:(unint64_t)a5 outConfidenceUnits:(unint64_t)a6 confidenceLevelRanges:(id)a7
{
  uint64_t v227 = *MEMORY[0x263EF8340];
  id v11 = a7;
  int64_t v12 = -22950;
  if (!a3 || !a4) {
    goto LABEL_410;
  }
  switch(a6)
  {
    case 0uLL:
      if (!a5) {
        goto LABEL_22;
      }
      if (a5 != 2)
      {
        if (a5 != 3) {
          goto LABEL_410;
        }
        double v14 = *MEMORY[0x263F001A8];
        double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
        unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        unint64_t v18 = CVPixelBufferGetPixelFormatType(a4);
        unint64_t v19 = v18;
        if ((int)PixelFormatType > 1717856626)
        {
          if (PixelFormatType != 1717856627)
          {
            if (PixelFormatType != 1751411059 && PixelFormatType != 1751410032) {
              goto LABEL_274;
            }
            goto LABEL_40;
          }
        }
        else if (PixelFormatType != 1278226534)
        {
          if (PixelFormatType != 1278226536)
          {
            if (PixelFormatType != 1717855600) {
              goto LABEL_274;
            }
            goto LABEL_69;
          }
LABEL_40:
          if ((int)v18 <= 1717856626)
          {
            if (v18 == 1278226536) {
              goto LABEL_276;
            }
            if (v18 != 1717855600) {
              goto LABEL_274;
            }
          }
          else if (v18 != 1717856627)
          {
            if (v18 != 1751411059 && v18 != 1751410032) {
              goto LABEL_274;
            }
LABEL_276:
            int Width = CVPixelBufferGetWidth(a3);
            int Height = CVPixelBufferGetHeight(a3);
            int v26 = CVPixelBufferGetWidth(a4);
            int v27 = CVPixelBufferGetHeight(a4);
            CVPixelBufferGetBytesPerRow(a3);
            int BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
            v237.origin.x = v14;
            v237.origin.y = v13;
            v237.size.vImagePixelCount width = v16;
            v237.size.vImagePixelCount height = v15;
            if (CGRectIsEmpty(v237))
            {
              double v14 = *MEMORY[0x263F00148];
              double v13 = *(double *)(MEMORY[0x263F00148] + 8);
              double v15 = (double)Height;
              double v16 = (double)Width;
            }
            if (v16 > (double)v26 || v15 > (double)v27) {
              goto LABEL_408;
            }
            if (v14 + v16 > (double)Width || v13 + v15 > (double)Height) {
              goto LABEL_406;
            }
            if (a3 != a4) {
              CVPixelBufferLockBaseAddress(a3, 1uLL);
            }
            CVPixelBufferLockBaseAddress(a4, 0);
            CVPixelBufferGetBaseAddress(a3);
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
            if (v16 > 0.0 && v15 > 0.0)
            {
              unsigned int v133 = 0;
              do
              {
                uint64_t v134 = 0;
                do
                {
                  float v139 = 1.0;
                  __asm { FCMP            H4, #0 }
                  if (_NF ^ _VF | _ZF)
                  {
                    __asm { FCVT            S3, H4 }
                    float v142 = (float)((float)(_S3 * 0.0019531) + 1.0) * (float)((float)(_S3 * 0.0019531) + 1.0);
                    float v143 = (float)((float)(v142 * v142) * (float)(v142 * v142))
                         * (float)((float)(v142 * v142) * (float)(v142 * v142));
                    float v144 = (float)((float)(v143 * v143) * (float)(v143 * v143))
                         * (float)((float)(v143 * v143) * (float)(v143 * v143));
                    float v139 = v144 * v144;
                  }
                  float v135 = 1.0 - v139;
                  if (v135 <= 1.0) {
                    float v136 = v135;
                  }
                  else {
                    float v136 = 1.0;
                  }
                  if (v135 >= 0.0) {
                    _S3 = v136;
                  }
                  else {
                    _S3 = 0.0;
                  }
                  __asm { FCVT            H3, S3 }
                  *(_WORD *)&BaseAddress[2 * v134++ + BytesPerRow * (unint64_t)v133] = _H3;
                }
                while (v16 > (double)v134);
                ++v133;
              }
              while (v15 > (double)v133);
            }
            goto LABEL_424;
          }
          int Width = CVPixelBufferGetWidth(a3);
          int Height = CVPixelBufferGetHeight(a3);
          int v26 = CVPixelBufferGetWidth(a4);
          int v27 = CVPixelBufferGetHeight(a4);
          CVPixelBufferGetBytesPerRow(a3);
          int v118 = CVPixelBufferGetBytesPerRow(a4);
          v236.origin.x = v14;
          v236.origin.y = v13;
          v236.size.vImagePixelCount width = v16;
          v236.size.vImagePixelCount height = v15;
          if (CGRectIsEmpty(v236))
          {
            double v14 = *MEMORY[0x263F00148];
            double v13 = *(double *)(MEMORY[0x263F00148] + 8);
            double v16 = (double)Width;
            double v15 = (double)Height;
          }
          if (v16 > (double)v26 || v15 > (double)v27) {
            goto LABEL_408;
          }
          if (v14 + v16 > (double)Width || v13 + v15 > (double)Height) {
            goto LABEL_406;
          }
          if (a3 != a4) {
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          }
          CVPixelBufferLockBaseAddress(a4, 0);
          CVPixelBufferGetBaseAddress(a3);
          float v119 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (v16 > 0.0 && v15 > 0.0)
          {
            unsigned int v120 = 0;
            do
            {
              uint64_t v121 = 0;
              do
              {
                float v125 = 1.0;
                __asm { FCMP            H4, #0 }
                if (_NF ^ _VF | _ZF)
                {
                  __asm { FCVT            S3, H4 }
                  float v128 = (float)((float)(_S3 * 0.0019531) + 1.0) * (float)((float)(_S3 * 0.0019531) + 1.0);
                  float v129 = (float)((float)(v128 * v128) * (float)(v128 * v128))
                       * (float)((float)(v128 * v128) * (float)(v128 * v128));
                  float v130 = (float)((float)(v129 * v129) * (float)(v129 * v129))
                       * (float)((float)(v129 * v129) * (float)(v129 * v129));
                  float v125 = v130 * v130;
                }
                float v122 = 1.0 - v125;
                if (v122 <= 1.0) {
                  float v123 = v122;
                }
                else {
                  float v123 = 1.0;
                }
                if (v122 >= 0.0) {
                  float v124 = v123;
                }
                else {
                  float v124 = 0.0;
                }
                *(float *)&v119[4 * v121++ + v118 * (unint64_t)v120] = v124;
              }
              while (v16 > (double)v121);
              ++v120;
            }
            while (v15 > (double)v120);
          }
          goto LABEL_424;
        }
LABEL_69:
        if ((int)v18 <= 1717856626)
        {
          if (v18 != 1278226534)
          {
            if (v18 != 1278226536)
            {
              if (v18 != 1717855600) {
                goto LABEL_274;
              }
              goto LABEL_175;
            }
LABEL_92:
            int Width = CVPixelBufferGetWidth(a3);
            int Height = CVPixelBufferGetHeight(a3);
            int v26 = CVPixelBufferGetWidth(a4);
            int v27 = CVPixelBufferGetHeight(a4);
            int v28 = CVPixelBufferGetBytesPerRow(a3);
            int v29 = CVPixelBufferGetBytesPerRow(a4);
            v228.origin.x = v14;
            v228.origin.y = v13;
            v228.size.vImagePixelCount width = v16;
            v228.size.vImagePixelCount height = v15;
            if (CGRectIsEmpty(v228))
            {
              double v14 = *MEMORY[0x263F00148];
              double v13 = *(double *)(MEMORY[0x263F00148] + 8);
              double v16 = (double)Width;
              double v15 = (double)Height;
            }
            if (v16 > (double)v26 || v15 > (double)v27) {
              goto LABEL_408;
            }
            if (v14 + v16 > (double)Width || v13 + v15 > (double)Height) {
              goto LABEL_406;
            }
            if (a3 != a4) {
              CVPixelBufferLockBaseAddress(a3, 1uLL);
            }
            CVPixelBufferLockBaseAddress(a4, 0);
            float v30 = (char *)CVPixelBufferGetBaseAddress(a3);
            uint64_t v31 = (char *)CVPixelBufferGetBaseAddress(a4);
            if (v16 > 0.0 && v15 > 0.0)
            {
              unsigned int v32 = 0;
              do
              {
                uint64_t v33 = 0;
                do
                {
                  float v42 = *(float *)&v30[4 * (unint64_t)v14 + 4 * v33 + v28 * ((unint64_t)v13 + v32)];
                  float v43 = 1.0;
                  if (v42 <= 0.0)
                  {
                    float v44 = (float)((float)(v42 * 0.0019531) + 1.0) * (float)((float)(v42 * 0.0019531) + 1.0);
                    float v45 = (float)((float)(v44 * v44) * (float)(v44 * v44))
                        * (float)((float)(v44 * v44) * (float)(v44 * v44));
                    float v46 = (float)((float)(v45 * v45) * (float)(v45 * v45))
                        * (float)((float)(v45 * v45) * (float)(v45 * v45));
                    float v43 = v46 * v46;
                  }
                  float v34 = 1.0 - v43;
                  if (v34 <= 1.0) {
                    float v35 = v34;
                  }
                  else {
                    float v35 = 1.0;
                  }
                  if (v34 >= 0.0) {
                    _S3 = v35;
                  }
                  else {
                    _S3 = 0.0;
                  }
                  __asm { FCVT            H3, S3 }
                  *(_WORD *)&v31[2 * v33++ + v29 * (unint64_t)v32] = _H3;
                }
                while (v16 > (double)v33);
                ++v32;
              }
              while (v15 > (double)v32);
            }
            goto LABEL_424;
          }
LABEL_175:
          int Width = CVPixelBufferGetWidth(a3);
          int Height = CVPixelBufferGetHeight(a3);
          int v26 = CVPixelBufferGetWidth(a4);
          int v27 = CVPixelBufferGetHeight(a4);
          int v77 = CVPixelBufferGetBytesPerRow(a3);
          int v78 = CVPixelBufferGetBytesPerRow(a4);
          v232.origin.x = v14;
          v232.origin.y = v13;
          v232.size.vImagePixelCount width = v16;
          v232.size.vImagePixelCount height = v15;
          if (CGRectIsEmpty(v232))
          {
            double v14 = *MEMORY[0x263F00148];
            double v13 = *(double *)(MEMORY[0x263F00148] + 8);
            double v16 = (double)Width;
            double v15 = (double)Height;
          }
          if (v16 > (double)v26 || v15 > (double)v27) {
            goto LABEL_408;
          }
          if (v14 + v16 > (double)Width || v13 + v15 > (double)Height) {
            goto LABEL_406;
          }
          if (a3 != a4) {
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          }
          CVPixelBufferLockBaseAddress(a4, 0);
          int32x4_t v79 = (char *)CVPixelBufferGetBaseAddress(a3);
          float32x2_t v80 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (v16 > 0.0 && v15 > 0.0)
          {
            unsigned int v81 = 0;
            do
            {
              uint64_t v82 = 0;
              do
              {
                float v86 = *(float *)&v79[4 * (unint64_t)v14 + 4 * v82 + v77 * ((unint64_t)v13 + v81)];
                float v87 = 1.0;
                if (v86 <= 0.0)
                {
                  float v88 = (float)((float)(v86 * 0.0019531) + 1.0) * (float)((float)(v86 * 0.0019531) + 1.0);
                  float v89 = (float)((float)(v88 * v88) * (float)(v88 * v88))
                      * (float)((float)(v88 * v88) * (float)(v88 * v88));
                  float v90 = (float)((float)(v89 * v89) * (float)(v89 * v89))
                      * (float)((float)(v89 * v89) * (float)(v89 * v89));
                  float v87 = v90 * v90;
                }
                float v83 = 1.0 - v87;
                if (v83 <= 1.0) {
                  float v84 = v83;
                }
                else {
                  float v84 = 1.0;
                }
                if (v83 >= 0.0) {
                  float v85 = v84;
                }
                else {
                  float v85 = 0.0;
                }
                *(float *)&v80[4 * v82++ + v78 * (unint64_t)v81] = v85;
              }
              while (v16 > (double)v82);
              ++v81;
            }
            while (v15 > (double)v81);
          }
          goto LABEL_424;
        }
        if (v18 == 1717856627) {
          goto LABEL_175;
        }
        if (v18 == 1751411059 || v18 == 1751410032) {
          goto LABEL_92;
        }
LABEL_274:
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_399;
        }
        goto LABEL_427;
      }
      double v14 = *MEMORY[0x263F001A8];
      double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
      unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      unint64_t v22 = CVPixelBufferGetPixelFormatType(a4);
      unint64_t v19 = v22;
      if ((int)PixelFormatType > 1717856626)
      {
        if (PixelFormatType != 1717856627)
        {
          if (PixelFormatType != 1751411059 && PixelFormatType != 1751410032) {
            goto LABEL_356;
          }
          goto LABEL_56;
        }
      }
      else if (PixelFormatType != 1278226534)
      {
        if (PixelFormatType != 1278226536)
        {
          if (PixelFormatType != 1717855600) {
            goto LABEL_356;
          }
          goto LABEL_79;
        }
LABEL_56:
        if ((int)v22 <= 1717856626)
        {
          if (v22 == 1278226536) {
            goto LABEL_358;
          }
          if (v22 != 1717855600) {
            goto LABEL_356;
          }
        }
        else if (v22 != 1717856627)
        {
          if (v22 != 1751411059 && v22 != 1751410032) {
            goto LABEL_356;
          }
LABEL_358:
          int Width = CVPixelBufferGetWidth(a3);
          int Height = CVPixelBufferGetHeight(a3);
          int v26 = CVPixelBufferGetWidth(a4);
          int v27 = CVPixelBufferGetHeight(a4);
          int v170 = CVPixelBufferGetBytesPerRow(a3);
          int v171 = CVPixelBufferGetBytesPerRow(a4);
          v241.origin.x = v14;
          v241.origin.y = v13;
          v241.size.vImagePixelCount width = v16;
          v241.size.vImagePixelCount height = v15;
          if (CGRectIsEmpty(v241))
          {
            double v14 = *MEMORY[0x263F00148];
            double v13 = *(double *)(MEMORY[0x263F00148] + 8);
            double v15 = (double)Height;
            double v16 = (double)Width;
          }
          if (v16 > (double)v26 || v15 > (double)v27) {
            goto LABEL_408;
          }
          if (v14 + v16 > (double)Width || v13 + v15 > (double)Height) {
            goto LABEL_406;
          }
          if (a3 != a4) {
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          }
          CVPixelBufferLockBaseAddress(a4, 0);
          float v172 = (char *)CVPixelBufferGetBaseAddress(a3);
          v173 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (v16 > 0.0 && v15 > 0.0)
          {
            unsigned int v174 = 0;
            do
            {
              uint64_t v175 = 0;
              do
              {
                _H2 = *(_WORD *)&v172[2 * (unint64_t)v14 + 2 * v175 + v170 * ((unint64_t)v13 + v174)];
                __asm { FCVT            S2, H2 }
                float v178 = 1.0 - _S2;
                if (v178 <= 1.0) {
                  float v179 = v178;
                }
                else {
                  float v179 = 1.0;
                }
                if (v178 >= 0.0) {
                  _S2 = v179;
                }
                else {
                  _S2 = 0.0;
                }
                __asm { FCVT            H2, S2 }
                *(_WORD *)&v173[2 * v175++ + v171 * (unint64_t)v174] = _H2;
              }
              while (v16 > (double)v175);
              ++v174;
            }
            while (v15 > (double)v174);
          }
          goto LABEL_424;
        }
        int Width = CVPixelBufferGetWidth(a3);
        int Height = CVPixelBufferGetHeight(a3);
        int v26 = CVPixelBufferGetWidth(a4);
        int v27 = CVPixelBufferGetHeight(a4);
        int v159 = CVPixelBufferGetBytesPerRow(a3);
        int v160 = CVPixelBufferGetBytesPerRow(a4);
        v240.origin.x = v14;
        v240.origin.y = v13;
        v240.size.vImagePixelCount width = v16;
        v240.size.vImagePixelCount height = v15;
        if (CGRectIsEmpty(v240))
        {
          double v14 = *MEMORY[0x263F00148];
          double v13 = *(double *)(MEMORY[0x263F00148] + 8);
          double v16 = (double)Width;
          double v15 = (double)Height;
        }
        if (v16 > (double)v26 || v15 > (double)v27) {
          goto LABEL_408;
        }
        if (v14 + v16 > (double)Width || v13 + v15 > (double)Height) {
          goto LABEL_406;
        }
        if (a3 != a4) {
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        }
        CVPixelBufferLockBaseAddress(a4, 0);
        v161 = (char *)CVPixelBufferGetBaseAddress(a3);
        v162 = (char *)CVPixelBufferGetBaseAddress(a4);
        if (v16 > 0.0 && v15 > 0.0)
        {
          unsigned int v163 = 0;
          do
          {
            uint64_t v164 = 0;
            do
            {
              _H2 = *(_WORD *)&v161[2 * (unint64_t)v14 + 2 * v164 + v159 * ((unint64_t)v13 + v163)];
              __asm { FCVT            S2, H2 }
              float v167 = 1.0 - _S2;
              if (v167 <= 1.0) {
                float v168 = v167;
              }
              else {
                float v168 = 1.0;
              }
              if (v167 >= 0.0) {
                float v169 = v168;
              }
              else {
                float v169 = 0.0;
              }
              *(float *)&v162[4 * v164++ + v160 * (unint64_t)v163] = v169;
            }
            while (v16 > (double)v164);
            ++v163;
          }
          while (v15 > (double)v163);
        }
        goto LABEL_424;
      }
LABEL_79:
      if ((int)v22 <= 1717856626)
      {
        if (v22 == 1278226534) {
          goto LABEL_212;
        }
        if (v22 != 1278226536)
        {
          if (v22 != 1717855600) {
            goto LABEL_356;
          }
LABEL_212:
          int Width = CVPixelBufferGetWidth(a3);
          int Height = CVPixelBufferGetHeight(a3);
          int v26 = CVPixelBufferGetWidth(a4);
          int v27 = CVPixelBufferGetHeight(a4);
          int v97 = CVPixelBufferGetBytesPerRow(a3);
          int v98 = CVPixelBufferGetBytesPerRow(a4);
          v234.origin.x = v14;
          v234.origin.y = v13;
          v234.size.vImagePixelCount width = v16;
          v234.size.vImagePixelCount height = v15;
          if (CGRectIsEmpty(v234))
          {
            double v14 = *MEMORY[0x263F00148];
            double v13 = *(double *)(MEMORY[0x263F00148] + 8);
            double v16 = (double)Width;
            double v15 = (double)Height;
          }
          if (v16 > (double)v26 || v15 > (double)v27) {
            goto LABEL_408;
          }
          if (v14 + v16 > (double)Width || v13 + v15 > (double)Height) {
            goto LABEL_406;
          }
          if (a3 != a4) {
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          }
          CVPixelBufferLockBaseAddress(a4, 0);
          float32x4_t v99 = CVPixelBufferGetBaseAddress(a3);
          float32x4_t v100 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (v16 > 0.0 && v15 > 0.0)
          {
            unsigned int v101 = 0;
            do
            {
              uint64_t v102 = 0;
              do
              {
                unint64_t v103 = (unint64_t)v99 + 4 * (unint64_t)v14 + v97 * ((unint64_t)v13 + v101);
                float v104 = 1.0 - *(float *)(v103 + 4 * v102);
                if (v104 <= 1.0) {
                  float v105 = 1.0 - *(float *)(v103 + 4 * v102);
                }
                else {
                  float v105 = 1.0;
                }
                if (v104 >= 0.0) {
                  float v106 = v105;
                }
                else {
                  float v106 = 0.0;
                }
                *(float *)&v100[4 * v102++ + v98 * (unint64_t)v101] = v106;
              }
              while (v16 > (double)v102);
              ++v101;
            }
            while (v15 > (double)v101);
          }
          goto LABEL_424;
        }
LABEL_135:
        int Width = CVPixelBufferGetWidth(a3);
        int Height = CVPixelBufferGetHeight(a3);
        int v26 = CVPixelBufferGetWidth(a4);
        int v27 = CVPixelBufferGetHeight(a4);
        int v54 = CVPixelBufferGetBytesPerRow(a3);
        int v55 = CVPixelBufferGetBytesPerRow(a4);
        v230.origin.x = v14;
        v230.origin.y = v13;
        v230.size.vImagePixelCount width = v16;
        v230.size.vImagePixelCount height = v15;
        if (CGRectIsEmpty(v230))
        {
          double v14 = *MEMORY[0x263F00148];
          double v13 = *(double *)(MEMORY[0x263F00148] + 8);
          double v16 = (double)Width;
          double v15 = (double)Height;
        }
        if (v16 > (double)v26 || v15 > (double)v27) {
          goto LABEL_408;
        }
        if (v14 + v16 > (double)Width || v13 + v15 > (double)Height) {
          goto LABEL_406;
        }
        if (a3 != a4) {
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        }
        CVPixelBufferLockBaseAddress(a4, 0);
        BOOL v56 = CVPixelBufferGetBaseAddress(a3);
        float v57 = (char *)CVPixelBufferGetBaseAddress(a4);
        if (v16 > 0.0 && v15 > 0.0)
        {
          unsigned int v58 = 0;
          do
          {
            uint64_t v59 = 0;
            do
            {
              unint64_t v60 = (unint64_t)v56 + 4 * (unint64_t)v14 + v54 * ((unint64_t)v13 + v58);
              float v61 = 1.0 - *(float *)(v60 + 4 * v59);
              if (v61 <= 1.0) {
                float v62 = 1.0 - *(float *)(v60 + 4 * v59);
              }
              else {
                float v62 = 1.0;
              }
              if (v61 >= 0.0) {
                _S2 = v62;
              }
              else {
                _S2 = 0.0;
              }
              __asm { FCVT            H2, S2 }
              *(_WORD *)&v57[2 * v59++ + v55 * (unint64_t)v58] = _H2;
            }
            while (v16 > (double)v59);
            ++v58;
          }
          while (v15 > (double)v58);
        }
        goto LABEL_424;
      }
      if (v22 == 1717856627) {
        goto LABEL_212;
      }
      if (v22 == 1751411059 || v22 == 1751410032) {
        goto LABEL_135;
      }
LABEL_356:
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_399;
      }
LABEL_427:
      PixelBufferUtils::pixelFormatAsString(PixelFormatType, buf);
      int v207 = SHIBYTE(v220);
      float16x8_t v208 = *(unsigned char **)buf;
      PixelBufferUtils::pixelFormatAsString(v19, (char *)__p);
      int8x16_t v209 = buf;
      if (v207 < 0) {
        int8x16_t v209 = v208;
      }
      if (v212 >= 0) {
        uint64_t v210 = __p;
      }
      else {
        uint64_t v210 = (void **)__p[0];
      }
      *(_DWORD *)float16x8_t v213 = 136446466;
      float32x4_t v214 = v209;
      __int16 v215 = 2082;
      float32x4_t v216 = v210;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unsupported map format (%{public}s, %{public}s)", v213, 0x16u);
      if (v212 < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v220) < 0) {
        operator delete(*(void **)buf);
      }
LABEL_399:
      int64_t v12 = -22956;
      goto LABEL_410;
    case 1uLL:
      uint64_t v20 = +[ADUtils convertToLevelsConfidence:a3 confidenceOutput:a4 confidenceLevelRanges:v11];
      goto LABEL_23;
    case 2uLL:
      if (a5 == 3)
      {
        double v14 = *MEMORY[0x263F001A8];
        double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
        unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        unint64_t v23 = CVPixelBufferGetPixelFormatType(a4);
        unint64_t v19 = v23;
        if ((int)PixelFormatType > 1717856626)
        {
          if (PixelFormatType != 1717856627)
          {
            if (PixelFormatType != 1751411059 && PixelFormatType != 1751410032) {
              goto LABEL_398;
            }
            goto LABEL_64;
          }
        }
        else if (PixelFormatType != 1278226534)
        {
          if (PixelFormatType != 1278226536)
          {
            if (PixelFormatType != 1717855600) {
              goto LABEL_398;
            }
            goto LABEL_84;
          }
LABEL_64:
          if ((int)v23 <= 1717856626)
          {
            if (v23 == 1278226536) {
              goto LABEL_400;
            }
            if (v23 != 1717855600) {
              goto LABEL_398;
            }
          }
          else if (v23 != 1717856627)
          {
            if (v23 != 1751411059 && v23 != 1751410032) {
              goto LABEL_398;
            }
LABEL_400:
            int Width = CVPixelBufferGetWidth(a3);
            int Height = CVPixelBufferGetHeight(a3);
            int v26 = CVPixelBufferGetWidth(a4);
            int v27 = CVPixelBufferGetHeight(a4);
            CVPixelBufferGetBytesPerRow(a3);
            int v192 = CVPixelBufferGetBytesPerRow(a4);
            v243.origin.x = v14;
            v243.origin.y = v13;
            v243.size.vImagePixelCount width = v16;
            v243.size.vImagePixelCount height = v15;
            if (CGRectIsEmpty(v243))
            {
              double v14 = *MEMORY[0x263F00148];
              double v13 = *(double *)(MEMORY[0x263F00148] + 8);
              double v15 = (double)Height;
              double v16 = (double)Width;
            }
            if (v16 <= (double)v26 && v15 <= (double)v27)
            {
              if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
              {
                if (a3 != a4) {
                  CVPixelBufferLockBaseAddress(a3, 1uLL);
                }
                CVPixelBufferLockBaseAddress(a4, 0);
                CVPixelBufferGetBaseAddress(a3);
                v197 = (char *)CVPixelBufferGetBaseAddress(a4);
                if (v16 > 0.0 && v15 > 0.0)
                {
                  unsigned int v198 = 0;
                  do
                  {
                    uint64_t v199 = 0;
                    do
                    {
                      _S2 = 1.0;
                      __asm { FCMP            H3, #0 }
                      if (_NF ^ _VF | _ZF)
                      {
                        __asm { FCVT            S2, H3 }
                        float v204 = (float)((float)(_S2 * 0.0019531) + 1.0) * (float)((float)(_S2 * 0.0019531) + 1.0);
                        float v205 = (float)((float)(v204 * v204) * (float)(v204 * v204))
                             * (float)((float)(v204 * v204) * (float)(v204 * v204));
                        float v206 = (float)((float)(v205 * v205) * (float)(v205 * v205))
                             * (float)((float)(v205 * v205) * (float)(v205 * v205));
                        _S2 = v206 * v206;
                      }
                      __asm { FCVT            H2, S2 }
                      *(_WORD *)&v197[2 * v199++ + v192 * (unint64_t)v198] = _H2;
                    }
                    while (v16 > (double)v199);
                    ++v198;
                  }
                  while (v15 > (double)v198);
                }
                goto LABEL_424;
              }
              goto LABEL_406;
            }
            goto LABEL_408;
          }
          int Width = CVPixelBufferGetWidth(a3);
          int Height = CVPixelBufferGetHeight(a3);
          int v26 = CVPixelBufferGetWidth(a4);
          int v27 = CVPixelBufferGetHeight(a4);
          CVPixelBufferGetBytesPerRow(a3);
          int v182 = CVPixelBufferGetBytesPerRow(a4);
          v242.origin.x = v14;
          v242.origin.y = v13;
          v242.size.vImagePixelCount width = v16;
          v242.size.vImagePixelCount height = v15;
          if (CGRectIsEmpty(v242))
          {
            double v14 = *MEMORY[0x263F00148];
            double v13 = *(double *)(MEMORY[0x263F00148] + 8);
            double v16 = (double)Width;
            double v15 = (double)Height;
          }
          if (v16 <= (double)v26 && v15 <= (double)v27)
          {
            if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
            {
              if (a3 != a4) {
                CVPixelBufferLockBaseAddress(a3, 1uLL);
              }
              CVPixelBufferLockBaseAddress(a4, 0);
              CVPixelBufferGetBaseAddress(a3);
              v183 = (char *)CVPixelBufferGetBaseAddress(a4);
              if (v16 > 0.0 && v15 > 0.0)
              {
                unsigned int v184 = 0;
                do
                {
                  uint64_t v185 = 0;
                  do
                  {
                    float v186 = 1.0;
                    __asm { FCMP            H3, #0 }
                    if (_NF ^ _VF | _ZF)
                    {
                      __asm { FCVT            S2, H3 }
                      float v189 = (float)((float)(_S2 * 0.0019531) + 1.0) * (float)((float)(_S2 * 0.0019531) + 1.0);
                      float v190 = (float)((float)(v189 * v189) * (float)(v189 * v189))
                           * (float)((float)(v189 * v189) * (float)(v189 * v189));
                      float v191 = (float)((float)(v190 * v190) * (float)(v190 * v190))
                           * (float)((float)(v190 * v190) * (float)(v190 * v190));
                      float v186 = v191 * v191;
                    }
                    *(float *)&v183[4 * v185++ + v182 * (unint64_t)v184] = v186;
                  }
                  while (v16 > (double)v185);
                  ++v184;
                }
                while (v15 > (double)v184);
              }
              goto LABEL_424;
            }
            goto LABEL_406;
          }
          goto LABEL_408;
        }
LABEL_84:
        if ((int)v23 <= 1717856626)
        {
          if (v23 == 1278226534) {
            goto LABEL_233;
          }
          if (v23 != 1278226536)
          {
            if (v23 != 1717855600) {
              goto LABEL_398;
            }
LABEL_233:
            int Width = CVPixelBufferGetWidth(a3);
            int Height = CVPixelBufferGetHeight(a3);
            int v26 = CVPixelBufferGetWidth(a4);
            int v27 = CVPixelBufferGetHeight(a4);
            int v107 = CVPixelBufferGetBytesPerRow(a3);
            int v108 = CVPixelBufferGetBytesPerRow(a4);
            v235.origin.x = v14;
            v235.origin.y = v13;
            v235.size.vImagePixelCount width = v16;
            v235.size.vImagePixelCount height = v15;
            if (CGRectIsEmpty(v235))
            {
              double v14 = *MEMORY[0x263F00148];
              double v13 = *(double *)(MEMORY[0x263F00148] + 8);
              double v16 = (double)Width;
              double v15 = (double)Height;
            }
            if (v16 <= (double)v26 && v15 <= (double)v27)
            {
              if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
              {
                if (a3 != a4) {
                  CVPixelBufferLockBaseAddress(a3, 1uLL);
                }
                CVPixelBufferLockBaseAddress(a4, 0);
                float v109 = (char *)CVPixelBufferGetBaseAddress(a3);
                float v110 = (char *)CVPixelBufferGetBaseAddress(a4);
                if (v16 > 0.0 && v15 > 0.0)
                {
                  unsigned int v111 = 0;
                  do
                  {
                    uint64_t v112 = 0;
                    do
                    {
                      float v113 = *(float *)&v109[4 * (unint64_t)v14
                                           + 4 * v112
                                           + v107 * ((unint64_t)v13 + v111)];
                      float v114 = 1.0;
                      if (v113 <= 0.0)
                      {
                        float v115 = (float)((float)(v113 * 0.0019531) + 1.0) * (float)((float)(v113 * 0.0019531) + 1.0);
                        float v116 = (float)((float)(v115 * v115) * (float)(v115 * v115))
                             * (float)((float)(v115 * v115) * (float)(v115 * v115));
                        float v117 = (float)((float)(v116 * v116) * (float)(v116 * v116))
                             * (float)((float)(v116 * v116) * (float)(v116 * v116));
                        float v114 = v117 * v117;
                      }
                      *(float *)&v110[4 * v112++ + v108 * (unint64_t)v111] = v114;
                    }
                    while (v16 > (double)v112);
                    ++v111;
                  }
                  while (v15 > (double)v111);
                }
                goto LABEL_424;
              }
              goto LABEL_406;
            }
            goto LABEL_408;
          }
          goto LABEL_159;
        }
        if (v23 == 1717856627) {
          goto LABEL_233;
        }
        if (v23 == 1751411059 || v23 == 1751410032)
        {
LABEL_159:
          int Width = CVPixelBufferGetWidth(a3);
          int Height = CVPixelBufferGetHeight(a3);
          int v26 = CVPixelBufferGetWidth(a4);
          int v27 = CVPixelBufferGetHeight(a4);
          int v65 = CVPixelBufferGetBytesPerRow(a3);
          int v66 = CVPixelBufferGetBytesPerRow(a4);
          v231.origin.x = v14;
          v231.origin.y = v13;
          v231.size.vImagePixelCount width = v16;
          v231.size.vImagePixelCount height = v15;
          if (CGRectIsEmpty(v231))
          {
            double v14 = *MEMORY[0x263F00148];
            double v13 = *(double *)(MEMORY[0x263F00148] + 8);
            double v16 = (double)Width;
            double v15 = (double)Height;
          }
          if (v16 <= (double)v26 && v15 <= (double)v27)
          {
            if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
            {
              if (a3 != a4) {
                CVPixelBufferLockBaseAddress(a3, 1uLL);
              }
              CVPixelBufferLockBaseAddress(a4, 0);
              vImage_Buffer v67 = (char *)CVPixelBufferGetBaseAddress(a3);
              float v68 = (char *)CVPixelBufferGetBaseAddress(a4);
              if (v16 > 0.0 && v15 > 0.0)
              {
                unsigned int v69 = 0;
                do
                {
                  uint64_t v70 = 0;
                  do
                  {
                    float v72 = *(float *)&v67[4 * (unint64_t)v14 + 4 * v70 + v65 * ((unint64_t)v13 + v69)];
                    _S2 = 1.0;
                    if (v72 <= 0.0)
                    {
                      float v74 = (float)((float)(v72 * 0.0019531) + 1.0) * (float)((float)(v72 * 0.0019531) + 1.0);
                      float v75 = (float)((float)(v74 * v74) * (float)(v74 * v74))
                          * (float)((float)(v74 * v74) * (float)(v74 * v74));
                      float v76 = (float)((float)(v75 * v75) * (float)(v75 * v75))
                          * (float)((float)(v75 * v75) * (float)(v75 * v75));
                      _S2 = v76 * v76;
                    }
                    __asm { FCVT            H2, S2 }
                    *(_WORD *)&v68[2 * v70++ + v66 * (unint64_t)v69] = _H2;
                  }
                  while (v16 > (double)v70);
                  ++v69;
                }
                while (v15 > (double)v69);
              }
              goto LABEL_424;
            }
            goto LABEL_406;
          }
          goto LABEL_408;
        }
LABEL_398:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_427;
        }
        goto LABEL_399;
      }
      if (a5 != 2)
      {
        if (a5) {
          goto LABEL_410;
        }
        double v14 = *MEMORY[0x263F001A8];
        double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
        unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
        unint64_t v21 = CVPixelBufferGetPixelFormatType(a4);
        unint64_t v19 = v21;
        if ((int)PixelFormatType > 1717856626)
        {
          if (PixelFormatType != 1717856627)
          {
            if (PixelFormatType != 1751411059 && PixelFormatType != 1751410032) {
              goto LABEL_316;
            }
            goto LABEL_48;
          }
        }
        else if (PixelFormatType != 1278226534)
        {
          if (PixelFormatType != 1278226536)
          {
            if (PixelFormatType != 1717855600) {
              goto LABEL_316;
            }
            goto LABEL_74;
          }
LABEL_48:
          if ((int)v21 <= 1717856626)
          {
            if (v21 == 1278226536) {
              goto LABEL_318;
            }
            if (v21 != 1717855600) {
              goto LABEL_316;
            }
          }
          else if (v21 != 1717856627)
          {
            if (v21 != 1751411059 && v21 != 1751410032) {
              goto LABEL_316;
            }
LABEL_318:
            int Width = CVPixelBufferGetWidth(a3);
            int Height = CVPixelBufferGetHeight(a3);
            int v26 = CVPixelBufferGetWidth(a4);
            int v27 = CVPixelBufferGetHeight(a4);
            int v153 = CVPixelBufferGetBytesPerRow(a3);
            int v154 = CVPixelBufferGetBytesPerRow(a4);
            v239.origin.x = v14;
            v239.origin.y = v13;
            v239.size.vImagePixelCount width = v16;
            v239.size.vImagePixelCount height = v15;
            if (CGRectIsEmpty(v239))
            {
              double v14 = *MEMORY[0x263F00148];
              double v13 = *(double *)(MEMORY[0x263F00148] + 8);
              double v15 = (double)Height;
              double v16 = (double)Width;
            }
            if (v16 <= (double)v26 && v15 <= (double)v27)
            {
              if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
              {
                if (a3 != a4) {
                  CVPixelBufferLockBaseAddress(a3, 1uLL);
                }
                CVPixelBufferLockBaseAddress(a4, 0);
                float v155 = (char *)CVPixelBufferGetBaseAddress(a3);
                BOOL v156 = (char *)CVPixelBufferGetBaseAddress(a4);
                if (v16 > 0.0 && v15 > 0.0)
                {
                  unsigned int v157 = 0;
                  do
                  {
                    uint64_t v158 = 0;
                    do
                    {
                      *(short float *)&v156[2 * v158 + v154 * (unint64_t)v157] = COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0))
                                                                                      - *(short float *)&v155[2 * (unint64_t)v14 + 2 * v158 + v153 * ((unint64_t)v13 + v157)];
                      ++v158;
                    }
                    while (v16 > (double)v158);
                    ++v157;
                  }
                  while (v15 > (double)v157);
                }
                goto LABEL_424;
              }
              goto LABEL_406;
            }
            goto LABEL_408;
          }
          int Width = CVPixelBufferGetWidth(a3);
          int Height = CVPixelBufferGetHeight(a3);
          int v26 = CVPixelBufferGetWidth(a4);
          int v27 = CVPixelBufferGetHeight(a4);
          int v145 = CVPixelBufferGetBytesPerRow(a3);
          int v146 = CVPixelBufferGetBytesPerRow(a4);
          v238.origin.x = v14;
          v238.origin.y = v13;
          v238.size.vImagePixelCount width = v16;
          v238.size.vImagePixelCount height = v15;
          if (CGRectIsEmpty(v238))
          {
            double v14 = *MEMORY[0x263F00148];
            double v13 = *(double *)(MEMORY[0x263F00148] + 8);
            double v16 = (double)Width;
            double v15 = (double)Height;
          }
          if (v16 <= (double)v26 && v15 <= (double)v27)
          {
            if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
            {
              if (a3 != a4) {
                CVPixelBufferLockBaseAddress(a3, 1uLL);
              }
              CVPixelBufferLockBaseAddress(a4, 0);
              float v147 = (char *)CVPixelBufferGetBaseAddress(a3);
              float v148 = (char *)CVPixelBufferGetBaseAddress(a4);
              if (v16 > 0.0 && v15 > 0.0)
              {
                unsigned int v149 = 0;
                do
                {
                  uint64_t v150 = 0;
                  do
                  {
                    _H1 = *(_WORD *)&v147[2 * (unint64_t)v14 + 2 * v150 + v145 * ((unint64_t)v13 + v149)];
                    __asm { FCVT            S1, H1 }
                    *(float *)&v148[4 * v150++ + v146 * (unint64_t)v149] = 1.0 - _S1;
                  }
                  while (v16 > (double)v150);
                  ++v149;
                }
                while (v15 > (double)v149);
              }
              goto LABEL_424;
            }
            goto LABEL_406;
          }
          goto LABEL_408;
        }
LABEL_74:
        if ((int)v21 <= 1717856626)
        {
          if (v21 == 1278226534) {
            goto LABEL_197;
          }
          if (v21 != 1278226536)
          {
            if (v21 != 1717855600) {
              goto LABEL_316;
            }
LABEL_197:
            int Width = CVPixelBufferGetWidth(a3);
            int Height = CVPixelBufferGetHeight(a3);
            int v26 = CVPixelBufferGetWidth(a4);
            int v27 = CVPixelBufferGetHeight(a4);
            int v91 = CVPixelBufferGetBytesPerRow(a3);
            int v92 = CVPixelBufferGetBytesPerRow(a4);
            v233.origin.x = v14;
            v233.origin.y = v13;
            v233.size.vImagePixelCount width = v16;
            v233.size.vImagePixelCount height = v15;
            if (CGRectIsEmpty(v233))
            {
              double v14 = *MEMORY[0x263F00148];
              double v13 = *(double *)(MEMORY[0x263F00148] + 8);
              double v16 = (double)Width;
              double v15 = (double)Height;
            }
            if (v16 <= (double)v26 && v15 <= (double)v27)
            {
              if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
              {
                if (a3 != a4) {
                  CVPixelBufferLockBaseAddress(a3, 1uLL);
                }
                CVPixelBufferLockBaseAddress(a4, 0);
                unint64_t v93 = (char *)CVPixelBufferGetBaseAddress(a3);
                v94 = (char *)CVPixelBufferGetBaseAddress(a4);
                if (v16 > 0.0 && v15 > 0.0)
                {
                  unsigned int v95 = 0;
                  do
                  {
                    uint64_t v96 = 0;
                    do
                    {
                      *(float *)&v94[4 * v96 + v92 * (unint64_t)v95] = 1.0
                                                                            - *(float *)&v93[4 * (unint64_t)v14
                                                                                           + 4 * v96
                                                                                           + v91
                                                                                           * ((unint64_t)v13 + v95)];
                      ++v96;
                    }
                    while (v16 > (double)v96);
                    ++v95;
                  }
                  while (v15 > (double)v95);
                }
LABEL_424:
                if (a3 != a4) {
                  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
                }
                CVPixelBufferUnlockBaseAddress(a4, 0);
                int64_t v12 = 0;
                goto LABEL_410;
              }
              goto LABEL_406;
            }
            goto LABEL_408;
          }
          goto LABEL_117;
        }
        if (v21 == 1717856627) {
          goto LABEL_197;
        }
        if (v21 == 1751411059 || v21 == 1751410032)
        {
LABEL_117:
          int Width = CVPixelBufferGetWidth(a3);
          int Height = CVPixelBufferGetHeight(a3);
          int v26 = CVPixelBufferGetWidth(a4);
          int v27 = CVPixelBufferGetHeight(a4);
          int v47 = CVPixelBufferGetBytesPerRow(a3);
          int v48 = CVPixelBufferGetBytesPerRow(a4);
          v229.origin.x = v14;
          v229.origin.y = v13;
          v229.size.vImagePixelCount width = v16;
          v229.size.vImagePixelCount height = v15;
          if (CGRectIsEmpty(v229))
          {
            double v14 = *MEMORY[0x263F00148];
            double v13 = *(double *)(MEMORY[0x263F00148] + 8);
            double v16 = (double)Width;
            double v15 = (double)Height;
          }
          if (v16 <= (double)v26 && v15 <= (double)v27)
          {
            if (v14 + v16 <= (double)Width && v13 + v15 <= (double)Height)
            {
              if (a3 != a4) {
                CVPixelBufferLockBaseAddress(a3, 1uLL);
              }
              CVPixelBufferLockBaseAddress(a4, 0);
              BOOL v49 = (char *)CVPixelBufferGetBaseAddress(a3);
              float v50 = (char *)CVPixelBufferGetBaseAddress(a4);
              if (v16 > 0.0 && v15 > 0.0)
              {
                unsigned int v51 = 0;
                do
                {
                  uint64_t v52 = 0;
                  do
                  {
                    _S1 = 1.0
                        - *(float *)&v49[4 * (unint64_t)v14 + 4 * v52 + v47 * ((unint64_t)v13 + v51)];
                    __asm { FCVT            H1, S1 }
                    *(_WORD *)&v50[2 * v52++ + v48 * (unint64_t)v51] = LOWORD(_S1);
                  }
                  while (v16 > (double)v52);
                  ++v51;
                }
                while (v15 > (double)v51);
              }
              goto LABEL_424;
            }
LABEL_406:
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)vImage_Buffer buf = 134219264;
              *(double *)&uint8_t buf[4] = v14;
              __int16 v218 = 2048;
              double v219 = v13;
              __int16 v220 = 2048;
              *(double *)float32x4_t v221 = v16;
              *(_WORD *)&v221[8] = 2048;
              double v222 = v15;
              __int16 v223 = 1024;
              int v224 = Width;
              __int16 v225 = 1024;
              int v226 = Height;
              v193 = &_os_log_internal;
              v194 = "Dimensions mismatch. Cannot fit ROI (%f,%f,%f,%f) inside input (%d,%d)";
              uint32_t v195 = 54;
LABEL_412:
              _os_log_error_impl(&dword_215F16000, v193, OS_LOG_TYPE_ERROR, v194, buf, v195);
              int64_t v12 = -22957;
              goto LABEL_410;
            }
            goto LABEL_409;
          }
LABEL_408:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)vImage_Buffer buf = 134218752;
            *(double *)&uint8_t buf[4] = v16;
            __int16 v218 = 2048;
            double v219 = v15;
            __int16 v220 = 1024;
            *(_DWORD *)float32x4_t v221 = v26;
            *(_WORD *)&v221[4] = 1024;
            *(_DWORD *)&v221[6] = v27;
            v193 = &_os_log_internal;
            v194 = "Dimensions mismatch. Cannot fit ROI (%f,%f) inside output (%d,%d)";
            uint32_t v195 = 34;
            goto LABEL_412;
          }
LABEL_409:
          int64_t v12 = -22957;
          goto LABEL_410;
        }
LABEL_316:
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_399;
        }
        goto LABEL_427;
      }
LABEL_22:
      uint64_t v20 = copyModifyPixelBuffer<&(postProcessingNone(float))>(a3, a4, *MEMORY[0x263F001A8], *(CGFloat *)(MEMORY[0x263F001A8] + 8), *(CGFloat *)(MEMORY[0x263F001A8] + 16), *(CGFloat *)(MEMORY[0x263F001A8] + 24));
LABEL_23:
      int64_t v12 = v20;
LABEL_410:

      return v12;
    case 3uLL:
      if (a5 == 3) {
        goto LABEL_22;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)vImage_Buffer buf = 0;
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Conversion to kADConfidenceUnitsLogarithmicVariance from other units is not supported", buf, 2u);
      }
      int64_t v12 = -22951;
      goto LABEL_410;
    default:
      goto LABEL_410;
  }
}

+ (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4 inputRoi:(CGRect)a5
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  int64_t result = -22950;
  if (!a3 || !a4) {
    return result;
  }
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  OSType v13 = CVPixelBufferGetPixelFormatType(a4);
  if (PixelFormatType == v13)
  {
    v93.origin.double x = x;
    v93.origin.double y = y;
    v93.size.double width = width;
    v93.size.double height = height;
    if (copyPixelBufferVImage(a4, *MEMORY[0x263F00148], a3, v93)) {
      return -22950;
    }
    else {
      return 0;
    }
  }
  _ZF = PixelFormatType == 1717856627 || PixelFormatType == 1751411059;
  int v15 = _ZF;
  int v17 = v13 == 1717856627 || v13 == 1751411059;
  if (v15 != v17)
  {
    unint64_t v18 = CVPixelBufferGetPixelFormatType(a3);
    unint64_t v19 = CVPixelBufferGetPixelFormatType(a4);
    unint64_t v20 = v19;
    if ((int)v18 > 1717856626)
    {
      if (v18 == 1717856627) {
        goto LABEL_36;
      }
      if (v18 != 1751411059 && v18 != 1751410032) {
        goto LABEL_100;
      }
    }
    else
    {
      if (v18 == 1278226534) {
        goto LABEL_36;
      }
      if (v18 != 1278226536)
      {
        if (v18 != 1717855600) {
          goto LABEL_100;
        }
LABEL_36:
        if ((int)v19 > 1717856626)
        {
          if (v19 == 1717856627) {
            goto LABEL_62;
          }
          if (v19 != 1751411059 && v19 != 1751410032) {
            goto LABEL_100;
          }
        }
        else
        {
          if (v19 == 1278226534) {
            goto LABEL_62;
          }
          if (v19 != 1278226536)
          {
            if (v19 != 1717855600) {
              goto LABEL_100;
            }
LABEL_62:
            int v21 = CVPixelBufferGetWidth(a3);
            int v22 = CVPixelBufferGetHeight(a3);
            int v23 = CVPixelBufferGetWidth(a4);
            int v24 = CVPixelBufferGetHeight(a4);
            int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
            int v38 = CVPixelBufferGetBytesPerRow(a4);
            v90.origin.double x = x;
            v90.origin.double y = y;
            v90.size.double width = width;
            v90.size.double height = height;
            if (CGRectIsEmpty(v90))
            {
              double x = *MEMORY[0x263F00148];
              double y = *(double *)(MEMORY[0x263F00148] + 8);
              double height = (double)v22;
              double width = (double)v21;
            }
            if (width <= (double)v23 && height <= (double)v24)
            {
              if (x + width <= (double)v21 && y + height <= (double)v22)
              {
                if (a3 != a4) {
                  CVPixelBufferLockBaseAddress(a3, 1uLL);
                }
                CVPixelBufferLockBaseAddress(a4, 0);
                BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
                float v40 = (char *)CVPixelBufferGetBaseAddress(a4);
                if (width > 0.0 && height > 0.0)
                {
                  unsigned int v41 = 0;
                  do
                  {
                    uint64_t v42 = 0;
                    do
                    {
                      float v43 = *(float *)&BaseAddress[4 * (unint64_t)x
                                                 + 4 * v42
                                                 + BytesPerRow * ((unint64_t)y + v41)];
                      if (v43 == 0.0) {
                        float v44 = 0.0;
                      }
                      else {
                        float v44 = 1.0 / v43;
                      }
                      *(float *)&v40[4 * v42++ + v38 * (unint64_t)v41] = v44;
                    }
                    while (width > (double)v42);
                    ++v41;
                  }
                  while (height > (double)v41);
                }
LABEL_124:
                if (a3 != a4) {
                  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
                }
                CVPixelBufferUnlockBaseAddress(a4, 0);
                return 0;
              }
              goto LABEL_108;
            }
            goto LABEL_110;
          }
        }
        int v21 = CVPixelBufferGetWidth(a3);
        int v22 = CVPixelBufferGetHeight(a3);
        int v23 = CVPixelBufferGetWidth(a4);
        int v24 = CVPixelBufferGetHeight(a4);
        int v25 = CVPixelBufferGetBytesPerRow(a3);
        int v26 = CVPixelBufferGetBytesPerRow(a4);
        v89.origin.double x = x;
        v89.origin.double y = y;
        v89.size.double width = width;
        v89.size.double height = height;
        if (CGRectIsEmpty(v89))
        {
          double x = *MEMORY[0x263F00148];
          double y = *(double *)(MEMORY[0x263F00148] + 8);
          double height = (double)v22;
          double width = (double)v21;
        }
        if (width <= (double)v23 && height <= (double)v24)
        {
          if (x + width <= (double)v21 && y + height <= (double)v22)
          {
            if (a3 != a4) {
              CVPixelBufferLockBaseAddress(a3, 1uLL);
            }
            CVPixelBufferLockBaseAddress(a4, 0);
            int v27 = (char *)CVPixelBufferGetBaseAddress(a3);
            int v28 = (char *)CVPixelBufferGetBaseAddress(a4);
            if (width > 0.0 && height > 0.0)
            {
              unsigned int v29 = 0;
              do
              {
                uint64_t v30 = 0;
                do
                {
                  float v31 = *(float *)&v27[4 * (unint64_t)x + 4 * v30 + v25 * ((unint64_t)y + v29)];
                  if (v31 == 0.0) {
                    _S2 = 0.0;
                  }
                  else {
                    _S2 = 1.0 / v31;
                  }
                  __asm { FCVT            H2, S2 }
                  *(_WORD *)&v28[2 * v30++ + v26 * (unint64_t)v29] = _H2;
                }
                while (width > (double)v30);
                ++v29;
              }
              while (height > (double)v29);
            }
            goto LABEL_124;
          }
LABEL_108:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)vImage_Buffer buf = 134219264;
            *(double *)&uint8_t buf[4] = x;
            __int16 v78 = 2048;
            double v79 = y;
            __int16 v80 = 2048;
            *(double *)unsigned int v81 = width;
            *(_WORD *)&v81[8] = 2048;
            double v82 = height;
            __int16 v83 = 1024;
            int v84 = v21;
            __int16 v85 = 1024;
            int v86 = v22;
            unsigned int v58 = &_os_log_internal;
            uint64_t v59 = "Dimensions mismatch. Cannot fit ROI (%f,%f,%f,%f) inside input (%d,%d)";
            uint32_t v60 = 54;
LABEL_128:
            _os_log_error_impl(&dword_215F16000, v58, OS_LOG_TYPE_ERROR, v59, buf, v60);
            return -22957;
          }
          return -22957;
        }
LABEL_110:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)vImage_Buffer buf = 134218752;
          *(double *)&uint8_t buf[4] = width;
          __int16 v78 = 2048;
          double v79 = height;
          __int16 v80 = 1024;
          *(_DWORD *)unsigned int v81 = v23;
          *(_WORD *)&v81[4] = 1024;
          *(_DWORD *)&v81[6] = v24;
          unsigned int v58 = &_os_log_internal;
          uint64_t v59 = "Dimensions mismatch. Cannot fit ROI (%f,%f) inside output (%d,%d)";
          uint32_t v60 = 34;
          goto LABEL_128;
        }
        return -22957;
      }
    }
    if ((int)v19 <= 1717856626)
    {
      if (v19 == 1278226536) {
        goto LABEL_102;
      }
      if (v19 != 1717855600)
      {
LABEL_100:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          PixelBufferUtils::pixelFormatAsString(v18, buf);
          int v67 = SHIBYTE(v80);
          float v68 = *(unsigned char **)buf;
          PixelBufferUtils::pixelFormatAsString(v20, (char *)__p);
          unsigned int v69 = buf;
          if (v67 < 0) {
            unsigned int v69 = v68;
          }
          if (v72 >= 0) {
            uint64_t v70 = __p;
          }
          else {
            uint64_t v70 = (void **)__p[0];
          }
          *(_DWORD *)float v73 = 136446466;
          float v74 = v69;
          __int16 v75 = 2082;
          float v76 = v70;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unsupported map format (%{public}s, %{public}s)", v73, 0x16u);
          if (v72 < 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(v80) < 0) {
            operator delete(*(void **)buf);
          }
        }
        return -22956;
      }
    }
    else if (v19 != 1717856627)
    {
      if (v19 != 1751411059 && v19 != 1751410032) {
        goto LABEL_100;
      }
LABEL_102:
      int v21 = CVPixelBufferGetWidth(a3);
      int v22 = CVPixelBufferGetHeight(a3);
      int v23 = CVPixelBufferGetWidth(a4);
      int v24 = CVPixelBufferGetHeight(a4);
      int v56 = CVPixelBufferGetBytesPerRow(a3);
      int v57 = CVPixelBufferGetBytesPerRow(a4);
      v92.origin.double x = x;
      v92.origin.double y = y;
      v92.size.double width = width;
      v92.size.double height = height;
      if (CGRectIsEmpty(v92))
      {
        double x = *MEMORY[0x263F00148];
        double y = *(double *)(MEMORY[0x263F00148] + 8);
        double width = (double)v21;
        double height = (double)v22;
      }
      if (width <= (double)v23 && height <= (double)v24)
      {
        if (x + width <= (double)v21 && y + height <= (double)v22)
        {
          if (a3 != a4) {
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          }
          CVPixelBufferLockBaseAddress(a4, 0);
          float v61 = (char *)CVPixelBufferGetBaseAddress(a3);
          float v62 = (char *)CVPixelBufferGetBaseAddress(a4);
          if (width > 0.0 && height > 0.0)
          {
            unsigned int v63 = 0;
            do
            {
              uint64_t v64 = 0;
              do
              {
                __asm { FCMP            H2, #0 }
                if (_ZF) {
                  short float v66 = COERCE_SHORT_FLOAT(0);
                }
                else {
                  short float v66 = COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0))
                }
                      / *(short float *)&v61[2 * (unint64_t)x + 2 * v64 + v56 * ((unint64_t)y + v63)];
                *(short float *)&v62[2 * v64++ + v57 * (unint64_t)v63] = v66;
              }
              while (width > (double)v64);
              ++v63;
            }
            while (height > (double)v63);
          }
          goto LABEL_124;
        }
        goto LABEL_108;
      }
      goto LABEL_110;
    }
    int v21 = CVPixelBufferGetWidth(a3);
    int v22 = CVPixelBufferGetHeight(a3);
    int v23 = CVPixelBufferGetWidth(a4);
    int v24 = CVPixelBufferGetHeight(a4);
    int v45 = CVPixelBufferGetBytesPerRow(a3);
    int v46 = CVPixelBufferGetBytesPerRow(a4);
    v91.origin.double x = x;
    v91.origin.double y = y;
    v91.size.double width = width;
    v91.size.double height = height;
    if (CGRectIsEmpty(v91))
    {
      double x = *MEMORY[0x263F00148];
      double y = *(double *)(MEMORY[0x263F00148] + 8);
      double height = (double)v22;
      double width = (double)v21;
    }
    if (width <= (double)v23 && height <= (double)v24)
    {
      if (x + width <= (double)v21 && y + height <= (double)v22)
      {
        if (a3 != a4) {
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        }
        CVPixelBufferLockBaseAddress(a4, 0);
        int v47 = (char *)CVPixelBufferGetBaseAddress(a3);
        int v48 = (char *)CVPixelBufferGetBaseAddress(a4);
        if (width > 0.0 && height > 0.0)
        {
          unsigned int v49 = 0;
          do
          {
            uint64_t v50 = 0;
            do
            {
              _H2 = *(_WORD *)&v47[2 * (unint64_t)x + 2 * v50 + v45 * ((unint64_t)y + v49)];
              __asm { FCVT            S3, H2 }
              float v53 = 1.0 / _S3;
              __asm { FCMP            H2, #0 }
              if (_ZF) {
                float v55 = 0.0;
              }
              else {
                float v55 = v53;
              }
              *(float *)&v48[4 * v50++ + v46 * (unint64_t)v49] = v55;
            }
            while (width > (double)v50);
            ++v49;
          }
          while (height > (double)v49);
        }
        goto LABEL_124;
      }
      goto LABEL_108;
    }
    goto LABEL_110;
  }
  return copyModifyPixelBuffer<&(postProcessingNone(float))>(a3, a4, x, y, width, height);
}

+ (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4
{
  return +[ADUtils postProcessDepth:depthOutput:inputRoi:](ADUtils, "postProcessDepth:depthOutput:inputRoi:", a3, a4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

+ (int64_t)copyModifyNormalsPixelBuffer:(__CVBuffer *)a3 output:(__CVBuffer *)a4 normalsRotation:(int64_t)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int Width = CVPixelBufferGetWidth(a4);
  int Height = CVPixelBufferGetHeight(a4);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  id v11 = (float32x4_t *)CVPixelBufferGetBaseAddress(a4);
  size_t DataSize = CVPixelBufferGetDataSize(a3);
  int v14 = Height * Width;
  if (!(Height * Width))
  {
LABEL_12:
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CVPixelBufferUnlockBaseAddress(a4, 0);
    return 0;
  }
  if ((unint64_t)a5 <= 3)
  {
    unint64_t v15 = DataSize / 0xC;
    do
    {
      if (a5)
      {
        if (a5 == 3)
        {
          v13.f32[0] = -BaseAddress[v15];
          float v16 = *BaseAddress;
        }
        else if (a5 == 1)
        {
          v13.f32[0] = BaseAddress[v15];
          float v16 = -*BaseAddress;
        }
        else
        {
          v13.f32[0] = -*BaseAddress;
          float v16 = -BaseAddress[v15];
        }
      }
      else
      {
        v13.f32[0] = *BaseAddress;
        float v16 = BaseAddress[v15];
      }
      v13.f32[1] = v16;
      v13.f32[2] = BaseAddress[2 * (DataSize / 0xC)];
      int32x4_t v17 = (int32x4_t)vmulq_f32(v13, v13);
      v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
      float32x2_t v18 = vrsqrte_f32((float32x2_t)v17.u32[0]);
      float32x2_t v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v18, v18)));
      float32x4_t v13 = vmulq_n_f32(v13, vmul_f32(v19, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v19, v19))).f32[0]);
      v13.i32[3] = 1.0;
      *v11++ = v13;
      ++BaseAddress;
      --v14;
    }
    while (v14);
    goto LABEL_12;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v21 = 134217984;
    int64_t v22 = a5;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Rotating normals is not implemented for %ld.", (uint8_t *)&v21, 0xCu);
  }
  return -22952;
}

+ (int64_t)convertToLevelsConfidence:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 confidenceLevelRanges:(id)a5
{
  uint64_t v496 = *MEMORY[0x263EF8340];
  id v7 = a5;
  unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  unint64_t v9 = CVPixelBufferGetPixelFormatType(a4);
  if (v7)
  {
    unint64_t v10 = v9;
    [v7 highLevel];
    int32x2_t v487 = v11;
    [v7 lowLevel];
    int32x2_t v486 = v12;
    uint64_t v13 = [v7 confidenceUnits];
    if ((int)PixelFormatType > 1717856626)
    {
      if (PixelFormatType != 1717856627)
      {
        if (PixelFormatType != 1751410032 && PixelFormatType != 1751411059) {
          goto LABEL_100;
        }
LABEL_13:
        if ((int)v10 > 1717856626)
        {
          if (v10 == 1717856627)
          {
LABEL_64:
            if (a3 != a4) {
              CVPixelBufferLockBaseAddress(a3, 1uLL);
            }
            CVPixelBufferLockBaseAddress(a4, 0);
            size_t Width = CVPixelBufferGetWidth(a3);
            size_t Height = CVPixelBufferGetHeight(a3);
            size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
            size_t v53 = CVPixelBufferGetBytesPerRow(a4);
            BaseAddress = (short float *)CVPixelBufferGetBaseAddress(a3);
            float v55 = (float *)CVPixelBufferGetBaseAddress(a4);
            if (Height && Width)
            {
              _D0 = (int16x4_t)v486;
              _D1 = (int16x4_t)v487;
              __asm
              {
                FCVT            H0, S0
                FCVT            H1, S1
              }
              unint64_t v58 = Width & 0xFFFFFFFFFFFFFFF0;
              unint64_t v59 = 4 * (Width & 0xFFFFFFFFFFFFFFF0);
              unint64_t v60 = 2 * (Width & 0xFFFFFFFFFFFFFFF0);
              float16x8_t v61 = (float16x8_t)vdupq_lane_s16(_D0, 0);
              float16x8_t v62 = (float16x8_t)vdupq_lane_s16(_D1, 0);
              if (v13)
              {
                if (Width > 0xF)
                {
                  if (!Width || (unint64_t v234 = (Width - 1) >> 32) != 0)
                  {
                    uint64_t v389 = 0;
                    do
                    {
                      uint64_t v390 = 0;
                      do
                      {
                        short float v391 = BaseAddress[v390];
                        if (v391 <= *(short float *)_D1.i16) {
                          float v392 = 2.0;
                        }
                        else {
                          float v392 = 1.0;
                        }
                        if (v391 <= *(short float *)_D0.i16) {
                          float v393 = v392;
                        }
                        else {
                          float v393 = 0.0;
                        }
                        v55[v390++] = v393;
                      }
                      while (Width > v390);
                      ++v389;
                      float v55 = (float *)((char *)v55 + v53);
                      BaseAddress = (short float *)((char *)BaseAddress + BytesPerRow);
                    }
                    while (Height > v389);
                  }
                  else
                  {
                    CGRect v235 = (float16x8_t *)(BaseAddress + 8);
                    CGRect v236 = (int8x16_t *)(v55 + 8);
                    v237.i64[0] = 0x4000000040000000;
                    v237.i64[1] = 0x4000000040000000;
                    __asm { FMOV            V5.4S, #1.0 }
                    do
                    {
                      CGRect v239 = (float *)((char *)v55 + v234 * v53 + v59);
                      CGRect v240 = v236;
                      CGRect v241 = v235;
                      unint64_t v242 = Width & 0xFFFFFFFFFFFFFFF0;
                      do
                      {
                        float16x8_t v243 = v241[-1];
                        int16x8_t v244 = vcgtq_f16(v243, v61);
                        int16x8_t v245 = vcgtq_f16(*v241, v61);
                        int16x8_t v246 = vcgtq_f16(v243, v62);
                        int16x8_t v247 = vcgtq_f16(*v241, v62);
                        v240[-2] = vbicq_s8(vbslq_s8((int8x16_t)vmovl_s16(*(int16x4_t *)v246.i8), _Q5, v237), (int8x16_t)vmovl_s16(*(int16x4_t *)v244.i8));
                        v240[-1] = vbicq_s8(vbslq_s8((int8x16_t)vmovl_high_s16(v246), _Q5, v237), (int8x16_t)vmovl_high_s16(v244));
                        *CGRect v240 = vbicq_s8(vbslq_s8((int8x16_t)vmovl_s16(*(int16x4_t *)v247.i8), _Q5, v237), (int8x16_t)vmovl_s16(*(int16x4_t *)v245.i8));
                        v240[1] = vbicq_s8(vbslq_s8((int8x16_t)vmovl_high_s16(v247), _Q5, v237), (int8x16_t)vmovl_high_s16(v245));
                        v240 += 4;
                        v241 += 2;
                        v242 -= 16;
                      }
                      while (v242);
                      if (Width != v58)
                      {
                        float v248 = (short float *)((char *)BaseAddress + v234 * BytesPerRow + v60);
                        unsigned int v249 = v58 + 1;
                        do
                        {
                          short float v250 = *v248++;
                          short float v251 = v250;
                          if (v250 <= *(short float *)_D1.i16) {
                            float v252 = 2.0;
                          }
                          else {
                            float v252 = 1.0;
                          }
                          if (v251 <= *(short float *)_D0.i16) {
                            float v253 = v252;
                          }
                          else {
                            float v253 = 0.0;
                          }
                          *v239++ = v253;
                          BOOL v152 = Width > v249++;
                        }
                        while (v152);
                      }
                      ++v234;
                      CGRect v235 = (float16x8_t *)((char *)v235 + BytesPerRow);
                      CGRect v236 = (int8x16_t *)((char *)v236 + v53);
                    }
                    while (Height > v234);
                  }
                }
                else
                {
                  uint64_t v63 = 0;
                  do
                  {
                    uint64_t v64 = 0;
                    do
                    {
                      short float v65 = BaseAddress[v64];
                      if (v65 <= *(short float *)_D1.i16) {
                        float v66 = 2.0;
                      }
                      else {
                        float v66 = 1.0;
                      }
                      if (v65 <= *(short float *)_D0.i16) {
                        float v67 = v66;
                      }
                      else {
                        float v67 = 0.0;
                      }
                      v55[v64++] = v67;
                    }
                    while (v64 < Width);
                    ++v63;
                    float v55 = (float *)((char *)v55 + v53);
                    BaseAddress = (short float *)((char *)BaseAddress + BytesPerRow);
                  }
                  while (Height > v63);
                }
              }
              else if (Width > 0xF)
              {
                if (!Width || (unint64_t v294 = (Width - 1) >> 32) != 0)
                {
                  uint64_t v464 = 0;
                  do
                  {
                    uint64_t v465 = 0;
                    do
                    {
                      short float v466 = BaseAddress[v465];
                      if (v466 >= *(short float *)_D1.i16) {
                        float v467 = 2.0;
                      }
                      else {
                        float v467 = 1.0;
                      }
                      if (v466 >= *(short float *)_D0.i16) {
                        float v468 = v467;
                      }
                      else {
                        float v468 = 0.0;
                      }
                      v55[v465++] = v468;
                    }
                    while (Width > v465);
                    ++v464;
                    float v55 = (float *)((char *)v55 + v53);
                    BaseAddress = (short float *)((char *)BaseAddress + BytesPerRow);
                  }
                  while (Height > v464);
                }
                else
                {
                  v295 = (float16x8_t *)(BaseAddress + 8);
                  v296 = (int8x16_t *)(v55 + 8);
                  v297.i64[0] = 0x4000000040000000;
                  v297.i64[1] = 0x4000000040000000;
                  __asm { FMOV            V5.4S, #1.0 }
                  do
                  {
                    v299 = (float *)((char *)v55 + v294 * v53 + v59);
                    unint64_t v300 = v296;
                    v301 = v295;
                    unint64_t v302 = Width & 0xFFFFFFFFFFFFFFF0;
                    do
                    {
                      float16x8_t v303 = v301[-1];
                      int16x8_t v304 = vcgtq_f16(v61, v303);
                      int16x8_t v305 = vcgtq_f16(v61, *v301);
                      int16x8_t v306 = vcgtq_f16(v62, v303);
                      int16x8_t v307 = vcgtq_f16(v62, *v301);
                      v300[-2] = vbicq_s8(vbslq_s8((int8x16_t)vmovl_s16(*(int16x4_t *)v306.i8), _Q5, v297), (int8x16_t)vmovl_s16(*(int16x4_t *)v304.i8));
                      v300[-1] = vbicq_s8(vbslq_s8((int8x16_t)vmovl_high_s16(v306), _Q5, v297), (int8x16_t)vmovl_high_s16(v304));
                      *unint64_t v300 = vbicq_s8(vbslq_s8((int8x16_t)vmovl_s16(*(int16x4_t *)v307.i8), _Q5, v297), (int8x16_t)vmovl_s16(*(int16x4_t *)v305.i8));
                      v300[1] = vbicq_s8(vbslq_s8((int8x16_t)vmovl_high_s16(v307), _Q5, v297), (int8x16_t)vmovl_high_s16(v305));
                      v300 += 4;
                      v301 += 2;
                      v302 -= 16;
                    }
                    while (v302);
                    if (Width != v58)
                    {
                      float32x4_t v308 = (short float *)((char *)BaseAddress + v294 * BytesPerRow + v60);
                      unsigned int v309 = v58 + 1;
                      do
                      {
                        short float v310 = *v308++;
                        short float v311 = v310;
                        if (v310 >= *(short float *)_D1.i16) {
                          float v312 = 2.0;
                        }
                        else {
                          float v312 = 1.0;
                        }
                        if (v311 >= *(short float *)_D0.i16) {
                          float v313 = v312;
                        }
                        else {
                          float v313 = 0.0;
                        }
                        *v299++ = v313;
                        BOOL v152 = Width > v309++;
                      }
                      while (v152);
                    }
                    ++v294;
                    v295 = (float16x8_t *)((char *)v295 + BytesPerRow);
                    v296 = (int8x16_t *)((char *)v296 + v53);
                  }
                  while (Height > v294);
                }
              }
              else
              {
                uint64_t v189 = 0;
                do
                {
                  uint64_t v190 = 0;
                  do
                  {
                    short float v191 = BaseAddress[v190];
                    if (v191 >= *(short float *)_D1.i16) {
                      float v192 = 2.0;
                    }
                    else {
                      float v192 = 1.0;
                    }
                    if (v191 >= *(short float *)_D0.i16) {
                      float v193 = v192;
                    }
                    else {
                      float v193 = 0.0;
                    }
                    v55[v190++] = v193;
                  }
                  while (v190 < Width);
                  ++v189;
                  float v55 = (float *)((char *)v55 + v53);
                  BaseAddress = (short float *)((char *)BaseAddress + BytesPerRow);
                }
                while (Height > v189);
              }
            }
            goto LABEL_592;
          }
          if (v10 != 1751411059 && v10 != 1751410032) {
            goto LABEL_100;
          }
          goto LABEL_26;
        }
        if (v10 != 1278226488)
        {
          if (v10 != 1278226536)
          {
            if (v10 != 1717855600) {
              goto LABEL_100;
            }
            goto LABEL_64;
          }
LABEL_26:
          if (a3 != a4) {
            CVPixelBufferLockBaseAddress(a3, 1uLL);
          }
          CVPixelBufferLockBaseAddress(a4, 0);
          size_t v15 = CVPixelBufferGetWidth(a3);
          size_t v16 = CVPixelBufferGetHeight(a3);
          size_t v17 = CVPixelBufferGetBytesPerRow(a3);
          size_t v18 = CVPixelBufferGetBytesPerRow(a4);
          float32x2_t v19 = (short float *)CVPixelBufferGetBaseAddress(a3);
          unint64_t v20 = (short float *)CVPixelBufferGetBaseAddress(a4);
          if (!v16 || !v15) {
            goto LABEL_592;
          }
          _D0 = (int16x4_t)v486;
          _D1 = (int16x4_t)v487;
          __asm
          {
            FCVT            H0, S0
            FCVT            H1, S1
          }
          unint64_t v26 = v15 & 0xFFFFFFFFFFFFFFF0;
          unint64_t v27 = 2 * (v15 & 0xFFFFFFFFFFFFFFF0);
          float16x8_t v28 = (float16x8_t)vdupq_lane_s16(_D0, 0);
          float16x8_t v29 = (float16x8_t)vdupq_lane_s16(_D1, 0);
          if (v13)
          {
            if (v15 <= 0xF)
            {
              uint64_t v30 = 0;
              do
              {
                uint64_t v31 = 0;
                do
                {
                  short float v32 = v19[v31];
                  if (v32 <= *(short float *)_D1.i16) {
                    LOWORD(v33) = COERCE_UNSIGNED_INT(2.0);
                  }
                  else {
                    LOWORD(v33) = COERCE_UNSIGNED_INT(1.0);
                  }
                  if (v32 <= *(short float *)_D0.i16) {
                    short float v34 = v33;
                  }
                  else {
                    short float v34 = COERCE_SHORT_FLOAT(0);
                  }
                  v20[v31++] = v34;
                }
                while (v31 < v15);
                ++v30;
                unint64_t v20 = (short float *)((char *)v20 + v18);
                float32x2_t v19 = (short float *)((char *)v19 + v17);
              }
              while (v16 > v30);
              goto LABEL_592;
            }
            if (!v15 || (unint64_t v172 = (v15 - 1) >> 32) != 0)
            {
              uint64_t v281 = 0;
              do
              {
                uint64_t v282 = 0;
                do
                {
                  short float v283 = v19[v282];
                  if (v283 <= *(short float *)_D1.i16) {
                    LOWORD(v284) = COERCE_UNSIGNED_INT(2.0);
                  }
                  else {
                    LOWORD(v284) = COERCE_UNSIGNED_INT(1.0);
                  }
                  if (v283 <= *(short float *)_D0.i16) {
                    short float v285 = v284;
                  }
                  else {
                    short float v285 = COERCE_SHORT_FLOAT(0);
                  }
                  v20[v282++] = v285;
                }
                while (v15 > v282);
                ++v281;
                unint64_t v20 = (short float *)((char *)v20 + v18);
                float32x2_t v19 = (short float *)((char *)v19 + v17);
              }
              while (v16 > v281);
              goto LABEL_592;
            }
            v173 = (float16x8_t *)(v19 + 8);
            unsigned int v174 = (int8x16_t *)(v20 + 8);
            v175.i64[0] = 0x4000400040004000;
            v175.i64[1] = 0x4000400040004000;
            v176.i64[0] = 0x3C003C003C003C00;
            v176.i64[1] = 0x3C003C003C003C00;
            while (1)
            {
              v177 = (short float *)((char *)v20 + v18 * v172);
              float v178 = (short float *)((char *)v19 + v17 * v172);
              if ((unint64_t)((char *)v177 - (char *)v178) < 0x20) {
                break;
              }
              v177 = (short float *)((char *)v177 + v27);
              float v180 = v174;
              v181 = v173;
              unint64_t v182 = v15 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                int8x16_t v183 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f16(*v181, v29), v176, v175), (int8x16_t)vcgtq_f16(*v181, v28));
                v180[-1] = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f16(v181[-1], v29), v176, v175), (int8x16_t)vcgtq_f16(v181[-1], v28));
                *float v180 = v183;
                v181 += 2;
                v180 += 2;
                v182 -= 16;
              }
              while (v182);
              if (v15 != v26)
              {
                float v178 = (short float *)((char *)v178 + v27);
                int v179 = v15 & 0xFFFFFFF0;
LABEL_215:
                unsigned int v184 = v179 + 1;
                do
                {
                  short float v185 = *v178++;
                  short float v186 = v185;
                  if (v185 <= *(short float *)_D1.i16) {
                    LOWORD(v187) = COERCE_UNSIGNED_INT(2.0);
                  }
                  else {
                    LOWORD(v187) = COERCE_UNSIGNED_INT(1.0);
                  }
                  if (v186 <= *(short float *)_D0.i16) {
                    short float v188 = v187;
                  }
                  else {
                    short float v188 = COERCE_SHORT_FLOAT(0);
                  }
                  *v177++ = v188;
                  BOOL v152 = v15 > v184++;
                }
                while (v152);
              }
              ++v172;
              v173 = (float16x8_t *)((char *)v173 + v17);
              unsigned int v174 = (int8x16_t *)((char *)v174 + v18);
              if (v16 <= v172) {
                goto LABEL_592;
              }
            }
            int v179 = 0;
            goto LABEL_215;
          }
          if (v15 <= 0xF)
          {
            uint64_t v130 = 0;
            do
            {
              uint64_t v131 = 0;
              do
              {
                short float v132 = v19[v131];
                if (v132 >= *(short float *)_D1.i16) {
                  LOWORD(v133) = COERCE_UNSIGNED_INT(2.0);
                }
                else {
                  LOWORD(v133) = COERCE_UNSIGNED_INT(1.0);
                }
                if (v132 >= *(short float *)_D0.i16) {
                  short float v134 = v133;
                }
                else {
                  short float v134 = COERCE_SHORT_FLOAT(0);
                }
                v20[v131++] = v134;
              }
              while (v131 < v15);
              ++v130;
              unint64_t v20 = (short float *)((char *)v20 + v18);
              float32x2_t v19 = (short float *)((char *)v19 + v17);
            }
            while (v16 > v130);
            goto LABEL_592;
          }
          if (!v15 || (unint64_t v254 = (v15 - 1) >> 32) != 0)
          {
            uint64_t v394 = 0;
            do
            {
              uint64_t v395 = 0;
              do
              {
                short float v396 = v19[v395];
                if (v396 >= *(short float *)_D1.i16) {
                  LOWORD(v397) = COERCE_UNSIGNED_INT(2.0);
                }
                else {
                  LOWORD(v397) = COERCE_UNSIGNED_INT(1.0);
                }
                if (v396 >= *(short float *)_D0.i16) {
                  short float v398 = v397;
                }
                else {
                  short float v398 = COERCE_SHORT_FLOAT(0);
                }
                v20[v395++] = v398;
              }
              while (v15 > v395);
              ++v394;
              unint64_t v20 = (short float *)((char *)v20 + v18);
              float32x2_t v19 = (short float *)((char *)v19 + v17);
            }
            while (v16 > v394);
            goto LABEL_592;
          }
          float32x4_t v255 = (float16x8_t *)(v19 + 8);
          int8x16_t v256 = (int8x16_t *)(v20 + 8);
          v257.i64[0] = 0x4000400040004000;
          v257.i64[1] = 0x4000400040004000;
          v258.i64[0] = 0x3C003C003C003C00;
          v258.i64[1] = 0x3C003C003C003C00;
          while (1)
          {
            v259 = (short float *)((char *)v20 + v18 * v254);
            v260 = (short float *)((char *)v19 + v17 * v254);
            if ((unint64_t)((char *)v259 - (char *)v260) < 0x20) {
              break;
            }
            v259 = (short float *)((char *)v259 + v27);
            v262 = v256;
            v263 = v255;
            unint64_t v264 = v15 & 0xFFFFFFFFFFFFFFF0;
            do
            {
              int8x16_t v265 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f16(v29, *v263), v258, v257), (int8x16_t)vcgtq_f16(v28, *v263));
              v262[-1] = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f16(v29, v263[-1]), v258, v257), (int8x16_t)vcgtq_f16(v28, v263[-1]));
              int8x16_t *v262 = v265;
              v263 += 2;
              v262 += 2;
              v264 -= 16;
            }
            while (v264);
            if (v15 != v26)
            {
              v260 = (short float *)((char *)v260 + v27);
              int v261 = v15 & 0xFFFFFFF0;
LABEL_306:
              unsigned int v266 = v261 + 1;
              do
              {
                short float v267 = *v260++;
                short float v268 = v267;
                if (v267 >= *(short float *)_D1.i16) {
                  LOWORD(v269) = COERCE_UNSIGNED_INT(2.0);
                }
                else {
                  LOWORD(v269) = COERCE_UNSIGNED_INT(1.0);
                }
                if (v268 >= *(short float *)_D0.i16) {
                  short float v270 = v269;
                }
                else {
                  short float v270 = COERCE_SHORT_FLOAT(0);
                }
                *v259++ = v270;
                BOOL v152 = v15 > v266++;
              }
              while (v152);
            }
            ++v254;
            float32x4_t v255 = (float16x8_t *)((char *)v255 + v17);
            int8x16_t v256 = (int8x16_t *)((char *)v256 + v18);
            if (v16 <= v254) {
              goto LABEL_592;
            }
          }
          int v261 = 0;
          goto LABEL_306;
        }
        if (a3 != a4) {
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        }
        CVPixelBufferLockBaseAddress(a4, 0);
        size_t v84 = CVPixelBufferGetWidth(a3);
        size_t v85 = CVPixelBufferGetHeight(a3);
        size_t v86 = CVPixelBufferGetBytesPerRow(a3);
        size_t v87 = CVPixelBufferGetBytesPerRow(a4);
        float v88 = (short float *)CVPixelBufferGetBaseAddress(a3);
        CGRect v89 = (int8x16_t *)CVPixelBufferGetBaseAddress(a4);
        if (!v85 || !v84) {
          goto LABEL_592;
        }
        _D0 = (int16x4_t)v486;
        _D1 = (int16x4_t)v487;
        __asm
        {
          FCVT            H0, S0
          FCVT            H1, S1
        }
        uint64_t v92 = v84;
        unint64_t v93 = v84 & 0xFFFFFFFFFFFFFFE0;
        float16x8_t v94 = (float16x8_t)vdupq_lane_s16(_D0, 0);
        float16x8_t v95 = (float16x8_t)vdupq_lane_s16(_D1, 0);
        unint64_t v96 = 2 * (v84 & 0xFFFFFFFFFFFFFFE0);
        unint64_t v97 = v84 & 0xFFFFFFFFFFFFFFF8;
        unint64_t v98 = 2 * (v84 & 0xFFFFFFFFFFFFFFF8);
        if (v13)
        {
          if (v84 <= 7)
          {
            uint64_t v99 = 0;
            do
            {
              uint64_t v100 = 0;
              do
              {
                short float v101 = v88[v100];
                if (v101 > *(short float *)_D1.i16) {
                  char v102 = 1;
                }
                else {
                  char v102 = 2;
                }
                if (v101 > *(short float *)_D0.i16) {
                  char v102 = 0;
                }
                v89->i8[v100++] = v102;
              }
              while (v100 < v84);
              ++v99;
              CGRect v89 = (int8x16_t *)((char *)v89 + v87);
              float v88 = (short float *)((char *)v88 + v86);
            }
            while (v85 > v99);
            goto LABEL_592;
          }
          if (!v84 || (unint64_t v359 = (v84 - 1) >> 32) != 0)
          {
            uint64_t v473 = 0;
            do
            {
              uint64_t v474 = 0;
              do
              {
                short float v475 = v88[v474];
                if (v475 > *(short float *)_D1.i16) {
                  char v476 = 1;
                }
                else {
                  char v476 = 2;
                }
                if (v475 > *(short float *)_D0.i16) {
                  char v476 = 0;
                }
                v89->i8[v474++] = v476;
              }
              while (v84 > v474);
              ++v473;
              CGRect v89 = (int8x16_t *)((char *)v89 + v87);
              float v88 = (short float *)((char *)v88 + v86);
            }
            while (v85 > v473);
            goto LABEL_592;
          }
          v360 = (float16x8_t *)(v88 + 16);
          v361 = v89 + 1;
          v362.i64[0] = 0x202020202020202;
          v362.i64[1] = 0x202020202020202;
          v363 = v89;
          v364 = v88;
          while (1)
          {
            v365 = &v89->i8[v87 * v359];
            v366 = (short float *)((char *)v88 + v86 * v359);
            if (v365 < (char *)&v88[v92] + v86 * v359 && v366 < (short float *)((char *)v89->i16 + v84 + v87 * v359))
            {
              int v369 = 0;
              goto LABEL_456;
            }
            if (v84 >= 0x20)
            {
              v370 = v361;
              v371 = v360;
              unint64_t v372 = v84 & 0xFFFFFFFFFFFFFFE0;
              do
              {
                float16x8_t v373 = v371[-2];
                float16x8_t v374 = v371[-1];
                float16x8_t v375 = *v371;
                float16x8_t v376 = v371[1];
                v371 += 4;
                int8x16_t v377 = vuzp1q_s8((int8x16_t)vcgtq_f16(v373, v94), (int8x16_t)vcgtq_f16(v374, v94));
                int8x16_t v378 = vuzp1q_s8((int8x16_t)vcgtq_f16(v373, v95), (int8x16_t)vcgtq_f16(v374, v95));
                int8x16_t v379 = vuzp1q_s8((int8x16_t)vcgtq_f16(v375, v95), (int8x16_t)vcgtq_f16(v376, v95));
                v370[-1] = vbicq_s8(vsubq_s8(vbicq_s8(v362, v378), v378), v377);
                int8x16_t *v370 = vbicq_s8(vsubq_s8(vbicq_s8(v362, v379), v379), vuzp1q_s8((int8x16_t)vcgtq_f16(v375, v94), (int8x16_t)vcgtq_f16(v376, v94)));
                v370 += 2;
                v372 -= 32;
              }
              while (v372);
              if (v84 == v93) {
                goto LABEL_439;
              }
              unint64_t v368 = v84 & 0xFFFFFFFFFFFFFFE0;
              if ((v84 & 0x18) == 0)
              {
                v366 = (short float *)((char *)v366 + v96);
                v365 += v93;
                int v369 = v84 & 0xFFFFFFE0;
LABEL_456:
                unsigned int v385 = v369 + 1;
                do
                {
                  short float v386 = *v366++;
                  short float v387 = v386;
                  if (v386 > *(short float *)_D1.i16) {
                    char v388 = 1;
                  }
                  else {
                    char v388 = 2;
                  }
                  if (v387 > *(short float *)_D0.i16) {
                    char v388 = 0;
                  }
                  *v365++ = v388;
                  BOOL v152 = v84 > v385++;
                }
                while (v152);
                goto LABEL_439;
              }
            }
            else
            {
              unint64_t v368 = 0;
            }
            v365 += v97;
            unint64_t v380 = v368 - (v84 & 0xFFFFFFFFFFFFFFF8);
            v381 = (int8x8_t *)&v363->i8[v368];
            v382 = (float16x8_t *)&v364[v368];
            do
            {
              float16x8_t v383 = *v382++;
              int8x8_t v384 = vmovn_s16(vcgtq_f16(v383, v95));
              *v381++ = vbic_s8(vsub_s8(vbic_s8((int8x8_t)0x202020202020202, v384), v384), vmovn_s16(vcgtq_f16(v383, v94)));
              v380 += 8;
            }
            while (v380);
            if (v84 != v97)
            {
              v366 = (short float *)((char *)v366 + v98);
              int v369 = v84 & 0xFFFFFFF8;
              goto LABEL_456;
            }
LABEL_439:
            ++v359;
            v360 = (float16x8_t *)((char *)v360 + v86);
            v361 = (int8x16_t *)((char *)v361 + v87);
            v364 = (short float *)((char *)v364 + v86);
            v363 = (int8x16_t *)((char *)v363 + v87);
            if (v85 <= v359) {
              goto LABEL_592;
            }
          }
        }
        if (v84 <= 7)
        {
          uint64_t v290 = 0;
          do
          {
            uint64_t v291 = 0;
            do
            {
              short float v292 = v88[v291];
              if (v292 < *(short float *)_D1.i16) {
                char v293 = 1;
              }
              else {
                char v293 = 2;
              }
              if (v292 < *(short float *)_D0.i16) {
                char v293 = 0;
              }
              v89->i8[v291++] = v293;
            }
            while (v291 < v84);
            ++v290;
            CGRect v89 = (int8x16_t *)((char *)v89 + v87);
            float v88 = (short float *)((char *)v88 + v86);
          }
          while (v85 > v290);
          goto LABEL_592;
        }
        if (!v84 || (unint64_t v434 = (v84 - 1) >> 32) != 0)
        {
          uint64_t v481 = 0;
          do
          {
            uint64_t v482 = 0;
            do
            {
              short float v483 = v88[v482];
              if (v483 < *(short float *)_D1.i16) {
                char v484 = 1;
              }
              else {
                char v484 = 2;
              }
              if (v483 < *(short float *)_D0.i16) {
                char v484 = 0;
              }
              v89->i8[v482++] = v484;
            }
            while (v84 > v482);
            ++v481;
            CGRect v89 = (int8x16_t *)((char *)v89 + v87);
            float v88 = (short float *)((char *)v88 + v86);
          }
          while (v85 > v481);
          goto LABEL_592;
        }
        v435 = (float16x8_t *)(v88 + 16);
        v436 = v89 + 1;
        v437.i64[0] = 0x202020202020202;
        v437.i64[1] = 0x202020202020202;
        v438 = v89;
        v439 = v88;
        while (1)
        {
          v440 = &v89->i8[v87 * v434];
          v441 = (short float *)((char *)v88 + v86 * v434);
          if (v440 < (char *)&v88[v92] + v86 * v434 && v441 < (short float *)((char *)v89->i16 + v84 + v87 * v434))
          {
            int v444 = 0;
            goto LABEL_534;
          }
          if (v84 >= 0x20)
          {
            v445 = v436;
            v446 = v435;
            unint64_t v447 = v84 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              float16x8_t v448 = v446[-2];
              float16x8_t v449 = v446[-1];
              float16x8_t v450 = *v446;
              float16x8_t v451 = v446[1];
              v446 += 4;
              int8x16_t v452 = vuzp1q_s8((int8x16_t)vcgtq_f16(v94, v448), (int8x16_t)vcgtq_f16(v94, v449));
              int8x16_t v453 = vuzp1q_s8((int8x16_t)vcgtq_f16(v95, v448), (int8x16_t)vcgtq_f16(v95, v449));
              int8x16_t v454 = vuzp1q_s8((int8x16_t)vcgtq_f16(v95, v450), (int8x16_t)vcgtq_f16(v95, v451));
              v445[-1] = vbicq_s8(vsubq_s8(vbicq_s8(v437, v453), v453), v452);
              int8x16_t *v445 = vbicq_s8(vsubq_s8(vbicq_s8(v437, v454), v454), vuzp1q_s8((int8x16_t)vcgtq_f16(v94, v450), (int8x16_t)vcgtq_f16(v94, v451)));
              v445 += 2;
              v447 -= 32;
            }
            while (v447);
            if (v84 == v93) {
              goto LABEL_517;
            }
            unint64_t v443 = v84 & 0xFFFFFFFFFFFFFFE0;
            if ((v84 & 0x18) == 0)
            {
              v441 = (short float *)((char *)v441 + v96);
              v440 += v93;
              int v444 = v84 & 0xFFFFFFE0;
LABEL_534:
              unsigned int v460 = v444 + 1;
              do
              {
                short float v461 = *v441++;
                short float v462 = v461;
                if (v461 < *(short float *)_D1.i16) {
                  char v463 = 1;
                }
                else {
                  char v463 = 2;
                }
                if (v462 < *(short float *)_D0.i16) {
                  char v463 = 0;
                }
                *v440++ = v463;
                BOOL v152 = v84 > v460++;
              }
              while (v152);
              goto LABEL_517;
            }
          }
          else
          {
            unint64_t v443 = 0;
          }
          v440 += v97;
          unint64_t v455 = v443 - (v84 & 0xFFFFFFFFFFFFFFF8);
          v456 = (int8x8_t *)&v438->i8[v443];
          v457 = (float16x8_t *)&v439[v443];
          do
          {
            float16x8_t v458 = *v457++;
            int8x8_t v459 = vmovn_s16(vcgtq_f16(v95, v458));
            *v456++ = vbic_s8(vsub_s8(vbic_s8((int8x8_t)0x202020202020202, v459), v459), vmovn_s16(vcgtq_f16(v94, v458)));
            v455 += 8;
          }
          while (v455);
          if (v84 != v97)
          {
            v441 = (short float *)((char *)v441 + v98);
            int v444 = v84 & 0xFFFFFFF8;
            goto LABEL_534;
          }
LABEL_517:
          ++v434;
          v435 = (float16x8_t *)((char *)v435 + v86);
          v436 = (int8x16_t *)((char *)v436 + v87);
          v439 = (short float *)((char *)v439 + v86);
          v438 = (int8x16_t *)((char *)v438 + v87);
          if (v85 <= v434) {
            goto LABEL_592;
          }
        }
      }
    }
    else if (PixelFormatType != 1278226534)
    {
      if (PixelFormatType != 1278226536)
      {
        if (PixelFormatType != 1717855600)
        {
LABEL_100:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            PixelBufferUtils::pixelFormatAsString(PixelFormatType, (char *)buf);
            int v194 = v491;
            uint32_t v195 = *(uint8_t **)buf;
            PixelBufferUtils::pixelFormatAsString(v10, (char *)__p);
            v196 = buf;
            if (v194 < 0) {
              v196 = v195;
            }
            if (v489 >= 0) {
              v197 = __p;
            }
            else {
              v197 = (void **)__p[0];
            }
            *(_DWORD *)v492 = 136446466;
            v493 = v196;
            __int16 v494 = 2082;
            v495 = v197;
            _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unsupported confidence map format (%{public}s, %{public}s)", v492, 0x16u);
            if (v489 < 0) {
              operator delete(__p[0]);
            }
            if (v491 < 0) {
              operator delete(*(void **)buf);
            }
          }
          int64_t v14 = -22956;
          goto LABEL_595;
        }
        goto LABEL_18;
      }
      goto LABEL_13;
    }
LABEL_18:
    if ((int)v10 > 1717855599)
    {
      if ((int)v10 <= 1751410031)
      {
        if (v10 != 1717855600 && v10 != 1717856627) {
          goto LABEL_100;
        }
        goto LABEL_47;
      }
      if (v10 != 1751411059 && v10 != 1751410032) {
        goto LABEL_100;
      }
      goto LABEL_83;
    }
    if (v10 != 1278226488)
    {
      if (v10 == 1278226534)
      {
LABEL_47:
        if (a3 != a4) {
          CVPixelBufferLockBaseAddress(a3, 1uLL);
        }
        CVPixelBufferLockBaseAddress(a4, 0);
        size_t v35 = CVPixelBufferGetWidth(a3);
        size_t v36 = CVPixelBufferGetHeight(a3);
        size_t v37 = CVPixelBufferGetBytesPerRow(a3);
        size_t v38 = CVPixelBufferGetBytesPerRow(a4);
        unint64_t v39 = (float *)CVPixelBufferGetBaseAddress(a3);
        float v40 = (float *)CVPixelBufferGetBaseAddress(a4);
        if (!v36 || !v35) {
          goto LABEL_592;
        }
        unint64_t v41 = v35 & 0xFFFFFFFFFFFFFFF8;
        unint64_t v42 = 4 * (v35 & 0xFFFFFFFFFFFFFFF8);
        float32x4_t v43 = (float32x4_t)vdupq_lane_s32(v486, 0);
        float32x4_t v44 = (float32x4_t)vdupq_lane_s32(v487, 0);
        if (v13)
        {
          if (v35 <= 7)
          {
            uint64_t v45 = 0;
            do
            {
              uint64_t v46 = 0;
              do
              {
                float v47 = v39[v46];
                if (v47 <= *(float *)v487.i32) {
                  float v48 = 2.0;
                }
                else {
                  float v48 = 1.0;
                }
                if (v47 <= *(float *)v486.i32) {
                  float v49 = v48;
                }
                else {
                  float v49 = 0.0;
                }
                v40[v46++] = v49;
              }
              while (v46 < v35);
              ++v45;
              float v40 = (float *)((char *)v40 + v38);
              unint64_t v39 = (float *)((char *)v39 + v37);
            }
            while (v36 > v45);
LABEL_592:
            if (a3 != a4) {
              CVPixelBufferUnlockBaseAddress(a3, 1uLL);
            }
            CVPixelBufferUnlockBaseAddress(a4, 0);
            int64_t v14 = 0;
            goto LABEL_595;
          }
          if (!v35 || (unint64_t v135 = (v35 - 1) >> 32) != 0)
          {
            uint64_t v271 = 0;
            do
            {
              uint64_t v272 = 0;
              do
              {
                float v273 = v39[v272];
                if (v273 <= *(float *)v487.i32) {
                  float v274 = 2.0;
                }
                else {
                  float v274 = 1.0;
                }
                if (v273 <= *(float *)v486.i32) {
                  float v275 = v274;
                }
                else {
                  float v275 = 0.0;
                }
                v40[v272++] = v275;
              }
              while (v35 > v272);
              ++v271;
              float v40 = (float *)((char *)v40 + v38);
              unint64_t v39 = (float *)((char *)v39 + v37);
            }
            while (v36 > v271);
            goto LABEL_592;
          }
          float v136 = (float32x4_t *)(v39 + 4);
          size_t v137 = (int8x16_t *)(v40 + 4);
          v138.i64[0] = 0x4000000040000000;
          v138.i64[1] = 0x4000000040000000;
          __asm { FMOV            V6.4S, #1.0 }
          while (1)
          {
            float32x4_t v140 = (float *)((char *)v40 + v38 * v135);
            vImage_Buffer v141 = (float *)((char *)v39 + v37 * v135);
            if ((unint64_t)((char *)v140 - (char *)v141) < 0x20) {
              break;
            }
            float32x4_t v140 = (float *)((char *)v140 + v42);
            float v143 = v137;
            float v144 = v136;
            unint64_t v145 = v35 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              int8x16_t v146 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(*v144, v44), _Q6, v138), (int8x16_t)vcgtq_f32(*v144, v43));
              v143[-1] = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v144[-1], v44), _Q6, v138), (int8x16_t)vcgtq_f32(v144[-1], v43));
              *float v143 = v146;
              v144 += 2;
              v143 += 2;
              v145 -= 8;
            }
            while (v145);
            if (v35 != v41)
            {
              vImage_Buffer v141 = (float *)((char *)v141 + v42);
              int v142 = v35 & 0xFFFFFFF8;
LABEL_180:
              unsigned int v147 = v142 + 1;
              do
              {
                float v148 = *v141++;
                float v149 = v148;
                if (v148 <= *(float *)v487.i32) {
                  float v150 = 2.0;
                }
                else {
                  float v150 = 1.0;
                }
                if (v149 <= *(float *)v486.i32) {
                  float v151 = v150;
                }
                else {
                  float v151 = 0.0;
                }
                *v140++ = v151;
                BOOL v152 = v35 > v147++;
              }
              while (v152);
            }
            ++v135;
            float v136 = (float32x4_t *)((char *)v136 + v37);
            size_t v137 = (int8x16_t *)((char *)v137 + v38);
            if (v36 <= v135) {
              goto LABEL_592;
            }
          }
          int v142 = 0;
          goto LABEL_180;
        }
        if (v35 <= 7)
        {
          uint64_t v120 = 0;
          do
          {
            uint64_t v121 = 0;
            do
            {
              float v122 = v39[v121];
              if (v122 >= *(float *)v487.i32) {
                float v123 = 2.0;
              }
              else {
                float v123 = 1.0;
              }
              if (v122 >= *(float *)v486.i32) {
                float v124 = v123;
              }
              else {
                float v124 = 0.0;
              }
              v40[v121++] = v124;
            }
            while (v121 < v35);
            ++v120;
            float v40 = (float *)((char *)v40 + v38);
            unint64_t v39 = (float *)((char *)v39 + v37);
          }
          while (v36 > v120);
          goto LABEL_592;
        }
        if (!v35 || (unint64_t v198 = (v35 - 1) >> 32) != 0)
        {
          uint64_t v349 = 0;
          do
          {
            uint64_t v350 = 0;
            do
            {
              float v351 = v39[v350];
              if (v351 >= *(float *)v487.i32) {
                float v352 = 2.0;
              }
              else {
                float v352 = 1.0;
              }
              if (v351 >= *(float *)v486.i32) {
                float v353 = v352;
              }
              else {
                float v353 = 0.0;
              }
              v40[v350++] = v353;
            }
            while (v35 > v350);
            ++v349;
            float v40 = (float *)((char *)v40 + v38);
            unint64_t v39 = (float *)((char *)v39 + v37);
          }
          while (v36 > v349);
          goto LABEL_592;
        }
        uint64_t v199 = (float32x4_t *)(v39 + 4);
        v200 = (int8x16_t *)(v40 + 4);
        v201.i64[0] = 0x4000000040000000;
        v201.i64[1] = 0x4000000040000000;
        __asm { FMOV            V6.4S, #1.0 }
        while (1)
        {
          unint64_t v203 = (float *)((char *)v40 + v38 * v198);
          float v204 = (float *)((char *)v39 + v37 * v198);
          if ((unint64_t)((char *)v203 - (char *)v204) < 0x20) {
            break;
          }
          unint64_t v203 = (float *)((char *)v203 + v42);
          float v206 = v200;
          int v207 = v199;
          unint64_t v208 = v35 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            int8x16_t v209 = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v44, *v207), _Q6, v201), (int8x16_t)vcgtq_f32(v43, *v207));
            v206[-1] = vbicq_s8(vbslq_s8((int8x16_t)vcgtq_f32(v44, v207[-1]), _Q6, v201), (int8x16_t)vcgtq_f32(v43, v207[-1]));
            int8x16_t *v206 = v209;
            v207 += 2;
            v206 += 2;
            v208 -= 8;
          }
          while (v208);
          if (v35 != v41)
          {
            float v204 = (float *)((char *)v204 + v42);
            int v205 = v35 & 0xFFFFFFF8;
LABEL_255:
            unsigned int v210 = v205 + 1;
            do
            {
              float v211 = *v204++;
              float v212 = v211;
              if (v211 >= *(float *)v487.i32) {
                float v213 = 2.0;
              }
              else {
                float v213 = 1.0;
              }
              if (v212 >= *(float *)v486.i32) {
                float v214 = v213;
              }
              else {
                float v214 = 0.0;
              }
              *v203++ = v214;
              BOOL v152 = v35 > v210++;
            }
            while (v152);
          }
          ++v198;
          uint64_t v199 = (float32x4_t *)((char *)v199 + v37);
          v200 = (int8x16_t *)((char *)v200 + v38);
          if (v36 <= v198) {
            goto LABEL_592;
          }
        }
        int v205 = 0;
        goto LABEL_255;
      }
      if (v10 != 1278226536) {
        goto LABEL_100;
      }
LABEL_83:
      if (a3 != a4) {
        CVPixelBufferLockBaseAddress(a3, 1uLL);
      }
      CVPixelBufferLockBaseAddress(a4, 0);
      size_t v68 = CVPixelBufferGetWidth(a3);
      size_t v69 = CVPixelBufferGetHeight(a3);
      size_t v70 = CVPixelBufferGetBytesPerRow(a3);
      size_t v71 = CVPixelBufferGetBytesPerRow(a4);
      char v72 = (float *)CVPixelBufferGetBaseAddress(a3);
      float v73 = (short float *)CVPixelBufferGetBaseAddress(a4);
      if (v69 && v68)
      {
        unint64_t v74 = v68 & 0xFFFFFFFFFFFFFFF0;
        unint64_t v75 = 2 * (v68 & 0xFFFFFFFFFFFFFFF0);
        unint64_t v76 = 4 * (v68 & 0xFFFFFFFFFFFFFFF0);
        float32x4_t v77 = (float32x4_t)vdupq_lane_s32(v486, 0);
        float32x4_t v78 = (float32x4_t)vdupq_lane_s32(v487, 0);
        if (v13)
        {
          if (v68 > 0xF)
          {
            if (!v68 || (unint64_t v153 = (v68 - 1) >> 32) != 0)
            {
              uint64_t v276 = 0;
              do
              {
                uint64_t v277 = 0;
                do
                {
                  float v278 = v72[v277];
                  if (v278 <= *(float *)v487.i32) {
                    LOWORD(v279) = COERCE_UNSIGNED_INT(2.0);
                  }
                  else {
                    LOWORD(v279) = COERCE_UNSIGNED_INT(1.0);
                  }
                  if (v278 <= *(float *)v486.i32) {
                    short float v280 = v279;
                  }
                  else {
                    short float v280 = COERCE_SHORT_FLOAT(0);
                  }
                  v73[v277++] = v280;
                }
                while (v68 > v277);
                ++v276;
                float v73 = (short float *)((char *)v73 + v71);
                char v72 = (float *)((char *)v72 + v70);
              }
              while (v69 > v276);
            }
            else
            {
              int v154 = (float32x4_t *)(v72 + 8);
              float v155 = (int8x16_t *)(v73 + 8);
              v156.i64[0] = 0x4000400040004000;
              v156.i64[1] = 0x4000400040004000;
              v157.i64[0] = 0x3C003C003C003C00;
              v157.i64[1] = 0x3C003C003C003C00;
              do
              {
                uint64_t v158 = (short float *)((char *)v73 + v153 * v71 + v75);
                int v159 = v155;
                int v160 = v154;
                unint64_t v161 = v68 & 0xFFFFFFFFFFFFFFF0;
                do
                {
                  float32x4_t v162 = v160[-2];
                  float32x4_t v163 = v160[-1];
                  float32x4_t v164 = *v160;
                  float32x4_t v165 = v160[1];
                  v160 += 4;
                  v159[-1] = vbicq_s8(vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v162, v78), (int16x8_t)vcgtq_f32(v163, v78)), v157, v156), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v162, v77), (int16x8_t)vcgtq_f32(v163, v77)));
                  int8x16_t *v159 = vbicq_s8(vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v164, v78), (int16x8_t)vcgtq_f32(v165, v78)), v157, v156), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v164, v77), (int16x8_t)vcgtq_f32(v165, v77)));
                  v159 += 2;
                  v161 -= 16;
                }
                while (v161);
                if (v68 != v74)
                {
                  v166 = (float *)((char *)v72 + v153 * v70 + v76);
                  unsigned int v167 = v74 + 1;
                  do
                  {
                    float v168 = *v166++;
                    float v169 = v168;
                    if (v168 <= *(float *)v487.i32) {
                      LOWORD(v170) = COERCE_UNSIGNED_INT(2.0);
                    }
                    else {
                      LOWORD(v170) = COERCE_UNSIGNED_INT(1.0);
                    }
                    if (v169 <= *(float *)v486.i32) {
                      short float v171 = v170;
                    }
                    else {
                      short float v171 = COERCE_SHORT_FLOAT(0);
                    }
                    *v158++ = v171;
                    BOOL v152 = v68 > v167++;
                  }
                  while (v152);
                }
                ++v153;
                int v154 = (float32x4_t *)((char *)v154 + v70);
                float v155 = (int8x16_t *)((char *)v155 + v71);
              }
              while (v69 > v153);
            }
          }
          else
          {
            uint64_t v79 = 0;
            do
            {
              uint64_t v80 = 0;
              do
              {
                float v81 = v72[v80];
                if (v81 <= *(float *)v487.i32) {
                  LOWORD(v82) = COERCE_UNSIGNED_INT(2.0);
                }
                else {
                  LOWORD(v82) = COERCE_UNSIGNED_INT(1.0);
                }
                if (v81 <= *(float *)v486.i32) {
                  short float v83 = v82;
                }
                else {
                  short float v83 = COERCE_SHORT_FLOAT(0);
                }
                v73[v80++] = v83;
              }
              while (v80 < v68);
              ++v79;
              float v73 = (short float *)((char *)v73 + v71);
              char v72 = (float *)((char *)v72 + v70);
            }
            while (v69 > v79);
          }
        }
        else if (v68 > 0xF)
        {
          if (!v68 || (unint64_t v215 = (v68 - 1) >> 32) != 0)
          {
            uint64_t v354 = 0;
            do
            {
              uint64_t v355 = 0;
              do
              {
                float v356 = v72[v355];
                if (v356 >= *(float *)v487.i32) {
                  LOWORD(v357) = COERCE_UNSIGNED_INT(2.0);
                }
                else {
                  LOWORD(v357) = COERCE_UNSIGNED_INT(1.0);
                }
                if (v356 >= *(float *)v486.i32) {
                  short float v358 = v357;
                }
                else {
                  short float v358 = COERCE_SHORT_FLOAT(0);
                }
                v73[v355++] = v358;
              }
              while (v68 > v355);
              ++v354;
              float v73 = (short float *)((char *)v73 + v71);
              char v72 = (float *)((char *)v72 + v70);
            }
            while (v69 > v354);
          }
          else
          {
            float32x4_t v216 = (float32x4_t *)(v72 + 8);
            float32x4_t v217 = (int8x16_t *)(v73 + 8);
            v218.i64[0] = 0x4000400040004000;
            v218.i64[1] = 0x4000400040004000;
            v219.i64[0] = 0x3C003C003C003C00;
            v219.i64[1] = 0x3C003C003C003C00;
            do
            {
              __int16 v220 = (short float *)((char *)v73 + v215 * v71 + v75);
              float32x4_t v221 = v217;
              double v222 = v216;
              unint64_t v223 = v68 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                float32x4_t v224 = v222[-2];
                float32x4_t v225 = v222[-1];
                float32x4_t v226 = *v222;
                float32x4_t v227 = v222[1];
                v222 += 4;
                v221[-1] = vbicq_s8(vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v78, v224), (int16x8_t)vcgtq_f32(v78, v225)), v219, v218), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v77, v224), (int16x8_t)vcgtq_f32(v77, v225)));
                *float32x4_t v221 = vbicq_s8(vbslq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v78, v226), (int16x8_t)vcgtq_f32(v78, v227)), v219, v218), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v77, v226), (int16x8_t)vcgtq_f32(v77, v227)));
                v221 += 2;
                v223 -= 16;
              }
              while (v223);
              if (v68 != v74)
              {
                CGRect v228 = (float *)((char *)v72 + v215 * v70 + v76);
                unsigned int v229 = v74 + 1;
                do
                {
                  float v230 = *v228++;
                  float v231 = v230;
                  if (v230 >= *(float *)v487.i32) {
                    LOWORD(v232) = COERCE_UNSIGNED_INT(2.0);
                  }
                  else {
                    LOWORD(v232) = COERCE_UNSIGNED_INT(1.0);
                  }
                  if (v231 >= *(float *)v486.i32) {
                    short float v233 = v232;
                  }
                  else {
                    short float v233 = COERCE_SHORT_FLOAT(0);
                  }
                  *v220++ = v233;
                  BOOL v152 = v68 > v229++;
                }
                while (v152);
              }
              ++v215;
              float32x4_t v216 = (float32x4_t *)((char *)v216 + v70);
              float32x4_t v217 = (int8x16_t *)((char *)v217 + v71);
            }
            while (v69 > v215);
          }
        }
        else
        {
          uint64_t v125 = 0;
          do
          {
            uint64_t v126 = 0;
            do
            {
              float v127 = v72[v126];
              if (v127 >= *(float *)v487.i32) {
                LOWORD(v128) = COERCE_UNSIGNED_INT(2.0);
              }
              else {
                LOWORD(v128) = COERCE_UNSIGNED_INT(1.0);
              }
              if (v127 >= *(float *)v486.i32) {
                short float v129 = v128;
              }
              else {
                short float v129 = COERCE_SHORT_FLOAT(0);
              }
              v73[v126++] = v129;
            }
            while (v126 < v68);
            ++v125;
            float v73 = (short float *)((char *)v73 + v71);
            char v72 = (float *)((char *)v72 + v70);
          }
          while (v69 > v125);
        }
      }
      goto LABEL_592;
    }
    if (a3 != a4) {
      CVPixelBufferLockBaseAddress(a3, 1uLL);
    }
    CVPixelBufferLockBaseAddress(a4, 0);
    size_t v103 = CVPixelBufferGetWidth(a3);
    size_t v104 = CVPixelBufferGetHeight(a3);
    size_t v105 = CVPixelBufferGetBytesPerRow(a3);
    size_t v106 = CVPixelBufferGetBytesPerRow(a4);
    int v107 = (float *)CVPixelBufferGetBaseAddress(a3);
    int v108 = (int8x16_t *)CVPixelBufferGetBaseAddress(a4);
    if (!v104 || !v103) {
      goto LABEL_592;
    }
    uint64_t v109 = v103;
    unint64_t v110 = v103 & 0xFFFFFFFFFFFFFFE0;
    float32x4_t v111 = (float32x4_t)vdupq_lane_s32(v486, 0);
    float32x4_t v112 = (float32x4_t)vdupq_lane_s32(v487, 0);
    unint64_t v113 = 4 * (v103 & 0xFFFFFFFFFFFFFFE0);
    unint64_t v114 = v103 & 0xFFFFFFFFFFFFFFF8;
    unint64_t v115 = 4 * (v103 & 0xFFFFFFFFFFFFFFF8);
    if (v13)
    {
      if (v103 <= 7)
      {
        uint64_t v116 = 0;
        do
        {
          uint64_t v117 = 0;
          do
          {
            float v118 = v107[v117];
            if (v118 > *(float *)v487.i32) {
              char v119 = 1;
            }
            else {
              char v119 = 2;
            }
            if (v118 > *(float *)v486.i32) {
              char v119 = 0;
            }
            v108->i8[v117++] = v119;
          }
          while (v117 < v103);
          ++v116;
          int v108 = (int8x16_t *)((char *)v108 + v106);
          int v107 = (float *)((char *)v107 + v105);
        }
        while (v104 > v116);
        goto LABEL_592;
      }
      if (!v103 || (unint64_t v314 = (v103 - 1) >> 32) != 0)
      {
        uint64_t v469 = 0;
        do
        {
          uint64_t v470 = 0;
          do
          {
            float v471 = v107[v470];
            if (v471 > *(float *)v487.i32) {
              char v472 = 1;
            }
            else {
              char v472 = 2;
            }
            if (v471 > *(float *)v486.i32) {
              char v472 = 0;
            }
            v108->i8[v470++] = v472;
          }
          while (v103 > v470);
          ++v469;
          int v108 = (int8x16_t *)((char *)v108 + v106);
          int v107 = (float *)((char *)v107 + v105);
        }
        while (v104 > v469);
        goto LABEL_592;
      }
      v315 = (float32x4_t *)(v107 + 16);
      v316 = v108 + 1;
      v317.i64[0] = 0x202020202020202;
      v317.i64[1] = 0x202020202020202;
      v318 = v108;
      v319 = v107;
      while (1)
      {
        uint64_t v320 = &v108->i8[v106 * v314];
        unint64_t v321 = (float *)((char *)v107 + v105 * v314);
        if (v320 < (char *)&v107[v109] + v105 * v314 && v321 < (float *)((char *)v108->i32 + v103 + v106 * v314))
        {
          int v324 = 0;
          goto LABEL_406;
        }
        if (v103 >= 0x20)
        {
          v325 = v316;
          unint64_t v326 = v315;
          unint64_t v327 = v103 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            float32x4_t v329 = v326[-2];
            float32x4_t v328 = v326[-1];
            float32x4_t v330 = v326[-4];
            float32x4_t v331 = v326[-3];
            float32x4_t v333 = v326[2];
            float32x4_t v332 = v326[3];
            float32x4_t v334 = *v326;
            float32x4_t v335 = v326[1];
            v326 += 8;
            int8x16_t v336 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v330, v111), (int16x8_t)vcgtq_f32(v331, v111)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v329, v111), (int16x8_t)vcgtq_f32(v328, v111)));
            int8x16_t v337 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v330, v112), (int16x8_t)vcgtq_f32(v331, v112)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v329, v112), (int16x8_t)vcgtq_f32(v328, v112)));
            int8x16_t v338 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v334, v112), (int16x8_t)vcgtq_f32(v335, v112)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v333, v112), (int16x8_t)vcgtq_f32(v332, v112)));
            v325[-1] = vbicq_s8(vsubq_s8(vbicq_s8(v317, v337), v337), v336);
            int8x16_t *v325 = vbicq_s8(vsubq_s8(vbicq_s8(v317, v338), v338), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v334, v111), (int16x8_t)vcgtq_f32(v335, v111)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v333, v111), (int16x8_t)vcgtq_f32(v332, v111))));
            v325 += 2;
            v327 -= 32;
          }
          while (v327);
          if (v103 == v110) {
            goto LABEL_389;
          }
          unint64_t v323 = v103 & 0xFFFFFFFFFFFFFFE0;
          if ((v103 & 0x18) == 0)
          {
            unint64_t v321 = (float *)((char *)v321 + v113);
            v320 += v110;
            int v324 = v103 & 0xFFFFFFE0;
LABEL_406:
            unsigned int v345 = v324 + 1;
            do
            {
              float v346 = *v321++;
              float v347 = v346;
              if (v346 > *(float *)v487.i32) {
                char v348 = 1;
              }
              else {
                char v348 = 2;
              }
              if (v347 > *(float *)v486.i32) {
                char v348 = 0;
              }
              *v320++ = v348;
              BOOL v152 = v103 > v345++;
            }
            while (v152);
            goto LABEL_389;
          }
        }
        else
        {
          unint64_t v323 = 0;
        }
        v320 += v114;
        unint64_t v339 = v323 - (v103 & 0xFFFFFFFFFFFFFFF8);
        v340 = (int8x8_t *)&v318->i8[v323];
        int32x2_t v341 = (float32x4_t *)&v319[v323];
        do
        {
          float32x4_t v342 = *v341;
          float32x4_t v343 = v341[1];
          v341 += 2;
          int8x8_t v344 = vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_f32(v342, v111), (int16x8_t)vcgtq_f32(v343, v111)));
          *(int8x8_t *)v342.f32 = vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_f32(v342, v112), (int16x8_t)vcgtq_f32(v343, v112)));
          *v340++ = vbic_s8(vsub_s8(vbic_s8((int8x8_t)0x202020202020202, *(int8x8_t *)v342.f32), *(int8x8_t *)v342.f32), v344);
          v339 += 8;
        }
        while (v339);
        if (v103 != v114)
        {
          unint64_t v321 = (float *)((char *)v321 + v115);
          int v324 = v103 & 0xFFFFFFF8;
          goto LABEL_406;
        }
LABEL_389:
        ++v314;
        v315 = (float32x4_t *)((char *)v315 + v105);
        v316 = (int8x16_t *)((char *)v316 + v106);
        v319 = (float *)((char *)v319 + v105);
        v318 = (int8x16_t *)((char *)v318 + v106);
        if (v104 <= v314) {
          goto LABEL_592;
        }
      }
    }
    if (v103 <= 7)
    {
      uint64_t v286 = 0;
      do
      {
        uint64_t v287 = 0;
        do
        {
          float v288 = v107[v287];
          if (v288 < *(float *)v487.i32) {
            char v289 = 1;
          }
          else {
            char v289 = 2;
          }
          if (v288 < *(float *)v486.i32) {
            char v289 = 0;
          }
          v108->i8[v287++] = v289;
        }
        while (v287 < v103);
        ++v286;
        int v108 = (int8x16_t *)((char *)v108 + v106);
        int v107 = (float *)((char *)v107 + v105);
      }
      while (v104 > v286);
      goto LABEL_592;
    }
    if (!v103 || (unint64_t v399 = (v103 - 1) >> 32) != 0)
    {
      uint64_t v477 = 0;
      do
      {
        uint64_t v478 = 0;
        do
        {
          float v479 = v107[v478];
          if (v479 < *(float *)v487.i32) {
            char v480 = 1;
          }
          else {
            char v480 = 2;
          }
          if (v479 < *(float *)v486.i32) {
            char v480 = 0;
          }
          v108->i8[v478++] = v480;
        }
        while (v103 > v478);
        ++v477;
        int v108 = (int8x16_t *)((char *)v108 + v106);
        int v107 = (float *)((char *)v107 + v105);
      }
      while (v104 > v477);
      goto LABEL_592;
    }
    v400 = (float32x4_t *)(v107 + 16);
    v401 = v108 + 1;
    v402.i64[0] = 0x202020202020202;
    v402.i64[1] = 0x202020202020202;
    v403 = v108;
    v404 = v107;
    while (1)
    {
      v405 = &v108->i8[v106 * v399];
      v406 = (float *)((char *)v107 + v105 * v399);
      if (v405 < (char *)&v107[v109] + v105 * v399 && v406 < (float *)((char *)v108->i32 + v103 + v106 * v399))
      {
        int v409 = 0;
        goto LABEL_506;
      }
      if (v103 >= 0x20)
      {
        v410 = v401;
        v411 = v400;
        unint64_t v412 = v103 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          float32x4_t v414 = v411[-2];
          float32x4_t v413 = v411[-1];
          float32x4_t v415 = v411[-4];
          float32x4_t v416 = v411[-3];
          float32x4_t v418 = v411[2];
          float32x4_t v417 = v411[3];
          float32x4_t v419 = *v411;
          float32x4_t v420 = v411[1];
          v411 += 8;
          int8x16_t v421 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v111, v415), (int16x8_t)vcgtq_f32(v111, v416)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v111, v414), (int16x8_t)vcgtq_f32(v111, v413)));
          int8x16_t v422 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v112, v415), (int16x8_t)vcgtq_f32(v112, v416)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v112, v414), (int16x8_t)vcgtq_f32(v112, v413)));
          int8x16_t v423 = vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v112, v419), (int16x8_t)vcgtq_f32(v112, v420)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v112, v418), (int16x8_t)vcgtq_f32(v112, v417)));
          v410[-1] = vbicq_s8(vsubq_s8(vbicq_s8(v402, v422), v422), v421);
          int8x16_t *v410 = vbicq_s8(vsubq_s8(vbicq_s8(v402, v423), v423), vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v111, v419), (int16x8_t)vcgtq_f32(v111, v420)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_f32(v111, v418), (int16x8_t)vcgtq_f32(v111, v417))));
          v410 += 2;
          v412 -= 32;
        }
        while (v412);
        if (v103 == v110) {
          goto LABEL_489;
        }
        unint64_t v408 = v103 & 0xFFFFFFFFFFFFFFE0;
        if ((v103 & 0x18) == 0)
        {
          v406 = (float *)((char *)v406 + v113);
          v405 += v110;
          int v409 = v103 & 0xFFFFFFE0;
LABEL_506:
          unsigned int v430 = v409 + 1;
          do
          {
            float v431 = *v406++;
            float v432 = v431;
            if (v431 < *(float *)v487.i32) {
              char v433 = 1;
            }
            else {
              char v433 = 2;
            }
            if (v432 < *(float *)v486.i32) {
              char v433 = 0;
            }
            *v405++ = v433;
            BOOL v152 = v103 > v430++;
          }
          while (v152);
          goto LABEL_489;
        }
      }
      else
      {
        unint64_t v408 = 0;
      }
      v405 += v114;
      unint64_t v424 = v408 - (v103 & 0xFFFFFFFFFFFFFFF8);
      v425 = (int8x8_t *)&v403->i8[v408];
      v426 = (float32x4_t *)&v404[v408];
      do
      {
        float32x4_t v427 = *v426;
        float32x4_t v428 = v426[1];
        v426 += 2;
        int8x8_t v429 = vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_f32(v111, v427), (int16x8_t)vcgtq_f32(v111, v428)));
        *(int8x8_t *)v427.f32 = vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_f32(v112, v427), (int16x8_t)vcgtq_f32(v112, v428)));
        *v425++ = vbic_s8(vsub_s8(vbic_s8((int8x8_t)0x202020202020202, *(int8x8_t *)v427.f32), *(int8x8_t *)v427.f32), v429);
        v424 += 8;
      }
      while (v424);
      if (v103 != v114)
      {
        v406 = (float *)((char *)v406 + v115);
        int v409 = v103 & 0xFFFFFFF8;
        goto LABEL_506;
      }
LABEL_489:
      ++v399;
      v400 = (float32x4_t *)((char *)v400 + v105);
      v401 = (int8x16_t *)((char *)v401 + v106);
      v404 = (float *)((char *)v404 + v105);
      v403 = (int8x16_t *)((char *)v403 + v106);
      if (v104 <= v399) {
        goto LABEL_592;
      }
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)vImage_Buffer buf = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot create confidence levels: thresholds are not defined.", buf, 2u);
  }
  int64_t v14 = -22953;
LABEL_595:

  return v14;
}

+ (int64_t)scaleConvertRotateImage:(__CVBuffer *)a3 rotateBy:(unsigned __int8)a4 cropBy:(CGRect)a5 scaleInto:(__CVBuffer *)a6 intermediateScalingBuffer:(__CVBuffer *)a7 intermediateRotatingBuffer:(__CVBuffer *)a8 useVT:(BOOL)a9
{
  if (PixelBufferUtils::scaleConvertRotatePixelBuffer(a3, (__CVBuffer *)a4, a6, a5, a7, a8, (__CVBuffer **)a9))return -22966; {
  else
  }
    return 0;
}

+ (int64_t)scaleConvertRotateImage:(__CVBuffer *)a3 rotateBy:(unsigned __int8)a4 cropBy:(CGRect)a5 scaleInto:(__CVBuffer *)a6 intermediateScalingBuffer:(__CVBuffer *)a7 intermediateRotatingBuffer:(__CVBuffer *)a8
{
  return +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", a3, a4, a6, a7, a8, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

+ (BOOL)updatePixelBufferAllocationWithNewSize:(CGSize)a3 pixelFormat:(unsigned int)a4 pixelBuffer:(__CVBuffer *)a5
{
  double height = a3.height;
  double width = a3.width;
  if (*a5)
  {
    if (a3.width == (double)CVPixelBufferGetWidth(*a5)
      && height == (double)CVPixelBufferGetHeight(*a5)
      && CVPixelBufferGetPixelFormatType(*a5) == a4)
    {
      return 0;
    }
    if (*a5) {
      CVPixelBufferRelease(*a5);
    }
  }
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
  CVReturn v12 = CVPixelBufferCreate(v10, (unint64_t)width, (unint64_t)height, a4, BufferAttributes, &pixelBufferOut);
  uint64_t v13 = pixelBufferOut;
  if (v12) {
    uint64_t v13 = 0;
  }
  *a5 = v13;
  return 1;
}

@end