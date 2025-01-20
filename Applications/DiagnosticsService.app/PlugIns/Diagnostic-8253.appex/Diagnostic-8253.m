size_t JasDiagnosticInteractor::primaryScalerHxISPFrameAvailableCallback(size_t result, CVPixelBufferRef pixelBuffer, uint64_t a3, int a4)
{
  uint64_t v5;
  size_t Width;
  size_t Height;

  if (a4 == 3)
  {
    v5 = result;
    Width = CVPixelBufferGetWidth(pixelBuffer);
    Height = CVPixelBufferGetHeight(pixelBuffer);
    result = CVPixelBufferGetDataSize(pixelBuffer);
    if (result)
    {
      if (Height * Width)
      {
        *(unsigned char *)(v5 + 21) = 1;
        ++*(_DWORD *)(v5 + 16);
      }
    }
  }
  return result;
}

JasDiagnosticInteractor *JasDiagnosticInteractor::setIsJasperSuperWideframeArrived(JasDiagnosticInteractor *this, int a2)
{
  if (a2)
  {
    this->m_isRgbSuperWideFramesArrived = 1;
    ++this->m_rgbSuperWideFrameCount;
  }
  return this;
}

void JasDiagnosticInteractor::pointCloudHxISPFrameAvailableCallback(uint64_t a1, CVBufferRef buffer, uint64_t a3, int a4)
{
  if (buffer)
  {
    ++*(_DWORD *)(a1 + 92);
    CVBufferRetain(buffer);
    CFDictionaryRef v21 = CVBufferCopyAttachments(buffer, kCVAttachmentMode_ShouldPropagate);
    v20 = [(__CFDictionary *)v21 objectForKey:@"MetadataDictionary"];
    v19 = +[ADJasperPointCloud makeWithDataBuffer:buffer];
    int v7 = [v19 length];
    v8 = (float *)[v19 confidences];
    v9 = [v19 bankIds];
    int v10 = a4;
    if (!*v9)
    {
      sub_100002038(a1 + 64, *(void **)(a1 + 72));
      *(void *)(a1 + 64) = a1 + 72;
      *(void *)(a1 + 72) = 0;
      *(void *)(a1 + 80) = 0;
    }
    if (v7 >= 1)
    {
      uint64_t v11 = v7;
      do
      {
        int v12 = *v9++;
        int v22 = v12;
        v23 = (unsigned int *)&v22;
        *((_DWORD *)sub_10000208C((uint64_t **)(a1 + 64), &v22, (uint64_t)&unk_100017164, &v23) + 8) = 1;
        if (*v8 >= 0.5) {
          ++*(_DWORD *)(a1 + 88);
        }
        ++v8;
        --v11;
      }
      while (v11);
    }
    CVBufferRelease(buffer);
    if (v10 == 4 && *(void *)(a1 + 80) == *(_DWORD *)(a1 + 48))
    {
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/JasDiagnosticInteractor.mm"];
      v14 = [v13 lastPathComponent];
      v15 = +[NSString stringWithFormat:@"BankDict size %zu point count %d frame %d", *(void *)(a1 + 80), *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 8)];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 87, v15);

      JasDiagnosticInteractor::setIsJasperFrameArrived((JasDiagnosticInteractor *)a1, 1, *(_DWORD *)(a1 + 88), *(_DWORD *)(a1 + 92));
      uint64_t v16 = a1 + 64;
      v18 = *(void **)(a1 + 72);
      v17 = (void *)(a1 + 72);
      sub_100002038(v16, v18);
      *(v17 - 1) = v17;
      void *v17 = 0;
      v17[1] = 0;
      v17[2] = 0;
    }
  }
}

void sub_100001BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

JasDiagnosticInteractor *JasDiagnosticInteractor::setIsJasperFrameArrived(JasDiagnosticInteractor *this, int a2, int a3, int a4)
{
  if (a2)
  {
    v6 = this;
    this->m_isJasperFramesArrived = 1;
    int m_jasperFramesCount = this->m_jasperFramesCount;
    if (!m_jasperFramesCount)
    {
      this = (JasDiagnosticInteractor *)mach_absolute_time();
      v6->m_timer.beginTime = (unint64_t)this;
      int m_jasperFramesCount = v6->m_jasperFramesCount;
    }
    int v8 = v6->m_jasperPointsCount + a3;
    v6->int m_jasperFramesCount = m_jasperFramesCount + 1;
    v6->m_jasperPointsCount = v8;
    v6->m_subframeCount += a4;
  }
  return this;
}

void JasDiagnosticInteractor::JasDiagnosticInteractor(JasDiagnosticInteractor *this)
{
  this->_vptr$StreamingClient = (void **)off_10001C690;
  *(void *)&this->int m_jasperFramesCount = 0;
  p_int m_jasperFramesCount = &this->m_jasperFramesCount;
  *(void *)((char *)&this->m_jasperPointsCount + 2) = 0;
  mach_timebase_info(&this->m_timer.sTimebaseInfo);
  this->m_banksIdDictionary.__tree_.__pair1_.__value_.__left_ = 0;
  this->m_banksIdDictionary.__tree_.__begin_node_ = &this->m_banksIdDictionary.__tree_.__pair1_;
  this->m_deviceName = 0;
  this->m_banksIdDictionary.__tree_.__pair3_.__value_ = 0;
  this->m_maxBanksNumberForFrame = 4;
  this->m_minAveragePointsNumberThreshold = 200.0;
  v3 = (NSString *)MGCopyAnswer();
  m_deviceName = this->m_deviceName;
  this->m_deviceName = v3;

  v5 = [(NSString *)this->m_deviceName lowercaseString];
  if (([v5 hasPrefix:@"d8"] & 1) == 0)
  {
    v6 = [(NSString *)this->m_deviceName lowercaseString];
    if (([v6 hasPrefix:@"d9"] & 1) == 0)
    {
      int v7 = [(NSString *)this->m_deviceName lowercaseString];
      if (([v7 hasPrefix:@"v5"] & 1) == 0)
      {
        int v8 = [(NSString *)this->m_deviceName lowercaseString];
        if (([v8 hasPrefix:@"j7"] & 1) == 0)
        {
          v9 = [(NSString *)this->m_deviceName lowercaseString];
          unsigned __int8 v10 = [v9 hasPrefix:@"j8"];

          if ((v10 & 1) == 0) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }
    }
  }
LABEL_9:
  this->m_maxBanksNumberForFrame = 8;
  this->m_minAveragePointsNumberThreshold = 56.0;
LABEL_10:
  *(void *)((char *)p_m_jasperFramesCount + 6) = 0;
  *(void *)p_int m_jasperFramesCount = 0;
  sub_100002038((uint64_t)&this->m_banksIdDictionary, (void *)this->m_banksIdDictionary.__tree_.__pair1_.__value_.__left_);
  this->m_banksIdDictionary.__tree_.__pair1_.__value_.__left_ = 0;
  this->m_banksIdDictionary.__tree_.__pair3_.__value_ = 0;
  this->m_banksIdDictionary.__tree_.__begin_node_ = &this->m_banksIdDictionary.__tree_.__pair1_;
  *(void *)&this->m_goodPointsCount = 0;
  this->m_subframeCount = 0;
}

void sub_100001E38(_Unwind_Exception *a1)
{
  sub_100002038(v2, *(void **)(v1 + 72));
  _Unwind_Resume(a1);
}

void JasDiagnosticInteractor::resetMembers(JasDiagnosticInteractor *this)
{
  p_pair1 = &this->m_banksIdDictionary.__tree_.__pair1_;
  left = this->m_banksIdDictionary.__tree_.__pair1_.__value_.__left_;
  *(void *)((char *)&this->m_jasperPointsCount + 2) = 0;
  *(void *)&this->int m_jasperFramesCount = 0;
  sub_100002038((uint64_t)&this->m_banksIdDictionary, left);
  p_pair1[-1].__value_.__left_ = p_pair1;
  p_pair1->__value_.__left_ = 0;
  p_pair1[1].__value_.__left_ = 0;
  p_pair1[2].__value_.__left_ = 0;
  LODWORD(p_pair1[3].__value_.__left_) = 0;
}

double JasDiagnosticInteractor::getJasperFpsDuringStreaming(JasDiagnosticInteractor *this)
{
  return (double)this->m_subframeCount
       / (double)this->m_jasperFramesCount
       * ((double)this->m_jasperFramesCount
        * 1000.0
        / (double)((mach_absolute_time() - this->m_timer.beginTime)
                 * this->m_timer.sTimebaseInfo.numer
                 / this->m_timer.sTimebaseInfo.denom
                 / 0xF4240));
}

double JasDiagnosticInteractor::getJasperAveragePointsDuringStreaming(JasDiagnosticInteractor *this)
{
  int m_jasperFramesCount = this->m_jasperFramesCount;
  if (m_jasperFramesCount) {
    return (double)this->m_jasperPointsCount / (double)m_jasperFramesCount;
  }
  else {
    return 0.0;
  }
}

uint64_t sub_100001F78(uint64_t a1)
{
  *(void *)a1 = off_10001C690;
  sub_100002038(a1 + 64, *(void **)(a1 + 72));

  return a1;
}

void sub_100001FC8(uint64_t a1)
{
  *(void *)a1 = off_10001C690;
  sub_100002038(a1 + 64, *(void **)(a1 + 72));

  operator delete();
}

void sub_100002038(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100002038(a1, *a2);
    sub_100002038(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *sub_10000208C(uint64_t **a1, int *a2, uint64_t a3, unsigned int **a4)
{
  int v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10) {
          break;
        }
        v6 = *v9;
        int v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      v6 = v9[1];
      if (!v6)
      {
        int v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    sub_10000214C(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *sub_10000214C(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_1000021A4(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_1000021A4(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_100002788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002950(_Unwind_Exception *a1)
{
  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100002A88(_Unwind_Exception *a1, DeviceCMInterface *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_100002B34(_Unwind_Exception *a1, DeviceCMInterface *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_100002C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000035BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100003668(uint64_t a1)
{
  uint64_t v2 = *(id **)(a1 + 8);
  uint64_t v1 = *(id **)(a1 + 16);
  if ((char *)v1 - (char *)v2 != 8) {
    return v1 == v2;
  }
  v4 = [*v2 allKeys];
  v5 = [v4 objectAtIndexedSubscript:0];
  unsigned int v6 = [v5 intValue];

  if (v6)
  {
    uint64_t v2 = *(id **)(a1 + 8);
    uint64_t v1 = *(id **)(a1 + 16);
    return v1 == v2;
  }
  return 1;
}

void sub_1000036E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003704(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = +[NSNumber numberWithInt:a2];
  v28 = v6;
  id v29 = v5;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  unint64_t v8 = a1[3];
  v9 = (uint64_t *)a1[2];
  if ((unint64_t)v9 >= v8)
  {
    uint64_t v11 = a1[1];
    uint64_t v12 = ((uint64_t)v9 - v11) >> 3;
    if ((unint64_t)(v12 + 1) >> 61) {
      sub_100005E68();
    }
    uint64_t v13 = v8 - v11;
    uint64_t v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1)) {
      uint64_t v14 = v12 + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    v27 = a1 + 3;
    if (v15) {
      uint64_t v16 = (char *)sub_100005F24((uint64_t)(a1 + 3), v15);
    }
    else {
      uint64_t v16 = 0;
    }
    v17 = (uint64_t *)&v16[8 * v12];
    v18 = &v16[8 * v15];
    v26 = v18;
    uint64_t *v17 = v7;
    int v10 = v17 + 1;
    v25.i64[1] = (uint64_t)(v17 + 1);
    v20 = (void *)a1[1];
    v19 = (void *)a1[2];
    if (v19 == v20)
    {
      int64x2_t v22 = vdupq_n_s64((unint64_t)v19);
    }
    else
    {
      do
      {
        uint64_t v21 = *--v19;
        void *v19 = 0;
        *--v17 = v21;
      }
      while (v19 != v20);
      int64x2_t v22 = *(int64x2_t *)(a1 + 1);
      int v10 = (void *)v25.i64[1];
      v18 = v26;
    }
    a1[1] = v17;
    a1[2] = v10;
    int64x2_t v25 = v22;
    v23 = (char *)a1[3];
    a1[3] = v18;
    v26 = v23;
    uint64_t v24 = v22.i64[0];
    sub_100005F90((uint64_t)&v24);
  }
  else
  {
    uint64_t *v9 = v7;
    int v10 = v9 + 1;
  }
  a1[2] = v10;
}

void sub_10000389C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000039B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100004A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_100004D9C(id *a1)
{
  v3 = a1 + 1;
  sub_1000060A8(&v3);

  return a1;
}

void sub_100004EA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100004D9C((id *)va);
  _Unwind_Resume(a1);
}

void sub_100005030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,void *a38)
{
  sub_100002038((uint64_t)&a37, a38);
  _Unwind_Resume(a1);
}

void sub_100005CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005E68()
{
}

void sub_100005E80(void *a1)
{
}

void sub_100005E94(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100005EF0(exception, a1);
}

void sub_100005EDC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100005EF0(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100005F24(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100005F5C();
  }
  return operator new(8 * a2);
}

void sub_100005F5C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_100005F90(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char *sub_100005FE4(char *result, void **a2, void **a3, unint64_t a4)
{
  if (a4)
  {
    unsigned int v6 = result;
    result = sub_100006064(result, a4);
    uint64_t v7 = (char **)*((void *)v6 + 1);
    while (a2 != a3)
    {
      unint64_t v8 = *a2++;
      result = v8;
      *v7++ = result;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_100006050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *sub_100006064(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100005E68();
  }
  result = (char *)sub_100005F24((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_1000060A8(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        unsigned int v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_100006128(uint64_t *a1, _DWORD *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 3;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 61) {
    sub_100005E68();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 2 > v5) {
    unint64_t v5 = v8 >> 2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v9 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v19 = a1 + 2;
  int v10 = (char *)sub_100005F24(v7, v9);
  uint64_t v11 = &v10[8 * v4];
  __p = v10;
  uint64_t v16 = v11;
  v18 = &v10[8 * v12];
  *(_DWORD *)uint64_t v11 = *a2;
  *((_DWORD *)v11 + 1) = a2[1];
  v17 = v11 + 8;
  sub_10000624C(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    v17 += (v16 - v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_100006214(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_10000624C(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    int v5 = *(_DWORD *)(v2 - 8);
    v2 -= 8;
    *(_DWORD *)(v4 - 8) = v5;
    v4 -= 8;
    *(_DWORD *)(v4 + 4) = *(_DWORD *)(v2 + 4);
  }
  a2[1] = v4;
  uint64_t v6 = *result;
  char *result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1000062AC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = (a1[1] - *a1) >> 5;
  unint64_t v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) >> 59) {
    sub_100005E68();
  }
  uint64_t v6 = a1[2] - *a1;
  if (v6 >> 4 > v4) {
    unint64_t v4 = v6 >> 4;
  }
  if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v7 = v4;
  }
  unint64_t v15 = a1 + 2;
  if (v7) {
    uint64_t v8 = (char *)sub_100006474((uint64_t)(a1 + 2), v7);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v11 = v8;
  uint64_t v12 = &v8[32 * v3];
  uint64_t v14 = &v8[32 * v7];
  sub_10000639C((uint64_t)(a1 + 2), (uint64_t)v12, a2);
  uint64_t v13 = v12 + 32;
  sub_1000063FC(a1, &v11);
  uint64_t v9 = a1[1];
  sub_10000667C((uint64_t)&v11);
  return v9;
}

void sub_100006388(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000667C((uint64_t)va);
  _Unwind_Resume(a1);
}

char *sub_10000639C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a2 = *(id *)a3;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 8) = 0;
  return sub_100005FE4((char *)(a2 + 8), *(void ***)(a3 + 8), *(void ***)(a3 + 16), (uint64_t)(*(void *)(a3 + 16) - *(void *)(a3 + 8)) >> 3);
}

void sub_1000063E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000063FC(uint64_t *a1, void *a2)
{
  uint64_t result = sub_1000064AC((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_100006474(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_100005F5C();
  }
  return operator new(32 * a2);
}

uint64_t sub_1000064AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      uint64_t v8 = *(void *)(a3 - 32);
      a3 -= 32;
      *(void *)a3 = 0;
      *(void *)(v7 - 32) = v8;
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 8);
      *(void *)(v7 - 8) = *(void *)(a3 + 24);
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)(a3 + 24) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 32;
      *((void *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_100006558((uint64_t)v11);
  return v9;
}

uint64_t sub_100006558(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100006590((uint64_t *)a1);
  }
  return a1;
}

void sub_100006590(uint64_t *a1)
{
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  sub_100006608(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_100006608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = *(id **)(a2 + 32); i != *(id **)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    uint64_t v6 = i + 1;
    sub_1000060A8(&v6);

    uint64_t i = (id *)(*(void *)(a2 + 32) + 32);
  }
}

uint64_t sub_10000667C(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_1000066B4(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 32;
    uint64_t v5 = (void **)(i - 24);
    sub_1000060A8(&v5);
  }
}

void sub_100006720(void ***a1)
{
  uint64_t v2 = (uint64_t *)*a1;
  if (*v2)
  {
    sub_100006774((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_100006774(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 8); i != a2; i -= 32)
  {
    uint64_t v6 = (void **)(i - 24);
    sub_1000060A8(&v6);
    uint64_t v5 = *(void **)(i - 32);
  }
  *(void *)(a1 + 8) = a2;
}

void DeviceCMInterface::DeviceCMInterface(DeviceCMInterface *this)
{
  this->m_currentPearlConfiguration.deviceName = 0;
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(void *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
}

{
  this->m_currentPearlConfiguration.deviceName = 0;
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(void *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
}

DeviceCMInterface *DeviceCMInterface::resetMembers(DeviceCMInterface *this)
{
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(void *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
  return this;
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseInterface(DeviceCMInterface *this)
{
  uint64_t result = this->m_captureDeviceController;
  if (result)
  {
    HxISPCaptureDeviceController::deactivate(result);
    uint64_t result = this->m_captureDeviceController;
    if (result)
    {
      HxISPCaptureDeviceController::~HxISPCaptureDeviceController(result);
      operator delete();
    }
  }
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(void *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
  return result;
}

void DeviceCMInterface::~DeviceCMInterface(DeviceCMInterface *this)
{
}

void DeviceCMInterface::initAndActivateCaptureDeviceController(DeviceCMInterface *this)
{
}

void sub_100006A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setSWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 40), a2);
}

uint64_t DeviceCMInterface::setRgbConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x80000000) != 0 || (uint64_t v3 = *(HxISPCaptureDeviceController **)(a1 + 16)) == 0)
  {
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    long long v13 = [v12 lastPathComponent];
    uint64_t v14 = +[NSString stringWithFormat:@"error bad streamID of %d ", a2];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 164, v14);

    return 3758097084;
  }
  uint64_t v5 = *(unsigned int *)(a3 + 44);
  if (v5 == -1)
  {
    id v78 = 0;
    uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, a2, kFigCaptureStreamProperty_SupportedFormatsArray, &v78);
    if (v7)
    {
      id obja = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v15 = [obja lastPathComponent];
      uint64_t v16 = DeviceCMInterface::getErrorInformationString(v7);
      uint64_t v17 = +[NSString stringWithFormat:@"error %d failed to get sw stream supported formats %@", v7, v16];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 175, v17);

      return (uint64_t)v7;
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id obj = v78;
    id v31 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
    if (v31)
    {
      int v32 = -1;
      uint64_t v72 = *(void *)v75;
      while (2)
      {
        v33 = 0;
        int v67 = v32 + v31;
        int v68 = v32;
        do
        {
          if (*(void *)v75 != v72) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v33);
          v35 = [v34 valueForKey:@"VideoIsBinned"];
          unsigned int v36 = [v35 BOOLValue];

          v37 = [v34 valueForKey:@"SensorWidth"];
          unsigned int v38 = [v37 integerValue];

          v39 = [v34 valueForKey:@"SensorHeight"];
          unsigned int v40 = [v39 integerValue];

          v41 = [v34 valueForKey:@"SupportedOutputs"];
          v42 = [v41 valueForKey:@"PrimaryScaler"];
          v43 = [v42 valueForKey:@"DefaultCropRect"];
          v44 = [v43 valueForKey:@"X"];
          [v44 floatValue];
          float v46 = v45;

          v47 = [v43 valueForKey:@"Y"];
          [v47 floatValue];
          float v49 = v48;

          v50 = [v43 valueForKey:@"Width"];
          [v50 floatValue];
          float v52 = v51;

          v53 = [v43 valueForKey:@"Height"];
          [v53 floatValue];
          float v55 = v54;

          BOOL v58 = *(unsigned __int8 *)(a3 + 40) != v36 || *(_DWORD *)a3 != v38 || *(_DWORD *)(a3 + 4) != v40;
          if (*(double *)(a3 + 8) != v46) {
            BOOL v58 = 1;
          }
          if (*(double *)(a3 + 16) != v49) {
            BOOL v58 = 1;
          }
          if (*(double *)(a3 + 24) != v52) {
            BOOL v58 = 1;
          }
          char v59 = *(double *)(a3 + 32) != v55 || v58;

          if ((v59 & 1) == 0)
          {
            uint64_t v5 = (v68 + v33 + 1);
            goto LABEL_47;
          }
          v33 = (char *)v33 + 1;
        }
        while (v31 != v33);
        id v31 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
        int v32 = v67;
        if (v31) {
          continue;
        }
        break;
      }
      uint64_t v5 = 0xFFFFFFFFLL;
LABEL_47:

      if (v5 != -1)
      {
        uint64_t v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
        goto LABEL_4;
      }
    }
    else
    {
    }
    v60 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v61 = [v60 lastPathComponent];
    v62 = DeviceCMInterface::getErrorInformationString(0);
    v63 = +[NSString stringWithFormat:@"error %d failed to find cam required format, %@", 0, v62];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v61, 216, v63);

    return 0;
  }
LABEL_4:
  uint64_t v6 = +[NSNumber numberWithInt:v5];
  uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v3, a2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)v6);
  if (!v7)
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    if (*(_DWORD *)(a3 + 52))
    {
      v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v18 setValue:v19 forKey:kFigCaptureStreamVideoOutputConfigurationKey_Height];
    }
    if (*(_DWORD *)(a3 + 48))
    {
      v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v18 setValue:v20 forKey:kFigCaptureStreamVideoOutputConfigurationKey_Width];
    }
    double v21 = *(double *)(a3 + 80);
    if (v21 != 0.0)
    {
      uint64_t v22 = *(void *)(a3 + 56);
      uint64_t v23 = *(void *)(a3 + 64);
      uint64_t v24 = *(void *)(a3 + 72);
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v21 - 3));
      [v18 setValue:DictionaryRepresentation forKey:kFigCaptureStreamVideoOutputConfigurationKey_CropRect];
    }
    if ([v18 count])
    {
      uint64_t v79 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
      id v80 = v18;
      CFBooleanRef v26 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_VideoOutputConfigurations, v26);
      if (v7)
      {
        v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v28 = [v27 lastPathComponent];
        id v29 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = +[NSString stringWithFormat:@"error %d failed to video configuration, %@", v7, v29];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v28, 243, v30);
        goto LABEL_18;
      }
    }
    if (*(_DWORD *)(a3 + 100))
    {
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_ContinuousAutoFocusNow, 0);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        id v29 = +[NSString stringWithFormat:@"error %d failed to set auto focus, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 251, v29);
        goto LABEL_66;
      }
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_AutoFocusPositionSensorMode, (const __CFBoolean *)&off_10001FAB0);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        id v29 = +[NSString stringWithFormat:@"error %d failed to set auto focus pos, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 257, v29);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 92))
    {
      v64 = *(HxISPCaptureDeviceController **)(a1 + 16);
      v65 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v64, a2, kFigCaptureStreamProperty_MaxIntegrationTime, (const __CFBoolean *)v65);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        id v29 = +[NSString stringWithFormat:@"error %d failed to set max integrtion time, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 265, v29);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 104))
    {
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_UnlockAENow, (const __CFBoolean *)&__kCFBooleanTrue);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        id v29 = +[NSString stringWithFormat:@"error %d failed to set unlock auto expsosure now, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 274, v29);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 96))
    {
      uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_SphereMode, kFigCaptureStreamSphereMode_Lock);
      if (v7)
      {
        CFBooleanRef v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v27 = [(__CFBoolean *)v26 lastPathComponent];
        v28 = DeviceCMInterface::getErrorInformationString(v7);
        id v29 = +[NSString stringWithFormat:@"error %d failed to set SphereMode, %@", v7, v28];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 283, v29);
        goto LABEL_66;
      }
    }
    if (!*(_DWORD *)(a3 + 88))
    {
      uint64_t v7 = 0;
      goto LABEL_68;
    }
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    CFBooleanRef v26 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_MaximumFrameRate, v26);
    if (!v7)
    {
LABEL_67:

LABEL_68:
      return (uint64_t)v7;
    }
    v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v28 = [v27 lastPathComponent];
    id v29 = DeviceCMInterface::getErrorInformationString(v7);
    v30 = +[NSString stringWithFormat:@"error %d failed to set auto focus, %@", v7, v29];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v28, 292, v30);
LABEL_18:

LABEL_66:
    goto LABEL_67;
  }
  uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v9 = [v8 lastPathComponent];
  uint64_t v10 = DeviceCMInterface::getErrorInformationString(v7);
  uint64_t v11 = +[NSString stringWithFormat:@"error %d failed to set sw format index, %@", v7, v10];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 222, v11);

  return (uint64_t)v7;
}

