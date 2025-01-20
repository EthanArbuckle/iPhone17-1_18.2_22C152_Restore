@interface VCPVanishingPointDetector
- (BOOL)isVerticalOrHorizontal:(int)a3;
- (VCPVanishingPointDetector)initWithImage:(__CVBuffer *)a3;
- (id).cxx_construct;
- (int)calculateConfidence:(id)a3 lineDistance:(float)a4 vaninshingPoint:(CGPoint)a5 vanishingPointConfidence:(float *)a6;
- (int)calculateOrientationResponses;
- (int)detect:(CGPoint *)a3 withConfidence:(float *)a4 dominantLine:(id *)a5;
- (int)generateLineWeightMap:(id)a3 weightMap:(float *)a4;
- (int)generateOrientationMap;
- (int)prepareImage:(__CVBuffer *)a3;
- (int)searchVanishingPointandDominantLine:(float *)a3 lineGroup:(id)a4 vanishingPoint:(CGPoint *)a5 vanishingPointConfidence:(float *)a6 dominantLine:(id *)a7;
- (int)voteVanishingPoint:(float *)a3;
- (void)averageOrientationResponses:(int)a3 withCurrentMap:(float *)a4;
- (void)dealloc;
- (void)extractUsefulAreaFrom:(float *)a3 to:(float *)a4 withOffset:(unint64_t)a5 stridePadded:(unint64_t)a6 width:(unint64_t)a7 height:(unint64_t)a8;
- (void)smoothFiltering:(float *)a3 width:(unint64_t)a4 height:(unint64_t)a5;
@end

@implementation VCPVanishingPointDetector

