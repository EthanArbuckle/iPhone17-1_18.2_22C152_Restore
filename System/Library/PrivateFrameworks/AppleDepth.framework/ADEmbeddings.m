@interface ADEmbeddings
- (ADEmbeddings)initWithBands:(unsigned int)a3 maxResolution:(float)a4 sourceFactor:(float)a5;
- (ADEmbeddings)initWithFrequencies:(const void *)a3 sourceFactor:(float)a4;
- (id).cxx_construct;
- (int)targetStorageType;
- (int64_t)embedCentersUsingFourierEncoding:(id)a3 outputBuffer:(unint64_t)a4 outputChannelOffset:(unint64_t)a5 outputBatchOffset:;
- (int64_t)embedDepthMapUsingFourierEncoding:(__CVBuffer *)a3 outputBuffer:(id)a4 outputChannelOffset:(unint64_t)a5 outputBatchOffset:(unint64_t)a6;
- (int64_t)embedValuesUsingFourierEncoding:(const void *)a3 outputBuffer:(id)a4 outputChannelOffset:(unint64_t)a5 outputBatchOffset:(unint64_t)a6;
- (int64_t)embedValuesUsingFourierEncoding:(const void *)a3 outputBuffer:(void *)a4 dimensions:(id)a5 strides:(id)a6 offsets:(id)a7;
- (unsigned)outputChannelsForDepthEmbedding;
- (unsigned)outputChannelsForValuesEmbedding;
- (void)setTargetStorageType:(int)a3;
@end

@implementation ADEmbeddings

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_valuesFactor.__begin_;
  if (begin)
  {
    self->_valuesFactor.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_trigFactors.__begin_;
  if (v4)
  {
    self->_trigFactors.__end_ = v4;
    operator delete(v4);
  }
}

- (void)setTargetStorageType:(int)a3
{
  self->_targetStorageType = a3;
}

- (int)targetStorageType
{
  return self->_targetStorageType;
}

- (unsigned)outputChannelsForDepthEmbedding
{
  return ((unint64_t)((char *)self->_trigFactors.__end_ - (char *)self->_trigFactors.__begin_) >> 1) | 1;
}

- (unsigned)outputChannelsForValuesEmbedding
{
  return 6 * ((unint64_t)((char *)self->_trigFactors.__end_ - (char *)self->_trigFactors.__begin_) >> 2) + 3;
}

- (int64_t)embedDepthMapUsingFourierEncoding:(__CVBuffer *)a3 outputBuffer:(id)a4 outputChannelOffset:(unint64_t)a5 outputBatchOffset:(unint64_t)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a4;
  size_t Width = CVPixelBufferGetWidth(a3);
  if (Width != [v10 width] || (size_t v12 = CVPixelBufferGetHeight(a3), v12 != objc_msgSend(v10, "height")))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      *(void *)&buf[4] = CVPixelBufferGetWidth(a3);
      __int16 v28 = 2048;
      size_t Height = CVPixelBufferGetHeight(a3);
      __int16 v30 = 2048;
      uint64_t v31 = [v10 width];
      __int16 v32 = 2048;
      uint64_t v33 = [v10 height];
      v18 = &_os_log_internal;
      v19 = "Depth map dimensions (%zux%zu), do not match output buffer (%zux%zu)";
      uint32_t v20 = 42;
      goto LABEL_19;
    }
    goto LABEL_11;
  }
  if ([v10 channels] <= a5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = a5;
      __int16 v28 = 2048;
      size_t Height = [v10 channels];
      v18 = &_os_log_internal;
      v19 = "Channel offset %zu, does not match output buffer channels count %zu";
LABEL_17:
      uint32_t v20 = 22;
LABEL_19:
      _os_log_error_impl(&dword_215F16000, v18, OS_LOG_TYPE_ERROR, v19, buf, v20);
    }
LABEL_11:
    int64_t v16 = -22953;
    goto LABEL_12;
  }
  if ([v10 batches] <= a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = a6;
      __int16 v28 = 2048;
      size_t Height = [v10 batches];
      v18 = &_os_log_internal;
      v19 = "Batch offset %zu, does not match output buffer batches count %zu";
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  unint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  unint64_t v14 = PixelFormatType;
  int targetStorageType = self->_targetStorageType;
  if (targetStorageType == 65568)
  {
    if (PixelFormatType == 1717855600 || PixelFormatType == 1717856627)
    {
      embedDepthMapUsingFourierEncoding<float>(a3, &self->_trigFactors.__begin_, (uint64_t *)&self->_valuesFactor, v10, a5, a6);
      goto LABEL_23;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    PixelBufferUtils::pixelFormatAsString(v14, buf);
    if (v30 >= 0) {
      v24 = buf;
    }
    else {
      v24 = *(unsigned char **)buf;
    }
    int v25 = 136315138;
    v26 = v24;
    v22 = &_os_log_internal;
    v23 = "Depth map format (%s) does not match storage format ESPRESSO_STORAGE_TYPE_FLOAT32";
LABEL_37:
    _os_log_error_impl(&dword_215F16000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v25, 0xCu);
    if (SHIBYTE(v30) < 0) {
      operator delete(*(void **)buf);
    }
    goto LABEL_11;
  }
  if (targetStorageType == 65552)
  {
    if (PixelFormatType == 1751410032 || PixelFormatType == 1751411059)
    {
      embedDepthMapUsingFourierEncoding<half>(a3, &self->_trigFactors.__begin_, (uint64_t *)&self->_valuesFactor, v10, a5, a6);
LABEL_23:
      int64_t v16 = 0;
      goto LABEL_12;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    PixelBufferUtils::pixelFormatAsString(v14, buf);
    if (v30 >= 0) {
      v21 = buf;
    }
    else {
      v21 = *(unsigned char **)buf;
    }
    int v25 = 136315138;
    v26 = v21;
    v22 = &_os_log_internal;
    v23 = "Depth map format (%s) does not match storage format ESPRESSO_STORAGE_TYPE_FLOAT16";
    goto LABEL_37;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = targetStorageType;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unsupported storage type 0x%x", buf, 8u);
  }
  int64_t v16 = -22951;
LABEL_12:

  return v16;
}

- (int64_t)embedValuesUsingFourierEncoding:(const void *)a3 outputBuffer:(void *)a4 dimensions:(id)a5 strides:(id)a6 offsets:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int64_t v16 = (void *)[objc_alloc(MEMORY[0x263F26C48]) initWithName:@"camera" rawData:a4 dimensions:v13 strides:v14];
  if (v15)
  {
    uint64_t v17 = [v15 count];
    BOOL v18 = v17 != 0;
    if (v17)
    {
      v24 = [v15 objectAtIndexedSubscript:0];
      unsigned int v19 = [v24 unsignedIntValue];
    }
    else
    {
      unsigned int v19 = 0;
    }
    if ((unint64_t)[v15 count] < 2)
    {
      int v20 = 0;
      unsigned int v21 = 0;
    }
    else
    {
      v7 = [v15 objectAtIndexedSubscript:1];
      unsigned int v21 = [v7 unsignedIntValue];
      int v20 = 1;
    }
  }
  else
  {
    unsigned int v19 = 0;
    BOOL v18 = 0;
    int v20 = 0;
    unsigned int v21 = 0;
  }
  int64_t v22 = [(ADEmbeddings *)self embedValuesUsingFourierEncoding:a3 outputBuffer:v16 outputChannelOffset:v19 outputBatchOffset:v21];
  if (v20) {

  }
  if (v18) {
  return v22;
  }
}

- (int64_t)embedCentersUsingFourierEncoding:(id)a3 outputBuffer:(unint64_t)a4 outputChannelOffset:(unint64_t)a5 outputBatchOffset:
{
  long long v13 = v5;
  id v9 = a3;
  id v10 = operator new(0x10uLL);
  __p = v10;
  *id v10 = v13;
  id v15 = v10 + 1;
  int64_t v16 = v10 + 1;
  int64_t v11 = [(ADEmbeddings *)self embedValuesUsingFourierEncoding:&__p outputBuffer:v9 outputChannelOffset:a4 outputBatchOffset:a5];
  if (__p)
  {
    id v15 = __p;
    operator delete(__p);
  }

  return v11;
}

- (int64_t)embedValuesUsingFourierEncoding:(const void *)a3 outputBuffer:(id)a4 outputChannelOffset:(unint64_t)a5 outputBatchOffset:(unint64_t)a6
{
  uint64_t v581 = *MEMORY[0x263EF8340];
  id v10 = a4;
  uint64_t v11 = *((void *)a3 + 1) - *(void *)a3;
  v574 = v10;
  if (v11 != 16)
  {
    uint64_t v12 = [v10 width];
    _CF = v11 >> 4 >= (unint64_t)([v574 height] * v12);
    id v10 = v574;
    if (!_CF)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        id v14 = *(void **)a3;
        uint64_t v13 = *((void *)a3 + 1);
        id v15 = v574;
        *(_DWORD *)buf = 134218496;
        unint64_t v576 = (v13 - (uint64_t)v14) >> 4;
        __int16 v577 = 2048;
        uint64_t v578 = [v574 width];
        __int16 v579 = 2048;
        uint64_t v580 = [v574 height];
        _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Total values amount %zu, does not match width&height (%zux%zu)", buf, 0x20u);
        int64_t v16 = -22953;
        goto LABEL_58;
      }
LABEL_56:
      int64_t v16 = -22953;
      goto LABEL_57;
    }
  }
  if ([v10 channels] <= a5)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 134218240;
    unint64_t v576 = a5;
    __int16 v577 = 2048;
    uint64_t v578 = [v574 channels];
    v39 = &_os_log_internal;
    v40 = "Channel offset %zu, does not match output buffer channels count %zu";