void sub_100007688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 28), a2);
}

uint64_t DeviceCMInterface::setFrontConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 32), a2);
}

const __CFString *DeviceCMInterface::getErrorInformationString(DeviceCMInterface *this)
{
  if ((int)this > -12789)
  {
    switch(this)
    {
      case 0xFFFFCE0C:
        CFStringRef result = @"base object error unsupported protocol";
        break;
      case 0xFFFFCE0D:
        CFStringRef result = @"base object error property not supported";
        break;
      case 0xFFFFCE0E:
        CFStringRef result = @"base object error allocation failed";
        break;
      case 0xFFFFCE0F:
        CFStringRef result = @"base object error invalidated";
        break;
      case 0xFFFFCE10:
        CFStringRef result = @"base object error property not found";
        break;
      case 0xFFFFCE11:
        CFStringRef result = @"base object error value not available";
        break;
      case 0xFFFFCE12:
        CFStringRef result = @"base object error unsupported operation";
        break;
      case 0xFFFFCE13:
        CFStringRef result = @"base object error unsupported version";
        break;
      case 0xFFFFCE14:
        CFStringRef result = @"base object error parameter error";
        break;
      default:
        if (this) {
LABEL_10:
        }
          CFStringRef result = @"Unknown error information";
        else {
          CFStringRef result = @"OK";
        }
        break;
    }
  }
  else
  {
    switch(this)
    {
      case 0xE00002BC:
        CFStringRef result = @"general error";
        break;
      case 0xE00002BD:
        CFStringRef result = @"can't allocate memory";
        break;
      case 0xE00002BE:
        CFStringRef result = @"resource shortage";
        break;
      case 0xE00002BF:
        CFStringRef result = @"error during IPC";
        break;
      case 0xE00002C0:
        CFStringRef result = @"no such device";
        break;
      case 0xE00002C1:
        CFStringRef result = @"privilege violation";
        break;
      case 0xE00002C2:
        CFStringRef result = @"invalid argument";
        break;
      case 0xE00002C3:
        CFStringRef result = @"device read locked";
        break;
      case 0xE00002C4:
        CFStringRef result = @"device write locked";
        break;
      case 0xE00002C5:
        CFStringRef result = @"exclusive access and";
        break;
      case 0xE00002C6:
        CFStringRef result = @"sent/received messages";
        break;
      case 0xE00002C7:
        CFStringRef result = @"unsupported function";
        break;
      case 0xE00002C8:
        CFStringRef result = @"misc. VM failure";
        break;
      case 0xE00002C9:
        CFStringRef result = @"internal error";
        break;
      case 0xE00002CA:
        CFStringRef result = @"General I/O error";
        break;
      case 0xE00002CB:
      case 0xE00002DC:
        goto LABEL_10;
      case 0xE00002CC:
        CFStringRef result = @"can't acquire lock";
        break;
      case 0xE00002CD:
        CFStringRef result = @"device not open";
        break;
      case 0xE00002CE:
        CFStringRef result = @"read not supported";
        break;
      case 0xE00002CF:
        CFStringRef result = @"write not supported";
        break;
      case 0xE00002D0:
        CFStringRef result = @"alignment error";
        break;
      case 0xE00002D1:
        CFStringRef result = @"Media Error";
        break;
      case 0xE00002D2:
        CFStringRef result = @"device(s) still open";
        break;
      case 0xE00002D3:
        CFStringRef result = @"rld failure";
        break;
      case 0xE00002D4:
        CFStringRef result = @"DMA failure";
        break;
      case 0xE00002D5:
        CFStringRef result = @"Device Busy";
        break;
      case 0xE00002D6:
        CFStringRef result = @"I/O Timeout";
        break;
      case 0xE00002D7:
        CFStringRef result = @"device offline";
        break;
      case 0xE00002D8:
        CFStringRef result = @"not ready";
        break;
      case 0xE00002D9:
        CFStringRef result = @"device not attached";
        break;
      case 0xE00002DA:
        CFStringRef result = @"no DMA channels left";
        break;
      case 0xE00002DB:
        CFStringRef result = @"no space for data";
        break;
      case 0xE00002DD:
        CFStringRef result = @"port already exists";
        break;
      case 0xE00002DE:
        CFStringRef result = @"can't wire down";
        break;
      case 0xE00002DF:
        CFStringRef result = @"no interrupt attached";
        break;
      case 0xE00002E0:
        CFStringRef result = @"no DMA frames enqueued";
        break;
      case 0xE00002E1:
        CFStringRef result = @"oversized msg received";
        break;
      case 0xE00002E2:
        CFStringRef result = @"not permitted";
        break;
      case 0xE00002E3:
        CFStringRef result = @"no power to device";
        break;
      case 0xE00002E4:
        CFStringRef result = @"media not present";
        break;
      case 0xE00002E5:
        CFStringRef result = @"media not formatted";
        break;
      case 0xE00002E6:
        CFStringRef result = @"no such mode";
        break;
      case 0xE00002E7:
        CFStringRef result = @"data underrun";
        break;
      case 0xE00002E8:
        CFStringRef result = @"data overrun";
        break;
      case 0xE00002E9:
        CFStringRef result = @"the device is not working properly!";
        break;
      case 0xE00002EA:
        CFStringRef result = @"a completion routine is required";
        break;
      case 0xE00002EB:
        CFStringRef result = @"operation aborted";
        break;
      case 0xE00002EC:
        CFStringRef result = @"bus bandwidth would be exceeded";
        break;
      case 0xE00002ED:
        CFStringRef result = @"device not responding";
        break;
      case 0xE00002EE:
        CFStringRef result = @"isochronous I/O request for distant past!";
        break;
      case 0xE00002EF:
        CFStringRef result = @"isochronous I/O request for distant future";
        break;
      case 0xE00002F0:
        CFStringRef result = @"data was not found";
        break;
      default:
        if (this != -536870911) {
          goto LABEL_10;
        }
        CFStringRef result = @"should never be seen";
        break;
    }
  }
  return result;
}

DeviceCMInterface *DeviceCMInterface::enableJasperRgbVideo(DeviceCMInterface *this)
{
  if (this->m_currentJasperConfiguration.isWideOn)
  {
    uint64_t v2 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbWideStreamId);
    if (v2)
    {
      uint64_t v3 = (DeviceCMInterface *)v2;
      uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      uint64_t v6 = DeviceCMInterface::getErrorInformationString(v3);
      uint64_t v7 = +[NSString stringWithFormat:@"enable wide stream failed with %d, %@", v3, v6];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 306, v7);
LABEL_7:

LABEL_10:
      return v3;
    }
  }
  if (this->m_currentJasperConfiguration.isSuperWideOn)
  {
    uint64_t v8 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
    if (v8)
    {
      uint64_t v3 = (DeviceCMInterface *)v8;
      uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      uint64_t v6 = DeviceCMInterface::getErrorInformationString(v3);
      uint64_t v7 = +[NSString stringWithFormat:@"enable wide stream failed with %d, %@", v3, v6];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 315, v7);
      goto LABEL_7;
    }
  }
  uint64_t v3 = (DeviceCMInterface *)DeviceCMInterface::enableJasperPointCloudOutput(this);
  if (v3)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v5 = [v4 lastPathComponent];
    uint64_t v6 = +[NSString stringWithFormat:@"failed to enable outputs"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 323, v6);
    goto LABEL_10;
  }
  return v3;
}

void sub_100007FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableRGBOutputForStreamId(DeviceCMInterface *this, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0 || !this->m_captureDeviceController)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"enableRGBOutputForStreamId failed, stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 885, v9);
    uint64_t v6 = 3758097129;

    return v6;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 0;
  }
  uint64_t v5 = Mutable;
  CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PrimaryScaler, kCFBooleanTrue);
  if (!HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_VideoOutputsEnabled, v5))
  {
    CFRelease(v5);
    return 0;
  }
  return 3758097129;
}

void sub_100008140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableJasperPointCloudOutput(DeviceCMInterface *this)
{
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFBooleanRef v3 = Mutable;
    CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PointCloud, kCFBooleanTrue);
    uint64_t v4 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_VideoOutputsEnabled, v3);
    if (v4)
    {
      uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v6 = [v5 lastPathComponent];
      uint64_t v7 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
      uint64_t v8 = +[NSString stringWithFormat:@"enableJasperOutput failed with OSStatus 0x%x, %@", v4, v7];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 945, v8);

      return 3758097129;
    }
    else
    {
      CFRelease(v3);
    }
  }
  else
  {
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v10 = [v9 lastPathComponent];
    uint64_t v11 = +[NSString stringWithFormat:@"fail to create output enable dictionary for pointcloud output"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 954, v11);
    uint64_t v4 = 3758097084;
  }
  return v4;
}

void sub_100008328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::configJasperRgbMultiStream(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  uint64_t v2 = 3758097126;
  if (!a2->isSyncModeOn && a2->isJasperOn)
  {
    if (this->m_streamIdsInfo.jasperStreamId == -1)
    {
      uint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v16 = [v15 lastPathComponent];
      uint64_t v17 = +[NSString stringWithFormat:@"no jasper id detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 339, v17);

      return 3758097088;
    }
    int bitMaskID = a2->bitMaskID;
    if (bitMaskID == 16 || bitMaskID == 8)
    {
      uint64_t v35 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      unsigned int v36 = &off_10001FAC8;
      CFBooleanRef v8 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      uint64_t v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v8);
      if (v9)
      {
        uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v11 = [v10 lastPathComponent];
        uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
        long long v13 = DeviceCMInterface::getErrorInformationString(v9);
        uint64_t v14 = +[NSString stringWithFormat:@"setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)", v9, jasperStreamId, v13];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 356, v14);

LABEL_13:
        uint64_t v2 = (uint64_t)v9;
LABEL_14:

        return v2;
      }
      this->m_isJasperConfigured = 1;
      this->m_currentJasperConfiguration.isJasperOn = 1;
      BOOL isWideOn = a2->isWideOn;
      if (!a2->isSuperWideOn && !a2->isWideOn) {
        goto LABEL_14;
      }
      if (a2->isSuperWideOn)
      {
        uint64_t v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId, 1);
        if (v9)
        {
          uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
          uint64_t v11 = [v10 lastPathComponent];
          v20 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb sw failed"];
          NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 369, v20);

          goto LABEL_13;
        }
        BOOL isWideOn = a2->isWideOn;
      }
      if (isWideOn
        && (uint64_t v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbWideStreamId, 1), v9))
      {
        uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v11 = [v10 lastPathComponent];
        double v21 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb w failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 378, v21);
      }
      else
      {
        uint64_t v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.jasperStreamId, 1);
        if (v9)
        {
          uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
          uint64_t v11 = [v10 lastPathComponent];
          uint64_t v22 = +[NSString stringWithFormat:@"faile to enable jasper multi output mode"];
          NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 387, v22);
        }
        else
        {
          uint64_t v23 = (char *)this->m_captureDeviceController + 16;
          uint64_t v24 = *(void *)&v23[8 * this->m_streamIdsInfo.rgbSuperWideStreamId];
          uint64_t v25 = *(void *)&v23[8 * this->m_streamIdsInfo.rgbWideStreamId];
          uint64_t v26 = *(void *)&v23[8 * this->m_streamIdsInfo.jasperStreamId];
          id v27 = objc_alloc_init((Class)NSMutableArray);
          uint64_t v11 = v27;
          if (a2->isWideOn) {
            [v27 addObject:v25];
          }
          if (a2->isSuperWideOn) {
            [v11 addObject:v24];
          }
          if (a2->isJasperOn) {
            [v11 addObject:v26];
          }
          uint64_t v33 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
          v34 = v11;
          uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          uint64_t v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v10);
          if (v9)
          {
            v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
            id v29 = [v28 lastPathComponent];
            uint64_t v30 = this->m_streamIdsInfo.jasperStreamId;
            id v31 = DeviceCMInterface::getErrorInformationString(v9);
            int v32 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)", v9, v30, v31];
            NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v29, 408, v32);
          }
          else
          {
            this->m_currentJasperConfiguration = *a2;
          }
        }
      }
      goto LABEL_13;
    }
  }
  return v2;
}

