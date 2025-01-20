void sub_234C43538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C436C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_234C4397C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_234C464B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C46664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_234C48484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234C48548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_234C48AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

double getLargestFaceRect(void *a1)
{
  id v1 = a1;
  v2 = [v1 metadataObjectForKey:*MEMORY[0x263F616B0]];
  if (!v2)
  {
    v3 = [v1 metadataDict];
    v4 = [v3 objectForKeyedSubscript:@"PVFrameSetMetadataARMetadataKey"];

    v5 = [v4 faceAnchor];
    [v5 normalizedFaceRect];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    if (v1) {
      [v1 presentationTimeStamp];
    }
    else {
      memset(&v35, 0, sizeof(v35));
    }
    v37.origin.x = v7;
    v37.origin.y = v9;
    v37.size.width = v11;
    v37.size.height = v13;
    v14 = MakePVFaceDetectionFull(0, 0, 0.0, 0, 0.0, v37, AVCaptureVideoOrientationPortrait, &v35, 0);
    v2 = [MEMORY[0x263EFF980] arrayWithObject:v14];
  }
  uint64_t v15 = [v2 count];
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    float v18 = 0.0;
    do
    {
      v19 = [v2 objectAtIndexedSubscript:v17];
      [v19 boundingBox];
      double v21 = v20;
      v22 = [v2 objectAtIndexedSubscript:v17];
      [v22 boundingBox];
      float v24 = v21 * v23;

      if (v18 < v24)
      {
        uint64_t v16 = v17;
        float v18 = v24;
      }
      ++v17;
    }
    while (v15 != v17);
    v25 = [v2 objectAtIndexedSubscript:v16];
    [v25 boundingBox];
    double v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    double v33 = v32;

    if (v33 != -1.0)
    {
      v38.size.width = 0.99;
      v38.origin.x = 0.0;
      v38.origin.y = 0.0;
      v36.origin.x = v27;
      v36.origin.y = v29;
      v36.size.width = v31;
      v36.size.height = v33;
      v38.size.height = 0.99;
      *(void *)&double v27 = (unint64_t)CGRectIntersection(v36, v38);
    }
  }
  else
  {
    double v27 = 0.0;
  }

  return v27;
}

void sub_234C48EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL isFaceBoundingBoxValid(double a1, double a2, double a3, double a4)
{
  return a4 > 0.0;
}

void drawFaceRectOnAlphaMap(__CVBuffer *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226488)
  {
    size_t Width = CVPixelBufferGetWidth(a1);
    size_t Height = CVPixelBufferGetHeight(a1);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    CVPixelBufferLockBaseAddress(a1, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(a1);
    float v14 = a4 * a5;
    if (v14 > 0.0)
    {
      uint64_t v15 = BaseAddress;
      uint64_t v16 = JFXLog_matting();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v81 = 134218496;
        double v82 = a3;
        __int16 v83 = 2048;
        double v84 = a2;
        __int16 v85 = 1024;
        unsigned int v86 = llroundf(v14);
        _os_log_impl(&dword_234C41000, v16, OS_LOG_TYPE_DEFAULT, "Face: (%.1f,%.1f) area=%d", (uint8_t *)&v81, 0x1Cu);
      }

      float v17 = a4 * 0.5;
      float v18 = a5 * 0.5;
      float v19 = a2 + v17;
      float v20 = a3 + v18;
      float v21 = (float)Width;
      float v22 = (float)Height;
      float v23 = v19 - v17;
      float v24 = v17 + v19;
      float v25 = v20 - v18;
      if (v23 >= v24)
      {
        float v28 = v18 + v20;
      }
      else
      {
        unsigned int v26 = llroundf(v25 * v21);
        signed int v27 = v26 + 5;
        float v28 = v18 + v20;
        unsigned int v29 = llroundf(v28 * v21);
        signed int v30 = v29 + 5;
        unsigned int v31 = v26 - 6;
        unsigned int v32 = v29 - 6;
        float v33 = v23;
        do
        {
          unsigned int v34 = llroundf(v33 * v22);
          unsigned int v35 = v34 - 5;
          int v36 = v34 + 5;
          unsigned int v37 = v35;
          do
          {
            size_t v38 = v37;
            size_t v39 = BytesPerRow * v37;
            signed int v40 = v31;
            do
            {
              size_t v41 = (v40 + 1);
              if (v40 + 1 >= 0 && (v38 & 0x80000000) == 0 && Width > v41 && Height > v38) {
                v15[v39 + v41] = -56;
              }
              ++v40;
            }
            while (v40 < v27);
            unsigned int v37 = v38 + 1;
          }
          while ((int)v38 < v36);
          do
          {
            size_t v43 = v35;
            size_t v44 = BytesPerRow * v35;
            signed int v45 = v32;
            do
            {
              size_t v46 = (v45 + 1);
              if (v45 + 1 >= 0 && (v43 & 0x80000000) == 0 && Width > v46 && Height > v43) {
                v15[v44 + v46] = -56;
              }
              ++v45;
            }
            while (v45 < v30);
            unsigned int v35 = v43 + 1;
          }
          while ((int)v43 < v36);
          float v33 = v33 + 0.04;
        }
        while (v24 > v33);
      }
      if (v25 < v28)
      {
        unsigned int v49 = llroundf(v23 * v22);
        unsigned int v50 = v49 - 5;
        unsigned int v51 = llroundf(v24 * v22);
        int v52 = v49 + 5;
        unsigned int v53 = v51 - 5;
        int v54 = v51 + 5;
        do
        {
          unsigned int v55 = llroundf(v25 * v21);
          signed int v56 = v55 + 5;
          unsigned int v57 = v55 - 6;
          unsigned int v58 = v50;
          do
          {
            size_t v59 = v58;
            size_t v60 = BytesPerRow * v58;
            signed int v61 = v57;
            do
            {
              size_t v62 = (v61 + 1);
              if (v61 + 1 >= 0 && (v59 & 0x80000000) == 0 && Width > v62 && Height > v59) {
                v15[v60 + v62] = -56;
              }
              ++v61;
            }
            while (v61 < v56);
            unsigned int v58 = v59 + 1;
          }
          while ((int)v59 < v52);
          unsigned int v64 = v53;
          do
          {
            size_t v65 = v64;
            size_t v66 = BytesPerRow * v64;
            signed int v67 = v57;
            do
            {
              size_t v68 = (v67 + 1);
              if (v67 + 1 >= 0 && (v65 & 0x80000000) == 0 && Width > v68 && Height > v65) {
                v15[v66 + v68] = -56;
              }
              ++v67;
            }
            while (v67 < v56);
            unsigned int v64 = v65 + 1;
          }
          while ((int)v65 < v54);
          float v25 = v25 + 0.08;
        }
        while (v28 > v25);
      }
      unsigned int v70 = llroundf(v19 * v22);
      unsigned int v71 = v70 - 5;
      unsigned int v72 = llroundf(v20 * v21);
      int v73 = v70 + 5;
      signed int v74 = v72 + 5;
      unsigned int v75 = v72 - 6;
      do
      {
        size_t v76 = v71;
        size_t v77 = BytesPerRow * v71;
        signed int v78 = v75;
        do
        {
          size_t v79 = (v78 + 1);
          if (v78 + 1 >= 0 && (v76 & 0x80000000) == 0 && Width > v79 && Height > v76) {
            v15[v77 + v79] = -56;
          }
          ++v78;
        }
        while (v78 < v74);
        unsigned int v71 = v76 + 1;
      }
      while ((int)v76 < v73);
    }
    CVPixelBufferUnlockBaseAddress(a1, 0);
  }
  else
  {
    v48 = JFXLog_matting();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v81) = 0;
      _os_log_impl(&dword_234C41000, v48, OS_LOG_TYPE_DEFAULT, "Error: wrong pixel format for matte", (uint8_t *)&v81, 2u);
    }
  }
}

double transformedPoint(unint64_t a1, double a2, float a3, uint64_t a4, uint64_t a5)
{
  if (a5 == 2) {
    a3 = 1.0 - a3;
  }
  return (float)(a3 * (float)a1);
}

id JFX_CaptureSessionInterruptionReasonsList()
{
  if (JFX_CaptureSessionInterruptionReasonsList_onceToken != -1) {
    dispatch_once(&JFX_CaptureSessionInterruptionReasonsList_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)JFX_CaptureSessionInterruptionReasonsList_interruptionReasonsArray;
  return v0;
}

uint64_t CFXCaptureCapabilitiesIsCTMSupported()
{
  v0 = CFXAspectRatioCropOverride();
  if (v0)
  {
    uint64_t v1 = 1;
  }
  else
  {
    v2 = [MEMORY[0x263F30780] capabilities];
    uint64_t v1 = [v2 isCTMSupported];
  }
  return v1;
}

uint64_t CFXCaptureCapabilitiesIsHDRSupported()
{
  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    uint64_t v1 = [MEMORY[0x263F30780] capabilities];
    uint64_t v2 = [v1 isHDR10BitVideoSupported];

    return v2;
  }
  return result;
}

void sub_234C4B90C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_234C4BE50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_234C4D018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234C4D110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234C4D1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234C4D268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double CGPointRound(double a1)
{
  return round(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_234C577F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void EdgeLine::EdgeLine(EdgeLine *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
}

{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
}

void ContourMemoryPool::ContourMemoryPool(ContourMemoryPool *this)
{
}

void ContourMemoryPool::~ContourMemoryPool(ContourMemoryPool *this)
{
  var0 = this->var0;
  if (var0) {
    MEMORY[0x237DD0F10](var0, 0x1000C8077774924);
  }
  var1 = this->var1;
  if (var1) {
    MEMORY[0x237DD0F10](var1, 0x1000C8077774924);
  }
  var2 = this->var2;
  if (var2) {
    MEMORY[0x237DD0F10](var2, 0x1000C8052888210);
  }
  var3 = this->var3;
  if (var3) {
    MEMORY[0x237DD0F10](var3, 0x1000C8052888210);
  }
}

void ContourProcessing::ContourProcessing(ContourProcessing *this, unsigned __int8 *a2, int a3, int a4, ContourMemoryPool *a5, char a6)
{
  *((void *)this + 13) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(void *)this = a2;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a4;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 15) = a5;
  *((unsigned char *)this + 116) = a6;
}

{
  *((void *)this + 13) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(void *)this = a2;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a4;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 15) = a5;
  *((unsigned char *)this + 116) = a6;
}

void ContourProcessing::~ContourProcessing(ContourProcessing *this)
{
  uint64_t v2 = (void *)*((void *)this + 11);
  if (v2)
  {
    *((void *)this + 12) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((void *)this + 8);
  if (v3)
  {
    *((void *)this + 9) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 5);
  if (v4)
  {
    *((void *)this + 6) = v4;
    operator delete(v4);
  }
}

uint64_t ContourProcessing::contourExtraction(ContourProcessing *this, int *a2)
{
  ContourProcessing::tracingContours(this);
  int v4 = *((_DWORD *)this + 4);
  if (v4 >= 21) {
    ContourProcessing::contourSmoothClose(this);
  }
  *a2 = v4;
  return *((void *)this + 3);
}

void ContourProcessing::tracingContours(ContourProcessing *this)
{
  uint64_t v195 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)this;
  v3 = (char *)**((void **)this + 15);
  bzero(v3, *((int *)this + 3) + 2);
  bzero(&v3[*((int *)this + 3) + 2 + (*((int *)this + 3) + 2) * *((int *)this + 2)], *((_DWORD *)this + 3) + 2);
  int v4 = *((_DWORD *)this + 2);
  if (v4 >= 1)
  {
    int v5 = 0;
    do
    {
      int v6 = v5 + 1;
      v3[(*((int *)this + 3) + 2) * v6] = 0;
      memcpy(&v3[(*((_DWORD *)this + 3) + 2) * (v5 + 1) + 1], (char *)v2 + *((_DWORD *)this + 3) * v5, *((int *)this + 3));
      v3[*((_DWORD *)this + 3) + 1 + (*((_DWORD *)this + 3) + 2) * v6] = 0;
      int v4 = *((_DWORD *)this + 2);
      int v5 = v6;
    }
    while (v6 < v4);
  }
  CGFloat v7 = *(unsigned __int8 **)(*((void *)this + 15) + 8);
  bzero(v7, (*((int *)this + 3) + 2) * (v4 + 2));
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 3) = *(void *)(*((void *)this + 15) + 16);
  uint64_t v181 = 0x7FFFFFFFFLL;
  int v9 = *((_DWORD *)this + 2);
  int v8 = *((_DWORD *)this + 3);
  int v182 = -3 - v8;
  int v183 = 7;
  int v186 = ~v8;
  int v188 = 3;
  int v189 = v8 + 3;
  int v190 = 3;
  int v191 = v8 + 2;
  int v192 = 5;
  int v193 = v8 + 1;
  int v194 = 5;
  int v184 = -2 - v8;
  int v185 = 1;
  uint64_t v187 = 0x100000001;
  if (v9 < -1)
  {
    int v13 = 0;
    int v15 = v8;
    int v14 = v9;
    int v12 = 0;
    goto LABEL_129;
  }
  BOOL v10 = 0;
  int v11 = 0;
  int v12 = 0;
  int v13 = 0;
  v176 = (void **)((char *)this + 64);
  v179 = (void **)((char *)this + 88);
  v180 = (char **)((char *)this + 104);
  int v14 = v9;
  int v15 = v8;
  do
  {
    if (v8 < -1) {
      goto LABEL_126;
    }
    int v16 = 0;
    int v17 = v8 + 2;
    do
    {
      int v18 = v16 + v17 * v11;
      if (v7[v18] == 255 && !v10)
      {
        BOOL v10 = 1;
        goto LABEL_124;
      }
      int v19 = v3[v18];
      if (v19 != 255 || !v10)
      {
        if (v19 == 0 && v10)
        {
          BOOL v10 = 0;
          goto LABEL_124;
        }
        if (v19 == 255 && !v10)
        {
          int v177 = v12;
          int v178 = v13;
          v7[v18] = -1;
          float v21 = (char *)*((void *)this + 9);
          unint64_t v20 = *((void *)this + 10);
          int v22 = v14;
          if ((unint64_t)v21 >= v20)
          {
            float v24 = (char *)*v176;
            uint64_t v25 = (v21 - (unsigned char *)*v176) >> 2;
            unint64_t v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 62) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v27 = v20 - (void)v24;
            if (v27 >> 1 > v26) {
              unint64_t v26 = v27 >> 1;
            }
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28)
            {
              unsigned int v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 80, v28);
              float v24 = (char *)*((void *)this + 8);
              float v21 = (char *)*((void *)this + 9);
            }
            else
            {
              unsigned int v29 = 0;
            }
            signed int v30 = &v29[4 * v25];
            *(_DWORD *)signed int v30 = *((_DWORD *)this + 4);
            float v23 = v30 + 4;
            while (v21 != v24)
            {
              int v31 = *((_DWORD *)v21 - 1);
              v21 -= 4;
              *((_DWORD *)v30 - 1) = v31;
              v30 -= 4;
            }
            *((void *)this + 8) = v30;
            *((void *)this + 9) = v23;
            *((void *)this + 10) = &v29[4 * v28];
            if (v24) {
              operator delete(v24);
            }
            int v14 = v22;
          }
          else
          {
            *(_DWORD *)float v21 = *((_DWORD *)this + 4);
            float v23 = v21 + 4;
          }
          *((void *)this + 9) = v23;
          float v33 = (int *)*((void *)this + 12);
          unsigned int v32 = (char *)*((void *)this + 13);
          if (v33 >= (int *)v32)
          {
            unsigned int v35 = (char *)*v179;
            uint64_t v36 = ((char *)v33 - (unsigned char *)*v179) >> 2;
            unint64_t v37 = v36 + 1;
            if ((unint64_t)(v36 + 1) >> 62) {
              goto LABEL_255;
            }
            uint64_t v38 = v32 - v35;
            if (v38 >> 1 > v37) {
              unint64_t v37 = v38 >> 1;
            }
            if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v39 = v37;
            }
            if (v39)
            {
              signed int v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v180, v39);
              unsigned int v35 = (char *)*((void *)this + 11);
              float v33 = (int *)*((void *)this + 12);
            }
            else
            {
              signed int v40 = 0;
            }
            size_t v41 = (int *)&v40[4 * v36];
            *size_t v41 = v15;
            unsigned int v34 = (char *)(v41 + 1);
            while (v33 != (int *)v35)
            {
              int v42 = *--v33;
              *--size_t v41 = v42;
            }
            unsigned int v32 = &v40[4 * v39];
            *((void *)this + 11) = v41;
            *((void *)this + 12) = v34;
            *((void *)this + 13) = v32;
            if (v35)
            {
              operator delete(v35);
              unsigned int v32 = *v180;
            }
            int v14 = v22;
          }
          else
          {
            *float v33 = v15;
            unsigned int v34 = (char *)(v33 + 1);
          }
          *((void *)this + 12) = v34;
          if (v34 >= v32)
          {
            size_t v44 = (char *)*v179;
            uint64_t v45 = (v34 - (unsigned char *)*v179) >> 2;
            unint64_t v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 62) {
              goto LABEL_255;
            }
            uint64_t v47 = v32 - v44;
            if (v47 >> 1 > v46) {
              unint64_t v46 = v47 >> 1;
            }
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v48 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v48 = v46;
            }
            if (v48)
            {
              unsigned int v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v180, v48);
              size_t v44 = (char *)*((void *)this + 11);
              unsigned int v34 = (char *)*((void *)this + 12);
            }
            else
            {
              unsigned int v49 = 0;
            }
            unsigned int v50 = &v49[4 * v45];
            *(_DWORD *)unsigned int v50 = v178;
            size_t v43 = v50 + 4;
            while (v34 != v44)
            {
              int v51 = *((_DWORD *)v34 - 1);
              v34 -= 4;
              *((_DWORD *)v50 - 1) = v51;
              v50 -= 4;
            }
            unsigned int v32 = &v49[4 * v48];
            *((void *)this + 11) = v50;
            *((void *)this + 12) = v43;
            *((void *)this + 13) = v32;
            if (v44)
            {
              operator delete(v44);
              unsigned int v32 = *v180;
            }
            int v14 = v22;
          }
          else
          {
            *(_DWORD *)unsigned int v34 = v178;
            size_t v43 = v34 + 4;
          }
          *((void *)this + 12) = v43;
          if (v43 >= v32)
          {
            unsigned int v53 = (char *)*v179;
            uint64_t v54 = (v43 - (unsigned char *)*v179) >> 2;
            unint64_t v55 = v54 + 1;
            if ((unint64_t)(v54 + 1) >> 62) {
              goto LABEL_255;
            }
            uint64_t v56 = v32 - v53;
            if (v56 >> 1 > v55) {
              unint64_t v55 = v56 >> 1;
            }
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v57 = v55;
            }
            if (v57)
            {
              unsigned int v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v180, v57);
              int v14 = v22;
              size_t v59 = v58;
              unsigned int v53 = (char *)*((void *)this + 11);
              size_t v43 = (char *)*((void *)this + 12);
            }
            else
            {
              size_t v59 = 0;
            }
            size_t v60 = (int *)&v59[4 * v54];
            *size_t v60 = v14;
            int v52 = (char *)(v60 + 1);
            while (v43 != v53)
            {
              int v61 = *((_DWORD *)v43 - 1);
              v43 -= 4;
              *--size_t v60 = v61;
            }
            unsigned int v32 = &v59[4 * v57];
            *((void *)this + 11) = v60;
            *((void *)this + 12) = v52;
            *((void *)this + 13) = v32;
            if (v53)
            {
              operator delete(v53);
              unsigned int v32 = *v180;
            }
          }
          else
          {
            *(_DWORD *)size_t v43 = v14;
            int v52 = v43 + 4;
          }
          *((void *)this + 12) = v52;
          if (v52 < v32)
          {
            *(_DWORD *)int v52 = v177;
            size_t v62 = v52 + 4;
LABEL_99:
            int v13 = 0;
            int v12 = 0;
            int v71 = 0;
            *((void *)this + 12) = v62;
            int v72 = 1;
            int v73 = v18;
            int v14 = *((_DWORD *)this + 2);
            int v15 = *((_DWORD *)this + 3);
            while (1)
            {
              for (unsigned int i = 0; ; ++i)
              {
                uint64_t v75 = v72 - 1;
                uint64_t v76 = *((int *)&v181 + 2 * v75) + (uint64_t)v73;
                BOOL v10 = v3[v76] == 255;
                if (v3[v76] == 255) {
                  break;
                }
                if (i > 8) {
                  goto LABEL_123;
                }
                BOOL v77 = -v72 < 0;
                int v78 = -v72 & 7;
                int v79 = v72 & 7;
                if (v77) {
                  int v80 = v79;
                }
                else {
                  int v80 = -v78;
                }
                int v72 = v80 + 1;
              }
              int v72 = *((_DWORD *)&v181 + 2 * v75 + 1);
              if (v76 == v18)
              {
                BOOL v81 = v72 != 1 && v71 <= 1;
                if (!v81)
                {
LABEL_123:
                  int v8 = *((_DWORD *)this + 3);
                  goto LABEL_124;
                }
                ++v71;
              }
              v7[v76] = -1;
              uint64_t v82 = *((void *)this + 3);
              *(_DWORD *)(v82 + 8 * *((int *)this + 4) + 4) = (int)v76 / (*((_DWORD *)this + 3) + 2) - 1;
              *(_DWORD *)(v82 + 8 * *((_DWORD *)this + 4)) = v76
                                                             + (*((_DWORD *)this + 3) + 2)
                                                             * ~*(_DWORD *)(v82 + 8 * *((int *)this + 4) + 4)
                                                             - 1;
              uint64_t v83 = *((int *)this + 4);
              int v84 = *(_DWORD *)(v82 + 8 * v83);
              if (v84 < v15) {
                int v15 = *(_DWORD *)(v82 + 8 * v83);
              }
              if (v13 <= v84) {
                int v13 = *(_DWORD *)(v82 + 8 * v83);
              }
              int v85 = *(_DWORD *)(v82 + 4 * (int)((2 * v83) | 1));
              if (v85 < v14) {
                int v14 = *(_DWORD *)(v82 + 4 * (int)((2 * v83) | 1));
              }
              if (v12 <= v85) {
                int v12 = *(_DWORD *)(v82 + 4 * (int)((2 * v83) | 1));
              }
              *((_DWORD *)this + 4) = v83 + 1;
              int v73 = v76;
            }
          }
          v63 = (char *)*v179;
          uint64_t v64 = (v52 - (unsigned char *)*v179) >> 2;
          unint64_t v65 = v64 + 1;
          if (!((unint64_t)(v64 + 1) >> 62))
          {
            uint64_t v66 = v32 - v63;
            if (v66 >> 1 > v65) {
              unint64_t v65 = v66 >> 1;
            }
            if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v67 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v67 = v65;
            }
            if (v67)
            {
              size_t v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v180, v67);
              v63 = (char *)*((void *)this + 11);
              int v52 = (char *)*((void *)this + 12);
            }
            else
            {
              size_t v68 = 0;
            }
            v69 = &v68[4 * v64];
            *(_DWORD *)v69 = v177;
            size_t v62 = v69 + 4;
            while (v52 != v63)
            {
              int v70 = *((_DWORD *)v52 - 1);
              v52 -= 4;
              *((_DWORD *)v69 - 1) = v70;
              v69 -= 4;
            }
            *((void *)this + 11) = v69;
            *((void *)this + 12) = v62;
            *((void *)this + 13) = &v68[4 * v67];
            if (v63) {
              operator delete(v63);
            }
            goto LABEL_99;
          }
LABEL_255:
          std::vector<int>::__throw_length_error[abi:ne180100]();
        }
      }
LABEL_124:
      ++v16;
      int v17 = v8 + 2;
    }
    while (v16 < v8 + 2);
    int v9 = *((_DWORD *)this + 2);
LABEL_126:
    BOOL v81 = v11++ <= v9;
  }
  while (v81);
LABEL_129:
  unint64_t v86 = *((void *)this + 10);
  uint64_t v87 = (char *)*((void *)this + 9);
  int v88 = v14;
  if ((unint64_t)v87 >= v86)
  {
    v90 = (char *)*((void *)this + 8);
    uint64_t v91 = (v87 - v90) >> 2;
    if ((unint64_t)(v91 + 1) >> 62) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v92 = v86 - (void)v90;
    unint64_t v93 = (uint64_t)(v86 - (void)v90) >> 1;
    if (v93 <= v91 + 1) {
      unint64_t v93 = v91 + 1;
    }
    if (v92 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v94 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v94 = v93;
    }
    if (v94)
    {
      v95 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 80, v94);
      v90 = (char *)*((void *)this + 8);
      uint64_t v87 = (char *)*((void *)this + 9);
    }
    else
    {
      v95 = 0;
    }
    v96 = &v95[4 * v91];
    v97 = &v95[4 * v94];
    *(_DWORD *)v96 = *((_DWORD *)this + 4);
    v89 = v96 + 4;
    while (v87 != v90)
    {
      int v98 = *((_DWORD *)v87 - 1);
      v87 -= 4;
      *((_DWORD *)v96 - 1) = v98;
      v96 -= 4;
    }
    *((void *)this + 8) = v96;
    *((void *)this + 9) = v89;
    *((void *)this + 10) = v97;
    if (v90) {
      operator delete(v90);
    }
    int v14 = v88;
  }
  else
  {
    *(_DWORD *)uint64_t v87 = *((_DWORD *)this + 4);
    v89 = v87 + 4;
  }
  v100 = (char **)((char *)this + 104);
  v99 = (char *)*((void *)this + 13);
  *((void *)this + 9) = v89;
  v101 = (char *)this + 88;
  v102 = (int *)*((void *)this + 12);
  if (v102 < (int *)v99)
  {
    int *v102 = v15;
    v103 = (char *)(v102 + 1);
    goto LABEL_163;
  }
  v104 = *(char **)v101;
  uint64_t v105 = ((uint64_t)v102 - *(void *)v101) >> 2;
  unint64_t v106 = v105 + 1;
  if ((unint64_t)(v105 + 1) >> 62) {
    goto LABEL_257;
  }
  uint64_t v107 = v99 - v104;
  if (v107 >> 1 > v106) {
    unint64_t v106 = v107 >> 1;
  }
  if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v108 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v108 = v106;
  }
  if (v108)
  {
    v109 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 104, v108);
    v104 = (char *)*((void *)this + 11);
    v102 = (int *)*((void *)this + 12);
  }
  else
  {
    v109 = 0;
  }
  v110 = (int *)&v109[4 * v105];
  v99 = &v109[4 * v108];
  int *v110 = v15;
  v103 = (char *)(v110 + 1);
  while (v102 != (int *)v104)
  {
    int v111 = *--v102;
    *--v110 = v111;
  }
  *((void *)this + 11) = v110;
  *((void *)this + 12) = v103;
  *((void *)this + 13) = v99;
  if (v104)
  {
    operator delete(v104);
    v99 = *v100;
  }
  int v14 = v88;
LABEL_163:
  *((void *)this + 12) = v103;
  if (v103 < v99)
  {
    *(_DWORD *)v103 = v13;
    v112 = (int *)(v103 + 4);
    goto LABEL_180;
  }
  v113 = *(char **)v101;
  uint64_t v114 = (uint64_t)&v103[-*(void *)v101] >> 2;
  unint64_t v115 = v114 + 1;
  if ((unint64_t)(v114 + 1) >> 62) {
    goto LABEL_257;
  }
  uint64_t v116 = v99 - v113;
  if (v116 >> 1 > v115) {
    unint64_t v115 = v116 >> 1;
  }
  if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v117 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v117 = v115;
  }
  if (v117)
  {
    v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 104, v117);
    v113 = (char *)*((void *)this + 11);
    v103 = (char *)*((void *)this + 12);
  }
  else
  {
    v118 = 0;
  }
  v119 = &v118[4 * v114];
  v99 = &v118[4 * v117];
  *(_DWORD *)v119 = v13;
  v112 = (int *)(v119 + 4);
  while (v103 != v113)
  {
    int v120 = *((_DWORD *)v103 - 1);
    v103 -= 4;
    *((_DWORD *)v119 - 1) = v120;
    v119 -= 4;
  }
  *((void *)this + 11) = v119;
  *((void *)this + 12) = v112;
  *((void *)this + 13) = v99;
  if (v113)
  {
    operator delete(v113);
    v99 = *v100;
  }
  int v14 = v88;
LABEL_180:
  *((void *)this + 12) = v112;
  if (v112 < (int *)v99)
  {
    int *v112 = v14;
    v121 = (char *)(v112 + 1);
    goto LABEL_196;
  }
  v122 = *(char **)v101;
  uint64_t v123 = ((uint64_t)v112 - *(void *)v101) >> 2;
  unint64_t v124 = v123 + 1;
  if ((unint64_t)(v123 + 1) >> 62) {
    goto LABEL_257;
  }
  uint64_t v125 = v99 - v122;
  if (v125 >> 1 > v124) {
    unint64_t v124 = v125 >> 1;
  }
  if ((unint64_t)v125 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v126 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v126 = v124;
  }
  if (v126)
  {
    v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 104, v126);
    int v14 = v88;
    v128 = v127;
    v122 = (char *)*((void *)this + 11);
    v112 = (int *)*((void *)this + 12);
  }
  else
  {
    v128 = 0;
  }
  v129 = (int *)&v128[4 * v123];
  v99 = &v128[4 * v126];
  int *v129 = v14;
  v121 = (char *)(v129 + 1);
  while (v112 != (int *)v122)
  {
    int v130 = *--v112;
    *--v129 = v130;
  }
  *((void *)this + 11) = v129;
  *((void *)this + 12) = v121;
  *((void *)this + 13) = v99;
  if (v122)
  {
    operator delete(v122);
    v99 = *v100;
  }
LABEL_196:
  *((void *)this + 12) = v121;
  if (v121 < v99)
  {
    *(_DWORD *)v121 = v12;
    v131 = v121 + 4;
    goto LABEL_212;
  }
  v132 = *(char **)v101;
  uint64_t v133 = (uint64_t)&v121[-*(void *)v101] >> 2;
  unint64_t v134 = v133 + 1;
  if ((unint64_t)(v133 + 1) >> 62) {
LABEL_257:
  }
    std::vector<int>::__throw_length_error[abi:ne180100]();
  uint64_t v135 = v99 - v132;
  if (v135 >> 1 > v134) {
    unint64_t v134 = v135 >> 1;
  }
  if ((unint64_t)v135 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v136 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v136 = v134;
  }
  if (v136)
  {
    v137 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 104, v136);
    v132 = (char *)*((void *)this + 11);
    v121 = (char *)*((void *)this + 12);
  }
  else
  {
    v137 = 0;
  }
  v138 = &v137[4 * v133];
  v139 = &v137[4 * v136];
  *(_DWORD *)v138 = v12;
  v131 = v138 + 4;
  while (v121 != v132)
  {
    int v140 = *((_DWORD *)v121 - 1);
    v121 -= 4;
    *((_DWORD *)v138 - 1) = v140;
    v138 -= 4;
  }
  *((void *)this + 11) = v138;
  *((void *)this + 12) = v131;
  *((void *)this + 13) = v139;
  if (v132) {
    operator delete(v132);
  }
LABEL_212:
  *((void *)this + 12) = v131;
  *((void *)this + 4) = *(void *)(*((void *)this + 15) + 24);
  if (*((int *)this + 4) <= 50)
  {
    *((_DWORD *)this + 4) = 0;
  }
  else
  {
    v141 = (_DWORD *)*((void *)this + 8);
    uint64_t v142 = *((void *)this + 9);
    if ((unint64_t)(v142 - (void)v141) >= 9)
    {
      unint64_t v143 = (v142 - (uint64_t)v141) >> 2;
      int v144 = v141[1];
      if (v144 - *v141 < 51) {
        int v145 = 0;
      }
      else {
        int v145 = (*(_DWORD *)(*(void *)v101 + 28) - *(_DWORD *)(*(void *)v101 + 24))
      }
             * (*(_DWORD *)(*(void *)v101 + 20) - *(_DWORD *)(*(void *)v101 + 16));
      if (v143 <= 3) {
        unint64_t v143 = 3;
      }
      v146 = (_DWORD *)(*(void *)v101 + 44);
      LODWORD(v147) = 1;
      for (uint64_t j = 2; j != v143; ++j)
      {
        int v149 = v141[j];
        if ((*v146 - *(v146 - 1)) * (*(v146 - 2) - *(v146 - 3)) > v145 && v149 - v144 > 50)
        {
          int v145 = (*v146 - *(v146 - 1)) * (*(v146 - 2) - *(v146 - 3));
          uint64_t v147 = j;
        }
        else
        {
          uint64_t v147 = v147;
        }
        v146 += 4;
        int v144 = v149;
      }
      int v150 = 0;
      v151 = (void **)((char *)this + 40);
      unint64_t v152 = 1;
      do
      {
        if (v152 != v147)
        {
          v153 = &v141[v152];
          int v154 = *v153;
          uint64_t v155 = *(v153 - 1);
          if (v154 - (int)v155 >= 51)
          {
            if (v154 > (int)v155)
            {
              uint64_t v156 = *((void *)this + 3);
              uint64_t v157 = *((void *)this + 4);
              int v158 = 2 * v150;
              int v159 = 2 * v155;
              do
              {
                *(_DWORD *)(v157 + 4 * v158) = *(_DWORD *)(v156 + 4 * v159);
                *(_DWORD *)(v157 + 4 * (v158 + 1)) = *(_DWORD *)(v156 + 4 * (v159 + 1));
                ++v155;
                v158 += 2;
                ++v150;
                v159 += 2;
              }
              while (v155 < (int)v141[v152]);
            }
            v161 = (char *)*((void *)this + 6);
            unint64_t v160 = *((void *)this + 7);
            if ((unint64_t)v161 >= v160)
            {
              v163 = (char *)*v151;
              uint64_t v164 = (v161 - (unsigned char *)*v151) >> 2;
              unint64_t v165 = v164 + 1;
              if ((unint64_t)(v164 + 1) >> 62) {
                goto LABEL_257;
              }
              uint64_t v166 = v160 - (void)v163;
              if (v166 >> 1 > v165) {
                unint64_t v165 = v166 >> 1;
              }
              if ((unint64_t)v166 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v167 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v167 = v165;
              }
              if (v167)
              {
                v168 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)this + 56, v167);
                v163 = (char *)*((void *)this + 5);
                v161 = (char *)*((void *)this + 6);
              }
              else
              {
                v168 = 0;
              }
              v169 = &v168[4 * v164];
              *(_DWORD *)v169 = v150;
              v162 = v169 + 4;
              while (v161 != v163)
              {
                int v170 = *((_DWORD *)v161 - 1);
                v161 -= 4;
                *((_DWORD *)v169 - 1) = v170;
                v169 -= 4;
              }
              *((void *)this + 5) = v169;
              *((void *)this + 6) = v162;
              *((void *)this + 7) = &v168[4 * v167];
              if (v163) {
                operator delete(v163);
              }
            }
            else
            {
              *(_DWORD *)v161 = v150;
              v162 = v161 + 4;
            }
            *((void *)this + 6) = v162;
            v141 = (_DWORD *)*((void *)this + 8);
            uint64_t v142 = *((void *)this + 9);
          }
        }
        ++v152;
      }
      while (v152 < (v142 - (uint64_t)v141) >> 2);
      uint64_t v171 = (int)v147 - 1;
      *((_DWORD *)this + 4) = v141[(int)v147] - v141[v171];
      if (v147 != 1)
      {
        uint64_t v172 = (int)v141[v171];
        if ((int)v172 < v141[(int)v147])
        {
          uint64_t v173 = *((void *)this + 3);
          int v174 = 2 * v172;
          v175 = (_DWORD *)(v173 + 4);
          do
          {
            *(v175 - 1) = *(_DWORD *)(v173 + 4 * v174);
            _DWORD *v175 = *(_DWORD *)(v173 + 4 * (v174 + 1));
            v175 += 2;
            ++v172;
            v174 += 2;
          }
          while (v172 < (int)v141[(int)v147]);
        }
      }
    }
  }
}

