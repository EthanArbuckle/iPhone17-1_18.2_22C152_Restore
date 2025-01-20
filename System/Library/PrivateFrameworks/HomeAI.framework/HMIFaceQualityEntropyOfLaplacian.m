@interface HMIFaceQualityEntropyOfLaplacian
- (HMIFaceQualityEntropyOfLaplacian)init;
- (float)computeJunkScoreForPixelBuffer:(__CVBuffer *)a3;
- (id).cxx_construct;
@end

@implementation HMIFaceQualityEntropyOfLaplacian

- (HMIFaceQualityEntropyOfLaplacian)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMIFaceQualityEntropyOfLaplacian;
  v2 = [(HMIFaceQualityEntropyOfLaplacian *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_unint64_t numBins = 500;
    v2->_maxLaplacianScore = 1020;
    v2->_minLaplacianScore = -1020;
    unint64_t numBins = v2->_numBins;
    v2->_binWidth = (float)((v2->_maxLaplacianScore + 1020) / (int)numBins);
    v2->_maxScore = 4.0;
    std::vector<float>::resize((uint64_t)&v2->_histogram, numBins);
  }
  return v3;
}

- (float)computeJunkScoreForPixelBuffer:(__CVBuffer *)a3
{
  double Size = HMICVPixelBufferGetSize(a3);
  double v7 = v6;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  unint64_t v9 = (unint64_t)Size;
  v10 = (char *)malloc_type_malloc(3 * (unint64_t)Size * (unint64_t)v7, 0xB651B16DuLL);
  v68.data = BaseAddressOfPlane;
  v68.height = (unint64_t)v7;
  v68.width = (unint64_t)Size;
  v68.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v67.data = v10;
  v67.height = (unint64_t)v7;
  v67.width = (unint64_t)Size;
  v67.rowBytes = 3 * (unint64_t)Size;
  vImageConvert_RGBA8888toRGB888(&v68, &v67, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  int v56 = (unint64_t)v7;
  int v57 = (unint64_t)Size;
  v58 = v10;
  v59 = 0;
  uint64_t v11 = 3 * v57;
  if (v56 == 1) {
    uint64_t v12 = 3 * (int)v9;
  }
  else {
    uint64_t v12 = 3 * (unint64_t)Size;
  }
  if (v9) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  if (v12 == v11 || v9 == 0) {
    int v15 = 1124024336;
  }
  else {
    int v15 = 1124007952;
  }
  v64 = &v56;
  v65 = (cv *)v66;
  unsigned int v54 = v15;
  int v55 = 2;
  v66[0] = v13;
  v66[1] = 3;
  v62 = &v10[v13 * (int)(unint64_t)v7];
  uint64_t v63 = 0;
  v60 = v10;
  uint64_t v61 = (uint64_t)&v62[v11 - v13];
  p_histogram = &self->_histogram;
  begin = self->_histogram.__begin_;
  uint64_t v18 = (char *)self->_histogram.__end_ - (char *)begin;
  if (v18 >= 1) {
    bzero(begin, 4 * (((unint64_t)v18 >> 2) - ((unint64_t)v18 > 3)) + 4);
  }
  v51 = (char *)v50 + 8;
  v52 = (cv *)v53;
  v53[0] = 0;
  v53[1] = 0;
  LODWORD(v50[0]) = 1124007936;
  memset((char *)v50 + 4, 0, 48);
  v50[3] = 0u;
  cv::_InputArray::_InputArray((uint64_t)v49, (const cv::Mat *)&v54);
  cv::_OutputArray::_OutputArray((uint64_t)v48, (cv::Mat *)v50);
  cv::Laplacian((cv *)v49, (const cv::_InputArray *)v48, (const cv::_OutputArray *)(((v54 >> 3) & 0x1FF) + 1), 1, 4, 1.0, 0.0);
  int v20 = v56;
  int v19 = v57;
  unsigned int v21 = v54;
  uint64_t v22 = DWORD2(v50[0]);
  if (SDWORD2(v50[0]) >= 1)
  {
    uint64_t v23 = 0;
    uint64_t v24 = HIDWORD(v50[0]);
    v25 = v52;
    uint64_t v26 = *(void *)&v50[1] + 4;
    do
    {
      if ((int)v24 >= 1)
      {
        v27 = p_histogram->__begin_;
        v28 = (__int16 *)(v26 + *(void *)v25 * v23);
        uint64_t v29 = v24;
        do
        {
          int v30 = (int)(float)((float)((float)*(v28 - 2) + 1020.0) / self->_binWidth);
          v27[v30] = v27[v30] + 1.0;
          int v31 = (int)(float)((float)((float)*(v28 - 1) + 1020.0) / self->_binWidth);
          v27[v31] = v27[v31] + 1.0;
          int v32 = (int)(float)((float)((float)*v28 + 1020.0) / self->_binWidth);
          v27[v32] = v27[v32] + 1.0;
          v28 += 3;
          --v29;
        }
        while (v29);
      }
      ++v23;
    }
    while (v23 != v22);
  }
  v34 = p_histogram->__begin_;
  end = self->_histogram.__end_;
  float v35 = 0.0;
  if (v34 != end)
  {
    float v36 = (float)(int)(v19 * v20 + v19 * v20 * ((v21 >> 3) & 0x1FF));
    v37 = v34;
    do
    {
      float *v37 = *v37 / v36;
      ++v37;
    }
    while (v37 != end);
    if (v34 != end)
    {
      float v35 = 0.0;
      do
      {
        if (*v34 >= 0.001)
        {
          float v38 = *v34;
          float v35 = v35 - (float)(v38 * logf(*v34));
        }
        ++v34;
      }
      while (v34 != end);
    }
  }
  float maxScore = self->_maxScore;
  free(v10);
  float v41 = self->_maxScore;
  if (*((void *)&v50[1] + 1) && atomic_fetch_add(*((atomic_uint *volatile *)&v50[1] + 1), 0xFFFFFFFF) == 1) {
    cv::Mat::deallocate((cv::Mat *)v50, v40);
  }
  *(void *)&v50[1] = 0;
  memset(&v50[2], 0, 24);
  if (SDWORD1(v50[0]) >= 1)
  {
    uint64_t v42 = 0;
    v43 = v51;
    do
      *(_DWORD *)&v43[4 * v42++] = 0;
    while (v42 < SDWORD1(v50[0]));
  }
  *((void *)&v50[1] + 1) = 0;
  if (v52 != (cv *)v53) {
    cv::fastFree((void **)v52, v40);
  }
  if (v59 && atomic_fetch_add(v59, 0xFFFFFFFF) == 1) {
    cv::Mat::deallocate((cv::Mat *)&v54, v40);
  }
  v58 = 0;
  uint64_t v61 = 0;
  v62 = 0;
  v60 = 0;
  if (v55 >= 1)
  {
    uint64_t v44 = 0;
    v45 = v64;
    do
      v45[v44++] = 0;
    while (v44 < v55);
  }
  v59 = 0;
  if (v65 != (cv *)v66) {
    cv::fastFree((void **)v65, v40);
  }
  if (v35 >= maxScore) {
    float v46 = maxScore;
  }
  else {
    float v46 = v35;
  }
  return v41 - v46;
}

- (void).cxx_destruct
{
  p_histogram = &self->_histogram;
  begin = self->_histogram.__begin_;
  if (begin)
  {
    p_histogram->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end