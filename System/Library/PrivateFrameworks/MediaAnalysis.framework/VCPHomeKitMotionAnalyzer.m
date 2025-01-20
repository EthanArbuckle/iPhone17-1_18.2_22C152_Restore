@interface VCPHomeKitMotionAnalyzer
- (VCPHomeKitMotionAnalyzer)init;
- (float)actionScore;
- (id).cxx_construct;
- (id)regionsOfInterest;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)calculateFrameDifference:(__CVBuffer *)a3;
- (int)computeRegionsofInterest;
- (int)setPixelBuffer:(__CVBuffer *)a3;
- (void)dealloc;
@end

@implementation VCPHomeKitMotionAnalyzer

- (VCPHomeKitMotionAnalyzer)init
{
  v7.receiver = self;
  v7.super_class = (Class)VCPHomeKitMotionAnalyzer;
  v2 = [(VCPHomeKitMotionAnalyzer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_frameArray.__end_ = v2->_frameArray.__begin_;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    regions = v3->_regions;
    v3->_regions = (NSMutableArray *)v4;

    v3->_diff = 0;
    v3->_ptrFirst = 0;
    v3->_ptrLast = 0;
    v3->_frameWidth = 0;
    v3->_frameHeight = 0;
    v3->_width = 0;
    v3->_height = 0;
    v3->_stride = 0;
    v3->_blockSize = 0;
    v3->_widthBlockNum = 0;
    v3->_heightBlockNum = 0;
  }
  return v3;
}

- (void)dealloc
{
  p_frameArray = &self->_frameArray;
  begin = self->_frameArray.__begin_;
  end = self->_frameArray.__end_;
  if (end != begin)
  {
    unint64_t v6 = 0;
    do
    {
      objc_super v7 = begin[v6];
      if (v7)
      {
        CFRelease(v7);
        begin[v6] = 0;
        begin = p_frameArray->__begin_;
        end = p_frameArray->__end_;
      }
      ++v6;
    }
    while (v6 < end - begin);
  }
  diff = self->_diff;
  if (diff) {
    MEMORY[0x1C186C790](diff, 0x1000C8052888210);
  }
  ptrFirst = self->_ptrFirst;
  if (ptrFirst) {
    MEMORY[0x1C186C790](ptrFirst, 0x1000C8052888210);
  }
  ptrLast = self->_ptrLast;
  if (ptrLast) {
    MEMORY[0x1C186C790](ptrLast, 0x1000C8052888210);
  }
  v11.receiver = self;
  v11.super_class = (Class)VCPHomeKitMotionAnalyzer;
  [(VCPHomeKitMotionAnalyzer *)&v11 dealloc];
}

- (int)setPixelBuffer:(__CVBuffer *)a3
{
  int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  self->_stride = BytesPerRowOfPlane;
  int v5 = self->_height * self->_width;
  if (v5 < 0) {
    size_t v6 = -1;
  }
  else {
    size_t v6 = 4 * v5;
  }
  objc_super v7 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
  self->_diff = (float *)operator new[](v6, MEMORY[0x1E4FBA2D0]);
  if (BytesPerRowOfPlane < 0) {
    size_t v8 = -1;
  }
  else {
    size_t v8 = 4 * BytesPerRowOfPlane;
  }
  self->_ptrFirst = (float *)operator new[](v8, v7);
  v9 = (float *)operator new[](v8, v7);
  self->_ptrLast = v9;
  if (!self->_diff) {
    return -108;
  }
  if (!self->_ptrFirst || v9 == 0) {
    return -108;
  }
  int result = 0;
  self->_blockSize = 32;
  self->_widthBlockNum = vcvtps_s32_f32((float)self->_width * 0.03125);
  self->_heightBlockNum = vcvtps_s32_f32((float)self->_height / (float)self->_blockSize);
  return result;
}

- (int)calculateFrameDifference:(__CVBuffer *)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  v73 = 0;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  int v7 = Height;
  if (self->_diff)
  {
    if (self->_frameWidth != Width || self->_frameHeight != Height) {
      return -50;
    }
    Scaler::Scale(&self->_scaler, a3, &v73, self->_width, self->_height, 875704438);
    CVReturn v9 = v8;
    if (v8) {
      return v9;
    }
  }
  else
  {
    if (Width <= Height) {
      unsigned int v10 = (vcvtps_s32_f32((float)((float)Width * 480.0) / (float)Height) + 1) & 0xFFFFFFFE;
    }
    else {
      unsigned int v10 = 480;
    }
    self->_width = v10;
    if (Height <= Width) {
      uint64_t v11 = (vcvtps_s32_f32((float)((float)Height * 480.0) / (float)Width) + 1) & 0xFFFFFFFE;
    }
    else {
      uint64_t v11 = 480;
    }
    self->_height = v11;
    Scaler::Scale(&self->_scaler, a3, &v73, self->_width, v11, 875704438);
    CVReturn v9 = v12;
    if (v12) {
      return v9;
    }
    CVReturn v9 = [(VCPHomeKitMotionAnalyzer *)self setPixelBuffer:v73];
    if (v9) {
      return v9;
    }
    self->_frameint Width = Width;
    self->_frameint Height = v7;
  }
  p_frameArray = &self->_frameArray;
  begin = (CFTypeRef *)self->_frameArray.__begin_;
  end = self->_frameArray.__end_;
  uint64_t v16 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) <= 0xF)
  {
    p_end_cap = &self->_frameArray.__end_cap_;
    value = self->_frameArray.__end_cap_.__value_;
    if (end >= value)
    {
      uint64_t v23 = v16 >> 3;
      uint64_t v24 = (char *)value - (char *)begin;
      if (v24 >> 2 <= (unint64_t)((v16 >> 3) + 1)) {
        uint64_t v25 = v23 + 1;
      }
      else {
        uint64_t v25 = v24 >> 2;
      }
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v26 = v25;
      }
      v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)p_end_cap, v26);
      v28 = (__CVBuffer **)&v27[8 * v23];
      v30 = (__CVBuffer **)&v27[8 * v29];
      *v28 = v73;
      v19 = v28 + 1;
      v32 = p_frameArray->__begin_;
      v31 = p_frameArray->__end_;
      if (v31 != p_frameArray->__begin_)
      {
        do
        {
          v33 = *--v31;
          *--v28 = v33;
        }
        while (v31 != v32);
        v31 = p_frameArray->__begin_;
      }
      p_frameArray->__begin_ = v28;
      p_frameArray->__end_ = v19;
      p_frameArray->__end_cap_.__value_ = v30;
      if (v31) {
        operator delete(v31);
      }
    }
    else
    {
      *end = v73;
      v19 = end + 1;
    }
    CVReturn v9 = 0;
    p_frameArray->__end_ = v19;
    return v9;
  }
  if (*begin)
  {
    CFRelease(*begin);
    CFTypeRef *begin = 0;
    begin = (CFTypeRef *)p_frameArray->__begin_;
    end = self->_frameArray.__end_;
  }
  if (end != (__CVBuffer **)(begin + 1)) {
    memmove(begin, begin + 1, (char *)end - (char *)(begin + 1));
  }
  v20 = end - 1;
  v21 = self->_frameArray.__end_cap_.__value_;
  self->_frameArray.__end_ = end - 1;
  if (end - 1 >= v21)
  {
    uint64_t v34 = v20 - p_frameArray->__begin_;
    if ((unint64_t)(v34 + 1) >> 61) {
      std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v35 = (char *)v21 - (char *)p_frameArray->__begin_;
    uint64_t v36 = v35 >> 2;
    if (v35 >> 2 <= (unint64_t)(v34 + 1)) {
      uint64_t v36 = v34 + 1;
    }
    if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v37 = v36;
    }
    if (v37) {
      v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&self->_frameArray.__end_cap_, v37);
    }
    else {
      v38 = 0;
    }
    v39 = (__CVBuffer **)&v38[8 * v34];
    v40 = (__CVBuffer **)&v38[8 * v37];
    *v39 = v73;
    v22 = v39 + 1;
    v42 = p_frameArray->__begin_;
    v41 = self->_frameArray.__end_;
    if (v41 != p_frameArray->__begin_)
    {
      do
      {
        v43 = *--v41;
        *--v39 = v43;
      }
      while (v41 != v42);
      v41 = p_frameArray->__begin_;
    }
    p_frameArray->__begin_ = v39;
    self->_frameArray.__end_ = v22;
    self->_frameArray.__end_cap_.__value_ = v40;
    if (v41) {
      operator delete(v41);
    }
  }
  else
  {
    *v20 = v73;
    v22 = end;
  }
  self->_frameArray.__end_ = v22;
  v44 = p_frameArray->__begin_;
  unint64_t v45 = (unint64_t)((char *)v22 - (char *)p_frameArray->__begin_) >> 3;
  if ((int)v45 <= 1) {
    LODWORD(v45) = 1;
  }
  v46 = v44[(v45 - 1)];
  v47 = *v44;
  CVReturn v70 = 0;
  CVPixelBufferRef v71 = v46;
  CVPixelBufferLockFlags v72 = 1;
  if (!v46)
  {
    BOOL v53 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v53) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v53, v54, v55, v56, v57, v58, v59, v60);
    }
    return -50;
  }
  CVReturn v9 = CVPixelBufferLockBaseAddress(v46, 1uLL);
  CVReturn v70 = v9;
  if (!v9
    || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
    && (*(_DWORD *)buf = 134218240,
        *(void *)pixelBuffer = v71,
        *(_WORD *)&pixelBuffer[8] = 1024,
        *(_DWORD *)&pixelBuffer[10] = v9,
        _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (CVReturn v9 = v70) == 0))
  {
    *(void *)&pixelBuffer[4] = v47;
    *(void *)&pixelBuffer[12] = 1;
    if (v47)
    {
      CVReturn v9 = CVPixelBufferLockBaseAddress(v47, 1uLL);
      *(_DWORD *)buf = v9;
      if (!v9
        || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
        && (*(_DWORD *)v76 = 134218240,
            uint64_t v77 = *(void *)&pixelBuffer[4],
            __int16 v78 = 1024,
            CVReturn v79 = v9,
            _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v76, 0x12u), (CVReturn v9 = *(_DWORD *)buf) == 0))
      {
        BaseAddressOfPlane = (const unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(v46, 0);
        v49 = (const unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(v47, 0);
        bzero(self->_diff, self->_height * (uint64_t)self->_width);
        if (self->_height >= 1)
        {
          int v50 = 0;
          diff = self->_diff;
          LODWORD(stride) = self->_stride;
          do
          {
            vDSP_vfltu8(BaseAddressOfPlane, 1, self->_ptrLast, 1, (int)stride);
            vDSP_vfltu8(v49, 1, self->_ptrFirst, 1, self->_stride);
            vDSP_vsub(self->_ptrFirst, 1, self->_ptrLast, 1, diff, 1, self->_width);
            uint64_t stride = self->_stride;
            BaseAddressOfPlane += stride;
            v49 += stride;
            diff += self->_width;
            ++v50;
          }
          while (v50 < self->_height);
        }
        CVReturn v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
        if (!v9) {
          CVReturn v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v70);
        }
      }
    }
    else
    {
      BOOL v62 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v62) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v62, v63, v64, v65, v66, v67, v68, v69);
      }
      CVReturn v9 = -50;
      *(_DWORD *)buf = -50;
    }
    if (*(void *)&pixelBuffer[4]
      && !*(_DWORD *)buf
      && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&pixelBuffer[4], *(CVPixelBufferLockFlags *)&pixelBuffer[12])&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
    }
    if (v71
      && !v70
      && CVPixelBufferUnlockBaseAddress(v71, v72)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
    }
  }
  return v9;
}