void ContourProcessing::contourSmoothClose(ContourProcessing *this)
{
}

void ContourProcessing::contourExtractionProcessing(ContourProcessing *this, int *a2, int *a3)
{
  ContourProcessing::tracingContours(this);
  int v6 = *((_DWORD *)this + 4);
  if (v6 >= 21) {
    ContourProcessing::contourSmoothClose(this);
  }
  *a2 = v6;
  *a3 = *((_DWORD *)this + 28);
}

void sub_234C5C994(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ContourProcessing::computeContourEdgeLine(uint64_t a1, uint64_t a2, int a3, void **a4)
{
  int v8 = *(_DWORD *)(a2 + 4 * (2 * a3 - 2));
  int v9 = *(_DWORD *)(a2 + 4 * (2 * a3 - 1));
  std::vector<EdgeLine>::reserve(a4, 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a4[1] - (unsigned char *)*a4) >> 3) + a3);
  if (a3 >= 1)
  {
    uint64_t v10 = a1;
    uint64_t v11 = a2;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)a1 + (*(int *)(a1 + 8) - 1) * *(int *)(a1 + 12);
    int v14 = v8 << 16;
    uint64_t v37 = v13;
    uint64_t v38 = a1;
    uint64_t v39 = a2;
    do
    {
      int v15 = (int *)(v11 + 8 * v12);
      int v16 = v15[1];
      uint64_t v17 = *v15;
      if (v16 == *(_DWORD *)(v10 + 8) - 1) {
        *(unsigned char *)(v13 + v17) = -1;
      }
      if (v16 != v9)
      {
        int v18 = v17 << 16;
        if (v16 <= v9) {
          int v19 = v17 << 16;
        }
        else {
          int v19 = v14;
        }
        if (v9 <= v16) {
          int v20 = v16;
        }
        else {
          int v20 = v9;
        }
        if (v9 >= v16) {
          int v21 = v16;
        }
        else {
          int v21 = v9;
        }
        int v22 = v18 - v14;
        float v23 = (char *)a4[1];
        float v24 = (char *)a4[2];
        int v25 = v22 / (v16 - v9);
        if (v23 >= v24)
        {
          unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((v23 - (unsigned char *)*a4) >> 3);
          unint64_t v28 = v27 + 1;
          if (v27 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<int>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (unsigned char *)*a4) >> 3);
          if (2 * v29 > v28) {
            unint64_t v28 = 2 * v29;
          }
          if (v29 >= 0x555555555555555) {
            unint64_t v30 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v30 = v28;
          }
          if (v30) {
            int v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<EdgeLine>>((uint64_t)(a4 + 2), v30);
          }
          else {
            int v31 = 0;
          }
          unsigned int v32 = &v31[24 * v27];
          *(_DWORD *)unsigned int v32 = v21;
          *((_DWORD *)v32 + 1) = v20;
          *((_DWORD *)v32 + 2) = v19;
          *((_DWORD *)v32 + 3) = v25;
          *((void *)v32 + 2) = 0;
          unsigned int v34 = (char *)*a4;
          float v33 = (char *)a4[1];
          unsigned int v35 = v32;
          if (v33 != *a4)
          {
            do
            {
              long long v36 = *(_OWORD *)(v33 - 24);
              *((void *)v35 - 1) = *((void *)v33 - 1);
              *(_OWORD *)(v35 - 24) = v36;
              v35 -= 24;
              v33 -= 24;
            }
            while (v33 != v34);
            float v33 = (char *)*a4;
          }
          unint64_t v26 = v32 + 24;
          *a4 = v35;
          a4[1] = v32 + 24;
          a4[2] = &v31[24 * v30];
          if (v33) {
            operator delete(v33);
          }
          uint64_t v10 = v38;
          uint64_t v11 = v39;
          uint64_t v13 = v37;
        }
        else
        {
          *(_DWORD *)float v23 = v21;
          *((_DWORD *)v23 + 1) = v20;
          *((_DWORD *)v23 + 2) = v19;
          *((_DWORD *)v23 + 3) = v25;
          unint64_t v26 = v23 + 24;
          *((void *)v23 + 2) = 0;
        }
        a4[1] = v26;
        int v14 = v18;
        int v9 = v16;
      }
      ++v12;
    }
    while (v12 != a3);
  }
}

void ContourProcessing::fillContourEdgeLine(uint64_t a1, uint64_t *a2, int a3)
{
  long long v66 = 0uLL;
  unint64_t v67 = 0;
  int v5 = (__n128 *)a2[1];
  uint64_t v6 = *a2;
  uint64_t v7 = ((uint64_t)v5 - *a2) >> 3;
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * v7;
  if (-1431655765 * (int)v7 >= 2)
  {
    uint64_t v9 = 0;
    signed int v10 = 0x80000000;
    int v11 = 0x7FFFFFFF;
    int v12 = 0x7FFFFFFF;
    signed int v13 = 0x80000000;
    do
    {
      uint64_t v14 = v6 + v9;
      int v16 = *(_DWORD *)(v6 + v9);
      signed int v15 = *(_DWORD *)(v6 + v9 + 4);
      if (v15 <= v16) {
        ContourProcessing::fillContourEdgeLine();
      }
      v9 += 24;
      signed int v17 = *(_DWORD *)(v14 + 8);
      signed int v18 = v17 + *(_DWORD *)(v14 + 12) * (v15 - v16);
      if (v12 >= v16) {
        int v12 = v16;
      }
      if (v13 <= v15) {
        signed int v13 = v15;
      }
      if (v11 >= v17) {
        int v11 = v17;
      }
      if (v10 <= v17) {
        signed int v10 = v17;
      }
      if (v11 >= v18) {
        int v11 = v18;
      }
      if (v10 <= v18) {
        signed int v10 = v18;
      }
    }
    while (24 * v8 != v9);
    if ((v13 & 0x80000000) == 0
      && v12 < *(_DWORD *)(a1 + 8)
      && (v10 & 0x80000000) == 0
      && v11 < *(_DWORD *)(a1 + 12) << 16)
    {
      uint64_t v64 = a1;
      unint64_t v19 = 126 - 2 * __clz(v8);
      uint64_t v20 = v5 == (__n128 *)v6 ? 0 : v19;
      std::__introsort<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,false>(v6, v5, (uint64_t)&v68, v20, 1);
      LODWORD(v66) = 0x7FFFFFFF;
      unint64_t v21 = a2[2];
      unint64_t v22 = a2[1];
      if (v22 >= v21)
      {
        unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - *a2) >> 3);
        unint64_t v26 = v25 + 1;
        if (v25 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<int>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v21 - *a2) >> 3);
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x555555555555555) {
          unint64_t v28 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28) {
          unint64_t v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<EdgeLine>>((uint64_t)(a2 + 2), v28);
        }
        else {
          unint64_t v29 = 0;
        }
        unint64_t v30 = &v29[24 * v25];
        int v31 = &v29[24 * v28];
        long long v32 = v66;
        *((void *)v30 + 2) = v67;
        *(_OWORD *)unint64_t v30 = v32;
        uint64_t v24 = (uint64_t)(v30 + 24);
        unsigned int v34 = (char *)*a2;
        float v33 = (char *)a2[1];
        if (v33 != (char *)*a2)
        {
          do
          {
            long long v35 = *(_OWORD *)(v33 - 24);
            *((void *)v30 - 1) = *((void *)v33 - 1);
            *(_OWORD *)(v30 - 24) = v35;
            v30 -= 24;
            v33 -= 24;
          }
          while (v33 != v34);
          float v33 = (char *)*a2;
        }
        *a2 = (uint64_t)v30;
        a2[1] = v24;
        a2[2] = (uint64_t)v31;
        if (v33) {
          operator delete(v33);
        }
      }
      else
      {
        long long v23 = v66;
        *(void *)(v22 + 16) = v67;
        *(_OWORD *)unint64_t v22 = v23;
        uint64_t v24 = v22 + 24;
      }
      a2[1] = v24;
      unint64_t v67 = 0;
      uint64_t v36 = *a2;
      uint64_t v37 = v64;
      signed int v38 = *(_DWORD *)(v64 + 8);
      if (v13 < v38) {
        signed int v38 = v13;
      }
      int v39 = *(_DWORD *)v36;
      signed int v63 = v38;
      if (*(_DWORD *)v36 < v38)
      {
        int v40 = 0;
LABEL_44:
        int v41 = 0;
        int v42 = &v66;
        size_t v43 = v67;
        while (1)
        {
          uint64_t v44 = (uint64_t)v43;
          if (!v43) {
            break;
          }
          while (*(_DWORD *)(v44 + 4) == v39)
          {
            *((void *)v42 + 2) = *(void *)(v44 + 16);
            uint64_t v44 = *(void *)(v44 + 16);
            if (!v44) {
              goto LABEL_48;
            }
          }
          if (*(_DWORD *)v36 <= v39 && *(_DWORD *)(v44 + 8) >= *(_DWORD *)(v36 + 8))
          {
            if (v40 >= (int)v8) {
              goto LABEL_74;
            }
LABEL_54:
            *((void *)v42 + 2) = v36;
            *(void *)(v36 + 16) = v44;
            uint64_t v46 = *a2 + 24 * ++v40;
            size_t v43 = (_OWORD *)v44;
            uint64_t v44 = v36;
            if (!v41) {
              goto LABEL_72;
            }
            goto LABEL_59;
          }
          size_t v43 = *(_OWORD **)(v44 + 16);
          uint64_t v46 = v36;
          if (!v41) {
            goto LABEL_72;
          }
LABEL_59:
          if ((v39 & 0x80000000) == 0)
          {
            int v47 = *((_DWORD *)v42 + 2);
            unsigned int v48 = *(_DWORD *)(v44 + 8);
            if (v47 >= (int)v48) {
              int v49 = *(_DWORD *)(v44 + 8);
            }
            else {
              int v49 = *((_DWORD *)v42 + 2);
            }
            if (v47 > (int)v48) {
              unsigned int v48 = *((_DWORD *)v42 + 2);
            }
            if ((v48 & 0x80000000) == 0)
            {
              int v50 = *(_DWORD *)(v37 + 12);
              int v51 = (v49 + 0xFFFF) >> 16;
              if (v51 < v50)
              {
                int v52 = HIWORD(v48);
                unsigned int v53 = v51 & ~(v51 >> 31);
                int v54 = v50 - 1;
                if (v52 < v50) {
                  int v54 = v52;
                }
                BOOL v55 = __OFSUB__(v54, v53);
                uint64_t v56 = v54 - v53;
                if ((int)v56 < 0 == v55)
                {
                  memset((void *)(*(void *)v37 + v50 * v39 + (unint64_t)v53), a3, v56 + 1);
                  uint64_t v37 = v64;
                }
              }
            }
          }
          *((_DWORD *)v42 + 2) += *((_DWORD *)v42 + 3);
          *(_DWORD *)(v44 + 8) += *(_DWORD *)(v44 + 12);
LABEL_72:
          v41 ^= 1u;
          uint64_t v36 = v46;
          int v42 = (long long *)v44;
        }
LABEL_48:
        if (*(_DWORD *)v36 == v39 && v40 < (int)v8)
        {
          uint64_t v44 = 0;
          goto LABEL_54;
        }
LABEL_74:
        unint64_t v57 = 0;
        int v58 = 0;
        size_t v59 = v67;
        while (1)
        {
          if (v59 == v57)
          {
            int v61 = &v66;
LABEL_84:
            if (!v58)
            {
LABEL_89:
              if (++v39 == v63) {
                return;
              }
              goto LABEL_44;
            }
          }
          else
          {
            size_t v60 = &v66;
            while (1)
            {
              int v61 = (long long *)*((void *)v59 + 2);
              if (!v61) {
                break;
              }
              if (*((_DWORD *)v59 + 2) <= *((_DWORD *)v61 + 2))
              {
                size_t v62 = (long long *)*((void *)v59 + 2);
                int v61 = v59;
                size_t v59 = v62;
              }
              else
              {
                *((void *)v60 + 2) = v61;
                *((void *)v59 + 2) = *((void *)v61 + 2);
                *((void *)v61 + 2) = v59;
                int v58 = 1;
                size_t v62 = v59;
              }
              size_t v60 = v61;
              if (v62 == v57) {
                goto LABEL_84;
              }
            }
            int v61 = v60;
            if (!v58) {
              goto LABEL_89;
            }
          }
          if (v61 != &v66)
          {
            size_t v59 = v67;
            int v58 = 1;
            unint64_t v57 = v61;
            if (v61 != v67) {
              continue;
            }
          }
          goto LABEL_89;
        }
      }
    }
  }
}

uint64_t ContourProcessing::isHole(ContourProcessing *this, int *a2, int a3)
{
  if (a3 >= 1)
  {
    char v3 = 0;
    uint64_t v4 = a3;
    for (unsigned int i = a2 + 1; ; i += 2)
    {
      int v6 = *i;
      if (*(unsigned __int8 *)(*(void *)this + *(i - 1) + *((int *)this + 3) * (uint64_t)*i) != 255) {
        break;
      }
      v3 |= v6 < *((_DWORD *)this + 28) + 90;
      if (!--v4) {
        return v3 & 1;
      }
    }
  }
  char v3 = 0;
  return v3 & 1;
}

void std::vector<EdgeLine>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 24;
    int v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<EdgeLine>>(v3, a2);
    uint64_t v7 = &v6[24 * v5];
    uint64_t v9 = &v6[24 * v8];
    int v11 = (char *)*a1;
    signed int v10 = (char *)a1[1];
    int v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      signed int v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<int>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264C09608, MEMORY[0x263F8C060]);
}

void sub_234C5D208(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<EdgeLine>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::__introsort<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,false>(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  int v11 = (long long *)a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v11) >> 3);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          unint64_t v30 = (long long *)&a2[-2].n128_i8[8];
          signed __int32 v31 = a2[-2].n128_i32[2];
          BOOL v32 = v31 < *(_DWORD *)v11;
          if (v31 == *(_DWORD *)v11)
          {
            signed __int32 v33 = a2[-1].n128_i32[0];
            signed __int32 v34 = *((_DWORD *)v11 + 2);
            BOOL v32 = v33 < v34;
            if (v33 == v34) {
              BOOL v32 = (signed __int32)a2[-1].n128_u32[1] < *((_DWORD *)v11 + 3);
            }
          }
          if (v32)
          {
            unint64_t v39 = *((void *)v11 + 2);
            long long v37 = *v11;
            long long v35 = *v30;
            *((void *)v11 + 2) = a2[-1].n128_u64[1];
            *int v11 = v35;
            *unint64_t v30 = v37;
            a2[-1].n128_u64[1] = v39;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(v11, (int *)v11 + 6, (long long *)&a2[-2].n128_i8[8]);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)v11, (uint64_t)v11 + 24, (uint64_t)(v11 + 3), (uint64_t)&a2[-2].n128_i64[1]);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)v11, (uint64_t)v11 + 24, (uint64_t)(v11 + 3), (uint64_t)v11 + 72, (uint64_t)&a2[-2].n128_i64[1]);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 575) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != (long long *)a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,EdgeLine *>((__n128 *)v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    signed int v17 = (int *)v11 + 6 * (v15 >> 1);
    if ((unint64_t)v14 >= 0xC01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(v11, (int *)v11 + 6 * (v15 >> 1), (long long *)&a2[-2].n128_i8[8]);
      uint64_t v18 = 3 * v16;
      unint64_t v19 = (int *)v11 + 6 * v16 - 6;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((long long *)((char *)v11 + 24), v19, (long long *)&a2[-3]);
      uint64_t v20 = v11 + 3;
      unint64_t v21 = (int *)v11 + 2 * v18 + 6;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(v20, v21, (long long *)&a2[-5].n128_i8[8]);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((long long *)v19, v17, (long long *)v21);
      uint64_t v38 = *(void *)(a1 + 16);
      long long v36 = *(_OWORD *)a1;
      long long v22 = *(_OWORD *)v17;
      *(void *)(a1 + 16) = *((void *)v17 + 2);
      *(_OWORD *)a1 = v22;
      *((void *)v17 + 2) = v38;
      *(_OWORD *)signed int v17 = v36;
      if (a5) {
        goto LABEL_17;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((long long *)((char *)v11 + 24 * (v15 >> 1)), (int *)v11, (long long *)&a2[-2].n128_i8[8]);
      if (a5) {
        goto LABEL_17;
      }
    }
    int v23 = *(_DWORD *)(a1 - 24);
    BOOL v24 = v23 < *(_DWORD *)a1;
    if (v23 == *(_DWORD *)a1)
    {
      int v25 = *(_DWORD *)(a1 - 16);
      int v26 = *(_DWORD *)(a1 + 8);
      BOOL v24 = v25 < v26;
      if (v25 == v26) {
        BOOL v24 = *(_DWORD *)(a1 - 12) < *(_DWORD *)(a1 + 12);
      }
    }
    if (!v24)
    {
      int v11 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,EdgeLine *,cmpEdgeLine &>((uint64_t *)a1, (long long *)a2);
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
LABEL_17:
    unint64_t v27 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,EdgeLine *,cmpEdgeLine &>((uint64_t *)a1, (unint64_t)a2);
    if ((v28 & 1) == 0) {
      goto LABEL_20;
    }
    BOOL v29 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, v27);
    int v11 = (long long *)(v27 + 24);
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(v27 + 24, (uint64_t)a2))
    {
      a4 = -v13;
      a2 = (__n128 *)v27;
      if (v29) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v29)
    {
LABEL_20:
      std::__introsort<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,false>(a1, v27, a3, -v13, a5 & 1);
      int v11 = (long long *)(v27 + 24);
      goto LABEL_21;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)v11, (uint64_t)a2);
  }
  else
  {
    std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)v11, (uint64_t)a2);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 24;
    if (result + 24 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      do
      {
        uint64_t v5 = v4;
        uint64_t v4 = v2;
        int v6 = *(_DWORD *)(v5 + 24);
        if (v6 == *(_DWORD *)v5)
        {
          int v7 = *(_DWORD *)(v5 + 32);
          int v8 = *(_DWORD *)(v5 + 8);
          BOOL v9 = v7 < v8;
          if (v7 == v8) {
            BOOL v9 = *(_DWORD *)(v5 + 36) < *(_DWORD *)(v5 + 12);
          }
          if (v9) {
            goto LABEL_11;
          }
        }
        else if (v6 < *(_DWORD *)v5)
        {
          int v7 = *(_DWORD *)(v5 + 32);
LABEL_11:
          int v10 = *(_DWORD *)(v5 + 28);
          int v11 = *(_DWORD *)(v5 + 36);
          uint64_t v12 = *(void *)(v5 + 40);
          *(_OWORD *)uint64_t v4 = *(_OWORD *)v5;
          *(void *)(v4 + 16) = *(void *)(v5 + 16);
          uint64_t v13 = result;
          if (v5 != result)
          {
            uint64_t v14 = v3;
            do
            {
              uint64_t v15 = result + v14;
              int v16 = *(_DWORD *)(result + v14 - 24);
              BOOL v17 = v6 < v16;
              if (v6 == v16 && (v18 = *(_DWORD *)(v15 - 16), BOOL v17 = v7 < v18, v7 == v18))
              {
                uint64_t v13 = result + v14;
                if (v11 >= *(_DWORD *)(result + v14 - 12)) {
                  goto LABEL_21;
                }
              }
              else if (!v17)
              {
                uint64_t v13 = v5;
                goto LABEL_21;
              }
              v5 -= 24;
              *(_OWORD *)uint64_t v15 = *(_OWORD *)(result + v14 - 24);
              *(void *)(v15 + 16) = *(void *)(result + v14 - 8);
              v14 -= 24;
            }
            while (v14);
            uint64_t v13 = result;
          }
LABEL_21:
          *(_DWORD *)uint64_t v13 = v6;
          *(_DWORD *)(v13 + 4) = v10;
          *(_DWORD *)(v13 + 8) = v7;
          *(_DWORD *)(v13 + 12) = v11;
          *(void *)(v13 + 16) = v12;
        }
        uint64_t v2 = v4 + 24;
        v3 += 24;
      }
      while (v4 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    while (1)
    {
      while (1)
      {
        if (result + 24 == a2) {
          return result;
        }
        uint64_t v2 = result;
        result += 24;
        int v3 = *(_DWORD *)(v2 + 24);
        if (v3 != *(_DWORD *)v2) {
          break;
        }
        int v4 = *(_DWORD *)(v2 + 32);
        int v5 = *(_DWORD *)(v2 + 8);
        BOOL v6 = v4 < v5;
        if (v4 == v5) {
          BOOL v6 = *(_DWORD *)(v2 + 36) < *(_DWORD *)(v2 + 12);
        }
        if (v6)
        {
LABEL_11:
          int v7 = *(_DWORD *)(v2 + 28);
          int v8 = *(_DWORD *)(v2 + 36);
          uint64_t v9 = *(void *)(v2 + 40);
          do
          {
            uint64_t v10 = v2;
            *(_OWORD *)(v2 + 24) = *(_OWORD *)v2;
            *(void *)(v2 + 40) = *(void *)(v2 + 16);
            int v11 = *(_DWORD *)(v2 - 24);
            v2 -= 24;
            BOOL v12 = v3 < v11;
            if (v3 == v11)
            {
              int v13 = *(_DWORD *)(v10 - 16);
              BOOL v12 = v4 < v13;
              if (v4 == v13) {
                BOOL v12 = v8 < *(_DWORD *)(v10 - 12);
              }
            }
          }
          while (v12);
          *(_DWORD *)uint64_t v10 = v3;
          *(_DWORD *)(v10 + 4) = v7;
          *(_DWORD *)(v10 + 8) = v4;
          *(_DWORD *)(v10 + 12) = v8;
          *(void *)(v10 + 16) = v9;
        }
      }
      if (v3 < *(_DWORD *)v2)
      {
        int v4 = *(_DWORD *)(v2 + 32);
        goto LABEL_11;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(long long *a1, int *a2, long long *a3)
{
  int v3 = *a2;
  BOOL v4 = *a2 < *(_DWORD *)a1;
  if (*a2 == *(_DWORD *)a1)
  {
    int v5 = a2[2];
    int v6 = *((_DWORD *)a1 + 2);
    BOOL v4 = v5 < v6;
    if (v5 == v6) {
      BOOL v4 = a2[3] < *((_DWORD *)a1 + 3);
    }
  }
  if (!v4)
  {
    BOOL v13 = *(_DWORD *)a3 < v3;
    if (*(_DWORD *)a3 == v3)
    {
      int v14 = *((_DWORD *)a3 + 2);
      int v15 = a2[2];
      BOOL v13 = v14 < v15;
      if (v14 == v15) {
        BOOL v13 = *((_DWORD *)a3 + 3) < a2[3];
      }
    }
    if (!v13) {
      return 0;
    }
    uint64_t v16 = *((void *)a2 + 2);
    long long v17 = *(_OWORD *)a2;
    uint64_t v18 = *((void *)a3 + 2);
    *(_OWORD *)a2 = *a3;
    *((void *)a2 + 2) = v18;
    *a3 = v17;
    *((void *)a3 + 2) = v16;
    BOOL v19 = *a2 < *(_DWORD *)a1;
    if (*a2 == *(_DWORD *)a1)
    {
      int v20 = a2[2];
      int v21 = *((_DWORD *)a1 + 2);
      BOOL v19 = v20 < v21;
      if (v20 == v21) {
        BOOL v19 = a2[3] < *((_DWORD *)a1 + 3);
      }
    }
    if (!v19) {
      return 1;
    }
    uint64_t v22 = *((void *)a1 + 2);
    long long v23 = *a1;
    uint64_t v24 = *((void *)a2 + 2);
    *a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = v24;
    *(_OWORD *)a2 = v23;
    *((void *)a2 + 2) = v22;
    return 2;
  }
  BOOL v7 = *(_DWORD *)a3 < v3;
  if (*(_DWORD *)a3 == v3)
  {
    int v8 = *((_DWORD *)a3 + 2);
    int v9 = a2[2];
    BOOL v7 = v8 < v9;
    if (v8 == v9) {
      BOOL v7 = *((_DWORD *)a3 + 3) < a2[3];
    }
  }
  if (v7)
  {
    uint64_t v10 = *((void *)a1 + 2);
    long long v11 = *a1;
    uint64_t v12 = *((void *)a3 + 2);
    *a1 = *a3;
    *((void *)a1 + 2) = v12;
    *a3 = v11;
    *((void *)a3 + 2) = v10;
  }
  else
  {
    uint64_t v25 = *((void *)a1 + 2);
    long long v26 = *a1;
    uint64_t v27 = *((void *)a2 + 2);
    *a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = v27;
    *(_OWORD *)a2 = v26;
    *((void *)a2 + 2) = v25;
    BOOL v28 = *(_DWORD *)a3 < *a2;
    if (*(_DWORD *)a3 == *a2)
    {
      int v29 = *((_DWORD *)a3 + 2);
      int v30 = a2[2];
      BOOL v28 = v29 < v30;
      if (v29 == v30) {
        BOOL v28 = *((_DWORD *)a3 + 3) < a2[3];
      }
    }
    if (v28)
    {
      uint64_t v31 = *((void *)a2 + 2);
      long long v32 = *(_OWORD *)a2;
      uint64_t v33 = *((void *)a3 + 2);
      *(_OWORD *)a2 = *a3;
      *((void *)a2 + 2) = v33;
      *a3 = v32;
      *((void *)a3 + 2) = v31;
      return 2;
    }
  }
  return 1;
}

long long *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,EdgeLine *,cmpEdgeLine &>(uint64_t *a1, long long *i)
{
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 2);
  int v4 = *((_DWORD *)a1 + 3);
  int v5 = *((_DWORD *)i - 6);
  int v6 = *a1;
  BOOL v7 = v6 < v5;
  if (v6 == v5)
  {
    int v8 = *((_DWORD *)i - 4);
    BOOL v7 = v3 < v8;
    if (v3 == v8) {
      BOOL v7 = v4 < *((_DWORD *)i - 3);
    }
  }
  int v9 = (long long *)(a1 + 3);
  if (v7)
  {
    while (1)
    {
      BOOL v10 = v6 < *(_DWORD *)v9;
      if (v6 == *(_DWORD *)v9)
      {
        int v11 = *((_DWORD *)v9 + 2);
        BOOL v10 = v3 < v11;
        if (v3 == v11) {
          BOOL v10 = v4 < *((_DWORD *)v9 + 3);
        }
      }
      if (v10) {
        break;
      }
      int v9 = (long long *)((char *)v9 + 24);
    }
  }
  else
  {
    while (v9 < i)
    {
      BOOL v12 = v6 < *(_DWORD *)v9;
      if (v6 == *(_DWORD *)v9)
      {
        int v13 = *((_DWORD *)v9 + 2);
        BOOL v12 = v3 < v13;
        if (v3 == v13) {
          BOOL v12 = v4 < *((_DWORD *)v9 + 3);
        }
      }
      if (v12) {
        break;
      }
      int v9 = (long long *)((char *)v9 + 24);
    }
  }
  if (v9 < i)
  {
    for (unsigned int i = (long long *)((char *)i - 24); ; unsigned int i = (long long *)((char *)i - 24))
    {
      BOOL v14 = v6 < v5;
      if (v6 == v5)
      {
        int v15 = *((_DWORD *)i + 2);
        BOOL v14 = v3 < v15;
        if (v3 == v15) {
          BOOL v14 = v4 < *((_DWORD *)i + 3);
        }
      }
      if (!v14) {
        break;
      }
      int v16 = *((_DWORD *)i - 6);
      int v5 = v16;
    }
  }
  uint64_t v17 = a1[2];
  while (v9 < i)
  {
    uint64_t v28 = *((void *)v9 + 2);
    long long v27 = *v9;
    long long v18 = *i;
    *((void *)v9 + 2) = *((void *)i + 2);
    *int v9 = v18;
    *((void *)i + 2) = v28;
    *unsigned int i = v27;
    do
    {
      int v19 = *((_DWORD *)v9 + 6);
      int v9 = (long long *)((char *)v9 + 24);
      BOOL v20 = v6 < v19;
      if (v6 == v19)
      {
        int v21 = *((_DWORD *)v9 + 2);
        BOOL v20 = v3 < v21;
        if (v3 == v21) {
          BOOL v20 = v4 < *((_DWORD *)v9 + 3);
        }
      }
    }
    while (!v20);
    do
    {
      int v22 = *((_DWORD *)i - 6);
      unsigned int i = (long long *)((char *)i - 24);
      BOOL v23 = v6 < v22;
      if (v6 == v22)
      {
        int v24 = *((_DWORD *)i + 2);
        BOOL v23 = v3 < v24;
        if (v3 == v24) {
          BOOL v23 = v4 < *((_DWORD *)i + 3);
        }
      }
    }
    while (v23);
  }
  if ((uint64_t *)((char *)v9 - 24) != a1)
  {
    long long v25 = *(long long *)((char *)v9 - 24);
    a1[2] = *((void *)v9 - 1);
    *(_OWORD *)a1 = v25;
  }
  *((void *)v9 - 3) = v2;
  *((_DWORD *)v9 - 4) = v3;
  *((_DWORD *)v9 - 3) = v4;
  *((void *)v9 - 1) = v17;
  return v9;
}

unint64_t std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,EdgeLine *,cmpEdgeLine &>(uint64_t *a1, unint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = *a1;
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *((_DWORD *)a1 + 3);
  uint64_t v6 = a1[2];
  int v7 = *a1;
  while (1)
  {
    int v8 = a1[v2 + 3];
    BOOL v9 = v8 < v7;
    if (v8 == v7)
    {
      int v10 = a1[v2 + 4];
      BOOL v9 = v10 < v4;
      if (v10 == v4) {
        BOOL v9 = SHIDWORD(a1[v2 + 4]) < v5;
      }
    }
    if (!v9) {
      break;
    }
    v2 += 3;
  }
  unint64_t v11 = (unint64_t)&a1[v2 + 3];
  if (v2 * 8)
  {
    do
    {
      int v12 = *(_DWORD *)(a2 - 24);
      a2 -= 24;
      BOOL v13 = v12 < v7;
      if (v12 == v7)
      {
        int v14 = *(_DWORD *)(a2 + 8);
        BOOL v13 = v14 < v4;
        if (v14 == v4) {
          BOOL v13 = *(_DWORD *)(a2 + 12) < v5;
        }
      }
    }
    while (!v13);
  }
  else if (v11 < a2)
  {
    do
    {
      int v15 = *(_DWORD *)(a2 - 24);
      a2 -= 24;
      BOOL v16 = v15 < v7;
      if (v15 == v7)
      {
        int v17 = *(_DWORD *)(a2 + 8);
        BOOL v16 = v17 < v4;
        if (v17 == v4) {
          BOOL v16 = *(_DWORD *)(a2 + 12) < v5;
        }
      }
    }
    while (!v16 && v11 < a2);
  }
  unint64_t v19 = v11;
  if (v11 < a2)
  {
    unint64_t v20 = a2;
    do
    {
      uint64_t v31 = *(void *)(v19 + 16);
      long long v30 = *(_OWORD *)v19;
      long long v21 = *(_OWORD *)v20;
      *(void *)(v19 + 16) = *(void *)(v20 + 16);
      *(_OWORD *)unint64_t v19 = v21;
      *(void *)(v20 + 16) = v31;
      *(_OWORD *)unint64_t v20 = v30;
      do
      {
        int v22 = *(_DWORD *)(v19 + 24);
        v19 += 24;
        BOOL v23 = v22 < v7;
        if (v22 == v7)
        {
          int v24 = *(_DWORD *)(v19 + 8);
          BOOL v23 = v24 < v4;
          if (v24 == v4) {
            BOOL v23 = *(_DWORD *)(v19 + 12) < v5;
          }
        }
      }
      while (v23);
      do
      {
        int v25 = *(_DWORD *)(v20 - 24);
        v20 -= 24;
        BOOL v26 = v25 < v7;
        if (v25 == v7)
        {
          int v27 = *(_DWORD *)(v20 + 8);
          BOOL v26 = v27 < v4;
          if (v27 == v4) {
            BOOL v26 = *(_DWORD *)(v20 + 12) < v5;
          }
        }
      }
      while (!v26);
    }
    while (v19 < v20);
  }
  if ((uint64_t *)(v19 - 24) != a1)
  {
    long long v28 = *(_OWORD *)(v19 - 24);
    a1[2] = *(void *)(v19 - 8);
    *(_OWORD *)a1 = v28;
  }
  *(void *)(v19 - 24) = v3;
  *(_DWORD *)(v19 - 16) = v4;
  *(_DWORD *)(v19 - 12) = v5;
  *(void *)(v19 - 8) = v6;
  return v19 - 24;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v6 = (_OWORD *)(a2 - 24);
      int v7 = *(_DWORD *)(a2 - 24);
      BOOL v8 = v7 < *(_DWORD *)a1;
      if (v7 == *(_DWORD *)a1)
      {
        int v9 = *(_DWORD *)(a2 - 16);
        int v10 = *(_DWORD *)(a1 + 8);
        BOOL v8 = v9 < v10;
        if (v9 == v10) {
          BOOL v8 = *(_DWORD *)(a2 - 12) < *(_DWORD *)(a1 + 12);
        }
      }
      if (v8)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        long long v12 = *(_OWORD *)a1;
        uint64_t v13 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(void *)(a1 + 16) = v13;
        *uint64_t v6 = v12;
        *(void *)(a2 - 8) = v11;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((long long *)a1, (int *)(a1 + 24), (long long *)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, a1 + 24, a1 + 48, a2 - 24);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, a1 + 24, a1 + 48, a1 + 72, a2 - 24);
      return 1;
    default:
      uint64_t v14 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((long long *)a1, (int *)(a1 + 24), (long long *)(a1 + 48));
      uint64_t v15 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v16 = 0;
      int v17 = 0;
      break;
  }
  while (1)
  {
    int v18 = *(_DWORD *)v15;
    if (*(_DWORD *)v15 != *(_DWORD *)v14) {
      break;
    }
    int v19 = *(_DWORD *)(v15 + 8);
    int v20 = *(_DWORD *)(v14 + 8);
    if (v19 == v20)
    {
      if (*(_DWORD *)(v15 + 12) < *(_DWORD *)(v14 + 12)) {
        goto LABEL_17;
      }
    }
    else if (v19 < v20)
    {
      goto LABEL_17;
    }
LABEL_28:
    uint64_t v14 = v15;
    v16 += 24;
    v15 += 24;
    if (v15 == a2) {
      return 1;
    }
  }
  if (v18 >= *(_DWORD *)v14) {
    goto LABEL_28;
  }
  int v19 = *(_DWORD *)(v15 + 8);
LABEL_17:
  int v21 = *(_DWORD *)(v15 + 4);
  int v22 = *(_DWORD *)(v15 + 12);
  uint64_t v23 = *(void *)(v15 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v14;
  *(void *)(v15 + 16) = *(void *)(v14 + 16);
  uint64_t v24 = a1;
  if (v14 != a1)
  {
    uint64_t v25 = v16;
    do
    {
      int v26 = *(_DWORD *)(a1 + v25 + 24);
      BOOL v27 = v18 < v26;
      if (v18 == v26 && (v28 = *(_DWORD *)(a1 + v25 + 32), BOOL v27 = v19 < v28, v19 == v28))
      {
        if (v22 >= *(_DWORD *)(a1 + v25 + 36))
        {
          uint64_t v24 = a1 + v25 + 48;
          goto LABEL_27;
        }
      }
      else if (!v27)
      {
        uint64_t v24 = v14;
        goto LABEL_27;
      }
      v14 -= 24;
      *(_OWORD *)(a1 + v25 + 48) = *(_OWORD *)(a1 + v25 + 24);
      *(void *)(a1 + v25 + 64) = *(void *)(a1 + v25 + 40);
      v25 -= 24;
    }
    while (v25 != -48);
    uint64_t v24 = a1;
  }
LABEL_27:
  *(_DWORD *)uint64_t v24 = v18;
  *(_DWORD *)(v24 + 4) = v21;
  *(_DWORD *)(v24 + 8) = v19;
  *(_DWORD *)(v24 + 12) = v22;
  ++v17;
  *(void *)(v24 + 16) = v23;
  if (v17 != 8) {
    goto LABEL_28;
  }
  return v15 + 24 == a2;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((long long *)a1, (int *)a2, (long long *)a3);
  BOOL v9 = *(_DWORD *)a4 < *(_DWORD *)a3;
  if (*(_DWORD *)a4 == *(_DWORD *)a3)
  {
    int v10 = *(_DWORD *)(a4 + 8);
    int v11 = *(_DWORD *)(a3 + 8);
    BOOL v9 = v10 < v11;
    if (v10 == v11) {
      BOOL v9 = *(_DWORD *)(a4 + 12) < *(_DWORD *)(a3 + 12);
    }
  }
  if (v9)
  {
    uint64_t v12 = *(void *)(a3 + 16);
    __n128 result = *(__n128 *)a3;
    uint64_t v13 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v13;
    *(__n128 *)a4 = result;
    *(void *)(a4 + 16) = v12;
    BOOL v14 = *(_DWORD *)a3 < *(_DWORD *)a2;
    if (*(_DWORD *)a3 == *(_DWORD *)a2)
    {
      int v15 = *(_DWORD *)(a3 + 8);
      int v16 = *(_DWORD *)(a2 + 8);
      BOOL v14 = v15 < v16;
      if (v15 == v16) {
        BOOL v14 = *(_DWORD *)(a3 + 12) < *(_DWORD *)(a2 + 12);
      }
    }
    if (v14)
    {
      uint64_t v17 = *(void *)(a2 + 16);
      __n128 result = *(__n128 *)a2;
      uint64_t v18 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v18;
      *(__n128 *)a3 = result;
      *(void *)(a3 + 16) = v17;
      BOOL v19 = *(_DWORD *)a2 < *(_DWORD *)a1;
      if (*(_DWORD *)a2 == *(_DWORD *)a1)
      {
        int v20 = *(_DWORD *)(a2 + 8);
        int v21 = *(_DWORD *)(a1 + 8);
        BOOL v19 = v20 < v21;
        if (v20 == v21) {
          BOOL v19 = *(_DWORD *)(a2 + 12) < *(_DWORD *)(a1 + 12);
        }
      }
      if (v19)
      {
        uint64_t v22 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v23 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v23;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v22;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, a2, a3, a4).n128_u64[0];
  BOOL v11 = *(_DWORD *)a5 < *(_DWORD *)a4;
  if (*(_DWORD *)a5 == *(_DWORD *)a4)
  {
    int v12 = *(_DWORD *)(a5 + 8);
    int v13 = *(_DWORD *)(a4 + 8);
    BOOL v11 = v12 < v13;
    if (v12 == v13) {
      BOOL v11 = *(_DWORD *)(a5 + 12) < *(_DWORD *)(a4 + 12);
    }
  }
  if (v11)
  {
    uint64_t v14 = *(void *)(a4 + 16);
    __n128 result = *(__n128 *)a4;
    uint64_t v15 = *(void *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(void *)(a4 + 16) = v15;
    *(__n128 *)a5 = result;
    *(void *)(a5 + 16) = v14;
    BOOL v16 = *(_DWORD *)a4 < *(_DWORD *)a3;
    if (*(_DWORD *)a4 == *(_DWORD *)a3)
    {
      int v17 = *(_DWORD *)(a4 + 8);
      int v18 = *(_DWORD *)(a3 + 8);
      BOOL v16 = v17 < v18;
      if (v17 == v18) {
        BOOL v16 = *(_DWORD *)(a4 + 12) < *(_DWORD *)(a3 + 12);
      }
    }
    if (v16)
    {
      uint64_t v19 = *(void *)(a3 + 16);
      __n128 result = *(__n128 *)a3;
      uint64_t v20 = *(void *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(void *)(a3 + 16) = v20;
      *(__n128 *)a4 = result;
      *(void *)(a4 + 16) = v19;
      BOOL v21 = *(_DWORD *)a3 < *(_DWORD *)a2;
      if (*(_DWORD *)a3 == *(_DWORD *)a2)
      {
        int v22 = *(_DWORD *)(a3 + 8);
        int v23 = *(_DWORD *)(a2 + 8);
        BOOL v21 = v22 < v23;
        if (v22 == v23) {
          BOOL v21 = *(_DWORD *)(a3 + 12) < *(_DWORD *)(a2 + 12);
        }
      }
      if (v21)
      {
        uint64_t v24 = *(void *)(a2 + 16);
        __n128 result = *(__n128 *)a2;
        uint64_t v25 = *(void *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(void *)(a2 + 16) = v25;
        *(__n128 *)a3 = result;
        *(void *)(a3 + 16) = v24;
        BOOL v26 = *(_DWORD *)a2 < *(_DWORD *)a1;
        if (*(_DWORD *)a2 == *(_DWORD *)a1)
        {
          int v27 = *(_DWORD *)(a2 + 8);
          int v28 = *(_DWORD *)(a1 + 8);
          BOOL v26 = v27 < v28;
          if (v27 == v28) {
            BOOL v26 = *(_DWORD *)(a2 + 12) < *(_DWORD *)(a1 + 12);
          }
        }
        if (v26)
        {
          uint64_t v29 = *(void *)(a1 + 16);
          __n128 result = *(__n128 *)a1;
          uint64_t v30 = *(void *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(void *)(a1 + 16) = v30;
          *(__n128 *)a2 = result;
          *(void *)(a2 + 16) = v29;
        }
      }
    }
  }
  return result;
}

__n128 *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *,EdgeLine *>(__n128 *a1, __n128 *a2, __n128 *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      int v12 = (int *)a1 + 6 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)a1, a4, v9, v12);
        v12 -= 6;
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      uint64_t v14 = a2;
      do
      {
        BOOL v15 = (signed __int32)v14->n128_u32[0] < (signed __int32)a1->n128_u32[0];
        if (v14->n128_u32[0] == a1->n128_u32[0])
        {
          signed __int32 v16 = v14->n128_i32[2];
          signed __int32 v17 = a1->n128_i32[2];
          BOOL v15 = v16 < v17;
          if (v16 == v17) {
            BOOL v15 = (signed __int32)v14->n128_u32[3] < (signed __int32)a1->n128_u32[3];
          }
        }
        if (v15)
        {
          unint64_t v18 = v14[1].n128_u64[0];
          __n128 v19 = *v14;
          unint64_t v20 = a1[1].n128_u64[0];
          __n128 *v14 = *a1;
          v14[1].n128_u64[0] = v20;
          *a1 = v19;
          a1[1].n128_u64[0] = v18;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)a1, a4, v9, (int *)a1);
        }
        uint64_t v14 = (__n128 *)((char *)v14 + 24);
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 25)
    {
      int64_t v21 = v8 / 0x18uLL;
      int v22 = (__n128 *)((char *)a2 - 24);
      do
      {
        __n128 v26 = *a1;
        unint64_t v27 = a1[1].n128_u64[0];
        std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(a1, a4, v21);
        if (v22 == v23)
        {
          *int v23 = v26;
          v23[1].n128_u64[0] = v27;
        }
        else
        {
          __n128 v24 = *v22;
          v23[1].n128_u64[0] = v22[1].n128_u64[0];
          *int v23 = v24;
          __n128 *v22 = v26;
          v22[1].n128_u64[0] = v27;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>((uint64_t)a1, (uint64_t)&v23[1].n128_i64[1], a4, 0xAAAAAAAAAAAAAAABLL * ((&v23[1].n128_i8[8] - (__int8 *)a1) >> 3));
        }
        int v22 = (__n128 *)((char *)v22 - 24);
        BOOL v15 = v21-- <= 2;
      }
      while (!v15);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  if (a3 < 2) {
    return result;
  }
  int64_t v4 = (unint64_t)(a3 - 2) >> 1;
  if (v4 < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - result) >> 3))) {
    return result;
  }
  uint64_t v5 = (0x5555555555555556 * (((uint64_t)a4 - result) >> 3)) | 1;
  uint64_t v6 = (long long *)(result + 24 * v5);
  if (0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2 < a3)
  {
    int v7 = *((_DWORD *)v6 + 6);
    BOOL v8 = *(_DWORD *)v6 < v7;
    if (*(_DWORD *)v6 == v7)
    {
      int v9 = *(_DWORD *)(result + 24 * v5 + 8);
      int v10 = *((_DWORD *)v6 + 8);
      BOOL v8 = v9 < v10;
      if (v9 == v10) {
        BOOL v8 = *(_DWORD *)(result + 24 * v5 + 12) < *((_DWORD *)v6 + 9);
      }
    }
    if (v8)
    {
      uint64_t v6 = (long long *)((char *)v6 + 24);
      uint64_t v5 = 0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2;
    }
  }
  int v11 = *a4;
  if (*(_DWORD *)v6 == *a4)
  {
    int v12 = *((_DWORD *)v6 + 2);
    int v13 = a4[2];
    BOOL v14 = v12 < v13;
    if (v12 == v13)
    {
      int v13 = *((_DWORD *)v6 + 2);
      BOOL v14 = *((_DWORD *)v6 + 3) < a4[3];
    }
    if (v14) {
      return result;
    }
  }
  else
  {
    if (*(_DWORD *)v6 < v11) {
      return result;
    }
    int v13 = a4[2];
  }
  int v15 = a4[1];
  int v16 = a4[3];
  uint64_t v17 = *((void *)a4 + 2);
  uint64_t v18 = *((void *)v6 + 2);
  *(_OWORD *)a4 = *v6;
  *((void *)a4 + 2) = v18;
  if (v4 >= v5)
  {
    while (1)
    {
      __n128 v19 = v6;
      uint64_t v20 = 2 * v5;
      uint64_t v5 = (2 * v5) | 1;
      uint64_t v6 = (long long *)(result + 24 * v5);
      uint64_t v21 = v20 + 2;
      if (v21 < a3)
      {
        int v22 = *((_DWORD *)v6 + 6);
        BOOL v23 = *(_DWORD *)v6 < v22;
        if (*(_DWORD *)v6 == v22)
        {
          int v24 = *(_DWORD *)(result + 24 * v5 + 8);
          int v25 = *((_DWORD *)v6 + 8);
          BOOL v23 = v24 < v25;
          if (v24 == v25) {
            BOOL v23 = *(_DWORD *)(result + 24 * v5 + 12) < *((_DWORD *)v6 + 9);
          }
        }
        if (v23)
        {
          uint64_t v6 = (long long *)((char *)v6 + 24);
          uint64_t v5 = v21;
        }
      }
      BOOL v26 = *(_DWORD *)v6 < v11;
      if (*(_DWORD *)v6 == v11)
      {
        int v27 = *((_DWORD *)v6 + 2);
        BOOL v26 = v27 < v13;
        if (v27 == v13) {
          BOOL v26 = *((_DWORD *)v6 + 3) < v16;
        }
      }
      if (v26) {
        break;
      }
      long long v28 = *v6;
      *((void *)v19 + 2) = *((void *)v6 + 2);
      long long *v19 = v28;
      if (v4 < v5) {
        goto LABEL_33;
      }
    }
    uint64_t v6 = v19;
  }
LABEL_33:
  *(_DWORD *)uint64_t v6 = v11;
  *((_DWORD *)v6 + 1) = v15;
  *((_DWORD *)v6 + 2) = v13;
  *((_DWORD *)v6 + 3) = v16;
  *((void *)v6 + 2) = v17;
  return result;
}

__n128 std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(__n128 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = a1;
    uint64_t v7 = v3 + 1;
    a1 = (__n128 *)((char *)a1 + 24 * v3 + 24);
    uint64_t v8 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v9 = v8 + 2;
    if (v9 < a3)
    {
      signed __int32 v10 = a1[1].n128_i32[2];
      BOOL v11 = (signed __int32)a1->n128_u32[0] < v10;
      if (a1->n128_u32[0] == v10)
      {
        signed __int32 v12 = v6->n128_i32[6 * v7 + 2];
        signed __int32 v13 = a1[2].n128_i32[0];
        BOOL v11 = v12 < v13;
        if (v12 == v13) {
          BOOL v11 = (signed __int32)v6->n128_u32[6 * v7 + 3] < (signed __int32)a1[2].n128_u32[1];
        }
      }
      if (v11)
      {
        a1 = (__n128 *)((char *)a1 + 24);
        uint64_t v3 = v9;
      }
    }
    __n128 result = *a1;
    v6[1].n128_u64[0] = a1[1].n128_u64[0];
    *uint64_t v6 = result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,cmpEdgeLine &,EdgeLine *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 < 2) {
    return result;
  }
  unint64_t v5 = v4 >> 1;
  uint64_t v6 = (long long *)(result + 24 * (v4 >> 1));
  int v7 = *(_DWORD *)(a2 - 24);
  if (*(_DWORD *)v6 == v7)
  {
    int v8 = *(_DWORD *)(result + 24 * v5 + 8);
    int v9 = *(_DWORD *)(a2 - 16);
    BOOL v10 = v8 < v9;
    if (v8 == v9)
    {
      int v9 = *(_DWORD *)(result + 24 * v5 + 8);
      BOOL v10 = *(_DWORD *)(result + 24 * v5 + 12) < *(_DWORD *)(a2 - 12);
    }
    if (!v10) {
      return result;
    }
  }
  else
  {
    if (*(_DWORD *)v6 >= v7) {
      return result;
    }
    int v9 = *(_DWORD *)(a2 - 16);
  }
  int v11 = *(_DWORD *)(a2 - 20);
  int v12 = *(_DWORD *)(a2 - 12);
  uint64_t v13 = *(void *)(a2 - 8);
  uint64_t v14 = *((void *)v6 + 2);
  *(_OWORD *)(a2 - 24) = *v6;
  *(void *)(a2 - 8) = v14;
  if (v4 >= 2)
  {
    while (1)
    {
      unint64_t v16 = v5 - 1;
      unint64_t v5 = (v5 - 1) >> 1;
      int v15 = (long long *)(result + 24 * v5);
      BOOL v17 = *(_DWORD *)v15 < v7;
      if (*(_DWORD *)v15 == v7)
      {
        int v18 = *(_DWORD *)(result + 24 * v5 + 8);
        BOOL v17 = v18 < v9;
        if (v18 == v9) {
          BOOL v17 = *(_DWORD *)(result + 24 * v5 + 12) < v12;
        }
      }
      if (!v17) {
        break;
      }
      long long v19 = *v15;
      *((void *)v6 + 2) = *((void *)v15 + 2);
      *uint64_t v6 = v19;
      uint64_t v6 = (long long *)(result + 24 * v5);
      if (v16 <= 1) {
        goto LABEL_17;
      }
    }
  }
  int v15 = v6;
LABEL_17:
  *(_DWORD *)int v15 = v7;
  *((_DWORD *)v15 + 1) = v11;
  *((_DWORD *)v15 + 2) = v9;
  *((_DWORD *)v15 + 3) = v12;
  *((void *)v15 + 2) = v13;
  return result;
}

void sub_234C60EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_234C615E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C61734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C61958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C61AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C61C54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_234C61D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C61F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C63400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C63A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_234C63BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C63FBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_234C645B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C65478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C65A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C66104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_234C67F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C680FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C68244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C69178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C69A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AVTMorphTargetNameDefinesPose(void *a1)
{
  id v1 = a1;
  if (([v1 containsString:@"__"] & 1) != 0
    || ([v1 containsString:@"_0_"] & 1) != 0
    || ([v1 hasSuffix:@"_backward"] & 1) != 0
    || ([v1 hasSuffix:@"_forward"] & 1) != 0
    || ([v1 hasSuffix:@"_rightward"] & 1) != 0
    || ([v1 hasSuffix:@"_leftward"] & 1) != 0
    || ([v1 hasSuffix:@"_downward"] & 1) != 0
    || ([v1 hasSuffix:@"_upward"] & 1) != 0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [v1 hasPrefix:@"variant_"] ^ 1;
  }

  return v2;
}

void sub_234C6CAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_234C6CD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C6D21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234C6DD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_234C6E07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C6E69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromUIDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"UIDeviceOrientationUnknown";
  }
  else {
    return off_264C0A9E8[a1 - 1];
  }
}

