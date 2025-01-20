@interface ADDispartiyToDepthFitEstimator
- (ADDispartiyToDepthFitEstimator)init;
- (ADDispartiyToDepthFitEstimator)initWithParameters:(id)a3;
- (ADLogManager)logger;
- (id).cxx_construct;
- (id)estimateWithDisparity:(__n128)a3 calibration:(__n128)a4 pose:(__n128)a5 disparityTimestamp:(double)a6;
- (id)estimateWithDisparityFile:(id)a3 disparityWidth:(unsigned int)a4 disparityHeight:(unsigned int)a5 calibration:(id)a6 poseArray:(id)a7 disparityTimestamp:(double)a8;
- (id)queryIntermediateResults;
- (void)setLogger:(id)a3;
- (void)updateWorldPoints:(ADDisparityToDepthFitWorldPoint *)a3 pointCount:(unsigned int)a4 pointsTimestamp:(double)a5;
- (void)updateWorldPointsArray:(id)a3 pointsTimestamp:(double)a4;
@end

@implementation ADDispartiyToDepthFitEstimator

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((void *)self + 11) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  begin = self->_worldPoints.__begin_;
  if (begin)
  {
    self->_worldPoints.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_y.__begin_;
  if (v4)
  {
    self->_y.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_x.__begin_;
  if (v5)
  {
    self->_x.__end_ = v5;
    operator delete(v5);
  }
  value = self->_impl.__ptr_.__value_;
  self->_impl.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v7 = *((void *)value + 8);
    *((void *)value + 8) = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    v8 = (void *)*((void *)value + 4);
    if (v8)
    {
      *((void *)value + 5) = v8;
      operator delete(v8);
    }
    v9 = *(void **)value;
    if (*(void *)value)
    {
      *((void *)value + 1) = v9;
      operator delete(v9);
    }
    JUMPOUT(0x2166C5D90);
  }
}

- (void)setLogger:(id)a3
{
}

- (ADLogManager)logger
{
  return self->_logger;
}

- (id)queryIntermediateResults
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_x.__end_ - self->_x.__begin_];
  begin = self->_x.__begin_;
  for (i = self->_x.__end_; begin != i; ++begin)
  {
    *(float *)&double v4 = *begin;
    uint64_t v7 = [NSNumber numberWithFloat:v4];
    [v3 addObject:v7];
  }
  v8 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_y.__end_ - self->_y.__begin_];
  v10 = self->_y.__begin_;
  for (j = self->_y.__end_; v10 != j; ++v10)
  {
    *(float *)&double v9 = *v10;
    v12 = [NSNumber numberWithFloat:v9];
    [v8 addObject:v12];
  }
  v13 = [MEMORY[0x263EFF980] arrayWithCapacity:((char *)self->_worldPoints.__end_ - (char *)self->_worldPoints.__begin_) >> 5];
  v14 = self->_worldPoints.__begin_;
  for (k = self->_worldPoints.__end_; v14 != k; v14 += 4)
  {
    v16 = [NSNumber numberWithInt:v14[2].var1];
    [v13 addObject:v16];
  }
  v17 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  [v17 setValue:v3 forKey:@"ransacX"];
  [v17 setValue:v8 forKey:@"ransacY"];
  [v17 setValue:v13 forKey:@"estimateWorldPointsIds"];
  v18 = [NSNumber numberWithUnsignedInt:self->_updateWorldPointsCounter];
  [v17 setValue:v18 forKey:@"updateWorldPointsCounter"];

  v19 = [NSNumber numberWithUnsignedInt:self->_estimateWithDisparityCounter];
  [v17 setValue:v19 forKey:@"estimateWithDisparityCounter"];

  return v17;
}