void sub_100008884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setJasperRGBSuperWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId, 1);
}

uint64_t DeviceCMInterface::setJasperRGBWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbWideStreamId, 1);
}

uint64_t DeviceCMInterface::setJasperMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v10 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 774, v10);
    uint64_t v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->m_streamIdsInfo.jasperStreamId != a2
    && this->m_streamIdsInfo.rgbSuperWideStreamId != a2
    && this->m_streamIdsInfo.rgbWideStreamId != a2)
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v10 = +[NSString stringWithFormat:@"stream id %d is invalid (should be %d or %d or %d for jasper)", a2, this->m_streamIdsInfo.jasperStreamId, this->m_streamIdsInfo.rgbSuperWideStreamId, this->m_streamIdsInfo.rgbWideStreamId];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 780, v10);
    uint64_t v7 = 3758097090;
    goto LABEL_10;
  }
  uint64_t v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3) {
    uint64_t v6 = (const __CFBoolean **)&kCFBooleanFalse;
  }
  uint64_t v7 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if (v7)
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    uint64_t v11 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)", v7, v10];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 790, v11);

    uint64_t v7 = 3758097129;
LABEL_10:
  }
  return v7;
}

void sub_100008BFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentJasperConfiguration(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  this->m_currentJasperConfiguration = *a2;
  return this;
}

uint64_t DeviceCMInterface::configJasperDevice(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  *(_WORD *)&this->m_isJasperSuperWideConfigured = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  this->m_currentJasperConfiguration.int bitMaskID = 0;
  unsigned int jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  if (jasperStreamId == -1)
  {
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    long long v13 = [v12 lastPathComponent];
    uint64_t v14 = +[NSString stringWithFormat:@"no jasper id detected"];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 424, v14);

    return 3758097088;
  }
  if (a2->isJasperOn)
  {
    CFArrayRef theArray = 0;
    uint64_t v5 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, jasperStreamId, kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes, &theArray);
    CFArrayRef v6 = theArray;
    CFArrayRef theArray = 0;
    if (v5)
    {
      uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      CFBooleanRef v8 = [v7 lastPathComponent];
      uint64_t v9 = this->m_streamIdsInfo.jasperStreamId;
      uint64_t v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      uint64_t v11 = +[NSString stringWithFormat:@"setting property kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes failed with OSStatus 0x%x for stream id %d (%@)", v5, v9, v10];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 441, v11);

      return v5;
    }
    unsigned int v15 = [(__CFArray *)v6 containsObject:&off_10001FAE0];
    unsigned int v16 = [(__CFArray *)v6 containsObject:&off_10001FAC8];
    if (v15)
    {
      uint64_t v76 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      long long v77 = &off_10001FAE0;
      CFBooleanRef v17 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v19 = [v18 lastPathComponent];
      v20 = +[NSString stringWithFormat:@"NormalShortHybridMode detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 456, v20);
    }
    else
    {
      if (!v16)
      {
        id v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v22 = [v27 lastPathComponent];
        uint64_t v23 = +[NSString stringWithFormat:@"cannot resolve projector mode"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v22, 467, v23);
        uint64_t v5 = 3758097084;
        goto LABEL_37;
      }
      uint64_t v74 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      long long v75 = &off_10001FAC8;
      CFBooleanRef v17 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v19 = [v18 lastPathComponent];
      v20 = +[NSString stringWithFormat:@"NormalMode detected"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 463, v20);
    }
    CFBooleanRef v21 = v17;

    uint64_t v5 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v17);
    if (v5)
    {
      uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = this->m_streamIdsInfo.jasperStreamId;
      uint64_t v25 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      uint64_t v26 = +[NSString stringWithFormat:@"setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)", v5, v24, v25];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 474, v26);

      id v27 = v21;
LABEL_37:

      return v5;
    }
    this->m_isJasperConfigured = 1;
    this->m_currentJasperConfiguration.isJasperOn = 1;
  }
  if (a2->isSuperWideOn)
  {
    uint64_t rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
    if (rgbSuperWideStreamId == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      uint64_t rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
      if (rgbSuperWideStreamId == -1)
      {
        float v45 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        float v46 = [v45 lastPathComponent];
        v47 = +[NSString stringWithFormat:@"no available RGB super wide stream index"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v46, 485, v47);

        return 3758097136;
      }
    }
    uint64_t v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, rgbSuperWideStreamId, 1);
    if (v5)
    {
      id v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v30 = [v29 lastPathComponent];
      id v31 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v30, 493, v31);

      return v5;
    }
    this->m_isJasperSuperWideConfigured = 1;
    if (a2->isJasperOn && a2->isSuperWideOn)
    {
      m_captureDeviceController = this->m_captureDeviceController;
      if (a2->isSyncModeOn)
      {
        if (*((_DWORD *)m_captureDeviceController + 536))
        {
          uint64_t v33 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
          uint64_t v34 = 260;
          do
          {
            CFArrayRef theArray = 0;
            uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
            uint64_t v36 = *(void *)(CMBaseObjectGetVTable() + 8);
            uint64_t v37 = v36 ? v36 : 0;
            unsigned int v38 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v37 + 48);
            if (!v38 || v38(FigBaseObject, v33, kCFAllocatorDefault, &theArray)) {
              break;
            }
            CFArrayRef v39 = theArray;
            v78.length = CFArrayGetCount(theArray);
            v78.location = 0;
            if (CFArrayContainsValue(v39, v78, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.jasperStreamId + 2))&& (CFArrayRef v40 = theArray, v79.length = CFArrayGetCount(theArray), v79.location = 0, CFArrayContainsValue(v40, v79, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.rgbSuperWideStreamId + 2))))
            {
              uint64_t v41 = *((void *)this->m_captureDeviceController + v34);
            }
            else
            {
              uint64_t v41 = 0;
            }
            CFRelease(theArray);
            if (v41) {
              goto LABEL_35;
            }
            unint64_t v42 = v34 - 259;
            ++v34;
          }
          while (v42 < *((unsigned int *)this->m_captureDeviceController + 536));
        }
        uint64_t v41 = 0;
LABEL_35:
        uint64_t v71 = v41;
        uint64_t v72 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
        v43 = +[NSArray arrayWithObjects:&v71 count:1];
        v73 = v43;
        uint64_t v44 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      }
      else
      {
        float v48 = (char *)m_captureDeviceController + 16;
        uint64_t v49 = *(void *)&v48[8 * this->m_streamIdsInfo.jasperStreamId];
        v68[1] = *(void *)&v48[8 * this->m_streamIdsInfo.rgbSuperWideStreamId];
        uint64_t v69 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
        v68[0] = v49;
        v43 = +[NSArray arrayWithObjects:v68 count:2];
        v70 = v43;
        uint64_t v44 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      }
      v50 = (void *)v44;

      float v51 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v50);
      if (v51)
      {
        float v52 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        v53 = [v52 lastPathComponent];
        uint64_t v54 = this->m_streamIdsInfo.jasperStreamId;
        float v55 = DeviceCMInterface::getErrorInformationString(v51);
        v56 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)", v51, v54, v55];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v53, 542, v56);
      }
      uint64_t v5 = DeviceCMInterface::enableSWRGBOutput(this);
      if (v5)
      {
        v57 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        BOOL v58 = [v57 lastPathComponent];
        char v59 = +[NSString stringWithFormat:@"Configure the primary output to multioutput + enable failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v58, 549, v59);

        return v5;
      }
    }
  }
  uint64_t v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.jasperStreamId, 1);
  if (v5)
  {
    v60 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v61 = [v60 lastPathComponent];
    v62 = +[NSString stringWithFormat:@"faile to enable jasper multi output mode"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v61, 560, v62);
  }
  else
  {
    uint64_t v5 = DeviceCMInterface::enableJasperPointCloudOutput(this);
    if (v5)
    {
      v63 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v64 = [v63 lastPathComponent];
      v65 = +[NSString stringWithFormat:@"failed to enable outputs"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v64, 568, v65);
    }
    else
    {
      this->m_currentJasperConfiguration = *a2;
    }
  }
  return v5;
}

void sub_1000096A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isJasperSuperWideExist(DeviceCMInterface *this)
{
  int rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
  if (rgbSuperWideStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
  }
  return rgbSuperWideStreamId != -1;
}

uint64_t DeviceCMInterface::enableSWRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
  if (v1)
  {
    uint64_t v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v3 = [v2 lastPathComponent];
    uint64_t v4 = +[NSString stringWithFormat:@"enableRGBOutput failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 926, v4);
  }
  return v1;
}

void sub_1000099B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::requestControlOfStreams(DeviceCMInterface *this, int a2, useconds_t a3)
{
  if (this->m_captureDeviceController)
  {
    if (a2)
    {
      uint64_t v30 = kFigCaptureDeviceRequestControlOfStreamsOptionsKey_ClientPriority;
      id v31 = &off_10001FAE0;
      uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      CFArrayRef v6 = [v5 lastPathComponent];
      uint64_t v7 = +[NSString stringWithFormat:@"request control on high priority"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 592, v7);

      id v29 = (__CFDictionary *)v4;
    }
    else
    {
      id v29 = 0;
    }
    uint64_t v12 = 1;
    while (1)
    {
      uint64_t v13 = HxISPCaptureDeviceController::RequestStreams(this->m_captureDeviceController, *((const __CFArray **)this->m_captureDeviceController + 1), v29);
      uint64_t v14 = (DeviceCMInterface *)v13;
      if (v13 != -12681) {
        break;
      }
      unsigned int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      unsigned int v16 = [v15 lastPathComponent];
      CFBooleanRef v17 = +[NSString stringWithFormat:@"requestControlOfStreamscontrol - controlled by another client. %d/%d", v12, 10];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 600, v17);

      usleep(0x7A120u);
      uint64_t v12 = (v12 + 1);
      if (v12 == 11) {
        goto LABEL_17;
      }
    }
    if (v13 != -12782 && v13 != 0)
    {
LABEL_17:
      uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = DeviceCMInterface::getErrorInformationString(v14);
      uint64_t v25 = +[NSString stringWithFormat:@"requestControlOfStreamscontrol failed, OSStatus error 0x%x, %@", v14, v24];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 614, v25);

      uint64_t v11 = 3758097129;
      goto LABEL_18;
    }
    if (a2)
    {
      v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v20 = [v19 lastPathComponent];
      CFBooleanRef v21 = +[NSString stringWithFormat:@"waiting for preempted client to terminate for %.2f sec...", (double)a3 / 1000000.0];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v20, 621, v21);

      usleep(a3);
      uint64_t v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v23 = [v22 lastPathComponent];
      uint64_t v24 = +[NSString stringWithFormat:@"done waiting"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v23, 623, v24);
      uint64_t v11 = 0;
LABEL_18:

      goto LABEL_20;
    }
    uint64_t v11 = 0;
LABEL_20:
  }
  else
  {
    CFBooleanRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    uint64_t v10 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 584, v10);
    uint64_t v11 = 3758097084;
  }
  return v11;
}

void sub_100009E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::releaseControlOfStreams(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFBooleanRef v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t v5 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 635, v5);
    uint64_t v2 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v2 = HxISPCaptureDeviceController::RelinquishStreams(m_captureDeviceController, *((const __CFArray **)m_captureDeviceController + 1));
  if (v2)
  {
    CFBooleanRef v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t v5 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v2);
    CFArrayRef v6 = +[NSString stringWithFormat:@"fail during releaseControlOfStreams, OSStatus error 0x%x (%@)", v2, v5];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 642, v6);

LABEL_5:
  }
  return v2;
}

void sub_10000A060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enumerateStreamsIndices(DeviceCMInterface *this)
{
  unsigned int v2 = 0;
  *(void *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(void *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(void *)&this->m_streamIdsInfo.int rgbSuperWideStreamId = -1;
  p_m_streamIdsInfo = &this->m_streamIdsInfo;
  CFStringRef v3 = (const __CFString *)kFigCaptureStreamProperty_PortType;
  CFStringRef v4 = (const __CFString *)kFigCapturePortType_FrontFacingInfraredCamera;
  CFStringRef v5 = (const __CFString *)kFigCapturePortType_FrontFacingCamera;
  CFStringRef v6 = (const __CFString *)kFigCapturePortType_FrontFacingSuperWideCamera;
  CFStringRef v7 = (const __CFString *)kFigCapturePortType_BackFacingSuperWideCamera;
  CFStringRef v8 = (const __CFString *)kFigCapturePortType_BackFacingCamera;
  CFStringRef v9 = (const __CFString *)kFigCapturePortType_BackFacingTelephotoCamera;
  CFStringRef v10 = (const __CFString *)kFigCapturePortType_BackFacingSparseTimeOfFlightCamera;
  do
  {
    CFStringRef theString1 = 0;
    if (HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, v2, v3, &theString1))BOOL v11 = 1; {
    else
    }
      BOOL v11 = theString1 == 0;
    if (!v11)
    {
      if (CFEqual(theString1, v4)) {
        this->m_streamIdsInfo.irPearlStreamId = v2;
      }
      if (CFEqual(theString1, v5)
        || CFEqual(theString1, v6))
      {
        this->m_streamIdsInfo.rgbPearlStreamId = v2;
      }
      if (CFEqual(theString1, v7)) {
        this->m_streamIdsInfo.int rgbSuperWideStreamId = v2;
      }
      if (CFEqual(theString1, v8)) {
        this->m_streamIdsInfo.rgbWideStreamId = v2;
      }
      if (CFEqual(theString1, v9)) {
        p_m_streamIdsInfo->rgbTeleStreamId = v2;
      }
      if (CFEqual(theString1, v10)) {
        this->m_streamIdsInfo.unsigned int jasperStreamId = v2;
      }
      CFRelease(theString1);
    }
    ++v2;
  }
  while (v2 != 8);
  if (!this->m_captureDeviceController || this->m_streamIdsInfo.irPearlStreamId < 0)
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v14 = [v13 lastPathComponent];
    unsigned int v15 = +[NSString stringWithFormat:@"IR Stream id not found"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 703, v15);
    uint64_t v12 = 3758097084;
LABEL_26:

    return v12;
  }
  if (this->m_streamIdsInfo.rgbPearlStreamId < 0)
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v14 = [v13 lastPathComponent];
    unsigned int v15 = +[NSString stringWithFormat:@"RGB Stream id not found"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 709, v15);
    uint64_t v12 = 0;
    goto LABEL_26;
  }
  return 0;
}

void sub_10000A340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isActivated(DeviceCMInterface *this)
{
  return this->m_captureDeviceController != 0;
}

uint64_t DeviceCMInterface::setPearlIRMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->m_streamIdsInfo.irPearlStreamId, 1);
}

uint64_t DeviceCMInterface::setPearlMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFStringRef v10 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 802, v10);
    uint64_t v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->m_streamIdsInfo.rgbPearlStreamId != a2 && this->m_streamIdsInfo.irPearlStreamId != a2)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFStringRef v10 = +[NSString stringWithFormat:@"stream id %d is invalid (should be %d for rgb or %d for ir)", a2, this->m_streamIdsInfo.rgbPearlStreamId, this->m_streamIdsInfo.irPearlStreamId];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 808, v10);
    uint64_t v7 = 3758097090;
    goto LABEL_10;
  }
  CFStringRef v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3) {
    CFStringRef v6 = (const __CFBoolean **)&kCFBooleanFalse;
  }
  uint64_t v7 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if (v7)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFStringRef v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    BOOL v11 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)", v7, v10];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 819, v11);

    uint64_t v7 = 3758097129;
LABEL_10:
  }
  return v7;
}

void sub_10000A5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isPearlIrExist(DeviceCMInterface *this)
{
  int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  if (irPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  }
  return irPearlStreamId != -1;
}

BOOL DeviceCMInterface::isPearlRgbExist(DeviceCMInterface *this)
{
  int rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
  if (rgbPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
  }
  return rgbPearlStreamId != -1;
}

BOOL DeviceCMInterface::isJasperExist(DeviceCMInterface *this)
{
  int jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  if (jasperStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    int jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  }
  return jasperStreamId != -1;
}

uint64_t DeviceCMInterface::setPearlRGBMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbPearlStreamId, 1);
}

uint64_t DeviceCMInterface::setStreamProperty(DeviceCMInterface *this, uint64_t a2, const __CFString *a3, NSDictionary *a4)
{
  uint64_t v7 = a4;
  m_captureDeviceController = this->m_captureDeviceController;
  if (m_captureDeviceController)
  {
    CFStringRef v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, a3, (const __CFBoolean *)v7);
    if (!v9)
    {
      uint64_t v14 = 0;
      goto LABEL_7;
    }
    CFStringRef v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v11 = [v10 lastPathComponent];
    uint64_t v12 = DeviceCMInterface::getErrorInformationString(v9);
    uint64_t v13 = +[NSString stringWithFormat:@"SetStreamProperty %@ for stream id %d failed with OSStatus 0x%x (%@)", a3, a2, v9, v12];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 839, v13);

    uint64_t v14 = 3758097129;
  }
  else
  {
    CFStringRef v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 831, v12);
    uint64_t v14 = 3758097084;
  }

LABEL_7:
  return v14;
}

void sub_10000A838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlIROutput(DeviceCMInterface *this)
{
  unsigned int v2 = (const void *)kFigCaptureStreamVideoOutputID_PrimaryScaler;
  uint64_t v16 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
  uint64_t v14 = kFigCaptureStreamVideoOutputConfigurationKey_AttachRaw;
  unsigned int v15 = &__kCFBooleanTrue;
  CFStringRef v3 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  CFBooleanRef v17 = v3;
  CFStringRef v4 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  uint64_t v5 = DeviceCMInterface::setStreamProperty(this, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_VideoOutputConfigurations, v4);
  if (!v5)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFBooleanRef v10 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, v2, kCFBooleanTrue);
      BOOL v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_VideoOutputsEnabled, v10);
      if (v11)
      {
        CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v7 = [v6 lastPathComponent];
        CFStringRef v8 = DeviceCMInterface::getErrorInformationString(v11);
        uint64_t v12 = +[NSString stringWithFormat:@"enableIROutput failed with OSStatus 0x%x (%@)", v11, v8];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 870, v12);

        uint64_t v5 = 3758097129;
        goto LABEL_3;
      }
      CFRelease(v10);
    }
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v7 = [v6 lastPathComponent];
  CFStringRef v8 = +[NSString stringWithFormat:@"Configure the primary output failed"];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 855, v8);
