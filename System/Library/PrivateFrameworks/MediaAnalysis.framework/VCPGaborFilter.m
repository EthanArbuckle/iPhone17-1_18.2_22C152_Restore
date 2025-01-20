@interface VCPGaborFilter
- (VCPGaborFilter)initWithNumberOfScales:(int)numScales numOfOrientations:(int)numOrientations width:(unint64_t)a5 height:(unint64_t)a6;
- (int)createGaborFilterKernel:(Kernel *)a3 sigmaX:(float)a4 sigmaY:(float)a5 lambda:(float)a6 thetaInDegree:(float)a7 phaseInDegree:(float)a8;
- (int)processWithFilterScaleIdx:(int)a3 orientIdx:(int)a4 srcImage:(const float *)a5 outImage:(float *)a6 width:(unint64_t)a7 height:(unint64_t)a8;
- (void)dealloc;
@end

@implementation VCPGaborFilter

- (VCPGaborFilter)initWithNumberOfScales:(int)numScales numOfOrientations:(int)numOrientations width:(unint64_t)a5 height:(unint64_t)a6
{
  v34.receiver = self;
  v34.super_class = (Class)VCPGaborFilter;
  v10 = [(VCPGaborFilter *)&v34 init];
  v11 = v10;
  if (v10)
  {
    v12 = 0;
    if ((a5 & a6 & 1) != 0 && (a6 | a5) >= 2)
    {
      v10->_numScales = numScales;
      v10->_numOrientations = numOrientations;
      v10->_num = numOrientations * numScales;
      if (numScales < 0) {
        size_t v13 = -1;
      }
      else {
        size_t v13 = 8 * numScales;
      }
      v14 = (Kernel **)operator new[](v13, MEMORY[0x1E4FBA2D0]);
      v11->_filterBanks = v14;
      if (v14)
      {
        v12 = v11;
        if (numScales >= 1)
        {
          uint64_t v15 = 0;
          float v16 = 180.0 / (float)numOrientations;
          if ((a6 * a5) >> 62) {
            size_t v17 = -1;
          }
          else {
            size_t v17 = 4 * a6 * a5;
          }
          v18 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
          while (1)
          {
            float v19 = exp2f((float)(int)v15 + 2.0);
            size_t v20 = is_mul_ok(numOrientations, 0x18uLL) ? 24 * numOrientations : -1;
            v11->_filterBanks[v15] = (Kernel *)operator new[](v20, v18);
            v12 = (VCPGaborFilter *)v11->_filterBanks[v15];
            if (!v12) {
              break;
            }
            if (numOrientations >= 1)
            {
              uint64_t v21 = 0;
              uint64_t v22 = 0;
              while (1)
              {
                filterBanks = v11->_filterBanks;
                v24 = &filterBanks[v15][v21];
                v24->var1 = a5;
                v24->unint64_t var2 = a6;
                filterBanks[v15][v21].var0 = (float *)operator new[](v17, v18);
                v28 = &v11->_filterBanks[v15][v21];
                if (!v28->var0) {
                  goto LABEL_26;
                }
                *(float *)&double v27 = v16 * (float)(int)v22;
                long long v29 = *(_OWORD *)&v28->var0;
                unint64_t var2 = v28->var2;
                long long v32 = v29;
                *(float *)&long long v29 = v19;
                *(float *)&double v25 = v19 * 1.2;
                *(float *)&double v26 = v19;
                if ([(VCPGaborFilter *)v11 createGaborFilterKernel:&v32 sigmaX:*(double *)&v29 sigmaY:v25 lambda:v26 thetaInDegree:v27 phaseInDegree:0.0])
                {
                  goto LABEL_26;
                }
                ++v22;
                ++v21;
                if (v22 >= v11->_numOrientations)
                {
                  numScales = v11->_numScales;
                  numOrientations = v11->_numOrientations;
                  break;
                }
              }
            }
            if (++v15 >= numScales)
            {
              v12 = v11;
              break;
            }
          }
        }
      }
      else
      {
LABEL_26:
        v12 = 0;
      }
    }
    v30 = v12;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)dealloc
{
  if (self->_numScales >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      int numOrientations = self->_numOrientations;
      if (numOrientations >= 1)
      {
        uint64_t v5 = 0;
        for (uint64_t i = 0; i < numOrientations; ++i)
        {
          var0 = self->_filterBanks[v3][v5].var0;
          if (var0)
          {
            MEMORY[0x1C186C790](var0, 0x1000C8052888210);
            int numOrientations = self->_numOrientations;
          }
          ++v5;
        }
      }
      v8 = self->_filterBanks[v3];
      if (v8) {
        MEMORY[0x1C186C790](v8, 0x1080C80468F112ELL);
      }
      ++v3;
    }
    while (v3 < self->_numScales);
  }
  filterBanks = self->_filterBanks;
  if (filterBanks) {
    MEMORY[0x1C186C790](filterBanks, 0x20C8093837F09);
  }
  v10.receiver = self;
  v10.super_class = (Class)VCPGaborFilter;
  [(VCPGaborFilter *)&v10 dealloc];
}

