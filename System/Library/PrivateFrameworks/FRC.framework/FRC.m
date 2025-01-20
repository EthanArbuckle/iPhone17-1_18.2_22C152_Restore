uint64_t readData(FILE *__stream, void *__ptr, uint64_t a3, uint64_t a4)
{
  if (2 * a3 * a4 == fread(__ptr, 1uLL, 2 * a3 * a4, __stream)) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t writeData(FILE *__stream, void *__ptr, uint64_t a3, uint64_t a4)
{
  if (2 * a3 * a4 == fwrite(__ptr, 1uLL, 2 * a3 * a4, __stream)) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t readData32(FILE *__stream, void *__ptr, uint64_t a3, uint64_t a4)
{
  if (4 * a3 * a4 == fread(__ptr, 1uLL, 4 * a3 * a4, __stream)) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t writeData32(FILE *__stream, void *__ptr, uint64_t a3, uint64_t a4)
{
  if (4 * a3 * a4 == fwrite(__ptr, 1uLL, 4 * a3 * a4, __stream)) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t readBuffer(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (CVPixelBufferGetPixelFormatType(pixelBuffer) == 1278226536) {
    char v7 = 1;
  }
  else {
    char v7 = 3;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (Height)
  {
    v9 = BaseAddress;
    size_t v10 = Width << v7;
    unsigned int v11 = 1;
    while (fread(v9, 1uLL, v10, a1) == v10)
    {
      v9 += BytesPerRow;
      if (Height <= v11++) {
        goto LABEL_8;
      }
    }
    uint64_t v13 = 0xFFFFFFFFLL;
  }
  else
  {
LABEL_8:
    uint64_t v13 = 0;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return v13;
}

uint64_t writeBufferWithVerticalOffset(FILE *a1, CVPixelBufferRef pixelBuffer, unint64_t a3, uint64_t a4)
{
  if (!pixelBuffer) {
    return 0xFFFFFFFFLL;
  }
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  if (CVPixelBufferGetPixelFormatType(pixelBuffer) == 1380411457) {
    char v10 = 3;
  }
  else {
    char v10 = 1;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (a4 + a3 <= a3)
  {
    a4 = 0;
  }
  else
  {
    size_t v12 = Width << v10;
    uint64_t v13 = &BaseAddress[BytesPerRow * a3];
    while (fwrite(v13, 1uLL, v12, a1) == v12)
    {
      v13 += BytesPerRow;
      if (!--a4) {
        goto LABEL_13;
      }
    }
    a4 = 0xFFFFFFFFLL;
  }
LABEL_13:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return a4;
}

uint64_t writeBuffer(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  return writeBufferWithVerticalOffset(a1, pixelBuffer, 0, Height);
}

uint64_t writeBufferFlt32(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  if (!pixelBuffer) {
    return 0xFFFFFFFFLL;
  }
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  v8 = malloc_type_malloc(4 * Width, 0x100004052888210uLL);
  if (Height)
  {
    LODWORD(v9) = 0;
    while (1)
    {
      if (Width)
      {
        for (uint64_t i = 0; i != Width; ++i)
        {
          _H0 = *(_WORD *)&BaseAddress[2 * i];
          __asm { FCVT            S0, H0 }
          v8[i] = _S0;
        }
      }
      if (fwrite(v8, 1uLL, 4 * Width, a1) != 4 * Width) {
        break;
      }
      BaseAddress += BytesPerRow;
      size_t v9 = (v9 + 1);
      if (Height <= v9) {
        goto LABEL_9;
      }
    }
    uint64_t v17 = 0xFFFFFFFFLL;
  }
  else
  {
LABEL_9:
    free(v8);
    uint64_t v17 = 0;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return v17;
}

uint64_t readBufferInterleaved(FILE *a1, CVPixelBufferRef pixelBuffer, unsigned int a3)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  size_t v9 = 2 * a3 * Width * Height;
  char v10 = malloc_type_malloc(v9, 0xF9485E87uLL);
  if (fread(v10, 1uLL, v9, a1) > v9) {
    return 0xFFFFFFFFLL;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (unint64_t *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (a3 == 2) {
    interleave2((uint64_t)v10, (uint64_t)BaseAddress, Width, Height, BytesPerRow);
  }
  else {
    interleave4((unsigned __int16 *)v10, BaseAddress, Width, Height, BytesPerRow);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  free(v10);
  return 0;
}

uint64_t writeBufferInterlaeved(FILE *a1, CVPixelBufferRef pixelBuffer, unsigned int a3, unsigned int a4)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t v9 = CVPixelBufferGetHeight(pixelBuffer) / a3;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  size_t v11 = (Width * a4 * v9) << (a4 != 3);
  size_t v12 = malloc_type_malloc(v11, 0x220ADB24uLL);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(pixelBuffer);
  if (a3)
  {
    uint64_t v14 = (uint64_t)BaseAddress;
    while (1)
    {
      if (a4 == 2)
      {
        deinterleave2(v14, (uint64_t)v12, Width, v9, BytesPerRow, 2 * Width);
      }
      else if (a4 == 3)
      {
        deinterleave3(v14, (uint64_t)v12, Width, v9, BytesPerRow);
      }
      else
      {
        deinterleave4(v14, v12, Width, v9);
      }
      if (fwrite(v12, 1uLL, v11, a1) != v11) {
        return 0xFFFFFFFFLL;
      }
      v14 += BytesPerRow * v9;
      if (!--a3) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    free(v12);
    return 0;
  }
}

uint64_t loadTexture(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  if (a5)
  {
    unsigned int v9 = 1;
    do
    {
      memset(v12, 0, 24);
      v12[3] = a3;
      v12[4] = a4;
      v12[5] = 1;
      uint64_t result = objc_msgSend(a2, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", v12, 0);
      unint64_t v11 = v9++;
    }
    while (v11 < a5);
  }
  return result;
}

void saveTextureBufferFlt32(FILE *a1, void *a2, uint64_t a3, unint64_t a4, float a5)
{
  id v14 = a2;
  uint64_t v9 = [v14 contents];
  uint64_t v10 = 4 * a3;
  unint64_t v11 = (float *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
  if (a4)
  {
    LODWORD(v12) = 0;
    while (1)
    {
      if (a3)
      {
        uint64_t v13 = 0;
        do
        {
          v11[v13] = (float)*(int *)(v9 + 4 * v13) * a5;
          ++v13;
        }
        while (a3 != v13);
      }
      if (fwrite(v11, 1uLL, 4 * a3, a1) != v10) {
        break;
      }
      v9 += v10;
      unint64_t v12 = (v12 + 1);
      if (v12 >= a4) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    free(v11);
  }
}

void saveTextureArray(uint64_t a1, void *a2)
{
  uint64_t v16 = a1;
  id v2 = a2;
  uint64_t v3 = [v2 width];
  uint64_t v4 = [v2 height];
  unint64_t v5 = [v2 arrayLength];
  uint64_t v6 = [v2 width];
  uint64_t v7 = [v2 height] * v6;
  if ([v2 pixelFormat] == 55) {
    char v8 = 2;
  }
  else {
    char v8 = 1;
  }
  uint64_t v9 = v7 << v8;
  v18 = (char *)malloc_type_malloc((v7 << v8) * v5, 0x64D580CFuLL);
  if (v5)
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    unint64_t v12 = v18;
    do
    {
      memset(v19, 0, 24);
      v19[3] = v3;
      v19[4] = v4;
      v19[5] = 1;
      objc_msgSend(v2, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", v12, v3 << v8, (v4 * v3) << v8, v19, 0, v10, v16);
      v12 += v9;
      uint64_t v10 = v11;
    }
    while (v5 > v11++);
  }
  uint64_t v14 = objc_msgSend(v2, "pixelFormat", v16);
  char v15 = 1;
  if (v14 == 55) {
    char v15 = 2;
  }
  fwrite(v18, 1uLL, ((v5 * v4) << v15) * v3, v17);
  free(v18);
}

void loadTextureArray(FILE *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  size_t v9 = 2 * a3 * a4 * a5;
  id v10 = a2;
  unsigned int v11 = malloc_type_malloc(v9, 0x7F1BD4F3uLL);
  fread(v11, 1uLL, v9, a1);
  loadTexture((uint64_t)v11, v10, a3, a4, a5);

  free(v11);
}

void loadTextureInterleaved(FILE *a1, void *a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  id v9 = a2;
  uint64_t v10 = 2 * a4 * a3;
  unsigned int v11 = malloc_type_malloc(((a5 + 3) & 0xFFFFFFFFFFFFFFFCLL) * v10, 0xA787B125uLL);
  unint64_t v12 = (unint64_t *)malloc_type_malloc(((a5 + 3) & 0xFFFFFFFFFFFFFFFCLL) * v10, 0x4C9ADFF8uLL);
  fread(v11, 1uLL, v10 * a5, a1);
  uint64_t v17 = v12;
  interleave4((unsigned __int16 *)v11, v12, a3, a4, a5);
  if (a5 >= 4)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v12;
    unsigned int v15 = 1;
    do
    {
      memset(v18, 0, 24);
      v18[3] = a3;
      v18[4] = a4;
      v18[5] = 1;
      [v9 replaceRegion:v18 mipmapLevel:0 slice:v13 withBytes:v14 bytesPerRow:8 * a3 bytesPerImage:8 * a4 * a3];
      uint64_t v13 = v15;
      BOOL v16 = a5 >> 2 > v15++;
      v14 += a4 * a3;
    }
    while (v16);
  }
  free(v11);
  free(v17);
}

void saveTextureInterleaved(FILE *a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  id v8 = a2;
  uint64_t v9 = 8 * a4 * a3;
  BOOL v16 = (char *)malloc_type_malloc((((a5 + 3) & 0xFFFFFFFFFFFFFFFCLL) * v9) >> 2, 0xED963759uLL);
  uint64_t v14 = malloc_type_malloc(2 * a4 * a3 * a5, 0x6CB59B14uLL);
  if ((unint64_t)(a5 + 3) >= 4)
  {
    uint64_t v10 = 0;
    unsigned int v11 = v16;
    unsigned int v12 = 1;
    do
    {
      memset(v17, 0, 24);
      v17[3] = a3;
      v17[4] = a4;
      v17[5] = 1;
      [v8 getBytes:v11 bytesPerRow:8 * a3 bytesPerImage:8 * a4 * a3 fromRegion:v17 mipmapLevel:0 slice:v10];
      uint64_t v10 = v12;
      BOOL v13 = (unint64_t)(a5 + 3) >> 2 > v12++;
      v11 += v9;
    }
    while (v13);
  }
  deinterleave4((uint64_t)v16, v14, a3, a4);
  fwrite(v14, 1uLL, 2 * a3 * a4 * a5, a1);
}

uint64_t compareBuffers(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, int a6, float a7)
{
  unint64_t v28 = a4 * a3;
  if (a5)
  {
    uint64_t v11 = 0;
    unsigned int v12 = 0;
    float v29 = (float)(a4 * a3);
    float v31 = 0.0;
    do
    {
      if (a4)
      {
        uint64_t v13 = 0;
        unsigned int v14 = 0;
        unint64_t v32 = v11 * v28;
        float v15 = 0.0;
        float v16 = 3.4028e38;
        float v17 = 0.0;
        float v18 = 3.4028e38;
        float v19 = 0.0;
        do
        {
          if (a3)
          {
            uint64_t v20 = 0;
            unsigned int v21 = 0;
            unint64_t v22 = v32 + v13 * a3;
            do
            {
              uint64_t v23 = v22 + v20;
              if (a2) {
                float v24 = *(float *)(a2 + 4 * v23);
              }
              else {
                float v24 = 0.0;
              }
              float v25 = *(float *)(a1 + 4 * v23);
              float v26 = vabds_f32(v24, v25);
              if (a6)
              {
                if (v26 <= a7) {
                  printf("[%3d, %3d, %3d]\t%f,\t%f,\tdiff = %f\n");
                }
                else {
                  printf("[%3d, %3d, %3d]\t%f,\t%f,\tdiff = %f\t****\n");
                }
              }
              float v19 = fmaxf(v19, v26);
              float v18 = fminf(v18, v26);
              float v17 = fmaxf(v17, v25);
              float v16 = fminf(v16, v25);
              float v15 = v15 + (float)((float)(v24 - v25) * (float)(v24 - v25));
              uint64_t v20 = ++v21;
            }
            while (v21 < a3);
          }
          uint64_t v13 = ++v14;
        }
        while (v14 < a4);
      }
      else
      {
        float v18 = 3.4028e38;
        float v19 = 0.0;
        float v17 = 0.0;
        float v16 = 3.4028e38;
        float v15 = 0.0;
      }
      float v31 = v31 + v15;
      printf("[%3d]\t", v12);
      printf("Dynamic Range [%f, %f]", v16, v17);
      printf("\tMax Diff = %.6f, Min Diff = %.6f, MSE = %.6f\n", v19, v18, (float)(v15 / v29));
      uint64_t v11 = ++v12;
    }
    while (v12 < a5);
  }
  else
  {
    float v31 = 0.0;
  }
  return printf("[Total] MSE = %6.6f\n", (float)(v31 / (float)(v28 * a5)));
}

float compareBuffersFP16(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6, int a7, float a8)
{
  unint64_t v8 = a4;
  if (a5)
  {
    uint64_t v13 = 0;
    unsigned int v14 = 0;
    double v15 = a8;
    unint64_t v42 = a4 * a3;
    float v43 = (float)(a4 * a3);
    float v45 = 0.0;
    do
    {
      if (v8)
      {
        uint64_t v16 = 0;
        unsigned int v17 = 0;
        unint64_t v47 = v13 * v8;
        float v18 = 0.0;
        float v19 = 3.4028e38;
        float v20 = 0.0;
        float v21 = 3.4028e38;
        float v22 = 0.0;
        do
        {
          if (a3)
          {
            uint64_t v23 = 0;
            unsigned int v24 = 0;
            unint64_t v25 = (v16 + v47) * a6;
            do
            {
              uint64_t v26 = v23 + v25;
              if (a2)
              {
                _H0 = *(_WORD *)(a2 + 2 * v26);
                __asm { FCVT            S0, H0 }
              }
              else
              {
                _S0 = 0.0;
              }
              _H1 = *(_WORD *)(a1 + 2 * v26);
              __asm { FCVT            S10, H1 }
              float v35 = _S10 - _S0;
              if (a7)
              {
                __asm { FCVT            D1, H1 }
                if (fabs(v35) <= v15) {
                  printf("[%3d, %3d, %3d]\t%f,\t%f,\tdiff = %f\n");
                }
                else {
                  printf("[%3d, %3d, %3d]\t%f,\t%f,\tdiff = %f\t****\n");
                }
              }
              float v37 = fabsf(v35);
              float v22 = fmaxf(v22, v37);
              float v21 = fminf(v21, v37);
              float v20 = fmaxf(v20, _S10);
              float v19 = fminf(v19, _S10);
              float v18 = v18 + (float)(v35 * v35);
              uint64_t v23 = ++v24;
            }
            while (v24 < a3);
          }
          uint64_t v16 = ++v17;
          unint64_t v8 = a4;
        }
        while (v17 < a4);
      }
      else
      {
        float v21 = 3.4028e38;
        float v22 = 0.0;
        float v20 = 0.0;
        float v19 = 3.4028e38;
        float v18 = 0.0;
      }
      float v45 = v45 + v18;
      printf("[%3d]\t", v14);
      printf("Dynamic Range [%6.3f, %6.3f]", v19, v20);
      printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", v22, v21, (float)(v18 / v43));
      uint64_t v13 = ++v14;
    }
    while (v14 < a5);
    float v38 = v45;
    unint64_t v39 = v42;
  }
  else
  {
    unint64_t v39 = a4 * a3;
    float v38 = 0.0;
  }
  float v40 = v38 / (float)(v39 * a5);
  printf("[Total] MSE = %6.6f\n", v40);
  return v40;
}

float compareYUV420PixelBuffers(__CVBuffer *a1, __CVBuffer *a2)
{
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  unint64_t v5 = CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
  uint64_t v6 = CVPixelBufferGetBaseAddressOfPlane(a2, 0);
  uint64_t v7 = CVPixelBufferGetBaseAddressOfPlane(a2, 1uLL);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  float v13 = 0.0;
  if (HeightOfPlane)
  {
    LODWORD(v14) = 0;
    float v15 = 0.0;
    float v16 = 3.4028e38;
    float v17 = 0.0;
    float v18 = 0.0;
    float v19 = 3.4028e38;
    do
    {
      if (WidthOfPlane)
      {
        uint64_t v20 = 0;
        do
        {
          LOBYTE(v11) = BaseAddressOfPlane[v20];
          double v11 = (double)*(unint64_t *)&v11 / 255.0;
          *(float *)&double v11 = v11;
          LOBYTE(v12) = v6[v20];
          double v12 = (double)*(unint64_t *)&v12 / 255.0;
          *(float *)&double v12 = v12;
          float v21 = *(float *)&v11 - *(float *)&v12;
          *(float *)&double v12 = vabds_f32(*(float *)&v11, *(float *)&v12);
          float v17 = fmaxf(v17, *(float *)&v12);
          float v16 = fminf(v16, *(float *)&v12);
          float v18 = fmaxf(v18, *(float *)&v11);
          float v19 = fminf(v19, *(float *)&v11);
          float v15 = v15 + (float)(v21 * v21);
          ++v20;
        }
        while (WidthOfPlane > v20);
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      v6 += BytesPerRowOfPlane;
      size_t v14 = (v14 + 1);
    }
    while (HeightOfPlane > v14);
  }
  else
  {
    float v19 = 3.4028e38;
    float v18 = 0.0;
    float v16 = 3.4028e38;
    float v17 = 0.0;
    float v15 = 0.0;
  }
  float v22 = v15 / (float)(HeightOfPlane * WidthOfPlane);
  printf("[Y]\tDynamic Range [%6.3f, %6.3f]", v19, v18);
  float v50 = v22;
  printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", v17, v16, v22);
  size_t v23 = CVPixelBufferGetWidthOfPlane(a1, 1uLL);
  size_t v24 = CVPixelBufferGetHeightOfPlane(a1, 1uLL);
  size_t v25 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
  if (v24)
  {
    LODWORD(v28) = 0;
    float v29 = 0.0;
    float v30 = 3.4028e38;
    float v31 = 3.4028e38;
    float v32 = 0.0;
    float v33 = 3.4028e38;
    float v34 = 0.0;
    float v35 = 3.4028e38;
    float v36 = 0.0;
    double v37 = 0.0;
    float v13 = 0.0;
    do
    {
      if (v23)
      {
        unsigned int v38 = 1;
        unsigned int v39 = 1;
        do
        {
          LOBYTE(v37) = v5[v38 - 1];
          LOBYTE(v26) = v7[v38 - 1];
          double v37 = (double)*(unint64_t *)&v37 / 255.0;
          *(double *)&unint64_t v40 = (double)*(unint64_t *)&v26;
          double v41 = *(double *)&v40 / 255.0;
          LOBYTE(v40) = v5[v38];
          *(float *)&double v37 = v37;
          double v26 = (double)v40 / 255.0;
          *(float *)&double v26 = v26;
          LOBYTE(v27) = v7[v38];
          float v42 = v41;
          double v27 = (double)*(unint64_t *)&v27 / 255.0;
          *(float *)&double v27 = v27;
          double v43 = vabds_f32(*(float *)&v37, v42);
          double v44 = vabds_f32(*(float *)&v26, *(float *)&v27);
          float v32 = fmax(v32, v44);
          float v31 = fmin(v31, v44);
          float v34 = fmax(v34, *(float *)&v37);
          float v36 = fmax(v36, v43);
          float v29 = fmax(v29, *(float *)&v26);
          float v33 = fmin(v33, *(float *)&v37);
          float v35 = fmin(v35, v43);
          float v30 = fmin(v30, *(float *)&v26);
          BOOL v45 = v23 > v39++;
          v38 += 2;
        }
        while (v45);
        *(float *)&double v26 = *(float *)&v26 - *(float *)&v27;
        float v13 = (float)(*(float *)&v37 - v42) * (float)(*(float *)&v37 - v42);
        *(float *)&double v37 = *(float *)&v26 * *(float *)&v26;
      }
      v5 += v25;
      v7 += v25;
      size_t v28 = (v28 + 1);
    }
    while (v24 > v28);
  }
  else
  {
    float v35 = 3.4028e38;
    LODWORD(v37) = 0;
    float v36 = 0.0;
    float v34 = 0.0;
    float v33 = 3.4028e38;
    float v32 = 0.0;
    float v31 = 3.4028e38;
    float v29 = 0.0;
    float v30 = 3.4028e38;
  }
  float v46 = (float)(v24 * v23);
  float v47 = v13 / v46;
  float v48 = *(float *)&v37 / v46;
  printf("[U]\tDynamic Range [%6.3f, %6.3f]", v33, v34);
  printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", v36, v35, v47);
  printf("[V]\tDynamic Range [%6.3f, %6.3f]", v30, v29);
  printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", v32, v31, v48);
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return (float)(v50 + v47) + v48;
}

float compareCVPixelBuffers(__CVBuffer *a1, __CVBuffer *a2, unint64_t a3, int a4, float a5)
{
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (CVPixelBufferGetPixelFormatType(a1) == 1380411457) {
    Width *= 4;
  }
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a1);
  size_t v14 = CVPixelBufferGetBaseAddress(a2);
  float v15 = compareBuffersFP16((uint64_t)BaseAddress, (uint64_t)v14, Width, Height / a3, a3, BytesPerRow >> 1, a4, a5);
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return v15;
}

float compareBGRAPixelBuffers(__CVBuffer *a1, __CVBuffer *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  unint64_t v8 = (char *)CVPixelBufferGetBaseAddress(a2);
  int v30 = 0;
  uint64_t v29 = 0;
  int v28 = 0;
  uint64_t v27 = 0;
  int v26 = 0;
  uint64_t v25 = 2139095039;
  int v24 = 0;
  uint64_t v23 = 0;
  int v22 = 0;
  uint64_t v21 = 2139095039;
  if (Height)
  {
    LODWORD(v11) = 0;
    uint64_t v12 = 4 * (BytesPerRow >> 2);
    do
    {
      if (Width)
      {
        uint64_t v13 = 0;
        size_t v14 = v8;
        float v15 = BaseAddress;
        do
        {
          for (uint64_t i = 0; i != 3; ++i)
          {
            LOBYTE(v9) = v15[i];
            double v9 = (double)*(unint64_t *)&v9 / 255.0;
            LOBYTE(v10) = v14[i];
            *(float *)&double v9 = v9;
            double v10 = (double)*(unint64_t *)&v10 / 255.0;
            *(float *)&double v10 = v10;
            *((float *)&v29 + i) = *((float *)&v29 + i)
                                 + (float)((float)(*(float *)&v9 - *(float *)&v10)
                                         * (float)(*(float *)&v9 - *(float *)&v10));
            *(float *)&double v10 = vabds_f32(*(float *)&v9, *(float *)&v10);
            *((float *)&v25 + i) = fminf(*(float *)&v10, *((float *)&v25 + i));
            *((float *)&v27 + i) = fmaxf(*(float *)&v10, *((float *)&v27 + i));
            *((float *)&v21 + i) = fminf(*(float *)&v9, *((float *)&v21 + i));
            LODWORD(v10) = *((_DWORD *)&v23 + i);
            *(float *)&double v9 = fmaxf(*(float *)&v9, *(float *)&v10);
            *((_DWORD *)&v23 + i) = LODWORD(v9);
          }
          ++v13;
          v15 += 4;
          v14 += 4;
        }
        while (Width > v13);
      }
      size_t v11 = (v11 + 1);
      BaseAddress += v12;
      v8 += v12;
    }
    while (Height > v11);
  }
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  for (uint64_t j = 0; j != 3; ++j)
  {
    float v18 = *((float *)&v29 + j) / (float)(Height * Width);
    v20[j] = v18;
    printf("[%d]\tDynamic Range [%6.3f, %6.3f]", j, *((float *)&v21 + j), *((float *)&v23 + j));
    printf("\tMax Diff = %6.6f, Min Diff = %6.6f, MSE = %6.6f\n", *((float *)&v27 + j), *((float *)&v25 + j), v18);
  }
  return (float)((float)(v20[0] + v20[1]) + v20[2]) / 3.0;
}

uint64_t checkMemoryLeaks()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  pid_t v0 = getpid();
  snprintf(__str, 0x1F3uLL, "/usr/bin/leaks %d", v0);
  return system(__str);
}

void checkMemoryFootPrint()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  pid_t v0 = NSUserName();
  if ([v0 isEqualToString:@"root"])
  {
    pid_t v1 = getpid();
    snprintf(__str, 0x1F3uLL, "/usr/local/bin/jetsam_priority -p %d", v1);
    system(__str);
  }
}

uint64_t readYUVPlanar(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  size_t v7 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  uint64_t v21 = (char *)malloc_type_malloc((Height * Width) >> 1, 0x5C440904uLL);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  double v9 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  if (Height)
  {
    unsigned int v10 = 1;
    while (1)
    {
      uint64_t v11 = 1;
      if (fread(BaseAddressOfPlane, 1uLL, Width, a1) != Width) {
        break;
      }
      BaseAddressOfPlane += BytesPerRowOfPlane;
      if (Height <= v10++) {
        goto LABEL_5;
      }
    }
    uint64_t v13 = v21;
  }
  else
  {
LABEL_5:
    uint64_t v11 = 1;
    uint64_t v13 = v21;
    if (fread(v21, 1uLL, (Height * Width) >> 1, a1) == (Height * Width) >> 1)
    {
      if (Height >= 2)
      {
        LODWORD(v14) = 0;
        unint64_t v15 = Width >> 1;
        float v16 = v21;
        float v17 = &v21[(Height * Width) >> 2];
        do
        {
          if (Width >= 2)
          {
            uint64_t v18 = 0;
            unsigned int v19 = 1;
            do
            {
              v9[v19 - 1] = v16[v18];
              v9[v19] = v17[v18++];
              v19 += 2;
            }
            while (v15 > v18);
          }
          v16 += v15;
          v17 += v15;
          v9 += v7;
          size_t v14 = (v14 + 1);
        }
        while (Height >> 1 > v14);
      }
      uint64_t v11 = 0;
    }
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  free(v13);
  return v11;
}

uint64_t writeYUVPlanar(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t __nitems = (Height * Width) >> 1;
  uint64_t v6 = malloc_type_malloc(__nitems, 0x7492CA9CuLL);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  size_t v8 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  unsigned int v10 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  if (Height)
  {
    uint64_t v11 = v10;
    uint64_t v23 = v6;
    uint64_t v12 = 0;
    unsigned int v13 = 1;
    do
    {
      uint64_t v14 = 1;
      if (fwrite(&BaseAddressOfPlane[v12 * BytesPerRowOfPlane], 1uLL, Width, a1) != Width)
      {
        uint64_t v6 = v23;
        goto LABEL_14;
      }
      uint64_t v12 = v13;
    }
    while (Height > v13++);
    uint64_t v6 = v23;
    if (Height >= 2)
    {
      LODWORD(v16) = 0;
      unint64_t v17 = Width >> 1;
      uint64_t v18 = v23;
      size_t v19 = (size_t)v23 + ((Height * Width) >> 2);
      do
      {
        if (Width >= 2)
        {
          uint64_t v20 = 0;
          unsigned int v21 = 1;
          do
          {
            v18[v20] = v11[v21 - 1];
            *(unsigned char *)(v19 + v20++) = v11[v21];
            v21 += 2;
          }
          while (v17 > v20);
        }
        v18 += v17;
        v19 += v17;
        v11 += v8;
        size_t v16 = (v16 + 1);
      }
      while (Height >> 1 > v16);
    }
  }
  uint64_t v14 = 1;
  if (fwrite(v6, 1uLL, __nitems, a1) == __nitems)
  {
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    uint64_t v14 = 0;
  }
LABEL_14:
  free(v6);
  return v14;
}

uint64_t write64RGBAHalf(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (Height)
  {
    size_t v8 = BaseAddress;
    size_t v9 = 8 * Width;
    unsigned int v10 = 1;
    do
    {
      fwrite(v8, 1uLL, v9, a1);
      v8 += BytesPerRow;
    }
    while (Height > v10++);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  return 0;
}

uint64_t writeBGRA(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (Height)
  {
    size_t v8 = BaseAddress;
    size_t v9 = 4 * Width;
    unsigned int v10 = 1;
    do
    {
      fwrite(v8, 1uLL, v9, a1);
      v8 += BytesPerRow;
    }
    while (Height > v10++);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  return 0;
}

uint64_t readBGRA(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t Height = CVPixelBufferGetHeight(pixelBuffer);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (Height)
  {
    size_t v8 = BaseAddress;
    size_t v9 = 4 * Width;
    unsigned int v10 = 1;
    while (1)
    {
      uint64_t v11 = 1;
      if (fread(v8, 1uLL, v9, a1) != v9) {
        break;
      }
      v8 += BytesPerRow;
      if (Height <= v10++) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    return 0;
  }
  return v11;
}

uint64_t saveTensorBufferWithChannelOffset(__CVBuffer *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const char *a6, const char *a7)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  __sprintf_chk(__filename, 0, 0x100uLL, "%s/%s%ldx%ldx%ld.yuv", a7, a6, a2, a3, a4);
  printf("\tfile name = %s\n", __filename);
  if (CVPixelBufferGetWidth(a1) != a2) {
    saveTensorBufferWithChannelOffset_cold_3();
  }
  size_t v12 = a4 * a3;
  if (CVPixelBufferGetHeight(a1) < v12) {
    saveTensorBufferWithChannelOffset_cold_1();
  }
  unsigned int v13 = fopen(__filename, "wb");
  if (!v13) {
    saveTensorBufferWithChannelOffset_cold_2(__filename);
  }
  uint64_t v14 = v13;
  writeBufferWithVerticalOffset(v13, a1, a5 * a3, v12);
  return fclose(v14);
}

uint64_t saveTensorBuffer(__CVBuffer *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, const char *a6)
{
  return saveTensorBufferWithChannelOffset(a1, a2, a3, a4, 0, a5, a6);
}

uint64_t readYUV10bit(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  size_t v19 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  size_t v8 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  if (HeightOfPlane)
  {
    unsigned int v9 = 1;
    while (1)
    {
      uint64_t v10 = 1;
      if (fread(BaseAddressOfPlane, 1uLL, 2 * WidthOfPlane, a1) != 2 * WidthOfPlane) {
        break;
      }
      BOOL v11 = HeightOfPlane > v9++;
      BaseAddressOfPlane += 2 * (BytesPerRowOfPlane >> 1);
      if (!v11) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    size_t v12 = malloc_type_malloc((HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL, 0x2E69F676uLL);
    if (fread(v12, 1uLL, (HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL, a1) == ((HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL))
    {
      if (HeightOfPlane >= 2)
      {
        LODWORD(v13) = 0;
        int v14 = 0;
        size_t v15 = (HeightOfPlane * WidthOfPlane) >> 2;
        do
        {
          if (WidthOfPlane >= 2)
          {
            uint64_t v16 = 0;
            unsigned int v17 = 1;
            do
            {
              *(_WORD *)&v8[2 * v17 - 2] = v12[v14 + v16];
              *(_WORD *)&v8[2 * v17] = v12[v15 + v16++];
              v17 += 2;
            }
            while (WidthOfPlane >> 1 > v16);
            v14 += v16;
            v15 += v16;
          }
          v8 += 2 * (v19 >> 1);
          size_t v13 = (v13 + 1);
        }
        while (HeightOfPlane >> 1 > v13);
      }
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      free(v12);
      return 0;
    }
    else
    {
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      return 1;
    }
  }
  return v10;
}

uint64_t writeYUV10bit(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  id v2 = pixelBuffer;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v2, 0);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v2, 0);
  size_t v7 = CVPixelBufferGetBytesPerRowOfPlane(v2, 1uLL);
  size_t v8 = (HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL;
  unsigned int v9 = malloc_type_malloc(v8, 0x3FAEEA51uLL);
  CVPixelBufferLockBaseAddress(v2, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v2, 0);
  BOOL v11 = (char *)CVPixelBufferGetBaseAddressOfPlane(v2, 1uLL);
  if (HeightOfPlane)
  {
    size_t v12 = v11;
    uint64_t v23 = v2;
    size_t v13 = v7 >> 1;
    unsigned int v14 = 1;
    do
    {
      fwrite(BaseAddressOfPlane, 1uLL, 2 * WidthOfPlane, a1);
      BOOL v15 = HeightOfPlane > v14;
      BaseAddressOfPlane += 2 * (BytesPerRowOfPlane >> 1);
      ++v14;
    }
    while (v15);
    size_t v8 = (HeightOfPlane * WidthOfPlane) & 0xFFFFFFFFFFFFFFFELL;
    id v2 = v23;
    if (HeightOfPlane >= 2)
    {
      LODWORD(v16) = 0;
      int v17 = 0;
      size_t v18 = (HeightOfPlane * WidthOfPlane) >> 2;
      do
      {
        if (WidthOfPlane >= 2)
        {
          uint64_t v19 = 0;
          unsigned int v20 = 1;
          do
          {
            v9[v17 + v19] = *(_WORD *)&v12[2 * v20 - 2];
            v9[v18 + v19++] = *(_WORD *)&v12[2 * v20];
            v20 += 2;
          }
          while (WidthOfPlane >> 1 > v19);
          v17 += v19;
          v18 += v19;
        }
        v12 += 2 * v13;
        size_t v16 = (v16 + 1);
      }
      while (HeightOfPlane >> 1 > v16);
    }
  }
  uint64_t v21 = 1;
  if (fwrite(v9, 1uLL, v8, a1) == v8)
  {
    CVPixelBufferUnlockBaseAddress(v2, 0);
    free(v9);
    return 0;
  }
  return v21;
}

CVPixelBufferRef readPNG(uint64_t a1)
{
  v59[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v3 = [NSString stringWithUTF8String:a1];
    uint64_t v4 = [v2 fileURLWithPath:v3];

    unint64_t v5 = [MEMORY[0x1E4F1E050] imageWithContentsOfURL:v4];
    uint64_t v6 = v5;
    if (!v5)
    {
      NSLog(&cfstr_ReadpngErrorIn.isa);
      CVPixelBufferRef PixelBuffer = 0;
LABEL_21:

      return PixelBuffer;
    }
    BOOL v45 = v4;
    size_t v7 = [v5 properties];
    uint64_t v8 = [v6 colorSpace];
    unsigned int v9 = [v7 objectForKeyedSubscript:@"PixelWidth"];
    size_t v10 = [v9 integerValue];

    BOOL v11 = [v7 objectForKeyedSubscript:@"PixelHeight"];
    size_t v12 = [v11 integerValue];

    double v44 = v7;
    size_t v13 = [v7 objectForKeyedSubscript:@"Depth"];
    uint64_t v14 = [v13 integerValue];

    BOOL v15 = v14 == 8;
    size_t v16 = (CGColorSpace *)v8;
    if (v15) {
      OSType v17 = 1111970369;
    }
    else {
      OSType v17 = 1380411457;
    }
    CVPixelBufferRef PixelBuffer = createPixelBuffer(v10, v12, v17, 0);
    uint64_t v19 = *MEMORY[0x1E4F24A90];
    uint64_t v20 = *MEMORY[0x1E4F24AB0];
    uint64_t v21 = *MEMORY[0x1E4F24BC8];
    v58[0] = *MEMORY[0x1E4F24A90];
    v58[1] = v21;
    uint64_t v22 = *MEMORY[0x1E4F24BE0];
    uint64_t v42 = v20;
    v59[0] = v20;
    v59[1] = v22;
    uint64_t v40 = v22;
    uint64_t v23 = *MEMORY[0x1E4F24C18];
    v58[2] = *MEMORY[0x1E4F24C18];
    uint64_t v24 = *MEMORY[0x1E4F24C48];
    v59[2] = *MEMORY[0x1E4F24C48];
    CFDictionaryRef v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
    CGColorSpaceRef ColorSpaceFromAttachments = CVImageBufferCreateColorSpaceFromAttachments(v25);
    CGColorSpaceRef cf = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
    CGColorSpaceRef v48 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC48]);
    CGColorSpaceRef v47 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC28]);
    CGColorSpaceRef v46 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC58]);
    CFStringRef Name = CGColorSpaceGetName(v16);
    if (Name && CFEqual(Name, (CFTypeRef)*MEMORY[0x1E4F1DC98]))
    {
      v56[0] = v19;
      v56[1] = v21;
      uint64_t v27 = *MEMORY[0x1E4F24C10];
      v57[0] = v42;
      v57[1] = v27;
      v56[2] = v23;
      v57[2] = v24;
      CFDictionaryRef v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
    }
    else
    {
      CFDictionaryRef v41 = v25;
      uint64_t v29 = [NSString stringWithUTF8String:a1];
      int v30 = [v29 pathExtension];
      if ([v30 isEqual:@"png"])
      {
        uint64_t v31 = v16;
        char v32 = CGColorSpaceEqualToColorSpace();

        if ((v32 & 1) == 0)
        {
          size_t v16 = v31;
          CGColorSpaceRef v33 = ColorSpaceFromAttachments;
          if ((CGColorSpaceEqualToColorSpace() & 1) != 0 || CGColorSpaceEqualToColorSpace())
          {
            uint64_t v34 = *MEMORY[0x1E4F24AA8];
            v52[0] = v19;
            v52[1] = v21;
            uint64_t v35 = *MEMORY[0x1E4F24BD8];
            v53[0] = v34;
            v53[1] = v35;
            v52[2] = v23;
            v53[2] = *MEMORY[0x1E4F24C30];
            CFDictionaryRef v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
            CFDictionaryRef v25 = v41;
          }
          else
          {
            CFDictionaryRef v25 = v41;
            if ((CGColorSpaceEqualToColorSpace() & 1) == 0 && !CGColorSpaceEqualToColorSpace()) {
              goto LABEL_20;
            }
            v50[0] = v19;
            v50[1] = v21;
            v51[0] = v42;
            v51[1] = v40;
            v50[2] = v23;
            v51[2] = v24;
            CFDictionaryRef v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
            size_t v16 = ColorSpaceFromAttachments;
          }
LABEL_19:
          CMSetAttachments(PixelBuffer, v28, 1u);

LABEL_20:
          unsigned int v38 = [MEMORY[0x1E4F1E018] context];
          [v6 extent];
          objc_msgSend(v38, "render:toCVPixelBuffer:bounds:colorSpace:", v6, PixelBuffer, v16);
          CFRelease(cf);
          CFRelease(v48);
          CFRelease(v47);
          CFRelease(v46);
          CFRelease(v33);

          uint64_t v4 = v45;
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v31 = v16;
      }
      uint64_t v36 = *MEMORY[0x1E4F24AC0];
      v54[0] = v19;
      v54[1] = v21;
      uint64_t v37 = *MEMORY[0x1E4F24C10];
      v55[0] = v36;
      v55[1] = v37;
      v54[2] = v23;
      v55[2] = *MEMORY[0x1E4F24C40];
      CFDictionaryRef v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
      size_t v16 = v31;
      CFDictionaryRef v25 = v41;
    }
    CGColorSpaceRef v33 = ColorSpaceFromAttachments;
    goto LABEL_19;
  }
  NSLog(&cfstr_ReadpngErrorFi.isa);
  return 0;
}

void writePNG(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  CFDictionaryRef v22 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E4F1CF80], PixelFormatType);
  unint64_t v5 = [(__CFDictionary *)v22 objectForKeyedSubscript:*MEMORY[0x1E4F24E20]];
  int v6 = [v5 intValue];

  CFStringRef v7 = (const __CFString *)CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24BC8], 0);
  CFStringRef v8 = (const __CFString *)CMGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x1E4F24A90], 0);
  unsigned int v9 = (CFStringRef *)MEMORY[0x1E4F1DC58];
  if (!v7) {
    goto LABEL_5;
  }
  if (CFEqual(v8, (CFStringRef)*MEMORY[0x1E4F1ED00]))
  {
    BOOL v11 = (const __CFString **)MEMORY[0x1E4F1DB90];
LABEL_8:
    CFStringRef v12 = *v11;
LABEL_10:
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateWithName(v12);
    goto LABEL_11;
  }
  if (CFEqual(v7, (CFStringRef)*MEMORY[0x1E4F1EEF8]))
  {
    BOOL v11 = (const __CFString **)MEMORY[0x1E4F1DC48];
    goto LABEL_8;
  }
  if (CFEqual(v7, (CFStringRef)*MEMORY[0x1E4F24BE0]))
  {
    CFStringRef v12 = *v9;
    goto LABEL_10;
  }
LABEL_5:
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
LABEL_11:
  CGColorSpaceRef v13 = DeviceRGB;
  CGColorSpaceRef v14 = CGColorSpaceCreateWithName(*v9);
  BOOL v15 = (unsigned int *)MEMORY[0x1E4F1E2F0];
  if (v6 != 8 && !CGColorSpaceEqualToColorSpace()) {
    BOOL v15 = (unsigned int *)MEMORY[0x1E4F1E2E8];
  }
  uint64_t v16 = *v15;
  OSType v17 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:pixelBuffer options:0];
  size_t v18 = [MEMORY[0x1E4F1E018] context];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  uint64_t v20 = [v18 PNGRepresentationOfImage:v17 format:v16 colorSpace:v13 options:v19];
  CFRelease(v13);
  CFRelease(v14);
  id v21 = v20;
  fwrite((const void *)[v21 bytes], 1uLL, objc_msgSend(v21, "length"), a1);
}

void writeGrayscaldTiff(FILE *a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  CGColorSpaceRef DeviceGray = CGColorSpaceCreateDeviceGray();
  uint64_t v5 = *MEMORY[0x1E4F1E298];
  uint64_t v12 = *MEMORY[0x1E4F1E390];
  v13[0] = DeviceGray;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  CFStringRef v7 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a2 options:v6];
  CFStringRef v8 = [MEMORY[0x1E4F1E018] context];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  size_t v10 = [v8 TIFFRepresentationOfImage:v7 format:v5 colorSpace:DeviceGray options:v9];
  CFRelease(DeviceGray);
  id v11 = v10;
  fwrite((const void *)[v11 bytes], 1uLL, objc_msgSend(v11, "length"), a1);
}

__CVBuffer *create420vBufferFromFile(void *a1, size_t a2, size_t a3)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v5 = a1;
  CVPixelBufferRef PixelBuffer = createPixelBuffer(a2, a3, 0x34323066u, 0);
  id v7 = v5;
  CFStringRef v8 = (const char *)[v7 UTF8String];

  id v9 = fopen(v8, "rb");
  readYUVPlanar(v9, PixelBuffer);
  fclose(v9);
  uint64_t v10 = *MEMORY[0x1E4F24AB0];
  uint64_t v11 = *MEMORY[0x1E4F24BC8];
  v15[0] = *MEMORY[0x1E4F24A90];
  v15[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F24BE0];
  v16[0] = v10;
  v16[1] = v12;
  v15[2] = *MEMORY[0x1E4F24C18];
  v16[2] = *MEMORY[0x1E4F24C48];
  CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  CMSetAttachments(PixelBuffer, v13, 1u);

  return PixelBuffer;
}

__CVBuffer *createOpticalFlowTwoComponentFromFile(void *a1, size_t a2, size_t a3)
{
  id v5 = a1;
  CVPixelBufferRef PixelBuffer = createPixelBuffer(a2, a3, 0x32433068u, 0);
  id v7 = v5;
  CFStringRef v8 = (const char *)[v7 UTF8String];

  id v9 = fopen(v8, "rb");
  readBufferInterleaved(v9, PixelBuffer, 2u);
  fclose(v9);
  return PixelBuffer;
}

__CVBuffer *createOpticalFlowFromFile(void *a1, size_t a2, uint64_t a3)
{
  size_t v4 = 2 * a3;
  id v5 = a1;
  CVPixelBufferRef PixelBuffer = createPixelBuffer(a2, v4, 0x4C303068u, 0);
  id v7 = v5;
  CFStringRef v8 = (const char *)[v7 UTF8String];

  id v9 = fopen(v8, "rb");
  if (readBuffer(v9, PixelBuffer)) {
    return 0;
  }
  fclose(v9);
  return PixelBuffer;
}

__CVBuffer *readFlo(const char *a1)
{
  pid_t v1 = fopen(a1, "rb");
  float __ptr = 0.0;
  fread(&__ptr, 4uLL, 1uLL, v1);
  if (__ptr != 202020.0) {
    printf("Invalid .flo file");
  }
  uint64_t v26 = 0;
  size_t v27 = 0;
  fread(&v27, 4uLL, 1uLL, v1);
  fread(&v26, 4uLL, 1uLL, v1);
  uint64_t v3 = v26;
  size_t v2 = v27;
  uint64_t v4 = 2 * v26;
  pixelBuffer = createPixelBuffer(v27, 2 * v26, 0x4C303068u, 0);
  size_t v5 = CVPixelBufferGetBytesPerRow(pixelBuffer) >> 1;
  size_t v6 = v4 * v5;
  __src = malloc_type_malloc(v6, 0x1000040BDFB0063uLL);
  size_t __n = v6;
  uint64_t v24 = malloc_type_malloc(v6, 0x1000040BDFB0063uLL);
  if (v3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 2 * v5;
    uint64_t v10 = v24;
    id v9 = __src;
    do
    {
      size_t v11 = v2;
      uint64_t v12 = v9;
      for (uint64_t i = v10; v11; --v11)
      {
        fread(&__ptr, 4uLL, 1uLL, v1);
        _S0 = __ptr;
        __asm { FCVT            H0, S0 }
        *v12++ = LOWORD(_S0);
        fread(&__ptr, 4uLL, 1uLL, v1);
        _S0 = __ptr;
        __asm { FCVT            H0, S0 }
        *i++ = LOWORD(_S0);
      }
      ++v7;
      uint64_t v10 = (_WORD *)((char *)v10 + v8);
      id v9 = (_WORD *)((char *)v9 + v8);
    }
    while (v7 != v3);
  }
  fclose(v1);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  memcpy(BaseAddress, __src, __n);
  memcpy(&BaseAddress[__n], v24, __n);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  free(__src);
  free(v24);
  return pixelBuffer;
}

uint64_t writeFlo(FILE *a1, CVPixelBufferRef pixelBuffer)
{
  size_t Width = CVPixelBufferGetWidth(pixelBuffer);
  size_t v22 = CVPixelBufferGetHeight(pixelBuffer) >> 1;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  int __ptr = 1212500304;
  fwrite(&__ptr, 1uLL, 4uLL, a1);
  fwrite(&Width, 4uLL, 1uLL, a1);
  fwrite(&v22, 4uLL, 1uLL, a1);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  size_t v6 = v22;
  uint64_t v7 = malloc_type_malloc(8 * Width, 0x100004052888210uLL);
  if (v22)
  {
    size_t v8 = 0;
    id v9 = &BaseAddress[v6 * BytesPerRow];
    do
    {
      size_t v10 = Width;
      if (Width)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v7 + 1;
        do
        {
          _H0 = *(_WORD *)&BaseAddress[2 * v11];
          __asm { FCVT            S0, H0 }
          *(v12 - 1) = _S0;
          LOWORD(_S0) = *(_WORD *)&v9[2 * v11];
          __asm { FCVT            S0, H0 }
          *uint64_t v12 = _S0;
          v12 += 2;
          ++v11;
        }
        while (v10 != v11);
      }
      fwrite(v7, 1uLL, 8 * v10, a1);
      BaseAddress += BytesPerRow;
      v9 += BytesPerRow;
      ++v8;
    }
    while (v22 > v8);
  }
  free(v7);
  return CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
}

__CVBuffer *createTensorBufferFlowFromFile(void *a1, size_t a2, uint64_t a3, uint64_t a4)
{
  size_t v5 = a4 * a3;
  id v6 = a1;
  CVPixelBufferRef PixelBuffer = createPixelBuffer(a2, v5, 0x4C303068u, 0);
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  size_t v10 = fopen(v9, "rb");
  if (readBuffer(v10, PixelBuffer)) {
    return 0;
  }
  fclose(v10);
  return PixelBuffer;
}

unsigned __int16 *interleave4(unsigned __int16 *result, unint64_t *a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a4)
  {
    LODWORD(v5) = 0;
    do
    {
      if (a3)
      {
        unsigned int v6 = 1;
        uint64_t v7 = result;
        id v8 = a2;
        do
        {
          *v8++ = *v7 | ((unint64_t)v7[a4 * a3] << 16) | ((unint64_t)v7[2 * a4 * a3] << 32) | ((unint64_t)v7[3 * a4 * a3] << 48);
          unint64_t v9 = v6;
          ++v7;
          ++v6;
        }
        while (v9 < a3);
      }
      a2 = (unint64_t *)((char *)a2 + a5);
      unint64_t v5 = (v5 + 1);
      result += a3;
    }
    while (v5 < a4);
  }
  return result;
}

