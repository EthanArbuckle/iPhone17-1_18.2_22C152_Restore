@interface GKImageColorPalette
- (BOOL)analyzeImage:(CGImage *)a3;
- (GKImageColorPalette)initWithImage:(id)a3;
- (unsigned)weightHistogram:(unsigned int *)a3 size:(unsigned int)a4 spread:(unsigned int)a5;
- (void)clearMainHistograms;
- (void)clearSaturationAndBrightnessHistograms;
- (void)findBrightColors;
- (void)generateHSVMapWithContext:(CGContext *)a3;
- (void)iterateOverPixelsWithBlock:(id)a3 forHue:(unsigned int)a4;
- (void)printHistogram:(unsigned int *)a3 ofSize:(unsigned int)a4;
- (void)reset;
@end

@implementation GKImageColorPalette

- (void)reset
{
  imageHSVMap = self->_imageHSVMap;
  if (imageHSVMap)
  {
    free(imageHSVMap);
    self->_imageHSVMap = 0;
  }
  self->_imageSize = (CGSize)*MEMORY[0x263F001B0];
  [(GKImageColorPalette *)self clearMainHistograms];
  [(GKImageColorPalette *)self clearSaturationAndBrightnessHistograms];
  self->_borderPercentageForBorderDetection = 0.0;
  self->_hueSpread = 7;
  self->_saturationSpread = 10;
  self->_brightnessSpread = 10;
  self->_grayscaleSpread = 15;
}

- (void)clearMainHistograms
{
}

- (void)clearSaturationAndBrightnessHistograms
{
  bzero(self->_saturationHistogram, 0x400uLL);
  bzero(self->_brightnessHistogram, 0x400uLL);
}

- (void)generateHSVMapWithContext:(CGContext *)a3
{
  if (a3)
  {
    size_t BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
    Data = CGBitmapContextGetData(a3);
    if (Data)
    {
      v7 = Data;
      uint64_t height = self->_imageSize.height;
      unsigned int width = self->_imageSize.width;
      v10 = (HSVColor *)malloc_type_calloc(width * height, 0x18uLL, 0x1000040504FFAC1uLL);
      self->_imageHSVMap = v10;
      if (v10)
      {
        __int16 BitmapInfo = CGBitmapContextGetBitmapInfo(a3);
        if (height)
        {
          int v15 = 0;
          uint64_t v16 = 0;
          int v17 = BitmapInfo & 0x3000;
          uint64_t v18 = 3;
          if ((BitmapInfo & 0x3000) != 0) {
            uint64_t v18 = 0;
          }
          do
          {
            if (width)
            {
              int v19 = 0;
              size_t v20 = (size_t)v7 + BytesPerRow * v16;
              imageHSVMap = self->_imageHSVMap;
              do
              {
                if (v17) {
                  uint64_t v22 = 2;
                }
                else {
                  uint64_t v22 = 1;
                }
                if (v17) {
                  uint64_t v23 = 1;
                }
                else {
                  uint64_t v23 = 2;
                }
                LOBYTE(v12) = *(unsigned char *)(v20 + v18);
                LOBYTE(v13) = *(unsigned char *)(v20 + v23);
                LOBYTE(v14) = *(unsigned char *)(v20 + v22);
                float v24 = (float)LODWORD(v14);
                *(float *)&double v12 = (float)LODWORD(v12) / 255.0;
                double v25 = *(float *)&v12;
                *(float *)&double v13 = (float)LODWORD(v13) / 255.0;
                double v26 = *(float *)&v13;
                float v27 = v24 / 255.0;
                double v28 = (float)(v24 / 255.0);
                if (v27 < *(float *)&v13 || v27 < *(float *)&v12)
                {
                  if (*(float *)&v13 < *(float *)&v12 || *(float *)&v13 < v27)
                  {
                    if (*(float *)&v13 >= v27) {
                      double v31 = v28;
                    }
                    else {
                      double v31 = *(float *)&v13;
                    }
                    double v12 = *(float *)&v12;
                  }
                  else
                  {
                    if (v27 >= *(float *)&v12) {
                      double v31 = *(float *)&v12;
                    }
                    else {
                      double v31 = v28;
                    }
                    double v12 = *(float *)&v13;
                  }
                }
                else
                {
                  if (*(float *)&v13 >= *(float *)&v12) {
                    double v31 = *(float *)&v12;
                  }
                  else {
                    double v31 = *(float *)&v13;
                  }
                  double v12 = v28;
                }
                double v32 = 0.0;
                if (v12 <= 0.0)
                {
                  double v13 = 0.0;
                }
                else
                {
                  double v33 = v12 - v31;
                  double v13 = (v12 - v31) / v12;
                  if (v13 != 0.0)
                  {
                    double v34 = (v12 - v26) / v33;
                    double v35 = (v12 - v25) / v33;
                    if (v12 == v28)
                    {
                      if (v31 == v26) {
                        double v32 = v35 + 5.0;
                      }
                      else {
                        double v32 = 1.0 - v34;
                      }
                    }
                    else
                    {
                      BOOL v37 = v12 == v26;
                      double v38 = (v12 - v28) / v33;
                      if (v37)
                      {
                        if (v31 == v25) {
                          double v32 = v38 + 1.0;
                        }
                        else {
                          double v32 = 3.0 - v35;
                        }
                      }
                      else if (v31 == v28)
                      {
                        double v32 = v34 + 3.0;
                      }
                      else
                      {
                        double v32 = 5.0 - v38;
                      }
                    }
                  }
                }
                double v14 = v32 / 6.0;
                p_var0 = &imageHSVMap[v15 + v19].var0;
                double *p_var0 = v32 / 6.0;
                p_var0[1] = v13;
                p_var0[2] = v12;
                v20 += 4;
                ++v19;
              }
              while (width != v19);
            }
            ++v16;
            v15 += width;
          }
          while (v16 != height);
        }
      }
    }
  }
}

