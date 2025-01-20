@interface CIBilateralGridHash
- (BOOL)_hashMapFindKey:(unint64_t)a3 to:(unsigned int *)a4;
- (CIBilateralGridHash)initWithWidth:(int)a3 height:(int)a4 maxHashTableSize:(unint64_t)a5;
- (const)blur_indices:(int)a3 n_blur_indices:(int *)a4;
- (const)blur_table;
- (const)coord_indices;
- (const)coord_table;
- (const)hash_matrix;
- (const)hash_table;
- (const)interp_indices;
- (const)interp_pad;
- (const)interp_table;
- (int)_addHashKeyAtX:(int)a3 Y:(int)a4 key:(unint64_t)a5 isKeyExist:(BOOL *)a6;
- (int)_computeBilateralSpaceYCC444:(__IOSurface *)a3 region:(CGRect)a4 cropRect:(CGRect)a5 sigma_s:(int)a6 sigma_r_luma:(int)a7 sigma_r_chroma:(int)a8;
- (int)_createWithSurface:(__IOSurface *)a3 region:(CGRect)a4 cropRect:(CGRect)a5 sigma_s:(int)a6 sigma_r_luma:(int)a7 sigma_r_chroma:(int)a8;
- (int)countDims;
- (int)countVertices;
- (int)createWithSurface:(__IOSurface *)a3 region:(CGRect)a4 cropRect:(CGRect)a5 sigma_s:(int)a6 sigma_r_luma:(int)a7 sigma_r_chroma:(int)a8;
- (int)height;
- (int)sigma_r_chroma;
- (int)sigma_r_luma;
- (int)sigma_s;
- (int)width;
- (void)_computeBlurIndices;
- (void)_computeCoordIndices;
- (void)_computeInterpIndices;
- (void)_hashMapAddKey:(unint64_t)a3 andValue:(unsigned int)a4;
- (void)blur:(const float *)a3 pout:(float *)a4;
- (void)blur_n:(float *)a3;
- (void)blur_ones:(float *)a3;
- (void)clear;
- (void)dealloc;
- (void)normalize:(const float *)a3 pout:(float *)a4;
- (void)normalize_blur:(const float *)a3 pout:(float *)a4;
- (void)slice:(const float *)a3 outPixelBuffer:(__CVBuffer *)a4;
- (void)slice_trilinear:(__IOSurface *)a3 pin:(const float *)a4 pout:(__CVBuffer *)a5;
- (void)splat:(__CVBuffer *)a3 pout:(float *)a4;
- (void)splat_ones:(float *)a3;
- (void)splat_w_mul_x:(__CVBuffer *)a3 inPixelBuffer:(__CVBuffer *)a4 pout:(float *)a5;
@end

@implementation CIBilateralGridHash

- (int)countVertices
{
  return self->_hash_table_size;
}

- (int)countDims
{
  return self->_n_dims;
}

- (int)width
{
  return self->_width;
}

- (int)height
{
  return self->_height;
}

- (int)sigma_s
{
  return self->_sigma_s;
}

- (int)sigma_r_luma
{
  return self->_sigma_r_luma;
}

- (int)sigma_r_chroma
{
  return self->_sigma_r_chroma;
}