LABEL_3:

LABEL_9:
  return v5;
}

void sub_10000AAEC(_Unwind_Exception *a1)
{
  CFStringRef v6 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbPearlStreamId);
  if (v1)
  {
    unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v3 = [v2 lastPathComponent];
    CFStringRef v4 = +[NSString stringWithFormat:@"enableRGBOutput failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 914, v4);
  }
  return v1;
}

void sub_10000AC18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIrCofiguration(DeviceCMInterface *this, int a2)
{
  switch(a2)
  {
    case 0:
      CFStringRef v24 = @"EnableIRProjector";
      uint64_t v25 = &__kCFBooleanFalse;
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"None"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 972, v6);
      goto LABEL_10;
    case 1:
      v22[0] = @"EnableIRProjector";
      v22[1] = @"ProjectorType";
      v23[0] = &__kCFBooleanTrue;
      v23[1] = @"Flood";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"Flood"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 981, v6);
      goto LABEL_10;
    case 2:
      v20[0] = @"EnableIRProjector";
      v20[1] = @"ProjectorType";
      v21[0] = &__kCFBooleanTrue;
      v21[1] = @"SparseLowPower";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"SparseLowPower"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 989, v6);
      goto LABEL_10;
    case 3:
      v18[0] = @"EnableIRProjector";
      v18[1] = @"ProjectorType";
      v19[0] = &__kCFBooleanTrue;
      v19[1] = @"Sparse";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"Sparse"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 997, v6);
      goto LABEL_10;
    case 4:
      v14[0] = @"EnableIRProjector";
      v14[1] = @"ProjectorType";
      v15[0] = &__kCFBooleanTrue;
      v15[1] = @"Dense";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"Dense"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1014, v6);
      goto LABEL_10;
    case 5:
      v16[0] = @"EnableIRProjector";
      v16[1] = @"ProjectorType";
      v17[0] = &__kCFBooleanTrue;
      v17[1] = @"DenseProbeAB";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"DenseProbeAB"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1005, v6);
      goto LABEL_10;
    case 6:
      v12[0] = @"EnableIRProjector";
      v12[1] = @"ProjectorType";
      v13[0] = &__kCFBooleanTrue;
      v13[1] = @"SparseProbeAB";
      CFStringRef v3 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
      CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v5 = [v4 lastPathComponent];
      CFStringRef v6 = +[NSString stringWithFormat:@"Setting Pearl Ir configuration to %@", @"SparseProbeAB"];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1023, v6);
LABEL_10:

      break;
    default:
      CFStringRef v3 = 0;
      break;
  }
  uint64_t v7 = DeviceCMInterface::setStreamProperty(this, this->m_streamIdsInfo.irPearlStreamId, @"IRProjectorParams", v3);
  if (v7)
  {
    CFStringRef v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v9 = [v8 lastPathComponent];
    CFBooleanRef v10 = +[NSString stringWithFormat:@"setProjectorMode failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1031, v10);
  }
  return v7;
}

void sub_10000B27C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlDepthConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v23 = a3;
  uint64_t valuePtr = a2;
  if (!*(void *)(a1 + 16))
  {
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    v20 = [v19 lastPathComponent];
    CFBooleanRef v21 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v20, 1042, v21, v23, valuePtr);
    uint64_t v14 = 3758097084;

    return v14;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v23);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputWidth, v9);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputHeight, v10);
  CFRelease(v9);
  CFRelease(v10);
  BOOL v11 = (const void **)&kFigCapturePortType_FrontFacingCamera;
  if (!a4) {
    BOOL v11 = (const void **)&kFigCapturePortType_FrontFacingInfraredCamera;
  }
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_DepthPerspectivePortType, *v11);
  uint64_t v12 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t v13 = v12;
  if (a5)
  {
    CFArrayAppendValue(v12, kFigCaptureStreamDepthData_DX);
    if ((a5 & 0x10000) == 0)
    {
LABEL_6:
      if ((a5 & 0x1000000) == 0) {
        goto LABEL_7;
      }
      goto LABEL_16;
    }
  }
  else if ((a5 & 0x10000) == 0)
  {
    goto LABEL_6;
  }
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DY);
  if ((a5 & 0x1000000) == 0)
  {
LABEL_7:
    if ((a5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DepthImage);
  if ((a5 & 0x100) == 0)
  {
LABEL_8:
    if ((a5 & 0x100000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_NormalizedDX);
  if ((a5 & 0x100000000) != 0) {
LABEL_9:
  }
    CFArrayAppendValue(v13, kFigCaptureStreamDepthData_GMS);
LABEL_10:
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_EnabledOutputs, v13);
  uint64_t v14 = HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 36), kFigCaptureStreamProperty_DepthEngineConfiguration, Mutable);
  CFRelease(v13);
  if (v14)
  {
    unsigned int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v16 = [v15 lastPathComponent];
    CFBooleanRef v17 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v14);
    id v18 = +[NSString stringWithFormat:@"setDepthCofiguration failed with OSStatus 0x%x (%@)", v14, v17];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 1092, v18, v23, valuePtr);

    return 3758097129;
  }
  return v14;
}

void sub_10000B6EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbSuperWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
}

uint64_t DeviceCMInterface::startRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  if (!this->m_captureDeviceController)
  {
    BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v12 = [v11 lastPathComponent];
    uint64_t v13 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1289, v13);
    uint64_t started = 3758097084;
LABEL_13:

    return started;
  }
  if ((a2 & 0x80000000) != 0)
  {
    CFStringRef v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v5 = [v4 lastPathComponent];
    CFStringRef v6 = +[NSString stringWithFormat:@"stream id is invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1295, v6);
  }
  if (!this->m_currentJasperConfiguration.bitMaskID)
  {
    uint64_t v15 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_10001FB10);
    if (v15)
    {
      uint64_t v16 = (DeviceCMInterface *)v15;
      BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = DeviceCMInterface::getErrorInformationString(v16);
      uint64_t v14 = +[NSString stringWithFormat:@"set min fps 30 failed with OSStatus 0x%x (%@)", v16, v13];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1301, v14);
      goto LABEL_12;
    }
    uint64_t v17 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_10001FB10);
    if (v17)
    {
      id v18 = (DeviceCMInterface *)v17;
      BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = DeviceCMInterface::getErrorInformationString(v18);
      uint64_t v14 = +[NSString stringWithFormat:@"set max fps 30 failed with OSStatus 0x%x (%@)", v18, v13];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1307, v14);
      goto LABEL_12;
    }
  }
  uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  CFStringRef v8 = [v7 lastPathComponent];
  CFNumberRef v9 = +[NSString stringWithFormat:@"start receiving stream id: %d", a2];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1312, v9);

  uint64_t started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, a2, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_10000C844, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if (started)
  {
    BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v12 = [v11 lastPathComponent];
    uint64_t v13 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    uint64_t v14 = +[NSString stringWithFormat:@"startRgbStream failed with OSStatus 0x%x (%@)", started, v13];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1321, v14);
LABEL_12:

    uint64_t started = 3758097129;
    goto LABEL_13;
  }
  return started;
}

void sub_10000BAC8(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbWideStreamId);
}

uint64_t DeviceCMInterface::startJasperStream(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFNumberRef v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 1114, v12);

    return 3758097084;
  }
  CFBooleanRef v37 = 0;
  unsigned int valuePtr = 0x7FFFFFFF;
  id v35 = 0;
  uint64_t v3 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureProperty_SupportedPropertiesDictionary, &v35);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v6 = [v5 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
    CFStringRef v8 = +[NSString stringWithFormat:@"get SupportedPropertiesDictionary failed with OSStatus 0x%x (%@)", v4, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1127, v8);
    goto LABEL_4;
  }
  id v14 = v35;
  uint64_t v5 = [v35 allKeys];

  id v35 = 0;
  CFStringRef v15 = (const __CFString *)kFigCaptureStreamProperty_MaximumAllowedFrameRate;
  if ([v5 containsObject:kFigCaptureStreamProperty_MaximumAllowedFrameRate])
  {
    uint64_t v16 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, v15, &v37);
    if (v16)
    {
      uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      id v18 = [v17 lastPathComponent];
      v19 = DeviceCMInterface::getErrorInformationString(v16);
      v20 = +[NSString stringWithFormat:@"failed resolving maximum frame rate information OSStatus 0x%x (%@)", v16, v19];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v18, 1148, v20);
      uint64_t v9 = 3758097129;

      if (v37) {
        CFRelease(v37);
      }
      goto LABEL_5;
    }
    CFNumberRef v21 = v37;
    if (!v37)
    {
      CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v7 = [v6 lastPathComponent];
      CFStringRef v8 = +[NSString stringWithFormat:@"null maximum frame rate detected"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1156, v8);
      uint64_t v4 = 3758097129;
      goto LABEL_4;
    }
  }
  else
  {
    CFNumberRef v21 = (const __CFNumber *)&off_10001FAF8;
    CFBooleanRef v37 = (const __CFBoolean *)&off_10001FAF8;
  }
  CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
  uint64_t v22 = valuePtr;
  uint64_t v23 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_MinimumFrameRate, v37);
  uint64_t v4 = 3758097129;
  if (v23)
  {
    CFStringRef v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v25 = [v24 lastPathComponent];
    uint64_t v26 = DeviceCMInterface::getErrorInformationString(v23);
    id v27 = +[NSString stringWithFormat:@"set min fps of %d failed with OSStatus 0x%x (%@)", v22, v23, v26];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v25, 1168, v27);
  }
  else
  {
    v28 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_MaximumFrameRate, v37);
    if (!v28)
    {
      uint64_t v9 = 0;
      int v29 = 1;
      goto LABEL_18;
    }
    CFStringRef v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v25 = [v24 lastPathComponent];
    uint64_t v26 = DeviceCMInterface::getErrorInformationString(v28);
    id v27 = +[NSString stringWithFormat:@"set max fps of %d failed with OSStatus 0x%x (%@)", v22, v28, v26];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v25, 1176, v27);
  }

  int v29 = 0;
  uint64_t v9 = 3758097129;
LABEL_18:
  CFRelease(v37);
  if (!v29) {
    goto LABEL_5;
  }
  uint64_t v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  id v31 = [v30 lastPathComponent];
  int v32 = +[NSString stringWithFormat:@"start receiving stream id: %d", this->m_streamIdsInfo.jasperStreamId];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v31, 1187, v32);

  uint64_t started = (DeviceCMInterface *)HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                   0,
                                   (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_10000C1EC,
                                   this);
  if (!started)
  {
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  CFStringRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v7 = [v6 lastPathComponent];
  CFStringRef v8 = DeviceCMInterface::getErrorInformationString(started);
  uint64_t v34 = +[NSString stringWithFormat:@"startJasperStream failed with OSStatus 0x%x (%@)", started, v8];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1201, v34);

LABEL_4:
  uint64_t v9 = v4;
LABEL_5:

  return v9;
}

void sub_10000C120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000C1EC(uint64_t result, long long *a2, int a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = result;
    CFStringRef result = *(void *)(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        uint64_t v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 40) == a3) {
          int v6 = 3;
        }
        else {
          int v6 = 0;
        }
        if (*(_DWORD *)(a4 + 32) == a3) {
          unsigned int v7 = 2;
        }
        else {
          unsigned int v7 = v6;
        }
        if (*(_DWORD *)(a4 + 44) == a3) {
          uint64_t v5 = 4;
        }
        else {
          uint64_t v5 = v7;
        }
      }
      long long v8 = *a2;
      uint64_t v9 = *((void *)a2 + 2);
      return (*(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t))(*(void *)result + 8))(result, v4, &v8, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopJasperStream(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  uint64_t v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v4 = v3;
  if (!m_captureDeviceController)
  {
    long long v8 = [v3 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1212, v9);
    uint64_t v7 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 lastPathComponent];
  int v6 = +[NSString stringWithFormat:@"stop receiving stream id: %d", this->m_streamIdsInfo.jasperStreamId];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1216, v6);

  uint64_t v7 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId);
  if (v7)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    long long v8 = [v4 lastPathComponent];
    uint64_t v9 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    CFNumberRef v10 = +[NSString stringWithFormat:@"stopJasperStream failed with OSStatus 0x%x (%@)", v7, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1220, v10);

    uint64_t v7 = 3758097129;
LABEL_5:
  }
  return v7;
}

void sub_10000C444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlIrStream(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    int v6 = [v5 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1232, v7);
    uint64_t started = 3758097084;
LABEL_10:

    return started;
  }
  uint64_t v3 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_10001FB10);
  if (v3)
  {
    uint64_t v4 = (DeviceCMInterface *)v3;
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    int v6 = [v5 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString(v4);
    long long v8 = +[NSString stringWithFormat:@"set min fps 30 failed with OSStatus 0x%x (%@)", v4, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1239, v8);
LABEL_9:

    uint64_t started = 3758097129;
    goto LABEL_10;
  }
  CFNumberRef v10 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_10001FB10);
  BOOL v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v5 = v11;
  if (v10)
  {
    int v6 = [v11 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString(v10);
    long long v8 = +[NSString stringWithFormat:@"set max fps 30 failed with OSStatus 0x%x (%@)", v10, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1245, v8);
    goto LABEL_9;
  }
  uint64_t v12 = [v11 lastPathComponent];
  uint64_t v13 = +[NSString stringWithFormat:@"start receiving stream id: %d", this->m_streamIdsInfo.irPearlStreamId];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 1250, v13);

  uint64_t started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_10000C844, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if (started)
  {
    uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    int v6 = [v5 lastPathComponent];
    uint64_t v7 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    long long v8 = +[NSString stringWithFormat:@"startIrStream failed with OSStatus 0x%x (%@)", started, v7];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 1259, v8);
    goto LABEL_9;
  }
  return started;
}

void sub_10000C7CC(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t (***sub_10000C844(uint64_t (***result)(void, void, long long *, uint64_t), long long *a2, int a3, uint64_t a4))(void, void, long long *, uint64_t)
{
  if (a4)
  {
    uint64_t v4 = result;
    CFStringRef result = *(uint64_t (****)(void, void, long long *, uint64_t))(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        uint64_t v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 28) == a3) {
          unsigned int v6 = 5;
        }
        else {
          unsigned int v6 = 0;
        }
        if (*(_DWORD *)(a4 + 40) == a3) {
          unsigned int v6 = 3;
        }
        if (*(_DWORD *)(a4 + 32) == a3) {
          unsigned int v6 = 2;
        }
        if (*(_DWORD *)(a4 + 44) == a3) {
          uint64_t v5 = 4;
        }
        else {
          uint64_t v5 = v6;
        }
      }
      long long v7 = *a2;
      uint64_t v8 = *((void *)a2 + 2);
      return (uint64_t (***)(void, void, long long *, uint64_t))(**result)(result, v4, &v7, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopPearlIrStream(DeviceCMInterface *this)
{
  m_captureDeviceController = this->m_captureDeviceController;
  uint64_t v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v4 = v3;
  if (!m_captureDeviceController)
  {
    uint64_t v8 = [v3 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1270, v9);
    uint64_t v7 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 lastPathComponent];
  unsigned int v6 = +[NSString stringWithFormat:@"stop receiving stream id: %d", this->m_streamIdsInfo.irPearlStreamId];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v5, 1274, v6);

  uint64_t v7 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId);
  if (v7)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v4 lastPathComponent];
    uint64_t v9 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    CFNumberRef v10 = +[NSString stringWithFormat:@"stopIrStream failed with OSStatus 0x%x (%@)", v7, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1278, v10);

    uint64_t v7 = 3758097129;
LABEL_5:
  }
  return v7;
}

void sub_10000CAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbPearlStreamId);
}

uint64_t DeviceCMInterface::stopRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  m_captureDeviceController = this->m_captureDeviceController;
  uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  unsigned int v6 = v5;
  if (!m_captureDeviceController)
  {
    CFNumberRef v10 = [v5 lastPathComponent];
    BOOL v11 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 1337, v11);
    uint64_t v9 = 3758097084;
    goto LABEL_5;
  }
  uint64_t v7 = [v5 lastPathComponent];
  uint64_t v8 = +[NSString stringWithFormat:@"stop receiving stream id: %d", a2];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1341, v8);

  uint64_t v9 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, a2);
  if (v9)
  {
    unsigned int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFNumberRef v10 = [v6 lastPathComponent];
    BOOL v11 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v9);
    uint64_t v12 = +[NSString stringWithFormat:@"stopRgbStream failed with OSStatus 0x%x (%@)", v9, v11];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 1345, v12);

LABEL_5:
  }
  return v9;
}

void sub_10000CCB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::stopPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbPearlStreamId);
}

uint64_t DeviceCMInterface::stopRgbSuperWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
}

uint64_t DeviceCMInterface::stopRgbWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbWideStreamId);
}

uint64_t DeviceCMInterface::validateJasperFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  uint64_t v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"ValidateComplianceWithDetails", &number);
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    uint64_t result = 0;
    *a2 = valuePtr;
  }
  else
  {
    unsigned int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v7 = [v6 lastPathComponent];
    uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    uint64_t v9 = DeviceCMInterface::getErrorInformationString(v4);
    CFNumberRef v10 = +[NSString stringWithFormat:@"validateJasperFwStatus failed with OSStatus 0x%x for stream id %d (%@)", v4, irPearlStreamId, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v7, 1385, v10);

    return 3758097084;
  }
  return result;
}

void sub_10000CE58(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::validateIrFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  m_captureDeviceController = this->m_captureDeviceController;
  if (m_captureDeviceController
    && *((unsigned char *)m_captureDeviceController + 2148)
    && (unsigned int v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) == 0))
  {
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, @"ValidateComplianceWithDetails", &number);
    if (v6)
    {
      uint64_t v7 = (DeviceCMInterface *)v6;
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      BOOL v11 = DeviceCMInterface::getErrorInformationString(v7);
      uint64_t v12 = +[NSString stringWithFormat:@"validateIrFwStatus failed with OSStatus 0x%x for stream id %d (%@)", v7, irPearlStreamId, v11];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1407, v12);
      uint64_t v13 = 3758097084;
    }
    else
    {
      uint64_t v13 = 0;
    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
      return v13;
    }
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v15 = [v14 lastPathComponent];
    uint64_t v16 = +[NSString stringWithFormat:@"validateIrFwStatus failed as bit mask was NULL"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 1419, v16);
  }
  else
  {
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v15 = [v14 lastPathComponent];
    uint64_t v16 = +[NSString stringWithFormat:@"device is not activated"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v15, 1400, v16);
  }
  uint64_t v13 = 3758097084;

  return v13;
}