uint64_t deinterleave4(uint64_t result, _WORD *a2, unint64_t a3, unint64_t a4)
{
  if (a4)
  {
    LODWORD(v4) = 0;
    do
    {
      if (a3)
      {
        uint64_t v5 = 0;
        unsigned int v6 = a2;
        do
        {
          uint64_t v7 = *(void *)(result + 8 * v5);
          *unsigned int v6 = v7;
          v6[a4 * a3] = WORD1(v7);
          v6[2 * a4 * a3] = WORD2(v7);
          v6[3 * a4 * a3] = HIWORD(v7);
          ++v5;
          ++v6;
        }
        while (a3 > v5);
      }
      unint64_t v4 = (v4 + 1);
      a2 += a3;
    }
    while (v4 < a4);
  }
  return result;
}

uint64_t deinterleave3(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a4)
  {
    LODWORD(v5) = 0;
    do
    {
      if (a3)
      {
        uint64_t v6 = 0;
        do
        {
          int v7 = *(_DWORD *)(result + 4 * v6);
          *(unsigned char *)(a2 + v6) = v7;
          *(unsigned char *)(a2 + a4 * a3 + v6) = BYTE1(v7);
          *(unsigned char *)(a2 + 2 * a4 * a3 + v6++) = BYTE2(v7);
        }
        while (a3 > v6);
      }
      result += a5;
      a2 += a3;
      unint64_t v5 = (v5 + 1);
    }
    while (v5 < a4);
  }
  return result;
}

