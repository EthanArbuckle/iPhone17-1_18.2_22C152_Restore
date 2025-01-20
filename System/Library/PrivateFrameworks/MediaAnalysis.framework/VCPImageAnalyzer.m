@interface VCPImageAnalyzer
- (id).cxx_construct;
- (int)aggregateTileResults:(id)a3 tileRect:(CGRect)a4 imageSize:(CGSize)a5 landscape:(BOOL)a6 results:(id)a7;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)analyzePixelBufferInTiles:(__CVBuffer *)a3 results:(id)a4 cancel:(id)a5;
- (int)calculateTextureness:(float *)a3 height:(int)a4 width:(int)a5 sdof:(BOOL)a6 result:(char *)a7;
- (int)processTile:(__CVBuffer *)a3 results:(id)a4 cancel:(id)a5;
@end

@implementation VCPImageAnalyzer

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  *a5 = 0;
  return -4;
}

- (int)processTile:(__CVBuffer *)a3 results:(id)a4 cancel:(id)a5
{
  return -4;
}

- (int)aggregateTileResults:(id)a3 tileRect:(CGRect)a4 imageSize:(CGSize)a5 landscape:(BOOL)a6 results:(id)a7
{
  return -4;
}

- (int)analyzePixelBufferInTiles:(__CVBuffer *)a3 results:(id)a4 cancel:(id)a5
{
  id v36 = a4;
  v7 = (uint64_t (**)(void))a5;
  signed int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CFTypeRef cf = 0;
  int v10 = -50;
  if (Width)
  {
    signed int v11 = Height;
    if (Height)
    {
      if (Width <= Height) {
        int v12 = Height;
      }
      else {
        int v12 = Width;
      }
      if (Width >= Height) {
        int v13 = Height;
      }
      else {
        int v13 = Width;
      }
      int v14 = v12 / v13;
      if (v14 >= 4) {
        int v15 = 4;
      }
      else {
        int v15 = v14;
      }
      if (v15 < 2)
      {
        int v10 = [(VCPImageAnalyzer *)self processTile:a3 results:v36 cancel:v7];
      }
      else
      {
        int v16 = 0;
        float v17 = (float)Height;
        float v18 = (float)Width;
        double v34 = (double)Height;
        double v35 = (double)Width;
        while (1)
        {
          if (v7[2](v7))
          {
            int v10 = -128;
            goto LABEL_53;
          }
          float v19 = (float)(1.0 / (float)v15) * (float)v16;
          float v20 = 1.0 - v19;
          if ((float)(1.0 - v19) >= (float)(1.5 / (float)v15)) {
            float v20 = 1.5 / (float)v15;
          }
          uint64_t v21 = Width > v11 ? v11 : (int)(float)(v20 * v17) & 0xFFFFFFFE;
          uint64_t v22 = Width > v11 ? (int)(float)(v20 * v18) & 0xFFFFFFFE : Width;
          double v23 = Width > v11 ? v19 : 0.0;
          double v24 = Width > v11 ? 0.0 : v19;
          double v25 = Width > v11 ? v20 : 1.0;
          double v26 = Width > v11 ? 1.0 : v20;
          uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", *(void *)&v34, *(void *)&v35);
          float v28 = v17;
          double v29 = (float)(v19 * v17);
          double v30 = Width > v11 ? (float)(v19 * v18) : 0.0;
          double v31 = Width > v11 ? 0.0 : v29;
          v32 = (void *)v27;
          if (!v27) {
            break;
          }
          v39.origin.x = v23;
          v39.origin.y = v24;
          v39.size.width = v25;
          v39.size.height = v26;
          int v10 = Scaler::ScaleCropped(&self->_scaler, v39, a3, (__CVBuffer **)&cf, v22, v21, 875704422);
          if (v10
            || (int v10 = [(VCPImageAnalyzer *)self processTile:cf results:v32 cancel:v7]) != 0
            || (int v10 = -[VCPImageAnalyzer aggregateTileResults:tileRect:imageSize:landscape:results:](self, "aggregateTileResults:tileRect:imageSize:landscape:results:", v32, Width > v11, v36, v30, v31, (double)(int)v22, (double)(int)v21, v35, v34)) != 0)
          {

            goto LABEL_53;
          }
          float v17 = v28;
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }

          if (v15 == ++v16)
          {
            int v10 = 0;
            goto LABEL_53;
          }
        }
        int v10 = -108;
      }
LABEL_53:
      if (cf) {
        CFRelease(cf);
      }
    }
  }

  return v10;
}