- (VCPVanishingPointDetector)initWithImage:(__CVBuffer *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VCPVanishingPointDetector;
  v4 = [(VCPVanishingPointDetector *)&v11 init];
  v5 = v4;
  if (v4)
  {
    if ([(VCPVanishingPointDetector *)v4 prepareImage:a3])
    {
      v6 = 0;
    }
    else
    {
      v6 = v5;
      if (v5->_validDimension)
      {
        v8 = [[VCPGaborFilter alloc] initWithNumberOfScales:5 numOfOrientations:8 width:31 height:31];
        gaborFilter = v5->_gaborFilter;
        v5->_gaborFilter = v8;

        v6 = v5;
      }
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)detect:(CGPoint *)a3 withConfidence:(float *)a4 dominantLine:(id *)a5
{
  v9 = [MEMORY[0x1E4F1CA48] array];
  if (!self->_validDimension)
  {
    a3->x = 0.0;
    a3->y = 0.0;
    *a4 = 0.0;
    objc_super v11 = [MEMORY[0x1E4F1CA60] dictionary];
    if (!v11)
    {
      int v10 = -108;
      goto LABEL_12;
    }
    v16.x = 0.0;
    v16.y = 0.0;
    v12 = NSStringFromPoint(v16);
    [v11 setObject:v12 forKey:@"Point0"];

    v17.x = 0.0;
    v17.y = 0.0;
    v13 = NSStringFromPoint(v17);
    [v11 setObject:v13 forKey:@"Point1"];

    [v11 setObject:&unk_1F15EAC48 forKey:@"Radius"];
    [v11 setObject:&unk_1F15EAC48 forKey:@"Theta"];
    [v11 setObject:&unk_1F15EB838 forKey:@"Length"];
    id v14 = v11;
    *a5 = v14;

    goto LABEL_10;
  }
  int v10 = [(VCPVanishingPointDetector *)self calculateOrientationResponses];
  if (!v10)
  {
    int v10 = [(VCPVanishingPointDetector *)self generateOrientationMap];
    if (!v10)
    {
      int v10 = [(VCPVanishingPointDetector *)self generateLineWeightMap:v9 weightMap:self->_edgeWeightMap];
      if (!v10)
      {
        int v10 = [(VCPVanishingPointDetector *)self voteVanishingPoint:self->_image];
        if (!v10)
        {
          int v10 = [(VCPVanishingPointDetector *)self searchVanishingPointandDominantLine:self->_image lineGroup:v9 vanishingPoint:a3 vanishingPointConfidence:a4 dominantLine:a5];
          if (!v10) {
LABEL_10:
          }
            int v10 = 0;
        }
      }
    }
  }
LABEL_12:

  return v10;
}

- (void)dealloc
{
  image = self->_image;
  if (image) {
    MEMORY[0x1C186C790](image, 0x1000C8052888210);
  }
  orientionMap = self->_orientionMap;
  if (orientionMap) {
    MEMORY[0x1C186C790](orientionMap, 0x1000C8052888210);
  }
  confidenceMap = self->_confidenceMap;
  if (confidenceMap) {
    MEMORY[0x1C186C790](confidenceMap, 0x1000C8052888210);
  }
  edgeWeightMap = self->_edgeWeightMap;
  if (edgeWeightMap) {
    MEMORY[0x1C186C790](edgeWeightMap, 0x1000C8052888210);
  }
  for (uint64_t i = 16; i != 80; i += 8)
  {
    uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + i);
    if (v8) {
      MEMORY[0x1C186C790](v8, 0x1000C8052888210);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPVanishingPointDetector;
  [(VCPVanishingPointDetector *)&v9 dealloc];
}

- (int)prepareImage:(__CVBuffer *)a3
{
  if (!a3) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  if (Height >= Width) {
    int v7 = Width;
  }
  else {
    int v7 = Height;
  }
  if (Width <= Height) {
    int v8 = Height;
  }
  else {
    int v8 = Width;
  }
  self->_validDimension = v7 > 127;
  if (v7 < 128) {
    return 0;
  }
  if ((float)((float)v8 / (float)v7) <= 2.0)
  {
    int v10 = (Width << 7) / v7;
    int v9 = (Height << 7) / v7;
  }
  else
  {
    int v9 = (Height << 8) / v8;
    if (Height < Width) {
      int v9 = 128;
    }
    int v10 = (Width << 8) / v8;
    if (Height >= Width) {
      int v10 = 128;
    }
  }
  uint64_t v12 = v10 & 0xFFFFFFFE;
  signed int v13 = v9 & 0xFFFFFFFE;
  CVPixelBufferRef pixelBuffer = 0;
  Scaler::Scale(&self->_scaler, a3, &pixelBuffer, v12, v9 & 0xFFFFFFFE, 875704422);
  int v11 = v14;
  if (!v14)
  {
    self->_width = (int)v12;
    self->_height = v13;
    self->_stride = (int)v12;
    self->_widthPadded = (int)v12 + 30;
    unint64_t v15 = v13 + 30;
    self->_heightPadded = v15;
    self->_int64_t stridePadded = (int)v12 + 30;
    self->_offset = 15 * ((int)v12 + 30) + 15;
    unint64_t v16 = ((int)v12 + 30) * v15;
    if (v16 >> 62) {
      size_t v17 = -1;
    }
    else {
      size_t v17 = 4 * v16;
    }
    v18 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    v19 = (float *)operator new[](v17, MEMORY[0x1E4FBA2D0]);
    self->_image = v19;
    v20 = (float *)operator new[](v17, v18);
    self->_edgeWeightMap = v20;
    unint64_t v21 = (int)v12 * (uint64_t)v13;
    if (v21 >> 62) {
      size_t v22 = -1;
    }
    else {
      size_t v22 = 4 * v21;
    }
    v23 = (float *)operator new[](v22, v18);
    self->_orientionMap = v23;
    v24 = (float *)operator new[](v22, v18);
    self->_confidenceMap = v24;
    if (v19) {
      BOOL v25 = v20 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (!v25 && v23 && v24 != 0)
    {
      uint64_t v28 = 0;
      v29 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
      while (1)
      {
        v30 = (float *)operator new[](v22, v29);
        self->_orientationResponses[v28] = v30;
        if (!v30) {
          break;
        }
        if (++v28 == 8)
        {
          CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)v55, pixelBuffer, 1uLL);
          int v11 = v55[0];
          if (!v55[0])
          {
            BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
            size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
            if (v13 < 1)
            {
              float v38 = 0.0;
              float v37 = 0.0;
            }
            else
            {
              int v34 = 0;
              v35 = &self->_image[self->_offset];
              int64_t v36 = 4 * self->_stridePadded;
              float v37 = 0.0;
              float v38 = 0.0;
              do
              {
                if ((int)v12 >= 1)
                {
                  for (uint64_t i = 0; i != v12; ++i)
                  {
                    LOBYTE(v33) = BaseAddressOfPlane[i];
                    float v33 = (float)LODWORD(v33);
                    v35[i] = v33;
                    float v38 = v38 + v33;
                    float v37 = v37 + (float)(v33 * v33);
                  }
                }
                BaseAddressOfPlane += BytesPerRowOfPlane;
                ++v34;
                v35 = (float *)((char *)v35 + v36);
              }
              while (v34 != v13);
            }
            int v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v55);
            if (!v11)
            {
              float v40 = (float)(v12 * v13);
              self->_pixelMean = v38 / v40;
              self->_pixelVar = sqrtf(fmaxf((float)(v37 / v40) - (float)(v38 / v40), 0.0));
              int64_t stridePadded = self->_stridePadded;
              v42 = &self->_image[15 * stridePadded];
              v43 = &v42[(self->_height - 1) * stridePadded];
              int v44 = 15;
              do
              {
                int64_t v45 = self->_stridePadded;
                v46 = &v42[-v45];
                v47 = &v43[v45];
                memcpy(v46, v42, 4 * v45);
                memcpy(v47, v43, 4 * self->_stridePadded);
                v43 = v47;
                v42 = v46;
                --v44;
              }
              while (v44);
              if (self->_heightPadded)
              {
                unint64_t v48 = 0;
                image = self->_image;
                v50 = &image[self->_widthPadded];
                v51 = v50 - 16;
                v52 = v50 - 15;
                v53 = image + 15;
                do
                {
                  vDSP_vfill(v53, image, 1, 0xFuLL);
                  vDSP_vfill(v51, v52, 1, 0xFuLL);
                  int64_t v54 = self->_stridePadded;
                  v53 += v54;
                  v51 += v54;
                  image += v54;
                  v52 += v54;
                  ++v48;
                }
                while (self->_heightPadded > v48);
              }
              int v11 = 0;
            }
          }
          CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)v55);
          goto LABEL_35;
        }
      }
    }
    int v11 = -108;
  }