__CFString *NSStringFromUIInterfaceOrientation(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_264C0AA18[a1];
  }
}

__CFString *NSStringFromJFXTrackingType(uint64_t a1)
{
  id v1 = @"None";
  if (a1 == 1) {
    id v1 = @"3D";
  }
  if (a1 == 2) {
    return @"Billboard";
  }
  else {
    return v1;
  }
}

id AXDurationStringForDuration(double a1)
{
  if (AXDurationStringForDuration_onceToken != -1) {
    dispatch_once(&AXDurationStringForDuration_onceToken, &__block_literal_global_10);
  }
  double v2 = 0.0;
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000) {
    double v2 = a1;
  }
  uint64_t v3 = [(id)AXDurationStringForDuration_formatter stringFromTimeInterval:v2];
  return v3;
}

uint64_t __AXDurationStringForDuration_block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)AXDurationStringForDuration_formatter;
  AXDurationStringForDuration_formatter = v0;

  [(id)AXDurationStringForDuration_formatter setZeroFormattingBehavior:1];
  [(id)AXDurationStringForDuration_formatter setUnitsStyle:4];
  double v2 = (void *)AXDurationStringForDuration_formatter;
  return [v2 setAllowedUnits:224];
}

void sub_234C7727C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

id jfx_drawInRect(void *a1, int a2, double a3, double a4, double a5, double a6, float a7)
{
  id v13 = a1;
  uint64_t v14 = [MEMORY[0x263F1C688] defaultFormat];
  [v14 setOpaque:0];
  [v14 setScale:a7];
  if (!a2)
  {
LABEL_8:
    [v14 setPreferredRange:2];
    goto LABEL_10;
  }
  if ([v14 preferredRange] != 1) {
    goto LABEL_10;
  }
  id v15 = v13;
  unint64_t v16 = v15;
  if (v15
    && (id v17 = v15,
        (CGColorSpaceRef ColorSpace = CGImageGetColorSpace((CGImageRef)[v17 CGImage])) != 0))
  {
    if (jfx_isSRGB_onceToken != -1)
    {
      int v24 = ColorSpace;
      dispatch_once(&jfx_isSRGB_onceToken, &__block_literal_global_12);
      CGColorSpaceRef ColorSpace = v24;
    }
    int v19 = CFEqual(ColorSpace, (CFTypeRef)jfx_isSRGB_s_sRGB);

    if (v19) {
      goto LABEL_8;
    }
  }
  else
  {
  }
LABEL_10:
  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithBounds:format:", v14, a3, a4, a5, a6);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __jfx_drawInRect_block_invoke;
  v25[3] = &unk_264C0AB60;
  id v26 = v13;
  double v27 = a3;
  double v28 = a4;
  double v29 = a5;
  double v30 = a6;
  id v21 = v13;
  int v22 = [v20 imageWithActions:v25];

  return v22;
}

uint64_t __jfx_drawInRect_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

CGColorSpaceRef __jfx_isSRGB_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  jfx_isSRGB_s_sRGB = (uint64_t)result;
  return result;
}

void sub_234C788C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C78A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_234C78BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C790E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C792C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C79470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C79F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_234C7A1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFStringRef CMTimeCopyDescriptionWithScale(CMTime *a1, int32_t a2)
{
  CMTime v7 = *a1;
  CMTimeConvertScale(&time, &v7, a2, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  *(_OWORD *)&a1->value = *(_OWORD *)&time.value;
  CMTimeEpoch epoch = time.epoch;
  unint64_t v4 = (const __CFAllocator **)MEMORY[0x263EFFB08];
  a1->CMTimeEpoch epoch = time.epoch;
  CFAllocatorRef v5 = *v4;
  *(_OWORD *)&time.value = *(_OWORD *)&a1->value;
  time.CMTimeEpoch epoch = epoch;
  return CMTimeCopyDescription(v5, &time);
}

CFStringRef CMTimeRangeCopyDescriptionWithScale(_OWORD *a1, int32_t a2)
{
  long long v3 = a1[1];
  v8[0] = *a1;
  v8[1] = v3;
  v8[2] = a1[2];
  CMTimeRangeConvertScale((uint64_t)v8, a2, kCMTimeRoundingMethod_RoundHalfAwayFromZero, (uint64_t)&range);
  long long v4 = *(_OWORD *)&range.start.epoch;
  *a1 = *(_OWORD *)&range.start.value;
  a1[1] = v4;
  a1[2] = *(_OWORD *)&range.duration.timescale;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  long long v6 = a1[1];
  *(_OWORD *)&range.start.value = *a1;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v6;
  *(_OWORD *)&range.duration.timescale = a1[2];
  return CMTimeRangeCopyDescription(v5, &range);
}

__n128 CMTimeRangeConvertScale@<Q0>(uint64_t a1@<X0>, int32_t a2@<W1>, CMTimeRoundingMethod a3@<W2>, uint64_t a4@<X8>)
{
  CMTime v10 = *(CMTime *)a1;
  CMTimeConvertScale(&v11, &v10, a2, a3);
  *(CMTime *)a1 = v11;
  CMTime v10 = *(CMTime *)(a1 + 24);
  CMTimeConvertScale(&v11, &v10, a2, a3);
  *(CMTime *)(a1 + 24) = v11;
  long long v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v8;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a4 + 32) = result;
  return result;
}

__n128 CMTimeGetDistanceToRange@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  long long v6 = (__n128 *)MEMORY[0x263F010E0];
  CMTime v17 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&range.start.value = *(_OWORD *)a2;
  *(_OWORD *)&range.start.CMTimeEpoch epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
  CMTime time = *(CMTime *)a1;
  if (!CMTimeRangeContainsTime(&range, &time))
  {
    if ((*(unsigned char *)(a1 + 12) & 1) != 0
      && (*(unsigned char *)(a2 + 12) & 1) != 0
      && (*(unsigned char *)(a2 + 36) & 1) != 0
      && !*(void *)(a2 + 40)
      && (*(void *)(a2 + 24) & 0x8000000000000000) == 0)
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)a1;
      range.start.CMTimeEpoch epoch = *(void *)(a1 + 16);
      CMTime time = *(CMTime *)a2;
      if (CMTimeCompare(&range.start, &time) < 0)
      {
        *(_OWORD *)&range.start.value = *(_OWORD *)a2;
        range.start.CMTimeEpoch epoch = *(void *)(a2 + 16);
        CMTime time = *(CMTime *)a1;
        long long v6 = (__n128 *)&v17;
        p_CMTimeRange range = &range;
        p_CMTime time = (CMTimeRange *)&time;
      }
      else
      {
        long long v9 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)&range.start.value = *(_OWORD *)a2;
        *(_OWORD *)&range.start.CMTimeEpoch epoch = v9;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
        CMTimeRangeGetEnd(&time2, &range);
        *(_OWORD *)&range.start.value = *(_OWORD *)a1;
        range.start.CMTimeEpoch epoch = *(void *)(a1 + 16);
        if (CMTimeCompare(&range.start, &time2) < 1)
        {
          long long v6 = (__n128 *)&v17;
          goto LABEL_7;
        }
        long long v10 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)&range.start.value = *(_OWORD *)a2;
        *(_OWORD *)&range.start.CMTimeEpoch epoch = v10;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
        CMTimeRangeGetEnd(&v13, &range);
        *(_OWORD *)&range.start.value = *(_OWORD *)a1;
        range.start.CMTimeEpoch epoch = *(void *)(a1 + 16);
        long long v6 = (__n128 *)&v17;
        p_CMTimeRange range = (CMTimeRange *)&v13;
        p_CMTime time = &range;
      }
      CMTimeSubtract(&v17, &p_range->start, &p_time->start);
    }
    else
    {
      long long v6 = (__n128 *)MEMORY[0x263F010B8];
    }
  }
LABEL_7:
  __n128 result = *v6;
  *a3 = *v6;
  a3[1].n128_u64[0] = v6[1].n128_u64[0];
  return result;
}

Float64 DurationSecondsFromFrameTime(int a1, int32_t a2)
{
  memset(&v4, 0, sizeof(v4));
  CMTimeMake(&v4, a1, a2);
  CMTime v3 = v4;
  return CMTimeGetSeconds(&v3);
}

CMTime *DurationCMTimeFromFrameTime@<X0>(int a1@<W0>, int32_t a2@<W1>, CMTime *a3@<X8>)
{
  return CMTimeMake(a3, a1, a2);
}

Float64 SecondsFromFrameTime(int a1, int32_t a2)
{
  memset(&v4, 0, sizeof(v4));
  CMTimeMake(&v4, a1, a2);
  CMTime v3 = v4;
  return CMTimeGetSeconds(&v3);
}

CMTime *CMTimeFromFrameTime@<X0>(int a1@<W0>, int32_t a2@<W1>, CMTime *a3@<X8>)
{
  return CMTimeMake(a3, a1, a2);
}

uint64_t FrameTimeFromCMTime(void *a1, int32_t a2)
{
  if (!*a1) {
    return 0;
  }
  memset(&v4, 0, sizeof(v4));
  CMTime v3 = *(CMTime *)a1;
  CMTimeConvertScale(&v4, &v3, a2, kCMTimeRoundingMethod_RoundTowardZero);
  return LODWORD(v4.value);
}

unsigned int FrameTimeFromSeconds(int a1, double a2)
{
  return llround((double)a1 * a2);
}

unsigned int FrameTimeIntegerFloorFromSeconds(int a1, double a2)
{
  return vcvtmd_s64_f64((double)a1 * a2);
}

double CMTimeRangeForStartAndDuration@<D0>(int32_t timescale@<W2>, int a2@<W0>, int a3@<W1>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  CMTimeMake(&v8, a2, timescale);
  *(CMTime *)a4 = v8;
  CMTimeMake(&v8, a3, timescale);
  double result = *(double *)&v8.value;
  *(CMTime *)(a4 + 24) = v8;
  return result;
}

id JFXNSStringForCMTime(CMTime *a1)
{
  uint64_t timescale = a1->timescale;
  CMTime time = *a1;
  double v2 = objc_msgSend(NSString, "stringWithFormat:", @"{%lld/%d = %.3f}", time.value, timescale, CMTimeGetSeconds(&time));
  return v2;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

double CGRectGetCenterPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double CGRectMakeWithSizeAndCenterPoint(double a1, double a2, double a3)
{
  return a3 - a1 * 0.5;
}

double CGRectMakeWithSize()
{
  return 0.0;
}

double CGRectMakeSquareWithSize()
{
  return 0.0;
}

double CGRectMakeSquareWithSizeAndCenterPoint(double a1, double a2)
{
  return a2 - a1 * 0.5;
}

double CGRectFillRectToAspectInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a3 <= a4)
  {
    float v8 = a4 / a8;
    if (a7 * v8 < a3)
    {
      double v9 = a3 / a7;
      goto LABEL_6;
    }
  }
  else
  {
    float v8 = a3 / a7;
    if (a8 * v8 < a4)
    {
      double v9 = a4 / a8;
LABEL_6:
      float v8 = v9;
    }
  }
  return a1 + floor((a3 - a7 * v8) * 0.5);
}

double CGRectForInnerSizeCenteredInOuterSize(double a1, double a2, double a3)
{
  return (a3 - a1) * 0.5;
}

BOOL CGRectCouldContainRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  double Width = CGRectGetWidth(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  if (Width > CGRectGetWidth(v20)) {
    return 0;
  }
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  double Height = CGRectGetHeight(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  return Height <= CGRectGetHeight(v22);
}

double CGRectCenterOverRectHorizontally(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + (a7 - a3) * 0.5;
}

double CGRectCenterOverRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + (a7 - a3) * 0.5;
}

double CGRectCenterRectAtNormalizedPointInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 + a7 * a9 - a3 * 0.5;
}

CGFloat CGRectMoveToKeepCenterWithinRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v23.size.height = a8;
  double MinX = CGRectGetMinX(v23);
  v24.origin.x = a5;
  v24.origin.y = a6;
  v24.size.width = a7;
  v24.size.height = a8;
  double MaxX = CGRectGetMaxX(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  CGFloat v16 = a4;
  double MidX = CGRectGetMidX(v25);
  v26.origin.x = a5;
  v26.origin.y = a6;
  v26.size.width = a7;
  v26.size.height = a8;
  CGRectGetMinY(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetMaxY(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = v16;
  CGRectGetMidY(v28);
  if (MidX >= MinX)
  {
    double v18 = *MEMORY[0x263F00148];
    if (MidX > MaxX) {
      double v18 = MaxX - MidX;
    }
  }
  else
  {
    double v18 = MinX - MidX;
  }
  return a1 + v18;
}

double CGRectScaleAndCenter(int a1, double result, double a3, double a4, double a5, double a6)
{
  double v7 = a4 * a6;
  if (a1) {
    return result + (a4 - v7) * 0.5;
  }
  return result;
}

CGFloat CGRectStraighten(double *a1, double *a2)
{
  double v4 = *a1;
  double v5 = a1[1];
  double v6 = atan2(a1[3] - v5, a1[2] - *a1);
  double v7 = v6;
  if (a2)
  {
    *a2 = v6;
    double v4 = *a1;
    double v5 = a1[1];
  }
  double v8 = a1[4];
  double v9 = a1[5];
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&t1, -(v4 + (v8 - v4) * 0.5), -(v5 + (v9 - v5) * 0.5));
  CGAffineTransformMakeRotation(&t2, -v7);
  CGAffineTransformConcat(&v14, &t1, &t2);
  CGAffineTransformMakeTranslation(&v11, v4 + (v8 - v4) * 0.5, v5 + (v9 - v5) * 0.5);
  CGAffineTransformConcat(&v15, &v14, &v11);
  return v15.tx + v5 * v15.c + v15.a * v4;
}

double CGRectRotate(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v24[0] = a2;
  v24[1] = a3;
  double v25 = a2 + a4;
  CGFloat v26 = a3;
  double v27 = a2 + a4;
  double v28 = a3 + a5;
  double v29 = a2;
  double v30 = a3 + a5;
  double MidX = CGRectGetMidX(*(CGRect *)&a2);
  v32.origin.x = a2;
  v32.origin.y = a3;
  v32.size.width = a4;
  v32.size.height = a5;
  double MidY = CGRectGetMidY(v32);
  memset(&v23, 0, sizeof(v23));
  CGAffineTransformMakeTranslation(&t1, -MidX, -MidY);
  CGAffineTransformMakeRotation(&t2, a6);
  CGAffineTransformConcat(&v22, &t1, &t2);
  CGAffineTransformMakeTranslation(&v19, MidX, MidY);
  CGAffineTransformConcat(&v23, &v22, &v19);
  uint64_t v14 = 0;
  float64x2_t v15 = *(float64x2_t *)&v23.a;
  float64x2_t v16 = *(float64x2_t *)&v23.c;
  float64x2_t v17 = *(float64x2_t *)&v23.tx;
  do
  {
    *(float64x2_t *)&v24[v14] = vaddq_f64(v17, vmlaq_n_f64(vmulq_n_f64(v16, v24[v14 + 1]), v15, v24[v14]));
    *(_OWORD *)(a1 + v14 * 8) = *(_OWORD *)&v24[v14];
    v14 += 2;
  }
  while (v14 != 8);
  return fmin(v24[0], fmin(v25, fmin(v27, v29)));
}

double CGRectArea(double a1, double a2, double a3, double a4)
{
  return a3 * a4;
}

CGFloat CGRectAreaOfIntersection(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v9 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return v9.size.width * v9.size.height;
}

CGFloat CGRectPercentOfRectThatIntersectsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v11 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return v11.size.width * v11.size.height / (a3 * a4);
}

double CGRectInsetWithInsets(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t CGPointHasNan()
{
  return 0;
}

BOOL CGRectHasNan()
{
  return CGSizeHasNan() != 0;
}

void sub_234C831A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

id JFXEffectClassForType(int a1)
{
  if (a1 == 1 || a1 == 7 || a1 == 2)
  {
    double v2 = objc_opt_class();
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

os_signpost_id_t JFXSignpostIDFromObject(void *a1)
{
  id v1 = a1;
  double v2 = JFXPlaybackIntervalSignpostCategory();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, v1);

  return v3;
}

id JFXPlaybackIntervalSignpostCategory()
{
  if (JFXIsPlaybackSignpostsEnabled_onceToken != -1) {
    dispatch_once(&JFXIsPlaybackSignpostsEnabled_onceToken, &__block_literal_global_19);
  }
  if (JFXIsPlaybackSignpostsEnabled_s_enableSignposts)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __JFXSignPostIntervalCategory_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = &JFXPlaybackIntervalSignpostCategory_s_Category;
    v2[5] = "playback-interval";
    if (JFXPlaybackIntervalSignpostCategory_onceToken != -1) {
      dispatch_once(&JFXPlaybackIntervalSignpostCategory_onceToken, v2);
    }
  }
  else
  {
    objc_storeStrong((id *)&JFXPlaybackIntervalSignpostCategory_s_Category, MEMORY[0x263EF8440]);
  }
  id v0 = (id)JFXPlaybackIntervalSignpostCategory_s_Category;
  return v0;
}

uint64_t JFXIsPlaybackSignpostsEnabled()
{
  if (JFXIsPlaybackSignpostsEnabled_onceToken != -1) {
    dispatch_once(&JFXIsPlaybackSignpostsEnabled_onceToken, &__block_literal_global_19);
  }
  return JFXIsPlaybackSignpostsEnabled_s_enableSignposts;
}

void __JFXIsPlaybackSignpostsEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  JFXIsPlaybackSignpostsEnabled_s_enableSignposts = [v0 jfxBoolForKey:@"JFXEnablePlaybackSignposts" defaultValue:1];
}