void sub_10000D0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableDefaultDepthStream(DeviceCMInterface *this)
{
  uint64_t v1 = DeviceCMInterface::setPearlDepthConfiguration((uint64_t)this, 360, 640, 1, 0x1000000);
  if (v1)
  {
    unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v3 = [v2 lastPathComponent];
    uint64_t v4 = +[NSString stringWithFormat:@"setDepthCofiguration failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 1435, v4);
  }
  return v1;
}

void sub_10000D1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setPearlMultiCam(DeviceCMInterface *this)
{
  unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v3 = [v2 lastPathComponent];
  uint64_t v4 = +[NSString stringWithFormat:@"setting multicam..."];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 1443, v4);

  Group = (const void *)HxISPCaptureDeviceController::FindGroup(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId);
  uint64_t v6 = HxISPCaptureDeviceController::FindGroup(this->m_captureDeviceController, this->m_streamIdsInfo.rgbPearlStreamId);
  if (Group && (uint64_t v7 = (const void *)v6, Group != (const void *)v6) && v6)
  {
    CFRelease(Group);
    CFRelease(v7);
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    CFNumberRef v10 = +[NSString stringWithFormat:@"cannot set multi cam if both rgb/ir groups not the same"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1452, v10);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    uint64_t v13 = Mutable;
    if (Mutable) {
      CFArrayAppendValue(Mutable, Group);
    }
    uint64_t v24 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
    uint64_t v25 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    BOOL v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v14);
    CFStringRef v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v16 = [v15 lastPathComponent];
    uint64_t v17 = +[NSString stringWithFormat:@"setting kFigCaptureDeviceProperty_MultiCamConfiguration return val is %d", v11];
    NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 1469, v17);

    if (v13) {
      CFRelease(v13);
    }
    if (v11)
    {
      id v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      v19 = [v18 lastPathComponent];
      uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      CFNumberRef v21 = DeviceCMInterface::getErrorInformationString(v11);
      uint64_t v22 = +[NSString stringWithFormat:@"kFigCaptureDeviceProperty_MultiCamConfiguration failed with OSStatus 0x%x for stream id %d (%@)", v11, irPearlStreamId, v21];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 1476, v22);
    }
  }
  return v11;
}

void sub_10000D500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableSyncForEnumeratedStreams(DeviceCMInterface *this, int a2)
{
  if (!this->m_captureDeviceController
    || this->m_streamIdsInfo.rgbPearlStreamId < 0
    || this->m_streamIdsInfo.irPearlStreamId < 0)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    CFNumberRef v10 = +[NSString stringWithFormat:@"cannot enableSyncForEnumeratedStreams one or more stream ids is invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1486, v10);
    uint64_t v6 = 3758097084;
    goto LABEL_13;
  }
  unsigned int irPearlStreamId = a2;
  this->m_primarySyncModeStreamID = a2;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 2, &kCFTypeArrayCallBacks);
  unsigned int v5 = Mutable;
  if (Mutable)
  {
    CFArrayAppendValue(Mutable, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.rgbPearlStreamId + 2));
    CFArrayAppendValue(v5, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.irPearlStreamId + 2));
  }
  if (!irPearlStreamId) {
    unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  }
  uint64_t v6 = HxISPCaptureDeviceController::SetGroupProperty(this->m_captureDeviceController, irPearlStreamId, kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams, v5);
  if (v5) {
    CFRelease(v5);
  }
  if (v6)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    CFNumberRef v10 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v6);
    BOOL v11 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)", v6, rgbPearlStreamId, v10];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1538, v11);

    uint64_t v6 = 3758097129;
LABEL_13:
  }
  return v6;
}

void sub_10000D788(_Unwind_Exception *a1)
{
  unsigned int v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlSyncSlave(DeviceCMInterface *this, uint64_t a2, int a3)
{
  int valuePtr = a3;
  if (this->m_captureDeviceController)
  {
    if ((a2 & 0x80000000) == 0
      || this->m_streamIdsInfo.irPearlStreamId == a2
      || this->m_streamIdsInfo.rgbPearlStreamId == a2)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_StreamingOutputsEnabled, kCFBooleanTrue);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_FrameSkippingEnabled, kCFBooleanFalse);
      if (a3)
      {
        CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_MasterToSlaveFrameRateRatio, v7);
        CFRelease(v7);
      }
      uint64_t v8 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_SynchronizedStreamsSlaveConfiguration, Mutable);
      CFRelease(Mutable);
      if (v8)
      {
        uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        CFNumberRef v10 = [v9 lastPathComponent];
        BOOL v11 = DeviceCMInterface::getErrorInformationString(v8);
        uint64_t v12 = +[NSString stringWithFormat:@"setSyncSlave failed with OSStatus 0x%x for stream id %d (%@)", v8, a2, v11];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v10, 1598, v12);
      }
    }
    else
    {
      uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      id v18 = [v17 lastPathComponent];
      v19 = +[NSString stringWithFormat:@"cannot set stream %d as master for sync, stream is invalid", a2];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v18, 1556, v19);

      return 3758096385;
    }
  }
  else
  {
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    id v14 = [v13 lastPathComponent];
    CFStringRef v15 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 1549, v15);

    return 3758097084;
  }
  return (uint64_t)v8;
}

void sub_10000DA7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIRAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->m_streamIdsInfo.irPearlStreamId, a2);
}

uint64_t DeviceCMInterface::setPearlRgbAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->m_streamIdsInfo.rgbPearlStreamId, a2);
}

DeviceCMInterface *DeviceCMInterface::disablePearlSyncMode(DeviceCMInterface *this, unsigned int irPearlStreamId)
{
  int m_primarySyncModeStreamID = this->m_primarySyncModeStreamID;
  if (m_primarySyncModeStreamID == -1)
  {
    m_captureDeviceController = this->m_captureDeviceController;
    if (!irPearlStreamId) {
      unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    }
    CFStringRef v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
  }
  else
  {
    m_captureDeviceController = this->m_captureDeviceController;
    CFStringRef v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
    unsigned int irPearlStreamId = m_primarySyncModeStreamID;
  }
  uint64_t v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetGroupProperty(m_captureDeviceController, irPearlStreamId, v5, 0);
  if (v6)
  {
    CFNumberRef v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = DeviceCMInterface::getErrorInformationString(v6);
    CFNumberRef v10 = +[NSString stringWithFormat:@"disableSyncMode failed with OSStatus 0x%x for stream id (%@)", v6, v9];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 1636, v10);
  }
  return v6;
}

void sub_10000DBFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlFormatIndex(DeviceCMInterface *this, unsigned int a2)
{
  m_captureDeviceController = this->m_captureDeviceController;
  CFStringRef v4 = (const __CFString *)kFigCaptureStreamProperty_FormatIndex;
  CFStringRef v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");

  return HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, v4, (const __CFBoolean *)v5);
}

uint64_t DeviceCMInterface::configPearlDevice(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  *(_WORD *)&this->m_currentPearlConfiguration.BOOL isIrOn = 0;
  this->m_currentPearlConfiguration.BOOL isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.int bitMaskID = 0;
  if (a2->isRgbOn)
  {
    uint64_t rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    if (rgbPearlStreamId == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      uint64_t rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
      if (rgbPearlStreamId == -1)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"no available RGB stream index"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1731, v10);
LABEL_32:
        uint64_t v11 = 3758097136;
        goto LABEL_40;
      }
      BOOL isRgbOn = a2->isRgbOn;
    }
    else
    {
      BOOL isRgbOn = 1;
    }
    if (a2->isIrOn && isRgbOn)
    {
      uint64_t v11 = DeviceCMInterface::enableSyncForEnumeratedStreams(this, rgbPearlStreamId);
      uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v13 = [v12 lastPathComponent];
      id v14 = +[NSString stringWithFormat:@"cmsync 2 3 (enableSyncForEnumeratedStreams) ret = %d", v11];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 1740, v14);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"enableSyncForEnumeratedStreams failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1744, v10);
        goto LABEL_40;
      }
      uint64_t v11 = (uint64_t)DeviceCMInterface::setPearlMultiCam(this);
      uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v17 = [v16 lastPathComponent];
      id v18 = +[NSString stringWithFormat:@"CMMULTICAMCREATE -s 2 3(setPearlMultiCam) ret = %d", v11];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v17, 1750, v18);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1754, v10);
        goto LABEL_40;
      }
      uint64_t v11 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.rgbPearlStreamId, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:0]);
      uint64_t v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      id v27 = [v26 lastPathComponent];
      v28 = +[NSString stringWithFormat:@"cmsetcurrentformat 2 0, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, 0) ret = %d", this->m_streamIdsInfo.rgbPearlStreamId];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 1760, v28);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1764, v10);
        goto LABEL_40;
      }
      uint64_t rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    }
    uint64_t v7 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, rgbPearlStreamId, 1);
    if (v7)
    {
      uint64_t v11 = v7;
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId for rgb failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1773, v10);
LABEL_40:

      return v11;
    }
    uint64_t v15 = DeviceCMInterface::enablePearlRGBOutput(this);
    if (v15)
    {
      uint64_t v11 = v15;
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      CFNumberRef v10 = +[NSString stringWithFormat:@"Configure the primary output to multioutput + enable failed"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1781, v10);
      goto LABEL_40;
    }
    this->m_isPearlRgbConfigured = 1;
  }
  BOOL isIrOn = a2->isIrOn;
  if (!a2->isIrOn) {
    goto LABEL_49;
  }
  uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  if (irPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    if (irPearlStreamId == -1)
    {
      uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v9 = [v8 lastPathComponent];
      CFNumberRef v10 = +[NSString stringWithFormat:@"no available IR stream index"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1792, v10);
      goto LABEL_32;
    }
  }
  uint64_t v21 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, irPearlStreamId, 1);
  if (v21)
  {
    uint64_t v11 = v21;
    uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v9 = [v8 lastPathComponent];
    CFNumberRef v10 = +[NSString stringWithFormat:@"setMultiOutModeByStreamId failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1800, v10);
    goto LABEL_40;
  }
  if (this->m_hVersion < 11) {
    goto LABEL_35;
  }
  int v43 = 0;
  uint64_t PearlProjectorHWVersion = DeviceCMInterface::getPearlProjectorHWVersion(this, &v43);
  if (!PearlProjectorHWVersion)
  {
    if (v43 == 10)
    {
      int v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v30 = [v29 lastPathComponent];
      id v31 = +[NSString stringWithFormat:@"projector version %d", 10];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v30, 1816, v31);

      uint64_t v32 = 1;
LABEL_36:
      uint64_t v11 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:v32]);
      uint64_t v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v34 = [v33 lastPathComponent];
      id v35 = +[NSString stringWithFormat:@"cmsetcurrentformat 2 %d, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, %d) ret = %d", this->m_streamIdsInfo.rgbPearlStreamId, v32, v11];
      NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v34, 1826, v35);

      if (v11)
      {
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"setPearlFormatIndex failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1830, v10);
        goto LABEL_40;
      }
      uint64_t v36 = DeviceCMInterface::enablePearlIROutput(this);
      if (v36)
      {
        uint64_t v11 = v36;
        uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        uint64_t v9 = [v8 lastPathComponent];
        CFNumberRef v10 = +[NSString stringWithFormat:@"Configure the primary output to multioutput + enable failed"];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1838, v10);
        goto LABEL_40;
      }
      uint64_t v38 = DeviceCMInterface::setPearlIrCofiguration(this, a2->irType);
      if (v38)
      {
        uint64_t v11 = v38;
        CFArrayRef v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
        CFArrayRef v40 = [v39 lastPathComponent];
        uint64_t v41 = +[NSString stringWithFormat:@"set projector mode to %u failed", a2->irType];
        NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v40, 1846, v41);

        return v11;
      }
      if (a2->isDepthOn)
      {
        uint64_t v42 = DeviceCMInterface::enableDefaultDepthStream(this);
        if (v42)
        {
          uint64_t v11 = v42;
          uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
          uint64_t v9 = [v8 lastPathComponent];
          CFNumberRef v10 = +[NSString stringWithFormat:@"enableDefaultDepthStream failed"];
          NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 1856, v10);
          goto LABEL_40;
        }
      }
      this->m_isPearlIrConfigured = 1;
      BOOL isIrOn = a2->isIrOn;
LABEL_49:
      uint64_t v11 = 0;
      this->m_currentPearlConfiguration.irType = a2->irType;
      this->m_currentPearlConfiguration.BOOL isIrOn = isIrOn;
      *(_WORD *)&this->m_currentPearlConfiguration.isDepthOn = *(_WORD *)&a2->isDepthOn;
      return v11;
    }
LABEL_35:
    uint64_t v32 = 0;
    goto LABEL_36;
  }
  uint64_t v11 = PearlProjectorHWVersion;
  uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
  uint64_t v24 = [v23 lastPathComponent];
  uint64_t v25 = +[NSString stringWithFormat:@"config pearl device failed to read projector version"];
  NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v24, 1821, v25);

  return v11;
}

void sub_10000E5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlProjectorHWVersion(DeviceCMInterface *this, int *a2)
{
  CFTypeRef cf = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = +[NSString stringWithFormat:@"getPearlProjectorVersion failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2398, v9);

    return 3758097084;
  }
  else
  {
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, @"ProjectorHWVersion", &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorHWVersion"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2410, v13);
    }
  }
  return v6;
}

void sub_10000E88C(_Unwind_Exception *a1)
{
  CFStringRef v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentPearlConfiguration(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  this->m_currentPearlConfiguration.irType = a2->irType;
  this->m_currentPearlConfiguration.BOOL isRgbOn = a2->isRgbOn;
  *(_WORD *)&this->m_currentPearlConfiguration.BOOL isIrOn = *(_WORD *)&a2->isIrOn;
  return this;
}

id DeviceCMInterface::getJasperConfigurationStringKey(DeviceCMInterface *this, JasperConfiguration *a2)
{
  p_m_currentJasperConfiguration = &this->m_currentJasperConfiguration;
  if (a2) {
    p_m_currentJasperConfiguration = a2;
  }
  JasperConfiguration v3 = *p_m_currentJasperConfiguration;
  CFStringRef v4 = +[NSMutableString string];
  [v4 appendString:@"DEVICE_CONFIG"];
  if (v3.isJasperOn) {
    [v4 appendString:@"_JASPER_DEPTH"];
  }
  if ((*(void *)&v3 & 0xFF0000) != 0) {
    [v4 appendString:@"_WIDE"];
  }
  if ((*(_WORD *)&v3.isJasperOn & 0xFF00) != 0)
  {
    if ((*(_DWORD *)&v3.isJasperOn & 0xFF000000) != 0) {
      CFStringRef v5 = @"_SUPER_WIDE_SYNCED";
    }
    else {
      CFStringRef v5 = @"_SUPER_WIDE_UNSYNCED";
    }
    [v4 appendString:v5];
  }
  uint64_t v6 = +[NSString stringWithString:v4];

  return v6;
}

void sub_10000E9CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id DeviceCMInterface::getPearlConfigurationStringKey(DeviceCMInterface *this, PearlConfiguration *a2)
{
  p_m_currentPearlConfiguration = &this->m_currentPearlConfiguration;
  p_isDepthOn = &this->m_currentPearlConfiguration.isDepthOn;
  p_BOOL isRgbOn = &this->m_currentPearlConfiguration.isRgbOn;
  p_irType = &this->m_currentPearlConfiguration.irType;
  p_deviceName = &this->m_currentPearlConfiguration.deviceName;
  if (a2)
  {
    p_deviceName = &a2->deviceName;
    p_irType = &a2->irType;
    p_BOOL isRgbOn = &a2->isRgbOn;
    p_isDepthOn = &a2->isDepthOn;
    p_m_currentPearlConfiguration = a2;
  }
  BOOL isIrOn = p_m_currentPearlConfiguration->isIrOn;
  BOOL v8 = *p_isDepthOn;
  BOOL v9 = *p_isRgbOn;
  int v10 = *p_irType;
  uint64_t v11 = *p_deviceName;
  uint64_t v12 = +[NSMutableString string];
  [v12 appendString:@"DEVICE_CONFIG"];
  if (isIrOn) {
    [v12 appendString:@"_IR"];
  }
  if (v8) {
    CFStringRef v13 = @"_DEPTH";
  }
  else {
    CFStringRef v13 = @"_NO_PCE";
  }
  [v12 appendString:v13];
  if (v9) {
    [v12 appendString:@"_RGB"];
  }
  CFStringRef v14 = @"_DENSE";
  switch(v10)
  {
    case 0:
      CFStringRef v14 = @"_IR_MODE_NONE";
      goto LABEL_17;
    case 1:
      CFStringRef v14 = @"_FLOOD";
      goto LABEL_17;
    case 2:
      CFStringRef v14 = @"_SPARSE_LOW_POWER";
      goto LABEL_17;
    case 3:
      CFStringRef v14 = @"_SPARSE";
      goto LABEL_17;
    case 4:
      goto LABEL_17;
    case 5:
      [v12 appendString:@"_DENSE_PROB_AB"];
      goto LABEL_16;
    case 6:
LABEL_16:
      CFStringRef v14 = @"_SPARSE_PROB_AB";
LABEL_17:
      [v12 appendString:v14];
      break;
    default:
      break;
  }
  uint64_t v15 = +[NSString stringWithString:v12];

  return v15;
}

void sub_10000EB7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::isPDECaliobrationValid(DeviceCMInterface *this, BOOL *a2)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v6 = [v5 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"plugin CM controller is nil"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2004, v7);
LABEL_6:
    uint64_t v4 = 3758097084;

    return v4;
  }
  CFTypeRef cf = 0;
  *a2 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"PCECalib", &cf) == 0;
  if (!cf)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v6 = [v5 lastPathComponent];
    uint64_t v7 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_PCECalib"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2023, v7);
    goto LABEL_6;
  }
  CFRelease(cf);
  return 0;
}

void sub_10000ED04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperProjectorFault(uint64_t a1, void *a2, void *a3)
{
  if (*(int *)a1 <= 15)
  {
    unsigned int valuePtr = 0;
    CFNumberRef number = 0;
    CFStringRef v5 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 44), @"ProjectorRikerFaultStatus", &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    CFStringRef v6 = @"ProjectorRikerFaultStatus";
    if (!v5) {
      return v5;
    }
LABEL_9:
    BOOL v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v9 = [v8 lastPathComponent];
    uint64_t v10 = *(unsigned int *)(a1 + 44);
    uint64_t v11 = DeviceCMInterface::getErrorInformationString(v5);
    uint64_t v12 = +[NSString stringWithFormat:@"getJasperProjectorFault %@ failed with OSStatus 0x%x for stream id %d (%@) and property (%@)", v6, v5, v10, v11, v6];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 2063, v12);

    return v5;
  }
  CFNumberRef number = 0;
  CFStringRef v5 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 44), @"ProjectorQuarkFaultStatus", &number);
  if (number)
  {
    *a3 = number;
    CFRelease(number);
  }
  CFStringRef v6 = @"ProjectorQuarkFaultStatus";
  if (v5) {
    goto LABEL_9;
  }
  return v5;
}

