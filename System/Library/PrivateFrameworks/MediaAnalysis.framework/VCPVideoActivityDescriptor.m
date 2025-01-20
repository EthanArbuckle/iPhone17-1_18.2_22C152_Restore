@interface VCPVideoActivityDescriptor
- (VCPVideoActivityDescriptor)initWithFrameWidthInMb:(int)a3 heightInMb:(int)a4;
- (float)descriptors;
- (void)ExtractActivityDescriptorFromStats:(EncodeStats *)a3;
- (void)dealloc;
- (void)reset;
- (void)spatialDescriptorWithMvMagnitudeMean:(float)a3;
@end

@implementation VCPVideoActivityDescriptor

- (VCPVideoActivityDescriptor)initWithFrameWidthInMb:(int)a3 heightInMb:(int)a4
{
  v15.receiver = self;
  v15.super_class = (Class)VCPVideoActivityDescriptor;
  v6 = [(VCPVideoActivityDescriptor *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    v6->_widthInMb = a3;
    v6->_heightInMb = a4;
    if (a3 >= 1 && a4 >= 1)
    {
      motionMagnitudeHistogram = v6->_motionMagnitudeHistogram;
      if (!motionMagnitudeHistogram)
      {
        motionMagnitudeHistogram = (int64_t *)operator new[](0x3C0uLL, MEMORY[0x1E4FBA2D0]);
        v7->_motionMagnitudeHistogram = motionMagnitudeHistogram;
      }
      motionMagnitude = v7->_motionMagnitude;
      if (!motionMagnitude)
      {
        if (a4 * a3 < 0) {
          size_t v11 = -1;
        }
        else {
          size_t v11 = 4 * a4 * a3;
        }
        motionMagnitude = (float *)operator new[](v11, MEMORY[0x1E4FBA2D0]);
        v7->_motionMagnitude = motionMagnitude;
      }
      if (motionMagnitude) {
        BOOL v12 = motionMagnitudeHistogram == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12) {
        v8 = 0;
      }
      else {
        v8 = v7;
      }
    }
    v13 = v8;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  motionMagnitudeHistogram = self->_motionMagnitudeHistogram;
  if (motionMagnitudeHistogram) {
    MEMORY[0x1C186C790](motionMagnitudeHistogram, 0x1000C8000313F17);
  }
  motionMagnitude = self->_motionMagnitude;
  if (motionMagnitude) {
    MEMORY[0x1C186C790](motionMagnitude, 0x1000C8052888210);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPVideoActivityDescriptor;
  [(VCPVideoActivityDescriptor *)&v5 dealloc];
}

- (void)reset
{
  *(void *)&self->descriptors[8] = 0;
  *(_OWORD *)&self->descriptors[4] = 0u;
  *(_OWORD *)self->descriptors = 0u;
}

- (void)ExtractActivityDescriptorFromStats:(EncodeStats *)a3
{
  bzero(self->_motionMagnitudeHistogram, 0x3C0uLL);
  int heightInMb = self->_heightInMb;
  if (heightInMb >= 1)
  {
    int v6 = 0;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    double v9 = 0.0;
    int widthInMb = self->_widthInMb;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    do
    {
      if (widthInMb >= 1)
      {
        uint64_t v16 = 0;
        uint64_t v17 = (4 * v7) | 2;
        v18 = &a3->var19[v7];
        v19 = &a3->var17[v7];
        motionMagnitudeHistogram = self->_motionMagnitudeHistogram;
        v21 = &a3->var1[v7];
        v22 = &a3->var20[v7];
        v23 = &a3->var18[v7];
        v24 = &a3->var2[v7];
        v25 = &self->_motionMagnitude[v7];
        do
        {
          if (v21[v16])
          {
            v26 = (__int16 *)((char *)a3->var3 + v17);
            float v27 = (float)*(v26 - 1) * 0.25;
            float v28 = (float)*v26 * 0.25;
          }
          else
          {
            float v27 = 0.0;
            float v28 = 0.0;
          }
          uint64_t v29 = v16 + 1;
          float v30 = sqrtf((float)(v28 * v28) + (float)(v27 * v27));
          int v31 = llroundf(v30);
          if (v31 >= 119) {
            int v31 = 119;
          }
          double v9 = v9 + v30;
          *(double *)&unint64_t v32 = (float)(v30 * v30);
          double v11 = v11 + *(double *)&v32;
          LOWORD(v32) = v18[v16];
          *(double *)&unint64_t v33 = (double)v32;
          double v15 = v15 + *(double *)&v33;
          LOWORD(v33) = v19[v16];
          *(double *)&unint64_t v34 = (double)v33;
          double v14 = v14 + *(double *)&v34;
          LOWORD(v34) = v22[v16];
          *(double *)&unint64_t v35 = (double)v34;
          double v13 = v13 + *(double *)&v35;
          LOWORD(v35) = v23[v16];
          v8 += v24[v16];
          v25[v16] = v30;
          double v12 = v12 + (double)v35;
          ++motionMagnitudeHistogram[v31 & ~(v31 >> 31)];
          v17 += 4;
          ++v16;
        }
        while (widthInMb != v29);
        v7 += v29;
      }
      ++v6;
    }
    while (v6 != heightInMb);
    if (v7)
    {
      uint64_t v36 = 0;
      float v37 = (float)v7;
      float v38 = 120.0;
      uint64_t v39 = 119;
      while (1)
      {
        v36 += self->_motionMagnitudeHistogram[v39];
        float v40 = (float)v36 / v37;
        if (v40 >= 0.015)
        {
          float v41 = (float)(int)v39;
          if (v38 == 120.0) {
            float v38 = (float)(int)v39;
          }
          if (v40 >= 0.1) {
            break;
          }
        }
        if (--v39 == -1)
        {
          float v41 = 120.0;
          break;
        }
      }
      double v42 = v9 / (double)v7;
      float v43 = v42;
      float v44 = v11 / (double)v7 - v42 * v42;
      self->descriptors[0] = v43;
      self->descriptors[1] = sqrtf(v44);
      self->descriptors[2] = v38;
      self->descriptors[3] = v41;
      float v45 = v15 / (double)v7 + v13 / (double)v7 * 4.0;
      float v46 = v14 / (double)v7 + v12 / (double)v7 * 4.0;
      self->descriptors[4] = v45;
      self->descriptors[5] = v46;
      self->descriptors[6] = (float)v8 / v37;
      -[VCPVideoActivityDescriptor spatialDescriptorWithMvMagnitudeMean:](self, "spatialDescriptorWithMvMagnitudeMean:");
    }
  }
}

- (void)spatialDescriptorWithMvMagnitudeMean:(float)a3
{
  int heightInMb = self->_heightInMb;
  int widthInMb = self->_widthInMb;
  *(void *)&self->descriptors[8] = 0;
  self->descriptors[7] = 0.0;
  if (widthInMb >= 3 && heightInMb >= 1)
  {
    int v6 = 0;
    int v7 = 0;
    int v8 = 0;
    descriptors = self->descriptors;
    motionMagnitude = self->_motionMagnitude;
    do
    {
      int v11 = v6;
      uint64_t v12 = heightInMb * widthInMb - 1 - (uint64_t)v6;
      int v13 = widthInMb;
      double v14 = &motionMagnitude[v6];
      do
      {
        if (*v14 >= a3 || v12 == 0)
        {
          int v16 = v8 / (widthInMb / 3);
          if (v16 >= 2) {
            int v16 = 2;
          }
          descriptors[(v16 & ~(v16 >> 31)) + 7] = descriptors[(v16 & ~(v16 >> 31)) + 7] + 1.0;
          int v8 = 1;
        }
        else
        {
          ++v8;
        }
        --v12;
        ++v14;
        --v13;
      }
      while (v13);
      int v6 = v11 + widthInMb;
      ++v7;
    }
    while (v7 != heightInMb);
  }
}

- (float)descriptors
{
  return self->descriptors;
}

@end