id JFXPlaybackEventSignpostPointCategory()
{
  if (JFXIsPlaybackSignpostsEnabled_onceToken != -1) {
    dispatch_once(&JFXIsPlaybackSignpostsEnabled_onceToken, &__block_literal_global_19);
  }
  if (JFXIsPlaybackSignpostsEnabled_s_enableSignposts)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __JFXSignPostIntervalCategory_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = &JFXPlaybackEventSignpostPointCategory_s_Category;
    v2[5] = "PointsOfInterest";
    if (JFXPlaybackEventSignpostPointCategory_onceToken != -1) {
      dispatch_once(&JFXPlaybackEventSignpostPointCategory_onceToken, v2);
    }
  }
  else
  {
    objc_storeStrong((id *)&JFXPlaybackEventSignpostPointCategory_s_Category, MEMORY[0x263EF8440]);
  }
  id v0 = (id)JFXPlaybackEventSignpostPointCategory_s_Category;
  return v0;
}

uint64_t JFXIsMediaDataReaderSignpostsEnabled()
{
  if (JFXIsMediaDataReaderSignpostsEnabled_onceToken != -1) {
    dispatch_once(&JFXIsMediaDataReaderSignpostsEnabled_onceToken, &__block_literal_global_5);
  }
  return JFXIsMediaDataReaderSignpostsEnabled_s_enableSignposts;
}

void __JFXIsMediaDataReaderSignpostsEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  JFXIsMediaDataReaderSignpostsEnabled_s_enableSignposts = [v0 jfxBoolForKey:@"JFXEnableMediaDataReaderSignposts" defaultValue:1];
}

id JFXMediaDataReaderEventSignpostPointCategory()
{
  if (JFXIsMediaDataReaderSignpostsEnabled_onceToken != -1) {
    dispatch_once(&JFXIsMediaDataReaderSignpostsEnabled_onceToken, &__block_literal_global_5);
  }
  if (JFXIsMediaDataReaderSignpostsEnabled_s_enableSignposts)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __JFXSignPostIntervalCategory_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = &JFXMediaDataReaderEventSignpostPointCategory_s_Category;
    v2[5] = "PointsOfInterest";
    if (JFXMediaDataReaderEventSignpostPointCategory_onceToken != -1) {
      dispatch_once(&JFXMediaDataReaderEventSignpostPointCategory_onceToken, v2);
    }
  }
  else
  {
    objc_storeStrong((id *)&JFXMediaDataReaderEventSignpostPointCategory_s_Category, MEMORY[0x263EF8440]);
  }
  id v0 = (id)JFXMediaDataReaderEventSignpostPointCategory_s_Category;
  return v0;
}

id JFXMediaDataReaderIntervalSignpostCategory()
{
  if (JFXIsMediaDataReaderSignpostsEnabled_onceToken != -1) {
    dispatch_once(&JFXIsMediaDataReaderSignpostsEnabled_onceToken, &__block_literal_global_5);
  }
  if (JFXIsMediaDataReaderSignpostsEnabled_s_enableSignposts)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __JFXSignPostIntervalCategory_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = &JFXMediaDataReaderIntervalSignpostCategory_s_Category;
    v2[5] = "mediaDataReader-interval";
    if (JFXMediaDataReaderIntervalSignpostCategory_onceToken != -1) {
      dispatch_once(&JFXMediaDataReaderIntervalSignpostCategory_onceToken, v2);
    }
  }
  else
  {
    objc_storeStrong((id *)&JFXMediaDataReaderIntervalSignpostCategory_s_Category, MEMORY[0x263EF8440]);
  }
  id v0 = (id)JFXMediaDataReaderIntervalSignpostCategory_s_Category;
  return v0;
}

uint64_t JFXIsVideoWriterSignpostsEnabled()
{
  if (JFXIsVideoWriterSignpostsEnabled_onceToken != -1) {
    dispatch_once(&JFXIsVideoWriterSignpostsEnabled_onceToken, &__block_literal_global_12_0);
  }
  return JFXIsVideoWriterSignpostsEnabled_s_enableSignposts;
}

void __JFXIsVideoWriterSignpostsEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  JFXIsVideoWriterSignpostsEnabled_s_enableSignposts = [v0 jfxBoolForKey:@"JFXEnableVideoWriterSignposts" defaultValue:1];
}

id JFXVideoWriterEventSignpostPointCategory()
{
  if (JFXIsVideoWriterSignpostsEnabled_onceToken != -1) {
    dispatch_once(&JFXIsVideoWriterSignpostsEnabled_onceToken, &__block_literal_global_12_0);
  }
  if (JFXIsVideoWriterSignpostsEnabled_s_enableSignposts)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __JFXSignPostIntervalCategory_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = &JFXVideoWriterEventSignpostPointCategory_s_Category;
    v2[5] = "PointsOfInterest";
    if (JFXVideoWriterEventSignpostPointCategory_onceToken != -1) {
      dispatch_once(&JFXVideoWriterEventSignpostPointCategory_onceToken, v2);
    }
  }
  else
  {
    objc_storeStrong((id *)&JFXVideoWriterEventSignpostPointCategory_s_Category, MEMORY[0x263EF8440]);
  }
  id v0 = (id)JFXVideoWriterEventSignpostPointCategory_s_Category;
  return v0;
}

id JFXVideoWriterIntervalSignpostCategory()
{
  if (JFXIsVideoWriterSignpostsEnabled_onceToken != -1) {
    dispatch_once(&JFXIsVideoWriterSignpostsEnabled_onceToken, &__block_literal_global_12_0);
  }
  if (JFXIsVideoWriterSignpostsEnabled_s_enableSignposts)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __JFXSignPostIntervalCategory_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = &JFXVideoWriterIntervalSignpostCategory_s_Category;
    v2[5] = "videoWriter-interval";
    if (JFXVideoWriterIntervalSignpostCategory_onceToken != -1) {
      dispatch_once(&JFXVideoWriterIntervalSignpostCategory_onceToken, v2);
    }
  }
  else
  {
    objc_storeStrong((id *)&JFXVideoWriterIntervalSignpostCategory_s_Category, MEMORY[0x263EF8440]);
  }
  id v0 = (id)JFXVideoWriterIntervalSignpostCategory_s_Category;
  return v0;
}

uint64_t __JFXSignPostIntervalCategory_block_invoke(uint64_t a1)
{
  **(void **)(a1 + 32) = os_log_create("com.apple.CameraEffectsKit", *(const char **)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

id CFXLog_action()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &CFXLog_action_logObj;
  v2[5] = "action";
  if (CFXLog_action_onceToken != -1) {
    dispatch_once(&CFXLog_action_onceToken, v2);
  }
  id v0 = (void *)CFXLog_action_logObj;
  return v0;
}

id CFXLog_DebugEffectEditorRenderer()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &CFXLog_DebugEffectEditorRenderer_logObj;
  v2[5] = "DebugEffectEditorRenderer";
  if (CFXLog_DebugEffectEditorRenderer_onceToken != -1) {
    dispatch_once(&CFXLog_DebugEffectEditorRenderer_onceToken, v2);
  }
  id v0 = (void *)CFXLog_DebugEffectEditorRenderer_logObj;
  return v0;
}

id CFXLog_DebugEffectEditingUI()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &CFXLog_DebugEffectEditingUI_logObj;
  v2[5] = "DebugEffectEditingUI";
  if (CFXLog_DebugEffectEditingUI_onceToken != -1) {
    dispatch_once(&CFXLog_DebugEffectEditingUI_onceToken, v2);
  }
  id v0 = (void *)CFXLog_DebugEffectEditingUI_logObj;
  return v0;
}

id CFXLog_DebugFeedback()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &CFXLog_DebugFeedback_logObj;
  v2[5] = "DebugFeedback";
  if (CFXLog_DebugFeedback_onceToken != -1) {
    dispatch_once(&CFXLog_DebugFeedback_onceToken, v2);
  }
  id v0 = (void *)CFXLog_DebugFeedback_logObj;
  return v0;
}

id CFXLog_DebugReview()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &CFXLog_DebugReview_logObj;
  v2[5] = "DebugReview";
  if (CFXLog_DebugReview_onceToken != -1) {
    dispatch_once(&CFXLog_DebugReview_onceToken, v2);
  }
  id v0 = (void *)CFXLog_DebugReview_logObj;
  return v0;
}

void VTDecompressionOutputCallbackImpl(void *a1, void *a2, int a3, unsigned int a4, __CVBuffer *a5, CMTime *a6, CMTime *a7)
{
  CGRect v9 = a1;
  if (a5)
  {
    [v9 setImageBuffer:CVPixelBufferRetain(a5)];
  }
  else
  {
    CGRect v10 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      VTDecompressionOutputCallbackImpl(a3, v10);
    }
  }
  CGRect v11 = [v9 frameSemaphore];
  dispatch_semaphore_signal(v11);
}

void sub_234C8A978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234C8AA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234C8AB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234C8AC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234C8ACB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)JFXVideoDecoderInterface;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

double CGSizeFitToAspectInSize(double a1, double a2, double a3, double a4)
{
  float v4 = a1 / a3;
  double v5 = v4;
  if (a4 * v5 > a2)
  {
    float v6 = a2 / a4;
    double v5 = v6;
  }
  return floor(a3 * v5);
}

BOOL CGSizeCouldContainSize(double a1, double a2, double a3, double a4)
{
  return a4 <= a2 && a3 <= a1;
}

double CGSizeFillSizeToAspectInSize(double a1, double a2, double a3, double a4)
{
  if (a1 <= a2)
  {
    float v4 = a2 / a4;
    if (a3 * v4 < a1)
    {
      double v5 = a1 / a3;
      goto LABEL_6;
    }
  }
  else
  {
    float v4 = a1 / a3;
    if (a4 * v4 < a2)
    {
      double v5 = a2 / a4;
LABEL_6:
      float v4 = v5;
    }
  }
  return floor(a3 * v4);
}

void CGSizeFillingTargetSizeLimitedToMaxSize(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v6 = CGSizeFillSizeToAspectInSize(a2, a3, a4, a5);
  if (a1)
  {
    *(double *)a1 = v6;
    *(void *)(a1 + 8) = v7;
  }
}

void CGSizeFillSizeToAspectInSizeLimitedToProVideoMaxSize(uint64_t a1, double a2, double a3, double a4, double a5)
{
}

double CGSizeIntegral(double a1)
{
  return ceil(a1);
}

void CGSizeAngleAndDistance(double *a1, double *a2, double a3, double a4)
{
  if (a3 == 0.0)
  {
    double v7 = 4.71238898;
    if (a4 >= 0.0) {
      double v7 = 0.0;
    }
    if (a4 > 0.0) {
      double v7 = 1.57079633;
    }
    double v8 = fabs(a4);
    if (a1) {
LABEL_7:
    }
      *a1 = v7;
  }
  else
  {
    double v7 = atan(a4 / a3);
    if ((a3 >= 0.0 || a4 <= 0.0) && (a3 >= 0.0 || a4 >= 0.0))
    {
      if (a4 < 0.0 && a3 > 0.0) {
        double v7 = v7 + 6.28318531;
      }
    }
    else
    {
      double v7 = v7 + 3.14159265;
    }
    double v8 = fabs(a3);
    double v11 = sqrt(a3 * a3 + a4 * a4);
    if (a4 != 0.0) {
      double v8 = v11;
    }
    if (a1) {
      goto LABEL_7;
    }
  }
  if (a2) {
    *a2 = v8;
  }
}

double CGSizeApplyAffineTransformWithPositiveResult(float64x2_t *a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2));
  return result;
}

double CGSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGSizeScaleBy(double a1, double a2, double a3)
{
  return a1 * a3;
}

double CGSizeRotate90(double a1, double a2)
{
  return a2;
}

BOOL CGSizeIsSquare(double a1, double a2)
{
  return a1 == a2;
}

uint64_t CGSizeHasNan()
{
  return 0;
}

void VTCompressionOutputCallbackImpl(void *a1, void *a2, int a3, unsigned int a4, opaqueCMSampleBuffer *a5)
{
  double v7 = a1;
  double v8 = v7;
  if (a5)
  {
    [v7 writeSampleBuffer:a5];
  }
  else
  {
    CGRect v9 = JFXLog_depthCodec();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      VTCompressionOutputCallbackImpl(a3, v9);
    }

    [v8 skipFrame];
  }
}

void sub_234C8FBC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234C8FC64(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  MEMORY[0x237DD0F30](v3, 0x1020C40322220F4);

  _Unwind_Resume(a1);
}

void sub_234C8FF78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (!atomic_fetch_add(v14 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(atomic_ullong *))(*v14 + 16))(v14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::future<opaqueCMSampleBuffer *>::get(std::__assoc_sub_state **a1)
{
  id v1 = *a1;
  *a1 = 0;
  std::__assoc_state<opaqueCMSampleBuffer *>::move(v1);
  uint64_t v3 = v2;
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    ((void (*)(std::__assoc_sub_state *))v1->__on_zero_shared)(v1);
  }
  return v3;
}

void sub_234C90048(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::future<opaqueCMSampleBuffer *>::get(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::promise<opaqueCMSampleBuffer *>::set_value(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  if (!v2) {
    std::__throw_future_error[abi:ne180100](3u);
  }
  std::__assoc_state<opaqueCMSampleBuffer *>::set_value<opaqueCMSampleBuffer *>(v2, a2);
}

{
  uint64_t v2;
  uint64_t vars8;

  uint64_t v2 = *a1;
  if (!v2) {
    std::__throw_future_error[abi:ne180100](3u);
  }
  std::__assoc_state<opaqueCMSampleBuffer *>::set_value<opaqueCMSampleBuffer * const&>(v2, a2);
}

void std::__assoc_state<opaqueCMSampleBuffer *>::~__assoc_state(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  uint64_t vars8;

  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  JUMPOUT(0x237DD0F30);
}

uint64_t std::__assoc_state<opaqueCMSampleBuffer *>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t *std::promise<opaqueCMSampleBuffer *>::~promise(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((*(unsigned char *)(v2 + 136) & 1) == 0)
    {
      v7.__ptr_ = 0;
      uint64_t v3 = *(void *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v7);
      uint64_t v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        float v4 = std::future_category();
        MEMORY[0x237DD0E30](v6, 4, v4);
        std::make_exception_ptr[abi:ne180100]<std::future_error>(v6);
      }
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    }
  }
  return a1;
}

void std::make_exception_ptr[abi:ne180100]<std::future_error>(const std::logic_error *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::logic_error::logic_error(exception, a1);
  v3->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C2E0] + 16);
  v3[1] = a1[1];
  __cxa_throw(v3, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_234C904A8(void *a1)
{
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  exception = __cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::future_category();
  MEMORY[0x237DD0E30](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_234C9051C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_sub_state::__attach_future[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  int v3 = *(_DWORD *)(a1 + 136);
  if ((v3 & 2) != 0) {
    std::__throw_future_error[abi:ne180100](1u);
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 8), 1uLL, memory_order_relaxed);
  *(_DWORD *)(a1 + 136) = v3 | 2;
  std::mutex::unlock(v2);
}

void sub_234C90598(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<opaqueCMSampleBuffer *>::move(std::__assoc_sub_state *a1)
{
  __lk.__m_ = &a1->__mut_;
  __lk.__owns_ = 1;
  std::mutex::lock(&a1->__mut_);
  std::__assoc_sub_state::__sub_wait(a1, &__lk);
  ptr = a1->__exception_.__ptr_;
  v5.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v5);
  if (ptr)
  {
    std::exception_ptr::exception_ptr(&v4, &a1->__exception_);
    v3.__ptr_ = &v4;
    std::rethrow_exception(v3);
    __break(1u);
  }
  else if (__lk.__owns_)
  {
    std::mutex::unlock(__lk.__m_);
  }
}

void sub_234C90644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(a1);
}

void std::__assoc_state<opaqueCMSampleBuffer *>::set_value<opaqueCMSampleBuffer *>(uint64_t a1, void *a2)
{
  std::exception_ptr v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(unsigned char *)(a1 + 136) & 1) != 0
    || (v6.__ptr_ = 0, uint64_t v5 = *(void *)(a1 + 16), std::exception_ptr::~exception_ptr(&v6), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(void *)(a1 + 144) = *a2;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_234C90700(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<opaqueCMSampleBuffer *>::set_value<opaqueCMSampleBuffer * const&>(uint64_t a1, void *a2)
{
  std::exception_ptr v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(unsigned char *)(a1 + 136) & 1) != 0
    || (v6.__ptr_ = 0, uint64_t v5 = *(void *)(a1 + 16), std::exception_ptr::~exception_ptr(&v6), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(void *)(a1 + 144) = *a2;
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_234C907A4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t useMirroredFrontCameraInStreamMode()
{
  if (useMirroredFrontCameraInStreamMode_onceToken != -1) {
    dispatch_once(&useMirroredFrontCameraInStreamMode_onceToken, &__block_literal_global_23);
  }
  return useMirroredFrontCameraInStreamMode_useMirroredFrontCameraInStreamMode;
}

void __useMirroredFrontCameraInStreamMode_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v2 = [v0 objectForKey:@"CFX_DEMO_UseMirroredFrontCameraInStreamMode"];

  id v1 = v2;
  if (v2)
  {
    useMirroredFrontCameraInStreamMode_useMirroredFrontCameraInStreamMode = [v2 BOOLValue];
    id v1 = v2;
  }
}

uint64_t isDrawEffectsEditorBoundsEnabled()
{
  if (isDrawEffectsEditorBoundsEnabled_onceToken != -1) {
    dispatch_once(&isDrawEffectsEditorBoundsEnabled_onceToken, &__block_literal_global_30);
  }
  return isDrawEffectsEditorBoundsEnabled_drawEffectEditorBounds;
}

void __isDrawEffectsEditorBoundsEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v2 = [v0 objectForKey:@"CFX_DEBUG_DrawEffectEditorBounds"];

  id v1 = v2;
  if (v2)
  {
    isDrawEffectsEditorBoundsEnabled_drawEffectEditorBounds = [v2 BOOLValue];
    id v1 = v2;
  }
}

uint64_t isShowPlayerScrubbingControlsEnabled()
{
  if (isShowPlayerScrubbingControlsEnabled_onceToken != -1) {
    dispatch_once(&isShowPlayerScrubbingControlsEnabled_onceToken, &__block_literal_global_32);
  }
  return isShowPlayerScrubbingControlsEnabled_s_showPlayerScrubControls;
}

void __isShowPlayerScrubbingControlsEnabled_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v2 = [v0 objectForKey:@"CFX_DEBUG_ShowPlayerScrubbingControls"];

  id v1 = v2;
  if (v2)
  {
    isShowPlayerScrubbingControlsEnabled_s_showPlayerScrubControls = [v2 BOOLValue];
    id v1 = v2;
  }
}

id CFXAspectRatioCropOverride()
{
  if (CFXAspectRatioCropOverride_onceToken != -1) {
    dispatch_once(&CFXAspectRatioCropOverride_onceToken, &__block_literal_global_34);
  }
  id v0 = (void *)CFXAspectRatioCropOverride_aspectRatioCropOverride;
  return v0;
}

void __CFXAspectRatioCropOverride_block_invoke()
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v0 = [v2 objectForKey:@"CFX_AspectRatioCrop"];
  id v1 = (void *)CFXAspectRatioCropOverride_aspectRatioCropOverride;
  CFXAspectRatioCropOverride_aspectRatioCropOverride = v0;
}