- (void)printHistogram:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a4;
    do
    {
      uint64_t v7 = a3[v5];
      if (v7) {
        printf("%ld - %ld\n", v5, v7);
      }
      ++v5;
    }
    while (v6 != v5);
  }
}

- (unsigned)weightHistogram:(unsigned int *)a3 size:(unsigned int)a4 spread:(unsigned int)a5
{
  size_t v8 = 4 * a4;
  v9 = malloc_type_malloc(v8, 0x100004052888210uLL);
  memcpy(v9, a3, v8);
  if (a4)
  {
    uint64_t v11 = 0;
    unsigned int v12 = 0;
    unsigned int v13 = 0;
    do
    {
      unsigned int v14 = *((_DWORD *)v9 + v11);
      if (!a5) {
        goto LABEL_26;
      }
      int v15 = 0;
      double v16 = (double)v14;
      int v17 = 1;
      char v18 = 1;
      do
      {
        int v19 = v11 + v15 - 1;
        BOOL v20 = v19 < 0 && a4 == 360;
        LODWORD(v21) = v11 + v15 + 359;
        if (v20) {
          uint64_t v21 = v21;
        }
        else {
          uint64_t v21 = v19;
        }
        if ((v21 & 0x80000000) == 0)
        {
          LODWORD(v10) = *((_DWORD *)v9 + v21);
          double v10 = (double)*(unint64_t *)&v10;
          if (v16 >= v10)
          {
            double v10 = ((double)v17 * -0.0500000007 + 1.0) * v10;
            v14 += vcvtad_u64_f64(v10);
            a3[v21] = 0;
          }
          else
          {
            char v18 = 0;
          }
        }
        unsigned int v22 = v11 + v17;
        if ((int)v11 + v17 > 360 && a4 == 360) {
          unsigned int v22 = v11 + v17 - 360;
        }
        if (v22 < a4)
        {
          LODWORD(v10) = *((_DWORD *)v9 + (int)v22);
          double v10 = (double)*(unint64_t *)&v10;
          if (v16 >= v10)
          {
            double v10 = ((double)v17 * -0.0500000007 + 1.0) * v10;
            v14 += vcvtad_u64_f64(v10);
            a3[v22] = 0;
          }
          else
          {
            char v18 = 0;
          }
        }
        ++v17;
        --v15;
      }
      while (-a5 != v15);
      if ((v18 & 1) == 0) {
        unsigned int v14 = a3[v11];
      }
      else {
LABEL_26:
      }
        a3[v11] = v14;
      if (v14 > v12)
      {
        unsigned int v13 = v11;
        unsigned int v12 = v14;
      }
      ++v11;
    }
    while (v11 != a4);
  }
  else
  {
    unsigned int v13 = 0;
  }
  free(v9);
  return v13;
}