LABEL_35:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
  return v11;
}

- (int)calculateOrientationResponses
{
  if (!self->_validDimension || !self->_gaborFilter) {
    return -50;
  }
  uint64_t v3 = 0;
  vDSP_Length v4 = self->_height * self->_width;
LABEL_4:
  vDSP_vclr(self->_orientationResponses[v3], 1, v4);
  uint64_t v5 = 0;
  while (1)
  {
    int result = [(VCPGaborFilter *)self->_gaborFilter processWithFilterScaleIdx:v5 orientIdx:v3 srcImage:self->_image outImage:self->_edgeWeightMap width:self->_widthPadded height:self->_heightPadded];
    if (result) {
      return result;
    }
    [(VCPVanishingPointDetector *)self extractUsefulAreaFrom:self->_edgeWeightMap to:self->_orientionMap withOffset:self->_offset stridePadded:self->_stridePadded width:self->_width height:self->_height];
    [(VCPVanishingPointDetector *)self averageOrientationResponses:v3 withCurrentMap:self->_orientionMap];
    uint64_t v5 = (v5 + 1);
    if (v5 == 5)
    {
      int result = 0;
      if (++v3 != 8) {
        goto LABEL_4;
      }
      return result;
    }
  }
}

- (void)extractUsefulAreaFrom:(float *)a3 to:(float *)a4 withOffset:(unint64_t)a5 stridePadded:(unint64_t)a6 width:(unint64_t)a7 height:(unint64_t)a8
{
  if (a8)
  {
    unint64_t v8 = a8;
    size_t v10 = 4 * a7;
    unint64_t v11 = 4 * a6;
    uint64_t v12 = &a3[a5];
    do
    {
      memcpy(a4, v12, v10);
      a4 = (float *)((char *)a4 + v10);
      uint64_t v12 = (float *)((char *)v12 + v11);
      --v8;
    }
    while (v8);
  }
}