- (id)estimateWithDisparityFile:(id)a3 disparityWidth:(unsigned int)a4 disparityHeight:(unsigned int)a5 calibration:(id)a6 poseArray:(id)a7 disparityTimestamp:(double)a8
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v44 = a6;
  id v43 = a7;
  id v45 = v14;
  v15 = PixelBufferUtils::pixelBufferFromRawFile((PixelBufferUtils *)objc_msgSend(v45, "cStringUsingEncoding:", objc_msgSend(NSString, "defaultCStringEncoding")), a4, a5, 0x68646973u);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v52 = __132__ADDispartiyToDepthFitEstimator_estimateWithDisparityFile_disparityWidth_disparityHeight_calibration_poseArray_disparityTimestamp___block_invoke;
  v53 = &__block_descriptor_40_e5_v8__0l;
  v54 = v15;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v43;
  uint64_t v16 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (!v16)
  {

    v39 = 0;
    goto LABEL_42;
  }
  v41 = v15;
  v42 = self;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  uint64_t v21 = *(void *)v48;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v48 != v21) {
        objc_enumerationMutation(obj);
      }
      [*(id *)(*((void *)&v47 + 1) + 8 * i) floatValue];
      int v24 = v23;
      if (v20 < v19)
      {
        *(_DWORD *)v20 = v23;
        v20 += 4;
        continue;
      }
      uint64_t v25 = (v20 - (char *)v18) >> 2;
      unint64_t v26 = v25 + 1;
      if ((unint64_t)(v25 + 1) >> 62) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      if ((v19 - (char *)v18) >> 1 > v26) {
        unint64_t v26 = (v19 - (char *)v18) >> 1;
      }
      if ((unint64_t)(v19 - (char *)v18) >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v27 = v26;
      }
      if (v27)
      {
        if (v27 >> 62) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v28 = operator new(4 * v27);
      }
      else
      {
        v28 = 0;
      }
      v17 = (double *)&v28[4 * v25];
      *(_DWORD *)v17 = v24;
      v29 = (char *)v17 + 4;
      if (v20 != (char *)v18)
      {
        unint64_t v30 = v20 - 4 - (char *)v18;
        if (v30 >= 0xBC)
        {
          if (&v28[v20 - (char *)v18 - 4 - (v30 & 0xFFFFFFFFFFFFFFFCLL)] > &v28[v20 - (char *)v18 - 4])
          {
            v31 = v20;
          }
          else if (&v20[-(v30 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v20 - 4)
          {
            v31 = v20;
          }
          else if ((unint64_t)((char *)v18 - v28) >= 0x20)
          {
            uint64_t v33 = (v30 >> 2) + 1;
            v31 = &v20[-4 * (v33 & 0x7FFFFFFFFFFFFFF8)];
            v34 = &v28[4 * v25 - 16];
            v35 = v20 - 16;
            uint64_t v36 = v33 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v37 = *(_OWORD *)v35;
              *(v34 - 1) = *((_OWORD *)v35 - 1);
              _OWORD *v34 = v37;
              v34 -= 2;
              v35 -= 32;
              v36 -= 8;
            }
            while (v36);
            v17 = (double *)((char *)v17 - 4 * (v33 & 0x7FFFFFFFFFFFFFF8));
            if (v33 == (v33 & 0x7FFFFFFFFFFFFFF8)) {
              goto LABEL_23;
            }
          }
          else
          {
            v31 = v20;
          }
        }
        else
        {
          v31 = v20;
        }
        do
        {
          int v32 = *((_DWORD *)v31 - 1);
          v31 -= 4;
          *((_DWORD *)v17 - 1) = v32;
          v17 = (double *)((char *)v17 - 4);
        }
        while (v31 != (char *)v18);
      }
LABEL_23:
      v19 = &v28[4 * v27];
      if (v18) {
        operator delete(v18);
      }
      v18 = v17;
      v20 = v29;
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  }
  while (v16);

  if (v20 - (char *)v17 == 64)
  {
    uint64_t v38 = -[ADDispartiyToDepthFitEstimator estimateWithDisparity:calibration:pose:disparityTimestamp:](v42, "estimateWithDisparity:calibration:pose:disparityTimestamp:", v41, v44, *v17, v17[2], v17[4], v17[6], a8);
    goto LABEL_41;
  }
  uint64_t v38 = 0;
  v39 = 0;
  if (v17)
  {
LABEL_41:
    operator delete(v17);
    v39 = (void *)v38;
  }
LABEL_42:
  v52((uint64_t)v51);

  return v39;
}

void __132__ADDispartiyToDepthFitEstimator_estimateWithDisparityFile_disparityWidth_disparityHeight_calibration_poseArray_disparityTimestamp___block_invoke(uint64_t a1)
{
}