LABEL_162:
    _os_log_error_impl(&dword_215F16000, v39, OS_LOG_TYPE_ERROR, v40, buf, 0x16u);
    goto LABEL_56;
  }
  if ([v574 batches] <= a6)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 134218240;
    unint64_t v576 = a6;
    __int16 v577 = 2048;
    uint64_t v578 = [v574 batches];
    v39 = &_os_log_internal;
    v40 = "Batch offset %zu, does not match output buffer batches count %zu";
    goto LABEL_162;
  }
  int targetStorageType = self->_targetStorageType;
  v546 = a3;
  v553 = self;
  if (targetStorageType == 65568)
  {
    id v82 = v574;
    uint64_t v83 = [v82 data];
    uint64_t v84 = [v82 batchBytes];
    uint64_t v85 = [v82 channelBytes];
    uint64_t v571 = [v82 channelBytes];
    uint64_t v86 = [v82 rowBytes];
    unint64_t v87 = [v82 width];
    uint64_t v88 = [v82 height];
    uint64_t v89 = v88;
    unint64_t v90 = v84 * a6;
    unint64_t v91 = v85 * a5;
    unint64_t v92 = v83 + v84 * a6 + v85 * a5;
    begiuint64_t n = v553->_trigFactors.__begin_;
    end = v553->_trigFactors.__end_;
    v555 = (void *)*v546;
    unint64_t v95 = end - begin;
    v530 = v82;
    v549 = begin;
    if (v546[1] - *v546 == 16)
    {
      if (end == begin) {
        goto LABEL_238;
      }
      if (v88)
      {
        if (v95 <= 1) {
          uint64_t v96 = 1;
        }
        else {
          uint64_t v96 = end - begin;
        }
        if (v87)
        {
          uint64_t v97 = 0;
          LODWORD(v98) = HIDWORD(*v555);
          long long v535 = *(_OWORD *)v555;
          LODWORD(v99) = v555[1];
          unint64_t v100 = v87 & 0xFFFFFFFFFFFFFFF8;
          unint64_t v101 = v87 & 0xFFFFFFFFFFFFFFF8;
          unint64_t v102 = v90 + v91 + v83;
          uint64_t v532 = 3 * v571;
          v556 = (_DWORD *)(v102 + 12);
          v561 = (int32x4_t *)(v102 + 16);
          uint64_t v103 = v102 + 16 + v571;
          uint64_t v104 = v102 + 16 + 2 * v571;
          uint64_t v539 = v96;
          while (1)
          {
            float v105 = begin[v97];
            *(float *)v106.i32 = sinf(*(float *)&v535 * v105);
            if (v87 > 7)
            {
              int32x4_t v109 = vdupq_lane_s32(v106, 0);
              if (v87 == v100)
              {
                uint64_t v110 = 0;
                v111 = v561;
                do
                {
                  v112 = v111;
                  unint64_t v113 = v87;
                  do
                  {
                    v112[-1] = v109;
                    int32x4_t *v112 = v109;
                    v112 += 2;
                    v113 -= 8;
                  }
                  while (v113);
                  ++v110;
                  v111 = (int32x4_t *)((char *)v111 + v86);
                }
                while (v110 != v89);
              }
              else
              {
                uint64_t v114 = 0;
                v115 = v561;
                unint64_t v116 = v92;
                do
                {
                  v117 = v115;
                  unint64_t v118 = v87 & 0xFFFFFFFFFFFFFFF8;
                  do
                  {
                    v117[-1] = v109;
                    int32x4_t *v117 = v109;
                    v117 += 2;
                    v118 -= 8;
                  }
                  while (v118);
                  v119 = (_DWORD *)(v116 + v101 * 4);
                  unint64_t v120 = v87 & 7;
                  do
                  {
                    *v119++ = v106.i32[0];
                    --v120;
                  }
                  while (v120);
                  ++v114;
                  v116 += v86;
                  v115 = (int32x4_t *)((char *)v115 + v86);
                }
                while (v114 != v89);
              }
            }
            else
            {
              v107 = v556;
              uint64_t v108 = v89;
              do
              {
                *(v107 - 3) = v106.i32[0];
                if (v87 != 1)
                {
                  *(v107 - 2) = v106.i32[0];
                  if (v87 != 2)
                  {
                    *(v107 - 1) = v106.i32[0];
                    if (v87 != 3)
                    {
                      _DWORD *v107 = v106.i32[0];
                      if (v87 != 4)
                      {
                        v107[1] = v106.i32[0];
                        if (v87 != 5)
                        {
                          v107[2] = v106.i32[0];
                          if (v87 != 6) {
                            v107[3] = v106.i32[0];
                          }
                        }
                      }
                    }
                  }
                }
                v107 = (_DWORD *)((char *)v107 + v86);
                --v108;
              }
              while (v108);
            }
            unint64_t v121 = v92 + v571;
            *(float *)v122.i32 = sinf(v98 * v105);
            uint64_t v123 = 0;
            int32x4_t v124 = vdupq_lane_s32(v122, 0);
            v125 = (int32x4_t *)v103;
            v126 = (_DWORD *)v121;
            do
            {
              v127 = v126;
              unint64_t v128 = v87;
              if (v87 < 8) {
                goto LABEL_97;
              }
              v129 = v125;
              unint64_t v130 = v87 & 0xFFFFFFFFFFFFFFF8;
              do
              {
                v129[-1] = v124;
                int32x4_t *v129 = v124;
                v129 += 2;
                v130 -= 8;
              }
              while (v130);
              if (v87 != v100)
              {
                v127 = &v126[v101];
                unint64_t v128 = v87 & 7;
                do
                {
LABEL_97:
                  *v127++ = v122.i32[0];
                  --v128;
                }
                while (v128);
              }
              ++v123;
              v126 = (_DWORD *)((char *)v126 + v86);
              v125 = (int32x4_t *)((char *)v125 + v86);
            }
            while (v123 != v89);
            v131 = (_DWORD *)(v121 + v571);
            *(float *)v132.i32 = sinf(v99 * v105);
            uint64_t v133 = 0;
            int32x4_t v134 = vdupq_lane_s32(v132, 0);
            v135 = (int32x4_t *)v104;
            v136 = v131;
            begiuint64_t n = v549;
            do
            {
              v137 = v136;
              unint64_t v138 = v87;
              if (v87 < 8) {
                goto LABEL_106;
              }
              v139 = v135;
              unint64_t v140 = v87 & 0xFFFFFFFFFFFFFFF8;
              do
              {
                v139[-1] = v134;
                int32x4_t *v139 = v134;
                v139 += 2;
                v140 -= 8;
              }
              while (v140);
              if (v87 != v100)
              {
                v137 = &v136[v101];
                unint64_t v138 = v87 & 7;
                do
                {
LABEL_106:
                  *v137++ = v132.i32[0];
                  --v138;
                }
                while (v138);
              }
              ++v133;
              v136 = (_DWORD *)((char *)v136 + v86);
              v135 = (int32x4_t *)((char *)v135 + v86);
            }
            while (v133 != v89);
            unint64_t v92 = (unint64_t)v131 + v571;
            ++v97;
            v561 = (int32x4_t *)((char *)v561 + v532);
            v556 = (_DWORD *)((char *)v556 + v532);
            v103 += v532;
            v104 += v532;
            if (v97 == v539) {
              goto LABEL_238;
            }
          }
        }
        uint64_t v188 = v571 * v96;
        goto LABEL_237;
      }
    }
    else
    {
      if (end == begin) {
        goto LABEL_238;
      }
      if (v88)
      {
        if (v95 <= 1) {
          uint64_t v164 = 1;
        }
        else {
          uint64_t v164 = end - begin;
        }
        if (v87)
        {
          uint64_t v165 = 0;
          uint64_t v166 = 16 * v87;
          uint64_t v541 = v164;
          do
          {
            uint64_t v167 = 0;
            uint64_t v564 = v165;
            float v168 = begin[v165];
            v169 = v555;
            unint64_t v170 = v92;
            do
            {
              for (uint64_t i = 0; i != v87; ++i)
                *(float *)(v170 + 4 * i) = sinf(v168 * *(float *)&v169[2 * i]);
              ++v167;
              v170 += v86;
              v169 = (void *)((char *)v169 + v166);
            }
            while (v167 != v89);
            uint64_t v172 = 0;
            unint64_t v173 = v92 + v571;
            v174 = (float *)v555 + 1;
            unint64_t v175 = v92 + v571;
            do
            {
              uint64_t v176 = 0;
              v177 = v174;
              do
              {
                float v178 = *v177;
                v177 += 4;
                *(float *)(v175 + 4 * v176++) = sinf(v168 * v178);
              }
              while (v87 != v176);
              ++v172;
              v175 += v86;
              v174 = (float *)((char *)v174 + v166);
            }
            while (v172 != v89);
            uint64_t v179 = 0;
            unint64_t v180 = v173 + v571;
            v181 = v555 + 1;
            unint64_t v182 = v173 + v571;
            do
            {
              uint64_t v183 = 0;
              unint64_t v184 = v87;
              do
              {
                *(float *)(v182 + v183 * 2) = sinf(v168 * *(float *)&v181[v183]);
                v183 += 2;
                --v184;
              }
              while (v184);
              ++v179;
              v182 += v86;
              v181 = (void *)((char *)v181 + v166);
            }
            while (v179 != v89);
            unint64_t v92 = v180 + v571;
            uint64_t v165 = v564 + 1;
            begiuint64_t n = v549;
          }
          while (v564 + 1 != v541);
LABEL_238:
          v265 = v530;
          uint64_t v573 = objc_msgSend(v530, "channelBytes", v530);
          uint64_t v266 = [v265 rowBytes];
          unint64_t v267 = [v265 width];
          uint64_t v268 = [v265 height];
          uint64_t v269 = v268;
          v271 = v553->_trigFactors.__begin_;
          v270 = v553->_trigFactors.__end_;
          v558 = (void *)*v546;
          unint64_t v272 = v270 - v271;
          v552 = v271;
          if (v546[1] - *v546 == 16)
          {
            if (v270 != v271)
            {
              if (v268)
              {
                if (v272 <= 1) {
                  uint64_t v273 = 1;
                }
                else {
                  uint64_t v273 = v270 - v271;
                }
                if (v267)
                {
                  uint64_t v274 = 0;
                  unint64_t v275 = v267 & 0xFFFFFFFFFFFFFFF8;
                  LODWORD(v276) = HIDWORD(*v558);
                  unint64_t v277 = v267 & 0xFFFFFFFFFFFFFFF8;
                  long long v537 = *(_OWORD *)v558;
                  LODWORD(v278) = v558[1];
                  uint64_t v533 = 3 * v573;
                  v559 = (_DWORD *)(v92 + 12);
                  unint64_t v568 = v92 + 16;
                  unint64_t v279 = v92 + 16 + v573;
                  uint64_t v280 = v92 + 16 + 2 * v573;
                  uint64_t v544 = v273;
                  while (1)
                  {
                    float v281 = v271[v274];
                    *(float *)v282.i32 = cosf(*(float *)&v537 * v281);
                    if (v267 > 7)
                    {
                      int32x4_t v285 = vdupq_lane_s32(v282, 0);
                      if (v267 == v275)
                      {
                        uint64_t v286 = 0;
                        v287 = (int32x4_t *)v568;
                        do
                        {
                          v288 = v287;
                          unint64_t v289 = v267;
                          do
                          {
                            v288[-1] = v285;
                            int32x4_t *v288 = v285;
                            v288 += 2;
                            v289 -= 8;
                          }
                          while (v289);
                          ++v286;
                          v287 = (int32x4_t *)((char *)v287 + v266);
                        }
                        while (v286 != v269);
                      }
                      else
                      {
                        uint64_t v290 = 0;
                        v291 = (int32x4_t *)v568;
                        unint64_t v292 = v92;
                        do
                        {
                          v293 = v291;
                          unint64_t v294 = v267 & 0xFFFFFFFFFFFFFFF8;
                          do
                          {
                            v293[-1] = v285;
                            int32x4_t *v293 = v285;
                            v293 += 2;
                            v294 -= 8;
                          }
                          while (v294);
                          unint64_t v295 = 4 * (v267 & 0xFFFFFFFFFFFFFFF8);
                          unint64_t v296 = v267 & 7;
                          do
                          {
                            *(_DWORD *)(v292 + v295) = v282.i32[0];
                            v295 += 4;
                            --v296;
                          }
                          while (v296);
                          ++v290;
                          v292 += v266;
                          v291 = (int32x4_t *)((char *)v291 + v266);
                        }
                        while (v290 != v269);
                      }
                    }
                    else
                    {
                      v283 = v559;
                      uint64_t v284 = v269;
                      do
                      {
                        *(v283 - 3) = v282.i32[0];
                        if (v267 != 1)
                        {
                          *(v283 - 2) = v282.i32[0];
                          if (v267 != 2)
                          {
                            *(v283 - 1) = v282.i32[0];
                            if (v267 != 3)
                            {
                              _DWORD *v283 = v282.i32[0];
                              if (v267 != 4)
                              {
                                v283[1] = v282.i32[0];
                                if (v267 != 5)
                                {
                                  v283[2] = v282.i32[0];
                                  if (v267 != 6) {
                                    v283[3] = v282.i32[0];
                                  }
                                }
                              }
                            }
                          }
                        }
                        v283 = (_DWORD *)((char *)v283 + v266);
                        --v284;
                      }
                      while (v284);
                    }
                    unint64_t v297 = v92 + v573;
                    *(float *)v298.i32 = cosf(v276 * v281);
                    uint64_t v299 = 0;
                    int32x4_t v300 = vdupq_lane_s32(v298, 0);
                    v301 = (int32x4_t *)v279;
                    v302 = (_DWORD *)v297;
                    do
                    {
                      v303 = v302;
                      unint64_t v304 = v267;
                      if (v267 < 8) {
                        goto LABEL_276;
                      }
                      v305 = v301;
                      unint64_t v306 = v267 & 0xFFFFFFFFFFFFFFF8;
                      do
                      {
                        v305[-1] = v300;
                        int32x4_t *v305 = v300;
                        v305 += 2;
                        v306 -= 8;
                      }
                      while (v306);
                      if (v267 != v275)
                      {
                        v303 = &v302[v277];
                        unint64_t v304 = v267 & 7;
                        do
                        {
LABEL_276:
                          *v303++ = v298.i32[0];
                          --v304;
                        }
                        while (v304);
                      }
                      ++v299;
                      v302 = (_DWORD *)((char *)v302 + v266);
                      v301 = (int32x4_t *)((char *)v301 + v266);
                    }
                    while (v299 != v269);
                    v307 = (_DWORD *)(v297 + v573);
                    *(float *)v308.i32 = cosf(v278 * v281);
                    uint64_t v309 = 0;
                    int32x4_t v310 = vdupq_lane_s32(v308, 0);
                    v311 = (int32x4_t *)v280;
                    v312 = v307;
                    do
                    {
                      v313 = v312;
                      unint64_t v314 = v267;
                      if (v267 < 8) {
                        goto LABEL_285;
                      }
                      v315 = v311;
                      unint64_t v316 = v267 & 0xFFFFFFFFFFFFFFF8;
                      do
                      {
                        v315[-1] = v310;
                        int32x4_t *v315 = v310;
                        v315 += 2;
                        v316 -= 8;
                      }
                      while (v316);
                      if (v267 != v275)
                      {
                        v313 = &v312[v277];
                        unint64_t v314 = v267 & 7;
                        do
                        {
LABEL_285:
                          *v313++ = v308.i32[0];
                          --v314;
                        }
                        while (v314);
                      }
                      ++v309;
                      v312 = (_DWORD *)((char *)v312 + v266);
                      v311 = (int32x4_t *)((char *)v311 + v266);
                    }
                    while (v309 != v269);
                    unint64_t v92 = (unint64_t)v307 + v573;
                    ++v274;
                    v568 += v533;
                    v559 = (_DWORD *)((char *)v559 + v533);
                    v279 += v533;
                    v280 += v533;
                    v271 = v552;
                    if (v274 == v544) {
                      goto LABEL_410;
                    }
                  }
                }
                uint64_t v338 = v573 * v273;
                goto LABEL_409;
              }
LABEL_308:
              if (v272 <= 1) {
                unint64_t v272 = 1;
              }
              uint64_t v338 = v573 * v272;
LABEL_409:
              v92 += 3 * v338;
            }
          }
          else if (v270 != v271)
          {
            if (v268)
            {
              if (v272 <= 1) {
                uint64_t v317 = 1;
              }
              else {
                uint64_t v317 = v270 - v271;
              }
              if (v267)
              {
                uint64_t v318 = 0;
                uint64_t v319 = 16 * v267;
                uint64_t v545 = v317;
                do
                {
                  uint64_t v320 = 0;
                  uint64_t v569 = v318;
                  float v321 = v271[v318];
                  v322 = v558;
                  unint64_t v323 = v92;
                  do
                  {
                    for (uint64_t j = 0; j != v267; ++j)
                      *(float *)(v323 + 4 * j) = cosf(v321 * *(float *)&v322[2 * j]);
                    ++v320;
                    v323 += v266;
                    v322 = (void *)((char *)v322 + v319);
                  }
                  while (v320 != v269);
                  uint64_t v325 = 0;
                  unint64_t v326 = v92 + v573;
                  v327 = (float *)v558 + 1;
                  unint64_t v328 = v92 + v573;
                  do
                  {
                    uint64_t v329 = 0;
                    v330 = v327;
                    do
                    {
                      float v331 = *v330;
                      v330 += 4;
                      *(float *)(v328 + 4 * v329++) = cosf(v321 * v331);
                    }
                    while (v267 != v329);
                    ++v325;
                    v328 += v266;
                    v327 = (float *)((char *)v327 + v319);
                  }
                  while (v325 != v269);
                  uint64_t v332 = 0;
                  unint64_t v333 = v326 + v573;
                  v334 = v558 + 1;
                  unint64_t v335 = v326 + v573;
                  do
                  {
                    uint64_t v336 = 0;
                    unint64_t v337 = v267;
                    do
                    {
                      *(float *)(v335 + v336 * 2) = cosf(v321 * *(float *)&v334[v336]);
                      v336 += 2;
                      --v337;
                    }
                    while (v337);
                    ++v332;
                    v335 += v266;
                    v334 = (void *)((char *)v334 + v319);
                  }
                  while (v332 != v269);
                  unint64_t v92 = v333 + v573;
                  uint64_t v318 = v569 + 1;
                  v271 = v552;
                }
                while (v569 + 1 != v545);
                goto LABEL_410;
              }
              uint64_t v338 = v573 * v317;
              goto LABEL_409;
            }
            goto LABEL_308;
          }
LABEL_410:
          uint64_t v440 = [v531 channelBytes];
          uint64_t v441 = [v531 rowBytes];
          unint64_t v442 = [v531 width];
          uint64_t v443 = [v531 height];
          v446 = (_OWORD *)*v546;
          v447 = v553->_valuesFactor.__begin_;
          v448 = v553->_valuesFactor.__end_;
          unint64_t v449 = v448 - v447;
          if (v546[1] - *v546 == 16)
          {
            if (v448 == v447 || !v443) {
              goto LABEL_504;
            }
            if (v449 <= 1) {
              unint64_t v449 = 1;
            }
            if (!v442) {
              goto LABEL_504;
            }
            uint64_t v450 = 0;
            unint64_t v451 = v442 & 0xFFFFFFFFFFFFFFF8;
            long long v452 = *v446;
            LODWORD(v453) = HIDWORD(*(void *)v446);
            unint64_t v454 = v442 & 0xFFFFFFFFFFFFFFF8;
            unint64_t v455 = v92 + 16;
            uint64_t v456 = 3 * v440;
            v457 = (_DWORD *)(v92 + 12);
            unint64_t v458 = v92 + 16 + v440;
            uint64_t v459 = v92 + 16 + 2 * v440;
LABEL_418:
            *(float *)v444.i32 = v447[v450];
            *(float *)v445.i32 = *(float *)&v452 * *(float *)v444.i32;
            if (v442 > 7)
            {
              int32x4_t v462 = vdupq_lane_s32(*(int32x2_t *)v445.i8, 0);
              if (v442 == v451)
              {
                uint64_t v463 = 0;
                v464 = (int32x4_t *)v455;
                do
                {
                  v465 = v464;
                  unint64_t v466 = v442;
                  do
                  {
                    v465[-1] = v462;
                    int32x4_t *v465 = v462;
                    v465 += 2;
                    v466 -= 8;
                  }
                  while (v466);
                  ++v463;
                  v464 = (int32x4_t *)((char *)v464 + v441);
                }
                while (v463 != v443);
              }
              else
              {
                uint64_t v467 = 0;
                v468 = (int32x4_t *)v455;
                unint64_t v469 = v92;
                do
                {
                  v470 = v468;
                  unint64_t v471 = v442 & 0xFFFFFFFFFFFFFFF8;
                  do
                  {
                    v470[-1] = v462;
                    int32x4_t *v470 = v462;
                    v470 += 2;
                    v471 -= 8;
                  }
                  while (v471);
                  unint64_t v472 = 4 * (v442 & 0xFFFFFFFFFFFFFFF8);
                  unint64_t v473 = v442 & 7;
                  do
                  {
                    *(_DWORD *)(v469 + v472) = v445.i32[0];
                    v472 += 4;
                    --v473;
                  }
                  while (v473);
                  ++v467;
                  v469 += v441;
                  v468 = (int32x4_t *)((char *)v468 + v441);
                }
                while (v467 != v443);
              }
            }
            else
            {
              v460 = v457;
              uint64_t v461 = v443;
              do
              {
                *(v460 - 3) = v445.i32[0];
                if (v442 != 1)
                {
                  *(v460 - 2) = v445.i32[0];
                  if (v442 != 2)
                  {
                    *(v460 - 1) = v445.i32[0];
                    if (v442 != 3)
                    {
                      _DWORD *v460 = v445.i32[0];
                      if (v442 != 4)
                      {
                        v460[1] = v445.i32[0];
                        if (v442 != 5)
                        {
                          v460[2] = v445.i32[0];
                          if (v442 != 6) {
                            v460[3] = v445.i32[0];
                          }
                        }
                      }
                    }
                  }
                }
                v460 = (_DWORD *)((char *)v460 + v441);
                --v461;
              }
              while (v461);
            }
            uint64_t v474 = 0;
            *(float *)v445.i32 = v453 * *(float *)v444.i32;
            int32x4_t v475 = vdupq_lane_s32(*(int32x2_t *)v445.i8, 0);
            v476 = (int32x4_t *)v458;
            v477 = (_DWORD *)(v92 + v440);
            while (1)
            {
              v478 = v477;
              unint64_t v479 = v442;
              if (v442 >= 8)
              {
                v480 = v476;
                unint64_t v481 = v442 & 0xFFFFFFFFFFFFFFF8;
                do
                {
                  v480[-1] = v475;
                  int32x4_t *v480 = v475;
                  v480 += 2;
                  v481 -= 8;
                }
                while (v481);
                if (v442 == v451) {
                  goto LABEL_441;
                }
                v478 = &v477[v454];
                unint64_t v479 = v442 & 7;
              }
              do
              {
                *v478++ = v445.i32[0];
                --v479;
              }
              while (v479);
LABEL_441:
              ++v474;
              v477 = (_DWORD *)((char *)v477 + v441);
              v476 = (int32x4_t *)((char *)v476 + v441);
              if (v474 == v443)
              {
                uint64_t v482 = 0;
                *(float *)v444.i32 = *((float *)&v452 + 2) * *(float *)v444.i32;
                int32x4_t v445 = vdupq_lane_s32(v444, 0);
                v483 = (int32x4_t *)v459;
                v484 = (_DWORD *)(v92 + v440 + v440);
                while (1)
                {
                  v485 = v484;
                  unint64_t v486 = v442;
                  if (v442 >= 8)
                  {
                    v487 = v483;
                    unint64_t v488 = v442 & 0xFFFFFFFFFFFFFFF8;
                    do
                    {
                      v487[-1] = v445;
                      int32x4_t *v487 = v445;
                      v487 += 2;
                      v488 -= 8;
                    }
                    while (v488);
                    if (v442 == v451) {
                      goto LABEL_450;
                    }
                    v485 = &v484[v454];
                    unint64_t v486 = v442 & 7;
                  }
                  do
                  {
                    *v485++ = v444.i32[0];
                    --v486;
                  }
                  while (v486);
LABEL_450:
                  ++v482;
                  v484 = (_DWORD *)((char *)v484 + v441);
                  v483 = (int32x4_t *)((char *)v483 + v441);
                  if (v482 == v443)
                  {
                    v92 += v440 + v440 + v440;
                    ++v450;
                    v455 += v456;
                    v457 = (_DWORD *)((char *)v457 + v456);
                    v458 += v456;
                    v459 += v456;
                    if (v450 == v449) {
                      goto LABEL_504;
                    }
                    goto LABEL_418;
                  }
                }
              }
            }
          }
          if (v448 == v447 || !v443) {
            goto LABEL_504;
          }
          if (v449 <= 1) {
            unint64_t v449 = 1;
          }
          if (!v442) {
            goto LABEL_504;
          }
          uint64_t v489 = 0;
          uint64_t v490 = 3 * v440;
          uint64_t v491 = 16 * v442;
          unint64_t v492 = v442 & 0xFFFFFFFFFFFFFFFCLL;
          uint64_t v493 = v440 + v92 + 8;
          unint64_t v494 = v92;
LABEL_465:
          uint64_t v495 = 0;
          float v496 = v447[v489];
          v497 = v446;
          unint64_t v498 = v494;
          do
          {
            for (uint64_t k = 0; k != v442; ++k)
              *(float *)(v498 + 4 * k) = v496 * *(float *)&v497[k];
            ++v495;
            v498 += v441;
            v497 = (_OWORD *)((char *)v497 + v491);
          }
          while (v495 != v443);
          unint64_t v500 = v494 + v440;
          if (v442 < 4)
          {
            v501 = (float *)v446 + 5;
            v502 = (float *)v493;
            uint64_t v503 = v443;
            do
            {
              *(v502 - 2) = v496 * *(v501 - 4);
              if (v442 != 1)
              {
                *(v502 - 1) = v496 * *v501;
                if (v442 != 2) {
                  float *v502 = v496 * v501[4];
                }
              }
              v502 = (float *)((char *)v502 + v441);
              v501 = (float *)((char *)v501 + v491);
              --v503;
            }
            while (v503);
LABEL_488:
            uint64_t v516 = 0;
            unint64_t v517 = v500 + v440;
            v518 = (char *)v446 + 8;
            v519 = (__int32 *)v446 + 10;
            unint64_t v520 = v517;
            while (1)
            {
              if (v442 >= 4
                && (v520 < (unint64_t)&v446[v442 - 1] + v491 * v516 + 12
                  ? (BOOL v521 = (unint64_t)v446 + ((v491 * v516) | 8) >= v92
                                                                          + 4 * v442
                                                                          + 2 * v440
                                                                          + v490 * v489
                                                                          + v441 * v516)
                  : (BOOL v521 = 1),
                    v521))
              {
                uint64_t v522 = 0;
                v523 = v519;
                unint64_t v524 = v442 & 0xFFFFFFFFFFFFFFFCLL;
                do
                {
                  v525.i32[0] = *(v523 - 8);
                  v525.i32[1] = *(v523 - 4);
                  v525.i32[2] = *v523;
                  v525.i32[3] = v523[4];
                  *(float32x4_t *)(v520 + v522) = vmulq_n_f32(v525, v496);
                  v522 += 16;
                  v523 += 16;
                  v524 -= 4;
                }
                while (v524);
                unint64_t v526 = v442 & 0xFFFFFFFFFFFFFFFCLL;
                if (v442 == v492) {
                  goto LABEL_489;
                }
              }
              else
              {
                unint64_t v526 = 0;
              }
              unint64_t v527 = v442 - v526;
              uint64_t v528 = 4 * v526;
              do
              {
                *(float *)(v520 + v528) = v496 * *(float *)&v518[4 * v528];
                v528 += 4;
                --v527;
              }
              while (v527);
LABEL_489:
              ++v516;
              v520 += v441;
              v519 = (__int32 *)((char *)v519 + v491);
              v518 += v491;
              if (v516 == v443)
              {
                unint64_t v494 = v517 + v440;
                ++v489;
                v493 += v490;
                if (v489 == v449) {
                  goto LABEL_504;
                }
                goto LABEL_465;
              }
            }
          }
          uint64_t v504 = 0;
          v505 = (__int32 *)v446 + 9;
          v506 = (char *)v446 + 4;
          unint64_t v507 = v500;
          while (1)
          {
            if (v507 >= (unint64_t)&v446[v442 - 1] + v491 * v504 + 8
              || (unint64_t)v446 + ((v491 * v504) | 4) >= v92 + v440 + 4 * v442 + v490 * v489 + v441 * v504)
            {
              uint64_t v509 = 0;
              v510 = v505;
              unint64_t v511 = v442 & 0xFFFFFFFFFFFFFFFCLL;
              do
              {
                v512.i32[0] = *(v510 - 8);
                v512.i32[1] = *(v510 - 4);
                v512.i32[2] = *v510;
                v512.i32[3] = v510[4];
                *(float32x4_t *)(v507 + v509) = vmulq_n_f32(v512, v496);
                v509 += 16;
                v510 += 16;
                v511 -= 4;
              }
              while (v511);
              unint64_t v513 = v442 & 0xFFFFFFFFFFFFFFFCLL;
              if (v442 == v492) {
                goto LABEL_476;
              }
            }
            else
            {
              unint64_t v513 = 0;
            }
            unint64_t v514 = v442 - v513;
            uint64_t v515 = 4 * v513;
            do
            {
              *(float *)(v507 + v515) = v496 * *(float *)&v506[4 * v515];
              v515 += 4;
              --v514;
            }
            while (v514);
LABEL_476:
            ++v504;
            v507 += v441;
            v505 = (__int32 *)((char *)v505 + v491);
            v506 += v491;
            if (v504 == v443) {
              goto LABEL_488;
            }
          }
        }
        uint64_t v188 = v571 * v164;
LABEL_237:
        v92 += 3 * v188;
        goto LABEL_238;
      }
    }
    if (v95 <= 1) {
      uint64_t v187 = 1;
    }
    else {
      uint64_t v187 = end - begin;
    }
    uint64_t v188 = v571 * v187;
    goto LABEL_237;
  }
  if (targetStorageType != 65552)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v576) = targetStorageType;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unsupported storage type 0x%x", buf, 8u);
    }
    int64_t v16 = -22951;
    goto LABEL_57;
  }
  id v18 = v574;
  uint64_t v19 = [v18 data];
  uint64_t v20 = [v18 batchBytes];
  uint64_t v21 = [v18 channelBytes];
  uint64_t v570 = [v18 channelBytes];
  uint64_t v22 = [v18 rowBytes];
  unint64_t v23 = [v18 width];
  uint64_t v24 = [v18 height];
  uint64_t v25 = v24;
  v529 = v18;
  unint64_t v26 = v20 * a6;
  unint64_t v27 = v21 * a5;
  unint64_t v28 = v19 + v20 * a6 + v21 * a5;
  __int16 v30 = v553->_trigFactors.__begin_;
  v29 = v553->_trigFactors.__end_;
  v547 = *(void **)a3;
  unint64_t v31 = v29 - v30;
  v554 = v30;
  if (*((void *)a3 + 1) - *(void *)a3 == 16)
  {
    if (v29 == v30) {
      goto LABEL_167;
    }
    if (v24)
    {
      if (v31 <= 1) {
        unint64_t v31 = 1;
      }
      if (v23)
      {
        uint64_t v32 = 0;
        LODWORD(v33) = HIDWORD(*v547);
        long long v548 = *(_OWORD *)v547;
        unint64_t v34 = v23 & 0xFFFFFFFFFFFFFFF0;
        unint64_t v35 = v23 & 0xFFFFFFFFFFFFFFF0;
        uint64_t v36 = v26 + v27 + v19 + 16;
        uint64_t v534 = 3 * v570;
        uint64_t v37 = v36 + v570;
        uint64_t v560 = v36;
        uint64_t v38 = v36 + 2 * v570;
        unint64_t v538 = v31;
        while (1)
        {
          float v41 = v30[v32];
          *(float *)_D0.i32 = sinf(*(float *)&v548 * v41);
          __asm { FCVT            H0, S0 }
          if (v23 > 0xF)
          {
            int16x8_t v49 = vdupq_lane_s16(_D0, 0);
            if (v23 == v34)
            {
              uint64_t v50 = 0;
              v51 = (int16x8_t *)v560;
              do
              {
                v52 = v51;
                unint64_t v53 = v23;
                do
                {
                  v52[-1] = v49;
                  int16x8_t *v52 = v49;
                  v52 += 2;
                  v53 -= 16;
                }
                while (v53);
                ++v50;
                v51 = (int16x8_t *)((char *)v51 + v22);
              }
              while (v50 != v25);
            }
            else
            {
              uint64_t v54 = 0;
              v55 = (int16x8_t *)v560;
              unint64_t v56 = v28;
              do
              {
                v57 = v55;
                unint64_t v58 = v23 & 0xFFFFFFFFFFFFFFF0;
                do
                {
                  v57[-1] = v49;
                  int16x8_t *v57 = v49;
                  v57 += 2;
                  v58 -= 16;
                }
                while (v58);
                v59 = (_WORD *)(v56 + v35 * 2);
                unint64_t v60 = v23 & 0xF;
                do
                {
                  *v59++ = _D0.i16[0];
                  --v60;
                }
                while (v60);
                ++v54;
                v56 += v22;
                v55 = (int16x8_t *)((char *)v55 + v22);
              }
              while (v54 != v25);
            }
          }
          else
          {
            uint64_t v46 = 0;
            unint64_t v47 = v28;
            do
            {
              for (uint64_t m = 0; m != v23; ++m)
                *(_WORD *)(v47 + 2 * m) = _D0.i16[0];
              ++v46;
              v47 += v22;
            }
            while (v46 != v25);
          }
          unint64_t v61 = v28 + v570;
          *(float *)_D0.i32 = sinf(v33 * v41);
          uint64_t v62 = 0;
          __asm { FCVT            H0, S0 }
          int16x8_t v64 = vdupq_lane_s16(_D0, 0);
          v65 = (int16x8_t *)v37;
          v66 = (_WORD *)v61;
          do
          {
            v67 = v66;
            unint64_t v68 = v23;
            if (v23 < 0x10) {
              goto LABEL_44;
            }
            v69 = v65;
            unint64_t v70 = v23 & 0xFFFFFFFFFFFFFFF0;
            do
            {
              v69[-1] = v64;
              int16x8_t *v69 = v64;
              v69 += 2;
              v70 -= 16;
            }
            while (v70);
            if (v23 != v34)
            {
              v67 = &v66[v35];
              unint64_t v68 = v23 & 0xF;
              do
              {
LABEL_44:
                *v67++ = _D0.i16[0];
                --v68;
              }
              while (v68);
            }
            ++v62;
            v66 = (_WORD *)((char *)v66 + v22);
            v65 = (int16x8_t *)((char *)v65 + v22);
          }
          while (v62 != v25);
          v71 = (_WORD *)(v61 + v570);
          *(float *)_D0.i32 = sinf(*((float *)&v548 + 2) * v41);
          uint64_t v72 = 0;
          __asm { FCVT            H0, S0 }
          int16x8_t v74 = vdupq_lane_s16(_D0, 0);
          v75 = (int16x8_t *)v38;
          v76 = v71;
          __int16 v30 = v554;
          do
          {
            v77 = v76;
            unint64_t v78 = v23;
            if (v23 < 0x10) {
              goto LABEL_53;
            }
            v79 = v75;
            unint64_t v80 = v23 & 0xFFFFFFFFFFFFFFF0;
            do
            {
              v79[-1] = v74;
              int16x8_t *v79 = v74;
              v79 += 2;
              v80 -= 16;
            }
            while (v80);
            if (v23 != v34)
            {
              v77 = &v76[v35];
              unint64_t v78 = v23 & 0xF;
              do
              {
LABEL_53:
                *v77++ = _D0.i16[0];
                --v78;
              }
              while (v78);
            }
            ++v72;
            v76 = (_WORD *)((char *)v76 + v22);
            v75 = (int16x8_t *)((char *)v75 + v22);
          }
          while (v72 != v25);
          unint64_t v28 = (unint64_t)v71 + v570;
          ++v32;
          v560 += v534;
          v37 += v534;
          v38 += v534;
          if (v32 == v538) {
            goto LABEL_167;
          }
        }
      }
      uint64_t v186 = v570 * v31;
      goto LABEL_166;
    }
    goto LABEL_153;
  }
  if (v29 == v30) {
    goto LABEL_167;
  }
  if (!v24)
  {
LABEL_153:
    if (v31 <= 1) {
      uint64_t v185 = 1;
    }
    else {
      uint64_t v185 = v29 - v30;
    }
    uint64_t v186 = v570 * v185;
    goto LABEL_166;
  }
  if (v31 <= 1) {
    uint64_t v141 = 1;
  }
  else {
    uint64_t v141 = v29 - v30;
  }
  if (!v23)
  {
    uint64_t v186 = v570 * v141;
LABEL_166:
    v28 += 3 * v186;
    goto LABEL_167;
  }
  uint64_t v142 = 0;
  uint64_t v143 = 16 * v23;
  uint64_t v540 = v141;
  do
  {
    uint64_t v144 = 0;
    float v145 = v30[v142];
    v146 = v547;
    unint64_t v147 = v28;
    do
    {
      for (uint64_t n = 0; n != v23; ++n)
      {
        _S0 = sinf(v145 * *(float *)&v146[2 * n]);
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v147 + 2 * n) = LOWORD(_S0);
      }
      ++v144;
      v147 += v22;
      v146 = (void *)((char *)v146 + v143);
    }
    while (v144 != v25);
    uint64_t v150 = 0;
    unint64_t v151 = v28 + v570;
    v152 = (float *)v547 + 1;
    unint64_t v562 = v151;
    do
    {
      uint64_t v153 = 0;
      v154 = v152;
      do
      {
        float v155 = *v154;
        v154 += 4;
        _S0 = sinf(v145 * v155);
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v151 + 2 * v153++) = LOWORD(_S0);
      }
      while (v23 != v153);
      ++v150;
      v151 += v22;
      v152 = (float *)((char *)v152 + v143);
    }
    while (v150 != v25);
    uint64_t v157 = 0;
    unint64_t v158 = v562 + v570;
    v159 = (float *)(v547 + 1);
    unint64_t v563 = v562 + v570;
    do
    {
      uint64_t v160 = 0;
      v161 = v159;
      do
      {
        float v162 = *v161;
        v161 += 4;
        _S0 = sinf(v145 * v162);
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v158 + 2 * v160++) = LOWORD(_S0);
      }
      while (v23 != v160);
      ++v157;
      v158 += v22;
      v159 = (float *)((char *)v159 + v143);
    }
    while (v157 != v25);
    unint64_t v28 = v563 + v570;
    ++v142;
    __int16 v30 = v554;
  }
  while (v142 != v540);