- (void)averageOrientationResponses:(int)a3 withCurrentMap:(float *)a4
{
  float __B = 8.0;
  vDSP_Length v5 = self->_height * self->_width;
  v6 = self->_orientationResponses[a3];
  vDSP_vsdiv(a4, 1, &__B, a4, 1, v5);
  vDSP_vadd(v6, 1, a4, 1, v6, 1, v5);
}

- (int)generateOrientationMap
{
  orientionMap = self->_orientionMap;
  confidenceMap = self->_confidenceMap;
  vDSP_Length v5 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
  v6 = (const float *)operator new[](0x20uLL, MEMORY[0x1E4FBA2D0]);
  int v7 = (vDSP_Length *)operator new[](0x40uLL, v5);
  unint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    int v10 = -108;
    if (!v6) {
      goto LABEL_42;
    }
LABEL_41:
    MEMORY[0x1C186C790](v6, 0x1000C8052888210);
    goto LABEL_42;
  }
  unint64_t height = self->_height;
  if (!height)
  {
    int v10 = 0;
    goto LABEL_41;
  }
  unint64_t v12 = 0;
  LODWORD(v13) = 0;
  unint64_t width = self->_width;
  float v15 = 0.0;
  float v16 = 1.0;
  do
  {
    if (width)
    {
      unint64_t v43 = v12;
      unint64_t v17 = 0;
      uint64_t v13 = (int)v13;
      do
      {
        float v44 = v15;
        for (vDSP_Length i = 0; i != 8; ++i)
        {
          v6[i] = self->_orientationResponses[i][v13];
          v8[i] = i;
        }
        vDSP_vsorti(v6, v8, 0, 8uLL, -1);
        unint64_t v19 = v8[1];
        float v20 = v6[*v8];
        float v21 = vabds_f32(v20, v6[v8[7]]);
        float v22 = v6[v19];
        float v23 = vabds_f32(v22, v6[v8[6]]);
        float v24 = (float)((float)*v8 * 22.5) * 0.017453;
        float v25 = (float)((float)v19 * 22.5) * 0.017453;
        float v26 = cosf(v24);
        float v27 = (float)(cosf(v25) * v23) + (float)(v21 * v26);
        if (v27 == 0.0)
        {
          float v28 = 90.0;
        }
        else
        {
          float v29 = sinf(v24);
          float v30 = sinf(v25);
          float v28 = atanf((float)((float)(v30 * v23) + (float)(v21 * v29)) / v27) * 57.296;
        }
        float v15 = v44;
        if (v28 < 0.0) {
          float v28 = v28 + 180.0;
        }
        orientionMap[v17] = v28;
        float v31 = 0.0;
        for (uint64_t j = 2; j != 8; ++j)
          float v31 = v31 + v6[v8[j]];
        float v33 = 0.0;
        float v34 = (float)((float)(v20 + 0.0) + v22) * 0.5;
        if (v34 != 0.0) {
          float v33 = (float)((float)(v31 / -6.0) / v34) + 1.0;
        }
        confidenceMap[v17] = v33;
        if (v33 < v16) {
          float v16 = v33;
        }
        if (v33 > v44) {
          float v15 = v33;
        }
        ++v17;
        ++v13;
        unint64_t width = self->_width;
      }
      while (width > v17);
      unint64_t height = self->_height;
      unint64_t v12 = v43;
    }
    int64_t stride = self->_stride;
    orientionMap += stride;
    confidenceMap += stride;
    ++v12;
  }
  while (height > v12);
  if (height)
  {
    uint64_t v36 = 0;
    int v37 = 0;
    unint64_t v38 = self->_width;
    do
    {
      if (v38)
      {
        v39 = self->_confidenceMap;
        uint64_t v40 = v37;
        v37 += v38;
        unint64_t v41 = v38;
        do
        {
          if (v39[v40] < (float)((float)(v15 - v16) * 0.22)) {
            self->_orientionMap[v40] = -1.0;
          }
          ++v40;
          --v41;
        }
        while (v41);
      }
      ++v36;
    }
    while (v36 != height);
  }
  int v10 = 0;
  if (v6) {
    goto LABEL_41;
  }
