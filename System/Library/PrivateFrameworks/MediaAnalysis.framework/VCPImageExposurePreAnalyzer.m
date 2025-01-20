@interface VCPImageExposurePreAnalyzer
- (float)computeNoiseLevel:(char *)a3 width:(int)a4 height:(int)a5 stride:(int64_t)a6 textureness:(char *)a7;
- (float)computeRegionNoise:(char *)a3 blockTextureness:(char *)a4 average:(char *)a5 width:(int)a6 height:(int)a7 stride:(int64_t)a8;
- (float)exposureScore;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
@end

@implementation VCPImageExposurePreAnalyzer

- (float)computeRegionNoise:(char *)a3 blockTextureness:(char *)a4 average:(char *)a5 width:(int)a6 height:(int)a7 stride:(int64_t)a8
{
  uint64_t v8 = a7 * a6;
  if (a7 < 1)
  {
    uint64_t v12 = 0;
    uint64_t v11 = 0;
    int v10 = 0;
    if (v8)
    {
LABEL_10:
      float v15 = (float)(int)v8;
      float v16 = (float)v11 / (float)(int)v8;
      uint64_t v8 = v12 / v8;
      float v17 = (float)v12 / v15;
      goto LABEL_13;
    }
  }
  else
  {
    int v9 = 0;
    int v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    do
    {
      if (a6 >= 1)
      {
        for (uint64_t i = 0; i != a6; ++i)
        {
          uint64_t v14 = a3[i];
          v12 += v14;
          v11 += (v14 * v14);
          if (a4[i]) {
            ++v10;
          }
        }
      }
      a3 += a8;
      a4 += a6;
      ++v9;
    }
    while (v9 != a7);
    if (v8) {
      goto LABEL_10;
    }
  }
  float v17 = 0.0;
  float v16 = 0.0;
LABEL_13:
  float result = v16 - (float)(v17 * v17);
  *a5 = v8;
  if (v10 > 0) {
    return -1.0;
  }
  return result;
}