LABEL_167:
  v189 = v529;
  uint64_t v572 = objc_msgSend(v529, "channelBytes", v529);
  uint64_t v190 = [v189 rowBytes];
  unint64_t v191 = [v189 width];
  uint64_t v192 = [v189 height];
  uint64_t v193 = v192;
  v195 = v553->_trigFactors.__begin_;
  v194 = v553->_trigFactors.__end_;
  v550 = (void *)*v546;
  unint64_t v196 = v194 - v195;
  v557 = v195;
  if (v546[1] - *v546 == 16)
  {
    if (v194 == v195) {
      goto LABEL_314;
    }
    if (v192)
    {
      if (v196 <= 1) {
        uint64_t v197 = 1;
      }
      else {
        uint64_t v197 = v194 - v195;
      }
      if (v191)
      {
        uint64_t v198 = 0;
        LODWORD(v199) = HIDWORD(*v550);
        long long v551 = *(_OWORD *)v550;
        unint64_t v200 = v191 & 0xFFFFFFFFFFFFFFF0;
        unint64_t v201 = v191 & 0xFFFFFFFFFFFFFFF0;
        uint64_t v536 = 3 * v572;
        unint64_t v202 = v28 + 16 + v572;
        unint64_t v565 = v28 + 16;
        uint64_t v203 = v28 + 16 + 2 * v572;
        uint64_t v542 = v197;
        while (1)
        {
          float v204 = v195[v198];
          *(float *)_D0.i32 = cosf(*(float *)&v551 * v204);
          __asm { FCVT            H0, S0 }
          if (v191 > 0xF)
          {
            int16x8_t v209 = vdupq_lane_s16(_D0, 0);
            if (v191 == v200)
            {
              uint64_t v210 = 0;
              v211 = (int16x8_t *)v565;
              do
              {
                v212 = v211;
                unint64_t v213 = v191;
                do
                {
                  v212[-1] = v209;
                  int16x8_t *v212 = v209;
                  v212 += 2;
                  v213 -= 16;
                }
                while (v213);
                ++v210;
                v211 = (int16x8_t *)((char *)v211 + v190);
              }
              while (v210 != v193);
            }
            else
            {
              uint64_t v214 = 0;
              v215 = (int16x8_t *)v565;
              unint64_t v216 = v28;
              do
              {
                v217 = v215;
                unint64_t v218 = v191 & 0xFFFFFFFFFFFFFFF0;
                do
                {
                  v217[-1] = v209;
                  int16x8_t *v217 = v209;
                  v217 += 2;
                  v218 -= 16;
                }
                while (v218);
                unint64_t v219 = 2 * (v191 & 0xFFFFFFFFFFFFFFF0);
                unint64_t v220 = v191 & 0xF;
                do
                {
                  *(_WORD *)(v216 + v219) = _D0.i16[0];
                  v219 += 2;
                  --v220;
                }
                while (v220);
                ++v214;
                v216 += v190;
                v215 = (int16x8_t *)((char *)v215 + v190);
              }
              while (v214 != v193);
            }
          }
          else
          {
            uint64_t v206 = 0;
            unint64_t v207 = v28;
            do
            {
              for (iuint64_t i = 0; ii != v191; ++ii)
                *(_WORD *)(v207 + 2 * ii) = _D0.i16[0];
              ++v206;
              v207 += v190;
            }
            while (v206 != v193);
          }
          unint64_t v221 = v28 + v572;
          *(float *)_D0.i32 = cosf(v199 * v204);
          uint64_t v222 = 0;
          __asm { FCVT            H0, S0 }
          int16x8_t v224 = vdupq_lane_s16(_D0, 0);
          v225 = (int16x8_t *)v202;
          v226 = (_WORD *)v221;
          do
          {
            v227 = v226;
            unint64_t v228 = v191;
            if (v191 < 0x10) {
              goto LABEL_201;
            }
            v229 = v225;
            unint64_t v230 = v191 & 0xFFFFFFFFFFFFFFF0;
            do
            {
              v229[-1] = v224;
              int16x8_t *v229 = v224;
              v229 += 2;
              v230 -= 16;
            }
            while (v230);
            if (v191 != v200)
            {
              v227 = &v226[v201];
              unint64_t v228 = v191 & 0xF;
              do
              {
LABEL_201:
                *v227++ = _D0.i16[0];
                --v228;
              }
              while (v228);
            }
            ++v222;
            v226 = (_WORD *)((char *)v226 + v190);
            v225 = (int16x8_t *)((char *)v225 + v190);
          }
          while (v222 != v193);
          v231 = (_WORD *)(v221 + v572);
          *(float *)_D0.i32 = cosf(*((float *)&v551 + 2) * v204);
          uint64_t v232 = 0;
          __asm { FCVT            H0, S0 }
          int16x8_t v234 = vdupq_lane_s16(_D0, 0);
          v235 = (int16x8_t *)v203;
          v236 = v231;
          do
          {
            v237 = v236;
            unint64_t v238 = v191;
            if (v191 < 0x10) {
              goto LABEL_210;
            }
            v239 = v235;
            unint64_t v240 = v191 & 0xFFFFFFFFFFFFFFF0;
            do
            {
              v239[-1] = v234;
              int16x8_t *v239 = v234;
              v239 += 2;
              v240 -= 16;
            }
            while (v240);
            if (v191 != v200)
            {
              v237 = &v236[v201];
              unint64_t v238 = v191 & 0xF;
              do
              {
LABEL_210:
                *v237++ = _D0.i16[0];
                --v238;
              }
              while (v238);
            }
            ++v232;
            v236 = (_WORD *)((char *)v236 + v190);
            v235 = (int16x8_t *)((char *)v235 + v190);
          }
          while (v232 != v193);
          unint64_t v28 = (unint64_t)v231 + v572;
          ++v198;
          v195 = v557;
          v565 += v536;
          v202 += v536;
          v203 += v536;
          if (v198 == v542) {
            goto LABEL_314;
          }
        }
      }
      uint64_t v264 = v572 * v197;
      goto LABEL_313;
    }
    goto LABEL_233;
  }
  if (v194 == v195) {
    goto LABEL_314;
  }
  if (!v192)
  {
LABEL_233:
    if (v196 <= 1) {
      unint64_t v196 = 1;
    }
    uint64_t v264 = v572 * v196;
    goto LABEL_313;
  }
  if (v196 <= 1) {
    uint64_t v241 = 1;
  }
  else {
    uint64_t v241 = v194 - v195;
  }
  if (!v191)
  {
    uint64_t v264 = v572 * v241;
LABEL_313:
    v28 += 3 * v264;
    goto LABEL_314;
  }
  uint64_t v242 = 0;
  uint64_t v243 = 16 * v191;
  uint64_t v543 = v241;
  do
  {
    uint64_t v244 = 0;
    float v245 = v195[v242];
    v246 = v550;
    unint64_t v247 = v28;
    do
    {
      for (uint64_t jj = 0; jj != v191; ++jj)
      {
        _S0 = cosf(v245 * *(float *)&v246[2 * jj]);
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v247 + 2 * jj) = LOWORD(_S0);
      }
      ++v244;
      v247 += v190;
      v246 = (void *)((char *)v246 + v243);
    }
    while (v244 != v193);
    uint64_t v250 = 0;
    unint64_t v251 = v28 + v572;
    v252 = (float *)v550 + 1;
    unint64_t v566 = v251;
    do
    {
      uint64_t v253 = 0;
      v254 = v252;
      do
      {
        float v255 = *v254;
        v254 += 4;
        _S0 = cosf(v245 * v255);
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v251 + 2 * v253++) = LOWORD(_S0);
      }
      while (v191 != v253);
      ++v250;
      v251 += v190;
      v252 = (float *)((char *)v252 + v243);
    }
    while (v250 != v193);
    uint64_t v257 = 0;
    unint64_t v258 = v566 + v572;
    v259 = (float *)(v550 + 1);
    unint64_t v567 = v566 + v572;
    do
    {
      uint64_t v260 = 0;
      v261 = v259;
      do
      {
        float v262 = *v261;
        v261 += 4;
        _S0 = cosf(v245 * v262);
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v258 + 2 * v260++) = LOWORD(_S0);
      }
      while (v191 != v260);
      ++v257;
      v258 += v190;
      v259 = (float *)((char *)v259 + v243);
    }
    while (v257 != v193);
    unint64_t v28 = v567 + v572;
    ++v242;
    v195 = v557;
  }
  while (v242 != v543);