id JFXAddShapeWithIdentifierNotificationUserInfoForEffectIdentifier(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = @"JFXAddShapeNotificationEffectIdentifierUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXAddEffectWithIdentifierNotificationUserInfoForEffectIdentifier(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = @"JFXAddEffectNotificationEffectIdentifierUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXAddEffectWithNameNotificationUserInfoForEffectName(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = @"JFXAddEffectNotificationEffectNameUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXAddAREffectWithIdentifierNotificationUserInfoForEffectIdentifier(void *a1, void *a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"JFXAddAREffectNotificationEffectIdentifierUserInfoKey";
  v8[1] = @"JFXAddAREffectNotificationReplayFilenameUserInfoKey";
  v9[0] = a1;
  v9[1] = a2;
  std::exception_ptr v3 = NSDictionary;
  id v4 = a2;
  id v5 = a1;
  std::exception_ptr v6 = [v3 dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

id JFXAddPosterWithIdentifierNotificationUserInfoForPosterIdentifier(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXAddPosterNotificationPosterIdentifierUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXAddPosterWithNameNotificationUserInfoForPosterName(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXAddPosterNotificationPosterNameUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXRemoveEffectsNotificationUserInfoForEffectTypes(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXRemoveEffectsNotificationEffectTypeIdentifiersUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXSetAnimojiNotificationUserInfoForEffect(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXSetAnimojiNotificationEffectIdentifierUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXSetMemojiNotificationUserInfoForFile(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXSetMemojiNotificationFileUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXSetFilterWithIdentifierNotificationUserInfoForEffect(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXSetFilterNotificationEffectIdentifierUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXAddStickerNotificationUserInfo(void *a1, CGFloat a2, CGFloat a3, double a4, double a5)
{
  v18[4] = *MEMORY[0x263EF8340];
  v18[0] = a1;
  v17[0] = @"JFXAddStickerNotificationDataUserInfoKey";
  v17[1] = @"JFXAddStickerNotificationOffsetUserInfoKey";
  id v9 = a1;
  v20.x = a2;
  v20.y = a3;
  CGRect v10 = NSStringFromCGPoint(v20);
  v18[1] = v10;
  v17[2] = @"JFXAddStickerNotificationScaleUserInfoKey";
  double v11 = [NSNumber numberWithDouble:a4];
  int v12 = [v11 stringValue];
  v18[2] = v12;
  v17[3] = @"JFXAddStickerNotificationRotationUserInfoKey";
  CMTime v13 = [NSNumber numberWithDouble:a5];
  uint64_t v14 = [v13 stringValue];
  v18[3] = v14;
  float64x2_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

id JFXAddStickerNotificationUserInfoForEffect(void *a1, CGFloat a2, CGFloat a3, double a4, double a5)
{
  v18[4] = *MEMORY[0x263EF8340];
  v18[0] = a1;
  v17[0] = @"JFXAddStickerNotificationEffectIdentifierUserInfoKey";
  v17[1] = @"JFXAddStickerNotificationOffsetUserInfoKey";
  id v9 = a1;
  v20.x = a2;
  v20.y = a3;
  CGRect v10 = NSStringFromCGPoint(v20);
  v18[1] = v10;
  v17[2] = @"JFXAddStickerNotificationScaleUserInfoKey";
  double v11 = [NSNumber numberWithDouble:a4];
  int v12 = [v11 stringValue];
  v18[2] = v12;
  v17[3] = @"JFXAddStickerNotificationRotationUserInfoKey";
  CMTime v13 = [NSNumber numberWithDouble:a5];
  uint64_t v14 = [v13 stringValue];
  v18[3] = v14;
  float64x2_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  return v15;
}

id JFXAddTextNotificationUserInfoForEffect(void *a1, void *a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"JFXAddTextNotificationEffectIdentifierUserInfoKey";
  v8[1] = @"JFXAddTextNotificationEffectStringUserInfoKey";
  v9[0] = a1;
  v9[1] = a2;
  std::exception_ptr v3 = NSDictionary;
  id v4 = a2;
  id v5 = a1;
  std::exception_ptr v6 = [v3 dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

id JFXOpenProjectNotificationUserInfo(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXOpenProjectIndexIdentifierUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXPlayClipAtIndexNotificationUserInfo(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXPlayClipIndexIdentifierUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXRecordNotificationUserInfo(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXRecordProjectIndexIdentifierUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXExportNotificationUserInfo(void *a1, void *a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = @"JFXExportProjectIndexIdentifierUserInfoKey";
  v8[1] = @"JFXExportAsMovieIdentifierUserInfoKey";
  v9[0] = a1;
  v9[1] = a2;
  std::exception_ptr v3 = NSDictionary;
  id v4 = a2;
  id v5 = a1;
  std::exception_ptr v6 = [v3 dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

id JFXEffectsRequestNotificationUserInfoForEffectsType(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXEffectsRequestNotificationUserInfoForEffectsTypeKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXAspectRatioNotificationUserInfo(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"JFXAspectRatioRequestNotificationUserInfoKey";
  v6[0] = a1;
  id v1 = NSDictionary;
  id v2 = a1;
  std::exception_ptr v3 = [v1 dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

id JFXAddShapeWithIdentifierNotificationGetEffectIdentifier(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddShapeNotificationEffectIdentifierUserInfoKey"];

  return v2;
}

id JFXAddEffectWithIdentifierNotificationGetEffectIdentifier(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddEffectNotificationEffectIdentifierUserInfoKey"];

  return v2;
}

id JFXAddEffectWithNameNotificationGetEffectName(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddEffectNotificationEffectNameUserInfoKey"];

  return v2;
}

id JFXAddAREffectWithIdentifierNotificationGetEffectIdentifier(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddAREffectNotificationEffectIdentifierUserInfoKey"];

  return v2;
}

id JFXAddAREffectWithIdentifierNotificationGetReplayFilename(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddAREffectNotificationReplayFilenameUserInfoKey"];

  return v2;
}

id JFXAddPosterWithIdentifierNotificationGetPosterIdentifier(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddPosterNotificationPosterIdentifierUserInfoKey"];

  return v2;
}

id JFXAddPosterWithNameNotificationGetPosterName(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddPosterNotificationPosterNameUserInfoKey"];

  return v2;
}

id JFXRemoveEffectsNotificationGetEffectTypeIdentifiers(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXRemoveEffectsNotificationEffectTypeIdentifiersUserInfoKey"];

  return v2;
}

id JFXSetAnimojiNotificationGetEffectIdentifier(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXSetAnimojiNotificationEffectIdentifierUserInfoKey"];

  return v2;
}

id JFXSetMemojiNotificationGetFile(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXSetMemojiNotificationFileUserInfoKey"];

  return v2;
}

id JFXSetFilterNotificationGetEffectIdentifier(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXSetFilterNotificationEffectIdentifierUserInfoKey"];

  return v2;
}

id JFXSetFilterNotificationGetEffectName(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXSetFilterNotificationEffectNameUserInfoKey"];

  return v2;
}

double JFXAddStickerNotificationGetOffset(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddStickerNotificationOffsetUserInfoKey"];

  *(void *)&double v3 = *(_OWORD *)&CGPointFromString(v2);
  return v3;
}

double JFXAddStickerNotificationGetRotation(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddStickerNotificationRotationUserInfoKey"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

double JFXAddStickerNotificationGetScale(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddStickerNotificationScaleUserInfoKey"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

id JFXAddStickerNotificationGetData(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddStickerNotificationDataUserInfoKey"];

  return v2;
}

id JFXAddStickerNotificationGetEffectIdentifier(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddStickerNotificationEffectIdentifierUserInfoKey"];

  return v2;
}

id JFXAddTextNotificationGetEffectIdentifier(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddTextNotificationEffectIdentifierUserInfoKey"];

  return v2;
}

id JFXAddTextNotificationGetEffectString(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAddTextNotificationEffectStringUserInfoKey"];

  return v2;
}

id JFXOpenProjectGetProjectIndex(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXOpenProjectIndexIdentifierUserInfoKey"];

  return v2;
}

id JFXPlayGetClipIndex(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXPlayClipIndexIdentifierUserInfoKey"];

  return v2;
}

id JFXRecordGetDuration(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXRecordProjectIndexIdentifierUserInfoKey"];

  return v2;
}

id JFXExportGetProjectIndex(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXExportProjectIndexIdentifierUserInfoKey"];

  return v2;
}

id JFXExportGetAsMovie(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXExportAsMovieIdentifierUserInfoKey"];

  return v2;
}

id JFXEffectsRequestGetEffectsType(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXEffectsRequestNotificationUserInfoForEffectsTypeKey"];

  return v2;
}

id JFXGetAspectRatio(void *a1)
{
  id v1 = [a1 userInfo];
  id v2 = [v1 objectForKeyedSubscript:@"JFXAspectRatioRequestNotificationUserInfoKey"];

  return v2;
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_234C958B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234C95910(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234C95990(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234C95A2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234C95AB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234C95B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_234C95B9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id stringForAspectRatio(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      id v1 = [MEMORY[0x263F086E0] jfxBundle];
      id v2 = v1;
      double v3 = @"ASPECT_RATIO_9X16";
      break;
    case 1:
      id v1 = [MEMORY[0x263F086E0] jfxBundle];
      id v2 = v1;
      double v3 = @"ASPECT_RATIO_3X4";
      break;
    case 2:
      id v1 = [MEMORY[0x263F086E0] jfxBundle];
      id v2 = v1;
      double v3 = @"SQUARE";
      break;
    case 3:
      id v1 = [MEMORY[0x263F086E0] jfxBundle];
      id v2 = v1;
      double v3 = @"ASPECT_RATIO_16X9";
      break;
    case 4:
      id v1 = [MEMORY[0x263F086E0] jfxBundle];
      id v2 = v1;
      double v3 = @"ASPECT_RATIO_4X3";
      break;
    default:
      id v1 = [MEMORY[0x263F086E0] jfxBundle];
      id v2 = v1;
      double v3 = @"ASPECT_RATIO_UNKNOWN";
      break;
  }
  double v4 = [v1 localizedStringForKey:v3 value:&stru_26E7CDB50 table:0];

  return v4;
}

uint64_t aspectRatioForString(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263F086E0] jfxBundle];
  double v3 = [v2 localizedStringForKey:@"ASPECT_RATIO_9X16" value:&stru_26E7CDB50 table:0];

  uint64_t v4 = [v1 localizedStandardCompare:v3];
  if (v4)
  {
    id v5 = [MEMORY[0x263F086E0] jfxBundle];
    std::exception_ptr v6 = [v5 localizedStringForKey:@"ASPECT_RATIO_3X4" value:&stru_26E7CDB50 table:0];

    uint64_t v7 = [v1 localizedStandardCompare:v6];
    if (v7)
    {
      double v8 = [MEMORY[0x263F086E0] jfxBundle];
      uint64_t v9 = [v8 localizedStringForKey:@"SQUARE" value:&stru_26E7CDB50 table:0];

      uint64_t v10 = [v1 localizedStandardCompare:v9];
      if (v10)
      {
        double v11 = [MEMORY[0x263F086E0] jfxBundle];
        int v12 = [v11 localizedStringForKey:@"ASPECT_RATIO_16X9" value:&stru_26E7CDB50 table:0];

        uint64_t v13 = [v1 localizedStandardCompare:v12];
        if (v13)
        {
          uint64_t v14 = [MEMORY[0x263F086E0] jfxBundle];
          float64x2_t v15 = [v14 localizedStringForKey:@"ASPECT_RATIO_4X3" value:&stru_26E7CDB50 table:0];

          uint64_t v16 = [v1 localizedStandardCompare:v15];
          if (v16) {
            uint64_t v4 = 5;
          }
          else {
            uint64_t v4 = 4;
          }
        }
        else
        {
          uint64_t v4 = 3;
        }
      }
      else
      {
        uint64_t v4 = 2;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
  }

  return v4;
}

double multiplierForAspectRatio(unint64_t a1)
{
  double result = 0.0;
  if (a1 <= 4) {
    return dbl_234D61300[a1];
  }
  return result;
}

double aspectRatioMultiplierForSize(double a1, double a2)
{
  return a1 / a2;
}

unint64_t aspectRatioForMultiplier(double a1)
{
  for (unint64_t result = 0; result != 5; ++result)
  {
    double v2 = 0.0;
    if (result <= 4) {
      double v2 = dbl_234D61300[result];
    }
    if (vabdd_f64(v2, a1) < 0.00000011920929) {
      break;
    }
  }
  return result;
}

unint64_t aspectRatioForSize(double a1, double a2)
{
  return aspectRatioForMultiplier(a1 / a2);
}

double sizeForAspectRatio(unint64_t a1)
{
  id v1 = (char *)&unk_234D612B0 + 8 * a1;
  if (a1 >= 5) {
    id v1 = (char *)MEMORY[0x263F001B0];
  }
  return *(double *)v1;
}

uint64_t PVViewContentModeFromAspectRatioPreservationMode(uint64_t a1)
{
  if (a1 == 2) {
    return 1;
  }
  else {
    return 2 * (a1 == 1);
  }
}

uint64_t aspectRatioPreservationModeFromPVViewContentMode(int a1)
{
  if (a1 == 1) {
    return 2;
  }
  else {
    return a1 == 2;
  }
}

double rectWithAspectRatioAndPreservationModeInRectWithSize(unint64_t a1, uint64_t a2, double a3, double a4)
{
  double v4 = 0.0;
  if (a1 <= 4) {
    double v4 = dbl_234D61300[a1];
  }
  int v5 = 2 * (a2 == 1);
  if (a2 == 2) {
    int v5 = 1;
  }
  if (v5)
  {
    if (v5 == 1)
    {
      if (a3 <= a4)
      {
        double v6 = a4;
        if (a4 * v4 < a3) {
          double v6 = a3 / v4;
        }
      }
      else
      {
        double v6 = a3 / v4;
        if (a3 / v4 < a4) {
          double v6 = a4;
        }
      }
    }
    else
    {
      if (v5 != 2) {
        return (a3 - v4) * 0.5 + 0.0;
      }
      double v6 = a3 / v4;
      if (a3 / v4 > a4) {
        double v6 = a4;
      }
    }
    double v4 = v4 * v6;
  }
  else
  {
    double v4 = a3;
  }
  return (a3 - v4) * 0.5 + 0.0;
}

unint64_t aspectRatioAdjustedForOrientation(unint64_t result, uint64_t a2)
{
  double v2 = 607.5;
  switch(result)
  {
    case 0uLL:
      goto LABEL_6;
    case 1uLL:
      double v2 = 810.0;
      goto LABEL_6;
    case 2uLL:
      return result;
    case 3uLL:
      double v2 = 1920.0;
      goto LABEL_6;
    case 4uLL:
      double v2 = 1440.0;
      goto LABEL_6;
    default:
      double v2 = 0.0;
LABEL_6:
      if ((unint64_t)(a2 - 3) > 1)
      {
        if ((unint64_t)(a2 - 1) > 1)
        {
          double v3 = 1080.0;
        }
        else
        {
          if (v2 >= 1080.0) {
            double v3 = v2;
          }
          else {
            double v3 = 1080.0;
          }
          double v2 = fmin(v2, 1080.0);
        }
      }
      else
      {
        double v3 = fmin(v2, 1080.0);
        if (v2 < 1080.0) {
          double v2 = 1080.0;
        }
      }
      return aspectRatioForMultiplier(v2 / v3);
  }
}

BOOL aspectRatioIsLandscape(unint64_t a1)
{
  double v1 = 0.0;
  if (a1 <= 4) {
    double v1 = dbl_234D61300[a1];
  }
  return fabs(v1 + -1.0) >= 0.00000011920929 && v1 > 1.0;
}

BOOL aspectRatioIsPortrait(unint64_t a1)
{
  double v1 = 0.0;
  if (a1 <= 4) {
    double v1 = dbl_234D61300[a1];
  }
  return fabs(v1 + -1.0) < 0.00000011920929 || v1 < 1.0;
}

uint64_t complementaryAspectRatio(unint64_t a1)
{
  if (a1 > 4) {
    return 2;
  }
  else {
    return qword_234D61328[a1];
  }
}

void sub_234C96780(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234C96C9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_234C96D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_234C9DD10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234C9F74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_234C9FC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA1D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CA59B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_234CA60D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA621C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA6440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA65B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA673C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_234CA6874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA6A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA6ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_234CA709C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA7240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA77F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA7B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA8078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CA8220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CMTime *CMTimeMakeWithARFrameTimestamp@<X0>(CMTime *a1@<X8>, Float64 a2@<D0>)
{
  return CMTimeMakeWithSeconds(a1, a2, 1000000000);
}

void sub_234CAA458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

uint64_t isFaceTrackingEnabledOnBackCamera()
{
  if (isFaceTrackingEnabledOnBackCamera_onceToken != -1) {
    dispatch_once(&isFaceTrackingEnabledOnBackCamera_onceToken, &__block_literal_global_35);
  }
  return isFaceTrackingEnabledOnBackCamera_result;
}

void __isFaceTrackingEnabledOnBackCamera_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v2 = [v0 objectForKey:@"JFX_EnableFaceTrackingBackCamera"];

  uint64_t v1 = v2;
  if (v2)
  {
    isFaceTrackingEnabledOnBackCamera_unint64_t result = [v2 BOOLValue];
    uint64_t v1 = v2;
  }
}

uint64_t JFX_isDrawInstructionGraphNodesEnabled()
{
  if (JFX_isDrawInstructionGraphNodesEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawInstructionGraphNodesEnabled_onceToken, &__block_literal_global_60_0);
  }
  return JFX_isDrawInstructionGraphNodesEnabled_enabled;
}

uint64_t JFX_isShowHDRBadgeInPreviewEnabled()
{
  if (JFX_isShowHDRBadgeInPreviewEnabled_onceToken != -1) {
    dispatch_once(&JFX_isShowHDRBadgeInPreviewEnabled_onceToken, &__block_literal_global_62);
  }
  return JFX_isShowHDRBadgeInPreviewEnabled_showHDRBadgeInPreview;
}

uint64_t JFX_isDrawOverlayBoundsEnabled()
{
  if (JFX_isDrawOverlayBoundsEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsEnabled_onceToken, &__block_literal_global_64);
  }
  return JFX_isDrawOverlayBoundsEnabled_drawOverlayBounds;
}

id JFX_getDrawOverlayBoundsOptionsDictionary()
{
  if (JFX_isDrawOverlayBoundsEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsEnabled_onceToken, &__block_literal_global_64);
  }
  if (JFX_isDrawOverlayBoundsEnabled_drawOverlayBounds)
  {
    uint64_t v0 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:11];
    uint64_t v1 = JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled();
    if (v1) {
      [v0 setObject:v1 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowDocumentBoundingBox"];
    }

    id v2 = JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled();
    if (v2) {
      [v0 setObject:v2 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowObjectAlignedBoundingBox"];
    }

    double v3 = JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled();
    if (v3) {
      [v0 setObject:v3 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowTextBoundingBoxes"];
    }

    double v4 = JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled();
    if (v4) {
      [v0 setObject:v4 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaBoundingBox"];
    }

    int v5 = JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled();
    if (v5) {
      [v0 setObject:v5 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowFaceRect"];
    }

    double v6 = JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled();
    if (v6) {
      [v0 setObject:v6 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowTapPoints"];
    }

    uint64_t v7 = JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled();
    if (v7) {
      [v0 setObject:v7 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowCornerPoints"];
    }

    double v8 = JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled();
    if (v8) {
      [v0 setObject:v8 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowTextCornerPoints"];
    }

    uint64_t v9 = JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled();
    if (v9) {
      [v0 setObject:v9 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaPoints"];
    }

    uint64_t v10 = JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled();
    if (v10) {
      [v0 setObject:v10 forKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowAdditionalRects"];
    }
  }
  else
  {
    uint64_t v0 = 0;
  }
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_onceToken, &__block_literal_global_67);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowDocumentBoundingBoxEnabled_n;
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_onceToken, &__block_literal_global_69);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowObjectAlignedBoundingBoxEnabled_n;
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_onceToken, &__block_literal_global_71);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowTextBoundingBoxesEnabled_n;
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_onceToken, &__block_literal_global_73);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowHitAreaBoundingBoxEnabled_n;
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_onceToken, &__block_literal_global_75);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowFaceRectEnabled_n;
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_onceToken, &__block_literal_global_77);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowTapPointsEnabled_n;
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_onceToken, &__block_literal_global_79);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowCornerPointsEnabled_n;
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_onceToken, &__block_literal_global_81);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowTextCornerPointsEnabled_n;
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_onceToken, &__block_literal_global_83);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowHitAreaPointsEnabled_n;
  return v0;
}

id JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled()
{
  if (JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_onceToken != -1) {
    dispatch_once(&JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_onceToken, &__block_literal_global_85);
  }
  uint64_t v0 = (void *)JFX_isDrawOverlayBoundsOptionShowAdditionalRectsEnabled_n;
  return v0;
}

void sub_234CB72D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_234CB8B90(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    double v4 = JFXLog_playback();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = [v3 description];
      -[JFXCompositionTrackGroup commitVolumeRampFromStartVolume:toEndVolume:timeRange:](v5, (uint8_t *)(v2 - 176), v4);
    }

    objc_end_catch();
    JUMPOUT(0x234CB88BCLL);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_234CB9B48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_234CBB6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CBB7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CBB8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CBBA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

id CoreGraphicsSerializationQueue()
{
  if (CoreGraphicsSerializationQueue_onceToken != -1) {
    dispatch_once(&CoreGraphicsSerializationQueue_onceToken, &__block_literal_global_39);
  }
  uint64_t v0 = (void *)CoreGraphicsSerializationQueue_sCGSerializationQueue;
  return v0;
}

void __CoreGraphicsSerializationQueue_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"MiroDisableCGSerialization"];

  if (v1)
  {
    attr = MEMORY[0x263EF83A8];
    id v2 = MEMORY[0x263EF83A8];
  }
  else
  {
    attr = 0;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.VEiOSCommon.CGSerialization", attr);
  uint64_t v4 = (void *)CoreGraphicsSerializationQueue_sCGSerializationQueue;
  CoreGraphicsSerializationQueue_sCGSerializationQueue = (uint64_t)v3;
}

void compositeCGImageRefInRect(CGImage *a1, CGBlendMode a2, CGFloat a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, float a11)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextSetBlendMode(CurrentContext, a2);
  CGContextSetAlpha(CurrentContext, a11);
  CGContextTranslateCTM(CurrentContext, a3, a4 + a6);
  CGContextScaleCTM(CurrentContext, a5 / a9, -a6 / a10);
  v29.origin.x = a7;
  v29.origin.y = a8;
  v29.size.width = a9;
  v29.size.height = a10;
  CGRect v30 = CGRectOffset(v29, -a7, -a8);
  CGContextDrawImage(CurrentContext, v30, a1);
  CGContextRestoreGState(CurrentContext);
}

void sub_234CBD4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CBD748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_234CBDB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CBDE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void JFX_getFrontAndBackCameras(unint64_t a1, unint64_t a2)
{
  if (JFX_getFrontAndBackCameras_onceToken != -1) {
    dispatch_once(&JFX_getFrontAndBackCameras_onceToken, &__block_literal_global_662);
  }
  if (a1 | a2)
  {
    dispatch_group_wait((dispatch_group_t)JFX_getFrontAndBackCameras_s_group, 0xFFFFFFFFFFFFFFFFLL);
    if (a1) {
      *(void *)a1 = (id) JFX_getFrontAndBackCameras_s_frontCamera;
    }
    if (a2) {
      *(void *)a2 = (id) JFX_getFrontAndBackCameras_s_backCamera;
    }
  }
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void JFX_configureCaptureDevice(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  id v9 = 0;
  int v5 = [v3 lockForConfiguration:&v9];
  id v6 = v9;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    double v8 = JFXLog_DebugCamera();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      JFX_configureCaptureDevice_cold_1(v5, (uint64_t)v7, v8);
    }
  }
  else
  {
    v4[2](v4, v3);
    [v3 unlockForConfiguration];
  }
}

void JFX_configureCaptureSession(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v4 beginConfiguration];
  v3[2](v3, v4);

  [v4 commitConfiguration];
}

void sub_234CC40A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_234CC6D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice(uint64_t a1)
{
  if (JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_onceToken != -1) {
    dispatch_once(&JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_onceToken, &__block_literal_global_670);
  }
  id v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];
  int v4 = JFX_adjustFaceAnchorCaptureInterfaceOrientationForDevice_s_isStreamingMode;

  if (v4) {
    BOOL v5 = v3 == 1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    return 1;
  }
  else {
    return a1;
  }
}

void sub_234CC86E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void JFX_logCameraIntrinsics(simd_float3x3 a1)
{
  pv_focal_length_from_intrinsics(a1);
  double v2 = v1;
  pv_principal_point_from_intrinsics(a1);
  double v4 = v3;
  BOOL v5 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    JFX_logCameraIntrinsics_cold_6();
  }

  id v6 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    JFX_logCameraIntrinsics_cold_5(v2);
  }

  uint64_t v7 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    JFX_logCameraIntrinsics_cold_4();
  }

  double v8 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    JFX_logCameraIntrinsics_cold_3(v4);
  }

  pv_resolution_from_principal_point();
  pv_fov_from_intrinsics();
  double v10 = v9;
  double v11 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    JFX_logCameraIntrinsics_cold_2(v10);
  }

  uint64_t v12 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    JFX_logCameraIntrinsics_cold_1(v10);
  }
}

void sub_234CCA488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_234CCB2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CCB718(void *a1)
{
}

void sub_234CCCD20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void JFXDistanceTransformEuclidean(uint64_t a1, uint64_t a2, int a3, char a4)
{
  if ((a4 & 3) == 0)
  {
    if ((-858993459 * a3 + 429496729) < 0x33333333) {
      operator new[]();
    }
    JFXDistanceTransformEuclidean_cold_1();
  }
  JFXDistanceTransformEuclidean_cold_2();
}

uint64_t __JFXDistanceTransformEuclidean_block_invoke(uint64_t result, double a2, double a3, uint8x8_t a4)
{
  uint64_t v4 = result;
  int v5 = *(_DWORD *)(result + 48);
  int v6 = v5 + 7;
  if (v5 >= 0) {
    int v6 = *(_DWORD *)(result + 48);
  }
  signed int v7 = v6 & 0xFFFFFFF8;
  if (v5 >= 8)
  {
    int v8 = 0;
    do
    {
      unint64_t result = distancesForWColumns<(SIMDWidth)8>(*(void *)(v4 + 32), v8, *(void *)(v4 + 40), *(_DWORD *)(v4 + 52), *(_DWORD *)(v4 + 56), *(unsigned __int8 *)(v4 + 60));
      v8 += 8;
    }
    while (v8 < v7);
    int v5 = *(_DWORD *)(v4 + 48);
  }
  if (v7 < v5)
  {
    uint64_t v9 = v7;
    uint64_t v10 = 4 * v7;
    v11.i64[0] = 0x100000001;
    v11.i64[1] = 0x100000001;
    do
    {
      uint64_t v12 = *(unsigned int *)(v4 + 56);
      if ((int)v12 >= 1)
      {
        uint64_t v13 = *(void *)(v4 + 32);
        uint64_t v14 = *(void *)(v4 + 40);
        *(int16x4_t *)v15.i8 = vdup_n_s16(-*(unsigned __int8 *)(v4 + 60));
        int32x4_t v16 = vdupq_n_s32(v12);
        uint64_t v17 = (int32x4_t *)(v14 + v10);
        uint64_t v18 = *(int *)(v4 + 52);
        uint64_t v19 = v13;
        uint64_t v20 = *(unsigned int *)(v4 + 56);
        int32x4_t v21 = v16;
        do
        {
          a4.i32[0] = *(_DWORD *)(v19 + v9);
          int16x4_t v22 = (int16x4_t)vmovl_u8(a4).u64[0];
          a4 = (uint8x8_t)(v15.i64[0] & 0xFF00FF00FF00FFLL);
          int32x4_t v21 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v21, v11), (int8x16_t)vmovl_s16(vceq_s16(v22, (int16x4_t)(v15.i64[0] & 0xFF00FF00FF00FFLL))));
          *uint64_t v17 = v21;
          uint64_t v17 = (int32x4_t *)((char *)v17 + 4 * v18);
          v19 += v18;
          --v20;
        }
        while (v20);
        unint64_t v23 = v12 + 1;
        uint64_t v24 = (v12 - 1) * v18;
        uint64_t v25 = v14 + 4 * v24;
        uint64_t v26 = -4 * v18;
        uint64_t v27 = v13 + v24;
        uint64_t v28 = -v18;
        do
        {
          v15.i32[0] = *(_DWORD *)(v27 + v9);
          int32x4_t v16 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v16, v11), (int8x16_t)vmovl_s16(vceq_s16((int16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v15.i8), (int16x4_t)a4)));
          int32x4_t v29 = vminq_s32(v16, *(int32x4_t *)(v25 + v10));
          int32x4_t v15 = vmulq_s32(v29, v29);
          *(int32x4_t *)(v25 + v10) = v15;
          --v23;
          v25 += v26;
          v27 += v28;
        }
        while (v23 > 1);
        int v5 = *(_DWORD *)(v4 + 48);
      }
      v9 += 4;
      v10 += 16;
    }
    while (v9 < v5);
  }
  return result;
}

uint64_t distancesForWColumns<(SIMDWidth)8>(uint64_t result, int a2, uint64_t a3, int a4, unsigned int a5, int a6)
{
  if ((int)a5 >= 1)
  {
    int8x8_t v6 = vdup_n_s8(a6 << 31 >> 31);
    int32x4_t v7 = vdupq_n_s32(a5);
    int v8 = (int8x8_t *)(result + a2);
    uint64_t v9 = (int32x4_t *)(a3 + 4 * a2);
    v10.i64[0] = 0x100000001;
    v10.i64[1] = 0x100000001;
    uint64_t v11 = a5;
    int32x4_t v12 = v7;
    int32x4_t v13 = v7;
    do
    {
      int16x8_t v14 = vmovl_s8(vceq_s8(*v8, v6));
      int32x4_t v12 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v12, v10), (int8x16_t)vmovl_s16(*(int16x4_t *)v14.i8));
      int32x4_t v13 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v13, v10), (int8x16_t)vmovl_high_s16(v14));
      *uint64_t v9 = v12;
      v9[1] = v13;
      int v8 = (int8x8_t *)((char *)v8 + a4);
      uint64_t v9 = (int32x4_t *)((char *)v9 + 4 * a4);
      --v11;
    }
    while (v11);
    unint64_t v15 = a5 + 1;
    uint64_t v16 = (a5 - 1) * a4;
    uint64_t v17 = (int8x8_t *)(result + a2 + v16);
    uint64_t v18 = (int32x4_t *)(a3 + 4 * v16 + 4 * a2);
    v19.i64[0] = 0x100000001;
    v19.i64[1] = 0x100000001;
    int32x4_t v20 = v7;
    do
    {
      int16x8_t v21 = vmovl_s8(vceq_s8(*v17, v6));
      int32x4_t v7 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v7, v19), (int8x16_t)vmovl_s16(*(int16x4_t *)v21.i8));
      int32x4_t v20 = (int32x4_t)vandq_s8((int8x16_t)vaddq_s32(v20, v19), (int8x16_t)vmovl_high_s16(v21));
      int32x4_t v22 = vminq_s32(v18[1], v20);
      int32x4_t v23 = vminq_s32(*v18, v7);
      int32x4_t *v18 = vmulq_s32(v23, v23);
      v18[1] = vmulq_s32(v22, v22);
      --v15;
      uint64_t v17 = (int8x8_t *)((char *)v17 - a4);
      uint64_t v18 = (int32x4_t *)((char *)v18 - 4 * a4);
    }
    while (v15 > 1);
  }
  return result;
}

uint64_t __JFXDistanceTransformEuclidean_block_invoke_2(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 52);
  int v3 = *(_DWORD *)(result + 48) + 8 * a2;
  if (v3 < v2)
  {
    uint64_t v4 = result;
    do
    {
      unint64_t result = distancesForWColumns<(SIMDWidth)8>(*(void *)(v4 + 32), v3, *(void *)(v4 + 40), v2, *(_DWORD *)(v4 + 56), *(unsigned __int8 *)(v4 + 60));
      v3 += 40;
      int v2 = *(_DWORD *)(v4 + 52);
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t __JFXDistanceTransformEuclidean_block_invoke_3()
{
  uint64_t result = MEMORY[0x270FA5388]();
  if (*(int *)(result + 56) >= 5) {
    operator new[]();
  }
  return result;
}

void sub_234CCF480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

__CFString *NSStringFromJFXEffectType(int a1)
{
  if ((a1 - 1) > 7) {
    return @"None";
  }
  else {
    return off_264C0C0F8[a1 - 1];
  }
}

uint64_t effectTypesIncompatibleWithType(int a1)
{
  if ((a1 - 1) > 7) {
    return MEMORY[0x263EFFA68];
  }
  else {
    return qword_264C0C138[a1 - 1];
  }
}

BOOL isAddedMediaCompatibleWithEffectType(int a1, uint64_t a2)
{
  if ((a1 - 1) < 2) {
    return 1;
  }
  if (a1 != 7) {
    return a1 == 5;
  }
  return a2;
}

BOOL isPosterCompatibleWithEffectType(int a1)
{
  return a1 == 2 || a1 == 5;
}

BOOL isCameraStillCompatibleWithEffectType(int a1)
{
  return a1 != 8 && a1 != 6;
}

void sub_234CD581C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234CD5874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234CD58EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234CD5980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234CD5B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234CD5C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234CD6054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234CD71B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void SetError(void *a1, void *a2, uint64_t a3, void *a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    int32x4_t v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = a4;
    int v8 = NSDictionary;
    id v9 = a4;
    id v10 = a2;
    uint64_t v11 = [v8 dictionaryWithObjects:v14 forKeys:&v13 count:1];
    int32x4_t v12 = [v7 errorWithDomain:v10 code:a3 userInfo:v11];

    *a1 = v12;
  }
}

id BrightnessIdentifier()
{
  if (BrightnessIdentifier_onceToken != -1) {
    dispatch_once(&BrightnessIdentifier_onceToken, &__block_literal_global_344);
  }
  uint64_t v0 = (void *)BrightnessIdentifier_s_brightnessIdentifier;
  return v0;
}

void sub_234CDC830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void sub_234CDCDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __BrightnessIdentifier_block_invoke()
{
  BrightnessIdentifier_s_brightnessIdentifier = [MEMORY[0x263EFA748] identifierForKey:@"com.apple.clips.exif.brightness" keySpace:*MEMORY[0x263EF9E88]];
  return MEMORY[0x270F9A758]();
}

__n128 OUTLINED_FUNCTION_2(uint64_t a1)
{
  return *(__n128 *)a1;
}

Float64 OUTLINED_FUNCTION_4_1@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, long long a3, uint64_t a4, uint64_t a5)
{
  a5 = a2;
  a3 = *(_OWORD *)a1;
  a4 = *(void *)(a1 + 16);
  return CMTimeGetSeconds((CMTime *)&a3);
}

double CFXAspectRatioForAspectRatioCrop(uint64_t a1)
{
  double result = 1.33333333;
  if (a1 == 2) {
    double result = 1.0;
  }
  if (a1 == 1) {
    return 1.77777778;
  }
  return result;
}

uint64_t CFXCanonicalAspectRatioCropForCaptureModeAndDesiredAspectRatioCrop(uint64_t a1, uint64_t a2)
{
  if (a1) {
    return 0;
  }
  uint64_t v2 = a2;
  int v3 = CFXAspectRatioCropOverride();
  uint64_t v4 = v3;
  if (v3) {
    uint64_t v2 = [v3 integerValue];
  }

  return v2;
}