- (CIBilateralGridHash)initWithWidth:(int)a3 height:(int)a4 maxHashTableSize:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CIBilateralGridHash;
  v8 = [(CIBilateralGridHash *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_n_dims = 0;
    v8->_width = a3;
    v8->_height = a4;
    v8->_sigma_s = 0;
    *(void *)&v8->_sigma_r_luma = 0;
    v8->_max_hash_table_size = a5;
    v8->_hash_table_size = 0;
    size_t v10 = 4 * a4 * a3;
    v8->_hash_matrix_data = (unsigned int *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_hash_table = ($0E0703C619419D4AFA6DE823FFD8591F *)malloc_type_malloc(24 * a5, 0x1000040504FFAC1uLL);
    v9->_blur_indices = (unsigned int *)malloc_type_malloc(40 * a5, 0x100004052888210uLL);
    v9->_coord_indices = (unsigned int *)malloc_type_malloc(4 * a5 + 4, 0x100004052888210uLL);
    v9->_coord_table = (unsigned int *)malloc_type_malloc(v10, 0x100004052888210uLL);
    v9->_coord_indices_off = (unsigned int *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
    v9->_interp_indices = (unsigned int *)malloc_type_malloc(4 * a5 + 4, 0x100004052888210uLL);
    v9->_interp_table = (unsigned int *)malloc_type_malloc(20 * a5, 0x100004052888210uLL);
    v9->_interp_pad = (char *)malloc_type_malloc(5 * a5, 0x100004077774924uLL);
    v9->_hash_map = (BGHashMapContext *)BGHashMapCreate(a5);
    bzero(v9->_hash_matrix_data, v10);
  }
  return v9;
}

- (void)dealloc
{
  free(self->_hash_matrix_data);
  free(self->_hash_table);
  free(self->_blur_indices);
  free(self->_coord_indices);
  free(self->_coord_table);
  free(self->_coord_indices_off);
  free(self->_interp_indices);
  free(self->_interp_table);
  free(self->_interp_pad);
  BGHashMapRelease(self->_hash_map);
  v3.receiver = self;
  v3.super_class = (Class)CIBilateralGridHash;
  [(CIBilateralGridHash *)&v3 dealloc];
}

- (void)clear
{
  *(void *)&self->_sigma_r_luma = 0;
  self->_sigma_s = 0;
  self->_hash_table_size = 0;
  BGHashClear((uint64_t)self->_hash_map);
}

- (int)_createWithSurface:(__IOSurface *)a3 region:(CGRect)a4 cropRect:(CGRect)a5 sigma_s:(int)a6 sigma_r_luma:(int)a7 sigma_r_chroma:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v15 = a4.size.height;
  double v16 = a4.size.width;
  double v17 = a4.origin.y;
  double v18 = a4.origin.x;
  [(CIBilateralGridHash *)self clear];
  if (-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](self, "_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", a3, v10, v9, v8, v18, v17, v16, v15, x, y, width, height))
  {
    int v21 = self->_height * self->_width;
    self->_hash_table_size = 0;
    bzero(self->_hash_matrix_data, 4 * v21);
    return 1;
  }
  else
  {
    [(CIBilateralGridHash *)self _computeBlurIndices];
    [(CIBilateralGridHash *)self _computeCoordIndices];
    [(CIBilateralGridHash *)self _computeInterpIndices];
    return 0;
  }
}

- (int)createWithSurface:(__IOSurface *)a3 region:(CGRect)a4 cropRect:(CGRect)a5 sigma_s:(int)a6 sigma_r_luma:(int)a7 sigma_r_chroma:(int)a8
{
  uint64_t v8 = *(void *)&a7;
  uint64_t v9 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v14 = a4.size.height;
  double v15 = a4.size.width;
  double v16 = a4.origin.y;
  double v17 = a4.origin.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int result = -[CIBilateralGridHash _createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](self, "_createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", a3, *(void *)&a6, *(void *)&a7, *(void *)&a8);
  if (result)
  {
    int v21 = ci_logger_performance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 136446210;
      v23 = "-[CIBilateralGridHash createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]";
      _os_log_impl(&dword_193671000, v21, OS_LOG_TYPE_INFO, "%{public}s Using 3D bilateral grid hash instead of 5D.", (uint8_t *)&v22, 0xCu);
    }

    return -[CIBilateralGridHash _createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](self, "_createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", a3, v9, v8, 255, v17, v16, v15, v14, x, y, width, height);
  }
  return result;
}