LABEL_314:
  uint64_t v339 = [v531 channelBytes];
  uint64_t v340 = [v531 rowBytes];
  unint64_t v341 = [v531 width];
  uint64_t v342 = [v531 height];
  v345 = (void *)*v546;
  v346 = v553->_valuesFactor.__begin_;
  v347 = v553->_valuesFactor.__end_;
  unint64_t v348 = v347 - v346;
  if (v546[1] - *v546 == 16)
  {
    if (v347 == v346 || !v342) {
      goto LABEL_504;
    }
    if (v348 <= 1) {
      unint64_t v348 = 1;
    }
    if (!v341) {
      goto LABEL_504;
    }
    uint64_t v349 = 0;
    long long v350 = *(_OWORD *)v345;
    LODWORD(v351) = HIDWORD(*v345);
    LODWORD(v352) = v345[1];
    unint64_t v353 = v341 & 0xFFFFFFFFFFFFFFF0;
    unint64_t v354 = v341 & 0xFFFFFFFFFFFFFFF0;
    unint64_t v355 = v28 + 16;
    uint64_t v356 = 3 * v339;
    unint64_t v357 = v28 + 16 + v339;
    uint64_t v358 = v28 + 16 + 2 * v339;
LABEL_322:
    *(float *)_D3.i32 = v346[v349];
    *(float *)_Q4.i32 = *(float *)&v350 * *(float *)_D3.i32;
    __asm { FCVT            H4, S4 }
    if (v341 > 0xF)
    {
      int16x8_t v362 = vdupq_lane_s16(*(int16x4_t *)_Q4.i8, 0);
      if (v341 == v353)
      {
        uint64_t v363 = 0;
        v364 = (int16x8_t *)v355;
        do
        {
          v365 = v364;
          unint64_t v366 = v341;
          do
          {
            v365[-1] = v362;
            int16x8_t *v365 = v362;
            v365 += 2;
            v366 -= 16;
          }
          while (v366);
          ++v363;
          v364 = (int16x8_t *)((char *)v364 + v340);
        }
        while (v363 != v342);
      }
      else
      {
        uint64_t v367 = 0;
        v368 = (int16x8_t *)v355;
        unint64_t v369 = v28;
        do
        {
          v370 = v368;
          unint64_t v371 = v341 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v370[-1] = v362;
            int16x8_t *v370 = v362;
            v370 += 2;
            v371 -= 16;
          }
          while (v371);
          unint64_t v372 = 2 * (v341 & 0xFFFFFFFFFFFFFFF0);
          unint64_t v373 = v341 & 0xF;
          do
          {
            *(_WORD *)(v369 + v372) = _Q4.i16[0];
            v372 += 2;
            --v373;
          }
          while (v373);
          ++v367;
          v369 += v340;
          v368 = (int16x8_t *)((char *)v368 + v340);
        }
        while (v367 != v342);
      }
    }
    else
    {
      uint64_t v359 = 0;
      unint64_t v360 = v28;
      do
      {
        for (uint64_t kk = 0; kk != v341; ++kk)
          *(_WORD *)(v360 + 2 * kk) = _Q4.i16[0];
        ++v359;
        v360 += v340;
      }
      while (v359 != v342);
    }
    uint64_t v374 = 0;
    *(float *)_Q4.i32 = v351 * *(float *)_D3.i32;
    __asm { FCVT            H4, S4 }
    int16x8_t v375 = vdupq_lane_s16(*(int16x4_t *)_Q4.i8, 0);
    v376 = (int16x8_t *)v357;
    v377 = (_WORD *)(v28 + v339);
    while (1)
    {
      v378 = v377;
      unint64_t v379 = v341;
      if (v341 >= 0x10)
      {
        v380 = v376;
        unint64_t v381 = v341 & 0xFFFFFFFFFFFFFFF0;
        do
        {
          v380[-1] = v375;
          int16x8_t *v380 = v375;
          v380 += 2;
          v381 -= 16;
        }
        while (v381);
        if (v341 == v353) {
          goto LABEL_341;
        }
        v378 = &v377[v354];
        unint64_t v379 = v341 & 0xF;
      }
      do
      {
        *v378++ = _Q4.i16[0];
        --v379;
      }
      while (v379);
LABEL_341:
      ++v374;
      v377 = (_WORD *)((char *)v377 + v340);
      v376 = (int16x8_t *)((char *)v376 + v340);
      if (v374 == v342)
      {
        uint64_t v382 = 0;
        *(float *)_D3.i32 = v352 * *(float *)_D3.i32;
        __asm { FCVT            H3, S3 }
        _Q4 = vdupq_lane_s16(_D3, 0);
        v383 = (int16x8_t *)v358;
        v384 = (_WORD *)(v28 + v339 + v339);
        while (1)
        {
          v385 = v384;
          unint64_t v386 = v341;
          if (v341 >= 0x10)
          {
            v387 = v383;
            unint64_t v388 = v341 & 0xFFFFFFFFFFFFFFF0;
            do
            {
              v387[-1] = _Q4;
              int16x8_t *v387 = _Q4;
              v387 += 2;
              v388 -= 16;
            }
            while (v388);
            if (v341 == v353) {
              goto LABEL_350;
            }
            v385 = &v384[v354];
            unint64_t v386 = v341 & 0xF;
          }
          do
          {
            *v385++ = _D3.i16[0];
            --v386;
          }
          while (v386);
LABEL_350:
          ++v382;
          v384 = (_WORD *)((char *)v384 + v340);
          v383 = (int16x8_t *)((char *)v383 + v340);
          if (v382 == v342)
          {
            v28 += v339 + v339 + v339;
            ++v349;
            v355 += v356;
            v357 += v356;
            v358 += v356;
            if (v349 == v348) {
              goto LABEL_504;
            }
            goto LABEL_322;
          }
        }
      }
    }
  }
  if (v347 == v346 || !v342) {
    goto LABEL_504;
  }
  if (v348 <= 1) {
    unint64_t v348 = 1;
  }
  if (!v341) {
    goto LABEL_504;
  }
  uint64_t v389 = 0;
  uint64_t v390 = 16 * v341;
  unint64_t v391 = v341 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v392 = v339 + v28 + 6;
  unint64_t v393 = v28;
  uint64_t v394 = 3 * v339;
  while (2)
  {
    uint64_t v395 = 0;
    float v396 = v346[v389];
    v397 = v345;
    unint64_t v398 = v393;
    do
    {
      for (muint64_t m = 0; mm != v341; ++mm)
      {
        _S1 = v396 * *(float *)&v397[2 * mm];
        __asm { FCVT            H1, S1 }
        *(_WORD *)(v398 + 2 * mm) = LOWORD(_S1);
      }
      ++v395;
      v398 += v340;
      v397 = (void *)((char *)v397 + v390);
    }
    while (v395 != v342);
    unint64_t v401 = v393 + v339;
    if (v341 >= 8)
    {
      uint64_t v412 = 0;
      v413 = (__int32 *)v345 + 17;
      uint64_t v414 = (uint64_t)v345 + 4;
      unint64_t v415 = v401;
      while (1)
      {
        _CF = v415 >= (unint64_t)&v345[2 * v341 - 1] + v390 * v412
           || (unint64_t)v345 + ((v390 * v412) | 4) >= v28 + v339 + 2 * v341 + v394 * v389 + v340 * v412;
        if (_CF)
        {
          uint64_t v417 = 0;
          v418 = v413;
          unint64_t v419 = v341 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            v420.i32[0] = *(v418 - 16);
            v421.i32[0] = *v418;
            v420.i32[1] = *(v418 - 12);
            v420.i32[2] = *(v418 - 8);
            v420.i32[3] = *(v418 - 4);
            v421.i32[1] = v418[4];
            v421.i32[2] = v418[8];
            v421.i32[3] = v418[12];
            *(float16x8_t *)(v415 + v417) = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(vmulq_n_f32(v420, v396)), vmulq_n_f32(v421, v396));
            v417 += 16;
            v418 += 32;
            v419 -= 8;
          }
          while (v419);
          unint64_t v422 = v341 & 0xFFFFFFFFFFFFFFF8;
          if (v341 == v391) {
            goto LABEL_380;
          }
        }
        else
        {
          unint64_t v422 = 0;
        }
        v423 = (float *)(v414 + 16 * v422);
        do
        {
          float v424 = *v423;
          v423 += 4;
          _S1 = v396 * v424;
          __asm { FCVT            H1, S1 }
          *(_WORD *)(v415 + 2 * v422++) = LOWORD(_S1);
        }
        while (v341 != v422);
LABEL_380:
        ++v412;
        v415 += v340;
        v413 = (__int32 *)((char *)v413 + v390);
        v414 += v390;
        if (v412 == v342) {
          goto LABEL_392;
        }
      }
    }
    v402 = (float *)v345 + 13;
    v403 = (_WORD *)v392;
    uint64_t v404 = v342;
    do
    {
      _S1 = v396 * *(v402 - 12);
      __asm { FCVT            H1, S1 }
      *(v403 - 3) = LOWORD(_S1);
      if (v341 != 1)
      {
        _S1 = v396 * *(v402 - 8);
        __asm { FCVT            H1, S1 }
        *(v403 - 2) = LOWORD(_S1);
        if (v341 != 2)
        {
          _S1 = v396 * *(v402 - 4);
          __asm { FCVT            H1, S1 }
          *(v403 - 1) = LOWORD(_S1);
          if (v341 != 3)
          {
            _S1 = v396 * *v402;
            __asm { FCVT            H1, S1 }
            _WORD *v403 = LOWORD(_S1);
            if (v341 != 4)
            {
              _S1 = v396 * v402[4];
              __asm { FCVT            H1, S1 }
              v403[1] = LOWORD(_S1);
              if (v341 != 5)
              {
                _S1 = v396 * v402[8];
                __asm { FCVT            H1, S1 }
                v403[2] = LOWORD(_S1);
                if (v341 != 6)
                {
                  _S1 = v396 * v402[12];
                  __asm { FCVT            H1, S1 }
                  v403[3] = LOWORD(_S1);
                }
              }
            }
          }
        }
      }
      v403 = (_WORD *)((char *)v403 + v340);
      v402 = (float *)((char *)v402 + v390);
      --v404;
    }
    while (v404);