- (void)updateWorldPointsArray:(id)a3 pointsTimestamp:(double)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
  v34 = self;
  if (v7)
  {
    v8 = 0;
    double v9 = 0;
    v10 = 0;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(id *)(*((void *)&v38 + 1) + 8 * i);
        id v14 = [v13 objectAtIndexedSubscript:0];
        [v14 floatValue];
        *(void *)&long long v37 = v15;

        uint64_t v16 = [v13 objectAtIndexedSubscript:1];
        [v16 floatValue];
        int v36 = v17;

        v18 = [v13 objectAtIndexedSubscript:2];
        [v18 floatValue];
        int v35 = v19;

        v20 = [v13 objectAtIndexedSubscript:3];
        [v20 floatValue];
        int v22 = v21;

        int v23 = [v13 objectAtIndexedSubscript:4];
        int v24 = [v23 intValue];

        long long v25 = v37;
        DWORD1(v25) = v36;
        DWORD2(v25) = v35;
        if (v10 >= v9)
        {
          long long v37 = v25;
          uint64_t v26 = (v10 - v8) >> 5;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 59) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          if ((v9 - v8) >> 4 > v27) {
            unint64_t v27 = (v9 - v8) >> 4;
          }
          if ((unint64_t)(v9 - v8) >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v28 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v28 = v27;
          }
          if (v28)
          {
            if (v28 >> 59) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v29 = (char *)operator new(32 * v28);
          }
          else
          {
            v29 = 0;
          }
          unint64_t v30 = &v29[32 * v26];
          *(_OWORD *)unint64_t v30 = v37;
          *((_DWORD *)v30 + 4) = v22;
          *((_DWORD *)v30 + 5) = v24;
          if (v10 == v8)
          {
            uint64_t v33 = &v29[32 * v26];
          }
          else
          {
            v31 = &v29[32 * v26];
            do
            {
              long long v32 = *((_OWORD *)v10 - 1);
              uint64_t v33 = v31 - 32;
              *((_OWORD *)v31 - 2) = *((_OWORD *)v10 - 2);
              *((_OWORD *)v31 - 1) = v32;
              v10 -= 32;
              v31 -= 32;
            }
            while (v10 != v8);
          }
          double v9 = &v29[32 * v28];
          v10 = v30 + 32;
          if (v8) {
            operator delete(v8);
          }
          v8 = v33;
        }
        else
        {
          *(_OWORD *)v10 = v25;
          *((_DWORD *)v10 + 4) = v22;
          *((_DWORD *)v10 + 5) = v24;
          v10 += 32;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v7);
  }
  else
  {
    v10 = 0;
    v8 = 0;
  }

  [(ADDispartiyToDepthFitEstimator *)v34 updateWorldPoints:v8 pointCount:(unint64_t)(v10 - v8) >> 5 pointsTimestamp:a4];
  if (v8) {
    operator delete(v8);
  }
}