uint64_t interleave2(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  if (a4)
  {
    LODWORD(v5) = 0;
    uint64_t v6 = result + 2 * a4 * a3;
    uint64_t v7 = 2 * a3;
    do
    {
      if (a3)
      {
        uint64_t v8 = 0;
        do
        {
          *(_DWORD *)(a2 + 4 * v8) = *(unsigned __int16 *)(result + 2 * v8) | (*(unsigned __int16 *)(v6 + 2 * v8) << 16);
          ++v8;
        }
        while (a3 > v8);
      }
      unint64_t v5 = (v5 + 1);
      a2 += 4 * (a5 >> 2);
      v6 += v7;
      result += v7;
    }
    while (v5 < a4);
  }
  return result;
}

uint64_t deinterleave2(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  if (a4)
  {
    LODWORD(v6) = 0;
    uint64_t v7 = a2 + 2 * a4 * (a6 >> 1);
    uint64_t v8 = 2 * (a6 >> 1);
    do
    {
      if (a3)
      {
        uint64_t v9 = 0;
        do
        {
          int v10 = *(_DWORD *)(result + 4 * v9);
          *(_WORD *)(a2 + 2 * v9) = v10;
          *(_WORD *)(v7 + 2 * v9++) = HIWORD(v10);
        }
        while (a3 > v9);
      }
      unint64_t v6 = (v6 + 1);
      v7 += v8;
      a2 += v8;
      result += 4 * (a5 >> 2);
    }
    while (v6 < a4);
  }
  return result;
}