LABEL_392:
    uint64_t v426 = 0;
    v427 = (__int32 *)(v345 + 9);
    unint64_t v428 = v401 + v339;
    v429 = v345 + 1;
    unint64_t v430 = v428;
    do
    {
      if (v341 < 8)
      {
        unint64_t v431 = 0;
LABEL_404:
        v437 = (float *)&v429[2 * v431];
        do
        {
          float v438 = *v437;
          v437 += 4;
          _S1 = v396 * v438;
          __asm { FCVT            H1, S1 }
          *(_WORD *)(v430 + 2 * v431++) = LOWORD(_S1);
        }
        while (v341 != v431);
        goto LABEL_393;
      }
      unint64_t v431 = 0;
      if (v430 < (unint64_t)&v345[2 * v341 - 1] + v390 * v426 + 4
        && (unint64_t)v345 + ((v390 * v426) | 8) < v28 + 2 * (v339 + v341) + v394 * v389 + v340 * v426)
      {
        goto LABEL_404;
      }
      v433 = v427;
      unint64_t v434 = v341 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        v435.i32[0] = *(v433 - 16);
        v436.i32[0] = *v433;
        v435.i32[1] = *(v433 - 12);
        v435.i32[2] = *(v433 - 8);
        v435.i32[3] = *(v433 - 4);
        v436.i32[1] = v433[4];
        v436.i32[2] = v433[8];
        v436.i32[3] = v433[12];
        *(float16x8_t *)(v430 + v431) = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(vmulq_n_f32(v435, v396)), vmulq_n_f32(v436, v396));
        v431 += 16;
        v433 += 32;
        v434 -= 8;
      }
      while (v434);
      unint64_t v431 = v341 & 0xFFFFFFFFFFFFFFF8;
      if (v341 != v391) {
        goto LABEL_404;
      }