void sub_10000EEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperProjectorWillFault(DeviceCMInterface *this, unint64_t *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0;
  uint64_t v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"ProjectorWillFaultStatus", &number);
  if (v4)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v6 = [v5 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    BOOL v8 = DeviceCMInterface::getErrorInformationString(v4);
    BOOL v9 = +[NSString stringWithFormat:@"getJasperRikerProjectorWillFault failed with OSStatus 0x%x for stream id %d (%@)", v4, jasperStreamId, v8];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2080, v9);
  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorWillFaultStatus"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 2092, v12);
  }
  return v4;
}

void sub_10000F080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperResistance(DeviceCMInterface *this, unint64_t *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0;
  uint64_t v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"RikerResistance", &number);
  if (v4)
  {
    CFStringRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v6 = [v5 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    BOOL v8 = DeviceCMInterface::getErrorInformationString(v4);
    BOOL v9 = +[NSString stringWithFormat:@"getJasperRikerResistance failed with OSStatus 0x%x for stream id %d (%@)", v4, jasperStreamId, v8];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 2107, v9);
  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v11 = [v10 lastPathComponent];
    uint64_t v12 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_RikerResistance"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 2119, v12);
  }
  return v4;
}

void sub_10000F25C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getPearlFloodProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  CFNumberRef number = 0;
  unsigned int valuePtr = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController || (unsigned int v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) != 0))
  {
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v13 = [v12 lastPathComponent];
    CFStringRef v14 = +[NSString stringWithFormat:@"getFloodProjectorFault failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v13, 2132, v14);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    CFStringRef v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, @"ProjectorRosalineFaultStatus", &number);
    if (v6)
    {
      uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      BOOL v8 = [v7 lastPathComponent];
      uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      uint64_t v10 = DeviceCMInterface::getErrorInformationString(v6);
      uint64_t v11 = +[NSString stringWithFormat:@"getFloodProjectorFault failed with OSStatus 0x%x for stream id %d (%@)", v6, irPearlStreamId, v10];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2139, v11);
    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v17 = [v16 lastPathComponent];
      id v18 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v17, 2151, v18);
    }
  }
  return v6;
}

void sub_10000F4B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getStructuredProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  unint64_t valuePtr = 0;
  CFNumberRef number = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController || (unsigned int v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    BOOL v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getStructuredProjectorFault failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2163, v9);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    CFStringRef v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, @"ProjectorFaultStatus", &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      CFStringRef v14 = DeviceCMInterface::getErrorInformationString(v6);
      uint64_t v15 = +[NSString stringWithFormat:@"getStructuredProjectorFault failed with OSStatus 0x%x for stream id %d (%@)", v6, irPearlStreamId, v14];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2176, v15);
    }
  }
  return v6;
}

void sub_10000F6AC(_Unwind_Exception *a1)
{
  unsigned int v5 = v3;

  _Unwind_Resume(a1);
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseDevice(DeviceCMInterface *this)
{
  if (DeviceCMInterface::releaseControlOfStreams(this))
  {
    unsigned int v2 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    JasperConfiguration v3 = [v2 lastPathComponent];
    uint64_t v4 = +[NSString stringWithFormat:@"releaseControlOfStreams failed"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v3, 2187, v4);
  }

  return DeviceCMInterface::releaseInterface(this);
}

void sub_10000F7B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 DeviceCMInterface::getStreamIdsInfo@<Q0>(DeviceCMInterface *this@<X0>, int a2@<W1>, __n128 *a3@<X8>)
{
  if (a2) {
    DeviceCMInterface::initAndActivateCaptureDeviceController(this);
  }
  __n128 result = *(__n128 *)&this->m_streamIdsInfo.rgbTeleStreamId;
  *a3 = result;
  a3[1].n128_u64[0] = *(void *)&this->m_streamIdsInfo.rgbSuperWideStreamId;
  return result;
}

DeviceCMInterface *DeviceCMInterface::getRgbjReport(DeviceCMInterface *this, int *a2, int *a3, int *a4, int *a5, int *a6)
{
  CFDictionaryRef theDict = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"RgbjReport", &theDict);
  if (v12)
  {
    CFStringRef v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFStringRef v14 = [v13 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    uint64_t v16 = DeviceCMInterface::getErrorInformationString(v12);
    uint64_t v17 = +[NSString stringWithFormat:@"getRgbjReport: failed with OSStatus 0x%x for stream id %d (%@)", v12, jasperStreamId, v16];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 2232, v17);
  }
  else
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportControllerReached");
    CFNumberGetValue(Value, kCFNumberIntType, a2);
    CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportControllerPassed");
    CFNumberGetValue(v19, kCFNumberIntType, a3);
    CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportIsfSuccess");
    CFNumberGetValue(v20, kCFNumberIntType, a4);
    CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportIsfFailure");
    CFNumberGetValue(v21, kCFNumberIntType, a5);
    *a6 = 0;
    CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"RgbjReportFailedToSave");
    if (v22)
    {
      CFNumberRef v23 = v22;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v23)) {
        CFNumberGetValue(v23, kCFNumberIntType, a6);
      }
      else {
        NSLog(@"The value for key %@ is not a number", @"RgbjReportFailedToSave");
      }
    }
    CFRelease(theDict);
  }
  return v12;
}

void sub_10000FA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::forceSaveWideJasperCalib(DeviceCMInterface *this)
{
  unsigned int v2 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"RgbjForceSaveCalib", 0);
  if (v2)
  {
    JasperConfiguration v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    CFStringRef v6 = DeviceCMInterface::getErrorInformationString(v2);
    uint64_t v7 = +[NSString stringWithFormat:@"forceSaveWideJasperCalib: failed with OSStatus 0x%x for stream id %d (%@)", v2, jasperStreamId, v6];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v4, 2263, v7);
  }
  return v2;
}

void sub_10000FB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setRgbjConfiguration(DeviceCMInterface *this, unsigned int a2, unsigned int a3, uint64_t a4)
{
  v16[0] = @"RgbjConfigurationFeatureVectorSize";
  CFStringRef v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  v16[1] = @"RgbjConfigurationDilutionRate";
  v17[0] = v6;
  uint64_t v7 = +[NSNumber numberWithUnsignedInt:a4];
  v17[1] = v7;
  CFBooleanRef v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  BOOL v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"RgbjConfiguration", v8);
  if (v9)
  {
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    uint64_t v11 = [v10 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    CFStringRef v13 = DeviceCMInterface::getErrorInformationString(v9);
    CFStringRef v14 = +[NSString stringWithFormat:@"setRgbjConfiguration: failed with OSStatus 0x%x for stream id %d (%@)", v9, jasperStreamId, v13];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v11, 2276, v14);
  }
  return v9;
}

void sub_10000FCFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setWideJasperExtrinsics(DeviceCMInterface *this, float a2, float a3, float a4, float a5, float a6, float a7)
{
  CFStringRef v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v32[0] = v13;
  *(float *)&double v14 = a3;
  uint64_t v15 = +[NSNumber numberWithFloat:v14];
  v32[1] = v15;
  *(float *)&double v16 = a4;
  uint64_t v17 = +[NSNumber numberWithFloat:v16];
  v32[2] = v17;
  *(float *)&double v18 = a5;
  CFNumberRef v19 = +[NSNumber numberWithFloat:v18];
  v32[3] = v19;
  *(float *)&double v20 = a6;
  CFNumberRef v21 = +[NSNumber numberWithFloat:v20];
  v32[4] = v21;
  *(float *)&double v22 = a7;
  CFNumberRef v23 = +[NSNumber numberWithFloat:v22];
  v32[5] = v23;
  CFBooleanRef v24 = +[NSArray arrayWithObjects:v32 count:6];

  uint64_t v25 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"OverrideJasperWideExtrinsics", v24);
  if (v25)
  {
    uint64_t v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    id v27 = [v26 lastPathComponent];
    uint64_t jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    int v29 = DeviceCMInterface::getErrorInformationString(v25);
    uint64_t v30 = +[NSString stringWithFormat:@"setWideJasperExtrinsics: failed with OSStatus 0x%x for stream id %d (%@)", v25, jasperStreamId, v29];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v27, 2288, v30);
  }
  return v25;
}

void sub_10000FF68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getJasperModuleInfo(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_ModuleInfo, a2);
}

uint64_t DeviceCMInterface::getJasperCalib(DeviceCMInterface *this, const __CFData **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"JasperCalib", a2);
}

uint64_t DeviceCMInterface::getJasperCalibData(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, @"JapserCalibData", a2);
}

uint64_t DeviceCMInterface::getPearlPleUUID(DeviceCMInterface *this, unsigned __int8 *a2)
{
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getPearlPCECalib failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2320, v9);

    return 3758097084;
  }
  else
  {
    CFDataRef theData = 0;
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, @"PCECalib", &theData);
    if (theData)
    {
      *(_OWORD *)a2 = *(_OWORD *)(CFDataGetBytePtr(theData) + 8);
      CFRelease(theData);
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      CFStringRef v13 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_PCECalib"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2336, v13);
    }
  }
  return v6;
}

void sub_1000101AC(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelSerialNumber(uint64_t a1, void *a2)
{
  id v15 = 0;
  JasperConfiguration v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
  if (!v3 || (unsigned int v5 = *(_DWORD *)(a1 + 36), (v5 & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getPearlRigelSerialNumber failed, ir stream id invalid"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2349, v9);

    return 3758097084;
  }
  else
  {
    uint64_t v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, v5, @"RigelSerialNumber", &v15);
    if (v15)
    {
      *a2 = v15;
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      CFStringRef v13 = DeviceCMInterface::getErrorInformationString(v6);
      double v14 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_RigelSerialNumber, %@", v13];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2360, v14);
    }
  }
  return (uint64_t)v6;
}

void sub_100010378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelOtpVersion(DeviceCMInterface *this, int *a2)
{
  CFTypeRef cf = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (unsigned int irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    uint64_t v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFBooleanRef v8 = [v7 lastPathComponent];
    BOOL v9 = +[NSString stringWithFormat:@"getPearlRigelOtpVersion failed, ir stream id invalid, %@", @"OK"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v8, 2373, v9);

    return 3758097084;
  }
  else
  {
    uint64_t v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, @"ProjectorVersion", &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      uint64_t v12 = [v11 lastPathComponent];
      CFStringRef v13 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorVersion"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 2385, v13);
    }
  }
  return v6;
}

void sub_100010520(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getGuadalupeValues(DeviceCMInterface *this, uint64_t *a2, uint64_t *a3, uint64_t *a4, int *a5, uint64_t *a6)
{
  CFTypeRef cf = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"GuadRecordRegisters", &cf);
  if (!cf)
  {
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    double v16 = [v15 lastPathComponent];
    uint64_t v17 = DeviceCMInterface::getErrorInformationString(v12);
    double v18 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_GuadRecordRegisters, %@", v17];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 2428, v18);

LABEL_14:
    return v12;
  }
  *a6 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  CFTypeRef cf = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"GuadLastResistance", &cf);
  if (!cf)
  {
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    double v16 = [v15 lastPathComponent];
    uint64_t v17 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_GuadLastResistance"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 2443, v17);
    goto LABEL_14;
  }
  *a5 = FigCFNumberGetSInt32();
  CFRelease(cf);
  CFTypeRef cf = 0;
  uint64_t v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"BaneState", &cf);
  if (!cf)
  {
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    double v16 = [v15 lastPathComponent];
    uint64_t v17 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneState"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 2457, v17);
    goto LABEL_14;
  }
  *a2 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  CFTypeRef cf = 0;
  uint64_t v13 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"ProjectorRosalineFaultStatus", &cf);
  if (cf)
  {
    *a3 = (int)FigCFNumberGetSInt32();
    CFRelease(cf);
    CFTypeRef cf = 0;
    uint64_t v14 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, @"BaneResistance", &cf);
    if (cf)
    {
      if (!v12) {
        LODWORD(v12) = v13;
      }
      *a4 = (int)FigCFNumberGetSInt32();
      CFRelease(cf);
      if (v12) {
        return (DeviceCMInterface *)v12;
      }
      else {
        return (DeviceCMInterface *)v14;
      }
    }
    else
    {
      CFNumberRef v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
      CFBooleanRef v24 = [v23 lastPathComponent];
      uint64_t v25 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneResistance"];
      NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v24, 2490, v25);

      return (DeviceCMInterface *)v14;
    }
  }
  else
  {
    double v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"];
    CFNumberRef v21 = [v20 lastPathComponent];
    double v22 = +[NSString stringWithFormat:@"Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus"];
    NSLog(@"<ERROR %@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v21, 2473, v22);

    return (DeviceCMInterface *)v13;
  }
}

void sub_10001093C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t HxISPCaptureDeviceController::FindGroup(HxISPCaptureDeviceController *this, unsigned int a2)
{
  if (!*((_DWORD *)this + 536)) {
    return 0;
  }
  unint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
  uint64_t v6 = (const void **)((char *)this + 8 * a2 + 16);
  uint64_t v7 = (char *)this + 2080;
  do
  {
    CFArrayRef theArray = 0;
    uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v10 + 48);
    if (!v11 || v11(FigBaseObject, v5, kCFAllocatorDefault, &theArray)) {
      break;
    }
    CFArrayRef v12 = theArray;
    v15.length = CFArrayGetCount(theArray);
    v15.location = 0;
    if (CFArrayContainsValue(v12, v15, *v6)) {
      uint64_t v4 = *(void *)&v7[8 * v3];
    }
    CFRelease(theArray);
    ++v3;
  }
  while (v3 < *((unsigned int *)this + 536));
  return v4;
}

void HxISPCaptureDeviceController::HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  for (uint64_t i = 296; i != 2280; i += 248)
    *((unsigned char *)this + i) = 0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  *((_DWORD *)this + 538) = -1;
  *((void *)this + 259) = 0;
  *((_DWORD *)this + 536) = 0;
  *((unsigned char *)this + 2148) = 0;
  *((_DWORD *)this + 516) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  do
  {
    uint64_t v5 = (char *)this + 8 * v4;
    *((void *)v5 + 2) = 0;
    *((void *)v5 + 260) = 0;
    uint64_t v6 = (char *)this + v3;
    pthread_mutex_init((pthread_mutex_t *)((char *)this + v3 + 96), 0);
    pthread_cond_init((pthread_cond_t *)((char *)this + v3 + 160), 0);
    *((_WORD *)v6 + 136) = 0;
    *((void *)v6 + 33) = 0;
    *((_DWORD *)v6 + 52) = 0;
    *(_OWORD *)(v6 + 216) = 0u;
    *(_OWORD *)(v6 + 232) = 0u;
    *(_OWORD *)(v6 + 241) = 0u;
    *((void *)v6 + 10) = this;
    *((_DWORD *)v6 + 22) = v4;
    *(void *)(v6 + 276) = 0xFFFFLL;
    *((void *)v6 + 36) = 0;
    ++v4;
    v3 += 248;
    *((_WORD *)v6 + 142) = 0;
  }
  while (v3 != 1984);
}

void HxISPCaptureDeviceController::~HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  uint64_t v2 = 0;
  uint64_t v3 = 256;
  do
  {
    if (*((unsigned char *)this + v3)) {
      HxISPCaptureDeviceController::stopReceive(this, v2);
    }
    ++v2;
    v3 += 248;
  }
  while (v2 != 8);
  if (*((unsigned char *)this + 2148)) {
    HxISPCaptureDeviceController::deactivate(this);
  }
  uint64_t v4 = -1984;
  do
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)this + v4 + 2144));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + v4 + 2080));
    v4 += 248;
  }
  while (v4);
}