LABEL_42:
  if (v8) {
    MEMORY[0x1C186C790](v8, 0x1000C8000313F17);
  }
  return v10;
}

- (void)smoothFiltering:(float *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v8 = -2;
  BOOL v9 = __F;
  uint64x2_t v16 = (uint64x2_t)vdupq_n_s64(5uLL);
  do
  {
    unint64_t v10 = 0;
    int32x2_t v11 = vdup_n_s32(v8 * v8);
    do
    {
      uint64x2_t v12 = (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v10), (int8x16_t)xmmword_1BC281320);
      unsigned __int8 v19 = vmovn_s64((int64x2_t)vcgtq_u64(v16, v12)).u8[0];
      uint64x2_t v20 = v12;
      int32x2_t v13 = vadd_s32(vdup_n_s32(v10), (int32x2_t)-2);
      float32x2_t v14 = vmul_f32(vcvt_f32_s32(vneg_s32(vmla_s32(v11, v13, v13))), (float32x2_t)0x3F0000003F000000);
      float v17 = v14.f32[0];
      float v18 = expf(v14.f32[1]);
      float v15 = expf(v17);
      if (v19) {
        v9[v10] = v15 / 2.5066;
      }
      if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(5uLL), v20)).i32[1]) {
        v9[v10 + 1] = v18 / 2.5066;
      }
      v10 += 2;
    }
    while (v10 != 6);
    ++v8;
    v9 += 5;
  }
  while (v8 != 3);
  vDSP_f5x5(a3, a5, a4, __F, a3);
}

- (int)voteVanishingPoint:(float *)a3
{
  unint64_t width = self->_width;
  unint64_t height = self->_height;
  if (width <= height) {
    unint64_t v7 = self->_height;
  }
  else {
    unint64_t v7 = self->_width;
  }
  vDSP_vclr(a3, 1, height * width);
  int v24 = height;
  if ((int)height >= 1)
  {
    int v25 = 0;
    LODWORD(v8) = 0;
    int v9 = (int)(float)((float)v7 * 0.35);
    float v10 = sqrt((double)((int)width * (int)width + (int)height * (int)height));
    do
    {
      if ((int)width >= 1)
      {
        int v11 = 0;
        uint64_t v8 = (int)v8;
        do
        {
          int v12 = -v9;
          if (v9 >= 1)
          {
            do
            {
              uint64_t v13 = (v12 + v25);
              if (v12 + v25 >= 0 && (int)v13 < v24)
              {
                int v14 = -v9;
                do
                {
                  int v15 = v11 + v14;
                  if (v11 + v14 >= 0 && v15 < (int)width)
                  {
                    float v16 = self->_orientionMap[self->_stride * v13 + v15];
                    if (v16 >= 0.0)
                    {
                      float v17 = sqrtf((float)(v12 * v12 + v14 * v14));
                      float v18 = v17 / v10;
                      if (v14 >= 0) {
                        float v20 = -(float)v12;
                      }
                      else {
                        float v20 = (float)v12;
                      }
                      float v21 = vabds_f32(acosf(v20 / v17) * 57.296, v16);
                      if (v21 <= 90.0) {
                        float v22 = v21;
                      }
                      else {
                        float v22 = 180.0 - v21;
                      }
                      float v19 = 5.0 / ((float)(v18 + v18) + 1.0);
                      if (v22 <= v19) {
                        a3[v8] = a3[v8]
                      }
                               + (float)((float)((float)(fabsf(sinf((float)(v16 + v16) * 0.017453)) + 1.0)
                                               * self->_edgeWeightMap[v8])
                                       / (float)((float)((float)(v18 * v22) * (float)(v18 * v22)) + 1.0));
                    }
                  }
                  v14 += 4;
                }
                while (v14 < v9);
              }
              v12 += 4;
            }
            while (v12 < v9);
          }
          ++v11;
          ++v8;
        }
        while (v11 != width);
      }
      ++v25;
    }
    while (v25 != v24);
  }
  return 0;
}