- (void)splat:(__CVBuffer *)a3 pout:(float *)a4
{
  int v7 = [(CIBilateralGridHash *)self countVertices];
  int v8 = [(CIBilateralGridHash *)self width];
  int v9 = [(CIBilateralGridHash *)self height];
  CVPixelBufferLockBaseAddress(a3, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  bzero(a4, 4 * v7);
  if (v9 >= 1)
  {
    uint64_t v12 = 0;
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (v8 >= 1)
      {
        uint64_t v14 = 0;
        double v15 = &self->_hash_matrix_data[v12];
        do
        {
          a4[v15[v14]] = *(float *)&BaseAddressOfPlane[v14 * 4] + a4[v15[v14]];
          ++v14;
        }
        while (v8 != v14);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      v12 += v8;
    }
  }

  CVPixelBufferUnlockBaseAddress(a3, 0);
}

- (void)splat_w_mul_x:(__CVBuffer *)a3 inPixelBuffer:(__CVBuffer *)a4 pout:(float *)a5
{
  int v19 = [(CIBilateralGridHash *)self countVertices];
  int v9 = [(CIBilateralGridHash *)self width];
  int v10 = [(CIBilateralGridHash *)self height];
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  size_t v12 = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  uint64_t v14 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  bzero(a5, 4 * v19);
  if (v10 >= 1)
  {
    uint64_t v15 = 0;
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (v9 >= 1)
      {
        uint64_t v17 = 0;
        double v18 = &self->_hash_matrix_data[v15];
        do
        {
          a5[v18[v17]] = a5[v18[v17]] + (float)(*(float *)&BaseAddressOfPlane[v17 * 4] * *(float *)&v14[v17 * 4]);
          ++v17;
        }
        while (v9 != v17);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      v14 += v12;
      v15 += v9;
    }
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);

  CVPixelBufferUnlockBaseAddress(a4, 0);
}

- (void)slice:(const float *)a3 outPixelBuffer:(__CVBuffer *)a4
{
  int v7 = [(CIBilateralGridHash *)self width];
  int v8 = [(CIBilateralGridHash *)self height];
  CVPixelBufferLockBaseAddress(a4, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  if (v8 >= 1)
  {
    uint64_t v11 = 0;
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (v7 >= 1)
      {
        uint64_t v13 = 0;
        uint64_t v14 = &self->_hash_matrix_data[v11];
        do
        {
          *(float *)&BaseAddressOfPlane[v13 * 4] = a3[v14[v13]];
          ++v13;
        }
        while (v7 != v13);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      v11 += v7;
    }
  }

  CVPixelBufferUnlockBaseAddress(a4, 0);
}

- (void)slice_trilinear:(__IOSurface *)a3 pin:(const float *)a4 pout:(__CVBuffer *)a5
{
  int v9 = [(CIBilateralGridHash *)self width];
  int v10 = [(CIBilateralGridHash *)self height];
  uint32_t seed = 0;
  IOSurfaceLock(a3, 1u, &seed);
  CVPixelBufferLockBaseAddress(a5, 0);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a3);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a5, 0);
  BaseAddress = IOSurfaceGetBaseAddress(a3);
  BaseAddressOfPlane = (float *)CVPixelBufferGetBaseAddressOfPlane(a5, 0);
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (v9 >= 1)
      {
        uint64_t v17 = 0;
        float sigma_s = (float)self->_sigma_s;
        float sigma_r_luma = (float)self->_sigma_r_luma;
        float v20 = (float)((float)(int)i / sigma_s) - (float)(int)(float)((float)(int)i / sigma_s);
        hash_matrix_data = self->_hash_matrix_data;
        interp_indices = self->_interp_indices;
        do
        {
          LOBYTE(v15) = BaseAddress[4 * v17 + 2];
          float v23 = (float)((float)(int)v17 / sigma_s) - (float)(int)(float)((float)(int)v17 / sigma_s);
          uint64_t v24 = hash_matrix_data[v17 + i * v9];
          uint64_t v25 = interp_indices[v24];
          float v15 = (float)((float)LODWORD(v15) / sigma_r_luma) - (float)(int)(float)((float)LODWORD(v15) / sigma_r_luma);
          uint64_t v26 = interp_indices[(v24 + 1)];
          float v27 = (float)((float)(1.0 - v23) * (float)(1.0 - v20)) * (float)(1.0 - v15);
          float v28 = a4[v24] * v27;
          if (v25 < v26)
          {
            v29 = &self->_interp_table[v25];
            v30 = &self->_interp_pad[v25];
            uint64_t v31 = v26 - v25;
            do
            {
              unsigned int v33 = *v29++;
              uint64_t v32 = v33;
              LOBYTE(v33) = *v30++;
              char v34 = v33;
              if (v33) {
                float v35 = (float)((float)(int)v17 / sigma_s) - (float)(int)(float)((float)(int)v17 / sigma_s);
              }
              else {
                float v35 = 1.0 - v23;
              }
              if ((v34 & 2) != 0) {
                float v36 = (float)((float)(int)i / sigma_s) - (float)(int)(float)((float)(int)i / sigma_s);
              }
              else {
                float v36 = 1.0 - v20;
              }
              float v37 = v35 * v36;
              if ((v34 & 4) != 0) {
                float v38 = v15;
              }
              else {
                float v38 = 1.0 - v15;
              }
              float v39 = v38 * v37;
              float v28 = v28 + (float)(v39 * a4[v32]);
              float v27 = v27 + v39;
              --v31;
            }
            while (v31);
          }
          BaseAddressOfPlane[v17++] = v28 / v27;
        }
        while (v17 != v9);
      }
      BaseAddress += BytesPerRow;
      BaseAddressOfPlane = (float *)((char *)BaseAddressOfPlane + BytesPerRowOfPlane);
    }
  }
  IOSurfaceUnlock(a3, 1u, &seed);
  CVPixelBufferUnlockBaseAddress(a5, 0);
}