uint64_t HxISPCaptureDeviceController::stopReceive(HxISPCaptureDeviceController *this, unsigned int a2)
{
  if (*((unsigned char *)this + 248 * a2 + 256))
  {
    if (*((_DWORD *)this + 516) <= a2)
    {
      uint64_t v7 = 3758097084;
      printf("Error: HxISPCaptureDeviceController::stopReceive - Invalid streamIndex %d\n", a2);
    }
    else
    {
      *((unsigned char *)this + 248 * a2 + 272) = 1;
      uint64_t v4 = *((void *)this + a2 + 2);
      uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
      CFBooleanRef v8 = *(uint64_t (**)(uint64_t))(v6 + 16);
      if (v8) {
        uint64_t v7 = v8(v4);
      }
      else {
        uint64_t v7 = 4294954514;
      }
      uint64_t v9 = (char *)this + 248 * a2;
      CFArrayRef v12 = (opaqueCMBufferQueue *)*((void *)v9 + 27);
      uint64_t v11 = (CMBufferQueueRef *)(v9 + 216);
      uint64_t v10 = v12;
      if (v12)
      {
        CMBufferQueueRemoveTrigger(v10, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
        while (1)
        {
          CMBufferRef v13 = CMBufferQueueDequeueAndRetain(*v11);
          if (!v13) {
            break;
          }
          CFRelease(v13);
        }
        uint64_t v14 = (char *)this + 248 * a2;
        uint64_t v17 = (opaqueCMBufferQueue *)*((void *)v14 + 29);
        double v16 = (opaqueCMBufferQueue **)(v14 + 232);
        for (uint64_t i = v17; ; uint64_t i = *v16)
        {
          CMBufferRef v18 = CMBufferQueueDequeueAndRetain(i);
          if (!v18) {
            break;
          }
          CFRelease(v18);
        }
      }
      CFNumberRef v19 = (char *)this + 248 * a2;
      if (*((void *)v19 + 33))
      {
        double v20 = (pthread_t *)(v19 + 264);
        CFNumberRef v21 = (char *)this + 248 * a2;
        double v22 = (pthread_mutex_t *)(v21 + 96);
        pthread_mutex_lock((pthread_mutex_t *)(v21 + 96));
        int v25 = *((_DWORD *)v21 + 52);
        CFBooleanRef v24 = (int *)(v21 + 208);
        for (int j = v25; j == 1; int j = *v24)
        {
          pthread_mutex_unlock(v22);
          usleep(0x2710u);
          pthread_mutex_lock(v22);
        }
        v28 = 0;
        *CFBooleanRef v24 = 2;
        pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
        pthread_mutex_unlock(v22);
        pthread_join(*v20, &v28);
        pthread_t *v20 = 0;
      }
      uint64_t v26 = (char *)this + 248 * a2;
      *((void *)v26 + 30) = 0;
      *((void *)v26 + 31) = 0;
      v26[256] = 0;
    }
  }
  else
  {
    uint64_t v7 = 3758097084;
    puts("Error: HxISPCaptureDeviceController::startReceive - not already streaming");
  }
  return v7;
}

uint64_t HxISPCaptureDeviceController::deactivate(HxISPCaptureDeviceController *this)
{
  if (*((unsigned char *)this + 2148))
  {
    for (uint64_t i = 16; i != 80; i += 8)
    {
      if (*(void *)((char *)this + i))
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterRemoveListener();
      }
    }
    for (uint64_t j = 0; j != 1984; j += 248)
    {
      uint64_t v4 = *(const void **)((char *)this + j + 216);
      if (v4) {
        CFRelease(v4);
      }
      uint64_t v5 = *(const void **)((char *)this + j + 232);
      if (v5) {
        CFRelease(v5);
      }
    }
    uint64_t v6 = 0;
    uint64_t v7 = -1984;
    do
    {
      CFBooleanRef v8 = (char *)this + v6;
      *((void *)v8 + 2) = 0;
      *((void *)v8 + 260) = 0;
      uint64_t v9 = (char *)this + v7;
      pthread_mutex_init((pthread_mutex_t *)((char *)this + v7 + 2080), 0);
      pthread_cond_init((pthread_cond_t *)((char *)this + v7 + 2144), 0);
      *((_WORD *)v9 + 1128) = 0;
      *((void *)v9 + 281) = 0;
      *((_DWORD *)v9 + 548) = 0;
      *(_OWORD *)(v9 + 2200) = 0u;
      *(_OWORD *)(v9 + 2216) = 0u;
      *(_OWORD *)(v9 + 2225) = 0u;
      *((void *)v9 + 258) = this;
      v6 += 8;
      *((_DWORD *)v9 + 518) = 0;
      v7 += 248;
    }
    while (v7);
    uint64_t v10 = (const void *)*((void *)this + 259);
    if (v10) {
      CFRelease(v10);
    }
    uint64_t v11 = (const void *)*((void *)this + 1);
    if (v11) {
      CFRelease(v11);
    }
    if (*(void *)this)
    {
      uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
      if (FigBaseObject)
      {
        uint64_t v13 = FigBaseObject;
        uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        double v16 = *(void (**)(uint64_t))(v15 + 24);
        if (v16) {
          v16(v13);
        }
      }
      CFRelease(*(CFTypeRef *)this);
    }
    *((unsigned char *)this + 2148) = 0;
    *((_DWORD *)this + 516) = 0;
    *(void *)this = 0;
    *((void *)this + 1) = 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t HxISPCaptureDeviceController::activate(HxISPCaptureDeviceController *this)
{
  uint64_t v1 = 0xFFFFFFFFLL;
  if (*((unsigned char *)this + 2148)) {
    return v1;
  }
  *((_DWORD *)this + 538) = -1;
  int v25 = 0;
  uint64_t v1 = sub_1000134EC("/System/Library/MediaCapture/VirtualCameraDevice.mediacapture", "FigVirtualCameraDeviceCreate", (uint64_t)&v25);
  if (v25)
  {
    fprintf(__stderrp, "+++ Found and loaded %s\n", "/System/Library/MediaCapture/VirtualCameraDevice.mediacapture");
    uint64_t v3 = v25;
    if (v25)
    {
LABEL_13:
      *(void *)this = v3;
      goto LABEL_14;
    }
  }
  uint64_t v4 = &dword_10001CAD0;
  unint64_t v5 = 1;
  do
  {
    CFDictionaryRef v6 = IOServiceMatching(*((const char **)v4 - 3));
    if (IOServiceGetMatchingService(kIOMainPortDefault, v6))
    {
      uint64_t v7 = (const char *)*((void *)v4 - 2);
      uint64_t v1 = sub_1000134EC(v7, *((const char **)v4 - 1), (uint64_t)&v25);
      if (!v25)
      {
        uint64_t v3 = 0;
        goto LABEL_10;
      }
      fprintf(__stderrp, "+++ Found and loaded  %s\n", v7);
      *((_DWORD *)this + 538) = *v4;
    }
    uint64_t v3 = v25;
LABEL_10:
    if (v5 > 4) {
      break;
    }
    ++v5;
    v4 += 8;
  }
  while (!v3);
  if (this) {
    goto LABEL_13;
  }
  if (v3) {
    CFRelease(v3);
  }
LABEL_14:
  if (v1 || !*(void *)this)
  {
    puts("HxISPCaptureDeviceController::activate - Error: Could not create CaptureDevice");
  }
  else
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    CFArrayRef v12 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, char *))(v11 + 48);
    if (!v12) {
      return 4294954514;
    }
    uint64_t v1 = v12(FigBaseObject, kFigCaptureDeviceProperty_StreamArray, kCFAllocatorDefault, (char *)this + 8);
    if (v1) {
      return v1;
    }
    unsigned int Count = CFArrayGetCount(*((CFArrayRef *)this + 1));
    if (Count >= 8) {
      int v14 = 8;
    }
    else {
      int v14 = Count;
    }
    *((_DWORD *)this + 516) = v14;
    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        *((void *)this + v15 + 2) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 1), v15);
        ++v15;
        unint64_t v16 = *((unsigned int *)this + 516);
      }
      while (v15 < v16);
      if (v16)
      {
        unint64_t v17 = 0;
        do
        {
          if (*((void *)this + v17 + 2))
          {
            CMNotificationCenterGetDefaultLocalCenter();
            CMNotificationCenterAddListener();
          }
          else
          {
            printf("HxISPCaptureDeviceController::activate - CaptureStream %d not found\n", v17);
          }
          ++v17;
        }
        while (v17 < *((unsigned int *)this + 516));
      }
    }
    uint64_t v18 = FigCaptureDeviceGetFigBaseObject();
    uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v20 = v19 ? v19 : 0;
    CFNumberRef v21 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, char *))(v20 + 48);
    if (!v21) {
      return 4294954514;
    }
    uint64_t v1 = v21(v18, kFigCaptureDeviceProperty_SupportedSynchronizedStreamsGroups, kCFAllocatorDefault, (char *)this + 2072);
    if (!v1)
    {
      unsigned int v22 = CFArrayGetCount(*((CFArrayRef *)this + 259));
      if (v22 >= 8) {
        int v23 = 8;
      }
      else {
        int v23 = v22;
      }
      *((_DWORD *)this + 536) = v23;
      if (v23)
      {
        unint64_t v24 = 0;
        do
        {
          *((void *)this + v24 + 260) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 259), v24);
          ++v24;
        }
        while (v24 < *((unsigned int *)this + 536));
      }
      uint64_t v1 = 0;
      *((unsigned char *)this + 2148) = 1;
    }
  }
  return v1;
}

size_t sub_1000113FC(int a1, uint64_t a2, const __CFString *a3, CFTypeRef cf1)
{
  if (a2 && cf1)
  {
    if (*(_DWORD *)(a2 + 2064))
    {
      unint64_t v7 = 0;
      do
      {
        if (CFEqual(cf1, *(CFTypeRef *)(a2 + 16 + 8 * v7))) {
          break;
        }
        ++v7;
      }
      while (v7 < *(unsigned int *)(a2 + 2064));
      unsigned int v8 = v7;
    }
    else
    {
      unsigned int v8 = 0;
    }
    uint64_t v11 = __stdoutp;
    CStringPtr = CFStringGetCStringPtr(a3, 0);
    fprintf(v11, "HxISPCaptureDeviceController::handleStreamNotification: %s (streamIndex %d)\n", CStringPtr, v8);
    fflush(__stdoutp);
    size_t result = CFEqual(a3, kFigCaptureStreamNotification_StreamControlTakenByAnotherClient);
    if (result && *(unsigned char *)(a2 + 248 * v8 + 256))
    {
      return HxISPCaptureDeviceController::stopReceive((HxISPCaptureDeviceController *)a2, v8);
    }
  }
  else
  {
    uint64_t v9 = __stdoutp;
    return fwrite("Diagnostic_FW Device controller recievd null notification info objects\n", 0x47uLL, 1uLL, v9);
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::RequestStreams(HxISPCaptureDeviceController *this, const __CFArray *a2, const __CFDictionary *a3)
{
  if (!a2) {
    return 4294954516;
  }
  uint64_t v5 = *(void *)this;
  CFDictionaryRef v6 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0;
  }
  if (*v7 < 2uLL) {
    return 4294954514;
  }
  uint64_t v9 = (uint64_t (*)(uint64_t, const __CFArray *, const __CFDictionary *))v7[2];
  if (!v9) {
    return 4294954514;
  }

  return v9(v5, a2, a3);
}

uint64_t HxISPCaptureDeviceController::RelinquishStreams(HxISPCaptureDeviceController *this, const __CFArray *a2)
{
  if (!a2) {
    return 4294954516;
  }
  uint64_t v3 = *(void *)this;
  uint64_t v4 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (*v5 < 2uLL) {
    return 4294954514;
  }
  unint64_t v7 = (uint64_t (*)(uint64_t, const __CFArray *, void))v5[3];
  if (!v7) {
    return 4294954514;
  }

  return v7(v3, a2, 0);
}

uint64_t HxISPCaptureDeviceController::startReceive(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(opaqueCMSampleBuffer *, unsigned int, void *), void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = (char *)this + 248 * a2;
  if (v5[256])
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = (char *)this + 248 * a2;
  *((void *)v9 + 30) = a3;
  *((void *)v9 + 31) = a4;
  CFTypeRef obj = 0;
  uint64_t v10 = (uint64_t *)((char *)this + 8 * a2 + 16);
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v12 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }
  int v14 = *(unsigned int (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v13 + 48);
  if (v14 && !v14(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj))
  {
    CFShow(obj);
    CFRelease(obj);
    CFTypeRef obj = 0;
  }
  unint64_t v15 = (char *)this + 248 * a2;
  uint64_t v17 = *((void *)v15 + 27);
  unint64_t v16 = (CMBufferQueueRef *)(v15 + 216);
  if (!v17)
  {
    uint64_t v22 = FigCaptureStreamGetFigBaseObject();
    uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v23) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = 0;
    }
    uint64_t v34 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CMBufferQueueRef *))(v24 + 48);
    if (!v34) {
      return 4294954514;
    }
    uint64_t v6 = v34(v22, kFigCaptureStreamProperty_BufferQueue, kCFAllocatorDefault, v16);
    if (v6) {
      return v6;
    }
  }
  uint64_t v18 = (char *)this + 248 * a2;
  uint64_t v20 = *((void *)v18 + 29);
  uint64_t v19 = v18 + 232;
  if (!v20)
  {
    uint64_t v25 = FigCaptureStreamGetFigBaseObject();
    uint64_t v26 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v26) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = 0;
    }
    id v35 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, char *))(v27 + 48);
    if (v35)
    {
      uint64_t v6 = v35(v25, kFigCaptureStreamProperty_StillImageBufferQueue, kCFAllocatorDefault, v19);
      if (v6) {
        return v6;
      }
      goto LABEL_17;
    }
    return 4294954514;
  }
LABEL_17:
  CFNumberRef v21 = *v16;
  CMTime time = kCMTimeZero;
  if (CMBufferQueueInstallTrigger(v21, (CMBufferQueueTriggerCallback)sub_100011C18, v5 + 80, 7, &time, (CMBufferQueueTriggerToken *)this + 31 * a2 + 28))
  {
    return 3758097084;
  }
  v28 = (char *)this + 248 * a2;
  int v29 = (pthread_mutex_t *)(v28 + 96);
  pthread_mutex_lock((pthread_mutex_t *)(v28 + 96));
  *((_DWORD *)v28 + 52) = 0;
  uint64_t v30 = v28 + 208;
  v30[64] = 0;
  pthread_attr_init(&v40);
  pthread_attr_setdetachstate(&v40, 1);
  pthread_create((pthread_t *)v30 + 7, &v40, (void *(__cdecl *)(void *))sub_100011C88, v5 + 80);
  pthread_attr_destroy(&v40);
  pthread_mutex_unlock(v29);
  uint64_t v31 = *v10;
  uint64_t v32 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v32) {
    uint64_t v33 = v32;
  }
  else {
    uint64_t v33 = 0;
  }
  uint64_t v36 = v5 + 256;
  CFBooleanRef v37 = *(uint64_t (**)(uint64_t))(v33 + 8);
  if (v37)
  {
    uint64_t v6 = v37(v31);
    if (!v6)
    {
      uint64_t v6 = 0;
      *uint64_t v36 = 1;
      return v6;
    }
  }
  else
  {
    uint64_t v6 = 4294954514;
  }
  CMBufferQueueRemoveTrigger(*v16, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
  while (1)
  {
    usleep(0x2710u);
    v40.__sig = 0;
    pthread_mutex_lock(v29);
    if (*(_DWORD *)v30 != 1) {
      break;
    }
    pthread_mutex_unlock(v29);
  }
  *(_DWORD *)uint64_t v30 = 2;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
  pthread_mutex_unlock(v29);
  pthread_join(*((pthread_t *)v30 + 7), (void **)&v40);
  *uint64_t v36 = 0;
  return v6;
}

uint64_t sub_100011C18(uint64_t result)
{
  if (!*(unsigned char *)(result + 192))
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 128) != 1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(result + 16));
      *(_DWORD *)(v1 + 128) = 1;
      pthread_cond_signal((pthread_cond_t *)(v1 + 80));
      return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 16));
    }
  }
  return result;
}

uint64_t sub_100011C88(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8)) {
    uint64_t v2 = "HxISPCaptureDeviceStreamFrameReceiveThread1";
  }
  else {
    uint64_t v2 = "HxISPCaptureDeviceStreamFrameReceiveThread0";
  }
  pthread_setname_np(v2);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  while (1)
  {
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    if (*(_DWORD *)(a1 + 128) == 2) {
      break;
    }
    CMBufferRef v3 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
    if (v3)
    {
      CMBufferRef v4 = v3;
      do
      {
        uint64_t v5 = *(void (**)(CMBufferRef, void, void))(a1 + 160);
        if (v5) {
          v5(v4, *(unsigned int *)(a1 + 8), *(void *)(a1 + 168));
        }
        CFRelease(v4);
        CMBufferRef v4 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 128) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a4, void (*a5)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a6, void (*a7)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a8, void (*a9)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a10, void (*a11)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a12, void (*a13)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a14, void (*a15)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a16, void (*a17)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a18, void (*a19)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a20,void (*a21)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *),void *a22)
{
  if (!*((unsigned char *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  if (*((unsigned char *)this + 248 * a2 + 256))
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v65 = (char *)this + 248 * a2;
  uint64_t v31 = a2;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    uint64_t v33 = Mutable;
    uint64_t v34 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v34)
    {
      id v35 = v34;
      value[0] = _NSConcreteStackBlock;
      value[1] = 0x40000000;
      value[2] = sub_100012744;
      value[3] = &unk_10001C6D8;
      unsigned int v86 = a2;
      value[4] = a3;
      value[5] = a4;
      CFDictionarySetValue(v34, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, value);
      CFDictionarySetValue(v35, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C718);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PrimaryScaler, v35);
      CFRelease(v35);
    }
    uint64_t v36 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v36)
    {
      CFBooleanRef v37 = v36;
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 0x40000000;
      v83[2] = sub_1000127BC;
      v83[3] = &unk_10001C738;
      unsigned int v84 = a2;
      v83[4] = a5;
      v83[5] = a6;
      CFDictionarySetValue(v36, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v83);
      CFDictionarySetValue(v37, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C778);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_SecondaryScaler, v37);
      CFRelease(v37);
    }
    uint64_t v38 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v38)
    {
      CFArrayRef v39 = v38;
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 0x40000000;
      v81[2] = sub_100012834;
      v81[3] = &unk_10001C798;
      unsigned int v82 = a2;
      v81[4] = a7;
      v81[5] = a8;
      CFDictionarySetValue(v38, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v81);
      CFDictionarySetValue(v39, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C7D8);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_IntermediateTap, v39);
      CFRelease(v39);
    }
    if (a9)
    {
      pthread_attr_t v40 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v40)
      {
        uint64_t v41 = v40;
        v79[0] = _NSConcreteStackBlock;
        v79[1] = 0x40000000;
        v79[2] = sub_1000128AC;
        v79[3] = &unk_10001C7F8;
        unsigned int v80 = a2;
        v79[4] = a9;
        v79[5] = a10;
        CFDictionarySetValue(v40, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v79);
        CFDictionarySetValue(v41, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C838);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImage, v41);
        CFRelease(v41);
      }
    }
    if (a11)
    {
      uint64_t v42 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v42)
      {
        int v43 = v42;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 0x40000000;
        v77[2] = sub_100012924;
        v77[3] = &unk_10001C858;
        unsigned int v78 = a2;
        v77[4] = a11;
        v77[5] = a12;
        CFDictionarySetValue(v42, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v77);
        CFDictionarySetValue(v43, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C898);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageIntermediateTap, v43);
        CFRelease(v43);
      }
    }
    if (a13)
    {
      uint64_t v44 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v44)
      {
        float v45 = v44;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 0x40000000;
        v75[2] = sub_10001299C;
        v75[3] = &unk_10001C8B8;
        unsigned int v76 = a2;
        v75[4] = a13;
        v75[5] = a14;
        CFDictionarySetValue(v44, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v75);
        CFDictionarySetValue(v45, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C8F8);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Depth, v45);
        CFRelease(v45);
      }
    }
    if (a15)
    {
      float v46 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v46)
      {
        v47 = v46;
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 0x40000000;
        v73[2] = sub_100012A14;
        v73[3] = &unk_10001C918;
        unsigned int v74 = a2;
        v73[4] = a15;
        v73[5] = a16;
        CFDictionarySetValue(v46, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v73);
        CFDictionarySetValue(v47, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C958);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Raw, v47);
        CFRelease(v47);
      }
    }
    if (a17)
    {
      float v48 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v48)
      {
        uint64_t v49 = v48;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 0x40000000;
        v71[2] = sub_100012A8C;
        v71[3] = &unk_10001C978;
        unsigned int v72 = a2;
        v71[4] = a17;
        v71[5] = a18;
        CFDictionarySetValue(v48, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v71);
        CFDictionarySetValue(v49, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001C9B8);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageRaw, v49);
        CFRelease(v49);
      }
    }
    if (a19)
    {
      v50 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v50)
      {
        float v51 = v50;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 0x40000000;
        v69[2] = sub_100012B04;
        v69[3] = &unk_10001C9D8;
        unsigned int v70 = a2;
        v69[4] = a19;
        v69[5] = a20;
        CFDictionarySetValue(v50, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v69);
        CFDictionarySetValue(v51, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001CA18);
        CFDictionarySetValue(v33, @"VisPipe", v51);
        CFRelease(v51);
      }
    }
    if (a21)
    {
      float v52 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v52)
      {
        v53 = v52;
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 0x40000000;
        v67[2] = sub_100012B7C;
        v67[3] = &unk_10001CA38;
        unsigned int v68 = a2;
        v67[4] = a21;
        v67[5] = a22;
        CFDictionarySetValue(v52, kFigCaptureStreamVideoOutputHandlerKey_DataBufferHandler, v67);
        CFDictionarySetValue(v53, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_10001CA78);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PointCloud, v53);
        CFRelease(v53);
      }
    }
    int v54 = HxISPCaptureDeviceController::SetStreamProperty(this, a2, kFigCaptureStreamProperty_VideoOutputHandlers, v33);
    if (v54) {
      printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - error setting VideoOutputHandlers: %d\n", v54);
    }
    CFRelease(v33);
    uint64_t v31 = a2;
  }
  float v55 = (char *)this + 248 * v31;
  *((void *)v55 + 30) = 0;
  *((void *)v55 + 31) = 0;
  CFTypeRef obj = 0;
  v56 = (uint64_t *)((char *)this + 8 * v31 + 16);
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v58 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v58) {
    uint64_t v59 = v58;
  }
  else {
    uint64_t v59 = 0;
  }
  v60 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v59 + 48);
  if (!v60) {
    return 4294954514;
  }
  uint64_t result = v60(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj);
  if (result) {
    return result;
  }
  CFShow(obj);
  CFRelease(obj);
  CFTypeRef obj = 0;
  uint64_t v61 = *v56;
  uint64_t v62 = *(void *)(CMBaseObjectGetVTable() + 16);
  uint64_t v63 = v62 ? v62 : 0;
  v64 = *(uint64_t (**)(uint64_t))(v63 + 8);
  if (!v64) {
    return 4294954514;
  }
  uint64_t result = v64(v61);
  if (!result) {
    v65[256] = 1;
  }
  return result;
}