- (int)searchVanishingPointandDominantLine:(float *)a3 lineGroup:(id)a4 vanishingPoint:(CGPoint *)a5 vanishingPointConfidence:(float *)a6 dominantLine:(id *)a7
{
  v46 = a6;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v47 = a4;
  unint64_t width = self->_width;
  unint64_t height = self->_height;
  [(VCPVanishingPointDetector *)self smoothFiltering:a3 width:(int)width height:(int)height];
  if ((int)height < 1)
  {
    double v18 = 0.0;
    double v17 = 0.0;
  }
  else
  {
    int v13 = 0;
    int v14 = 0;
    double v15 = 0.0;
    float v16 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    do
    {
      if ((int)width >= 1)
      {
        float v19 = &a3[v13];
        double v20 = 0.0;
        int v21 = width;
        do
        {
          float v22 = *v19++;
          float v23 = v22;
          if (v22 > v16)
          {
            double v18 = v20;
            double v17 = v15;
            float v16 = v23;
          }
          double v20 = v20 + 1.0;
          --v21;
        }
        while (v21);
      }
      double v15 = v15 + 1.0;
      ++v14;
      v13 += width & ~((int)width >> 31);
    }
    while (v14 != height);
  }
  a5->x = v18 / (double)(int)width;
  a5->y = v17 / (double)(int)height;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v24 = v47;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
  double v26 = v18 - (float)((float)(int)width * 0.5);
  double v27 = v17 - (float)((float)(int)height * 0.5);
  if (v25)
  {
    uint64_t v28 = *(void *)v49;
    float v29 = 0.0;
    float v30 = 3.4028e38;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v49 != v28) {
          objc_enumerationMutation(v24);
        }
        v32 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        float v33 = objc_msgSend(v32, "objectForKey:", @"Radius", v46);
        [v33 floatValue];
        float v35 = v34;

        uint64_t v36 = [v32 objectForKey:@"Theta"];
        [v36 floatValue];
        float v38 = v37;

        __float2 v39 = __sincosf_stret(v38 * 0.017453);
        float v40 = v27 * v39.__sinval + v26 * v39.__cosval;
        float v41 = vabds_f32(v40, v35);
        if (v41 < v30)
        {
          *a7 = v32;
          float v30 = v41;
        }
        float v29 = v29 + v41;
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v25);
  }
  else
  {
    float v29 = 0.0;
  }

  if (![v24 count])
  {
    v42 = v46;
    float *v46 = 0.0;
LABEL_26:
    int v44 = 0;
    float *v42 = 1.0;
    goto LABEL_27;
  }
  v42 = v46;
  *(float *)&double v43 = v29 / (float)(unint64_t)[v24 count];
  int v44 = -[VCPVanishingPointDetector calculateConfidence:lineDistance:vaninshingPoint:vanishingPointConfidence:](self, "calculateConfidence:lineDistance:vaninshingPoint:vanishingPointConfidence:", v24, v46, v43, v26, v27);
  if (!v44) {
    goto LABEL_26;
  }
LABEL_27:

  return v44;
}