- (id)estimateWithDisparity:(__n128)a3 calibration:(__n128)a4 pose:(__n128)a5 disparityTimestamp:(double)a6
{
  v74[4] = *MEMORY[0x263EF8340];
  id v12 = a9;
  ++*(_DWORD *)(a1 + 20);
  if (*(void *)(a1 + 8))
  {
    size_t Width = CVPixelBufferGetWidth(a8);
    size_t Height = CVPixelBufferGetHeight(a8);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a8);
    if (PixelFormatType == 1751411059)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = *(_DWORD *)(a1 + 20);
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)&buf[4] = v16;
          *(_WORD *)&buf[8] = 2048;
          *(void *)&buf[10] = Width;
          *(_WORD *)&buf[18] = 2048;
          *(void *)&buf[20] = Height;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = a6;
          _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DisparityToDepth [Debug  ] estimateWithDisparity %u with width: %lu height: %lu disparityTimestamp: %f", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        int v53 = *(_DWORD *)(a1 + 20);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = v53;
        *(_WORD *)&buf[8] = 2048;
        *(void *)&buf[10] = Width;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = Height;
        *(_WORD *)&buf[28] = 2048;
        *(double *)&buf[30] = a6;
        _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "DisparityToDepth [Debug  ] estimateWithDisparity %u with width: %lu height: %lu disparityTimestamp: %f", buf, 0x26u);
      }
      CVPixelBufferLockBaseAddress(a8, 1uLL);
      v71[0] = MEMORY[0x263EF8330];
      v71[1] = 3221225472;
      v72[0] = __92__ADDispartiyToDepthFitEstimator_estimateWithDisparity_calibration_pose_disparityTimestamp___block_invoke;
      v72[1] = &__block_descriptor_40_e5_v8__0l;
      v72[2] = a8;
      if (CVPixelBufferGetBaseAddress(a8))
      {
        std::to_string((std::string *)buf, *(_DWORD *)(a1 + 20));
        v18 = std::string::append((std::string *)buf, "_ad_calibration");
        long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
        int64_t v70 = v18->__r_.__value_.__r.__words[2];
        *(_OWORD *)v69 = v19;
        v18->__r_.__value_.__l.__size_ = 0;
        v18->__r_.__value_.__r.__words[2] = 0;
        v18->__r_.__value_.__r.__words[0] = 0;
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        if (v70 >= 0) {
          v20 = v69;
        }
        else {
          v20 = (void **)v69[0];
        }
        [*(id *)(a1 + 96) logCalibration:v12 name:v20 priority:0];
        std::to_string(&v62, *(_DWORD *)(a1 + 20));
        int v21 = std::string::insert(&v62, 0, "frame_");
        long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
        v63.__r_.__value_.__r.__words[2] = v21->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v63.__r_.__value_.__l.__data_ = v22;
        v21->__r_.__value_.__l.__size_ = 0;
        v21->__r_.__value_.__r.__words[2] = 0;
        v21->__r_.__value_.__r.__words[0] = 0;
        int v23 = std::string::append(&v63, "_disparity_");
        long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
        v64.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v64.__r_.__value_.__l.__data_ = v24;
        v23->__r_.__value_.__l.__size_ = 0;
        v23->__r_.__value_.__r.__words[2] = 0;
        v23->__r_.__value_.__r.__words[0] = 0;
        long long v25 = std::string::append(&v64, "_width_");
        long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
        v65.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v65.__r_.__value_.__l.__data_ = v26;
        v25->__r_.__value_.__l.__size_ = 0;
        v25->__r_.__value_.__r.__words[2] = 0;
        v25->__r_.__value_.__r.__words[0] = 0;
        std::to_string(&v61, Width);
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v27 = &v61;
        }
        else {
          unint64_t v27 = (std::string *)v61.__r_.__value_.__r.__words[0];
        }
        if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v61.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v61.__r_.__value_.__l.__size_;
        }
        v29 = std::string::append(&v65, (const std::string::value_type *)v27, size);
        long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
        v66.__r_.__value_.__r.__words[2] = v29->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v66.__r_.__value_.__l.__data_ = v30;
        v29->__r_.__value_.__l.__size_ = 0;
        v29->__r_.__value_.__r.__words[2] = 0;
        v29->__r_.__value_.__r.__words[0] = 0;
        v31 = std::string::append(&v66, "_height_");
        long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
        *(void *)&v58[16] = *((void *)&v31->__r_.__value_.__l + 2);
        *(_OWORD *)v58 = v32;
        v31->__r_.__value_.__l.__size_ = 0;
        v31->__r_.__value_.__r.__words[2] = 0;
        v31->__r_.__value_.__r.__words[0] = 0;
        std::to_string(&v60, Height);
        if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v33 = &v60;
        }
        else {
          uint64_t v33 = (std::string *)v60.__r_.__value_.__r.__words[0];
        }
        if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v34 = HIBYTE(v60.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v34 = v60.__r_.__value_.__l.__size_;
        }
        int v35 = std::string::append((std::string *)v58, (const std::string::value_type *)v33, v34);
        long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
        *(void *)&buf[16] = *((void *)&v35->__r_.__value_.__l + 2);
        *(_OWORD *)buf = v36;
        v35->__r_.__value_.__l.__size_ = 0;
        v35->__r_.__value_.__r.__words[2] = 0;
        v35->__r_.__value_.__r.__words[0] = 0;
        long long v37 = std::string::append((std::string *)buf, ".bin");
        long long v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
        int64_t v68 = v37->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v38;
        v37->__r_.__value_.__l.__size_ = 0;
        v37->__r_.__value_.__r.__words[2] = 0;
        v37->__r_.__value_.__r.__words[0] = 0;
        if ((buf[23] & 0x80000000) != 0)
        {
          operator delete(*(void **)buf);
          if ((SHIBYTE(v60.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_31:
            if ((v58[23] & 0x80000000) == 0) {
              goto LABEL_32;
            }
            goto LABEL_52;
          }
        }
        else if ((SHIBYTE(v60.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          goto LABEL_31;
        }
        operator delete(v60.__r_.__value_.__l.__data_);
        if ((v58[23] & 0x80000000) == 0)
        {
LABEL_32:
          if ((SHIBYTE(v66.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_33;
          }
          goto LABEL_53;
        }
LABEL_52:
        operator delete(*(void **)v58);
        if ((SHIBYTE(v66.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_33:
          if ((SHIBYTE(v61.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_34;
          }
          goto LABEL_54;
        }
LABEL_53:
        operator delete(v66.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v61.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_34:
          if ((SHIBYTE(v65.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_35;
          }
          goto LABEL_55;
        }
LABEL_54:
        operator delete(v61.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v65.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_35:
          if ((SHIBYTE(v64.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_36;
          }
          goto LABEL_56;
        }
LABEL_55:
        operator delete(v65.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v64.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_36:
          if ((SHIBYTE(v63.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_37;
          }
          goto LABEL_57;
        }
LABEL_56:
        operator delete(v64.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v63.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_37:
          if ((SHIBYTE(v62.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_38;
          }
LABEL_58:
          operator delete(v62.__r_.__value_.__l.__data_);
LABEL_38:
          if (v68 >= 0) {
            long long v39 = __p;
          }
          else {
            long long v39 = (void **)__p[0];
          }
          [*(id *)(a1 + 96) logPixelBuffer:a8 name:v39 priority:0];
          std::to_string((std::string *)v58, *(_DWORD *)(a1 + 20));
          long long v40 = std::string::insert((std::string *)v58, 0, "frame_");
          long long v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
          *(void *)&buf[16] = *((void *)&v40->__r_.__value_.__l + 2);
          *(_OWORD *)buf = v41;
          v40->__r_.__value_.__l.__size_ = 0;
          v40->__r_.__value_.__r.__words[2] = 0;
          v40->__r_.__value_.__r.__words[0] = 0;
          v42 = std::string::append((std::string *)buf, "_pose");
          long long v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
          v66.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v66.__r_.__value_.__l.__data_ = v43;
          v42->__r_.__value_.__l.__size_ = 0;
          v42->__r_.__value_.__r.__words[2] = 0;
          v42->__r_.__value_.__r.__words[0] = 0;
          double v44 = a4.n128_f64[0];
          double v45 = a5.n128_f64[0];
          double v46 = a2.n128_f64[0];
          double v47 = a3.n128_f64[0];
          if ((buf[23] & 0x80000000) != 0)
          {
            operator delete(*(void **)buf);
            double v46 = a2.n128_f64[0];
            double v47 = a3.n128_f64[0];
            double v44 = a4.n128_f64[0];
            double v45 = a5.n128_f64[0];
            if ((v58[23] & 0x80000000) == 0) {
              goto LABEL_43;
            }
          }
          else if ((v58[23] & 0x80000000) == 0)
          {
            goto LABEL_43;
          }
          operator delete(*(void **)v58);
          double v46 = a2.n128_f64[0];
          double v47 = a3.n128_f64[0];
          double v44 = a4.n128_f64[0];
          double v45 = a5.n128_f64[0];
LABEL_43:
          if ((v66.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            long long v48 = &v66;
          }
          else {
            long long v48 = (std::string *)v66.__r_.__value_.__r.__words[0];
          }
          objc_msgSend(*(id *)(a1 + 96), "logMatrix4x4:name:priority:", v48, 0, v46, v47, v44, v45);
          id v49 = v12;
          *(__n128 *)v58 = a2;
          *(__n128 *)&v58[16] = a3;
          __n128 v59 = a4;
          *(__n128 *)&v65.__r_.__value_.__l.__data_ = a5;
          objc_msgSend(v49, "referenceDimensions", v12, v72);
          [v49 referenceDimensions];
          id v50 = v49;
          v74[0] = &unk_26C687740;
          v74[1] = v50;
          v74[3] = v74;
          DisparityToDepth::VioProjectionFactory::create();
        }
LABEL_57:
        operator delete(v63.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v62.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_38;
        }
        goto LABEL_58;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v51 = *(_DWORD *)(a1 + 20);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = v51;
        *(_WORD *)&buf[8] = 2048;
        *(void *)&buf[10] = Width;
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = Height;
        *(_WORD *)&buf[28] = 2048;
        *(double *)&buf[30] = a6;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DisparityToDepth [Always ] estimateWithDisparity %u failed to get the base address of the disparity buffer width: %lu height: %lu disparityTimestamp: %f", buf, 0x26u);
      }
      ((void (*)(void *))v72[0])(v71);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = *(_DWORD *)(a1 + 20);
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)&buf[4] = v17;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = PixelFormatType;
      *(_WORD *)&buf[14] = 2048;
      *(void *)&buf[16] = Width;
      *(_WORD *)&buf[24] = 2048;
      *(void *)&buf[26] = Height;
      *(_WORD *)&buf[34] = 2048;
      *(double *)&buf[36] = a6;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DisparityToDepth [Always ] estimateWithDisparity %u is only supported with hdis format (DisparityFloat16). obtained buffer type: %u buffer width: %lu height: %lu disparityTimestamp: %f", buf, 0x2Cu);
    }
  }

  return 0;
}

uint64_t __92__ADDispartiyToDepthFitEstimator_estimateWithDisparity_calibration_pose_disparityTimestamp___block_invoke(uint64_t a1)
{
  return CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
}

- (void)updateWorldPoints:(ADDisparityToDepthFitWorldPoint *)a3 pointCount:(unsigned int)a4 pointsTimestamp:(double)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned int v5 = self->_updateWorldPointsCounter + 1;
  self->_unsigned int updateWorldPointsCounter = v5;
  if (self->_impl.__ptr_.__value_)
  {
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v5;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = a4;
        *(_WORD *)&buf[14] = 2048;
        double v17 = a5;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DisparityToDepth [Debug  ] updateWorldPoints %u with pointCount: %d pointsTimestamp: %f", buf, 0x18u);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v5;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = a4;
      *(_WORD *)&buf[14] = 2048;
      double v17 = a5;
      _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "DisparityToDepth [Debug  ] updateWorldPoints %u with pointCount: %d pointsTimestamp: %f", buf, 0x18u);
    }
    unsigned int updateWorldPointsCounter = self->_updateWorldPointsCounter;
    uint64_t v11 = self->_logger;
    std::to_string(&v15, updateWorldPointsCounter);
    id v12 = std::string::insert(&v15, 0, "world_points_frame_");
    long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    double v17 = *(double *)&v12->__r_.__value_.__r.__words[2];
    *(_OWORD *)buf = v13;
    v12->__r_.__value_.__l.__size_ = 0;
    v12->__r_.__value_.__r.__words[2] = 0;
    v12->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v15.__r_.__value_.__l.__data_);
    }
    if (v17 >= 0.0) {
      id v14 = buf;
    }
    else {
      id v14 = *(uint8_t **)buf;
    }
    [(ADLogManager *)v11 logRawBuffer:a3 size:32 * a4 name:v14 priority:0];
    if (SHIBYTE(v17) < 0) {
      operator delete(*(void **)buf);
    }

    DisparityToDepth::WorldPointsContainer::push((DisparityToDepth::WorldPointsContainer *)self->_impl.__ptr_.__value_, a3, a4);
  }
}

- (ADDispartiyToDepthFitEstimator)initWithParameters:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  *(void *)&self->_unsigned int updateWorldPointsCounter = 0;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)ADDispartiyToDepthFitEstimator;
    unsigned int v5 = [(ADDispartiyToDepthFitEstimator *)&v16 init];
    if (v5)
    {
      id v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      v8 = [v7 lowercaseString];

      if ([v8 hasPrefix:@"ad"])
      {
        uint64_t v9 = [v8 substringFromIndex:2];

        v10 = (void *)v9;
      }
      else
      {
        v10 = v8;
      }
      uint64_t v12 = [v10 stringByReplacingOccurrencesOfString:@"parameters" withString:&stru_26C6879A8];

      uint64_t v13 = +[ADLogManager defaultLoggerWithName:v12];
      logger = v5->_logger;
      v5->_logger = (ADLogManager *)v13;

      operator new();
    }
    self = (ADDispartiyToDepthFitEstimator *)0;
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (ADDispartiyToDepthFitEstimator)init
{
  v3 = objc_alloc_init(ADDisparityToDepthFitEstimatorParameters);
  id v4 = [(ADDispartiyToDepthFitEstimator *)self initWithParameters:v3];

  return v4;
}

@end