uint64_t sub_100012744(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100012790(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (primaryScaler), event=%d\n", a2);
}

uint64_t sub_1000127BC(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100012808(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (secondaryScaler), event=%d\n", a2);
}

uint64_t sub_100012834(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100012880(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (intermediateTap), event=%d\n", a2);
}

uint64_t sub_1000128AC(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_1000128F8(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImage), event=%d\n", a2);
}

uint64_t sub_100012924(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100012970(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageIntermediateTap), event=%d\n", a2);
}

uint64_t sub_10001299C(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_1000129E8(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (depth), event=%d\n", a2);
}

uint64_t sub_100012A14(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100012A60(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (raw), event=%d\n", a2);
}

uint64_t sub_100012A8C(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100012AD8(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageRaw), event=%d\n", a2);
}

uint64_t sub_100012B04(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100012B50(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (visPipe), event=%d\n", a2);
}

uint64_t sub_100012B7C(uint64_t result, uint64_t a2, long long *a3)
{
  CMBufferRef v3 = *(uint64_t (**)(uint64_t, long long *, void, void))(result + 32);
  if (v3)
  {
    long long v4 = *a3;
    uint64_t v5 = *((void *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(void *)(result + 40));
  }
  return result;
}

void sub_100012BC8(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (data), event=%d\n", a2);
}

uint64_t HxISPCaptureDeviceController::SetStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const __CFBoolean *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    uint64_t v11 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_7:
    puts(v11);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    uint64_t v11 = "Error: HxISPCaptureDeviceController::SetStreamProperty - Invalid stream index";
    goto LABEL_7;
  }
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v13 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFBoolean *))(v10 + 56);
  if (!v13) {
    return 4294954514;
  }
  uint64_t result = v13(FigBaseObject, a3, a4);
  if (!result)
  {
    uint64_t result = CFEqual(a3, kFigCaptureStreamProperty_MultipleOutputSupportEnabled);
    if (result)
    {
      uint64_t result = CFBooleanGetValue(a4);
      int v14 = (char *)this + 248 * a2 + 273;
      if (result)
      {
        uint64_t result = 0;
        unsigned char *v14 = 1;
      }
      else
      {
        unsigned char *v14 = 0;
      }
    }
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::SetDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, const void *a3)
{
  if (*((unsigned char *)this + 2148))
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(v7 + 56);
    if (v9)
    {
      return v9(FigBaseObject, a2, a3);
    }
    else
    {
      return 4294954514;
    }
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, void *a3)
{
  if (*((unsigned char *)this + 2148))
  {
    uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(v7 + 48);
    if (v9)
    {
      return v9(FigBaseObject, a2, kCFAllocatorDefault, a3);
    }
    else
    {
      return 4294954514;
    }
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    uint64_t v9 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_7:
    puts(v9);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    uint64_t v9 = "Error: HxISPCaptureDeviceController::CopyStreamProperty - Invalid stream index";
    goto LABEL_7;
  }
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(v8 + 48);
  if (!v11) {
    return 4294954514;
  }

  return v11(FigBaseObject, a3, kCFAllocatorDefault, a4);
}

uint64_t HxISPCaptureDeviceController::SetGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - No CM plug-in";
LABEL_15:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Invalid stream index";
    goto LABEL_15;
  }
  if (*((_DWORD *)this + 536))
  {
    uint64_t v7 = 0;
    uint64_t v8 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    uint64_t v9 = (const void **)((char *)this + 8 * a2 + 16);
    while (1)
    {
      CFArrayRef theArray = 0;
      uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v12 = v11 ? v11 : 0;
      uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v12 + 48);
      if (!v13 || v13(FigBaseObject, v8, kCFAllocatorDefault, &theArray)) {
        break;
      }
      CFArrayRef v14 = theArray;
      v22.length = CFArrayGetCount(theArray);
      v22.location = 0;
      CFArrayContainsValue(v14, v22, *v9);
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536)) {
        goto LABEL_16;
      }
    }
    unint64_t v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(v19 + 56);
  if (v20) {
    return v20(v17, a3, a4);
  }
  else {
    return 4294954514;
  }
}

uint64_t HxISPCaptureDeviceController::CopyGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  if (!*((unsigned char *)this + 2148))
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - No CM plug-in";
LABEL_15:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    unint64_t v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Invalid stream index";
    goto LABEL_15;
  }
  if (*((_DWORD *)this + 536))
  {
    uint64_t v7 = 0;
    uint64_t v8 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    uint64_t v9 = (const void **)((char *)this + 8 * a2 + 16);
    while (1)
    {
      CFArrayRef theArray = 0;
      uint64_t FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
      uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v12 = v11 ? v11 : 0;
      uint64_t v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(v12 + 48);
      if (!v13 || v13(FigBaseObject, v8, kCFAllocatorDefault, &theArray)) {
        break;
      }
      CFArrayRef v14 = theArray;
      v22.length = CFArrayGetCount(theArray);
      v22.location = 0;
      CFArrayContainsValue(v14, v22, *v9);
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536)) {
        goto LABEL_16;
      }
    }
    unint64_t v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
  uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(v19 + 48);
  if (v20) {
    return v20(v17, a3, kCFAllocatorDefault, a4);
  }
  else {
    return 4294954514;
  }
}

uint64_t sub_1000134EC(const char *a1, const char *a2, uint64_t a3)
{
  uint64_t v5 = dlopen(a1, 4);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t (*)(const CFAllocatorRef, void, uint64_t))dlsym(v5, a2);
  if (!v6) {
    return 0;
  }

  return v6(kCFAllocatorDefault, 0, a3);
}

id getCurrentVersion(void)
{
  v0 = +[NSBundle mainBundle];
  uint64_t v1 = [v0 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  return v1;
}

void sub_1000135BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void logMainResults(NSDictionary *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = a1;
  uint64_t v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  uint64_t v6 = [v5 lastPathComponent];
  uint64_t v7 = +[NSString stringWithFormat:@"Start Diag Logging Results Dictionary for %d -->", a2];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v6, 23, v7);

  uint64_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  uint64_t v9 = [v8 lastPathComponent];
  uint64_t v10 = +[NSString stringWithFormat:@"Return code: %d", a3];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 24, v10);

  uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  uint64_t v12 = [v11 lastPathComponent];
  uint64_t v13 = [(NSDictionary *)v31 description];
  CFArrayRef v14 = +[NSString stringWithFormat:@"Result description: %@", v13];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v12, 25, v14);

  unint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  unint64_t v16 = [v15 lastPathComponent];
  uint64_t v17 = +[NSString stringWithFormat:@"Key/Val pairs:"];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v16, 26, v17);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v18 = [(NSDictionary *)v31 allKeys];
  id obj = v18;
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v33;
    do
    {
      CFNumberRef v21 = 0;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v21);
        uint64_t v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
        uint64_t v24 = [v23 lastPathComponent];
        uint64_t v25 = [(NSDictionary *)v31 objectForKey:v22];
        uint64_t v26 = +[NSString stringWithFormat:@"key:%@ val: %@", v22, v25];
        NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v24, 29, v26);

        CFNumberRef v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      uint64_t v18 = obj;
      id v19 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v19);
  }

  uint64_t v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"];
  v28 = [v27 lastPathComponent];
  int v29 = +[NSString stringWithFormat:@"Done Diag Logging Results Dictionary <--"];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v28, 31, v29);
}

void sub_1000139D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

__CFString *decToBinStr(unsigned int a1)
{
  unint64_t v1 = a1;
  uint64_t v2 = &stru_10001D3B8;
  int v3 = 32;
  do
  {
    long long v4 = +[NSString stringWithFormat:@"%lu", v1 & 1];
    uint64_t v5 = [v4 stringByAppendingString:v2];

    v1 >>= 1;
    uint64_t v2 = v5;
    --v3;
  }
  while (v3);

  return v5;
}

void sub_100013B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t setBit(uint64_t result, int a2, unsigned int *a3)
{
  unsigned int v3 = *a3 | result;
  if (!a2) {
    unsigned int v3 = *a3 & ~result;
  }
  *a3 = v3;
  return result;
}

void updateJasperValidationStatus(int a1, JasperValidationStatus *a2)
{
  if ((a1 & 0x400) != 0)
  {
    sub_100003704(a2, 40, @"JASPER_VC_PROJECTOR_NOT_ACTIVE");
    if ((a1 & 0x1000) == 0)
    {
LABEL_3:
      if ((a1 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((a1 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  sub_100003704(a2, 41, @"JASPER_VC_BRICK");
  if ((a1 & 0x8000) == 0)
  {
LABEL_4:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  sub_100003704(a2, 42, @"JASPER_VC_PROJECTOR_FAULT");
  if ((a1 & 0x20000) == 0)
  {
LABEL_5:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  sub_100003704(a2, 43, @"JASPER_VC_SW_SAFETY");
  if ((a1 & 0x40000) == 0)
  {
LABEL_6:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  sub_100003704(a2, 44, @"JASPER_VC_OVERHEAT");
  if ((a1 & 0x80000) == 0)
  {
LABEL_7:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  sub_100003704(a2, 45, @"JASPER_VC_POWERSUPPLY");
  if ((a1 & 0x100000) == 0)
  {
LABEL_8:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    sub_100003704(a2, 47, @"JASPER_VC_SENSOR_MONITOR");
    if ((a1 & 0x400000) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_17:
  sub_100003704(a2, 46, @"JASPER_VC_SENSOR_STATUS");
  if ((a1 & 0x200000) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((a1 & 0x400000) == 0) {
    return;
  }
LABEL_19:

  sub_100003704(a2, 48, @"JASPER_VC_PROJECTORON_NOT_ALLOWED");
}

void setTestValidationBit(int a1, id *a2)
{
  if (a1)
  {
    id v4 = +[NSMutableDictionary dictionary];
    if (a1) {
      [v4 setValue:@"FAIL" forKey:@"SENSOR_FRAMERATE"];
    }
    if ((a1 & 2) != 0) {
      [v4 setValue:@"FAIL" forKey:@"SENSOR_EXPOSURE"];
    }
    if ((a1 & 4) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_SELECT_AB"];
    }
    if ((a1 & 8) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_SELECT_C"];
    }
    if ((a1 & 0x10) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_SELECT_AB34"];
    }
    if ((a1 & 0x20) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT0"];
    }
    if ((a1 & 0x40) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT1"];
    }
    if ((a1 & 0x80) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT2"];
    }
    if ((a1 & 0x100) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT3"];
    }
    if ((a1 & 0x200) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_IOUT4"];
    }
    if ((a1 & 0x400) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_NOT_ACTIVE"];
    }
    if ((a1 & 0x800) != 0) {
      [v4 setValue:@"FAIL" forKey:@"MB_NO_ENABLE"];
    }
    if ((a1 & 0x1000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"MB_BRICK"];
    }
    if ((a1 & 0x2000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"YG"];
    }
    if ((a1 & 0x4000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_CC"];
    }
    if ((a1 & 0x8000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_FAULT"];
    }
    if ((a1 & 0x10000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTOR_STROBECOUNT"];
    }
    if ((a1 & 0x20000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"SW_SAFETY"];
    }
    if ((a1 & 0x40000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"OVERHEAT"];
    }
    if ((a1 & 0x80000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"POWERSUPPLY"];
    }
    if ((a1 & 0x100000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"SENSOR_STATUS"];
    }
    if ((a1 & 0x200000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"SENSOR_MONITOR"];
    }
    if ((a1 & 0x400000) != 0) {
      [v4 setValue:@"FAIL" forKey:@"PROJECTORON_NOT_ALLOWED"];
    }
    [*a2 setValue:v4 forKey:@"FW VALIDATION FAIL INFO"];
  }
}

void sub_100013FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

unint64_t isYGErrorDetected(unint64_t a1)
{
  return (a1 >> 13) & 1;
}

CFStringRef getJasperStatusValueString(int a1)
{
  CFStringRef result = @"JASPER_PASS_OK";
  if (a1 > 100)
  {
    CFStringRef v3 = @"JASPER_VC_REAL_POWERSUPPLY";
    if (a1 != 525312) {
      CFStringRef v3 = @"JASPER_PASS_OK";
    }
    if (a1 == 101) {
      return @"JASPER_GENERIC_ERROR";
    }
    else {
      return v3;
    }
  }
  else
  {
    switch(a1)
    {
      case 10:
        CFStringRef result = @"JASPER_MODULE_IS_MISSING";
        break;
      case 11:
        CFStringRef result = @"JASPER_INTERFACE_ERROR";
        break;
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
        return result;
      case 20:
        CFStringRef result = @"JASPER_FAILED_TO_START_STREAMING";
        break;
      case 21:
        CFStringRef result = @"JASPER_FAILED_TO_STOP_STREAMING";
        break;
      case 22:
        CFStringRef result = @"JASPER_FAILED_STREAM_CONTROL";
        break;
      case 30:
        CFStringRef result = @"JASPER_FPS_ERROR";
        break;
      case 31:
        CFStringRef result = @"JASPER_POINTS_ERROR";
        break;
      case 40:
        CFStringRef result = @"JASPER_VC_PROJECTOR_NOT_ACTIVE";
        break;
      case 41:
        CFStringRef result = @"JASPER_VC_BRICK";
        break;
      case 42:
        CFStringRef result = @"JASPER_VC_PROJECTOR_FAULT";
        break;
      case 43:
        CFStringRef result = @"JASPER_VC_SW_SAFETY";
        break;
      case 44:
        CFStringRef result = @"JASPER_VC_OVERHEAT";
        break;
      case 45:
        CFStringRef result = @"JASPER_VC_POWERSUPPLY";
        break;
      case 46:
        CFStringRef result = @"JASPER_VC_SENSOR_STATUS";
        break;
      case 47:
        CFStringRef result = @"JASPER_VC_SENSOR_MONITOR";
        break;
      case 48:
        CFStringRef result = @"JASPER_VC_PROJECTORON_NOT_ALLOWED";
        break;
      case 49:
        CFStringRef result = @"JASPER_VC_ANY_VALIDATION_ERROR";
        break;
      default:
        if (a1 == -2) {
          CFStringRef result = @"JASPER_UNSEALED_STATUS";
        }
        break;
    }
  }
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFShow(CFTypeRef obj)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

uint64_t CMBaseObjectGetVTable()
{
  return _CMBaseObjectGetVTable();
}

CMBufferRef CMBufferQueueDequeueAndRetain(CMBufferQueueRef queue)
{
  return _CMBufferQueueDequeueAndRetain(queue);
}

OSStatus CMBufferQueueInstallTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerCallback callback, void *refcon, CMBufferQueueTriggerCondition condition, CMTime *time, CMBufferQueueTriggerToken *triggerTokenOut)
{
  return _CMBufferQueueInstallTrigger(queue, callback, refcon, condition, time, triggerTokenOut);
}

OSStatus CMBufferQueueRemoveTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerToken triggerToken)
{
  return _CMBufferQueueRemoveTrigger(queue, triggerToken);
}

uint64_t CMNotificationCenterAddListener()
{
  return _CMNotificationCenterAddListener();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return _CMNotificationCenterGetDefaultLocalCenter();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return _CMNotificationCenterRemoveListener();
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return _CVBufferCopyAttachments(buffer, attachmentMode);
}

void CVBufferRelease(CVBufferRef buffer)
{
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return _CVBufferRetain(buffer);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetDataSize(pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

uint64_t FigCFNumberGetSInt32()
{
  return _FigCFNumberGetSInt32();
}

uint64_t FigCaptureDeviceGetFigBaseObject()
{
  return _FigCaptureDeviceGetFigBaseObject();
}

uint64_t FigCaptureStreamGetFigBaseObject()
{
  return _FigCaptureStreamGetFigBaseObject();
}

uint64_t FigCaptureSynchronizedStreamsGroupGetFigBaseObject()
{
  return _FigCaptureSynchronizedStreamsGroupGetFigBaseObject();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_bankIds(void *a1, const char *a2, ...)
{
  return [a1 bankIds];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_checkConnectivity(void *a1, const char *a2, ...)
{
  return [a1 checkConnectivity];
}

id objc_msgSend_confidences(void *a1, const char *a2, ...)
{
  return [a1 confidences];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_finalizingOnError(void *a1, const char *a2, ...)
{
  return [a1 finalizingOnError];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAllStatusesGood(void *a1, const char *a2, ...)
{
  return [a1 isAllStatusesGood];
}

id objc_msgSend_isPortTypeJasperDetected(void *a1, const char *a2, ...)
{
  return [a1 isPortTypeJasperDetected];
}

id objc_msgSend_isUnsealedUnitModule(void *a1, const char *a2, ...)
{
  return [a1 isUnsealedUnitModule];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_startStreaming(void *a1, const char *a2, ...)
{
  return [a1 startStreaming];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopStreaming(void *a1, const char *a2, ...)
{
  return [a1 stopStreaming];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}