- (int)computeRegionsofInterest
{
  vDSP_vabs(self->_diff, 1, self->_diff, 1, self->_height * (uint64_t)self->_width);
  __p = 0;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  int height = self->_height;
  if (height >= 1)
  {
    uint64_t v4 = 0;
    int v5 = 0;
    diff = self->_diff;
    int blockSize = self->_blockSize;
    int width = self->_width;
    do
    {
      if (blockSize >= height + ~v5) {
        int v9 = height + ~v5;
      }
      else {
        int v9 = blockSize;
      }
      if (width >= 1)
      {
        int v56 = v5;
        int v10 = 0;
        uint64_t v55 = diff;
        do
        {
          int v11 = width + ~v10;
          if (blockSize >= v11) {
            int v12 = v11;
          }
          else {
            int v12 = blockSize;
          }
          if (v9 < 1)
          {
            float v13 = 0.0;
          }
          else
          {
            float v13 = 0.0;
            int v14 = v9;
            v15 = diff;
            do
            {
              float __C = 0.0;
              vDSP_sve(v15, 1, &__C, v12);
              v15 += self->_width;
              float v13 = v13 + __C;
              --v14;
            }
            while (v14);
            int blockSize = self->_blockSize;
            uint64_t v4 = v59;
          }
          float v16 = v13 / (float)(blockSize * blockSize);
          if (v4 >= v60)
          {
            v17 = (float *)__p;
            uint64_t v18 = ((char *)v4 - (unsigned char *)__p) >> 2;
            unint64_t v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 62) {
              std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v20 = (char *)v60 - (unsigned char *)__p;
            if (((char *)v60 - (unsigned char *)__p) >> 1 > v19) {
              unint64_t v19 = v20 >> 1;
            }
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v19;
            }
            if (v21)
            {
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v60, v21);
              v17 = (float *)__p;
              uint64_t v4 = v59;
            }
            else
            {
              v22 = 0;
            }
            uint64_t v23 = (float *)&v22[4 * v18];
            *uint64_t v23 = v16;
            uint64_t v24 = v23 + 1;
            while (v4 != v17)
            {
              int v25 = *((_DWORD *)v4-- - 1);
              *((_DWORD *)v23-- - 1) = v25;
            }
            __p = v23;
            uint64_t v59 = v24;
            uint64_t v60 = (float *)&v22[4 * v21];
            if (v17) {
              operator delete(v17);
            }
            uint64_t v4 = v24;
          }
          else
          {
            *v4++ = v16;
          }
          uint64_t v59 = v4;
          diff += v12;
          int blockSize = self->_blockSize;
          v10 += blockSize;
          int width = self->_width;
        }
        while (v10 < width);
        diff = v55;
        int height = self->_height;
        int v5 = v56;
      }
      diff += blockSize * width;
      v5 += blockSize;
    }
    while (v5 < height);
  }
  uint64_t widthBlockNum = self->_widthBlockNum;
  uint64_t heightBlockNum = self->_heightBlockNum;
  float v28 = 0.0;
  if ((int)heightBlockNum < 1)
  {
    int v31 = 0;
    int v30 = 0;
    int v34 = self->_heightBlockNum;
    int v33 = self->_widthBlockNum;
    float v32 = 0.0;
  }
  else
  {
    uint64_t v29 = 0;
    int v30 = 0;
    int v31 = 0;
    float v32 = 0.0;
    int v33 = self->_widthBlockNum;
    int v34 = self->_heightBlockNum;
    do
    {
      if ((int)widthBlockNum <= 0)
      {
        uint64_t v36 = v29 + 1;
      }
      else
      {
        uint64_t v35 = 0;
        uint64_t v36 = v29 + 1;
        do
        {
          if (*((float *)__p + v35 + v29 * (int)widthBlockNum) <= 6.0)
          {
            ++v35;
          }
          else
          {
            if (v33 >= (int)v35) {
              int v33 = v35;
            }
            if ((int)++v35 > v30) {
              int v30 = v35;
            }
            if (v34 >= (int)v29) {
              int v34 = v29;
            }
            if ((int)v36 > v31) {
              int v31 = v29 + 1;
            }
            float v32 = 1.0;
          }
        }
        while (v35 != widthBlockNum);
      }
      uint64_t v29 = v36;
    }
    while (v36 != heightBlockNum);
  }
  int v37 = v31 - v34;
  BOOL v38 = v31 > v34;
  BOOL v39 = __OFSUB__(v30, v33);
  int v40 = v30 - v33;
  float v41 = (float)(int)widthBlockNum;
  float v42 = (float)((float)v40 / (float)(int)widthBlockNum) * 1.5;
  if ((v40 < 0) ^ v39 | (v40 == 0)) {
    int v43 = 0;
  }
  else {
    int v43 = 1;
  }
  float v44 = (float)((float)v37 / (float)(int)heightBlockNum) * 1.5;
  if (v42 > 1.0) {
    float v42 = 1.0;
  }
  float v45 = (float)((float)v33 / v41) - (float)((float)(v42 * 0.5) / 3.0);
  if (v44 > 1.0) {
    float v44 = 1.0;
  }
  if (v45 < 0.0) {
    float v45 = 0.0;
  }
  if ((float)((float)(1.0 - (float)((float)v31 / (float)(int)heightBlockNum)) - (float)((float)(v44 * 0.5) / 3.0)) >= 0.0) {
    float v28 = (float)(1.0 - (float)((float)v31 / (float)(int)heightBlockNum)) - (float)((float)(v44 * 0.5) / 3.0);
  }
  double v46 = v45;
  double v47 = v28;
  if ((v43 & v38) != 0) {
    double v48 = v42;
  }
  else {
    double v48 = 0.0;
  }
  if ((v43 & v38) != 0) {
    double v49 = v44;
  }
  else {
    double v49 = 0.0;
  }
  if ((v43 & v38) != 0) {
    double v50 = v46;
  }
  else {
    double v50 = 0.0;
  }
  if ((v43 & v38) != 0) {
    double v51 = v47;
  }
  else {
    double v51 = 0.0;
  }
  regions = self->_regions;
  BOOL v53 = NSStringFromRect(*(NSRect *)(&v48 - 2));
  [(NSMutableArray *)regions addObject:v53];

  self->_actionScore = v32;
  if (__p)
  {
    uint64_t v59 = (float *)__p;
    operator delete(__p);
  }
  return 0;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  [(NSMutableArray *)self->_regions removeAllObjects];
  int result = [(VCPHomeKitMotionAnalyzer *)self calculateFrameDifference:a3];
  if (!result)
  {
    return [(VCPHomeKitMotionAnalyzer *)self computeRegionsofInterest];
  }
  return result;
}

- (id)regionsOfInterest
{
  return self->_regions;
}

- (float)actionScore
{
  return self->_actionScore;
}

- (void).cxx_destruct
{
  p_frameArray = &self->_frameArray;
  begin = self->_frameArray.__begin_;
  if (begin)
  {
    p_frameArray->__end_ = begin;
    operator delete(begin);
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.pool_.value_);
  objc_storeStrong((id *)&self->_regions, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((_DWORD *)self + 14) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 9) = 0;
  return self;
}

@end