- (void)blur:(const float *)a3 pout:(float *)a4
{
  int v7 = [(CIBilateralGridHash *)self countDims];
  int v8 = [(CIBilateralGridHash *)self countVertices];
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    int v10 = a3;
    uint64_t v11 = a4;
    do
    {
      float v12 = *v10++;
      *v11++ = v12 * (float)(2 * v7);
      --v9;
    }
    while (v9);
    hash_table = self->_hash_table;
    do
    {
      if (v9) {
        unint64_t var4 = hash_table[(v9 - 1)].var4;
      }
      else {
        unint64_t var4 = 0;
      }
      unint64_t v15 = hash_table[v9].var4;
      if (var4 < v15)
      {
        float v16 = a4[v9];
        uint64_t v17 = &self->_blur_indices[var4];
        unint64_t v18 = v15 - var4;
        do
        {
          int v19 = *v17++;
          float v16 = a3[v19] + v16;
          a4[v9] = v16;
          --v18;
        }
        while (v18);
      }
      ++v9;
    }
    while (v9 != v8);
  }
}

- (void)normalize:(const float *)a3 pout:(float *)a4
{
  int v7 = [(CIBilateralGridHash *)self countVertices];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    p_var1 = &self->_hash_table->var1;
    do
    {
      float v10 = *a3++;
      float v11 = v10;
      int v12 = *p_var1;
      p_var1 += 6;
      *a4++ = v11 / (float)v12;
      --v8;
    }
    while (v8);
  }
}

- (void)normalize_blur:(const float *)a3 pout:(float *)a4
{
  int v7 = [(CIBilateralGridHash *)self countVertices];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    p_var2 = &self->_hash_table->var2;
    do
    {
      float v10 = *a3++;
      float v11 = v10;
      int v12 = *p_var2;
      p_var2 += 6;
      *a4++ = v11 / (float)v12;
      --v8;
    }
    while (v8);
  }
}

- (void)splat_ones:(float *)a3
{
  int v5 = [(CIBilateralGridHash *)self countVertices];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    p_var1 = &self->_hash_table->var1;
    do
    {
      int v8 = *p_var1;
      p_var1 += 6;
      *a3++ = (float)v8;
      --v6;
    }
    while (v6);
  }
}

- (void)blur_ones:(float *)a3
{
  int v5 = [(CIBilateralGridHash *)self countVertices];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    p_var2 = &self->_hash_table->var2;
    do
    {
      int v8 = *p_var2;
      p_var2 += 6;
      *a3++ = (float)v8;
      --v6;
    }
    while (v6);
  }
}

- (void)blur_n:(float *)a3
{
  int v5 = [(CIBilateralGridHash *)self countVertices];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    p_var3 = &self->_hash_table->var3;
    do
    {
      int v8 = *p_var3;
      p_var3 += 6;
      *a3++ = (float)v8;
      --v6;
    }
    while (v6);
  }
}

- (const)blur_indices:(int)a3 n_blur_indices:(int *)a4
{
  hash_table = self->_hash_table;
  if (a3 < 1) {
    unsigned int var4 = 0;
  }
  else {
    unsigned int var4 = hash_table[a3 - 1].var4;
  }
  *a4 = hash_table[a3].var4 - var4;
  return &self->_blur_indices[var4];
}