- (int)calculateTextureness:(float *)a3 height:(int)a4 width:(int)a5 sdof:(BOOL)a6 result:(char *)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  bzero(v68, 0x320uLL);
  int v12 = a5 * a4;
  if (a5 * a4 < 0) {
    size_t v13 = -1;
  }
  else {
    size_t v13 = 4 * v12;
  }
  int v14 = (char *)operator new[](v13, MEMORY[0x1E4FBA2D0]);
  int v15 = v14;
  if (v14) {
    bzero(v14, v13);
  }
  int v16 = (char *)operator new[](v13, MEMORY[0x1E4FBA2D0]);
  float v17 = v16;
  if (v16) {
    bzero(v16, v13);
  }
  float v18 = (char *)operator new[](v13, MEMORY[0x1E4FBA2D0]);
  float v19 = v18;
  if (!v18)
  {
    int v20 = -108;
    goto LABEL_50;
  }
  bzero(v18, v13);
  int v20 = -108;
  if (v15 && v17)
  {
    BOOL v21 = a6;
    if (a4 <= 2)
    {
      uint64_t v23 = a5;
      bzero(a7, a5 * (uint64_t)a4);
      if (!v21)
      {
LABEL_49:
        int v20 = 0;
        goto LABEL_50;
      }
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v23 = a5;
      unint64_t v24 = 4 * a5;
      double v25 = &v17[v24 + 4];
      double v26 = &v19[v24 + 4];
      uint64_t v27 = &v15[v24 + 4];
      float v28 = v15 + 4;
      double v29 = v19 + 4;
      double v30 = v17 + 4;
      double v31 = &a3[v24 / 4 + 2];
      v32 = &a3[2 * a5 + 1];
      uint64_t v33 = 1;
      do
      {
        if (a5 >= 3)
        {
          unint64_t v34 = 0;
          unint64_t v35 = v24 + v24 * v22;
          float v36 = *(float *)&v17[v35];
          float v37 = *(float *)&v19[v35];
          float v38 = *(float *)&v15[v35];
          do
          {
            float v39 = v31[v34 / 4] - v31[v34 / 4 - 2];
            float v40 = v32[v34 / 4] - a3[v34 / 4 + 1];
            float v38 = (float)((float)(v38 + *(float *)&v28[v34]) - *(float *)&v28[v34 - 4]) + (float)(v39 * v39);
            *(float *)&v27[v34] = v38;
            float v37 = (float)((float)(v37 + *(float *)&v29[v34]) - *(float *)&v29[v34 - 4]) + (float)(v39 * v40);
            *(float *)&v26[v34] = v37;
            float v36 = (float)((float)(v36 + *(float *)&v30[v34]) - *(float *)&v30[v34 - 4]) + (float)(v40 * v40);
            *(float *)&v25[v34] = v36;
            v34 += 4;
          }
          while (4 * (a5 - 1) - 4 != v34);
        }
        ++v33;
        ++v22;
        v25 += v24;
        v26 += v24;
        v27 += v24;
        a3 = (float *)((char *)a3 + v24);
        v28 += v24;
        v29 += v24;
        v30 += v24;
        double v31 = (float *)((char *)v31 + v24);
        v32 = (float *)((char *)v32 + v24);
      }
      while (v33 != a4 - 1);
      bzero(a7, a5 * (uint64_t)a4);
      if (a4 >= 31)
      {
        uint64_t v41 = 0;
        uint64_t v42 = 116 * a5 - 4;
        v43 = (float *)&v17[v42];
        uint64_t v44 = 4 * a5;
        v45 = (float *)&v19[v42];
        v46 = (float *)&v15[116 - v44];
        v47 = (float *)&v19[116 - v44];
        v48 = (float *)&v17[116 - v44];
        v49 = &v15[v42];
        v50 = a7;
        while (a5 < 31)
        {
LABEL_32:
          ++v41;
          v50 += a5;
          v43 = (float *)((char *)v43 + v44);
          v45 = (float *)((char *)v45 + v44);
          v46 = (float *)((char *)v46 + v44);
          v47 = (float *)((char *)v47 + v44);
          v48 = (float *)((char *)v48 + v44);
          v49 += v44;
          if (v41 == a4 - 30) {
            goto LABEL_33;
          }
        }
        unint64_t v51 = 0;
        uint64_t v52 = 0;
        while (1)
        {
          if (v52 | v41)
          {
            float v53 = *(float *)&v49[v51 * 4 + 120];
            if (!(v51 * 4))
            {
              float v54 = v53 - *v46;
              float v55 = v45[30] - *v47;
              float v57 = v43[30];
              float v58 = *v48;
LABEL_28:
              float v56 = v57 - v58;
              goto LABEL_29;
            }
            if (!v41)
            {
              float v54 = v53 - *(float *)&v49[v51 * 4];
              float v55 = v45[v51 + 30] - v45[v51];
              float v57 = v43[v51 + 30];
              float v58 = v43[v51];
              goto LABEL_28;
            }
            float v54 = (float)((float)(v53 - v46[v51]) - *(float *)&v49[v51 * 4]) + v46[v51 - 30];
            float v55 = (float)((float)(v45[v51 + 30] - v47[v51]) - v45[v51]) + v47[v51 - 30];
            float v56 = (float)((float)(v43[v51 + 30] - v48[v51]) - v43[v51]) + v48[v51 - 30];
          }
          else
          {
            float v54 = *(float *)&v49[v51 * 4 + 120];
            float v55 = v45[v51 + 30];
            float v56 = v43[v51 + 30];
          }
LABEL_29:
          int v59 = (int)(float)((float)((float)((float)((float)((float)((float)(v54 / 900.0) + (float)(v56 / 900.0))
                                                           - sqrtf((float)((float)(v55 / 900.0)* (float)((float)(v55 / 900.0) * 4.0))+ (float)((float)((float)(v54 / 900.0)- (float)(v56 / 900.0))* (float)((float)(v54 / 900.0)- (float)(v56 / 900.0)))))* 0.5)+ -0.001)* 100000.0)+ 1.0);
          if (v59 >= 199) {
            int v59 = 199;
          }
          int v60 = v59 & ~(v59 >> 31);
          ++v68[v60];
          v50[v52++] = v60;
          if (a5 - 30 == ++v51) {
            goto LABEL_32;
          }
        }
      }
LABEL_33:
      if (!v21) {
        goto LABEL_49;
      }
    }
    int v61 = 0;
    int v62 = 199;
    while (1)
    {
      v61 += v68[v62];
      if (v61 > (int)(float)((float)v12 * 0.1)) {
        break;
      }
      BOOL v63 = v62-- != 0;
      if (v62 == 0 || !v63) {
        goto LABEL_49;
      }
    }
    int v20 = 0;
    if (v62 >= 2 && a4 >= 1)
    {
      uint64_t v64 = 0;
      do
      {
        uint64_t v65 = a5;
        v66 = a7;
        if (a5 >= 1)
        {
          do
          {
            if (v62 > *v66) {
              char *v66 = 0;
            }
            ++v66;
            --v65;
          }
          while (v65);
        }
        ++v64;
        a7 += v23;
      }
      while (v64 != a4);
      goto LABEL_49;
    }
  }
LABEL_50:
  if (v15) {
    MEMORY[0x1C186C790](v15, 0x1000C8052888210);
  }
  if (v17) {
    MEMORY[0x1C186C790](v17, 0x1000C8052888210);
  }
  if (v19) {
    MEMORY[0x1C186C790](v19, 0x1000C8052888210);
  }
  return v20;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((_DWORD *)self + 6) = 0;
  return self;
}

@end