uint64_t CFXPreviewAspectRatioForAspectRatioCrop(uint64_t a1)
{
  uint64_t v1 = 3;
  if (a1 != 2) {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t JFXCameraModeForCaptureModeAndAspectRatioCrop(uint64_t a1, uint64_t a2)
{
  if (a1 == 2)
  {
    if (JFXLowResolutionDevice())
    {
      uint64_t v5 = 2;
    }
    else
    {
      int8x8_t v6 = [MEMORY[0x263F307D8] preferences];
      uint64_t v7 = [v6 videoConfiguration];

      if (v7 == 6) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 3;
      }
    }
    if (CFXCaptureCapabilitiesIsHDRSupported())
    {
      int v8 = [MEMORY[0x263F307D8] preferences];
      int v9 = [v8 HDR10BitVideoEnabled];

      uint64_t v10 = 4;
      if (v5 != 2) {
        uint64_t v10 = 5;
      }
      if (v9) {
        return v10;
      }
    }
  }
  else if (a1)
  {
    return 0;
  }
  else
  {
    int IsCTMSupported = CFXCaptureCapabilitiesIsCTMSupported();
    uint64_t v4 = 6;
    if (a2 == 2) {
      uint64_t v4 = 9;
    }
    if (a2 == 1) {
      uint64_t v4 = 8;
    }
    if (IsCTMSupported) {
      return v4;
    }
    else {
      return 1;
    }
  }
  return v5;
}

__CFString *NSStringFromCFXAspectRatioCrop(uint64_t a1)
{
  uint64_t v1 = @"None (4:3)";
  if (a1 == 2) {
    uint64_t v1 = @"1:1";
  }
  if (a1 == 1) {
    return @"16:9";
  }
  else {
    return v1;
  }
}

BOOL isStreamingMode(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

id JFXLog_animoji()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_animoji_logObj;
  v2[5] = "animoji";
  if (JFXLog_animoji_onceToken != -1) {
    dispatch_once(&JFXLog_animoji_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_animoji_logObj;
  return v0;
}

id JFXLog_camera()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_camera_logObj;
  v2[5] = "camera";
  if (JFXLog_camera_onceToken != -1) {
    dispatch_once(&JFXLog_camera_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_camera_logObj;
  return v0;
}

id JFXLog_clip()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_clip_logObj;
  v2[5] = "clip";
  if (JFXLog_clip_onceToken != -1) {
    dispatch_once(&JFXLog_clip_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_clip_logObj;
  return v0;
}

id JFXLog_composition()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_composition_logObj;
  v2[5] = "composition";
  if (JFXLog_composition_onceToken != -1) {
    dispatch_once(&JFXLog_composition_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_composition_logObj;
  return v0;
}

id JFXLog_compositionAudio()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_compositionAudio_logObj;
  v2[5] = "compositionAudio";
  if (JFXLog_compositionAudio_onceToken != -1) {
    dispatch_once(&JFXLog_compositionAudio_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_compositionAudio_logObj;
  return v0;
}

id JFXLog_core()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_core_logObj;
  v2[5] = "core";
  if (JFXLog_core_onceToken != -1) {
    dispatch_once(&JFXLog_core_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_core_logObj;
  return v0;
}

id JFXLog_depthCodec()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_depthCodec_logObj;
  v2[5] = "depthCodec";
  if (JFXLog_depthCodec_onceToken != -1) {
    dispatch_once(&JFXLog_depthCodec_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_depthCodec_logObj;
  return v0;
}

id JFXLog_effectAssetDownloading()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_effectAssetDownloading_logObj;
  v2[5] = "effectAssetDownloading";
  if (JFXLog_effectAssetDownloading_onceToken != -1) {
    dispatch_once(&JFXLog_effectAssetDownloading_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_effectAssetDownloading_logObj;
  return v0;
}

id JFXLog_effects()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_effects_logObj;
  v2[5] = "effects";
  if (JFXLog_effects_onceToken != -1) {
    dispatch_once(&JFXLog_effects_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_effects_logObj;
  return v0;
}

id JFXLog_export()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_export_logObj;
  v2[5] = "export";
  if (JFXLog_export_onceToken != -1) {
    dispatch_once(&JFXLog_export_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_export_logObj;
  return v0;
}

id JFXLog_facetracking()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_facetracking_logObj;
  v2[5] = "facetracking";
  if (JFXLog_facetracking_onceToken != -1) {
    dispatch_once(&JFXLog_facetracking_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_facetracking_logObj;
  return v0;
}

id JFXLog_file()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_file_logObj;
  v2[5] = "file";
  if (JFXLog_file_onceToken != -1) {
    dispatch_once(&JFXLog_file_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_file_logObj;
  return v0;
}

id JFXLog_pickerUI()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_pickerUI_logObj;
  v2[5] = "pickerUI";
  if (JFXLog_pickerUI_onceToken != -1) {
    dispatch_once(&JFXLog_pickerUI_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_pickerUI_logObj;
  return v0;
}

id JFXLog_playback()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_playback_logObj;
  v2[5] = "playback";
  if (JFXLog_playback_onceToken != -1) {
    dispatch_once(&JFXLog_playback_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_playback_logObj;
  return v0;
}

id JFXLog_matting()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_matting_logObj;
  v2[5] = "matting";
  if (JFXLog_matting_onceToken != -1) {
    dispatch_once(&JFXLog_matting_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_matting_logObj;
  return v0;
}

id JFXLog_metadata()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_metadata_logObj;
  v2[5] = "metadata";
  if (JFXLog_metadata_onceToken != -1) {
    dispatch_once(&JFXLog_metadata_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_metadata_logObj;
  return v0;
}

id JFXLog_mediaDataReader()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_mediaDataReader_logObj;
  v2[5] = "mediaDataReader";
  if (JFXLog_mediaDataReader_onceToken != -1) {
    dispatch_once(&JFXLog_mediaDataReader_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_mediaDataReader_logObj;
  return v0;
}

id JFXLog_model()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_model_logObj;
  v2[5] = "model";
  if (JFXLog_model_onceToken != -1) {
    dispatch_once(&JFXLog_model_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_model_logObj;
  return v0;
}

id JFXLog_modelAssetManagement()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_modelAssetManagement_logObj;
  v2[5] = "modelAssetManagement";
  if (JFXLog_modelAssetManagement_onceToken != -1) {
    dispatch_once(&JFXLog_modelAssetManagement_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_modelAssetManagement_logObj;
  return v0;
}

id JFXLog_thermals()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_thermals_logObj;
  v2[5] = "thermals";
  if (JFXLog_thermals_onceToken != -1) {
    dispatch_once(&JFXLog_thermals_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_thermals_logObj;
  return v0;
}

id JFXLog_viewerUI()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_viewerUI_logObj;
  v2[5] = "viewerUI";
  if (JFXLog_viewerUI_onceToken != -1) {
    dispatch_once(&JFXLog_viewerUI_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_viewerUI_logObj;
  return v0;
}

id JFXLog_writer()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_writer_logObj;
  v2[5] = "writer";
  if (JFXLog_writer_onceToken != -1) {
    dispatch_once(&JFXLog_writer_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_writer_logObj;
  return v0;
}

id JFXLog_DebugAnalytics()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugAnalytics_logObj;
  v2[5] = "DebugAnalytics";
  if (JFXLog_DebugAnalytics_onceToken != -1) {
    dispatch_once(&JFXLog_DebugAnalytics_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugAnalytics_logObj;
  return v0;
}

id JFXLog_DebugAnimoji()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugAnimoji_logObj;
  v2[5] = "DebugAnimoji";
  if (JFXLog_DebugAnimoji_onceToken != -1) {
    dispatch_once(&JFXLog_DebugAnimoji_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugAnimoji_logObj;
  return v0;
}

id JFXLog_DebugAnimojiPlayback()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugAnimojiPlayback_logObj;
  v2[5] = "DebugAnimojiPlayback";
  if (JFXLog_DebugAnimojiPlayback_onceToken != -1) {
    dispatch_once(&JFXLog_DebugAnimojiPlayback_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugAnimojiPlayback_logObj;
  return v0;
}

id JFXLog_DebugAudio()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugAudio_logObj;
  v2[5] = "DebugAudio";
  if (JFXLog_DebugAudio_onceToken != -1) {
    dispatch_once(&JFXLog_DebugAudio_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugAudio_logObj;
  return v0;
}

id JFXLog_DebugCamera()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugCamera_logObj;
  v2[5] = "DebugCamera";
  if (JFXLog_DebugCamera_onceToken != -1) {
    dispatch_once(&JFXLog_DebugCamera_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugCamera_logObj;
  return v0;
}

id JFXLog_DebugCapture()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugCapture_logObj;
  v2[5] = "DebugCapture";
  if (JFXLog_DebugCapture_onceToken != -1) {
    dispatch_once(&JFXLog_DebugCapture_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugCapture_logObj;
  return v0;
}

id JFXLog_DebugClip()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugClip_logObj;
  v2[5] = "DebugClip";
  if (JFXLog_DebugClip_onceToken != -1) {
    dispatch_once(&JFXLog_DebugClip_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugClip_logObj;
  return v0;
}

id JFXLog_DebugComposition()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugComposition_logObj;
  v2[5] = "DebugComposition";
  if (JFXLog_DebugComposition_onceToken != -1) {
    dispatch_once(&JFXLog_DebugComposition_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugComposition_logObj;
  return v0;
}

id JFXLog_DebugDataModel()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugDataModel_logObj;
  v2[5] = "DebugDataModel";
  if (JFXLog_DebugDataModel_onceToken != -1) {
    dispatch_once(&JFXLog_DebugDataModel_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugDataModel_logObj;
  return v0;
}

id JFXLog_DebugDepthCodec()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugDepthCodec_logObj;
  v2[5] = "DebugDepthCodec";
  if (JFXLog_DebugDepthCodec_onceToken != -1) {
    dispatch_once(&JFXLog_DebugDepthCodec_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugDepthCodec_logObj;
  return v0;
}

id JFXLog_DebugEffect()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugEffect_logObj;
  v2[5] = "DebugEffect";
  if (JFXLog_DebugEffect_onceToken != -1) {
    dispatch_once(&JFXLog_DebugEffect_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugEffect_logObj;
  return v0;
}

id JFXLog_DebugEffectAssetDownloading()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugEffectAssetDownloading_logObj;
  v2[5] = "DebugEffectAssetDownloading";
  if (JFXLog_DebugEffectAssetDownloading_onceToken != -1) {
    dispatch_once(&JFXLog_DebugEffectAssetDownloading_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugEffectAssetDownloading_logObj;
  return v0;
}

id JFXLog_DebugExport()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugExport_logObj;
  v2[5] = "DebugExport";
  if (JFXLog_DebugExport_onceToken != -1) {
    dispatch_once(&JFXLog_DebugExport_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugExport_logObj;
  return v0;
}

id JFXLog_DebugExposure()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugExposure_logObj;
  v2[5] = "DebugExposure";
  if (JFXLog_DebugExposure_onceToken != -1) {
    dispatch_once(&JFXLog_DebugExposure_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugExposure_logObj;
  return v0;
}

id JFXLog_DebugFaceAnchor()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugFaceAnchor_logObj;
  v2[5] = "DebugFaceAnchor";
  if (JFXLog_DebugFaceAnchor_onceToken != -1) {
    dispatch_once(&JFXLog_DebugFaceAnchor_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugFaceAnchor_logObj;
  return v0;
}

id JFXLog_DebugFaceTrackingPlayback()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugFaceTrackingPlayback_logObj;
  v2[5] = "DebugFaceTrackingPlayback";
  if (JFXLog_DebugFaceTrackingPlayback_onceToken != -1) {
    dispatch_once(&JFXLog_DebugFaceTrackingPlayback_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugFaceTrackingPlayback_logObj;
  return v0;
}

id JFXLog_DebugMatting()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugMatting_logObj;
  v2[5] = "DebugMatting";
  if (JFXLog_DebugMatting_onceToken != -1) {
    dispatch_once(&JFXLog_DebugMatting_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugMatting_logObj;
  return v0;
}

id JFXLog_DebugMediaDataReader()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugMediaDataReader_logObj;
  v2[5] = "DebugMediaDataReader";
  if (JFXLog_DebugMediaDataReader_onceToken != -1) {
    dispatch_once(&JFXLog_DebugMediaDataReader_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugMediaDataReader_logObj;
  return v0;
}

id JFXLog_DebugPlayback()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugPlayback_logObj;
  v2[5] = "DebugPlayback";
  if (JFXLog_DebugPlayback_onceToken != -1) {
    dispatch_once(&JFXLog_DebugPlayback_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugPlayback_logObj;
  return v0;
}

id JFXLog_DebugPickerPreviewing()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugPickerPreviewing_logObj;
  v2[5] = "DebugPickerPreviewing";
  if (JFXLog_DebugPickerPreviewing_onceToken != -1) {
    dispatch_once(&JFXLog_DebugPickerPreviewing_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugPickerPreviewing_logObj;
  return v0;
}

id JFXLog_DebugThermals()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugThermals_logObj;
  v2[5] = "DebugThermals";
  if (JFXLog_DebugThermals_onceToken != -1) {
    dispatch_once(&JFXLog_DebugThermals_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugThermals_logObj;
  return v0;
}

id JFXLog_DebugViewerUI()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugViewerUI_logObj;
  v2[5] = "DebugViewerUI";
  if (JFXLog_DebugViewerUI_onceToken != -1) {
    dispatch_once(&JFXLog_DebugViewerUI_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugViewerUI_logObj;
  return v0;
}

id JFXLog_DebugWriter()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugWriter_logObj;
  v2[5] = "DebugWriter";
  if (JFXLog_DebugWriter_onceToken != -1) {
    dispatch_once(&JFXLog_DebugWriter_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugWriter_logObj;
  return v0;
}

id JFXLog_DebugWriterReorder()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_DebugWriterReorder_logObj;
  v2[5] = "DebugWriterReorder";
  if (JFXLog_DebugWriterReorder_onceToken != -1) {
    dispatch_once(&JFXLog_DebugWriterReorder_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_DebugWriterReorder_logObj;
  return v0;
}

id JFXLog_automation()
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __JFX_LogCategory_block_invoke_0;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  v2[4] = &JFXLog_automation_logObj;
  v2[5] = "automation";
  if (JFXLog_automation_onceToken != -1) {
    dispatch_once(&JFXLog_automation_onceToken, v2);
  }
  uint64_t v0 = (void *)JFXLog_automation_logObj;
  return v0;
}

void JFXAutomationLogForUserDefault(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x263EFFA40];
  id v5 = a1;
  int8x8_t v6 = [v4 standardUserDefaults];
  int v7 = [v6 BOOLForKey:v5];

  if (v7)
  {
    int v8 = JFXLog_automation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "[AUTO]: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

void JFXAutomationLogCameraPosition(uint64_t a1)
{
  if (a1 == 2) {
    uint64_t v1 = @"Camera orientation set to Front";
  }
  else {
    uint64_t v1 = @"Camera orientation set to Back";
  }
  JFXAutomationLogForUserDefault(@"autoLogCameraState", v1);
}

uint64_t isFrameMetricsLoggingEnabled()
{
  if (isFrameMetricsLoggingEnabled_onceToken != -1) {
    dispatch_once(&isFrameMetricsLoggingEnabled_onceToken, &__block_literal_global_45);
  }
  return isFrameMetricsLoggingEnabled_isFrameMetricsLoggingEnabled;
}

void __isFrameMetricsLoggingEnabled_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v2 = [v0 objectForKey:@"JFX_EnableFrameMetricsLogging"];

  uint64_t v1 = v2;
  if (v2)
  {
    isFrameMetricsLoggingEnabled_isFrameMetricsLoggingEnabled = [v2 BOOLValue];
    uint64_t v1 = v2;
  }
}

void JFXAutomationLogFrameMetrics(void *a1, CMTime *a2, CMTime *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a1;
  if (isFrameMetricsLoggingEnabled_onceToken != -1) {
    dispatch_once(&isFrameMetricsLoggingEnabled_onceToken, &__block_literal_global_45);
  }
  if (isFrameMetricsLoggingEnabled_isFrameMetricsLoggingEnabled)
  {
    CMTime time = *a2;
    Float64 Seconds = CMTimeGetSeconds(&time);
    CMTime time = *a3;
    int v7 = [NSString stringWithFormat:@"Frame Metrics - { \"event\": \"%@\", \"timestamp\": %f, \"latency\": %f }", v5, *(void *)&Seconds, CMTimeGetSeconds(&time)];
    int v8 = JFXLog_automation();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(time.value) = 138412290;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v7;
      _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&time, 0xCu);
    }
  }
}

uint64_t JFX_descriptionForEffectAssetContentType(uint64_t a1)
{
  if (JFX_descriptionForEffectAssetContentType_onceToken != -1) {
    dispatch_once(&JFX_descriptionForEffectAssetContentType_onceToken, &__block_literal_global_46);
  }
  id v2 = (void *)JFX_descriptionForEffectAssetContentType_values;
  return [v2 objectAtIndexedSubscript:a1];
}

uint64_t JFX_descriptionForEffectAssetAspectRatio(uint64_t a1)
{
  if (JFX_descriptionForEffectAssetAspectRatio_onceToken != -1) {
    dispatch_once(&JFX_descriptionForEffectAssetAspectRatio_onceToken, &__block_literal_global_33_1);
  }
  id v2 = (void *)JFX_descriptionForEffectAssetAspectRatio_values;
  return [v2 objectAtIndexedSubscript:a1];
}

uint64_t JFX_descriptionForEffectAssetUsageMode(uint64_t a1)
{
  if (JFX_descriptionForEffectAssetUsageMode_onceToken != -1) {
    dispatch_once(&JFX_descriptionForEffectAssetUsageMode_onceToken, &__block_literal_global_56);
  }
  id v2 = (void *)JFX_descriptionForEffectAssetUsageMode_values;
  return [v2 objectAtIndexedSubscript:a1];
}

void sub_234CE52B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_234CE59B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void sub_234CE5D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CE658C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CE6728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CE7A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

JFXFaceTrackedEffectTransform *JFXMakeFaceTrackedEffectTransformFaceCamera(void *x0_0)
{
  id v1 = x0_0;
  [v1 cameraTransform];
  pv_simd_matrix_get_rotation_matrix(v38);
  [v1 onFaceTransform];
  pv_simd_matrix_translate();
  long long v35 = v3;
  long long v36 = v2;
  long long v33 = v5;
  long long v34 = v4;
  int8x8_t v6 = [JFXFaceTrackedEffectTransform alloc];
  [v1 cameraProjection];
  double v31 = v8;
  double v32 = v7;
  double v29 = v10;
  double v30 = v9;
  [v1 cameraTransform];
  double v27 = v12;
  double v28 = v11;
  double v25 = v14;
  double v26 = v13;
  [v1 billboardTransform];
  long long v23 = v16;
  long long v24 = v15;
  long long v21 = v18;
  long long v22 = v17;

  int32x4_t v19 = -[JFXFaceTrackedEffectTransform initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:](v6, "initWithCameraProjection:cameraTransform:onFaceTransform:billboardTransform:", v32, v31, v30, v29, v28, v27, v26, v25, v36, v35, v34, v33, v24, v23, v22, v21);
  return v19;
}

void sub_234CEFB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CEFCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CF0068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CF0410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CF0A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CF0E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CF1B3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CF1F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CF23B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234CF3914(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_234CF3B7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_234CF4748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234CF48C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void sub_234CF739C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_234CF9AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double OUTLINED_FUNCTION_0_5(__n128 a1)
{
  return a1.n128_f32[3];
}

void OUTLINED_FUNCTION_2_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_234CFF398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void sub_234CFF5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D0104C(void *a1)
{
}

void sub_234D01BA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_234D01D24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_234D01E34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_234D01F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_234D110CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

id exifMetadataForCVPixelBuffer(const void *a1)
{
  CMAttachmentMode attachmentModeOut = 1;
  uint64_t v1 = CMGetAttachment(a1, (CFStringRef)*MEMORY[0x263F0F248], &attachmentModeOut);
  return v1;
}

id exifMetadataForCMSampleBuffer(const void *a1)
{
  CMAttachmentMode attachmentModeOut = 1;
  uint64_t v1 = CMGetAttachment(a1, (CFStringRef)*MEMORY[0x263F0F248], &attachmentModeOut);
  return v1;
}

float exifBrightnessFromEXIFMetadata(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1
    && ([v1 objectForKeyedSubscript:@"BrightnessValue"],
        (long long v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v4 = v3;
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    float v6 = NAN;
  }

  return v6;
}

float shutterSpeedFromEXIFMetadata(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1
    && ([v1 objectForKeyedSubscript:@"ShutterSpeedValue"],
        (long long v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v4 = v3;
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    float v6 = NAN;
  }

  return v6;
}

float exposureTimeFromEXIFMetadata(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1
    && ([v1 objectForKeyedSubscript:@"ExposureTime"],
        (long long v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v4 = v3;
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    float v6 = NAN;
  }

  return v6;
}

float isoFromEXIFMetadata(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1
    && ([v1 objectForKeyedSubscript:@"ISOSpeedRatings"],
        (long long v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v4 = v3;
    float v5 = [v3 objectAtIndexedSubscript:0];
    [v5 floatValue];
    float v7 = v6;

    float v8 = (float)(int)v7;
  }
  else
  {
    float v8 = NAN;
  }

  return v8;
}

void exposureOffsetFromEXIFMetadata(void *a1)
{
  float v1 = exifBrightnessFromEXIFMetadata(a1);
  exp(v1 * -0.5 + -2.0);
  exp((float)(v1 + 3.0));
}

void logMetadataFromEXIFMetadata(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = JFXLog_DebugExposure();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      logMetadataFromEXIFMetadata_cold_1((uint64_t)v1, v2);
    }
  }
}

uint64_t createReadonlyCMBlockBufferFromNSData(CMBlockBufferRef *a1, void *a2)
{
  HIDWORD(customBlockSource.AllocateBlock) = 0;
  *(void *)&customBlockSource.version = 0;
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))releaseNSData;
  customBlockSource.refCon = a2;
  long long v3 = customBlockSource.refCon;
  long long v4 = (void *)[v3 bytes];
  size_t v5 = [v3 length];
  size_t v6 = [v3 length];

  return CMBlockBufferCreateWithMemoryBlock(0, v4, v5, 0, &customBlockSource, 0, v6, 0, a1);
}

CVPixelBufferRef createFloat32DepthImageForAVDepthData(void *a1)
{
  id v1 = a1;
  if ([v1 depthDataType] == 1717855600)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [v1 depthDataByConvertingToDepthDataType:1717855600];
  }
  id v3 = v2;
  CVPixelBufferRef v4 = CVPixelBufferRetain((CVPixelBufferRef)[v3 depthDataMap]);

  return v4;
}

CVPixelBufferRef createContiguousFloat32DepthImageForAVDepthData(void *a1)
{
  v23[4] = *MEMORY[0x263EF8340];
  Float32DepthImageForAVDepthData = createFloat32DepthImageForAVDepthData(a1);
  id v2 = Float32DepthImageForAVDepthData;
  if (Float32DepthImageForAVDepthData && CVPixelBufferGetPixelFormatType(Float32DepthImageForAVDepthData) == 1717855600)
  {
    size_t Width = CVPixelBufferGetWidth(v2);
    size_t Height = CVPixelBufferGetHeight(v2);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v2);
    if (BytesPerRow == 4 * Width)
    {
      size_t v6 = JFXLog_DebugDepthCodec();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        createContiguousFloat32DepthImageForAVDepthData_cold_1();
      }

      return CVPixelBufferRetain(v2);
    }
    else
    {
      size_t v7 = BytesPerRow;
      CVPixelBufferRef pixelBuffer = 0;
      uint64_t v8 = *MEMORY[0x263F04130];
      v23[0] = MEMORY[0x263EFFA78];
      uint64_t v9 = *MEMORY[0x263F04240];
      v22[0] = v8;
      v22[1] = v9;
      double v10 = [NSNumber numberWithUnsignedLong:Width];
      v23[1] = v10;
      v22[2] = *MEMORY[0x263F04118];
      double v11 = [NSNumber numberWithUnsignedLong:Height];
      v23[2] = v11;
      v22[3] = *MEMORY[0x263F04180];
      double v12 = [NSNumber numberWithUnsignedInt:1717855600];
      v23[3] = v12;
      CFDictionaryRef v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

      CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x66646570u, v13, &pixelBuffer);
      if (pixelBuffer)
      {
        CVPixelBufferLockBaseAddress(v2, 1uLL);
        CVPixelBufferLockBaseAddress(pixelBuffer, 0);
        if ((int)Height >= 1)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          size_t v16 = 4 * Width;
          uint64_t v17 = Height;
          do
          {
            long long v18 = (char *)CVPixelBufferGetBaseAddress(v2) + v14;
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
            memcpy(&BaseAddress[v15], v18, v16);
            v15 += v16;
            v14 += v7;
            --v17;
          }
          while (v17);
        }
        CVPixelBufferUnlockBaseAddress(v2, 1uLL);
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        id v2 = pixelBuffer;
      }
    }
  }
  return v2;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

BOOL JFXOSVersionIsAbove(void *a1)
{
  uint64_t v1 = JFXOSVersionIsAbove_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&JFXOSVersionIsAbove_onceToken, &__block_literal_global_57);
  }
  unint64_t v3 = [(id)JFXOSVersionIsAbove_systemVersion compare:v2 options:64];

  return v3 < 2;
}

void __JFXOSVersionIsAbove_block_invoke()
{
  id v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v0 = [v2 systemVersion];
  uint64_t v1 = (void *)JFXOSVersionIsAbove_systemVersion;
  JFXOSVersionIsAbove_systemVersion = v0;
}

void HEVCLosslessEncoder::HEVCLosslessEncoder(HEVCLosslessEncoder *this)
{
  *(void *)&this->var6 = 0x800000000;
  *(void *)&this->var0 = 0x2D000000500;
  this->var2 = 30.0;
  this->var3 = 0;
  *(_OWORD *)&this->var4.var0 = xmmword_234D62530;
  this->var4.var4 = 1.0;
  *(_DWORD *)&this->var4.var5 = 65792;
}

{
  *(void *)&this->var6 = 0x800000000;
  *(void *)&this->var0 = 0x2D000000500;
  this->var2 = 30.0;
  this->var3 = 0;
  *(_OWORD *)&this->var4.var0 = xmmword_234D62530;
  this->var4.var4 = 1.0;
  *(_DWORD *)&this->var4.var5 = 65792;
}

uint64_t HEVCLosslessEncoder::Open(HEVCLosslessEncoder *a1, int32_t a2, int32_t a3, int a4, void (__cdecl *a5)(void *, void *, OSStatus, VTEncodeInfoFlags, CMSampleBufferRef), void *a6, double a7)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a2 < 64 || a3 <= 63)
  {
    uint64_t v14 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::Open();
    }
  }
  a1->var0 = a2;
  a1->var1 = a3;
  a1->var2 = a7;
  a1->var8 = 1752589105;
  uint64_t v15 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    int32_t v33 = a2;
    __int16 v34 = 1024;
    int32_t v35 = a3;
    __int16 v36 = 2048;
    double v37 = a7;
    _os_log_debug_impl(&dword_234C41000, v15, OS_LOG_TYPE_DEBUG, "########### HEVCLosslessEncoder::Open w = %d, h = %d, frameRate=%f", buf, 0x18u);
  }

  if (a1->var3) {
    goto LABEL_9;
  }
  uint64_t v17 = *MEMORY[0x263F1ED58];
  v30[0] = *MEMORY[0x263F1ED50];
  v30[1] = v17;
  v31[0] = MEMORY[0x263EFFA88];
  v31[1] = MEMORY[0x263EFFA88];
  CFDictionaryRef v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  uint64_t v19 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, a3, a1->var8, v18, 0, 0, a5, a6, &a1->var3);
  if (!v19)
  {

LABEL_9:
    switch(a4)
    {
      case 1:
      case 2:
        a1->var7 = 8;
        int v16 = 1308;
        break;
      case 3:
      case 6:
        a1->var7 = 10;
        int v16 = 2;
        break;
      case 4:
      case 5:
      case 7:
      case 8:
        a1->var7 = 10;
        int v16 = 1310;
        break;
      case 9:
        a1->var7 = 10;
        a1->var4.var0 = 9;
        int v16 = 1010;
        break;
      case 10:
        a1->var7 = 8;
        a1->var4.var0 = 10;
        int v16 = 1008;
        break;
      default:
        a1->var7 = 8;
        int v16 = 1;
        break;
    }
    a1->var4.var2 = v16;
    long long v21 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::Open(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    a1->var4.var5 = 1;
    HEVCLosslessEncoder::ConfigEncoder(a1, &a1->var4);
    return 0;
  }
  int32x4_t v20 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    HEVCLosslessEncoder::Open();
  }

  return v19;
}

void sub_234D1C664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t HEVCLosslessEncoder::ConfigEncoder(HEVCLosslessEncoder *this, EncoderConfig *a2)
{
  CVPixelBufferRef v4 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    HEVCLosslessEncoder::ConfigEncoder(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  long long v12 = *(_OWORD *)&a2->var0;
  *(_OWORD *)&this->var4.var4 = *(_OWORD *)&a2->var4;
  *(_OWORD *)&this->var4.var0 = v12;
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v14 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &a2->var1);
  uint64_t v15 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    HEVCLosslessEncoder::ConfigEncoder();
  }

  OSStatus v16 = VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x263F1E678], v14);
  CFRelease(v14);
  if (v16)
  {
    uint64_t v17 = JFXLog_DebugDepthCodec();
    uint64_t v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::ConfigEncoder();
    }
    goto LABEL_78;
  }
  int var2 = a2->var2;
  if (var2 > 121)
  {
    if (var2 > 1009)
    {
      switch(var2)
      {
        case 1010:
          int32x4_t v20 = (const void **)MEMORY[0x263F1EB78];
          goto LABEL_35;
        case 1308:
          int32x4_t v20 = (const void **)MEMORY[0x263F1EB60];
          goto LABEL_35;
        case 1310:
          int32x4_t v20 = (const void **)MEMORY[0x263F1EB58];
          goto LABEL_35;
      }
    }
    else
    {
      switch(var2)
      {
        case 122:
          int32x4_t v20 = (const void **)MEMORY[0x263F1EAA0];
          goto LABEL_35;
        case 244:
          int32x4_t v20 = (const void **)MEMORY[0x263F1EAA8];
          goto LABEL_35;
        case 1008:
          int32x4_t v20 = (const void **)MEMORY[0x263F1EB80];
          goto LABEL_35;
      }
    }
LABEL_53:
    uint64_t v17 = JFXLog_DebugDepthCodec();
    uint64_t v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::ConfigEncoder();
    }
    goto LABEL_78;
  }
  if (var2 > 65)
  {
    switch(var2)
    {
      case 'B':
        int32x4_t v20 = (const void **)MEMORY[0x263F1EA88];
        goto LABEL_35;
      case 'M':
        int32x4_t v20 = (const void **)MEMORY[0x263F1EB48];
        goto LABEL_35;
      case 'd':
        int32x4_t v20 = (const void **)MEMORY[0x263F1EAF8];
        goto LABEL_35;
    }
    goto LABEL_53;
  }
  if (var2 == 1)
  {
    int32x4_t v20 = (const void **)MEMORY[0x263F1EB70];
    goto LABEL_35;
  }
  if (var2 == 2)
  {
    int32x4_t v20 = (const void **)MEMORY[0x263F1EB50];
    goto LABEL_35;
  }
  if (var2 != 3) {
    goto LABEL_53;
  }
  int32x4_t v20 = (const void **)MEMORY[0x263F1EB68];
LABEL_35:
  long long v21 = *v20;
  uint64_t v22 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    HEVCLosslessEncoder::ConfigEncoder();
  }

  if (VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x263F1E638], v21))
  {
    uint64_t v17 = JFXLog_DebugDepthCodec();
    uint64_t v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::ConfigEncoder();
    }
    goto LABEL_78;
  }
  uint64_t v23 = (const void *)*MEMORY[0x263EFFB40];
  uint64_t v24 = (const void *)*MEMORY[0x263EFFB38];
  if (a2->var8) {
    uint64_t v25 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v25 = (const void *)*MEMORY[0x263EFFB38];
  }
  uint64_t v26 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    HEVCLosslessEncoder::ConfigEncoder();
  }

  if (VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x263F1E4C8], v25))
  {
    uint64_t v17 = JFXLog_DebugDepthCodec();
    uint64_t v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::ConfigEncoder();
    }
    goto LABEL_78;
  }
  CFNumberRef v27 = CFNumberCreate(v13, kCFNumberDoubleType, &a2->var4);
  uint64_t v28 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    HEVCLosslessEncoder::ConfigEncoder((uint64_t *)&a2->var4, v28);
  }

  OSStatus v29 = VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x263F1E5C8], v27);
  CFRelease(v27);
  if (v29)
  {
    uint64_t v17 = JFXLog_DebugDepthCodec();
    uint64_t v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::ConfigEncoder();
    }
    goto LABEL_78;
  }
  CFNumberRef v30 = CFNumberCreate(v13, kCFNumberDoubleType, &this->var2);
  double v31 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    HEVCLosslessEncoder::ConfigEncoder((uint64_t *)&this->var2, v31);
  }

  OSStatus v32 = VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x263F1E548], v30);
  CFRelease(v30);
  if (v32)
  {
    uint64_t v17 = JFXLog_DebugDepthCodec();
    uint64_t v18 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::ConfigEncoder();
    }
    goto LABEL_78;
  }
  if (a2->var5) {
    int32_t v33 = &unk_26E801ED0;
  }
  else {
    int32_t v33 = &unk_26E801EE0;
  }
  uint64_t v17 = v33;
  __int16 v34 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    HEVCLosslessEncoder::ConfigEncoder();
  }

  if (VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x263F1E640], v17))
  {
    int32_t v35 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::ConfigEncoder();
    }

LABEL_77:
    uint64_t v18 = 2;
    goto LABEL_78;
  }

  if (a2->var6) {
    __int16 v36 = v23;
  }
  else {
    __int16 v36 = v24;
  }
  double v37 = JFXLog_DebugDepthCodec();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    HEVCLosslessEncoder::ConfigEncoder();
  }

  OSStatus v38 = VTSessionSetProperty(this->var3, (CFStringRef)*MEMORY[0x263F1E650], v36);
  uint64_t v17 = JFXLog_DebugDepthCodec();
  BOOL v39 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v38)
  {
    if (v39) {
      HEVCLosslessEncoder::ConfigEncoder();
    }
    goto LABEL_77;
  }
  if (v39) {
    HEVCLosslessEncoder::ConfigEncoder(v17, v40, v41, v42, v43, v44, v45, v46);
  }
  uint64_t v18 = 0;
LABEL_78:

  return v18;
}

void sub_234D1CC78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t HEVCLosslessEncoder::Close(HEVCLosslessEncoder *this)
{
  var3 = this->var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var5 = this->var5;
  VTCompressionSessionCompleteFrames(var3, (CMTime *)&var5);
  unint64_t v3 = this->var3;
  if (v3)
  {
    CFRelease(v3);
    this->var3 = 0;
  }
  return 0;
}

uint64_t HEVCLosslessEncoder::EncodeFrame(HEVCLosslessEncoder *this, __CVBuffer *a2, CMTime *a3, CFDictionaryRef frameProperties)
{
  VTEncodeInfoFlags infoFlagsOut = 0;
  var3 = this->var3;
  CMTime presentationTimeStamp = *a3;
  CMTime v11 = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  uint64_t v7 = VTCompressionSessionEncodeFrame(var3, a2, &presentationTimeStamp, &v11, frameProperties, 0, &infoFlagsOut);
  if (v7)
  {
    uint64_t v8 = JFXLog_DebugDepthCodec();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      HEVCLosslessEncoder::EncodeFrame();
    }
  }
  else
  {
    long long v9 = *(_OWORD *)&a3->value;
    this->var5.var3 = a3->epoch;
    *(_OWORD *)&this->var5.var0 = v9;
    ++this->var6;
  }
  return v7;
}

__n128 HEVCLosslessEncoder::GetEncoderConfig(HEVCLosslessEncoder *this, EncoderConfig *a2)
{
  if (a2)
  {
    __n128 result = *(__n128 *)&this->var4.var0;
    long long v3 = *(_OWORD *)&this->var4.var4;
    *(__n128 *)&a2->var0 = result;
    *(_OWORD *)&a2->var4 = v3;
  }
  return result;
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x22u);
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t JFX_createImageRefFromAuxiliaryImageInfo(const __CFDictionary *a1, uint64_t a2, CGFloat a3)
{
  CVPixelBufferRef texture = 0;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F0EF90]);
  size_t v7 = objc_msgSend((id)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x263F0F098]), "unsignedLongValue");
  size_t v8 = objc_msgSend((id)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x263F0F590]), "unsignedLongValue");
  size_t v9 = objc_msgSend((id)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x263F0F460]), "unsignedLongValue");
  LODWORD(Value) = objc_msgSend((id)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x263F0F4E8]), "unsignedIntValue");
  uint64_t v10 = CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F0EF88]);
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v12 = v10;
  CVPixelBufferCreateWithBytes(v11, v8, v9, (OSType)Value, (void *)[v12 bytes], v7, (CVPixelBufferReleaseBytesCallback)JFX_auxiliaryImageCVPixelBufferReleaseBytesCallback, v12, 0, &texture);
  if (!texture) {
    return 0;
  }
  CFAllocatorRef v13 = objc_msgSend(MEMORY[0x263F00650], "imageWithCVPixelBuffer:");
  CFNumberRef v14 = [v13 imageByApplyingCGOrientation:a2];

  if (vabdd_f64(1.0, a3) > 2.22044605e-16)
  {
    CGAffineTransformMakeScale(&v19, a3, a3);
    uint64_t v15 = [v14 imageByApplyingTransform:&v19];

    CFNumberRef v14 = (void *)v15;
  }
  CVPixelBufferRelease(texture);
  if (!v14) {
    return 0;
  }
  OSStatus v16 = [MEMORY[0x263F00628] context];
  [v14 extent];
  uint64_t v17 = objc_msgSend(v16, "createCGImage:fromRect:", v14);

  return v17;
}

uint64_t createGainMapImageRefFromAssetURL(const __CFURL *a1)
{
  uint64_t v1 = CGImageSourceCreateWithURL(a1, 0);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  CFDictionaryRef v3 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(v1, 0, (CFStringRef)*MEMORY[0x263F0EFB0]);
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    uint64_t v5 = 1;
    unsigned int valuePtr = 1;
    CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(v2, 0, 0);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v6, (const void *)*MEMORY[0x263F0F4C8]);
      if (Value) {
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      }
      CFRelease(v7);
      uint64_t v5 = valuePtr;
    }
    uint64_t ImageRefFromAuxiliaryImageInfo = JFX_createImageRefFromAuxiliaryImageInfo(v4, v5, 1.0);
    CFRelease(v4);
  }
  else
  {
    uint64_t ImageRefFromAuxiliaryImageInfo = 0;
  }
  CFRelease(v2);
  return ImageRefFromAuxiliaryImageInfo;
}

BOOL hasGainMap(CGImageSource *a1)
{
  CFDictionaryRef v1 = CGImageSourceCopyAuxiliaryDataInfoAtIndex(a1, 0, (CFStringRef)*MEMORY[0x263F0EFB0]);
  CFDictionaryRef v2 = v1;
  if (v1) {
    CFRelease(v1);
  }
  return v2 != 0;
}

void JFX_auxiliaryImageCVPixelBufferReleaseBytesCallback(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

size_t JFXToVImage@<X0>(__CVBuffer *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(void *)a2 = CVPixelBufferGetBaseAddress(a1);
  *(void *)(a2 + 8) = CVPixelBufferGetHeight(a1);
  *(void *)(a2 + 16) = CVPixelBufferGetWidth(a1);
  size_t result = CVPixelBufferGetBytesPerRow(a1);
  *(void *)(a2 + 24) = result;
  return result;
}

size_t JFXPlanarToVImage@<X0>(__CVBuffer *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(void *)a3 = CVPixelBufferGetBaseAddressOfPlane(a1, a2);
  *(void *)(a3 + 8) = CVPixelBufferGetHeightOfPlane(a1, a2);
  *(void *)(a3 + 16) = CVPixelBufferGetWidthOfPlane(a1, a2);
  size_t result = CVPixelBufferGetBytesPerRowOfPlane(a1, a2);
  *(void *)(a3 + 24) = result;
  return result;
}

uint64_t JFXCreatePixelBufferPool(uint64_t a1, uint64_t a2, uint64_t a3, CVPixelBufferPoolRef *a4)
{
  v17[5] = *MEMORY[0x263EF8340];
  v17[0] = MEMORY[0x263EFFA78];
  uint64_t v7 = *MEMORY[0x263F04180];
  v16[0] = *MEMORY[0x263F04130];
  v16[1] = v7;
  size_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v17[1] = v8;
  v16[2] = *MEMORY[0x263F04240];
  size_t v9 = [NSNumber numberWithUnsignedLong:a1];
  v17[2] = v9;
  v16[3] = *MEMORY[0x263F04118];
  uint64_t v10 = [NSNumber numberWithUnsignedLong:a2];
  v16[4] = *MEMORY[0x263F04158];
  v17[3] = v10;
  void v17[4] = MEMORY[0x263EFFA88];
  CFDictionaryRef v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];

  uint64_t v12 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v11, a4);
  if (v12)
  {
    CFAllocatorRef v13 = JFXLog_matting();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEFAULT, "Unable to create pixelbuffer pool", v15, 2u);
    }

    *a4 = 0;
  }

  return v12;
}

uint64_t JFXConvertFloatDepthImageToFixedPointAtQuarterResolution(__CVBuffer *a1, int32x4_t *a2)
{
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  long long v18 = 0u;
  long long v19 = 0u;
  JFXToVImage(a1, (uint64_t)&v18);
  unint64_t v4 = v19;
  if ((void)v19) {
    BOOL v5 = (v19 & 7) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5) {
    JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_1();
  }
  if (*((void *)&v18 + 1)) {
    BOOL v6 = (BYTE8(v18) & 3) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_2();
  }
  if (*((void *)&v19 + 1) < (unint64_t)(4 * v19)) {
    JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_3();
  }
  if (*((void *)&v18 + 1) >= 4uLL)
  {
    uint64_t v7 = 0;
    size_t v8 = (const float *)v18;
    unint64_t v9 = (unint64_t)v19 >> 3;
    uint64_t v10 = *((void *)&v18 + 1) >> 2;
    uint64_t v11 = 4 * *((void *)&v19 + 1);
    if ((unint64_t)v19 >> 3 <= 1) {
      unint64_t v9 = 1;
    }
    float32x4_t v12 = (float32x4_t)vdupq_n_s32(0x447A0000u);
    do
    {
      CFAllocatorRef v13 = v8;
      CFNumberRef v14 = a2;
      unint64_t v15 = v9;
      if (v4 >= 8)
      {
        do
        {
          unsigned long long v16 = (unsigned __int128)vld2q_f32(v13);
          v13 += 8;
          *v14++ = vcvtq_s32_f32(vmulq_f32((float32x4_t)v16, v12));
          --v15;
        }
        while (v15);
      }
      ++v7;
      a2 = (int32x4_t *)((char *)a2 + ((2 * v4) & 0xFFFFFFFFFFFFFFFCLL));
      size_t v8 = (const float *)((char *)v8 + v11);
    }
    while (v7 != v10);
  }
  return CVPixelBufferUnlockBaseAddress(a1, 1uLL);
}

uint64_t JFXConvertFloatDepthImageToFixedPointAndTranspose(__CVBuffer *a1, int32x4_t *a2)
{
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  long long v28 = 0u;
  long long v29 = 0u;
  JFXToVImage(a1, (uint64_t)&v28);
  unint64_t v4 = v29;
  if (*((void *)&v29 + 1) != 4 * (void)v29) {
    JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_4();
  }
  if ((void)v29) {
    BOOL v5 = (v29 & 3) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5) {
    JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_1();
  }
  unint64_t v6 = *((void *)&v28 + 1);
  if (!*((void *)&v28 + 1) || (BYTE8(v28) & 3) != 0) {
    JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_2();
  }
  uint64_t v7 = v28;
  if ((int32x4_t *)v28 == a2) {
    JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_3();
  }
  unint64_t v8 = 0;
  unint64_t v9 = (unint64_t)v29 >> 2;
  uint64_t v10 = *((void *)&v28 + 1) >> 2;
  if ((unint64_t)v29 >> 2 <= 1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = (unint64_t)v29 >> 2;
  }
  uint64_t v12 = v28 + 48 * v9;
  unint64_t v13 = v9 << 6;
  uint64_t v14 = v28 + 32 * v9;
  float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  uint64_t v16 = v28 + 16 * v9;
  do
  {
    if (v4 >= 4)
    {
      uint64_t v17 = 0;
      long long v18 = a2;
      do
      {
        int32x4_t v19 = *(int32x4_t *)(v7 + 16 * v17);
        int32x4_t v20 = *(int32x4_t *)(v16 + 16 * v17);
        int32x4_t v21 = *(int32x4_t *)(v14 + 16 * v17);
        int32x4_t v22 = *(int32x4_t *)(v12 + 16 * v17);
        int32x4_t v23 = vzip1q_s32(v19, v21);
        int32x4_t v24 = vzip2q_s32(v19, v21);
        int32x4_t v25 = vzip1q_s32(v20, v22);
        int32x4_t v26 = vzip2q_s32(v20, v22);
        int32x4_t *v18 = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(v23, v25), v15));
        v18[v10] = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v23, v25), v15));
        v18[2 * v10] = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(v24, v26), v15));
        v18[3 * (v6 >> 2)] = vcvtq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v24, v26), v15));
        ++v17;
        v18 += 4 * v10;
      }
      while (v11 != v17);
    }
    v8 += 4;
    v12 += v13;
    v14 += v13;
    v16 += v13;
    v7 += v13;
    ++a2;
  }
  while (v8 < v6);
  return CVPixelBufferUnlockBaseAddress(a1, 1uLL);
}

double JFXRemappedAverageDepth(int a1)
{
  return (100.0 - fmax(fmin(((double)a1 + -250.0) / 3.0, 100.0), 0.0)) / 100.0;
}