- (const)hash_table
{
  return self->_hash_table;
}

- (const)hash_matrix
{
  return self->_hash_matrix_data;
}

- (const)blur_table
{
  return self->_blur_indices;
}

- (const)coord_indices
{
  return self->_coord_indices;
}

- (const)coord_table
{
  return self->_coord_table;
}

- (const)interp_indices
{
  return self->_interp_indices;
}

- (const)interp_table
{
  return self->_interp_table;
}

- (const)interp_pad
{
  return self->_interp_pad;
}

- (int)_computeBilateralSpaceYCC444:(__IOSurface *)a3 region:(CGRect)a4 cropRect:(CGRect)a5 sigma_s:(int)a6 sigma_r_luma:(int)a7 sigma_r_chroma:(int)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v14 = a4.size.height;
  double v15 = a4.size.width;
  double v16 = a4.origin.x;
  if (IOSurfaceGetPixelFormat(a3) != 1111970369) {
    -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:].cold.6();
  }
  uint32_t seed = 0;
  if (IOSurfaceLock(a3, 1u, &seed)) {
    return 2;
  }
  BaseAddress = (char *)IOSurfaceGetBaseAddress(a3);
  IOSurfaceRef buffer = a3;
  if (BaseAddress)
  {
    int v21 = BaseAddress;
    size_t v22 = IOSurfaceGetWidth(a3);
    size_t v23 = IOSurfaceGetHeight(a3);
    size_t BytesPerRow = IOSurfaceGetBytesPerRow(a3);
    if (v15 != (double)v22) {
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]();
    }
    if (v14 != (double)v23) {
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]();
    }
    unint64_t v25 = (unint64_t)width;
    if (!(unint64_t)width || !(unint64_t)height) {
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]();
    }
    if (v22 < v25) {
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:].cold.4();
    }
    if (v23 < (unint64_t)height) {
      -[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:].cold.5();
    }
    size_t v26 = BytesPerRow;
    unint64_t v61 = (unint64_t)height;
    int v27 = 0;
    if (a8)
    {
      uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)a8);
      v28.i16[0] = vaddlv_u8(v28);
      if (v28.u32[0] <= 1uLL) {
        int v27 = (int)log2((double)a8);
      }
    }
    int v29 = 0;
    unint64_t v30 = a6;
    int v31 = a7;
    if (a6)
    {
      uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)a6);
      v32.i16[0] = vaddlv_u8(v32);
      if (v32.u32[0] <= 1uLL)
      {
        long double v33 = log2((double)a6);
        int v31 = a7;
        int v29 = (int)v33;
      }
    }
    int v34 = 0;
    double v35 = x - v16;
    double v36 = y - v16;
    int v37 = v29;
    if (v31)
    {
      uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
      v38.i16[0] = vaddlv_u8(v38);
      if (v38.u32[0] <= 1uLL)
      {
        long double v39 = log2((double)v31);
        int v31 = a7;
        int v34 = (int)v39;
      }
    }
    unint64_t v40 = (unint64_t)v35;
    unint64_t v41 = (unint64_t)v36;
    if (v27) {
      BOOL v42 = v37 == 0;
    }
    else {
      BOOL v42 = 1;
    }
    int v44 = !v42 && v34 != 0;
    self->_float sigma_s = a6;
    self->_float sigma_r_luma = v31;
    self->_sigma_r_chroma = a8;
    if (a8 == 255) {
      int v45 = 3;
    }
    else {
      int v45 = 5;
    }
    self->_n_dims = v45;
    size_t v62 = v26;
    if (a8 == 255 && v44)
    {
      unint64_t v46 = 0;
      uint64_t v47 = (uint64_t)&v21[4 * v40 + 2 + v26 * v41];
LABEL_35:
      unint64_t v48 = 0;
      v49 = (unsigned __int8 *)v47;
      while (1)
      {
        unsigned int v50 = *v49;
        v49 += 4;
        int v51 = [(CIBilateralGridHash *)self _addHashKeyAtX:v48 Y:v46 key:(v48 >> v37) | ((unint64_t)(v46 >> v37) << 8) | (v50 >> v34 << 16) isKeyExist:0];
        if (v51) {
          break;
        }
        if (v25 == ++v48)
        {
          int v19 = 0;
          ++v46;
          v47 += v62;
          if (v46 != v61) {
            goto LABEL_35;
          }
          goto LABEL_58;
        }
      }
    }
    else if (v44)
    {
      unint64_t v52 = 0;
      v53 = (unsigned __int8 *)&v21[4 * v40 + 1 + v26 * v41];
LABEL_43:
      unint64_t v54 = 0;
      v65 = v53;
      while (1)
      {
        int v51 = [(CIBilateralGridHash *)self _addHashKeyAtX:v54 Y:v52 key:(v54 >> v37) | ((unint64_t)((v52 >> v37) | (v53[1] >> v34 << 8) | (*v53 >> v27 << 16) | (*(v53 - 1) >> v27 << 24)) << 8) isKeyExist:0];
        if (v51) {
          break;
        }
        v53 += 4;
        if (v25 == ++v54)
        {
          int v19 = 0;
          ++v52;
          v53 = &v65[v62];
          if (v52 != v61) {
            goto LABEL_43;
          }
          goto LABEL_58;
        }
      }
    }
    else
    {
      unint64_t v55 = 0;
      if (a8 == 255) {
        v56 = hash3;
      }
      else {
        v56 = hash5;
      }
      v57 = (unsigned __int8 *)&v21[4 * v40 + 1 + v26 * v41];
LABEL_52:
      unint64_t v58 = 0;
      v60 = v57;
      while (1)
      {
        v66[0] = v58 / v30;
        v66[1] = v55 / v30;
        v66[2] = v57[1] / v31;
        v66[3] = *v57 / a8;
        v66[4] = *(v57 - 1) / a8;
        int v51 = [(CIBilateralGridHash *)self _addHashKeyAtX:v58 Y:v55 key:v56(v66) isKeyExist:0];
        if (v51) {
          break;
        }
        v57 += 4;
        ++v58;
        int v31 = a7;
        if (v25 == v58)
        {
          int v19 = 0;
          ++v55;
          v57 = &v60[v26];
          if (v55 != v61) {
            goto LABEL_52;
          }
          goto LABEL_58;
        }
      }
    }
    int v19 = v51;
  }
  else
  {
    int v19 = 3;
  }