- (float)computeNoiseLevel:(char *)a3 width:(int)a4 height:(int)a5 stride:(int64_t)a6 textureness:(char *)a7
{
  int v11 = 0;
  uint64_t v12 = (a4 / 20);
  uint64_t v13 = (a5 / 20);
  int64_t v14 = (int)v13 * a6;
  int v15 = v13 * a4;
  float result = -1.0;
  do
  {
    float v17 = result;
    unsigned __int8 v19 = 0;
    [(VCPImageExposurePreAnalyzer *)self computeRegionNoise:&a3[v14 * ((unsigned __int16)v11 / 0x14u) + (int)(v12 * ((unsigned __int16)v11 % 0x14u))] blockTextureness:&a7[v15 * ((unsigned __int16)v11 / 0x14u) + (int)(v12 * ((unsigned __int16)v11 % 0x14u))] average:&v19 width:v12 height:v13 stride:a6];
    if (result < 0.0 || v19 > 0x1Du)
    {
      float result = v17;
    }
    else if (v17 >= 0.0 && v17 < result)
    {
      float result = v17;
    }
    ++v11;
  }
  while (v11 != 400);
  return result;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  int v73 = 0;
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    CVReturn v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    int v73 = v10;
    if (v10)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_76;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)v84 = pixelBuffer;
      *(_WORD *)&v84[8] = 1024;
      CVReturn v85 = v10;
      _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u);
      CVReturn v10 = v73;
      if (v73) {
        goto LABEL_76;
      }
    }
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    int v15 = Height * Width;
    float v16 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    float v17 = operator new[]((int)Height * (int)Width, MEMORY[0x1E4FBA2D0]);
    if ((int)Height * (int)Width < 0) {
      size_t v18 = -1;
    }
    else {
      size_t v18 = 4 * v15;
    }
    unsigned __int8 v19 = (float *)operator new[](v18, v16);
    v20 = v19;
    v72 = v17;
    if (!v17 || !v19)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v58 = VCPLogInstance();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v84 = Width;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = Height;
          _os_log_impl(&dword_1BBEDA000, v58, OS_LOG_TYPE_ERROR, "Failed to allocate textureness or dst buffer for image resolution %dx%d", buf, 0xEu);
        }
        CVReturn v10 = -108;
        goto LABEL_71;
      }
      CVReturn v10 = -108;
      goto LABEL_72;
    }
    if ((int)Height >= 1)
    {
      uint64_t v21 = 0;
      v22 = BaseAddressOfPlane;
      v23 = v19;
      do
      {
        uint64_t v24 = Width;
        v25 = v22;
        v26 = v23;
        if ((int)Width >= 1)
        {
          do
          {
            unsigned int v27 = *v25++;
            *v26++ = (float)v27 / 255.0;
            --v24;
          }
          while (v24);
        }
        ++v21;
        v23 += (int)Width;
        v22 += BytesPerRowOfPlane;
      }
      while (v21 != Height);
    }
    CVReturn v10 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v73);
    if (!v10)
    {
      CVReturn v10 = [(VCPImageAnalyzer *)self calculateTextureness:v20 height:Height width:Width sdof:0 result:v72];
      if (!v10)
      {
        v28 = v72;
        [(VCPImageExposurePreAnalyzer *)self computeNoiseLevel:BaseAddressOfPlane width:Width height:Height stride:BytesPerRowOfPlane textureness:v72];
        if ((int)Height <= 0)
        {
          int v31 = 0;
          float v32 = 0.0;
          float v48 = 0.0 / (float)v15;
          float v39 = 1.0;
          float v36 = 0.0;
          float v37 = 0.0;
          float v38 = 0.0;
          float v49 = 0.0;
        }
        else
        {
          uint64_t v30 = 0;
          int v31 = 0;
          float v32 = 0.0;
          v33 = v20;
          float v34 = 0.0;
          float v35 = 0.0;
          float v36 = 0.0;
          float v37 = 0.0;
          float v38 = 0.0;
          float v39 = 1.0;
          do
          {
            if ((int)Width >= 1)
            {
              uint64_t v40 = 0;
              float v41 = fabsf((float)((float)(int)v30 / (float)(int)Height) + -0.5);
              do
              {
                float v42 = fmaxf(1.0 - sqrtf(v41 + fabsf((float)((float)(int)v40 / (float)(int)Width) + -0.5)), 0.0);
                float v32 = v32 + v42;
                float v43 = v33[v40];
                if (v43 < 0.98039) {
                  float v44 = 0.0;
                }
                else {
                  float v44 = 1.0;
                }
                float v37 = v37 + (float)(v44 * v42);
                if (v43 > 0.11765) {
                  float v45 = 0.0;
                }
                else {
                  float v45 = 1.0;
                }
                float v35 = v35 + v43;
                float v36 = v36 + (float)(v45 * v42);
                float v46 = v34 + v43;
                if (v43 >= v38) {
                  float v47 = v33[v40];
                }
                else {
                  float v47 = v38;
                }
                if (v39 < v43) {
                  float v43 = v39;
                }
                if (v28[v40])
                {
                  float v39 = v43;
                  float v38 = v47;
                  ++v31;
                  float v34 = v46;
                }
                ++v40;
              }
              while (Width != v40);
            }
            ++v30;
            v33 += (int)Width;
            v28 += (int)Width;
          }
          while (v30 != Height);
          float v48 = v35 / (float)v15;
          float v49 = 0.0;
          if (v31) {
            float v49 = v34 / (float)v31;
          }
          else {
            int v31 = 0;
          }
        }
        float v59 = v37 / v32;
        BOOL v60 = v32 == 0.0;
        if (v32 == 0.0) {
          float v59 = 0.0;
        }
        float v61 = v36 / v32;
        if (v60) {
          float v62 = 0.0;
        }
        else {
          float v62 = v61;
        }
        float v63 = fabsf(v48 + -0.5);
        if (v31 >= 1)
        {
          float v64 = (float)(v39 + -0.3) + (float)(v39 + -0.3);
          if (v64 < (float)(0.7 - v38)) {
            float v64 = 0.7 - v38;
          }
          if (v63 < v64) {
            float v63 = v64;
          }
        }
        float v65 = (float)((float)(v63 * -4.0) * v63) + 1.0;
        if (v59 < 0.15 && (v62 < 0.4 || (float)(vabds_f32(v48, v49) / v48) < 0.1))
        {
          self->_exposureScore = v65;
          *(float *)&double v29 = v65;
LABEL_70:
          self->_exposureScore = roundf(*(float *)&v29 * 100.0) / 100.0;
          v81 = @"ExposureResults";
          v78[0] = @"quality";
          *(float *)&double v29 = v65;
          v58 = [NSNumber numberWithFloat:v29];
          v79[0] = v58;
          v78[1] = @"attributes";
          v76 = @"underExpose";
          *(float *)&double v66 = v62;
          v67 = [NSNumber numberWithFloat:v66];
          v77 = v67;
          v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          v79[1] = v68;
          v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
          v80 = v69;
          v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
          v82 = v70;
          *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];

          CVReturn v10 = 0;
LABEL_71:

          goto LABEL_72;
        }
        if (v59 < 0.15)
        {
          if ((float)((float)((float)(int)Width * 0.5) * (float)(int)Height) <= (float)v31)
          {
            *(float *)&double v29 = fmaxf((float)(fabsf(v49 + -0.5) * -2.0) + 1.0, 0.0);
LABEL_69:
            self->_exposureScore = *(float *)&v29;
            goto LABEL_70;
          }
          if (*(float *)&v29 <= 0.5
            && (float)((float)((float)(int)Width * 0.001) * (float)(int)Height) <= (float)v31
            && *(float *)&v29 >= 0.0)
          {
            *(float *)&double v29 = fmaxf(fmaxf((float)(fabsf((float)((float)(v39 + v38) * 0.5) + -0.5) * -2.0) + 1.0, 0.0)+ (float)(*(float *)&v29 * -0.5), 0.0);
            goto LABEL_69;
          }
        }
        if ((float)((float)((float)(v59 * -2.6) + 1.0) - v62) >= v65) {
          *(float *)&double v29 = v65;
        }
        else {
          *(float *)&double v29 = (float)((float)(v59 * -2.6) + 1.0) - v62;
        }
        goto LABEL_69;
      }
LABEL_72:
      if (v72) {
        MEMORY[0x1C186C790](v72, 0x1000C8077774924);
      }
      if (v20) {
        MEMORY[0x1C186C790](v20, 0x1000C8052888210);
      }
    }
  }
  else
  {
    BOOL v50 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v50) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v50, v51, v52, v53, v54, v55, v56, v57);
    }
    CVReturn v10 = -50;
    int v73 = -50;
  }
LABEL_76:
  if (pixelBuffer
    && !v73
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
  }

  return v10;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)analyzePixelBuffer:flags:results:cancel:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_1BBEDA000, MEMORY[0x1E4F14500], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, v5);
}

@end