id findIRAPs(void *a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v40 = [MEMORY[0x1E4F1CA48] array];
  size_t v2 = [v1 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
  uint64_t v3 = [v2 objectAtIndexedSubscript:0];

  uint64_t v35 = v1;
  unint64_t v4 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v1 error:0];
  uint64_t v34 = (void *)v3;
  unint64_t v5 = [MEMORY[0x1E4F16398] assetReaderSampleReferenceOutputWithTrack:v3];
  [v4 addOutput:v5];
  CGColorSpaceRef v33 = v4;
  [v4 startReading];
  uint64_t v6 = MEMORY[0x1E4F1F9F8];
  CMTimeValue v7 = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags v8 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTime v52 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA08];
  double v44 = v5;
  uint64_t v9 = [v5 copyNextSampleBuffer];
  if (v9)
  {
    int v10 = (opaqueCMSampleBuffer *)v9;
    CMTimeScale v11 = *(_DWORD *)(v6 + 8);
    CMTimeEpoch v12 = *(void *)(v6 + 16);
    CMTimeFlags flags = v8;
    CMTimeValue v39 = v7;
    CMTimeValue value = v7;
    CMTimeScale v37 = v11;
    CMTimeFlags v38 = v8;
    CMTimeScale timescale = v11;
    CMTimeEpoch v36 = v12;
    CMTimeEpoch epoch = v12;
    while (1)
    {
      if (!CMSampleBufferGetNumSamples(v10)) {
        goto LABEL_32;
      }
      memset(&v51, 0, sizeof(v51));
      CMSampleBufferGetPresentationTimeStamp(&v51, v10);
      CGColorSpaceRef v14 = CMSampleBufferGetSampleAttachmentsArray(v10, 1u);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (!v16) {
        goto LABEL_13;
      }
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v48 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v21 = [v20 objectForKeyedSubscript:@"HEVCSyncSampleNALUnitType"];
          if (v21)
          {
            uint64_t v26 = v21;
            int v27 = [v21 intValue];

            if (v27 == 19 || v27 == 21)
            {
              if (flags)
              {
                time1.CMTimeValue value = value;
                time1.CMTimeScale timescale = timescale;
                time1.CMTimeFlags flags = flags;
                time1.CMTimeEpoch epoch = epoch;
                uint64_t v29 = [MEMORY[0x1E4F29238] valueWithCMTime:&time1];
                [v40 addObject:v29];
              }
              CMTimeValue value = v51.value;
              CMTimeFlags flags = v51.flags;
              CMTimeScale timescale = v51.timescale;
              CMTime v52 = v51;
              CMTimeEpoch epoch = v51.epoch;
              goto LABEL_31;
            }
            if (v27 != 20) {
              goto LABEL_14;
            }
LABEL_29:
            uint64_t v24 = (void *)MEMORY[0x1E4F29238];
            *(_OWORD *)&time1.CMTimeValue value = *(_OWORD *)&v51.value;
            CMTimeEpoch v25 = v51.epoch;
            goto LABEL_30;
          }
          size_t v22 = [v20 objectForKeyedSubscript:@"DependsOnOthers"];
          char v23 = [v22 BOOLValue];

          if ((v23 & 1) == 0)
          {

            goto LABEL_29;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v17) {
          continue;
        }
        break;
      }
LABEL_13:

LABEL_14:
      CMTime time1 = v51;
      CMTime time2 = v52;
      if (CMTimeCompare(&time1, &time2) == -1)
      {
        CMTime time1 = v51;
        time2.CMTimeValue value = value;
        time2.CMTimeScale timescale = timescale;
        time2.CMTimeFlags flags = flags;
        time2.CMTimeEpoch epoch = epoch;
        if (CMTimeCompare(&time1, &time2) == -1)
        {
          CMTimeValue value = v51.value;
          CMTimeFlags flags = v51.flags;
          CMTimeScale timescale = v51.timescale;
          CMTimeEpoch epoch = v51.epoch;
        }
      }
      else if (flags)
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F29238];
        time1.CMTimeValue value = value;
        time1.CMTimeScale timescale = timescale;
        time1.CMTimeFlags flags = flags;
        CMTimeEpoch v25 = epoch;