- (void)iterateOverPixelsWithBlock:(id)a3 forHue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    if (self->_imageHSVMap)
    {
      unsigned int height = self->_imageSize.height;
      if (height)
      {
        int v7 = 0;
        int v8 = 0;
        uint64_t width = self->_imageSize.width;
        id v13 = v6;
        do
        {
          uint64_t v10 = width;
          int v11 = v7;
          if (width)
          {
            do
            {
              (*((void (**)(id, HSVColor *, uint64_t))v6 + 2))(v13, &self->_imageHSVMap[v11], v4);
              id v6 = v13;
              ++v11;
              --v10;
            }
            while (v10);
          }
          ++v8;
          v7 += width;
        }
        while (v8 != height);
      }
    }
  }
}

- (void)findBrightColors
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__GKImageColorPalette_findBrightColors__block_invoke;
  v7[3] = &unk_26478A518;
  v7[4] = self;
  [(GKImageColorPalette *)self iterateOverPixelsWithBlock:v7 forHue:0];
  hueHistogram = self->_hueHistogram;
  [(GKImageColorPalette *)self weightHistogram:self->_hueHistogram size:360 spread:self->_hueSpread];
  uint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:360];
  for (uint64_t i = 0; i != 360; ++i)
  {
    if (hueHistogram[i] >= 0xB)
    {
      id v6 = [[SortHueEntry alloc] initWithHue:i count:hueHistogram[i]];
      [v4 addObject:v6];
    }
  }
  [v4 sortUsingComparator:&__block_literal_global_9];
}

double __39__GKImageColorPalette_findBrightColors__block_invoke(uint64_t a1, double *a2)
{
  double result = a2[1];
  if (result >= 0.0399999991)
  {
    double v3 = a2[2];
    if (v3 <= 0.899999976)
    {
      double result = result * 0.100000001 + 0.0 + v3;
      if (result >= 0.200000003)
      {
        double result = *a2 * 359.0;
        unsigned int v4 = vcvtad_u64_f64(result);
        ++*(_DWORD *)(*(void *)(a1 + 32) + 56 + 4 * v4);
      }
    }
  }
  return result;
}

uint64_t __39__GKImageColorPalette_findBrightColors__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 count];
  if (v6 <= [v5 count])
  {
    uint64_t v8 = [v4 count];
    uint64_t v7 = v8 < [v5 count];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (BOOL)analyzeImage:(CGImage *)a3
{
  [(GKImageColorPalette *)self reset];
  if (a3)
  {
    CGFloat Width = (double)CGImageGetWidth(a3);
    size_t Height = CGImageGetHeight(a3);
    self->_imageSize.uint64_t width = Width;
    self->_imageSize.unsigned int height = (double)Height;
    uint64_t v7 = -[GKImageContext initWithSize:scale:options:]([GKImageContext alloc], "initWithSize:scale:options:", 0, self->_imageSize.width, self->_imageSize.height, 1.0);
    uint64_t v8 = [(GKImageContext *)v7 CGContext];
    v11.size.uint64_t width = self->_imageSize.width;
    v11.size.unsigned int height = self->_imageSize.height;
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    CGContextDrawImage(v8, v11, a3);
    [(GKImageColorPalette *)self generateHSVMapWithContext:[(GKImageContext *)v7 CGContext]];
    imageHSVMap = self->_imageHSVMap;
    LOBYTE(a3) = imageHSVMap != 0;
    if (imageHSVMap) {
      [(GKImageColorPalette *)self findBrightColors];
    }
  }
  return (char)a3;
}

- (GKImageColorPalette)initWithImage:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKImageColorPalette;
  id v5 = [(GKImageColorPalette *)&v7 init];
  if (v5) {
    -[GKImageColorPalette analyzeImage:](v5, "analyzeImage:", [v4 CGImage]);
  }

  return v5;
}

@end