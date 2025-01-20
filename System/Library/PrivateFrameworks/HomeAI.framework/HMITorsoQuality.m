@interface HMITorsoQuality
+ (float)entropy:(const void *)a3 numPixels:(int)a4;
+ (float)entropyOfLaplacianForBGRAPixelBuffer:(__CVBuffer *)a3;
+ (float)entropyOfSaturationForBGRAPixelBuffer:(__CVBuffer *)a3;
@end

@implementation HMITorsoQuality

+ (float)entropy:(const void *)a3 numPixels:(int)a4
{
  v4 = *(int **)a3;
  v5 = (int *)*((void *)a3 + 1);
  if (*(int **)a3 == v5) {
    return 0.0;
  }
  double v6 = (double)a4 + 1.0e-20;
  float v7 = 0.0;
  do
  {
    float v8 = (double)*v4 / v6;
    if (v8 > 1.0e-20)
    {
      float v9 = (double)*v4 / v6;
      float v7 = v7 + (float)(v8 * logf(v9));
    }
    ++v4;
  }
  while (v4 != v5);
  return v7;
}

+ (float)entropyOfLaplacianForBGRAPixelBuffer:(__CVBuffer *)a3
{
  double Size = HMICVPixelBufferGetSize(a3);
  double v6 = v5;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  unint64_t v8 = (unint64_t)v6;
  unint64_t v9 = (unint64_t)Size;
  v10 = (char *)malloc_type_malloc(3 * (unint64_t)Size * (unint64_t)v6, 0xF6C0297EuLL);
  v56.data = BaseAddressOfPlane;
  v56.height = (unint64_t)v6;
  v56.width = (unint64_t)Size;
  v56.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v55.data = v10;
  v55.height = (unint64_t)v6;
  v55.width = (unint64_t)Size;
  v55.rowBytes = 3 * (unint64_t)Size;
  vImage_Error v11 = vImageConvert_RGBA8888toRGB888(&v56, &v55, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (v11)
  {
    free(v10);
    return 1.0;
  }
  else
  {
    v45[0] = (unint64_t)v6;
    v45[1] = (unint64_t)Size;
    v46 = v10;
    v47 = 0;
    uint64_t v13 = 3 * (int)v9;
    if (v8 == 1) {
      uint64_t v14 = 3 * (int)v9;
    }
    else {
      uint64_t v14 = 3 * (unint64_t)Size;
    }
    if (v9) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    if (v14 == v13 || v9 == 0) {
      int v17 = 1124024336;
    }
    else {
      int v17 = 1124007952;
    }
    v52 = v45;
    v53 = (cv *)v54;
    unsigned int v43 = v17;
    int v44 = 2;
    v54[0] = v15;
    v54[1] = 3;
    v50 = &v10[v15 * (int)v8];
    uint64_t v51 = 0;
    v48 = v10;
    uint64_t v49 = (uint64_t)&v50[v13 - v15];
    v40 = (char *)v39 + 8;
    v41 = (cv *)v42;
    v42[0] = 0;
    v42[1] = 0;
    LODWORD(v39[0]) = 1124007936;
    memset((char *)v39 + 4, 0, 48);
    v39[3] = 0u;
    cv::_InputArray::_InputArray((uint64_t)&v38, (const cv::Mat *)&v43);
    cv::_OutputArray::_OutputArray((uint64_t)v37, (cv::Mat *)v39);
    cv::Laplacian((cv *)&v38, (const cv::_InputArray *)v37, (const cv::_OutputArray *)(((v43 >> 3) & 0x1FF) + 1), 1, 4, 1.0, 0.0);
    v37[0] = 0;
    std::vector<int>::vector(&v38, 0x1F4uLL, v37);
    int v18 = DWORD2(v39[0]);
    if (SDWORD2(v39[0]) < 1)
    {
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = *(void *)&v39[1];
      v22 = v41;
      int v23 = HIDWORD(v39[0]);
      do
      {
        if (v23 >= 1)
        {
          uint64_t v24 = 0;
          uint64_t v25 = v21 + *(void *)v22 * v19;
          do
          {
            uint64_t v26 = 0;
            std::vector<int>::pointer begin = v38.__begin_;
            do
            {
              __int16 v28 = *(_WORD *)(v25 + v26);
              if ((unsigned __int16)(v28 + 1020) <= 0x7F7u)
              {
                int v29 = (int)(float)((float)((float)v28 + 1020.0) / 4.08);
                ++begin[v29];
                uint64_t v20 = (v20 + 1);
              }
              v26 += 2;
            }
            while (v26 != 6);
            ++v24;
            int v23 = HIDWORD(v39[0]);
            v25 += 6;
          }
          while (v24 < SHIDWORD(v39[0]));
          int v18 = DWORD2(v39[0]);
        }
        ++v19;
      }
      while (v19 < v18);
    }
    free(v10);
    +[HMITorsoQuality entropy:&v38 numPixels:v20];
    float v12 = v31;
    if (v38.__begin_)
    {
      v38.__end_ = v38.__begin_;
      operator delete(v38.__begin_);
    }
    if (*((void *)&v39[1] + 1) && atomic_fetch_add(*((atomic_uint *volatile *)&v39[1] + 1), 0xFFFFFFFF) == 1) {
      cv::Mat::deallocate((cv::Mat *)v39, v30);
    }
    *(void *)&v39[1] = 0;
    memset(&v39[2], 0, 24);
    if (SDWORD1(v39[0]) >= 1)
    {
      uint64_t v32 = 0;
      v33 = v40;
      do
        *(_DWORD *)&v33[4 * v32++] = 0;
      while (v32 < SDWORD1(v39[0]));
    }
    *((void *)&v39[1] + 1) = 0;
    if (v41 != (cv *)v42) {
      cv::fastFree((void **)v41, v30);
    }
    if (v47 && atomic_fetch_add(v47, 0xFFFFFFFF) == 1) {
      cv::Mat::deallocate((cv::Mat *)&v43, v30);
    }
    v46 = 0;
    uint64_t v49 = 0;
    v50 = 0;
    v48 = 0;
    if (v44 >= 1)
    {
      uint64_t v34 = 0;
      v35 = v52;
      do
        v35[v34++] = 0;
      while (v34 < v44);
    }
    v47 = 0;
    if (v53 != (cv *)v54) {
      cv::fastFree((void **)v53, v30);
    }
  }
  return v12;
}

+ (float)entropyOfSaturationForBGRAPixelBuffer:(__CVBuffer *)a3
{
  double Size = HMICVPixelBufferGetSize(a3);
  if (!((int)v5 * (int)Size)) {
    return 1.0;
  }
  double v6 = Size;
  double v7 = v5;
  std::vector<int>::value_type __x = 0;
  std::vector<int>::vector(&v27, 0x64uLL, &__x);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  if (v7 <= 0.0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    unint64_t v9 = BaseAddress;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    do
    {
      if (v6 > 0.0)
      {
        int v12 = 0;
        int v13 = 1;
        do
        {
          uint64_t v14 = &v9[(v12 & 0xFFFFFFFC) + CVPixelBufferGetBytesPerRowOfPlane(a3, 0) * v10];
          unsigned int v15 = v14[2];
          unsigned int v16 = v14[1];
          unsigned int v17 = *v14;
          if (v16 <= v17) {
            unsigned int v18 = v17;
          }
          else {
            unsigned int v18 = v16;
          }
          if (v16 < v17) {
            unsigned int v17 = v16;
          }
          if (v15 <= v18) {
            unsigned int v19 = v18;
          }
          else {
            unsigned int v19 = v15;
          }
          if (v15 < v17) {
            unsigned int v17 = v15;
          }
          float v20 = (double)(int)(v19 - v17) / 255.0;
          if (v20 >= 0.0 && v20 < 1.0)
          {
            ++v27.__begin_[(float)(v20 / 0.01)];
            uint64_t v11 = (v11 + 1);
          }
          double v22 = (double)v13;
          v12 += 4;
          ++v13;
        }
        while (v6 > v22);
      }
      ++v10;
    }
    while (v7 > (double)(int)v10);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  +[HMITorsoQuality entropy:&v27 numPixels:v11];
  float v23 = v24;
  if (v27.__begin_)
  {
    v27.__end_ = v27.__begin_;
    operator delete(v27.__begin_);
  }
  return v23;
}

@end