- (int)calculateConfidence:(id)a3 lineDistance:(float)a4 vaninshingPoint:(CGPoint)a5 vanishingPointConfidence:(float *)a6
{
  id v9 = a3;
  float v10 = hypotf((float)self->_width, (float)self->_height);
  int v11 = [v9 count];
  float v12 = expf((float)((float)(a4 / v10) * (float)(a4 / v10)) / -0.0648);
  *a6 = v12;
  if (v12 >= 0.4)
  {
    v58 = a6;
    float v13 = 0.2;
    if (v11 >= 3)
    {
      uint64_t v14 = 0;
      int v15 = 0;
      float v16 = 0.0;
      uint64_t v17 = 1;
      float v18 = 0.087266;
      do
      {
        uint64_t v19 = v14;
        double v20 = objc_msgSend(v9, "objectAtIndex:");
        int v21 = [v20 objectForKey:@"Radius"];
        [v21 floatValue];
        float v62 = v22;

        float v23 = [v20 objectForKey:@"Theta"];
        [v23 floatValue];
        float v25 = v24;

        double v26 = [v20 objectForKey:@"Theta"];
        [v26 floatValue];
        uint64_t v28 = (int)v27;

        BOOL v29 = [(VCPVanishingPointDetector *)self isVerticalOrHorizontal:v28];
        uint64_t v59 = v17;
        uint64_t v60 = v19 + 1;
        char v30 = v19 + 1 >= v11 || v29;
        if ((v30 & 1) == 0)
        {
          float v31 = v25 * 0.017453;
          __float2 v32 = __sincosf_stret(v25 * 0.017453);
          do
          {
            float v33 = [v9 objectAtIndex:v17];
            float v34 = [v33 objectForKey:@"Radius"];
            [v34 floatValue];
            float v36 = v35;

            float v37 = [v33 objectForKey:@"Theta"];
            [v37 floatValue];
            float v39 = v38;

            float v40 = [v33 objectForKey:@"Theta"];
            [v40 floatValue];
            float v41 = v20;
            uint64_t v43 = (int)v42;

            uint64_t v44 = v43;
            double v20 = v41;
            if (![(VCPVanishingPointDetector *)self isVerticalOrHorizontal:v44])
            {
              float v45 = v39 * 0.017453;
              float v46 = vabds_f32(v31, v45);
              if (v46 > v18 && v46 < 3.14159265)
              {
                float v47 = v18;
                float v48 = v16;
                float v49 = v10;
                float v50 = 1.0 / sinf(v31 - v45);
                __float2 v51 = __sincosf_stret(v45);
                float v52 = -(float)((float)((float)(v62 * v51.__sinval) - (float)(v36 * v32.__sinval)) * v50);
                float v53 = (float)((float)(v62 * v51.__cosval) - (float)(v36 * v32.__cosval)) * v50;
                float v10 = v49;
                float v54 = v48;
                float v18 = v47;
                float v55 = v52 - a5.x;
                float v56 = v53 - a5.y;
                float v16 = v54 + hypotf(v55, v56);
                ++v15;
              }
            }

            ++v17;
          }
          while ((int)v17 < v11 && v15 < 5);
        }

        uint64_t v14 = v60;
        if (v60 >= v11 - 1) {
          break;
        }
        uint64_t v17 = v59 + 1;
      }
      while (v15 < 5);
      float v13 = 0.2;
      if (v15) {
        float v13 = expf((float)((float)(v16 / (float)(v10 * (float)v15)) * (float)(v16 / (float)(v10 * (float)v15))) / -0.0512);
      }
    }
    float *v58 = v13;
  }

  return 0;
}