LABEL_30:
        time1.CMTimeEpoch epoch = v25;
        int v30 = [v24 valueWithCMTime:&time1];
        [v40 addObject:v30];

        CMTimeEpoch epoch = v36;
        CMTimeFlags flags = v38;
        CMTimeScale timescale = v37;
        CMTimeValue value = v39;
      }
LABEL_31:

LABEL_32:
      CFRelease(v10);
      int v10 = (opaqueCMSampleBuffer *)[v44 copyNextSampleBuffer];
      if (!v10)
      {
        if (flags) {
          goto LABEL_34;
        }
        goto LABEL_35;
      }
    }
  }
  CMTimeValue value = v7;
  if (v8)
  {
LABEL_34:
    uint64_t v31 = [NSNumber numberWithLongLong:value];
    [v40 addObject:v31];
  }
LABEL_35:

  return v40;
}

float calcNormalizationParams@<S0>(unint64_t a1@<X0>, uint64_t a2@<X8>, float a3@<S0>, float a4@<S1>, float a5@<S2>, float a6@<S3>)
{
  float v6 = (float)(2 * a1);
  float v7 = (float)(a3 + a5) / v6;
  float v8 = (float)((float)(a4 + a6) / v6) - (float)(v7 * v7);
  if (v8 <= 0.0) {
    float v8 = 0.00001;
  }
  *(_DWORD *)(a2 + 24) = 0;
  *(float *)a2 = v7;
  *(float *)(a2 + 4) = 1.0 / fmaxf(sqrtf(v8), 0.1);
  float v9 = (float)a1;
  float v10 = a3 / (float)a1;
  float v11 = (float)(a4 / (float)a1) - (float)(v10 * v10);
  if (v11 <= 0.0) {
    float v11 = 0.00001;
  }
  float v12 = fmaxf(sqrtf(v11), 0.1);
  float v13 = a5 / v9;
  *(float *)(a2 + 8) = v10;
  *(float *)(a2 + 12) = v13;
  float v14 = (float)(a6 / v9) - (float)(v13 * v13);
  if (v14 <= 0.0) {
    float v14 = 0.00001;
  }
  float result = fmaxf(sqrtf(v14), 0.1);
  *(float *)(a2 + 16) = v12;
  *(float *)(a2 + 20) = result;
  return result;
}

BOOL isTextureYUV420(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 pixelFormat] == 500
    || [v1 pixelFormat] == 505
    || [v1 pixelFormat] == 508;

  return v2;
}

void sub_1DC839528(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1DC83A0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t FRCGetReverseRotation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1DC85A440[a1 - 1];
  }
}

uint64_t *swapWidthAndHeight(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *float result = *a2;
  *a2 = v2;
  return result;
}

void FRCGetInputFrameSizeForUsage(__int16 a1, uint64_t *a2, uint64_t *a3)
{
  if (!(!v4 & v3))
  {
    switch(a1 & 0xFFF)
    {
      case 0:
        uint64_t v9 = 1440;
        goto LABEL_31;
      case 1:
        uint64_t v13 = 1920;
        goto LABEL_27;
      case 2:
        uint64_t v14 = 960;
        goto LABEL_35;
      case 3:
        uint64_t v10 = 720;
        goto LABEL_33;
      case 4:
        uint64_t v9 = 1920;
        goto LABEL_31;
      case 5:
        uint64_t v10 = 960;
        goto LABEL_33;
      case 6:
        uint64_t v14 = 1280;
LABEL_35:
        *a2 = v14;
        uint64_t v8 = 720;
        goto LABEL_75;
      case 7:
        *a2 = 1280;
        uint64_t v8 = 960;
        goto LABEL_75;
      case 8:
        *a2 = 640;
        uint64_t v8 = 480;
        goto LABEL_75;
      case 9:
        uint64_t v12 = 640;
        goto LABEL_69;
      case 0xA:
        uint64_t v11 = 480;
        goto LABEL_63;
      case 0xB:
        *a2 = 320;
        uint64_t v8 = 180;
        goto LABEL_75;
      case 0xC:
        *a2 = 320;
        uint64_t v8 = 240;
        goto LABEL_75;
      case 0xD:
        uint64_t v15 = 3840;
        goto LABEL_45;
      case 0xE:
        *a2 = 4096;
        uint64_t v8 = 2048;
        goto LABEL_75;
      case 0xF:
        uint64_t v15 = 4096;
LABEL_45:
        *a2 = v15;
        uint64_t v8 = 2160;
        goto LABEL_75;
      case 0x10:
        *a2 = 4096;
        uint64_t v8 = 2304;
        goto LABEL_75;
      case 0x11:
        *a2 = 4096;
        uint64_t v8 = 3112;
        goto LABEL_75;
      case 0x12:
        uint64_t v16 = 7680;
        goto LABEL_56;
      case 0x13:
      case 0x14:
      case 0x1A:
        goto LABEL_78;
      case 0x15:
        uint64_t v17 = 5120;
        goto LABEL_53;
      case 0x16:
        *a2 = 5120;
        uint64_t v8 = 4272;
        goto LABEL_75;
      case 0x17:
        *a2 = 5744;
        uint64_t v8 = 3024;
        goto LABEL_75;
      case 0x18:
        uint64_t v17 = 5760;
LABEL_53:
        *a2 = v17;
        uint64_t v8 = 2880;
        goto LABEL_75;
      case 0x19:
        *a2 = 6144;
        uint64_t v8 = 3456;
        goto LABEL_75;
      case 0x1B:
        uint64_t v16 = 0x2000;
LABEL_56:
        *a2 = v16;
        uint64_t v8 = 4320;
        goto LABEL_75;
      case 0x1C:
        *a2 = 6560;
        uint64_t v8 = 3104;
        goto LABEL_75;
      case 0x1D:
        uint64_t v8 = 2208;
        goto LABEL_74;
      default:
        JUMPOUT(0);
    }
  }
  switch(a1 & 0xFFF)
  {
    case 'd':
      *a2 = 1440;
      uint64_t v8 = 464;
      goto LABEL_75;
    case 'e':
      *a2 = 1920;
      uint64_t v8 = 584;
      goto LABEL_75;
    case 'f':
      *a2 = 960;
      uint64_t v8 = 424;
      goto LABEL_75;
    case 'g':
      uint64_t v11 = 360;
LABEL_63:
      *a2 = v11;
      uint64_t v8 = 270;
      goto LABEL_75;
    case 'h':
      uint64_t v12 = 480;
LABEL_69:
      *a2 = v12;
      uint64_t v8 = 360;
      goto LABEL_75;
    case 'i':
      *a2 = 2048;
      uint64_t v8 = 1024;
      goto LABEL_75;
    case 'j':
      uint64_t v9 = 2048;
LABEL_31:
      *a2 = v9;
      uint64_t v8 = 1080;
      goto LABEL_75;
    case 'k':
      *a2 = 2048;
      uint64_t v8 = 1152;
      goto LABEL_75;
    case 'l':
      *a2 = 2048;
      uint64_t v8 = 1556;
      goto LABEL_75;
    case 'm':
      *a2 = 1024;
      uint64_t v8 = 512;
      goto LABEL_75;
    case 'n':
      uint64_t v13 = 2560;
      goto LABEL_27;
    case 'o':
      *a2 = 2560;
      uint64_t v8 = 2136;
      goto LABEL_75;
    case 'p':
      *a2 = 2872;
      uint64_t v8 = 1512;
      goto LABEL_75;
    case 'q':
      uint64_t v13 = 2880;
LABEL_27:
      *a2 = v13;
      uint64_t v8 = 1440;
      goto LABEL_75;
    case 'r':
      *a2 = 3072;
      uint64_t v8 = 1728;
      goto LABEL_75;
    case 's':
      *a2 = 1536;
      uint64_t v8 = 864;
      goto LABEL_75;
    case 't':
      *a2 = 3280;
      uint64_t v8 = 1552;
      goto LABEL_75;
    case 'u':
      *a2 = 1640;
      uint64_t v8 = 776;
LABEL_75:
      *a3 = v8;
      if ((a1 & 0x1000) != 0)
      {
LABEL_76:
        uint64_t v18 = *a2;
        *a2 = *a3;
        *a3 = v18;
      }
      break;
    default:
      switch(a1 & 0xFFF)
      {
        case 0xC8:
          uint64_t v10 = 1024;
LABEL_33:
          *a2 = v10;
          uint64_t v8 = 540;
          goto LABEL_75;
        case 0xC9:
          *a2 = 1024;
          uint64_t v8 = 576;
          goto LABEL_75;
        case 0xCA:
          *a2 = 1024;
          uint64_t v8 = 778;
          goto LABEL_75;
        case 0xCB:
          *a2 = 512;
          uint64_t v8 = 256;
          goto LABEL_75;
        case 0xCC:
          uint64_t v11 = 512;
          goto LABEL_63;
        case 0xCD:
          *a2 = 512;
          uint64_t v8 = 288;
          goto LABEL_75;
        case 0xCE:
          *a2 = 512;
          uint64_t v8 = 389;
          goto LABEL_75;
        case 0xD1:
          *a2 = 640;
          uint64_t v8 = 534;
          goto LABEL_75;
        case 0xD2:
          *a2 = 718;
          uint64_t v8 = 378;
          goto LABEL_75;
        case 0xD3:
          uint64_t v12 = 720;
          goto LABEL_69;
        case 0xD4:
          *a2 = 384;
          uint64_t v8 = 216;
          goto LABEL_75;
        case 0xD5:
          *a2 = 410;
          uint64_t v8 = 194;
          goto LABEL_75;
        case 0xD6:
          *a2 = 1280;
          uint64_t v8 = 1068;
          goto LABEL_75;
        case 0xD7:
          uint64_t v8 = 1104;
LABEL_74:
          *a2 = v8;
          goto LABEL_75;
        default:
LABEL_78:
          *a2 = 0;
          *a3 = 0;
          NSLog(&cfstr_NoFrameSizeAva.isa, a1 & 0xFFF);
          if ((a1 & 0x1000) != 0) {
            goto LABEL_76;
          }
          break;
      }
      break;
  }
}

