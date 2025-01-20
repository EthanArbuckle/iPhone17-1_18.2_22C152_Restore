@interface VCPImageExposureAnalyzer
- (float)computeNoiseLevel:(char *)a3 width:(int)a4 height:(int)a5 stride:(int64_t)a6 textureness:(char *)a7;
- (float)computeRegionNoise:(char *)a3 blockTextureness:(char *)a4 average:(char *)a5 width:(int)a6 height:(int)a7 stride:(int64_t)a8;
- (float)exposureScore;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
@end

@implementation VCPImageExposureAnalyzer

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
    [(VCPImageExposureAnalyzer *)self computeRegionNoise:&a3[v14 * ((unsigned __int16)v11 / 0x14u) + (int)(v12 * ((unsigned __int16)v11 % 0x14u))] blockTextureness:&a7[v15 * ((unsigned __int16)v11 / 0x14u) + (int)(v12 * ((unsigned __int16)v11 % 0x14u))] average:&v19 width:v12 height:v13 stride:a6];
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
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  int v10 = v9;
  if (v9 && ((*((uint64_t (**)(id))v9 + 2))(v9) & 1) != 0)
  {
    CVReturn v11 = -128;
    goto LABEL_40;
  }
  CVReturn v70 = 0;
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a3)
  {
    CVReturn v11 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVReturn v70 = v11;
    if (v11)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = pixelBuffer;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u);
      CVReturn v11 = v70;
      if (v70) {
        goto LABEL_40;
      }
    }
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    unint64_t v16 = (int)Height * (int)Width;
    std::vector<float>::vector(buf, v16);
    if ((int)Height >= 1)
    {
      uint64_t v17 = 0;
      v18 = *(float **)buf;
      unsigned __int8 v19 = BaseAddressOfPlane;
      do
      {
        uint64_t v20 = Width;
        v21 = v19;
        v22 = v18;
        if ((int)Width >= 1)
        {
          do
          {
            unsigned int v23 = *v21++;
            *v22++ = (float)v23 / 255.0;
            --v20;
          }
          while (v20);
        }
        ++v17;
        v18 += (int)Width;
        v19 += BytesPerRowOfPlane;
      }
      while (v17 != Height);
    }
    CVReturn v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v70);
    if (v11) {
      goto LABEL_64;
    }
    std::vector<unsigned char>::vector(__p, v16);
    CVReturn v11 = [(VCPImageAnalyzer *)self calculateTextureness:*(void *)buf height:Height width:Width sdof:0 result:__p[0]];
    if (v11)
    {
LABEL_62:
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
LABEL_64:
      if (*(void *)buf)
      {
        *(void *)&buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }
      if (pixelBuffer
        && !v70
        && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
      }
      goto LABEL_40;
    }
    [(VCPImageExposureAnalyzer *)self computeNoiseLevel:BaseAddressOfPlane width:Width height:Height stride:BytesPerRowOfPlane textureness:__p[0]];
    if ((int)Height <= 0)
    {
      int v26 = 0;
      float v29 = 0.0;
      float v44 = 0.0 / (float)(int)v16;
      float v35 = 1.0;
      float v32 = 0.0;
      float v33 = 0.0;
      float v34 = 0.0;
      float v45 = 0.0;
    }
    else
    {
      uint64_t v25 = 0;
      int v26 = 0;
      uint64_t v27 = *(void *)buf;
      v28 = __p[0];
      float v29 = 0.0;
      float v30 = 0.0;
      float v31 = 0.0;
      float v32 = 0.0;
      float v33 = 0.0;
      float v34 = 0.0;
      float v35 = 1.0;
      do
      {
        if ((int)Width >= 1)
        {
          uint64_t v36 = 0;
          float v37 = fabsf((float)((float)(int)v25 / (float)(int)Height) + -0.5);
          do
          {
            float v38 = fmaxf(1.0 - sqrtf(v37 + fabsf((float)((float)(int)v36 / (float)(int)Width) + -0.5)), 0.0);
            float v29 = v29 + v38;
            float v39 = *(float *)(v27 + 4 * v36);
            if (v39 < 0.98039) {
              float v40 = 0.0;
            }
            else {
              float v40 = 1.0;
            }
            float v33 = v33 + (float)(v40 * v38);
            if (v39 > 0.11765) {
              float v41 = 0.0;
            }
            else {
              float v41 = 1.0;
            }
            float v31 = v31 + v39;
            float v32 = v32 + (float)(v41 * v38);
            float v42 = v30 + v39;
            if (v39 >= v34) {
              float v43 = *(float *)(v27 + 4 * v36);
            }
            else {
              float v43 = v34;
            }
            if (v35 < v39) {
              float v39 = v35;
            }
            if (v28[v36])
            {
              float v35 = v39;
              float v34 = v43;
              ++v26;
              float v30 = v42;
            }
            ++v36;
          }
          while (Width != v36);
        }
        ++v25;
        v27 += 4 * (int)Width;
        v28 += (int)Width;
      }
      while (v25 != Height);
      float v44 = v31 / (float)(int)v16;
      float v45 = 0.0;
      if (v26) {
        float v45 = v30 / (float)v26;
      }
      else {
        int v26 = 0;
      }
    }
    float v55 = v33 / v29;
    BOOL v56 = v29 == 0.0;
    if (v29 == 0.0) {
      float v55 = 0.0;
    }
    float v57 = v32 / v29;
    if (v56) {
      float v58 = 0.0;
    }
    else {
      float v58 = v57;
    }
    float v59 = fabsf(v44 + -0.5);
    float v60 = (float)(v35 + -0.3) * 4.0;
    if (v60 < (float)(0.7 - v34)) {
      float v60 = 0.7 - v34;
    }
    if (v59 < v60) {
      float v59 = v60;
    }
    float v61 = fmaxf((float)((float)(v59 * -4.0) * v59) + 1.0, 0.0);
    if (v55 >= 0.15 || v58 >= 0.4 && (float)(vabds_f32(v44, v45) / v44) >= 0.1)
    {
      float v62 = fmaxf((float)((float)(v55 * -2.6) + 1.0) - v58, 0.0);
      if (v55 >= 0.15) {
        goto LABEL_57;
      }
      if ((float)((float)((float)(int)Width * 0.5) * (float)(int)Height) > (float)v26)
      {
        if (v24 <= 0.5 && (float)((float)((float)(int)Width * 0.001) * (float)(int)Height) <= (float)v26 && v24 >= 0.0)
        {
          float v61 = fmaxf(fmaxf((float)(fabsf((float)((float)(v35 + v34) * 0.5) + -0.5) * -2.0) + 1.0, 0.0)+ (float)(v24 * -0.5), 0.0);
          goto LABEL_61;
        }
LABEL_57:
        if (v62 < v61) {
          float v61 = v62;
        }
        goto LABEL_61;
      }
      float v61 = fmaxf((float)(fabsf(v45 + -0.5) * -2.0) + 1.0, 0.0);
    }
LABEL_61:
    self->_exposureScore = v61;
    self->_exposureScore = roundf(v61 * 100.0) / 100.0;
    v78 = @"ExposureResults";
    v75[0] = @"quality";
    v63 = objc_msgSend(NSNumber, "numberWithFloat:");
    v76[0] = v63;
    v75[1] = @"attributes";
    v73 = @"underExpose";
    *(float *)&double v64 = v58;
    v65 = [NSNumber numberWithFloat:v64];
    v74 = v65;
    v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    v76[1] = v66;
    v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:2];
    v77 = v67;
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
    v79 = v68;
    *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];

    CVReturn v11 = 0;
    goto LABEL_62;
  }
  BOOL v46 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v46) {
    -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v46, v47, v48, v49, v50, v51, v52, v53);
  }
  CVReturn v11 = -50;
LABEL_40:

  return v11;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

@end