- (BOOL)isVerticalOrHorizontal:(int)a3
{
  int v3 = a3 % 180 + (a3 % 180 < 0 ? 0xB4 : 0);
  float v4 = (float)v3 * 0.017453;
  float v5 = (float)(180 - v3) * 0.017453;
  int v6 = 90 - v3;
  BOOL v7 = v3 >= 0x5A;
  int v8 = v3 - 90;
  if (!v7) {
    int v8 = v6;
  }
  float v9 = (float)v8 * 0.017453;
  BOOL v10 = v4 < 0.0087266;
  if (v5 < 0.0087266) {
    BOOL v10 = 1;
  }
  return v9 < 0.0087266 || v10;
}

- (int)generateLineWeightMap:(id)a3 weightMap:(float *)a4
{
  id v6 = a3;
  float v7 = (float)(self->_pixelVar * -0.03078) + 5.3225;
  float v8 = 5.0;
  if (v7 < 5.0) {
    float v8 = (float)(self->_pixelVar * -0.03078) + 5.3225;
  }
  if (v7 <= 1.0) {
    float v9 = 1.0;
  }
  else {
    float v9 = v8;
  }
  BOOL v10 = [[VCPEdgeDetector alloc] initWithImage:self->_image edgeMap:a4 width:self->_width height:self->_height widthExtension:15 heightExtension:15];
  LODWORD(v11) = 1153957888;
  LODWORD(v12) = 1161527296;
  uint64_t v43 = v10;
  *(float *)&double v13 = v9;
  int v14 = [(VCPEdgeDetector *)v10 detectWithSigma:v13 lowThreshold:v11 highThreshold:v12];
  if (!v14)
  {
    int v15 = [VCPHoughTransform alloc];
    LODWORD(v16) = 1.0;
    float v47 = a4;
    float v42 = [(VCPHoughTransform *)v15 initWithEdgeMap:a4 mapWidth:LODWORD(self->_width) mapHeight:LODWORD(self->_height) angleStep:v16];
    [(VCPHoughTransform *)v42 DetectLinesWithThreshold:70 output:v6];
    unint64_t height = self->_height;
    if (height)
    {
      LODWORD(v18) = 0;
      unint64_t width = self->_width;
      for (unint64_t i = 0; i < height; ++i)
      {
        if (width)
        {
          uint64_t v21 = 0;
          unint64_t v44 = i;
          float v45 = (float)(int)i;
          uint64_t v18 = (int)v18;
          float v22 = self;
          do
          {
            uint64_t v23 = 0;
            v47[v18] = 1.0;
            uint64_t v46 = v21;
            float v24 = (float)(int)v21 - (float)((float)width * 0.5);
            float v25 = v45 - (float)((float)v22->_height * 0.5);
            while (1)
            {
              uint64_t v26 = [v6 count];
              uint64_t v27 = v26 >= 5 ? 5 : v26;
              if (v27 <= v23) {
                break;
              }
              uint64_t v28 = [v6 objectAtIndex:v23];
              BOOL v29 = [v28 objectForKey:@"Radius"];
              [v29 floatValue];
              float v31 = v30;

              __float2 v32 = [v28 objectForKey:@"Theta"];
              [v32 floatValue];
              float v34 = v33;

              float v35 = [v28 objectForKey:@"Length"];
              uint64_t v36 = [v35 integerValue];
              float v37 = v34 * 0.017453;

              __float2 v38 = __sincosf_stret(v37);
              if (vabds_f32((float)(v25 * v38.__sinval) + (float)(v24 * v38.__cosval), v31) <= 2.0)
              {
                float v39 = fminf(expf((float)v36 / 320.0), 3.0);
                float v40 = (fabsf(sinf(v37 + v37)) + 1.0) * v39;
                v47[v18] = v40;
              }

              ++v23;
            }
            float v22 = self;
            uint64_t v21 = v46 + 1;
            ++v18;
            unint64_t width = self->_width;
          }
          while (width > v46 + 1);
          unint64_t height = self->_height;
          unint64_t i = v44;
        }
      }
    }

    int v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_gaborFilter, 0);
}

- (id).cxx_construct
{
  *((void *)self + 24) = 0;
  *((_DWORD *)self + 50) = 0;
  return self;
}

@end