uint64_t FRCGetNumberOfPixelsForUsage(__int16 a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  FRCGetInputFrameSizeForUsage(a1, &v3, &v2);
  return v2 * v3;
}

void FRCGetAlignedInputFrameSizeForUsage(__int16 a1, uint64_t *a2, uint64_t *a3)
{
  *a3 = (*a3 + 7) & 0xFFFFFFFFFFFFFFF8;
}

uint64_t FRCGetUsageFromSize(unint64_t a1, unint64_t a2)
{
  if (a1 <= a2) {
    unint64_t v2 = a2;
  }
  else {
    unint64_t v2 = a1;
  }
  if (a1 >= a2) {
    unint64_t v3 = a2;
  }
  else {
    unint64_t v3 = a1;
  }
  uint64_t v4 = 29;
  if (v2 != 2208 || v3 != 2208) {
    uint64_t v4 = -1;
  }
  if (v2 == 1920 && v3 == 1440) {
    goto LABEL_11;
  }
  if (v2 == 1440 && v3 == 1080) {
    goto LABEL_14;
  }
  if (v2 == 1280 && v3 == 720) {
    goto LABEL_17;
  }
  if (v2 == 1280 && v3 == 960)
  {
    uint64_t v4 = 7;
    goto LABEL_51;
  }
  if (v2 == 1920 && v3 == 1080) {
    goto LABEL_23;
  }
  if (v2 == 3840 && v3 == 2160) {
    goto LABEL_26;
  }
  if (v2 == 960 && v3 == 720)
  {
    uint64_t v4 = 2;
    goto LABEL_51;
  }
  if (v2 == 720 && v3 == 540) {
    goto LABEL_32;
  }
  if (v2 == 960 && v3 == 540)
  {
LABEL_35:
    uint64_t v4 = 5;
    goto LABEL_51;
  }
  if (v2 == 640 && v3 == 480)
  {
    uint64_t v4 = 8;
    goto LABEL_51;
  }
  if (v2 == 640 && v3 == 360)
  {
    uint64_t v4 = 9;
    goto LABEL_51;
  }
  if (v2 == 480 && v3 == 270)
  {
    uint64_t v4 = 10;
    goto LABEL_51;
  }
  if (v2 == 320 && v3 == 180)
  {
    uint64_t v4 = 11;
    goto LABEL_51;
  }
  if (v2 == 320 && v3 == 240) {
    goto LABEL_50;
  }
  if (v2 == 5120)
  {
    if (v3 == 2880)
    {
LABEL_116:
      uint64_t v4 = 21;
      goto LABEL_51;
    }
    if (v3 == 4272)
    {
LABEL_64:
      uint64_t v4 = 22;
      goto LABEL_51;
    }
    goto LABEL_71;
  }
  if (v2 == 4096)
  {
    uint64_t v4 = 14;
    if (v3 != 2048) {
      uint64_t v4 = 15;
    }
    if ((uint64_t)v3 > 2303)
    {
      if (v3 == 2304)
      {
        uint64_t v4 = 16;
        goto LABEL_51;
      }
      if (v3 == 3112)
      {
        uint64_t v4 = 17;
        goto LABEL_51;
      }
    }
    else if (v3 == 2048 || v3 == 2160)
    {
      goto LABEL_51;
    }
LABEL_71:
    if (v2 == 2208 && v3 == 2208)
    {
LABEL_76:
      uint64_t v4 = 29;
      goto LABEL_51;
    }
    BOOL v7 = 0;
    goto LABEL_73;
  }
  if (v2 == 5744 && v3 == 3024)
  {
    uint64_t v4 = 23;
    goto LABEL_51;
  }
  if (v2 == 5760 && v3 == 2880)
  {
    uint64_t v4 = 24;
    goto LABEL_51;
  }
  if (v2 == 6144 && v3 == 3456) {
    goto LABEL_82;
  }
  if (v2 == 7680 && v3 == 4320) {
    goto LABEL_86;
  }
  if (v2 == 0x2000 && v3 == 4320) {
    uint64_t v4 = 27;
  }
  if (v2 == 0x2000 && v3 == 4320 || v2 == 2208 && v3 == 2208) {
    goto LABEL_51;
  }
  if (v2 <= 0x140 && v3 < 0xF1)
  {
LABEL_50:
    uint64_t v4 = 12;
    goto LABEL_51;
  }
  if (v2 <= 0x2D0 && v3 < 0x21D)
  {
LABEL_32:
    uint64_t v4 = 3;
    goto LABEL_51;
  }
  if (v2 <= 0x3C0 && v3 < 0x21D) {
    goto LABEL_35;
  }
  if (v2 <= 0x500 && v3 < 0x2D1)
  {
LABEL_17:
    uint64_t v4 = 6;
    goto LABEL_51;
  }
  if (v2 <= 0x5A0 && v3 < 0x439)
  {
LABEL_14:
    uint64_t v4 = 0;
    goto LABEL_51;
  }
  BOOL v7 = v2 < 0x781;
  if (v2 <= 0x780 && v3 < 0x439)
  {
LABEL_23:
    uint64_t v4 = 4;
    goto LABEL_51;
  }
LABEL_73:
  if (v7 && v3 < 0x5A1)
  {
LABEL_11:
    uint64_t v4 = 1;
    goto LABEL_51;
  }
  if (v2 < 0x8A1) {
    goto LABEL_76;
  }
  if (v2 <= 0xF00 && v3 < 0x871)
  {
LABEL_26:
    uint64_t v4 = 13;
    goto LABEL_51;
  }
  if (v2 <= 0x1000 && v3 <= 0xC28)
  {
    if (v3 < 0x801) {
      uint64_t v4 = 14;
    }
    else {
      uint64_t v4 = 15;
    }
    if (v3 >= 0x871)
    {
      if (v3 < 0x901) {
        uint64_t v4 = 16;
      }
      else {
        uint64_t v4 = 17;
      }
    }
    goto LABEL_51;
  }
  if (v2 <= 0x1400 && v3 < 0xB41) {
    goto LABEL_116;
  }
  if (v2 <= 0x1400 && v3 < 0x10B1) {
    goto LABEL_64;
  }
  if (v2 <= 0x1800 && v3 < 0xD81)
  {
LABEL_82:
    uint64_t v4 = 25;
    goto LABEL_51;
  }
  if (v2 <= 0x19A0 && v3 < 0xC21)
  {
    uint64_t v4 = 28;
    goto LABEL_51;
  }
  if (v2 <= 0x1E00 && v3 < 0x10E1)
  {
LABEL_86:
    uint64_t v4 = 18;
    goto LABEL_51;
  }
  uint64_t v5 = -1;
  if (v2 > 0x2000 || v3 > 0x10E0) {
    return v5;
  }
  uint64_t v4 = 27;
LABEL_51:
  uint64_t v5 = v4 | 0x1000;
  if (a1 >= a2) {
    return v4;
  }
  return v5;
}

uint64_t getQuarterSizeUsage(uint64_t a1)
{
  uint64_t result = 3;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 2;
      break;
    case 2:
    case 3:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 19:
    case 20:
    case 26:
LABEL_26:
      uint64_t result = a1;
      break;
    case 4:
      uint64_t result = 5;
      break;
    case 5:
      uint64_t result = 10;
      break;
    case 6:
      uint64_t result = 9;
      break;
    case 7:
      uint64_t result = 8;
      break;
    case 13:
      uint64_t result = 4;
      break;
    case 14:
      uint64_t result = 105;
      break;
    case 15:
      uint64_t result = 106;
      break;
    case 16:
      uint64_t result = 107;
      break;
    case 17:
      uint64_t result = 108;
      break;
    case 18:
      uint64_t result = 13;
      break;
    case 21:
      uint64_t result = 110;
      break;
    case 22:
      uint64_t result = 111;
      break;
    case 23:
      uint64_t result = 112;
      break;
    case 24:
      uint64_t result = 113;
      break;
    case 25:
      uint64_t result = 114;
      break;
    case 27:
      uint64_t result = 15;
      break;
    case 28:
      uint64_t result = 116;
      break;
    case 29:
      uint64_t result = 215;
      break;
    default:
      switch(a1)
      {
        case 'i':
          uint64_t result = 109;
          break;
        case 'j':
          uint64_t result = 200;
          break;
        case 'k':
          uint64_t result = 201;
          break;
        case 'l':
          uint64_t result = 202;
          break;
        case 'n':
          uint64_t result = 6;
          break;
        case 'o':
          uint64_t result = 214;
          break;
        case 'r':
          uint64_t result = 115;
          break;
        case 't':
          uint64_t result = 117;
          break;
        default:
          goto LABEL_26;
      }
      break;
  }
  return result;
}

