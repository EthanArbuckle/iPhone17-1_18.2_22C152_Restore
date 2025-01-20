@interface VCPBlurAnalyzer
- (float)computeRegionSharpness:(char *)a3 width:(int)a4 height:(int)a5 stride:(int64_t)a6;
- (int)computeSharpnessScore:(float *)a3 forObjects:(id)a4 inImage:(__CVBuffer *)a5;
@end

@implementation VCPBlurAnalyzer

- (float)computeRegionSharpness:(char *)a3 width:(int)a4 height:(int)a5 stride:(int64_t)a6
{
  float v6 = 1.0;
  if (a5 < 3)
  {
    int v12 = 0;
    int v11 = 0;
    float v27 = 1.0;
LABEL_33:
    float v29 = (float)v12;
    goto LABEL_34;
  }
  int v7 = 0;
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
  int v12 = 0;
  v13 = &a3[a6];
  int v14 = a5 - 2;
  int v15 = 1;
  v16 = &a3[2 * a6];
  do
  {
    if (a4 >= 3)
    {
      uint64_t v17 = 1;
      do
      {
        int v18 = v13[v17 + 1];
        int v19 = v13[v17 - 1];
        unsigned int v20 = v18 - v19;
        if (v18 - v19 < 0) {
          unsigned int v20 = v19 - v18;
        }
        if (v20 >= 0x15)
        {
          int v21 = 2 * v13[v17] - (v19 + v18);
          if (v21 < 0) {
            int v21 = -v21;
          }
          v7 += v21 >> 2;
          if (v21 > 0x13) {
            ++v9;
          }
          ++v11;
        }
        int v22 = a3[v17];
        int v23 = v16[v17];
        unsigned int v24 = v22 - v23;
        if (v22 - v23 < 0) {
          unsigned int v24 = v23 - v22;
        }
        if (v24 >= 0x15)
        {
          int v25 = 2 * v13[v17] - (v23 + v22);
          if (v25 < 0) {
            int v25 = -v25;
          }
          v8 += v25 >> 2;
          if (v25 > 0x13) {
            ++v10;
          }
          ++v12;
        }
        ++v17;
      }
      while (a4 - 1 != v17);
    }
    v13 += a6;
    a3 += a6;
    v16 += a6;
  }
  while (v15++ != v14);
  float v27 = 1.0;
  if (v11 > 50)
  {
    float v28 = (float)((float)((float)v7 / (float)v11) * -0.125) + 1.0;
    if (v28 < 0.0) {
      float v28 = 0.0;
    }
    float v27 = (float)(1.0 - (float)((float)v9 / (float)v11)) * v28;
  }
  if (v12 <= 50) {
    goto LABEL_33;
  }
  float v29 = (float)v12;
  float v30 = (float)((float)((float)v8 / (float)v12) * -0.125) + 1.0;
  if (v30 < 0.0) {
    float v30 = 0.0;
  }
  float v6 = (float)(1.0 - (float)((float)v10 / v29)) * v30;
LABEL_34:
  float v31 = (float)v11 + 1.0;
  float v32 = v29 + 1.0;
  if (v27 <= v6) {
    float v32 = v32 * 20.0;
  }
  else {
    float v31 = v31 * 20.0;
  }
  return 1.0 - (float)((float)((float)(v6 * v32) + (float)(v27 * v31)) / (float)(v31 + v32));
}

- (int)computeSharpnessScore:(float *)a3 forObjects:(id)a4 inImage:(__CVBuffer *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  CVPixelBufferRef pixelBuffer = a5;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (a5)
  {
    CVReturn v8 = CVPixelBufferLockBaseAddress(a5, 1uLL);
    int v58 = v8;
    if (!v8
      || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
      && (*(_DWORD *)buf = 134218240,
          CVPixelBufferRef v63 = pixelBuffer,
          __int16 v64 = 1024,
          CVReturn v65 = v8,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (CVReturn v8 = v58) == 0))
    {
      int Width = CVPixelBufferGetWidth(a5);
      int Height = CVPixelBufferGetHeight(a5);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a5, 0);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a5, 0);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id obj = v7;
      id v48 = v7;
      uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (v12)
      {
        uint64_t v51 = *(void *)v55;
        double v13 = (double)Width;
        double v14 = (double)Height;
        float v15 = 0.0;
        float v16 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v55 != v51) {
              objc_enumerationMutation(obj);
            }
            NSRect v67 = NSRectFromString((NSString *)*(void *)(*((void *)&v54 + 1) + 8 * i));
            v53.a = 1.0;
            v53.b = 0.0;
            v53.c = 0.0;
            *(_OWORD *)&v53.d = xmmword_1BC280F00;
            v53.ty = 1.0;
            CGRect v68 = CGRectApplyAffineTransform(v67, &v53);
            unsigned int v18 = 0;
            int v19 = (int)(v68.origin.x * v13);
            if (v19 >= Width) {
              int v20 = Width;
            }
            else {
              int v20 = (int)(v68.origin.x * v13);
            }
            if (v19 <= 0) {
              int v21 = 0;
            }
            else {
              int v21 = v20;
            }
            int v22 = (int)(v68.origin.y * v14);
            if (v22 >= Height) {
              int v23 = Height;
            }
            else {
              int v23 = (int)(v68.origin.y * v14);
            }
            if (v22 <= 0) {
              int v24 = 0;
            }
            else {
              int v24 = v23;
            }
            int v25 = Width - v21;
            int v26 = (int)(v68.size.width * v13);
            if (v26 < Width - v21) {
              int v25 = (int)(v68.size.width * v13);
            }
            unsigned int v27 = v25 / 2;
            float v28 = &BaseAddressOfPlane[BytesPerRowOfPlane * v24 + v21];
            int v29 = (int)(v68.size.height * v14);
            if (v29 >= Height - v24) {
              int v30 = Height - v24;
            }
            else {
              int v30 = (int)(v68.size.height * v14);
            }
            unsigned int v31 = v30 / 2;
            float v32 = v68.size.width * v68.size.height;
            if (v26 <= 0) {
              uint64_t v33 = 0;
            }
            else {
              uint64_t v33 = v27;
            }
            if (v29 <= 0) {
              uint64_t v34 = 0;
            }
            else {
              uint64_t v34 = v31;
            }
            float v35 = 1.0;
            float v36 = 0.0;
            float v37 = 0.0;
            do
            {
              [(VCPBlurAnalyzer *)self computeRegionSharpness:&v28[BytesPerRowOfPlane * (int)((v18 >> 1) * v34) + (int)(((int)(v18 << 31) >> 31) & v33)] width:v33 height:v34 stride:BytesPerRowOfPlane];
              if (v35 > v38) {
                float v35 = v38;
              }
              if (v36 < v38) {
                float v36 = v38;
              }
              float v37 = v37 + v38;
              ++v18;
            }
            while (v18 != 4);
            float v16 = v16 + (float)(v32 * (float)((float)((float)(v37 - v35) - v36) * 0.5));
            float v15 = v15 + v32;
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
        }
        while (v12);
      }
      else
      {
        float v15 = 0.0;
        float v16 = 0.0;
      }

      id v7 = v48;
      CVReturn v8 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v58);
      if (!v8) {
        *a3 = roundf((float)(v16 / v15) * 100.0) / 100.0;
      }
    }
  }
  else
  {
    BOOL v39 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v39) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v39, v40, v41, v42, v43, v44, v45, v46);
    }
    CVReturn v8 = -50;
    int v58 = -50;
  }
  if (pixelBuffer
    && !v58
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
  }

  return v8;
}

@end