CVPixelBufferRef copyFloatDepthBufferToL010(__CVBuffer *a1, __CVPixelBufferPool *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBuffer = 0;
  CVPixelBufferPoolRef pixelBufferPool = 0;
  if (!a1)
  {
    unint64_t v8 = JFXLog_matting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v9 = "Error: src raw depth is invalid (null)";
LABEL_7:
      uint64_t v10 = v8;
      uint32_t v11 = 2;
LABEL_10:
      _os_log_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
LABEL_11:

    goto LABEL_12;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1717855600)
  {
    OSType v12 = PixelFormatType;
    unint64_t v8 = JFXLog_matting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      OSType v27 = HIBYTE(v12);
      __int16 v28 = 1024;
      OSType v29 = HIWORD(v12);
      __int16 v30 = 1024;
      OSType v31 = v12 >> 8;
      __int16 v32 = 1024;
      OSType v33 = v12;
      unint64_t v9 = "Error: can't create 'L010' quantized depth buffer for pixelFormat %c%c%c%c";
      uint64_t v10 = v8;
      uint32_t v11 = 26;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (a2)
  {
    CVPixelBufferPoolRef pixelBufferPool = a2;
    goto LABEL_14;
  }
  JFXCreatePixelBufferPool(Width, Height, 1278226736, &pixelBufferPool);
  a2 = pixelBufferPool;
  if (!pixelBufferPool)
  {
    unint64_t v8 = JFXLog_matting();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    unint64_t v9 = "Error: could not create pixelbuffer pool";
    goto LABEL_7;
  }
LABEL_14:
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, &pixelBuffer);
  if (pixelBuffer)
  {
    size_t v14 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    if (Height)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      for (uint64_t i = 0; i != Height; ++i)
      {
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
        int32x4_t v19 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (Width)
        {
          int32x4_t v20 = &v19[v16];
          int32x4_t v21 = (float *)&BaseAddress[v15];
          size_t v22 = Width;
          do
          {
            float v23 = *v21++;
            *(_WORD *)int32x4_t v20 = vcvtms_s32_f32((float)(fminf(fmaxf(v23, 0.0), 1.0) * 65535.0) + 0.5) & 0xFFC0;
            v20 += 2;
            --v22;
          }
          while (v22);
        }
        v16 += v14;
        v15 += BytesPerRow;
      }
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_12:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copyBGRAToFloatDepthBuffer(__CVBuffer *a1, __CVPixelBufferPool *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBuffer = 0;
  CVPixelBufferPoolRef pixelBufferPool = 0;
  if (!a1)
  {
    unint64_t v8 = JFXLog_matting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v9 = "Error: 10-bit quantized src depth is invalid (null)";
LABEL_7:
      uint64_t v10 = v8;
      uint32_t v11 = 2;
LABEL_10:
      _os_log_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
LABEL_11:

    goto LABEL_12;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1111970369)
  {
    OSType v12 = PixelFormatType;
    unint64_t v8 = JFXLog_matting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      OSType v23 = HIBYTE(v12);
      __int16 v24 = 1024;
      OSType v25 = HIWORD(v12);
      __int16 v26 = 1024;
      OSType v27 = v12 >> 8;
      __int16 v28 = 1024;
      OSType v29 = v12;
      unint64_t v9 = "Error: wrong pixelFormat %c%c%c%c expect 'L010'.";
      uint64_t v10 = v8;
      uint32_t v11 = 26;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (a2)
  {
    CVPixelBufferPoolRef pixelBufferPool = a2;
    goto LABEL_14;
  }
  JFXCreatePixelBufferPool(Width, Height, 1717855600, &pixelBufferPool);
  a2 = pixelBufferPool;
  if (!pixelBufferPool)
  {
    unint64_t v8 = JFXLog_matting();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    unint64_t v9 = "Error: could not create pixelbuffer pool";
    goto LABEL_7;
  }
LABEL_14:
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, &pixelBuffer);
  if (pixelBuffer)
  {
    size_t v14 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    if (Height)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      size_t v17 = 4 * Width;
      do
      {
        long long v18 = (char *)CVPixelBufferGetBaseAddress(a1) + v15;
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        memcpy(&BaseAddress[v16], v18, v17);
        v16 += v14;
        v15 += BytesPerRow;
        --Height;
      }
      while (Height);
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_12:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copyL010ToFloatDepthBuffer(__CVBuffer *a1, __CVPixelBufferPool *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBuffer = 0;
  CVPixelBufferPoolRef pixelBufferPool = 0;
  if (!a1)
  {
    unint64_t v8 = JFXLog_matting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v9 = "Error: 10-bit quantized src depth is invalid (null)";
LABEL_7:
      uint64_t v10 = v8;
      uint32_t v11 = 2;
LABEL_10:
      _os_log_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
LABEL_11:

    goto LABEL_12;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1278226736)
  {
    OSType v12 = PixelFormatType;
    unint64_t v8 = JFXLog_matting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      OSType v29 = HIBYTE(v12);
      __int16 v30 = 1024;
      OSType v31 = HIWORD(v12);
      __int16 v32 = 1024;
      OSType v33 = v12 >> 8;
      __int16 v34 = 1024;
      OSType v35 = v12;
      unint64_t v9 = "Error: wrong pixelFormat %c%c%c%c expect 'L010'.";
      uint64_t v10 = v8;
      uint32_t v11 = 26;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  if (a2)
  {
    CVPixelBufferPoolRef pixelBufferPool = a2;
    goto LABEL_14;
  }
  JFXCreatePixelBufferPool(Width, Height, 1717855600, &pixelBufferPool);
  a2 = pixelBufferPool;
  if (!pixelBufferPool)
  {
    unint64_t v8 = JFXLog_matting();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    unint64_t v9 = "Error: could not create pixelbuffer pool";
    goto LABEL_7;
  }
LABEL_14:
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, &pixelBuffer);
  if (pixelBuffer)
  {
    size_t v14 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    if (Height)
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      for (uint64_t i = 0; i != Height; ++i)
      {
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
        int32x4_t v19 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (Width)
        {
          int32x4_t v20 = (float *)&v19[v16];
          int32x4_t v21 = &BaseAddress[v15];
          size_t v22 = Width;
          do
          {
            unsigned int v23 = *(unsigned __int16 *)v21;
            v21 += 2;
            float v24 = (double)v23 * 0.0000152590219;
            float v25 = v24 + 0.0;
            if (!v23) {
              float v25 = NAN;
            }
            *v20++ = v25;
            --v22;
          }
          while (v22);
        }
        v16 += v14;
        v15 += BytesPerRow;
      }
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_12:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copyDepthToHalfWidthHalfHeight(__CVBuffer *a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBuffer = 0;
  CVPixelBufferPoolRef pixelBufferPool = 0;
  if (!a1)
  {
    int32x4_t v20 = JFXLog_matting();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int32x4_t v21 = "Error: 'fdep' src depth is invalid (null)";
LABEL_22:
      unsigned int v23 = v20;
      uint32_t v24 = 2;
      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1717855600)
  {
    OSType v22 = PixelFormatType;
    int32x4_t v20 = JFXLog_matting();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      OSType v29 = HIBYTE(v22);
      __int16 v30 = 1024;
      OSType v31 = HIWORD(v22);
      __int16 v32 = 1024;
      OSType v33 = v22 >> 8;
      __int16 v34 = 1024;
      OSType v35 = v22;
      int32x4_t v21 = "Error: wrong pixelFormat %c%c%c%c expect 'fdep'.";
      unsigned int v23 = v20;
      uint32_t v24 = 26;
LABEL_23:
      _os_log_impl(&dword_234C41000, v23, OS_LOG_TYPE_DEFAULT, v21, buf, v24);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  unint64_t v5 = Width >> 1;
  unint64_t v6 = Height >> 1;
  JFXCreatePixelBufferPool(Width >> 1, Height >> 1, 1717855600, &pixelBufferPool);
  if (!pixelBufferPool)
  {
    int32x4_t v20 = JFXLog_matting();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int32x4_t v21 = "Error: unable to create pixelbuffer pool";
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], pixelBufferPool, &pixelBuffer);
  if (pixelBuffer)
  {
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    size_t v8 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    if (Height >= 2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 2 * BytesPerRow;
      if (v5 <= 1) {
        unint64_t v5 = 1;
      }
      if (v6 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v6;
      }
      do
      {
        BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
        uint64_t v15 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (Width >= 2)
        {
          uint64_t v16 = &v15[v10];
          size_t v17 = &BaseAddress[v9];
          unint64_t v18 = v5;
          do
          {
            int v19 = *(_DWORD *)v17;
            v17 += 8;
            *(_DWORD *)uint64_t v16 = v19;
            v16 += 4;
            --v18;
          }
          while (v18);
        }
        ++v11;
        v10 += v8;
        v9 += v12;
      }
      while (v11 != v13);
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_25:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copyDepthToDoubleWidthDoubleHeight(__CVBuffer *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBuffer = 0;
  CVPixelBufferPoolRef pixelBufferPool = 0;
  if (!a1)
  {
    uint64_t v16 = JFXLog_matting();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      size_t v17 = "Error: 'fdep' src depth is invalid (null)";
LABEL_19:
      int v19 = v16;
      uint32_t v20 = 2;
      goto LABEL_20;
    }
LABEL_21:

    goto LABEL_22;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if (PixelFormatType != 1717855600)
  {
    OSType v18 = PixelFormatType;
    uint64_t v16 = JFXLog_matting();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      OSType v25 = HIBYTE(v18);
      __int16 v26 = 1024;
      OSType v27 = HIWORD(v18);
      __int16 v28 = 1024;
      OSType v29 = v18 >> 8;
      __int16 v30 = 1024;
      OSType v31 = v18;
      size_t v17 = "Error: wrong pixelFormat %c%c%c%c expect 'fdep'.";
      int v19 = v16;
      uint32_t v20 = 26;
LABEL_20:
      _os_log_impl(&dword_234C41000, v19, OS_LOG_TYPE_DEFAULT, v17, buf, v20);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  JFXCreatePixelBufferPool(2 * Width, 2 * Height, 1717855600, &pixelBufferPool);
  if (!pixelBufferPool)
  {
    uint64_t v16 = JFXLog_matting();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      size_t v17 = "Error: could not create pixelbuffer pool";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], pixelBufferPool, &pixelBuffer);
  if (pixelBuffer)
  {
    if ((CVPixelBufferGetBytesPerRow(a1) & 3) != 0) {
      copyDepthToDoubleWidthDoubleHeight_cold_2();
    }
    if ((CVPixelBufferGetBytesPerRow(pixelBuffer) & 3) != 0) {
      copyDepthToDoubleWidthDoubleHeight_cold_1();
    }
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    size_t v6 = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
    size_t v8 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    if (Height)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8 + 4;
      do
      {
        uint64_t v11 = v10;
        uint64_t v12 = (int *)BaseAddress;
        for (size_t i = Width; i; --i)
        {
          int v14 = *v12++;
          *(v11 - 1) = v14;
          *uint64_t v11 = v14;
          uint64_t v15 = &v11[v6 >> 2];
          *(v15 - 1) = v14;
          *uint64_t v15 = v14;
          v11 += 2;
        }
        ++v9;
        BaseAddress += 4 * (BytesPerRow >> 2);
        v10 += 2 * (v6 >> 2);
      }
      while (v9 != Height);
    }
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  }
LABEL_22:
  CVPixelBufferPoolRelease(pixelBufferPool);
  return pixelBuffer;
}

CVPixelBufferRef copySimulatedL010RoundtripImage(__CVBuffer *a1)
{
  CFDictionaryRef v1 = copyFloatDepthBufferToL010(a1, 0);
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    CVPixelBufferRef v3 = copyL010ToFloatDepthBuffer(v1, 0);
    CVPixelBufferRelease(v2);
    return v3;
  }
  else
  {
    unint64_t v5 = JFXLog_matting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)size_t v6 = 0;
      _os_log_impl(&dword_234C41000, v5, OS_LOG_TYPE_DEFAULT, "Error: copySimulatedL010RoundtripImage got null tmpImage", v6, 2u);
    }

    return 0;
  }
}

float calculatePSNRForDepthImage(__CVBuffer *a1, __CVBuffer *a2)
{
  int Width = CVPixelBufferGetWidth(a1);
  int Height = CVPixelBufferGetHeight(a1);
  if (CVPixelBufferGetPixelFormatType(a1) != 1717855600)
  {
    unsigned int v23 = JFXLog_matting();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    __int16 v31 = 0;
    uint32_t v24 = "calculatePSNRForDepthImage received image with unexpected pixel format";
    OSType v25 = (uint8_t *)&v31;
LABEL_18:
    _os_log_impl(&dword_234C41000, v23, OS_LOG_TYPE_DEFAULT, v24, v25, 2u);
    goto LABEL_19;
  }
  if (CVPixelBufferGetPixelFormatType(a2) != 1717855600)
  {
    unsigned int v23 = JFXLog_matting();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    __int16 v30 = 0;
    uint32_t v24 = "calculatePSNRForDepthImage received image with unexpected pixel format";
    OSType v25 = (uint8_t *)&v30;
    goto LABEL_18;
  }
  if (!Width || !Height)
  {
    unsigned int v23 = JFXLog_matting();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint32_t v24 = "calculatePSNRForDepthImage received image with unexpected dimension";
      OSType v25 = buf;
      goto LABEL_18;
    }
LABEL_19:

    return 0.0;
  }
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  int v7 = CVPixelBufferGetBytesPerRow(a2);
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  int v28 = Height;
  if (Height < 1)
  {
    float v14 = 0.0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = (uint64_t)v7 >> 2;
    uint64_t v12 = Height;
    uint64_t v13 = 4 * v11;
    float v14 = 0.0;
    uint64_t v15 = 4 * ((uint64_t)BytesPerRow >> 2);
    do
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
      size_t v17 = (char *)CVPixelBufferGetBaseAddress(a2);
      if (Width >= 1)
      {
        OSType v18 = (float *)&v17[v9];
        int v19 = (float *)&BaseAddress[v8];
        uint64_t v20 = Width;
        do
        {
          float v21 = fminf(fmaxf(*v19, 0.0), 1.0);
          float v22 = fminf(fmaxf(*v18, 0.0), 1.0);
          float v14 = v14 + (float)((float)(v21 - v22) * (float)(v21 - v22));
          ++v18;
          ++v19;
          --v20;
        }
        while (v20);
      }
      ++v10;
      v9 += v13;
      v8 += v15;
    }
    while (v10 != v12);
  }
  float v26 = log10f(v14 / (float)(v28 * Width)) * -10.0 + 0.0;
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return v26;
}

float calculateDepthShadowPSNRForDepthImage(__CVBuffer *a1, __CVBuffer *a2)
{
  int Width = CVPixelBufferGetWidth(a1);
  int Height = CVPixelBufferGetHeight(a1);
  if (CVPixelBufferGetPixelFormatType(a1) != 1717855600)
  {
    uint64_t v20 = JFXLog_matting();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    __int16 v27 = 0;
    float v21 = "calculatePSNRForDepthImage received image with unexpected pixel format";
    float v22 = (uint8_t *)&v27;
LABEL_18:
    _os_log_impl(&dword_234C41000, v20, OS_LOG_TYPE_DEFAULT, v21, v22, 2u);
    goto LABEL_19;
  }
  if (CVPixelBufferGetPixelFormatType(a2) != 1717855600)
  {
    uint64_t v20 = JFXLog_matting();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    __int16 v26 = 0;
    float v21 = "calculatePSNRForDepthImage received image with unexpected pixel format";
    float v22 = (uint8_t *)&v26;
    goto LABEL_18;
  }
  if (!Width || !Height)
  {
    uint64_t v20 = JFXLog_matting();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      float v21 = "calculatePSNRForDepthImage received image with unexpected dimension";
      float v22 = buf;
      goto LABEL_18;
    }
LABEL_19:

    return 0.0;
  }
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  int v7 = CVPixelBufferGetBytesPerRow(a2);
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  if (Height >= 1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = (uint64_t)BytesPerRow >> 2;
    uint64_t v12 = Height;
    uint64_t v13 = 4 * ((uint64_t)v7 >> 2);
    uint64_t v14 = 4 * v11;
    do
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
      uint64_t v16 = (char *)CVPixelBufferGetBaseAddress(a2);
      if (Width >= 1)
      {
        size_t v17 = &v16[v9];
        OSType v18 = &BaseAddress[v8];
        uint64_t v19 = Width;
        do
        {
          v17 += 4;
          v18 += 4;
          --v19;
        }
        while (v19);
      }
      ++v10;
      v9 += v13;
      v8 += v14;
    }
    while (v10 != v12);
  }
  float v23 = log10f(0.0 / (float)0) * -10.0 + 0.0;
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return v23;
}

void sub_234D1FA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_234D1FCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)JFXRGBDMatte;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_234D1FFC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234D20648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t DepthProcessingDataRGBD::getFaceDepthFromPortrait(DepthProcessingDataRGBD *this, CGRect a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int var4 = this->var4;
  unint64_t var3 = this->var3;
  int v5 = (int)(a2.size.width * ((double)var4 * 0.5) + (double)var4 * a2.origin.x);
  int v6 = (int)(a2.size.height * ((double)(int)var3 * 0.5) + (double)(int)var3 * a2.origin.y);
  if (v6 <= 5) {
    unsigned int v7 = 5;
  }
  else {
    unsigned int v7 = (int)(a2.size.height * ((double)(int)var3 * 0.5) + (double)(int)var3 * a2.origin.y);
  }
  if (v5 <= 5) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = v5;
  }
  if ((int)var3 - 1 >= v6 + 5) {
    int v9 = v6 + 5;
  }
  else {
    int v9 = var3 - 1;
  }
  int v10 = var4 - 1;
  if (v10 >= v5 + 5) {
    int v11 = v5 + 5;
  }
  else {
    int v11 = v10;
  }
  uint64_t v12 = JFXLog_DebugMatting();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 67109376;
    int v23 = v6;
    __int16 v24 = 1024;
    int v25 = v5;
    _os_log_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEFAULT, "Nose at %d,%d in rotated depth coordinates (i.e. portrait)", (uint8_t *)&v22, 0xEu);
  }

  if ((int)v8 - 5 > v11)
  {
    LODWORD(v13) = 0;
    int v14 = 1;
LABEL_24:
    uint64_t v13 = ((int)v13 / v14);
    goto LABEL_25;
  }
  uint64_t v13 = 0;
  uint64_t v15 = v8 - 5;
  uint64_t v16 = &this->var2[(v8 - 5) * (int)var3 - 5 + v7];
  int v14 = 1;
  do
  {
    int v17 = v9 - v7 + 6;
    OSType v18 = v16;
    if ((int)(v7 - 5) <= v9)
    {
      do
      {
        int v19 = *v18++;
        uint64_t v13 = (v19 + v13);
        if (v19) {
          ++v14;
        }
        --v17;
      }
      while (v17);
    }
    ++v15;
    v16 += (int)var3;
  }
  while (v11 + 1 != v15);
  if (v14) {
    goto LABEL_24;
  }
LABEL_25:
  uint64_t v20 = JFXLog_DebugMatting();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 67109120;
    int v23 = v13;
    _os_log_impl(&dword_234C41000, v20, OS_LOG_TYPE_DEFAULT, "RGBD facedepth=%d", (uint8_t *)&v22, 8u);
  }

  return v13;
}

void sub_234D21750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_234D21A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_234D21F98(_Unwind_Exception *a1, void *a2, ...)
{
  va_start(va, a2);

  ContourProcessing::~ContourProcessing((ContourProcessing *)va);
  _Unwind_Resume(a1);
}

void sub_234D223F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_234D22740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void DispatchContextRGBDSensoGrabCut(int *a1)
{
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v1 = *((void *)a1 + 3);
  CVPixelBufferRef v3 = (double *)*((void *)a1 + 4);
  double v4 = *v3;
  double v5 = v3[1];
  double v6 = v3[2];
  double v7 = v3[3];
  int v8 = a1[11];
  size_t v9 = a1[10];
  int v10 = a1[12];
  uint64_t v11 = *((void *)a1 + 1);
  id v12 = *(id *)a1;
  int v13 = (int)v7 / v10;
  int v14 = (int)v6;
  int v15 = (int)v7 - v13 * (v10 - 1);
  if (v8 != v10 - 1) {
    int v15 = (int)v7 / v10;
  }
  int v16 = (int)v5 + v13 * v8;
  int v17 = (void *)(v1 + (int)v9 * (uint64_t)v16);
  CVPixelBufferRef texture = 0;
  size_t v18 = v14;
  size_t v19 = v15;
  CVPixelBufferCreateWithBytes(0, v14, v15, 0x42475241u, v17, v9, 0, 0, 0, &texture);
  uint64_t v20 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:texture];
  CVPixelBufferRelease(texture);
  int v21 = v16 * v14;
  CVPixelBufferRef v26 = 0;
  CVPixelBufferCreateWithBytes(0, v18, v19, 0x4C303038u, (void *)(v11 + v21), v18, 0, 0, 0, &v26);
  int v22 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:v26];
  CVPixelBufferRelease(v26);
  CVPixelBufferRef v25 = 0;
  CVPixelBufferCreateWithBytes(0, v18, v19, 0x4C303038u, (void *)(v2 + v21), v18, 0, 0, 0, &v25);
  int v23 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:v25];
  CVPixelBufferRelease(v25);
  LODWORD(v24) = 1112014848;
  objc_msgSend(v12, "processImage:trimap:roi:clusters:gamma:iterations:mask:", v20, v22, 5, 1, v23, v4, v5, v6, v7, v24);
}

void sub_234D229A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234D22C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

DepthProcessingDataRGBD *DepthProcessingDataRGBD::depthHistogram(DepthProcessingDataRGBD *this, int *a2)
{
  int var2 = this->var2;
  *((_OWORD *)a2 + 23) = 0u;
  *((_OWORD *)a2 + 24) = 0u;
  *((_OWORD *)a2 + 21) = 0u;
  *((_OWORD *)a2 + 22) = 0u;
  *((_OWORD *)a2 + 19) = 0u;
  *((_OWORD *)a2 + 20) = 0u;
  *((_OWORD *)a2 + 17) = 0u;
  *((_OWORD *)a2 + 18) = 0u;
  *((_OWORD *)a2 + 15) = 0u;
  *((_OWORD *)a2 + 16) = 0u;
  *((_OWORD *)a2 + 13) = 0u;
  *((_OWORD *)a2 + 14) = 0u;
  *((_OWORD *)a2 + 11) = 0u;
  *((_OWORD *)a2 + 12) = 0u;
  *((_OWORD *)a2 + 9) = 0u;
  *((_OWORD *)a2 + 10) = 0u;
  *((_OWORD *)a2 + 7) = 0u;
  *((_OWORD *)a2 + 8) = 0u;
  *((_OWORD *)a2 + 5) = 0u;
  *((_OWORD *)a2 + 6) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *(_OWORD *)a2 = 0u;
  unint64_t var4 = this->var4;
  if (var4)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unint64_t var3 = this->var3;
    do
    {
      if (var3)
      {
        v4 += var3;
        unint64_t v7 = var3;
        int v8 = var2;
        do
        {
          int v10 = *v8++;
          int v9 = v10;
          if (v10)
          {
            if (v9 <= 999)
            {
              int v11 = v9 / 10;
              this = (DepthProcessingDataRGBD *)(a2[v11] + 1);
              a2[v11] = (int)this;
            }
          }
          --v7;
        }
        while (v7);
      }
      ++v5;
      var2 += var3;
    }
    while (v5 != var4);
  }
  return this;
}

__objc2_meth_list **DepthProcessingDataRGBD::fillHolesInSource(DepthProcessingDataRGBD *this, CGRect a2, UIInterfaceOrientation a3)
{
  double width = a2.size.width;
  double x = a2.origin.x;
  int var2 = this->var2;
  unint64_t var3 = this->var3;
  unint64_t var4 = this->var4;
  size_t result = (__objc2_meth_list **)isFaceBoundingBoxValid(a2.origin.x, a2.origin.y, a2.size.width, a2.size.height);
  if (result && var4 << 32)
  {
    unint64_t v10 = 0;
    unint64_t v11 = (unint64_t)(int)var3 >> 2;
    unint64_t v12 = a3 - 1;
    uint64_t v13 = (int)var4;
    double v14 = x + width * -0.1;
    if (a3 != UIInterfaceOrientationPortraitUpsideDown) {
      double v14 = x + width * -0.45;
    }
    int v15 = (int)(v14 * (double)(int)var4);
    double v16 = x + width * 1.3;
    if (a3 != UIInterfaceOrientationPortraitUpsideDown) {
      double v16 = x + width * 0.9;
    }
    if ((unint64_t)(int)var3 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = (int)var3;
    }
    if ((unint64_t)(int)var4 <= 1) {
      uint64_t v13 = 1;
    }
    size_t result = &OBJC_PROTOCOL___IMAAppPresenterDelegate.class_meths;
    size_t v18 = var2;
    do
    {
      if ((v10 > (int)(v16 * (double)(int)var4) || v10 < v15 || v12 >= 2) && var3 << 32 != 0)
      {
        unint64_t v22 = 0;
        int v23 = &var2[v10 * v11];
        while (1)
        {
          int v24 = v18[v22];
          unint64_t v25 = v22 + 1;
          if (v24) {
            break;
          }
          ++v22;
          if (v17 == v25) {
            goto LABEL_44;
          }
        }
        if (v25 < (int)var3)
        {
          int v26 = 0;
          do
          {
            unint64_t v27 = v22;
            unint64_t v22 = v25;
            int v28 = v23[v25];
            if (v28)
            {
              if (v26)
              {
                int v29 = v28 >= v24 ? v24 : v28;
                if (v26 < DepthProcessingDataRGBD::fillHolesInSource(CGRect,UIInterfaceOrientation)::kMaxRun
                  && v29 <= 399)
                {
                  if (v24 <= v28) {
                    int v24 = v28;
                  }
                  uint64_t v30 = 4 * v26;
                  if (v30 >= 1)
                  {
                    __int16 v31 = &v23[v27 - v26];
                    unint64_t v32 = ((unint64_t)v30 >> 2) + 1;
                    do
                    {
                      *v31++ = v24;
                      --v32;
                    }
                    while (v32 > 1);
                  }
                  int v26 = 0;
                  int v24 = v28;
                }
              }
            }
            else
            {
              ++v26;
            }
            unint64_t v25 = v22 + 1;
          }
          while (v22 + 1 != (int)var3);
        }
      }
LABEL_44:
      ++v10;
      v18 += v11;
    }
    while (v10 != v13);
  }
  return result;
}

void DepthProcessingDataRGBD::setAverageDepthAndSegment(DepthProcessingDataRGBD *this, int a2)
{
  size_t v4 = this->var8 * this->var9;
  bzero(this->var10, v4);
  bzero(this->var11, v4);
  if (!v4)
  {
    int v6 = 0;
    int v7 = 1;
LABEL_11:
    int v9 = v6 / v7;
    goto LABEL_12;
  }
  uint64_t v5 = 0;
  int v6 = 0;
  int v7 = 1;
  do
  {
    int v8 = this->var2[v5];
    if (v8)
    {
      if (v8 < a2)
      {
        this->var11[v5] = -1;
        this->var10[v5] = -1;
        ++v7;
        v6 += v8;
      }
    }
    else
    {
      this->var11[v5] = -1;
    }
    ++v5;
  }
  while (v4 != v5);
  if (v7) {
    goto LABEL_11;
  }
  int v9 = 0;
LABEL_12:
  this->var15 = v9;
}

void sub_234D23764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, ...)
{
  va_start(va, a4);
  ContourProcessing::~ContourProcessing((ContourProcessing *)va);

  _Unwind_Resume(a1);
}

void sub_234D2386C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void DepthProcessingDataRGBD::DepthProcessingDataRGBD(DepthProcessingDataRGBD *this, unint64_t a2, unint64_t a3, int a4)
{
  this->var7 = 0;
  this->var8 = a2;
  this->var9 = a3;
  if (a4)
  {
    this->unint64_t var3 = a2 >> 1;
    this->unint64_t var4 = a3 >> 2;
    operator new[]();
  }
  this->unint64_t var3 = a3;
  this->unint64_t var4 = a2;
  this->$3CC8671D27C23BF42ADDB32F2B5E48AE var5 = 0;
  this->var6 = 0;
  size_t v5 = a3 * a2;
  if (malloc_type_posix_memalign((void **)&this->var10, 0x40uLL, a3 * a2, 0xB1FAB7CDuLL))
  {
    int v6 = "!posix_memalign( (void**)&_depthData, kAlignment, sizeof(unsigned char) * w * h)";
    int v7 = 76;
  }
  else if (malloc_type_posix_memalign((void **)&this->var11, 0x40uLL, v5, 0x1209EE89uLL))
  {
    int v6 = "!posix_memalign( (void**)&_depthOuter, kAlignment, sizeof(unsigned char) * w * h)";
    int v7 = 77;
  }
  else
  {
    if (!malloc_type_posix_memalign((void **)&this->var2, 0x40uLL, 4 * this->var3 * this->var4, 0x6E3555A5uLL)) {
      operator new[]();
    }
    int v6 = "!posix_memalign( (void**)&_depthDataBufferInt, kAlignment, sizeof(int) * _subWidth * _subHeight)";
    int v7 = 78;
  }
  __assert_rtn("DepthProcessingDataRGBD", "JFXDepthProcessingData.hpp", v7, v6);
}

void sub_234D23B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CPPCVPixelBufferReleaseBytesCallback(void *a1, const void *a2)
{
  if (a2) {
    JUMPOUT(0x237DD0F10);
  }
}

void DepthProcessingDataRGBD::~DepthProcessingDataRGBD(DepthProcessingDataRGBD *this)
{
  free(this->var10);
  free(this->var11);
  free(this->var2);
  if (this->var0) {
    MEMORY[0x237DD0F10](this->var0, 0x1000C8052888210);
  }
  var1 = this->var1;
  if (var1) {
    MEMORY[0x237DD0F10](var1, 0x1000C8052888210);
  }
  CVPixelBufferRelease(this->var5);
  id var7 = this->var7;
  this->id var7 = 0;
}

dispatch_queue_t JFXCreateDispatchQueue(void *a1, void *a2, void *a3)
{
  size_t v5 = (void *)MEMORY[0x263F086E0];
  int v6 = a3;
  id v7 = a2;
  id v8 = a1;
  int v9 = [v5 jfxBundle];
  unint64_t v10 = [v9 bundleIdentifier];

  unint64_t v11 = (objc_class *)objc_opt_class();
  unint64_t v12 = NSStringFromClass(v11);
  uint64_t v13 = [NSString stringWithFormat:@"%@.%@.%@", v10, v12, v7];

  id v14 = v13;
  dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], v6);

  return v15;
}

#error "234D25F2C: call analysis failed (funcsize=336)"

float64x2_t transformInfoWithWorldToViewTransform@<Q0>(long long *a1@<X0>, uint64_t a2@<X8>, float64x2_t a3@<Q0>, long long a4, long long a5, long long a6, long long a7, long long a8, long long a9, long long a10, long long a11, long long a12, long long a13, long long a14, long long a15, long long a16, long long a17, long long a18, long long a19)
{
  uint64_t v20 = 0;
  long long v21 = a1[5];
  __asm { FMOV            V1.2D, #-0.5 }
  float64x2_t v27 = vmulq_f64(a3, _Q1);
  a16 = a1[4];
  a17 = v21;
  long long v28 = a1[7];
  a18 = a1[6];
  a19 = v28;
  long long v29 = a1[1];
  a12 = *a1;
  a13 = v29;
  long long v30 = a1[3];
  a14 = a1[2];
  a15 = v30;
  a4 = 0u;
  a5 = 0u;
  a6 = 0u;
  a7 = 0u;
  a8 = 0u;
  a9 = 0u;
  a10 = 0u;
  a11 = 0u;
  do
  {
    float64x2_t v32 = *(float64x2_t *)((char *)&a12 + v20);
    float64x2_t v31 = *(float64x2_t *)((char *)&a12 + v20 + 16);
    OSType v33 = (float64x2_t *)((char *)&a4 + v20);
    *OSType v33 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_234D61140, v32.f64[0]), (float64x2_t)xmmword_234D61130, v32, 1), (float64x2_t)0, v31.f64[0]), v27, v31, 1);
    v33[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v32.f64[0]), (float64x2_t)0, v32, 1), (float64x2_t)xmmword_234D61140, v31.f64[0]), (float64x2_t)xmmword_234D61130, v31, 1);
    v20 += 32;
  }
  while (v20 != 128);
  __int16 v34 = (_OWORD *)MEMORY[0x263F617E0];
  long long v35 = *(_OWORD *)(MEMORY[0x263F617E0] + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(MEMORY[0x263F617E0] + 64);
  *(_OWORD *)(a2 + 80) = v35;
  long long v36 = v34[7];
  *(_OWORD *)(a2 + 96) = v34[6];
  *(_OWORD *)(a2 + 112) = v36;
  long long v37 = v34[1];
  *(_OWORD *)a2 = *v34;
  *(_OWORD *)(a2 + 16) = v37;
  long long v38 = v34[3];
  *(_OWORD *)(a2 + 32) = v34[2];
  *(_OWORD *)(a2 + 48) = v38;
  a16 = a8;
  a17 = a9;
  a18 = a10;
  a19 = a11;
  a12 = a4;
  a13 = a5;
  a14 = a6;
  a15 = a7;
  pv_transform_info_make();
  __asm { FMOV            V0.2D, #0.5 }
  float64x2_t result = vaddq_f64(vmulq_f64(a3, _Q0), *(float64x2_t *)a2);
  *(float64x2_t *)a2 = result;
  return result;
}

#error "234D26550: call analysis failed (funcsize=199)"

void sub_234D267C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

double JTGetHostTime()
{
  mach_timebase_info info = 0;
  if (*(double *)&JTGetHostTime_timeBaseFactor == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v0) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&JTGetHostTime_timeBaseFactor = (double)v0 / (double)v1 / 1000000000.0;
  }
  return *(double *)&JTGetHostTime_timeBaseFactor * (double)mach_absolute_time();
}

void sub_234D2B260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D2B634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D2BE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D2C59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D2DF10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_234D2EFA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  if (a2 == 1)
  {
    id v32 = objc_begin_catch(exception_object);
    [a31 setStatus:4];
    OSType v33 = JFXLog_export();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __int16 v34 = [v32 description];
      [(JFXReaderWriterExportController *)v34 continueExportAfterDelay];
    }

    [a31 closeSessionWithStatus:2];
    objc_end_catch();
    JUMPOUT(0x234D2EF00);
  }
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_234D2F654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void sub_234D2F8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return *(void *)(v0 + 32);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 type];
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 type];
}