uint64_t get4xDownSizeUsage(uint64_t a1)
{
  uint64_t result = 11;
  switch(a1)
  {
    case 0:
      uint64_t result = 103;
      break;
    case 1:
      uint64_t result = 104;
      break;
    case 2:
    case 3:
    case 5:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 19:
    case 20:
LABEL_18:
      NSLog(&cfstr_SInvalidUsageL.isa, "get4xDownSizeUsage", a1, v1, v2);
      uint64_t result = -1;
      break;
    case 4:
      uint64_t result = 10;
      break;
    case 6:
      return result;
    case 7:
      uint64_t result = 12;
      break;
    case 13:
      uint64_t result = 5;
      break;
    case 14:
      uint64_t result = 109;
      break;
    case 15:
      uint64_t result = 200;
      break;
    case 16:
      uint64_t result = 201;
      break;
    case 17:
      uint64_t result = 202;
      break;
    case 18:
      uint64_t result = 4;
      break;
    case 21:
      uint64_t result = 6;
      break;
    default:
      switch(a1)
      {
        case 'i':
          uint64_t result = 203;
          break;
        case 'j':
          uint64_t result = 204;
          break;
        case 'k':
          uint64_t result = 205;
          break;
        case 'l':
          uint64_t result = 206;
          break;
        case 'n':
          uint64_t result = 9;
          break;
        case 'o':
          uint64_t result = 209;
          break;
        case 'p':
          uint64_t result = 210;
          break;
        case 'q':
          uint64_t result = 211;
          break;
        case 's':
          uint64_t result = 212;
          break;
        case 'u':
          uint64_t result = 213;
          break;
        default:
          goto LABEL_18;
      }
      break;
  }
  return result;
}

id uniformTimeScales(unint64_t a1)
{
  if (a1)
  {
    float v2 = 1.0 / ((double)a1 + 1.0);
    unint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a1];
    uint64_t v5 = 0;
    do
    {
      *(float *)&double v4 = v2 * (float)(int)++v5;
      float v6 = [NSNumber numberWithFloat:v4];
      [v3 addObject:v6];
    }
    while (a1 != v5);
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

void sub_1DC8405F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

__CFString *FRCGetRecommendationDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6CA43A8[a1 - 1];
  }
}

__CFString *FRCGetSessionResultDescription(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return off_1E6CA43C8[a1];
  }
}

__CFString *FRCGetGatingCauseDescription(unint64_t a1)
{
  if (a1 > 0xA) {
    return @"Unknown";
  }
  else {
    return off_1E6CA43F0[a1];
  }
}

const char *getConfigurationName(uint64_t a1)
{
  if (!v2 & v1)
  {
    uint64_t result = "landscape1440x1080";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "landscape1920x1440";
        break;
      case 2:
        uint64_t result = "landscape960x720";
        break;
      case 3:
        uint64_t result = "landscape720x540";
        break;
      case 4:
        uint64_t result = "landscape1920x1080";
        break;
      case 5:
        uint64_t result = "landscape960x540";
        break;
      case 6:
        uint64_t result = "landscape1280x720";
        break;
      case 7:
        uint64_t result = "landscape1280x960";
        break;
      case 8:
        uint64_t result = "landscape640x480";
        break;
      case 9:
        uint64_t result = "landscape640x360";
        break;
      case 10:
        uint64_t result = "landscape480x270";
        break;
      case 11:
        uint64_t result = "landscape320x180";
        break;
      case 12:
        uint64_t result = "landscape320x240";
        break;
      case 13:
      case 18:
        uint64_t result = "landscape3840x2160";
        break;
      case 14:
      case 16:
      case 17:
      case 19:
      case 20:
      case 21:
      case 22:
LABEL_53:
        uint64_t result = "";
        break;
      case 15:
        uint64_t result = "landscape4096x2160";
        break;
      case 23:
        uint64_t result = "landscape574x3024";
        break;
      default:
        switch(a1)
        {
          case 200:
            uint64_t result = "landscape1024x540";
            break;
          case 201:
            uint64_t result = "landscape1024x576";
            break;
          case 202:
            uint64_t result = "landscape1024x778";
            break;
          case 203:
            uint64_t result = "landscape512x256";
            break;
          case 204:
            uint64_t result = "landscape512x270";
            break;
          case 205:
            uint64_t result = "landscape512x288";
            break;
          case 206:
            uint64_t result = "landscape512x389";
            break;
          case 209:
            uint64_t result = "landscape640x534";
            break;
          case 210:
            uint64_t result = "landscape718x378";
            break;
          case 211:
            uint64_t result = "landscape720x360";
            break;
          case 212:
            uint64_t result = "landscape384x216";
            break;
          case 213:
            uint64_t result = "landscape410x194";
            break;
          case 214:
            uint64_t result = "landscape1280x1068";
            break;
          case 215:
            uint64_t result = "landscape1104x1104";
            break;
          default:
            goto LABEL_53;
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 'd':
        uint64_t result = "landscape1440x464";
        break;
      case 'e':
        uint64_t result = "landscape1920x584";
        break;
      case 'f':
        uint64_t result = "landscape960x424";
        break;
      case 'g':
        uint64_t result = "landscape360x270";
        break;
      case 'h':
        uint64_t result = "landscape480x360";
        break;
      case 'i':
        uint64_t result = "landscape2048x1024";
        break;
      case 'j':
        uint64_t result = "landscape2048x1080";
        break;
      case 'k':
        uint64_t result = "landscape2048x1152";
        break;
      case 'l':
        uint64_t result = "landscape2048x1556";
        break;
      case 'm':
        uint64_t result = "landscape1024x512";
        break;
      case 'n':
        uint64_t result = "landscape2560x1440";
        break;
      case 'o':
        uint64_t result = "landscape2560x2136";
        break;
      case 'p':
        uint64_t result = "landscape2872x1512";
        break;
      case 'q':
        uint64_t result = "landscape2880x1440";
        break;
      case 'r':
        uint64_t result = "landscape3072x1728";
        break;
      case 's':
        uint64_t result = "landscape1536x864";
        break;
      case 't':
        uint64_t result = "landscape3280x1552";
        break;
      case 'u':
        uint64_t result = "landscape1640x776";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

uint64_t TileInfoMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void getSynthesisTensorSize(__int16 a1, int a2, unint64_t *a3)
{
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  FRCGetAlignedInputFrameSizeForUsage(a1, (uint64_t *)&v8, (uint64_t *)&v7);
  unint64_t v6 = v7;
  for (unint64_t i = v8; a2; --a2)
  {
    unint64_t i = (i + 1) >> 1;
    unint64_t v6 = (v6 + 1) >> 1;
  }
  *a3 = i;
  a3[1] = v6;
  a3[2] = 3;
}

void sub_1DC851110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

CFMutableDictionaryRef createPixelBufferPoolWithExtendedPixels(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6)
{
  uint64_t v24 = a2;
  uint64_t v25 = a1;
  int v22 = a4;
  int valuePtr = a3;
  int v20 = a6;
  int v21 = a5;
  CVPixelBufferPoolRef poolOut = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (result)
  {
    unint64_t v8 = result;
    CFNumberRef v9 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
    if (!v9) {
      goto LABEL_6;
    }
    CFNumberRef v10 = v9;
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F24D70], v9);
    CFRelease(v10);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryAddValue(v8, (const void *)*MEMORY[0x1E4F24D20], Mutable);
    CFRelease(Mutable);
    CFNumberRef v12 = CFNumberCreate(v6, kCFNumberLongType, &v25);
    if (!v12) {
      goto LABEL_6;
    }
    CFNumberRef v13 = v12;
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F24E10], v12);
    CFRelease(v13);
    CFNumberRef v14 = CFNumberCreate(v6, kCFNumberLongType, &v24);
    if (v14)
    {
      CFNumberRef v15 = v14;
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F24D08], v14);
      CFRelease(v15);
      CFNumberRef v16 = CFNumberCreate(v6, kCFNumberIntType, &v22);
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F24C98], v16);
      CFRelease(v16);
      CFNumberRef v17 = CFNumberCreate(v6, kCFNumberIntType, &v21);
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F24CE8], v17);
      CFRelease(v17);
      CFNumberRef v18 = CFNumberCreate(v6, kCFNumberIntType, &v20);
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F24CD0], v18);
      CFRelease(v18);
      CVPixelBufferPoolCreate(v6, 0, v8, &poolOut);
      CFRelease(v8);
      return poolOut;
    }
    else
    {
LABEL_6:
      CFRelease(v8);
      return 0;
    }
  }
  return result;
}

CFMutableDictionaryRef createPixelBufferPool(uint64_t a1, uint64_t a2, int a3, int a4)
{
  return createPixelBufferPoolWithExtendedPixels(a1, a2, a3, a4, 0, ((a2 + 15) & 0xFFFFFFF0) - a2);
}

CVPixelBufferRef createPixelBuffer(size_t a1, size_t a2, OSType a3, int a4)
{
  int valuePtr = a4;
  CVPixelBufferRef v14 = 0;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  unint64_t v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  CFNumberRef v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(v7, 0, v8, v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F24D20], v11);
  CFRelease(v11);
  CFNumberRef v12 = CFNumberCreate(v7, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F24C98], v12);
  CFRelease(v12);
  CVPixelBufferCreate(v7, a1, a2, a3, Mutable, &v14);
  CFRelease(Mutable);
  return v14;
}

id createTextures(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  id v9 = a1;
  CFNumberRef v10 = createTextureDescriptor(a2, a3, a4, a5, 1278226536);
  CFMutableDictionaryRef v11 = (void *)[v9 newTextureWithDescriptor:v10];

  return v11;
}

id createTextureDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  uint64_t v6 = 115;
  uint64_t v7 = 25;
  if (a5 == 1278226488) {
    uint64_t v7 = 12;
  }
  if (a3 == 1) {
    uint64_t v6 = v7;
  }
  if (a3 == 2) {
    uint64_t v8 = 65;
  }
  else {
    uint64_t v8 = v6;
  }
  id v9 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v8 width:a1 height:a2 mipmapped:0];
  [v9 setUsage:3];
  [v9 setStorageMode:0];
  if (a4 >= 2)
  {
    [v9 setTextureType:3];
    [v9 setArrayLength:a4];
  }
  return v9;
}

id createRGBATextureFromCVPixelBuffer(__CVBuffer *a1, void *a2)
{
  id v3 = a2;
  int v4 = equivalentUncompressedPixelFormat(a1);
  uint64_t v5 = 90;
  if (v4 == 1380411457) {
    uint64_t v5 = 115;
  }
  if (v4 == 1111970369) {
    uint64_t v6 = 70;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F35330];
  size_t Width = CVPixelBufferGetWidth(a1);
  id v9 = [v7 texture2DDescriptorWithPixelFormat:v6 width:Width height:CVPixelBufferGetHeight(a1) mipmapped:0];
  [v9 setUsage:3];
  CFNumberRef v10 = (void *)[v3 newTextureWithDescriptor:v9 iosurface:CVPixelBufferGetIOSurface(a1) plane:0];

  return v10;
}

uint64_t equivalentUncompressedPixelFormat(__CVBuffer *a1)
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  CFDictionaryRef v3 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E4F1CF80], PixelFormatType);
  if (CVPixelBufferGetPlaneCount(a1))
  {
    int v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F24EE0]];
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];

    uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F24E88]];
    int v7 = [v6 intValue];

    if (v7)
    {
      uint64_t v8 = [(__CFDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F24EC0]];
      uint64_t PixelFormatType = [v8 intValue];
    }
  }

  return PixelFormatType;
}

uint64_t isYUV420(__CVBuffer *a1)
{
  unsigned int v1 = equivalentUncompressedPixelFormat(a1);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(vdupq_n_s32(v1), (int32x4_t)xmmword_1DC85A790))) & 1 | ((v1 & 0xFFFFFFEF) == 875704422);
}

uint64_t isPackedRGBA(__CVBuffer *a1)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  CFDictionaryRef v2 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E4F1CF80], PixelFormatType);
  CFDictionaryRef v3 = [(__CFDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F24EB0]];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

uint64_t isBufferYUV(__CVBuffer *a1)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  CFDictionaryRef v2 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E4F1CF80], PixelFormatType);
  CFDictionaryRef v3 = [(__CFDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F24EB8]];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

BOOL isBufferCopyNecessaryForCVtoTextureConversion(unint64_t a1, unint64_t a2, unint64_t a3)
{
  return a1 < 0x80 || a3 > 0x80 || a2 < 0x80;
}