- (int)processWithFilterScaleIdx:(int)a3 orientIdx:(int)a4 srcImage:(const float *)a5 outImage:(float *)a6 width:(unint64_t)a7 height:(unint64_t)a8
{
  v11 = &self->_filterBanks[a3][a4];
  vDSP_imgfir(a5, a8, a7, v11->var0, a6, v11->var2, v11->var1);
  vDSP_vabs(a6, 1, a6, 1, a8 * a7);
  return 0;
}

- (int)createGaborFilterKernel:(Kernel *)a3 sigmaX:(float)a4 sigmaY:(float)a5 lambda:(float)a6 thetaInDegree:(float)a7 phaseInDegree:(float)a8
{
  int result = -50;
  if (a5 > 0.0 && a4 > 0.0 && a6 > 0.0)
  {
    size_t v13 = a3;
    unint64_t v14 = a3->var2 >> 1;
    __float2 v16 = __sincosf_stret(a7 * 0.017453);
    float cosval = v16.__cosval;
    if ((v14 & 0x80000000) == 0)
    {
      int v17 = 0;
      float v18 = a8 * 0.017453;
      float v19 = a4 * a4;
      float v20 = a5 * a5;
      float v21 = 1.0 / (a4 * 6.28318531 * a5);
      unint64_t v22 = v13->var1 >> 1;
      int v23 = -(int)v14;
      if ((v22 & 0x80000000) == 0) {
        int v24 = v22;
      }
      else {
        int v24 = -(int)v22;
      }
      int v25 = v24 + 1;
      int v26 = v24 + 1 + v22;
      float v38 = 6.28318531 / a6;
      do
      {
        if ((v22 & 0x80000000) == 0)
        {
          float v39 = cosval * (float)v23;
          double v27 = v13;
          v28 = &v13->var0[v17];
          v17 += v26;
          int v29 = v22;
          int v30 = -(int)v22;
          do
          {
            float v31 = (float)(v16.__sinval * (float)v23) + (float)((float)v30 * cosval);
            float v32 = cosval;
            float v33 = v19;
            float v34 = v20;
            float v35 = expf(-(float)((float)((float)(v31 * v31) / v19)
                              + (float)((float)((float)(v39 + (float)((float)v29 * v16.__sinval))
                                              * (float)(v39 + (float)((float)v29 * v16.__sinval)))
                                      / v20)))
                * v21;
            float v36 = cosf(v18 + (float)(v38 * v31));
            float v20 = v34;
            float v19 = v33;
            float cosval = v32;
            *v28++ = v36 * v35;
            ++v30;
            --v29;
          }
          while (v25 != v30);
          size_t v13 = v27;
        }
      }
      while (v23++ != v14);
    }
    return 0;
  }
  return result;
}

@end