void sub_234D33C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void sub_234D33D90(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_234D33FA4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_234D341C8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_234D3441C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_234D34654(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_234D34974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D34A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D34D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D34EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D353EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D355EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_234D35D54(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_234D364C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D3681C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_234D369EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_234D37278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D380B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_234D383C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_234D386C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_234D3892C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_234D38EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D393E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D39698(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_234D39B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D39D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D39ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D3A0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double OUTLINED_FUNCTION_2_4()
{
  return *(double *)(v0 + 40);
}

double CGPointConvertToNormalizedCoordinateSpace(unint64_t a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if ((a2 - 1) > 2) {
    unsigned int v14 = 1;
  }
  else {
    unsigned int v14 = dword_234D626C0[a2 - 1];
  }
  int v15 = pvViewContentModeForUIViewContentMode(a1);
  uint64_t v16 = v15 - 1;
  if (v16 > 0xB) {
    int v17 = 0;
  }
  else {
    int v17 = dword_234D62690[v16];
  }
  if (v14 == 4)
  {
    double v20 = a5;
    a5 = a6;
    double v18 = a4;
  }
  else
  {
    double v18 = a6 - a4;
    if (v14 == 3)
    {
      double v20 = a5;
      a5 = a6;
    }
    else
    {
      if (v14 == 1) {
        double v19 = a3;
      }
      else {
        double v19 = a5 - a3;
      }
      double v20 = a6;
      double v18 = v19;
    }
  }
  switch(v15)
  {
    case 1:
      if (a5 <= v20)
      {
        double v21 = v20 / a8;
        if (a7 * (v20 / a8) < a5) {
          double v21 = a5 / a7;
        }
      }
      else
      {
        double v21 = a5 / a7;
        if (a8 * (a5 / a7) < v20) {
          double v21 = v20 / a8;
        }
      }
      break;
    case 3:
      a7 = a5;
      goto LABEL_28;
    case 2:
      double v21 = a5 / a7;
      if (a8 * (a5 / a7) > v20) {
        double v21 = v20 / a8;
      }
      break;
    default:
      goto LABEL_28;
  }
  a7 = a7 * v21;
LABEL_28:
  double v22 = *MEMORY[0x263F00148];
  if ((v17 - 1) < 6) {
    double v22 = (a7 - a5) * 0.5;
  }
  switch(v17)
  {
    case 8:
    case 10:
    case 12:
      double v22 = a7 - a5;
      break;
    default:
      return (v18 + v22) / a7;
  }
  return (v18 + v22) / a7;
}

uint64_t orientationRotatedFromPortraitByCardinalAngle(int a1)
{
  if ((a1 - 1) > 2) {
    return 1;
  }
  else {
    return dword_234D626C0[a1 - 1];
  }
}

uint64_t pvViewContentModeForUIViewContentMode(unint64_t a1)
{
  if (a1 > 0xC) {
    return 0;
  }
  else {
    return dword_234D626CC[a1];
  }
}

double CGPointConvertToCoordinateSpace(unint64_t a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a7 * CGPointConvertToNormalizedCoordinateSpace(a1, a2, a3, a4, a5, a6, a7, a8);
}

CGPath *createClosedCGPathWithPoints(void *a1)
{
  id v1 = a1;
  Mutable = CGPathCreateMutable();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __createClosedCGPathWithPoints_block_invoke;
  v4[3] = &__block_descriptor_40_e24_v32__0__NSValue_8Q16_B24l;
  v4[4] = Mutable;
  [v1 enumerateObjectsUsingBlock:v4];

  CGPathCloseSubpath(Mutable);
  return Mutable;
}

void __createClosedCGPathWithPoints_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 CGPointValue];
  id v7 = *(CGPath **)(a1 + 32);
  if (a3)
  {
    CGPathAddLineToPoint(v7, 0, v5, v6);
  }
  else
  {
    CGPathMoveToPoint(v7, 0, v5, v6);
  }
}

CGPathRef createExpandedClosedCGPathWithCGPath(const CGPath *a1, CGFloat a2)
{
  return CGPathCreateCopyByStrokingPath(a1, 0, a2, kCGLineCapRound, kCGLineJoinRound, 0.0);
}

void sub_234D3C3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void sub_234D3C8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void setShapeLayerPathFromPointsWithStyle(void *a1, void *a2, void *a3, void *a4, void *a5, double a6, double a7)
{
  id v13 = a1;
  id v14 = a4;
  id v15 = a5;
  id v16 = a3;
  ClosedCGPathWithPoints = createClosedCGPathWithPoints(a2);
  id v18 = v16;
  id v24 = v13;
  id v19 = v14;
  id v20 = v15;
  uint64_t v21 = [v18 CGColor];

  [v24 setFillColor:v21];
  id v22 = v19;
  uint64_t v23 = [v22 CGColor];

  [v24 setStrokeColor:v23];
  [v24 setLineDashPhase:a6];
  [v24 setLineDashPattern:v20];

  [v24 setLineWidth:a7];
  [v24 setPath:ClosedCGPathWithPoints];

  CGPathRelease(ClosedCGPathWithPoints);
}

void ensureNSublayers(void *a1, unint64_t a2)
{
  id v14 = a1;
  uint64_t v3 = [v14 sublayers];
  if ([v3 count] != a2)
  {
    unint64_t v4 = [v3 count];
    unint64_t v5 = a2 - v4;
    if (a2 > v4)
    {
      do
      {
        CGFloat v6 = [MEMORY[0x263F15880] layer];
        [v14 addSublayer:v6];

        --v5;
      }
      while (v5);
    }
    id v7 = [v14 sublayers];
    unint64_t v8 = [v7 count];

    if (v8 > a2)
    {
      int v9 = [v14 sublayers];
      uint64_t v10 = (void *)[v9 copy];

      uint64_t v11 = [v10 count] - a2;
      if (v11 >= 1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          id v13 = [v10 objectAtIndexedSubscript:i];
          [v13 removeFromSuperlayer];
        }
      }
      uint64_t v3 = v10;
    }
  }
}

BOOL JFXIsCTMCameraMode(uint64_t a1)
{
  return (unint64_t)(a1 - 6) < 4;
}

BOOL JFXIsCTMCroppedCameraMode(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 8;
}

uint64_t JFXCTMCameraModeForAspectRatio(unint64_t a1)
{
  if (a1 > 4) {
    return 9;
  }
  else {
    return qword_234D62770[a1];
  }
}

BOOL JFXIsVideoCameraMode(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 4;
}

uint64_t JFXLowResolutionDevice()
{
  if (JFXLowResolutionDevice_onceToken != -1) {
    dispatch_once(&JFXLowResolutionDevice_onceToken, &__block_literal_global_69);
  }
  return JFXLowResolutionDevice_isLowResolutionDevice;
}

void __JFXLowResolutionDevice_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C5C0] currentDevice];
  int v1 = objc_msgSend(v0, "jfx_cpuFamily");

  if (v1 > 747742333)
  {
    BOOL v2 = v1 == 1741614739;
    int v3 = 747742334;
  }
  else
  {
    BOOL v2 = v1 == -1829029944;
    int v3 = -400654602;
  }
  if (v2 || v1 == v3) {
    JFXLowResolutionDevice_isLowResolutionDevice = 1;
  }
}

uint64_t JFXMediumResolutionDevice()
{
  if (JFXMediumResolutionDevice_onceToken != -1) {
    dispatch_once(&JFXMediumResolutionDevice_onceToken, &__block_literal_global_2_1);
  }
  return JFXMediumResolutionDevice_isMediumResolutionDevice;
}

void __JFXMediumResolutionDevice_block_invoke()
{
  if (JFXLowResolutionDevice_onceToken != -1) {
    dispatch_once(&JFXLowResolutionDevice_onceToken, &__block_literal_global_69);
  }
  if ((JFXLowResolutionDevice_isLowResolutionDevice & 1) == 0)
  {
    uint64_t v0 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v1 = [v0 userInterfaceIdiom];

    if (v1 == 1)
    {
      BOOL v2 = 1;
    }
    else
    {
      int v3 = [MEMORY[0x263F1C5C0] currentDevice];
      int v4 = objc_msgSend(v3, "jfx_cpuFamily");

      unint64_t v5 = [MEMORY[0x263F1C5C0] currentDevice];
      uint64_t v6 = objc_msgSend(v5, "jfx_memorySize");

      BOOL v2 = v4 == 1176831186 && v6 < 3800000000 || v4 == 131287967;
    }
    JFXMediumResolutionDevice_isMediumResolutionDevice = v2;
  }
}

double JFXUncroppedFrameSizeForAspectRatio(unint64_t a1)
{
  if (a1 > 4) {
    uint64_t v1 = 9;
  }
  else {
    uint64_t v1 = qword_234D62770[a1];
  }
  if (aspectRatioIsPortrait(a1)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 3;
  }
  return JFXUncroppedFrameSizeForCameraModeAndOrientation(v1, v2);
}

double JFXUncroppedFrameSizeForCameraModeAndOrientation(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 - 3;
  if ((unint64_t)(a1 - 6) <= 3) {
    return JFXCTMFrameSizeForCameraModeAndOrientation(6, v2 < 2);
  }
  switch(a1)
  {
    case 1:
      BOOL v4 = v2 >= 2;
      double result = 1440.0;
      goto LABEL_13;
    case 2:
    case 4:
      BOOL v4 = v2 >= 2;
      double result = 1280.0;
      double v5 = 720.0;
      goto LABEL_14;
    case 3:
    case 5:
      double result = 1280.0;
      if (v2 >= 2) {
        double result = 720.0;
      }
      if (JFXLowResolutionDevice_onceToken != -1)
      {
        double v6 = result;
        unint64_t v7 = a2 - 3;
        dispatch_once(&JFXLowResolutionDevice_onceToken, &__block_literal_global_69);
        unint64_t v2 = v7;
        double result = v6;
      }
      if (JFXLowResolutionDevice_isLowResolutionDevice) {
        return result;
      }
      BOOL v4 = v2 >= 2;
      double result = 1920.0;
LABEL_13:
      double v5 = 1080.0;
LABEL_14:
      if (v4) {
        double result = v5;
      }
      break;
    default:
      return *MEMORY[0x263F001B0];
  }
  return result;
}

double JFXCTMFrameSizeForCameraModeAndOrientation(uint64_t a1, int a2)
{
  if (JFXCTMFrameSizeForCameraModeAndOrientation_onceToken != -1) {
    dispatch_once(&JFXCTMFrameSizeForCameraModeAndOrientation_onceToken, &__block_literal_global_32_0);
  }
  if ((unint64_t)(a1 - 6) > 2) {
    BOOL v4 = &JFXCTMFrameSizeForCameraModeAndOrientation__1_1_Resolutions;
  }
  else {
    BOOL v4 = off_264C0D460[a1 - 6];
  }
  id v5 = (id)*v4;
  double v6 = [v5 objectAtIndexedSubscript:JFXCTMFrameSizeForCameraModeAndOrientation_quality];
  [v6 CGSizeValue];
  if (a1 == 9) {
    int v9 = 1;
  }
  else {
    int v9 = a2;
  }
  if (v9) {
    double v10 = v7;
  }
  else {
    double v10 = v8;
  }

  return v10;
}

double JFXCroppedFrameSizeForAspectRatio(unint64_t a1)
{
  if (a1 > 4) {
    uint64_t v1 = 9;
  }
  else {
    uint64_t v1 = qword_234D62770[a1];
  }
  if (aspectRatioIsPortrait(a1)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 3;
  }
  return JFXCroppedFrameSizeForCameraModeAndOrientation(v1, v2);
}

double JFXCroppedFrameSizeForCameraModeAndOrientation(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a1 - 6) > 3) {
    return JFXUncroppedFrameSizeForCameraModeAndOrientation(a1, a2);
  }
  else {
    return JFXCTMFrameSizeForCameraModeAndOrientation(a1, (unint64_t)(a2 - 3) < 2);
  }
}

unint64_t JFXMinimumVideoDimensionsForCameraMode(uint64_t a1)
{
  double v1 = 1440.0;
  if ((unint64_t)(a1 - 2) < 4) {
    double v1 = 1280.0;
  }
  if ((unint64_t)(a1 - 6) > 3) {
    double v2 = dbl_234D62760[(unint64_t)(a1 - 2) < 4];
  }
  else {
    double v1 = JFXCTMFrameSizeForCameraModeAndOrientation(6, 1);
  }
  return (int)v1 | ((unint64_t)(int)v2 << 32);
}

unint64_t JFXMaximumVideoDimensionsForCameraMode(uint64_t a1)
{
  double v1 = 1440.0;
  if ((unint64_t)(a1 - 2) < 4) {
    double v1 = 1920.0;
  }
  if ((unint64_t)(a1 - 6) > 3)
  {
    unint64_t v3 = 0x43800000000;
  }
  else
  {
    double v1 = JFXCTMFrameSizeForCameraModeAndOrientation(6, 1);
    unint64_t v3 = (unint64_t)(int)v2 << 32;
  }
  return v3 | (int)v1;
}

uint64_t JFXMaximumVideoDimensionForCameraMode(uint64_t a1)
{
  return (int)JFXMaximumVideoDimensionsForCameraMode(a1);
}

__CFString *NSStringFromJFXCameraMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8) {
    return @"JFXCameraModeUnknown";
  }
  else {
    return off_264C0D478[a1 - 1];
  }
}

void __JFXCTMFrameSizeForCameraModeAndOrientation_block_invoke()
{
  v19[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1920.0, 1440.0);
  v19[0] = v0;
  double v1 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1440.0, 1080.0);
  v19[1] = v1;
  double v2 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 960.0, 720.0);
  v19[2] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
  BOOL v4 = (void *)JFXCTMFrameSizeForCameraModeAndOrientation__4_3_Resolutions;
  JFXCTMFrameSizeForCameraModeAndOrientation__4_3_Resolutions = v3;

  id v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1920.0, 1080.0);
  v18[0] = v5;
  double v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1440.0, 810.0);
  v18[1] = v6;
  double v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 960.0, 540.0);
  v18[2] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  int v9 = (void *)JFXCTMFrameSizeForCameraModeAndOrientation__16_9_Resolutions;
  JFXCTMFrameSizeForCameraModeAndOrientation__16_9_Resolutions = v8;

  double v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1440.0, 1440.0);
  uint64_t v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 1080.0, 1080.0, v10);
  v17[1] = v11;
  unint64_t v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 720.0, 720.0);
  v17[2] = v12;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  id v14 = (void *)JFXCTMFrameSizeForCameraModeAndOrientation__1_1_Resolutions;
  JFXCTMFrameSizeForCameraModeAndOrientation__1_1_Resolutions = v13;

  if (JFXLowResolutionDevice_onceToken != -1) {
    dispatch_once(&JFXLowResolutionDevice_onceToken, &__block_literal_global_69);
  }
  int v15 = JFXLowResolutionDevice_isLowResolutionDevice;
  if (JFXMediumResolutionDevice_onceToken != -1) {
    dispatch_once(&JFXMediumResolutionDevice_onceToken, &__block_literal_global_2_1);
  }
  uint64_t v16 = JFXMediumResolutionDevice_isMediumResolutionDevice;
  if (v15) {
    uint64_t v16 = 2;
  }
  JFXCTMFrameSizeForCameraModeAndOrientation_quality = v16;
}

void sub_234D40CE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234D40DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)JFXGuidedUpscaler;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_234D418F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void std::swap[abi:ne180100]<objc_object  {objcproto10MTLTexture}* {__strong}>(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = 0;
  BOOL v4 = *a2;
  *a2 = 0;
  id v5 = *a1;
  *a1 = v4;

  double v6 = *a2;
  *a2 = v3;
}

void sub_234D41F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234D42260(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

uint64_t CameraEffectsKitAppShutdown()
{
  return [MEMORY[0x263F61250] shutdownEngine];
}

void sub_234D43A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D43DA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_234D44104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234D445BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void ContourProcessing::fillContourEdgeLine()
{
}

void VTDecompressionOutputCallbackImpl(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "No sample buffer received. VTCompressionSession failed with status: %d", (uint8_t *)v2, 8u);
}

void VTCompressionOutputCallbackImpl(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "No sample buffer received. VTCompressionSession failed with status: %d", (uint8_t *)v2, 8u);
}

atomic_ullong *std::future<opaqueCMSampleBuffer *>::get(atomic_ullong *result)
{
  if (!atomic_fetch_add(result + 1, 0xFFFFFFFFFFFFFFFFLL)) {
    return (atomic_ullong *)(*(uint64_t (**)(void))(*result + 16))();
  }
  return result;
}

void JFX_configureCaptureDevice_cold_1(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [NSNumber numberWithBool:a1 & 1];
  int v6 = 136315650;
  double v7 = "JFX_configureCaptureDevice";
  __int16 v8 = 2112;
  int v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_234C41000, a3, OS_LOG_TYPE_DEBUG, "%s could not lock camera for configuration - locked: %@ error: %@", (uint8_t *)&v6, 0x20u);
}

void JFX_logCameraIntrinsics_cold_1(double a1)
{
  *(float *)&a1 = vmuls_lane_f32(180.0, *(float32x2_t *)&a1, 1) / 3.1416;
  uint64_t v1 = [NSNumber numberWithFloat:a1];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "intrinsics fov y %@", v4, v5, v6, v7, v8);
}

void JFX_logCameraIntrinsics_cold_2(double a1)
{
  *(float *)&a1 = (float)(180.0 * *(float *)&a1) / 3.1416;
  uint64_t v1 = [NSNumber numberWithFloat:a1];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "intrinsics fov x %@", v4, v5, v6, v7, v8);
}

void JFX_logCameraIntrinsics_cold_3(double a1)
{
  LODWORD(a1) = HIDWORD(a1);
  uint64_t v1 = [NSNumber numberWithFloat:a1];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "intrinsics oy %@", v4, v5, v6, v7, v8);
}

void JFX_logCameraIntrinsics_cold_4()
{
  uint64_t v0 = objc_msgSend(NSNumber, "numberWithFloat:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "intrinsics ox %@", v3, v4, v5, v6, v7);
}

void JFX_logCameraIntrinsics_cold_5(double a1)
{
  LODWORD(a1) = HIDWORD(a1);
  uint64_t v1 = [NSNumber numberWithFloat:a1];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "intrinsics fy %@", v4, v5, v6, v7, v8);
}

void JFX_logCameraIntrinsics_cold_6()
{
  uint64_t v0 = objc_msgSend(NSNumber, "numberWithFloat:");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v1, v2, "intrinsics fx %@", v3, v4, v5, v6, v7);
}

void JFXDistanceTransformEuclidean_cold_1()
{
  __assert_rtn("JFXDistanceTransformEuclidean", "JFXDistanceTransform.mm", 162, "height % kNumThreads == 0");
}

void JFXDistanceTransformEuclidean_cold_2()
{
  __assert_rtn("JFXDistanceTransformEuclidean", "JFXDistanceTransform.mm", 161, "width % kThinWidthCol == 0");
}

void __JFXDistanceTransformEuclidean_block_invoke_3_cold_1()
{
  __assert_rtn("distancesForRow", "JFXDistanceTransform.mm", 30, "n <= MAX_DIM");
}

void __JFXDistanceTransformEuclidean_block_invoke_3_cold_2()
{
  __assert_rtn("sqrtAndConvertRowToUChar", "JFXDistanceTransform.mm", 135, "width % kThinWidthCol == 0");
}

void __JFXDistanceTransformEuclidean_block_invoke_3_cold_3()
{
}

void logMetadataFromEXIFMetadata_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "kCGImagePropertyExifDictionary %@", (uint8_t *)&v2, 0xCu);
}

void createContiguousFloat32DepthImageForAVDepthData_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Error: unexpected pixel format", v2, v3, v4, v5, v6);
}

void HEVCLosslessEncoder::Open(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HEVCLosslessEncoder::Open()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_5(&dword_234C41000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_2(&dword_234C41000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

void HEVCLosslessEncoder::ConfigEncoder()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Profile passed unrecognized (%d). exit.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_5(&dword_234C41000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_RealTime = %d", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_5(&dword_234C41000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_Quality (lossless) = %d", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_2(&dword_234C41000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_2(&dword_234C41000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_2(&dword_234C41000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_AllowFrameReordering = %d", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_2(&dword_234C41000, v0, v1, "Assert: %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_ProfileLevel = %d", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_5(&dword_234C41000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_1(&dword_234C41000, v0, v1, "Encoder Config >> kVTCompressionPropertyKey_Usage = %d", v2, v3, v4, v5, v6);
}

void HEVCLosslessEncoder::ConfigEncoder(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void HEVCLosslessEncoder::ConfigEncoder(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_ExpectedFrameRate = %f", (uint8_t *)&v3, 0xCu);
}

{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "Encoder Config >> kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration = %f", (uint8_t *)&v3, 0xCu);
}

void HEVCLosslessEncoder::EncodeFrame()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_5(&dword_234C41000, v0, v1, "Assert: (%d) %s - f: %s, l: %d\n", v2, v3, v4, v5, v6);
}

void JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_1()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAtQuarterResolution", "JFXMattingUtils.m", 86, "srcWidth > 0 && srcWidth % 8 == 0");
}

void JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_2()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAtQuarterResolution", "JFXMattingUtils.m", 87, "srcHeight > 0 && srcHeight % kDepthImageVerticalSubsamplingFactor == 0");
}

void JFXConvertFloatDepthImageToFixedPointAtQuarterResolution_cold_3()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAtQuarterResolution", "JFXMattingUtils.m", 88, "srcStride >= srcWidth * sizeof(float)");
}

void JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_1()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAndTranspose", "JFXMattingUtils.m", 120, "srcWidth > 0 && srcWidth % 4 == 0");
}

void JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_2()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAndTranspose", "JFXMattingUtils.m", 121, "srcHeight > 0 && srcHeight % 4 == 0");
}

void JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_3()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAndTranspose", "JFXMattingUtils.m", 122, "(void*)pvSrc != (void*)pvDst");
}

void JFXConvertFloatDepthImageToFixedPointAndTranspose_cold_4()
{
  __assert_rtn("JFXConvertFloatDepthImageToFixedPointAndTranspose", "JFXMattingUtils.m", 119, "srcDepthImageVB.rowBytes == srcWidth * sizeof(float)");
}

void copyDepthToDoubleWidthDoubleHeight_cold_1()
{
  __assert_rtn("copyDepthToDoubleWidthDoubleHeight", "JFXMattingUtils.m", 412, "CVPixelBufferGetBytesPerRow(dst) % sizeof(float) == 0");
}

void copyDepthToDoubleWidthDoubleHeight_cold_2()
{
  __assert_rtn("copyDepthToDoubleWidthDoubleHeight", "JFXMattingUtils.m", 411, "CVPixelBufferGetBytesPerRow(src) % sizeof(float) == 0");
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  MEMORY[0x270EDDFC8]((__n128)aspectRatio, *(__n128 *)&aspectRatio.height, (__n128)boundingRect.origin, *(__n128 *)&boundingRect.origin.y, (__n128)boundingRect.size, *(__n128 *)&boundingRect.size.height);
  result.size.height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t AVTAvatarKitVersionNumber()
{
  return MEMORY[0x270F10260]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x270EFB8F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return (CATransform3D *)MEMORY[0x270EFB918](retstr, t);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

uint64_t CGAffineTransformFromPVAnimInfo()
{
  return MEMORY[0x270F57450]();
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5D10](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddAuxiliaryDataInfo(CGImageDestinationRef idst, CFStringRef auxiliaryImageDataType, CFDictionaryRef auxiliaryDataInfoDictionary)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGImageMetadataRef CGImageMetadataCreateFromXMPData(CFDataRef data)
{
  return (CGImageMetadataRef)MEMORY[0x270EF4F78](data);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F80]();
}

CGMutableImageMetadataRef CGImageMetadataCreateMutableCopy(CGImageMetadataRef metadata)
{
  return (CGMutableImageMetadataRef)MEMORY[0x270EF4F88](metadata);
}

CFDataRef CGImageMetadataCreateXMPData(CGImageMetadataRef metadata, CFDictionaryRef options)
{
  return (CFDataRef)MEMORY[0x270EF4F90](metadata, options);
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x270EF4FA0](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataRemoveTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return MEMORY[0x270EF4FA8](metadata, parent, path);
}

BOOL CGImageMetadataSetTagWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CGImageMetadataTagRef tag)
{
  return MEMORY[0x270EF4FB0](metadata, parent, path, tag);
}

CGImageMetadataTagRef CGImageMetadataTagCreate(CFStringRef xmlns, CFStringRef prefix, CFStringRef name, CGImageMetadataType type, CFTypeRef value)
{
  return (CGImageMetadataTagRef)MEMORY[0x270EF4FE0](xmlns, prefix, name, *(void *)&type, value);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return (CFDictionaryRef)MEMORY[0x270EF4FE8](isrc, index, auxiliaryImageDataType);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x270EF4FF0](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5050](isrc);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x270EE6FD0](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x270EE6FF0](path, transform, *(void *)&lineCap, *(void *)&lineJoin, lineWidth, miterLimit);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7090](path);
  result.size.height = v4;
  result.size.double width = v3;
  result.origin.y = v2;
  result.origin.double x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE7108](path);
}

CGPoint CGPointFromString(NSString *string)
{
  MEMORY[0x270F05E70](string);
  result.y = v2;
  result.double x = v1;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.double x = v2;
  return result;
}

Boolean CMAudioFormatDescriptionEqual(CMAudioFormatDescriptionRef formatDescription, CMAudioFormatDescriptionRef otherFormatDescription, CMAudioFormatDescriptionMask equalityMask, CMAudioFormatDescriptionMask *equalityMaskOut)
{
  return MEMORY[0x270EE7988](formatDescription, otherFormatDescription, *(void *)&equalityMask, equalityMaskOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x270EE7998](desc);
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x270EE79E0](theBuffer, targetBBuf, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x270EE79F0](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE79F8](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x270EE7A20](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A30](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x270EE7AA0]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x270EE7AA8](retstr, clock);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x270EE7AE0](formatDescription, otherFormatDescription);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x270EE7AF0](desc, extensionKey);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x270EE7B00](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x270EE7B10](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7B60](allocator, *(void *)&metadataType, metadataSpecifications, formatDescriptionOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x270EE7B70](desc);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD0](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BE8](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferCreateReady(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BF0](allocator, dataBuffer, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray);
}

OSStatus CMSampleBufferCreateReadyWithImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BF8](allocator, imageBuffer, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x270EE7C18](sbuf);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C28](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x270EE7C30](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C68](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x270EE7C88](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x270EE7C90](sbuf, sampleIndex);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x270EE7C98](sbuf, sampleIndex, timingInfoOut);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7D98](retstr, lhs, rhs);
}

CMTime *__cdecl CMTimeClampToRange(CMTime *__return_ptr retstr, CMTime *time, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x270EE7DA8](retstr, time, range);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x270EE7DD0](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x270EE7DD8](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x270EE7DF0](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTimeMapping *__cdecl CMTimeMappingMake(CMTimeMapping *__return_ptr retstr, CMTimeRange *source, CMTimeRange *target)
{
  return (CMTimeMapping *)MEMORY[0x270EE7E48](retstr, source, target);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x270EE7E50](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x270EE7E58](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x270EE7E60](retstr, time, *(void *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x270EE7E68](retstr, time, multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x270EE7E80](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x270EE7E88](range, otherRange);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x270EE7EA0](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x270EE7EB0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x270EE7EB8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x270EE7ED0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x270EE7ED8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7F08](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FA8](allocator, *(void *)&codecType, *(void *)&width, *(void *)&height, extensions, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FB8](allocator, imageBuffer, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromHEVCParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FC8](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(void *)&NALUnitHeaderLength, extensions, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x270EE7FD0](videoDesc);
}

OSStatus CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(CMFormatDescriptionRef videoDesc, size_t parameterSetIndex, const uint8_t **parameterSetPointerOut, size_t *parameterSetSizeOut, size_t *parameterSetCountOut, int *NALUnitHeaderLengthOut)
{
  return MEMORY[0x270EE7FE8](videoDesc, parameterSetIndex, parameterSetPointerOut, parameterSetSizeOut, parameterSetCountOut, NALUnitHeaderLengthOut);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FC0](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE9FC8](buffer, *(void *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
}

void CVBufferRelease(CVBufferRef buffer)
{
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0E0](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0F0](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA110](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA168](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1D0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolFlush(CVPixelBufferPoolRef pool, CVPixelBufferPoolFlushFlags options)
{
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t CreatePVLPThrottlingControlParameters()
{
  return MEMORY[0x270F57458]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x270EF2A20](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x270F05E90](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t NSStringFromPVCGPointQuad()
{
  return MEMORY[0x270F57460]();
}

uint64_t NSStringFromSIMDDouble4x4()
{
  return MEMORY[0x270F57468]();
}

uint64_t NSStringFromSIMDFloat3()
{
  return MEMORY[0x270F57470]();
}

uint64_t NSStringFromSIMDFloat4()
{
  return MEMORY[0x270F57478]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PVTransformAnimationInfoForLiveCapture()
{
  return MEMORY[0x270F57480]();
}

uint64_t PVTransformAnimationInfoIdentity()
{
  return MEMORY[0x270F57488]();
}

uint64_t PVTransformAnimationInfoIsIdentity()
{
  return MEMORY[0x270F57490]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x270F05F80]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x270F06240]();
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return MEMORY[0x270F06628](session, completeUntilPresentationTimeStamp);
}

OSStatus VTCompressionSessionCreate(CFAllocatorRef allocator, int32_t width, int32_t height, CMVideoCodecType codecType, CFDictionaryRef encoderSpecification, CFDictionaryRef sourceImageBufferAttributes, CFAllocatorRef compressedDataAllocator, VTCompressionOutputCallback outputCallback, void *outputCallbackRefCon, VTCompressionSessionRef *compressionSessionOut)
{
  return MEMORY[0x270F06630](allocator, *(void *)&width, *(void *)&height, *(void *)&codecType, encoderSpecification, sourceImageBufferAttributes, compressedDataAllocator, outputCallback);
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x270F06640](session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

OSStatus VTDecompressionSessionCreate(CFAllocatorRef allocator, CMVideoFormatDescriptionRef videoFormatDescription, CFDictionaryRef videoDecoderSpecification, CFDictionaryRef destinationImageBufferAttributes, const VTDecompressionOutputCallbackRecord *outputCallback, VTDecompressionSessionRef *decompressionSessionOut)
{
  return MEMORY[0x270F066D8](allocator, videoFormatDescription, videoDecoderSpecification, destinationImageBufferAttributes, outputCallback, decompressionSessionOut);
}

OSStatus VTDecompressionSessionDecodeFrame(VTDecompressionSessionRef session, CMSampleBufferRef sampleBuffer, VTDecodeFrameFlags decodeFlags, void *sourceFrameRefCon, VTDecodeInfoFlags *infoFlagsOut)
{
  return MEMORY[0x270F066E0](session, sampleBuffer, *(void *)&decodeFlags, sourceFrameRefCon, infoFlagsOut);
}

OSStatus VTDecompressionSessionFinishDelayedFrames(VTDecompressionSessionRef session)
{
  return MEMORY[0x270F066F8](session);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x270F067C0](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067D0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x270F06820](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t pv_simd_normalize()
{
  return MEMORY[0x270F57498]();
}

uint64_t pv_bounding_CGRect(PVCGPointQuad *a1)
{
  return MEMORY[0x270F574A0](a1);
}

uint64_t MakePVFaceDetection(AVMetadataFaceObject *a1, AVCaptureVideoOrientation a2)
{
  return MEMORY[0x270F574A8](a1, a2);
}

uint64_t pv_CGRect_to_NSArray(CGRect a1)
{
  return MEMORY[0x270F574B8]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

uint64_t pv_simd_matrix_scale(simd_float4x4 a1, float a2, float a3, float a4)
{
  return MEMORY[0x270F574C0]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3], a2, a3, a4);
}

uint64_t pv_simd_matrix_scale()
{
  return MEMORY[0x270F574C8]();
}

uint64_t pv_is_CGPoint_in_quad(CGPoint a1, PVCGPointQuad *a2)
{
  return MEMORY[0x270F574D0](a2, (__n128)a1, *(__n128 *)&a1.y);
}

uint64_t pv_simd_matrix_rotate()
{
  return MEMORY[0x270F574D8]();
}

{
  return MEMORY[0x270F574E0]();
}

uint64_t pv_fov_from_intrinsics()
{
  return MEMORY[0x270F574E8]();
}

uint64_t pv_transform_info_make()
{
  return MEMORY[0x270F574F0]();
}

uint64_t MakePVFaceDetectionFull(uint64_t a1, uint64_t a2, double a3, uint64_t a4, double a5, CGRect a6, AVCaptureVideoOrientation a7, CMTime *a8, AVMetadataFaceObject *a9)
{
  return MEMORY[0x270F574F8](a1, a2, a4, a7, a8, a9, a3, a5, (__n128)a6.origin, *(__n128 *)&a6.origin.y, (__n128)a6.size, *(__n128 *)&a6.size.height);
}

uint64_t PVCGPointQuad_to_NSArray(PVCGPointQuad *a1)
{
  return MEMORY[0x270F57500](a1);
}

uint64_t pv_simd_matrix_translate()
{
  return MEMORY[0x270F57508]();
}

{
  return MEMORY[0x270F57510]();
}

uint64_t MakePVCameraFrameMetadata(AVCaptureDevicePosition a1, CMQuaternion a2, double a3, UIInterfaceOrientation a4, AVCaptureVideoOrientation a5)
{
  return MEMORY[0x270F57518](a1, a4, a5, *(__n128 *)&a2.x, *(__n128 *)&a2.y, *(__n128 *)&a2.z, *(__n128 *)&a2.w, a3);
}

uint64_t PVCGPointQuad_from_CGRect(CGRect a1)
{
  return MEMORY[0x270F57520]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

uint64_t pv_CGPoint_get_quad_center(PVCGPointQuad *a1)
{
  return MEMORY[0x270F57528](a1);
}

uint64_t pv_projected_pixels_per_unit()
{
  return MEMORY[0x270F57530]();
}

uint64_t pv_focal_length_from_intrinsics(simd_float3x3 a1)
{
  return MEMORY[0x270F57540]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
}

uint64_t pv_simd_matrix_get_euler_angles()
{
  return MEMORY[0x270F57548]();
}

uint64_t pv_simd_matrix_make_perspective()
{
  return MEMORY[0x270F57558]();
}

uint64_t pv_simd_matrix_transform_vector()
{
  return MEMORY[0x270F57560]();
}

uint64_t PVCGPointQuad_get_point_at_index(PVCGPointQuad *a1)
{
  return MEMORY[0x270F57568](a1);
}

uint64_t PVCGPointQuad_set_point_at_index(PVCGPointQuad *a1, CGPoint a2)
{
  return MEMORY[0x270F57570](a1, (__n128)a2, *(__n128 *)&a2.y);
}

uint64_t pv_fov_for_focal_length_and_side(double a1, double a2)
{
  return MEMORY[0x270F57578](a1, a2);
}

uint64_t pv_simd_matrix_make_orthographic()
{
  return MEMORY[0x270F57580]();
}

uint64_t pv_simd_matrix_unproject_to_plane()
{
  return MEMORY[0x270F57588]();
}

{
  return MEMORY[0x270F57590]();
}

uint64_t pv_principal_point_from_intrinsics(simd_float3x3 a1)
{
  return MEMORY[0x270F57598]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
}

uint64_t pv_resolution_from_principal_point()
{
  return MEMORY[0x270F575A0]();
}

uint64_t pv_simd_matrix_get_rotation_matrix(simd_float4x4 a1)
{
  return MEMORY[0x270F575A8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
}

uint64_t pv_simd_quaternion_get_euler_angles()
{
  return MEMORY[0x270F575B0]();
}

uint64_t CGAffineTransformFromPointWithPVAnimInfo(PVTransformAnimationInfo *a1, CGPoint a2)
{
  return MEMORY[0x270F575B8](a1, (__n128)a2, *(__n128 *)&a2.y);
}

uint64_t pv_simd_matrix_convert_coordinate_system()
{
  return MEMORY[0x270F575C0]();
}

uint64_t pv_intrinsics_from_fov_side_and_resolution()
{
  return MEMORY[0x270F575C8]();
}

uint64_t pv_intrinsics_from_focal_length_and_principal_point()
{
  return MEMORY[0x270F575D0]();
}

uint64_t pv_transform_PVCGPointQuad_between_coordinate_systems()
{
  return MEMORY[0x270F575D8]();
}

uint64_t pv_projected_screen_aligned_bounding_rect_around_point()
{
  return MEMORY[0x270F575E0]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x270F98340](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x270F98398](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x270F988E0]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x270F98E98]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t os_proc_available_memory(void)
{
  return MEMORY[0x270EDAA40]();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x270EDEF08](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageConvert_16Fto16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDEF48](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_16Uto16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDEF60](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF0F8](src, dest, *(void *)&flags, maxFloat, minFloat);
}

vImage_Error vImageDilate_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x270EDF1D0](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(void *)&flags);
}

vImage_Error vImageErode_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x270EDF1F8](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF218](src, dest, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF228](src, dest, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF2D8](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_F backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF300](src, dest, rotationConstant, *(void *)&flags, backColor);
}

vImage_Error vImageScale_CbCr8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF358](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF378](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF380](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF390](src, dest, tempBuffer, *(void *)&flags);
}