id createTexturesFromCVPixelBufferWithCommandBuffer(__CVBuffer *a1, void *a2, void *a3, uint64_t a4, unint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  if (a1)
  {
    size_t Width = CVPixelBufferGetWidth(a1);
    size_t Height = CVPixelBufferGetHeight(a1);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
    uint64_t v14 = a5 >> 1;
    if (a5 <= 1) {
      uint64_t v14 = 1;
    }
    if (PixelFormatType == 843264104)
    {
      a5 = v14;
      uint64_t v15 = 2;
    }
    else
    {
      uint64_t v15 = a4;
    }
    uint64_t v16 = Height / a5;
    if (Height / a5 < 0x80 || Width < 0x80 || a5 >= 0x81)
    {
      id v54 = v9;
      id v22 = v9;
      id v53 = v10;
      id v23 = v10;
      size_t v24 = CVPixelBufferGetWidth(a1);
      size_t v25 = CVPixelBufferGetHeight(a1);
      size_t v26 = v25 / a5;
      uint64_t v27 = v24;
      CFDictionaryRef v28 = v23;
      uint64_t v29 = createTextures(v22, v27, v25 / a5, v15, a5);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
      size_t v31 = BytesPerRow * v26;
      id v51 = v22;
      CMTime v52 = v29;
      long long v50 = v28;
      if (v28)
      {
        id v32 = v29;
        id v33 = v22;
        uint64_t v34 = [v28 blitCommandEncoder];
        long long v49 = v33;
        uint64_t v35 = (void *)[v33 newBufferWithIOSurface:CVPixelBufferGetIOSurface(a1)];
        uint64_t v36 = [v32 width];
        uint64_t v37 = [v32 height];
        if ([v32 arrayLength])
        {
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          unsigned int v40 = 1;
          do
          {
            size_t extraColumnsOnLeft = 0;
            uint64_t v58 = 0;
            uint64_t v59 = 0;
            extraColumnsOnRight[0] = v36;
            extraColumnsOnRight[1] = v37;
            extraColumnsOnRight[2] = 1;
            [v34 copyFromBuffer:v35 sourceOffset:v39 sourceBytesPerRow:BytesPerRow sourceBytesPerImage:v31 sourceSize:extraColumnsOnRight toTexture:v32 destinationSlice:v38 destinationLevel:0 destinationOrigin:&extraColumnsOnLeft];
            v39 += v31;
            uint64_t v38 = v40;
            BOOL v41 = [v32 arrayLength] > (unint64_t)v40++;
          }
          while (v41);
        }
        [v34 endEncoding];
      }
      else
      {
        id v42 = v29;
        CVPixelBufferLockBaseAddress(a1, 1uLL);
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
        uint64_t v44 = [v42 width];
        uint64_t v45 = [v42 height];
        if ([v42 arrayLength])
        {
          uint64_t v46 = 0;
          unsigned int v47 = 1;
          do
          {
            size_t extraColumnsOnLeft = 0;
            uint64_t v58 = 0;
            uint64_t v59 = 0;
            uint64_t v60 = v44;
            uint64_t v61 = v45;
            uint64_t v62 = 1;
            [v42 replaceRegion:&extraColumnsOnLeft mipmapLevel:0 slice:v46 withBytes:&BaseAddress[v46 * v31] bytesPerRow:BytesPerRow bytesPerImage:v31];
            uint64_t v46 = v47;
            BOOL v41 = [v42 arrayLength] > (unint64_t)v47++;
          }
          while (v41);
        }
        CVPixelBufferUnlockBaseAddress(a1, 1uLL);
      }
      id v10 = v53;
      id v9 = v54;
      id v19 = v51;
      int v21 = v52;
      if (!v52) {
        createTexturesFromCVPixelBufferWithCommandBuffer_cold_1();
      }
    }
    else
    {
      int v17 = PixelFormatType;
      size_t extraRowsOnTop = 0;
      size_t extraColumnsOnLeft = 0;
      extraColumnsOnRight[0] = 0;
      size_t extraRowsOnBottom = 0;
      CVPixelBufferGetExtendedPixels(a1, &extraColumnsOnLeft, extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
      size_t v18 = CVPixelBufferGetBytesPerRow(a1);
      id v19 = createTextureDescriptor(Width, v16, v15, a5, v17);
      int v20 = (void *)[v9 newBufferWithIOSurface:CVPixelBufferGetIOSurface(a1)];
      int v21 = (void *)[v20 newLinearTextureWithDescriptor:v19 offset:0 bytesPerRow:v18 bytesPerImage:0];

      if (!v21) {
        createTexturesFromCVPixelBufferWithCommandBuffer_cold_2();
      }
    }
  }
  else
  {
    int v21 = 0;
  }

  return v21;
}

id createTexturesFromCVPixelBuffer(__CVBuffer *a1, void *a2, uint64_t a3, unint64_t a4)
{
  return createTexturesFromCVPixelBufferWithCommandBuffer(a1, a2, 0, a3, a4);
}

void copyTextureToBuffer(void *a1, __CVBuffer *a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 width];
  uint64_t v5 = [v3 height];
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  CVPixelBufferLockBaseAddress(a2, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a2);
  if ([v3 arrayLength])
  {
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      memset(v11, 0, 24);
      v11[3] = v4;
      v11[4] = v5;
      v11[5] = 1;
      [v3 getBytes:BaseAddress bytesPerRow:BytesPerRow bytesPerImage:BytesPerRow * v5 fromRegion:v11 mipmapLevel:0 slice:v8];
      BaseAddress += BytesPerRow * v5;
      uint64_t v8 = v9;
    }
    while ([v3 arrayLength] > (unint64_t)v9++);
  }
  CVPixelBufferUnlockBaseAddress(a2, 0);
}

void copyTextureToBufferWithBlit(void *a1, __CVBuffer *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 width];
  uint64_t v11 = [v7 height];
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
  CFNumberRef v13 = (void *)[v8 newBufferWithIOSurface:CVPixelBufferGetIOSurface(a2)];
  id v19 = v9;
  uint64_t v14 = [v9 blitCommandEncoder];
  if ([v7 arrayLength])
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unsigned int v17 = 1;
    do
    {
      memset(v21, 0, sizeof(v21));
      v20[0] = v10;
      v20[1] = v11;
      v20[2] = 1;
      [v14 copyFromTexture:v7 sourceSlice:v15 sourceLevel:0 sourceOrigin:v21 sourceSize:v20 toBuffer:v13 destinationOffset:v16 destinationBytesPerRow:BytesPerRow destinationBytesPerImage:BytesPerRow * v11];
      v16 += BytesPerRow * v11;
      uint64_t v15 = v17;
    }
    while ([v7 arrayLength] > (unint64_t)v17++);
  }
  [v14 endEncoding];
}

id createYUV420TextureFromCVPixelBuffer(__CVBuffer *a1, void *a2)
{
  id v3 = a2;
  OSType v4 = equivalentUncompressedPixelFormat(a1);
  CFDictionaryRef v5 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
  uint64_t v6 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x1E4F24E20]];
  int v7 = [v6 intValue];

  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  BOOL v10 = v4 == 1885745712 || v4 == 1882468912;
  uint64_t v11 = 505;
  if (v10) {
    uint64_t v11 = 508;
  }
  if (v7 == 8) {
    uint64_t v12 = 500;
  }
  else {
    uint64_t v12 = v11;
  }
  CFNumberRef v13 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v12 width:Width height:Height mipmapped:0];
  [v13 setUsage:1];
  uint64_t v14 = (void *)[v3 newTextureWithDescriptor:v13 iosurface:CVPixelBufferGetIOSurface(a1) plane:0];

  return v14;
}

id createRenderTargetTextureFromCVPixelBuffer(__CVBuffer *a1, void *a2)
{
  id v3 = a2;
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t extraColumnsOnRight = 0;
  size_t extraColumnsOnLeft = 0;
  size_t extraRowsOnBottom = 0;
  size_t extraRowsOnTop = 0;
  CVPixelBufferGetExtendedPixels(a1, &extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
  uint64_t v6 = objc_opt_new();
  [v6 setTextureType:2];
  [v6 setWidth:extraColumnsOnRight + Width];
  [v6 setHeight:extraRowsOnBottom + Height];
  int v7 = equivalentUncompressedPixelFormat(a1);
  if ((v7 & 0xFFFFFFEF) == 0x34323066)
  {
    uint64_t v8 = 500;
    goto LABEL_13;
  }
  if (v7 <= 1885745711)
  {
    if (v7 == 1111970369)
    {
      uint64_t v8 = 70;
      goto LABEL_13;
    }
    int v9 = 1882468912;
    goto LABEL_9;
  }
  uint64_t v8 = 505;
  if (v7 != 2019963440 && v7 != 2016686640)
  {
    int v9 = 1885745712;
LABEL_9:
    if (v7 == v9) {
      uint64_t v8 = 508;
    }
    else {
      uint64_t v8 = 115;
    }
  }
LABEL_13:
  [v6 setPixelFormat:v8];
  [v6 setUsage:5];
  if (![v6 textureType]) {
    NSLog(&cfstr_FailedToCretae.isa);
  }
  BOOL v10 = (void *)[v3 newTextureWithDescriptor:v6 iosurface:CVPixelBufferGetIOSurface(a1) plane:0];

  if (!v10)
  {
    size_t v11 = CVPixelBufferGetWidth(a1);
    size_t v12 = CVPixelBufferGetHeight(a1);
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
    NSLog(&cfstr_ErrorFaildToCr.isa, v11, v12, PixelFormatType);
  }

  return v10;
}

void deserializeLivePhotoMetadata(const __CFData *a1, void *a2, void *a3)
{
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  uint64_t v6 = FigLivePhotoMetadataComputeDeserializationSize();
  if (v6)
  {
    NSLog(&cfstr_Figlivephotome.isa, v6);
    int v7 = 0;
  }
  else
  {
    int v7 = malloc_type_malloc(0, 0x311F9226uLL);
    if (v7)
    {
      uint64_t v8 = FigLivePhotoMetadataDeserializeIntoBuffer();
      if (!v8)
      {
        *a2 = v7;
        goto LABEL_8;
      }
      NSLog(&cfstr_Figlivephotome_0.isa, v8);
    }
    else
    {
      NSLog(&cfstr_CouldNotAlloca.isa);
    }
  }
  free(v7);
  *a2 = 0;
LABEL_8:
  *a3 = 0;
}

uint64_t getFigLivePhotoMetadataV3(_DWORD *a1)
{
  if (*a1 < 3u) {
    return 0;
  }
  CFDictionaryRef v2 = (int32x4_t *)&a1[8 * a1[11]];
  return (uint64_t)&v2[2 * vaddvq_s32(v2[3]) + 4];
}

void saveTensorBufferWithChannelOffset_cold_1()
{
  __assert_rtn("saveTensorBufferWithChannelOffset", "TestUtils.m", 905, "CVPixelBufferGetHeight(buffer) >= (height * channels)");
}

void saveTensorBufferWithChannelOffset_cold_2(const char *a1)
{
}

void saveTensorBufferWithChannelOffset_cold_3()
{
  __assert_rtn("saveTensorBufferWithChannelOffset", "TestUtils.m", 904, "CVPixelBufferGetWidth(buffer) == width");
}

void createTexturesFromCVPixelBufferWithCommandBuffer_cold_1()
{
  __assert_rtn("createTexturesFromCVPixelBufferWithCopy", "Utils.m", 257, "texture != nil");
}

void createTexturesFromCVPixelBufferWithCommandBuffer_cold_2()
{
  __assert_rtn("createTexturesFromCVPixelBufferWithCommandBuffer", "Utils.m", 401, "newTexture != nil");
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBB70](allocator, target, *(void *)&attachmentMode);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1F40DBC88](desc);
}

void CMRemoveAllAttachments(CMAttachmentBearerRef target)
{
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1F40DBE00](sbuf, createIfNecessary);
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1F40DC080](retstr, time);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC160](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC178](retstr, time, multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1F40DC180](retstr, time, *(void *)&multiplier, *(void *)&divisor);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DFC18](attachments);
}

CGRect CVImageBufferGetCleanRect(CVImageBufferRef imageBuffer)
{
  MEMORY[0x1F40DFC20](imageBuffer);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1F40DFDC0](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

uint64_t FigLivePhotoMetadataComputeDeserializationSize()
{
  return MEMORY[0x1F410D3E8]();
}

uint64_t FigLivePhotoMetadataDeserializeIntoBuffer()
{
  return MEMORY[0x1F410D3F8]();
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return MEMORY[0x1F4124C48]();
}

uint64_t IOSurfaceAcceleratorTransformSurface()
{
  return MEMORY[0x1F4124C78]();
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9460](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1F40E72F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1F4118648]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1F41186F8]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x1F4118700]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1F41187A0]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1F41187F8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

uint64_t espresso_plan_submit()
{
  return MEMORY[0x1F4118878]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int system(const char *a1)
{
  return MEMORY[0x1F40CE408](a1);
}