LABEL_58:
  IOSurfaceUnlock(buffer, 1u, &seed);
  return v19;
}

- (void)_computeBlurIndices
{
  int v3 = [(CIBilateralGridHash *)self countDims];
  int v4 = [(CIBilateralGridHash *)self countVertices];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    uint64_t v18 = v4;
    do
    {
      hash_table = self->_hash_table;
      int v8 = &hash_table[v5];
      long long v19 = 2 * v3 * v8->var1;
      if (v3 >= 1)
      {
        int v9 = 0;
        uint64_t var0 = v8->var0.var0;
        do
        {
          uint64_t v11 = 0;
          char v12 = 1;
          do
          {
            char v13 = v12;
            uint64_t v14 = hash_shift(var0, v9, _computeBlurIndices_kOffsetTable[v11]);
            if (v14 != -1)
            {
              unsigned int v20 = 0;
              if ([(CIBilateralGridHash *)self _hashMapFindKey:v14 to:&v20])
              {
                self->_blur_indices[v6] = v20;
                v15.i32[1] = 1;
                v15.i32[0] = self->_hash_table[v20].var1;
                *((void *)&v16 + 1) = *((void *)&v19 + 1);
                *(int32x2_t *)&long long v16 = vadd_s32(v15, *(int32x2_t *)&v19);
                long long v19 = v16;
                ++v6;
              }
            }
            char v12 = 0;
            uint64_t v11 = 1;
          }
          while ((v13 & 1) != 0);
          ++v9;
        }
        while (v9 != v3);
      }
      uint64_t v17 = &hash_table[v5];
      *(void *)&v17->var2 = v19;
      v17->unsigned int var4 = v6;
      ++v5;
    }
    while (v5 != v18);
  }
}