LABEL_393:
      ++v426;
      v430 += v340;
      v427 = (__int32 *)((char *)v427 + v390);
      v429 = (void *)((char *)v429 + v390);
    }
    while (v426 != v342);
    unint64_t v393 = v428 + v339;
    ++v389;
    v392 += v394;
    if (v389 != v348) {
      continue;
    }
    break;
  }
LABEL_504:

  int64_t v16 = 0;
LABEL_57:
  id v15 = v574;
LABEL_58:

  return v16;
}

- (ADEmbeddings)initWithBands:(unsigned int)a3 maxResolution:(float)a4 sourceFactor:(float)a5
{
  __p = 0;
  unint64_t v31 = 0;
  uint64_t v32 = 0;
  if (a3)
  {
    float v7 = a4;
    uint64_t v9 = a3;
    size_t v10 = 4 * a3;
    uint64_t v11 = (float32x4_t *)operator new(v10);
    __p = v11;
    uint64_t v32 = &v11->i8[4 * v9];
    bzero(v11, v10);
    unint64_t v31 = (char *)v11 + v10;
    a4 = (float)(v7 * 0.5) + -1.0;
    *(float *)v12.i32 = (float)(a3 - 1);
    if (a3 < 8)
    {
      for (unint64_t i = 0; i != v9; ++i)
LABEL_7:
        v11->f32[i] = (float)(a4 * (float)((float)i / *(float *)v12.i32)) + 1.0;
      goto LABEL_8;
    }
    unint64_t i = v9 & 0xFFFFFFF8;
    float32x4_t v14 = (float32x4_t)vdupq_lane_s32(v12, 0);
    float32x4_t v15 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a4, 0);
    int64x2_t v16 = (int64x2_t)xmmword_215FC45B0;
    uint64_t v17 = v11 + 1;
    int64x2_t v18 = vdupq_n_s64(4uLL);
    int64x2_t v19 = (int64x2_t)xmmword_215FC45C0;
    __asm { FMOV            V7.4S, #1.0 }
    int64x2_t v25 = vdupq_n_s64(8uLL);
    unint64_t v26 = i;
    do
    {
      v17[-1] = vmlaq_f32(_Q7, vdivq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)v19)), vcvtq_f64_u64((uint64x2_t)v16)), v14), v15);
      *uint64_t v17 = vmlaq_f32(_Q7, vdivq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)vaddq_s64(v19, v18))), vcvtq_f64_u64((uint64x2_t)vaddq_s64(v16, v18))), v14), v15);
      int64x2_t v16 = vaddq_s64(v16, v25);
      int64x2_t v19 = vaddq_s64(v19, v25);
      v17 += 2;
      v26 -= 8;
    }
    while (v26);
    if (i != v9) {
      goto LABEL_7;
    }
  }
LABEL_8:
  *(float *)&double v27 = a5;
  unint64_t v28 = [(ADEmbeddings *)self initWithFrequencies:&__p sourceFactor:v27];
  if (__p)
  {
    unint64_t v31 = (char *)__p;
    operator delete(__p);
  }
  return v28;
}

- (ADEmbeddings)initWithFrequencies:(const void *)a3 sourceFactor:(float)a4
{
  v24.receiver = self;
  v24.super_class = (Class)ADEmbeddings;
  v6 = [(ADEmbeddings *)&v24 init];
  float v7 = v6;
  if (!v6) {
    return v7;
  }
  p_trigFactors = &v6->_trigFactors;
  if (&v6->_trigFactors != a3) {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(&v6->_trigFactors.__begin_, *(char **)a3, *((char **)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2);
  }
  uint64_t v9 = *((void *)a3 + 1) - *(void *)a3;
  if (v9)
  {
    unint64_t v10 = v9 >> 2;
    double v11 = a4 * 3.14159265;
    begiuint64_t n = (float32x2_t *)p_trigFactors->__begin_;
    if (v10 <= 1) {
      unint64_t v10 = 1;
    }
    if (v10 > 7)
    {
      unint64_t v13 = v10 & 0xFFFFFFFFFFFFFFF8;
      float32x4_t v14 = begin + 2;
      unint64_t v15 = v10 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        float32x4_t v16 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*v14), v11)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)v14->f32), v11));
        *(float32x4_t *)v14[-2].f32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v14[-2]), v11)), vmulq_n_f64(vcvt_hight_f64_f32(*(float32x4_t *)v14[-2].f32), v11));
        *(float32x4_t *)v14->f32 = v16;
        v14 += 4;
        v15 -= 8;
      }
      while (v15);
      if (v10 == v13) {
        goto LABEL_14;
      }
    }
    else
    {
      unint64_t v13 = 0;
    }
    unint64_t v17 = v10 - v13;
    int64x2_t v18 = (float *)begin + v13;
    do
    {
      float v19 = v11 * *v18;
      *v18++ = v19;
      --v17;
    }
    while (v17);
  }
LABEL_14:
  uint64_t v20 = (float *)operator new(4uLL);
  *uint64_t v20 = a4;
  uint64_t v21 = v20 + 1;
  uint64_t v22 = v7->_valuesFactor.__begin_;
  if (v22)
  {
    v7->_valuesFactor.__end_ = v22;
    operator delete(v22);
    v7->_valuesFactor.__begin_ = 0;
    v7->_valuesFactor.__end_ = 0;
    v7->_valuesFactor.__end_cap_.__value_ = 0;
  }
  v7->_valuesFactor.__begin_ = v20;
  v7->_valuesFactor.__end_ = v21;
  v7->_valuesFactor.__end_cap_.__value_ = v21;
  v7->_int targetStorageType = 65552;
  return v7;
}

@end