- (void)_computeCoordIndices
{
  int v3 = [(CIBilateralGridHash *)self width];
  int v4 = [(CIBilateralGridHash *)self height];
  int v5 = [(CIBilateralGridHash *)self countVertices];
  bzero(self->_coord_indices_off, 4 * v5);
  if (v5 <= 0)
  {
    unsigned int v7 = 0;
    coord_indices = self->_coord_indices;
  }
  else
  {
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    coord_indices = self->_coord_indices;
    p_var1 = &self->_hash_table->var1;
    do
    {
      coord_indices[v6] = v7;
      unsigned int v10 = *p_var1;
      p_var1 += 6;
      v7 += v10;
      ++v6;
    }
    while (v5 != v6);
  }
  coord_indices[v5] = v7;
  if (v4 >= 1)
  {
    uint64_t v11 = 0;
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (v3 >= 1)
      {
        uint64_t v13 = 0;
        coord_table = self->_coord_table;
        coord_indices_off = self->_coord_indices_off;
        long long v16 = &self->_hash_matrix_data[v11];
        do
        {
          uint64_t v17 = v16[v13];
          coord_table[coord_indices_off[v17] + coord_indices[v17]] = (unsigned __int16)v13 | (i << 16);
          ++coord_indices_off[v17];
          ++v13;
        }
        while (v3 != v13);
      }
      v11 += v3;
    }
  }
}

- (void)_computeInterpIndices
{
  int v3 = [(CIBilateralGridHash *)self countVertices];
  if (v3 < 1)
  {
    unsigned int v5 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    unsigned int v5 = 0;
    do
    {
      self->_interp_indices[v4] = v5;
      unint64_t var0 = self->_hash_table[v4].var0.var0;
      unsigned __int8 v7 = 1;
      do
      {
        unsigned int v8 = v7;
        unint64_t v9 = hash_pad(v7);
        unsigned int v11 = 0;
        if ([(CIBilateralGridHash *)self _hashMapFindKey:v9 + var0 to:&v11])
        {
          interp_pad = self->_interp_pad;
          self->_interp_table[v5] = v11;
          interp_pad[v5++] = v7;
        }
        ++v7;
      }
      while (v8 < 7);
      ++v4;
    }
    while (v4 != v3);
  }
  self->_interp_indices[v3] = v5;
}

- (BOOL)_hashMapFindKey:(unint64_t)a3 to:(unsigned int *)a4
{
  return BGHashFindKey((uint64_t)self->_hash_map, a3, a4);
}

- (void)_hashMapAddKey:(unint64_t)a3 andValue:(unsigned int)a4
{
}

- (int)_addHashKeyAtX:(int)a3 Y:(int)a4 key:(unint64_t)a5 isKeyExist:(BOOL *)a6
{
  unsigned int v17 = 0;
  if ([(CIBilateralGridHash *)self _hashMapFindKey:a5 to:&v17])
  {
    hash_table = self->_hash_table;
    self->_hash_matrix_data[a3 + self->_width * a4] = v17;
    ++hash_table[v17].var1;
    if (a6)
    {
      BOOL v12 = 1;
LABEL_6:
      int result = 0;
      *a6 = v12;
      return result;
    }
    return 0;
  }
  unint64_t hash_table_size = self->_hash_table_size;
  if (self->_max_hash_table_size > hash_table_size)
  {
    uint64_t v14 = self->_hash_table;
    self->_unint64_t hash_table_size = hash_table_size + 1;
    int32x2_t v15 = &v14[hash_table_size];
    v15->var0.unint64_t var0 = a5;
    *(_OWORD *)&v15->var1 = xmmword_19394C940;
    self->_hash_matrix_data[a3 + self->_width * a4] = hash_table_size;
    -[CIBilateralGridHash _hashMapAddKey:andValue:](self, "_hashMapAddKey:andValue:", a5);
    BOOL v12 = 0;
    if (a6) {
      goto LABEL_6;
    }
    return 0;
  }
  return 4;
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.1()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 579, "region.size.width == surfaceW");
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.2()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 580, "region.size.height == surfaceH");
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.3()
{
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.4()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 590, "w <= surfaceW");
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.5()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 591, "h <= surfaceH");
}

- (void)_computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:.cold.6()
{
  __assert_rtn("-[CIBilateralGridHash _computeBilateralSpaceYCC444:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:]", "BilateralGridHash.m", 559, "t == kCVPixelFormatType_32BGRA");
}

@end